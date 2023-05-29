# ai_linear_regression_nyc_temp.py
# Time Series and Simple Linear Regression

from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import pandas as pd

# Loading the Average High Temperatures into a DataFrame
nyc = pd.read_csv('ave_hi_nyc_jan_1895-2018.csv')
nyc.columns = ['Date', 'Temperature', 'Anomaly']
nyc.Date = nyc.Date.floordiv(100)
print(nyc.head(3))
print('------------')

# Splitting the Data for Training and Testing
X_train, X_test, y_train, y_test = train_test_split(
     nyc.Date.values.reshape(-1, 1), nyc.Temperature.values, 
     random_state=11)
print(f'Shape of X data to train: {X_train.shape}')
print(f'Shape of X data to test: {X_test.shape}')
print(f'Shape of y data to train: {y_train.shape}')
print(f'Shape of y data to test: {y_test.shape}')
print('------------')

# Training the Model
linear_regression = LinearRegression()
linear_regression.fit(X=X_train, y=y_train)
print('The value of the parameter m calculated by the estimator for' +
		' the equation y=mx+b:')
print(linear_regression.coef_)
print('The value of the parameter b calculated by the estimator for' +
		' the equation y=mx+b:')
print(linear_regression.intercept_)