#Pandas Learning Materials
#Video Credit: https://www.youtube.com/watch?v=PfVxFV1ZPnk&list=PLEiEAq2VkUUKoW1o-A-VEmkoGKSC26i_I&index=28
#Series 1D array w labels, includes int, str, floats
#Dataframe 2D data struccture w labels
import pandas as pd
import numpy as np
#check version
print(pd.__version__)

#Series create, manipulate, query, delete
#create series from list
arr = [0,1,2,3,4]
s1 = pd.Series(arr)
print(s1,'\n')
#creates index for series
order = [1,2,3,4,5]
s2 = pd.Series(arr, index=order)
print(s2,'\n')
n = np.random.randn(5)
print(n,'\n')
#index can also be chars
index=['a','b','c','d','e']
s2 = pd.Series(n, index=index)
print(s2,'\n')
#create series from dictionary
d = {'a':1,'b':2,'c':3,'d':4,'e':5}
s3 = pd.Series(d)
print(s3,'\n')
#modify index of series
print(s1,'\n')
s1.index = ['a','b','c','d','e']
print(s1,'\n')
#slice, Only view, doesnt manipulate
a = s1[:3]
print(a,'\n')
a = s1[-2:]
print(a,'\n')
#append
s4 = s1.append(s3)
print(s4,'\n')
s4.drop('e')
print(s4,'\n')

#Series Operations
#arithmetic operations
arr1 = [0,1,2,3,4,5,7]
arr2 = [6,7,8,9,5]
s5 = pd.Series(arr2)
print(s5,'\n')
s6 = pd.Series(arr1)
print(s6,'\n')
#elements not joined return NaN
print(s5.add(s6),'\n')
print(s5.sub(s6),'\n')
print(s5.mul(s6),'\n')
print(s5.div(s6),'\n')
#med, min, max omits NaN and inf values
print('median: ', s6.median())
print('max: ', s6.max())
print('min: ', s6.min())
print('\n')

#Create Dataframe
#index (time sequence)
dates = pd.date_range('today',periods=6)
print(dates,'\n')
#random num array
num_arr = np.random.randn(6,4)
print(num_arr,'\n')
#column name
columns = ['a','b','c','d']
print(columns,'\n')
#dataframe creation
df1 = pd.DataFrame(num_arr, index=dates, columns=columns)
print(df1,'\n')
#create dataframe from dictionary
data = {'animal':['cat','cat','snake','dog','dog','cat','snake','cat','dog','dog'],
        'age':[2.5,3,0.5,np.nan,5,2,4.5,np.nan,7,3],
        'visits':[1,3,2,3,2,3,1,1,2,1],
        'priority':['yes','yes','no','yes','no','no','no','yes','no','no']}
labels = ['a','b','c','d','e','f','g','h','i','j']
df2 = pd.DataFrame(data, index=labels)
print(df2,'\n')
print('data types:\n',df2.dtypes,'\n')
print(df2.head(3),'\n')
print(df2.tail(3),'\n')
#no brackets, is object, not callable function
print(df2.index,'\n')
print(df2.columns,'\n')
print(df2.values,'\n')
#statistical data of dataframe
print(df2.describe(),'\n')
#transpose (flip data column and index)
print(df2.T,'\n')
#sort dataframe
print(df2.sort_values(by='age'),'\n')
#slice dataframe
print(df2.sort_values(by='age')[1:3],'\n')
#query dataframe by tag
print(df2[['age','visits']],'\n')
#query rows 2,3 (index [1], [3] exclusive
print(df2.iloc[1:3],'\n')
#copy
df3 = df2.copy()
print(df3,'\n')
#check if NaN
print(df3.isnull(),'\n')
#changes value at index f,age to 1.5
df3.loc['f','age']=1.5
print(df3,'\n')
#mean of dataframe
print(df3.mean(),'\n')
#mean of index age
print(df3[['age']].mean(),'\n')
#sum
print(df3.sum(),'\n')
#string functions
string = pd.Series(['A','C','D','Aaa','BaCa',np.nan,'CBA','cow','owl'])
print(string.str.upper(),'\n')
print(string.str.lower(),'\n')

#Operations for DataFrames missing values
#fill missing data with mean
df4 = df3.copy()
print(df4,'\n')
meanAge = df4['age'].mean()
print(df4['age'].fillna(meanAge),'\n')
#drop missing data
df5 = df3.copy()
print(df5.dropna(how='any'),'\n')

#Dataframe file operations
#create csv file
#df3.to_csv('animals.csv')
df_animals = pd.read_csv('animals.csv')
print(df_animals.head(3),'\n')
#df3.toexcel('animals.xlsx',sheet_name='Sheet1')
#dfanimals2pd.read_excel('animals.xlsx','Sheet1',index_col=None,na_values=['NA'])
#print(df_animals2,'\n')

#Visualization in Pandas
import matplotlib.pyplot as plt
ts = pd.Series(np.random.randn(50), index=pd.date_range('today',periods=50))
ts = ts.cumsum()
#plt.plot(ts)
#plt.show()
df = pd.DataFrame(np.random.randn(50,4), index=ts.index, columns=['A','B','X','Y'])
df = df.cumsum()
#plt.plot(df)
#plt.show()

#Remove repeated data
df = pd.DataFrame({'A':[1,2,2,2,4,4,5,5,6,6,7,8,8]})
print(df,'\n')
print(df.loc[df['A'].shift() != df['A']],'\n')
