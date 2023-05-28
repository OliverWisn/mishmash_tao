# k_n_neigh_dig_dset
# This is classification with k-Nearest Neighbors on the Digits Dataset.

from sklearn.datasets import load_digits
from sklearn.model_selection import train_test_split
from sklearn.model_selection import KFold
from sklearn.model_selection import cross_val_score
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report
from sklearn.svm import SVC
from sklearn.naive_bayes import GaussianNB
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Loading the Dataset.
digits = load_digits()

# Creating the Diagram.
figure, axes = plt.subplots(nrows=4, ncols=6, figsize=(6, 4))

# Displaying Each Image and Removing the Axes Labels.
for item in zip(axes.ravel(), digits.images, digits.target):
    axes, image, target = item
    axes.imshow(image, cmap=plt.cm.gray_r)
    # Removing the x-axis tick marks.
    axes.set_xticks([])
    # Removing the y-axis tick marks.
    axes.set_yticks([])
    axes.set_title(target)
plt.tight_layout()

# Diagram display.
plt.show()

# Splitting the Data for Training and Testing.
X_train, X_test, y_train, y_test = train_test_split(
	digits.data, digits.target, random_state=11, test_size=0.2) 

# Creating the Model.
knn = KNeighborsClassifier()

# Training the Model.
knn.fit(X=X_train, y=y_train)

# Predicting Digit Classes.
predicted = knn.predict(X=X_test)
expected = y_test

# Establish wrong predictions and print them in tuples.
wrong = [(p, e) for (p, e) in zip(predicted, expected) if p != e]
print('Wrong predictions in tuples:', wrong)

# Calculating the accuracy of the prediction.
print('Accuracy of the prediction:', f'{knn.score(X_test, y_test):.2%}')

# Confusion matrix.
misses = confusion_matrix(y_true=expected, y_pred=predicted)
print('\nConfusion matrix:')
print(misses)

# Classification report.
names = [str(digit) for digit in digits.target_names]
print('\nClassification report:')
print(classification_report(expected, predicted, target_names=names))

# Visualization of the confusion matrix.
misses_df = pd.DataFrame(misses, index=range(10), columns=range(10))
axes = sns.heatmap(misses_df, annot=True, cmap='nipy_spectral_r')

# Display of the heatmap of the confusion matrix.
plt.show()

# KFold Class.
kfold = KFold(n_splits=10, random_state=11, shuffle=True)

# Using the KFold Object with Function cross_val_score.
scores = cross_val_score(estimator=knn, X=digits.data, y=digits.target, 
    cv=kfold)
print("""\nThe accuracy of the model's predictions for particular folds for 
    KFold object:""")
print(scores)
print(f'Mean accuracy: {scores.mean():.2%}')
print(f'Accuracy standard deviation: {scores.std():.2%}')

# 14.3.3 Running Multiple Models to Find the Best One.
estimators = {
    'KNeighborsClassifier': knn, 
    'SVC': SVC(gamma='scale'),
    'GaussianNB': GaussianNB()}

for estimator_name, estimator_object in estimators.items():
    kfold = KFold(n_splits=10, random_state=11, shuffle=True)
    scores = cross_val_score(estimator=estimator_object, 
        X=digits.data, y=digits.target, cv=kfold)
    print(f'{estimator_name:>20}: ' + 
        f'mean accuracy={scores.mean():.2%}; ' +
        f'standard deviation={scores.std():.2%}')