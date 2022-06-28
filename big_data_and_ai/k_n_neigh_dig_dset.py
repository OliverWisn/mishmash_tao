# k_n_neigh_dig_dset
# This is classification with k-Nearest Neighbors on the Digits Dataset.

from sklearn.datasets import load_digits
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
import matplotlib.pyplot as plt

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

# Diagram display.
plt.show()