# k_means_clustering_unsupervised_iris.py
# This is k-means clustering on the iris toy set

from sklearn.cluster import DBSCAN, MeanShift,\
    SpectralClustering, AgglomerativeClustering
from sklearn.cluster import KMeans
from sklearn.datasets import load_iris
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

# Loading the iris dataset
iris = load_iris()

# Getting to know the description
print('The description of the Iris Dataset:')
print('')
print(iris.DESCR)

# Checking the numbers of samples, features and targets
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
print(f'Shape of data: {iris.data.shape}')
print(f'Shape of a target: {iris.target.shape}')
print(f'Target names: {iris.target_names}')
print(f'Future names: {iris.feature_names}')

# Exploring the data with pandas: descriptive statistics of the iris 
#    datase
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
pd.set_option('display.max_columns', 5)
pd.set_option('display.max_colwidth', None)
iris_df = pd.DataFrame(iris.data, columns=iris.feature_names)
iris_df['species'] = [iris.target_names[i] for i in iris.target]
print(iris_df.head())
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
pd.set_option('display.precision', 2)
print(iris_df.describe())
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
print('Describe the species of irises (how many species are there):')
print(iris_df['species'].describe())

# Visualizing the dataset with a seaborn pairplot
sns.set(font_scale=1.1)
sns.set_style('whitegrid')
grid = sns.pairplot(data=iris_df, vars=iris_df.columns[0:4], hue='species')
plt.show(block=True)

# Displaying the pairplot in one color
grid = sns.pairplot(data=iris_df, vars=iris_df.columns[0:4])
plt.show(block=True)

# Using a KMeans estimator
# Creating the estimator
kmeans = KMeans(n_clusters=3, random_state=11)

# Fitting the model
kmeans.fit(iris.data)

# Comparing the computer cluster labels to the iris dataset’s target 
#    values
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
print(f'Assignment of labels for the iris setosa: {kmeans.labels_[0:50]}')
print(f'Assignment of labels for the iris versicolor: {kmeans.labels_[50:100]}')
print(f'Assignment of labels for the iris virginica: {kmeans.labels_[100:150]}')

# Dimensionality reduction with principal component analysis
# Creating the PCA object
pca = PCA(n_components=2, random_state=11)

# Transforming the iris dataset’s features into two dimensions
pca.fit(iris.data)
iris_pca = pca.transform(iris.data)
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
print(f'The current shape of the iris dataset: {iris_pca.shape}')

# Visualizing the reduced data
iris_pca_df = pd.DataFrame(iris_pca, columns=['Component1', 'Component2'])
iris_pca_df['species'] = iris_df.species
axes = sns.scatterplot(data=iris_pca_df, x='Component1', 
    y='Component2', hue='species', legend='brief', 
    palette='cool')
plt.show(block=True)
iris_centers = pca.transform(kmeans.cluster_centers_)
dots = plt.scatter(iris_centers[:,0], iris_centers[:,1], 
                    s=100, c='k')
plt.show(block=True)

# Choosing the best clustering estimator
print('')
print('xxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxx')
print('Choosing the best clustering estimator:')
estimators = {
    'KMeans': kmeans,
    'DBSCAN': DBSCAN(),
    'MeanShift': MeanShift(),
    'SpectralClustering': SpectralClustering(n_clusters=3),
    'AgglomerativeClustering': 
        AgglomerativeClustering(n_clusters=3)
}

for name, estimator in estimators.items():
    estimator.fit(iris.data)
    print(f'\n{name}:')
    for i in range(0, 101, 50):
        labels, counts = np.unique(
            estimator.labels_[i:i+50], return_counts=True)
        print(f'{i}-{i+50}:')
        for label, count in zip(labels, counts):
            print(f'   label={label}, count={count}')