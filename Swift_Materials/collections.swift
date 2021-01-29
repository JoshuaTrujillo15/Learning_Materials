//array: ordered collection
//set: unordered
//dictionary: unordered, key-value associations

//if assigned to variable, mutable
//if assigned to constant, immutable

//array
var someInts = [Int]()
someInts.append(3) //contains 1 value of type [Int]

//array w default value
var threeDoubles = Array(repeating: 0.0, count: 3) //[0.0, 0.0, 0.0]

//create array by adding two arrays
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//array literal
var shoppingList: [String] = ["eggs", "milk"]

//count
print(shoppingList.count) //2

//isEmpty
if shoppingList.isEmpty {
    print("empty")
} else {
    print("not empty")
}

//append
shoppingList.append("flour")

//alt append
shoppingList += ["baking powder"]
shoppingList += ["chocolate", "cheese", "butter"]

//retreive
var firstItem = shoppingList[0] //eggs

//retreive multiple
shoppingList[4..6] = ["bananas", "apples"] //chocolate, cheese, butter replaced
//6 items

//insert
shoppingList.insert("maple syrup", at: 0)

//remove
shoppingList.remove(at: 0)

//remove last
let apples = shoppingList.removeLast() //apples removed from shoppinglist and assigned to appples constant

//iter over array
for item in shoppingList {
    print(item)
}

//if index needed
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//sets

//unorderd, elements appear only once
//type must be hashable (string, int, double, bool)
//hash is int, same for all equivalent objs

//no shorthand
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a") //contains 1 value of type Character
letters = [] //empty set, type Set<Character>

//create set with array literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"] //initialized w three variables
//Set must be explicitly declared, though Set type can be inferred (String, for ex)

//count
print(favoriteGenres.count) //3

//isEmpty
print(favoriteGenres.isEmpty) //false

//insert
favoriteGenres.insert("Jazz") //4 items

//remove
if let removedGenre = favoriteGenres.remove("Rock") {
    print("removed: \(removedGenre)")
} else {
    print("not found")
}

//contains
if favoriteGenres.contains("Funk") {
    print("found Funk")
} else {
    print("not found")
}

//iterate
for genre in favoriteGenres {
    print(genre)
}

//sort() sorts using <
for genre in favoriteGenres.sorted() {
    print(genre)
}

//set operations

a.intersection(b) //in a AND b
a.symmetricDifference(b) //in a XOR b
a.union(b) //a OR b
a.subtracting(b) //a, NOT b

//ex
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted() //[]
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //[1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() //[1, 2, 9]

//subset, superset, and disjoint
//aSet.isSubset(of: anotherSet)
//anotherSet.isSuperset(of: aSet)
//aSet.isDisjoint(with: aCompletelyDifferentSet)

//dictionaries
var namesOfIntegers = [Int: String]() //key of type Int, value of type String

namesOfIntegers[16] = "sixteen" //1 key value pair

//empty dictionary if context provides type info
namesOfIntegers = [:] //empty dictionary of type [Int: String]

//dictionary literal
var airports: [String: String] = ["YYZ": "Torono Pearson", "DUB": "Dublin"]
//no need to explicitly write type in literal

//count
print(airports.count) //2

//isEmpty
print(airports.isEmpty) //false

//add new
airports["LHR"] = "London"

//change the same way
airports["LHR"] = "London Heathrow"

//updateValue() returns old value
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("oldvalue: \(oldValue)")
}

//also use subscript
if let airportName = airports["DUB"] {
    print("name: \(airportName)")
}

//remove key-value pair with nil
airports["APL"] = "Apple International"
//now delete
airports["APL"] = nil //removed

//or use removeValue, also returns removedValue
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("\(removedValue) removed")
} else {
    print("not found")
}

//iterate
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//also retrieve iterable collection of keys or values using keys and values properties
for airportCode in airports.keys {
    print(airportCode)
}

for airportName in airports.values {
    print(airportName)
}

//array dictionary stuff
let airportCodes = [String](airport.keys) //codes
let airportNames = [String](airport.values) //names