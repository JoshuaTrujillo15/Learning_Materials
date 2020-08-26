#scikit learning materials
#NOTE: I do not have the dataset included in this example, so there may be typoes/errors due to lack of testing capabilities 
#Video Credit: https://www.youtube.com/watch?v=0Lt9w-BxKFQ

#applications:
#Classification: spam detection
#Regression: stock price prediction
#Clustering: customer segmentation
#Model Selection: Improving model accuracy via parameter tuning
#Dimensionality Reduction: increase model efficiency
#Pre-processing: Transforming input data such as text for ML algorithms

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as pyplot
from sklearn.ensemble import RandomForestClassifier #random forest classifier
from sklearn.svm import SVC #support vector model (classifier)
from sklearn import svm 
from sklearn.neural_network import MLPClassifier #neural network classifier, multi-layered percepitron classifier
#from sklearn.linear_model import SGDClassifier
from sklearn.metrics import confusion_matrix, classification_report
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.model_selection import train_test_split

#Loading dataset
wine = pd.read_csv('winequality-red.csv',sep=';')
print(wine.head())
print(wine.info())
print(wine.isnull().sum()) #checks for null values

#Preprocesing Data
bins = (2, 6.5, 8) #separate to 2 values, spread of 6.5, up to index 8
group_names = ['bad','good']
wine['quality'] = pd.cut(wine['quality'],bins=bins,labels=group_names)
print(wine['quality'].unique())
label_quality = LabelEncoder()
wine['quality'] = label_quality.fit_transform(wine['quality'])
wine.head(10)
print(wine['quality'].value_counts())

#sns.countplot(wine['quality'])

#Separate dataset as response variable and feature variables
X = wine.drop('quality', axis=1) #wine features
y = wine['quality']#quality

#Train and Test splitting of data
#test_size=0.2: uses 20%; random_state=42: seed for random states, not important
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 42)

#Applying Standard scaling to get optimized result
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
print(X_train[:10])


#Random Forest Classifier
#mid-sized data
rfc = RandomForestClassifier(n_estimators=200) #how many models, start higher first
rfc.fit(X_train, y_train)
pred_rfc = rfc.predict(X_test)
#Check performance
print(classification_report(y_test, pred_rfc))
print(confusion_matrix(y_test, pred_rfc)) #[[correct bad, wrong bad],[correct good,wrong good]]


#Support Vector Model Classifier
#small data sets
clf = svm.SVC()
clf.fit(X_train, y_train)
pred_clf = clf.predict(X_test)
print(classification_report(y_test, pred_clf))
print(confusion_matrix(y_test, pred_clf))


#Neural Network Classifier
#mass data
#Great for text recognition, pixel operations
mlpc = MLPClassifier(hidden_layer_sizes=(11,11,11),max_iter=500)
mlpc.fit(X_train, y_train)
pred_mlpc = mlpc.predict(X_train)
print(classification_report(y_test, pred_mlpc))
print(confusion_matrix(y_test, pred_mlpc))

from sklearn.metrics import accuracy_score
cm = accuracy_score(y_test, pred_rfc)
print(cm)

#new data
Xnew = [[7.3,0.58,0.00,2.0,0.065,15.0,21.0,0.9946,3.36,0.47,10.0]]
Xnew = sc.transform(Xnew)
ynew = rfc.predict(Xnew)
print(ynew)
