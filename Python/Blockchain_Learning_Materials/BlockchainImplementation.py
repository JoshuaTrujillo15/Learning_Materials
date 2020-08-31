#Simple Blockchain Implementation
#Credit IBM: https://developer.ibm.com/technologies/blockchain/tutorials/develop-a-blockchain-application-from-scratch-in-python/
from hashlib import sha256
import json
import time

from flask import Flask, request
import requests

class Block:
    def __init__(self, index, transactions, timestamp, previous_hash):
        
        #Constructor for 'Block' class
        #:param index: Unique id for block.
        #:param transactions: lisst of transactions.
        #:param timestamp: Time of generation of block.
        #:param previous_hash: Hash of last confirmed block
        self.index = index
        self.transactions = transactions
        self.timestamp = timestamp
        self.previous_hash = previous_hash
        self.nonce = 0

    def compute_hash(self):
        #Returns hash of block instance by first converting to JSON string
        block_string = json.dumps(self.__dict__, sort_keys=True)
        return sha256(block_string.encode()).hexdigest()

class Blockchain:
    #PoW algo difficulty
    difficulty = 2

    def __init__(self):
        #Constructor for 'Blockchain' class
        self.unconfirmed_transactions = []
        self.chain = []
        self.create_genesis_block()
    
    def create_genesis_block(self):
        #function to generate genesis block and append to chain
        #Index of 0, previous hash of zero, and valid hash
        genesis_block = Block(0,[],time.time(),"0")
        genesis_block.hash = genesis_block.compute_hash()
        self.chain.append(genesis_block)
    
    @property
    def last_block(self):
        #Retrieves most recent block in the chain
        return self.chain[-1]
    
    def add_block(self, block, proof):
        #adds block to chain after verification
        #verification = check proof validity, check that previous_hash of block matches latest block in chain
        previous_hash = self.last_block.hash

        if previous_hash != block.previous_hash:
            return False
        
        if not self.is_valid_proof(block, proof):
            return False
        
        block.hash = proof
        self.chain.append(block)
        return True
    
    @classmethod
    def is_valid_proof(self, block, block_hash):
        #check if block_hash is valid hash of block and satisfies difficulty criteria
        return(block_hash.startswith('0' * Blockchain.difficulty) and block_hash == block.compute_hash())

    @staticmethod
    def proof_of_work(self, block):
        #increments nonce value to satisfy hash difficulty requirements 
        #difficulty = num of zeros superceeding hash digest
        block.nonce = 0
        computed_hash = block.compute_hash()
        while not computed_hash.startswith('0' * Blockchain.difficulty):
            block.nonce +=1
            computed_hash = block.compute_hash()
        
        return computed_hash

    def add_new_transaction(self, transaction):
        self.unconfirmed_transactions.append(transaction)
    
    def mine(self):
        #interface to add pending transaction to blockchain by adding to block then calculating PoW
        if not self.unconfirmed_transactions:
            return False
        
        last_block = self.last_block

        new_block = Block(index=last_block.index + 1, 
                          transactions=self.unconfirmed_transactions,
                          timestamp=time.time(),
                          previous_hash=last_block.hash)
        
        proof = self.proof_of_work(new_block)
        self.add_block(new_block, proof)
        self.unconfirmed_transactions = []
        return new_block.index
    
    @classmethod
    def check_chain_validity(cls, chain):
        #helper method to check entire chain validity
        result = True
        previous_hash = '0'

        #iterate through every block
        for block in chain:
            block_hash = block.hash
            #remove hash field to recompute the hash again
            #using compute_hash method
            delattr(block, 'hash')

            if not cls.is_valid_proof(block, block.hash) or \
                    previous_hash != block.previous_hash:
                result = False
                break

            block.hash, previous_hash = block_hash, block_hash
        
        return result

#Initialize flask applicaton
app = Flask(__name__)

#Initialize blockchain object
blockchain = Blockchain()

#Flask's way of declaring end-points
@app.route('/new_transaction', methods=['POST'])
def new_transaction():
    tx_data = request.get_json()
    required_fields = ['author', 'content']

    for field in required_fields:
        if not tx_data.get(field):
            return 'Invalid transaction data', 404
    
    tx_data['timestamp'] = time.time()

    blockchain.add_new_transaction(tx_data)

    return 'Success', 201

@app.route('/chain', methods=['GET'])
def get_chain():
    chain_data = []
    for block in blockchain.chain:
        chain_data.append(block.__dict__)
    return json.dumps({'length': len(chain_data), 'chain': chain_data})

@app.route('/mine', methods=['GET'])
def mine_unconfirmed_transactions():
    result = blockchain.mine()
    if not result:
        return 'No transactions to mine'
    return 'Block #{} is mined'.format(result)

@app.route('/pending_tx')
def get_pending_tx():
    return json.dumps(blockchain.unconfirmed_transactions)

#contains host addresses of other participating members of the network
peers = set()

#endpoint to add new peers to network
@app.route('/register_node', methods=['POST'])
def register_new_peers():
    #host address to peer node
    node_address = request.get_json()['node_address']
    if not node_address:
        return 'Invalid data', 400
    
    #add node to peer list
    peers.add(node_address)

    #return blockchain to new node to sync
    return get_chain()

@app.route('/register_with', methods=['POST'])
def register_with_existing_node():
    #calls 'register_node' to register current node with remote node specified in request, and sync blockchain with remote node
    node_address = request.get_json()['node_address']
    if not node_address:
        return 'Invalid data', 400
    
    data = {'node_address': request.host_url}
    headers = {'Content-Type': 'application/json'}

    #make request to register with remote node and obtain information
    response = requests.post(node_address + '/register_node', data=json.dumps(data), headers=headers)

    if response.status_code == 200:
        global blockchain
        global peers
        #update chain and peers
        chain_dump = response.json()['chain']
        blockchain = create_chain_from_dump(chain_dump)
        peers.update(response.json()['peers'])
        return 'Registration successful', 200
    else:
        #if something goes wrong, pass to API response
        return response.content, response.status_code
    
def create_chain_from_dump(chain_dump):
    blockchain = Blockchain()
    for idx, block_data in enumerate(chain_dump):
        block = Block(block_data['index'],
                      block_data['transactions'],
                      block_data['timestamp'],
                      block_data['previous_hash'])
        proof = block_data['hash']
        if idx > 0:
            added = blockchain.add_block(block, proof)
            if not added:
                raise Exception('The chain dump is tampered!')
        else: #genesis block, no need verification
            blockchain.chain.append(block)
    return blockchain

#endpoint to add block mined by someone else to node's chain
#first verify block, then adds to chain
@app.route('/add_block', methods=['POST'])
def verify_and_add_block():
    block_data = request.get_json()
    block = Block(block_data['index'],
                  block_data['transactions'],
                  block_data['timestamp'],
                  block_data['previous_hash'])
    proof = block_data['hash']
    added = blockchain.add_block(block, proof)

    if not added:
        return 'The block was discarded by the node', 400
    
    return 'Block added to the chain', 201

def consensus():
        #simple consensus algo
        #if longer chain found, local chain replaced
        global blockchain

        longest_chain = None
        current_len = len(blockchain.chain)

        for node in peers:
            response = response.get('{}/chain'.format(node))
            length = response.json()['length']
            chain = response.json()['chain']
            if length > current_len and blockchain.check_chain_validity(chain):
                #longer valid chain found
                current_len = length
                longest_chain = chain
        
        if longest_chain:
            blockchain = longest_chain
            return True
        
        return False

def announce_new_block(block):
    #announce to network once block mined
    #others verify
    for peer in peers:
        url = '{}add_block'.format(peer)
        requests.post(url, data=json.dumps(block.__dict__, sort_keys=True))