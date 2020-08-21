#Numpy Learning Materials
#Video Credit https://www.youtube.com/watch?v=VtCZFlTbOek&list=PLEiEAq2VkUUKoW1o-A-VEmkoGKSC26i_I&index=27&t=0s
#What is Numpy
    #Core library for scientific and numerical computing
    #high-performance multidimensional array obj and tools for working with arrays
    #main obj multidimensional array
    #it is a table of elements (usually nums), same type,
        #indexed by tuple of pos ints
    #dimensions called axes
#why numpy over python list?
    #fast, convenient, less memory
import numpy as np
import time
import sys
a = np.array([1,2,3])
print(a)

#standard
b=range(1000)
print('python size: ', sys.getsizeof(5) * len(b))
#numpy
c = np.arange(1000)
print('numpy size: ', c.size * c.itemsize)

#compare basic functions
size = 100000
l1 = range(size)
l2 = range(size)
a1 = np.arange(size)
a2 = np.arange(size)

start = time.time()
result = [(x + y) for x,y in zip(l1,l2)]
print('python list took', (time.time() - start) * 1000)

start = time.time()
result = a1 + a2
print('numpy list took', (time.time() - start) * 1000)

#basic operations
a = np.array([[1,2], [3,4], [5,6]])
print('\n', a)
print('dimension: ', a.ndim)
print('size in memory: ', a.itemsize)
print('shape: ', a.shape)

#convert from int to float, doubles memory size
a = np.array([[1,2], [3,4], [5,6]], dtype=np.complex)
print('\n', a)
print('size in memory: ', a.itemsize)
print('\n')

#zero filled array with ((x,y)) shape
#great for neural networks
a = np.zeros((3,4))
print(a, '\n')

#create range
l  = range(5)
print(l)
l = np.arange(5)
print(l, '\n')

#string and character manipulation
print('str/char manipulation:')
print(np.char.add(['hello','hi'], ['abc','xyz']))
print(np.char.multiply('Hello ', 3))
print(np.char.center('hello', 20, fillchar = '-'))
print(np.char.capitalize('hello cliche world'))
print(np.char.title('how are you doing'))
print(np.char.lower(['HELLO', 'WORLD']))
print(np.char.upper(['python', 'data']))
print(np.char.upper('python is easy'))
print(np.char.split('are you coming to the party?'))
print(np.char.splitlines('hello\nhow are you?'))
print(np.char.strip(['nina','admin','anaita'],'a'))
print(np.char.join([':','-'],['dmy','ymd']))
print(np.char.replace('he is a good dancer','is','was'))
