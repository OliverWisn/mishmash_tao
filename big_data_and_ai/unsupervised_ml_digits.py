# unsupervised_ml_digits.py
# This is dimensionality reduction in unsupervised machine learning

from sklearn.datasets import load_digits
from sklearn.manifold import TSNE
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

# Loading the digits dataset
digits = load_digits()

# Creating a TSNE estimator for dimensionality reduction
tsne = TSNE(n_components=2, random_state=11)

# Transforming the digits dataset’s features into two dimensions
reduced_data = tsne.fit_transform(digits.data)
print(reduced_data.shape)

# Visualizing the reduced data
dots = plt.scatter(reduced_data[:, 0], reduced_data[:, 1],
                    c='black')
plt.show()

# Visualizing the reduced data with different colors for each digit
dots = plt.scatter(reduced_data[:, 0], reduced_data[:, 1],
    c=digits.target, cmap=plt.cm.get_cmap('nipy_spectral_r', 10))
colorbar = plt.colorbar(dots)
plt.show()

# Creating a TSNE estimator for dimensionality reduction (three 
# dimensions)
tsne = TSNE(n_components=3, random_state=11)

# Transforming the digits dataset’s features into three dimensions
reduced_data = tsne.fit_transform(digits.data)
print(reduced_data.shape)

# Visualizing the reduced data in 3D
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(xs=reduced_data[:, 0], ys=reduced_data[:, 1], zs=reduced_data[:, 2], 
            c='black')
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
plt.show()

# Visualizing the reduced data in 3D with different colors for each 
# digit
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
dots3d = ax.scatter(xs=reduced_data[:, 0], ys=reduced_data[:, 1], 
                    zs=reduced_data[:, 2], c=digits.target, 
                    cmap=plt.cm.get_cmap('nipy_spectral_r', 10))
fig.colorbar(dots3d, ax=ax)
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
plt.show()