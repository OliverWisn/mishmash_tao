# ai_multiple_regression_housing.py
# This is multiple linear regression on the california hausing dataset.

from sklearn import metrics
from sklearn.datasets import fetch_california_housing
from sklearn.linear_model import ElasticNet, Lasso, Ridge
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import KFold, cross_val_score
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

# Loading the Dataset
# Loading the Data
california = fetch_california_housing()

# Displaying the Dataset’s Description
print(california.DESCR)
print('--------------------')
print(california.data.shape)
print(california.target.shape)
print(california.feature_names)

# Exploring the Data with Pandas
pd.set_option('display.precision', 4)
pd.set_option('display.max_columns', 9)
pd.set_option('display.max_colwidth', None)
california_df = pd.DataFrame(california.data, columns=california.feature_names)
california_df['MedHouseValue'] = pd.Series(california.target)
print('--------------------')
print(california_df.head())
print('--------------------')
print(california_df.describe())

# Visualizing the Features
sample_df = california_df.sample(frac=0.1, random_state=17)
sns.set(font_scale=2)
sns.set_style('whitegrid')
for feature in california.feature_names:
    plt.figure(figsize=(16, 9))
    sns.scatterplot(data=sample_df, x=feature, 
                    y='MedHouseValue', hue='MedHouseValue', 
                    palette='cool', legend=False)
    plt.show()

# Splitting the Data for Training and Testing
X_train, X_test, y_train, y_test = train_test_split(
    california.data, california.target, random_state=11)
print('--------------------')
print(X_train.shape)
print(X_test.shape)

# Training the Model
linear_regression = LinearRegression()
linear_regression.fit(X=X_train, y=y_train)
print('--------------------')
for i, name in enumerate(california.feature_names):
    print(f'{name:>10}: {linear_regression.coef_[i]}')
print('--------------------')
print(linear_regression.intercept_)

# Testing the Model
predicted = linear_regression.predict(X_test)
expected = y_test
print('--------------------')
print(predicted[:5])
print(expected[:5])

# Visualizing the Expected vs. Predicted Prices
df = pd.DataFrame()
df['Expected'] = pd.Series(expected)
df['Predicted'] = pd.Series(predicted)
figure = plt.figure(figsize=(9, 9))
axes = sns.scatterplot(data=df, x='Expected', y='Predicted', 
    hue='Predicted', palette='cool', legend=False)
start = min(expected.min(), predicted.min())
end = max(expected.max(), predicted.max())
axes.set_xlim(start, end)
axes.set_ylim(start, end)
line = plt.plot([start, end], [start, end], 'k--')
plt.show()

# Regression Model Metrics
print('--------------------')
print('Regression Model Metrics:')
print('Coefficient of determination (R2):')
print(metrics.r2_score(expected, predicted))
print('Mean squuared error (MSE):')
print(metrics.mean_squared_error(expected, predicted))

# Choosing the Best Model
print('--------------------')
estimators = {
    'LinearRegression': linear_regression,
    'ElasticNet': ElasticNet(),
    'Lasso': Lasso(),
    'Ridge': Ridge()
}
for estimator_name, estimator_object in estimators.items():
    kfold = KFold(n_splits=10, random_state=11, shuffle=True)
    scores = cross_val_score(estimator=estimator_object, 
        X=california.data, y=california.target, cv=kfold,
        scoring='r2')
    print(f'{estimator_name:>16}: ' + 
        f'mean of r2 scores={scores.mean():.3f}')