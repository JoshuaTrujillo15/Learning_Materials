#Numpy Materials Part 2
#Video Credit: https://www.youtube.com/watch?v=d6O_bXgnjb4
import numpy as np

#Array Manipulation
a = np.arange(9)
print('original array:\n', a,'\n')
#a.reshape(x,y); x must equal y
b = a.reshape(3,3)
print('modified array:\n',b,'\n')
print(b.flatten())
#flatten(order=''): F column-major, C row-major, A preserve original order
print(b.flatten(order='F'),'\n')
a = np.arange(12).reshape(4,3)
print(a,'\n')
#from 4,3 to 3,4 shape
print(np.transpose(a),'\n')
#reshape MUST equal original elements
b = np.arange(8).reshape(2,4)
print(b,'\n')
#3 dimensional array
c = b.reshape(2,2,2)
print(c,'\n')
#roll axis
print(np.rollaxis(c,2,1),'\n')
print(np.swapaxes(c,1,2),'\n')

#Arithmetic Operations
print('\n--------------------\nNumpy Arithmetic Operations')
a = np.arange(9).reshape(3,3)
print(a,'\n')
b = np.array([10,100,1000])
print(b,'\n')
print(np.add(a,b),'\n')
print(np.subtract(a,b),'\n')
print(np.multiply(a,b),'\n')
print(np.divide(a,b),'\n')

#Slicing
a = np.arange(20)
print(a,'\n')
#omit first 4
print(a[4:],'\n')
#omit last 4
print(a[:4],'\n')
#select at index 5
print(a[5],'\n')
#start at 2, end at 9, step by 2
s = slice(2,9,2)
print(a[s],'\n')

#Iterating Over Array
#array, 0-45, by 5
a = np.arange(0,45,5)
print(a,'\n')
a = a.reshape(3,3)
print(a,'\n')
#iterate over array with nditer
for x in np.nditer(a):
    print(x)

#Numpy Iteration Order (c-style and f-style)
print(a,'\n')
for x in np.nditer(a, order='C'):
    print(x)
print('\n')
for x in np.nditer(a, order='F'):
    print(x)
print('\n')

#Joining Arrays
a = np.array([[1,2],[3,4]])
print('first array\n',a,'\n')
b = np.array([[5,6],[7,8]])
print('second array\n',b,'\n')
#only same dimensions for concatenation
print('joining along axis 0:')
print(np.concatenate((a,b)),'\n')
print('joining along axis 1:')
print(np.concatenate((a,b),axis = 1),'\n')

#Splitting array
a = np.arange(9)
print(a)
#split at every 3
print(np.split(a,3))
#first split at 4, second split at 7
print(np.split(a,[4,7]),'\n')

#Resizing an Array
a = np.array([[1,2,3],[4,5,6]])
print(a)
print(a.shape,'\n')
#resize from 2,3 to 3,2
b = np.resize(a,(3,2))
print(b)
print(b.shape,'\n')
#does NOT have to have same dimensions as original
#new elements just repeat previous
b = np.resize(a,(3,3))
print(b)
print(b.shape,'\n')

#Histogram
import matplotlib.pyplot as plt
#a = np.array([20,87,4,40,53,74,56,51,11,20,40,15,79,25,27])
##plots on histogram by 20
#plt.hist(a, bins = [0,20,40,60,80,100])
##plots on histogram by 10
##plt.hist(a, bins = [0,10,20,30,40,50,60,70,80,90,100])
#plt.title('histogram')
#plt.show()

#Other useful functions
#linspace
#10 nums between 1,3, evenly spaced
a = np.linspace(1,3,10)
print(a,'\n')
#sum and axis
a = np.array([(1,2,3),(4,5,6)])
print(a.sum(axis=0),'\n')
#square root and standard deviation
print(np.sqrt(a))
print(np.std(a))
#ravel function
#np.ravel(a,order='C')
print(a.ravel())
#log
a = np.array([1,2,3])
#not every num, 10 common, 2 available
print(np.log10(a),'\n')



#Practice Examples
#plot sin wave
#0 to 3*pi, by 0.1
x = np.arange(0,3*np.pi,0.1)
print(x)
y = np.sin(x)
print(y)
plt.plot(x,y)
#plt.show()

#Create 6*6 2d array, 1 and 0 alternatively across diags
z = np.zeros((6,6),dtype=int)
print(z)
#start row one, every other, then every other element, =1
z[1::2,::2] = 1
#start row 0, every other, then every other elemtn, =1
z[::2,1::2] = 1
print(z,'\n')

#find total num and locations of missing values in array
z = np.random.rand(10,10)
#np.nan sets value to null
z[np.random.randint(10, size=5), np.random.randint(10, size=5)] = np.nan
print(z,'\n')
print('Total num of missing values: \n', np.isnan(z).sum())
print('Indexes of missing values:\n', np.argwhere(np.isnan(z)))
#inds nan values
inds = np.where(np.isnan(z))
print(inds)
#sets inds values to 0 from nan
z[inds] = 0
print(z,'\n')
