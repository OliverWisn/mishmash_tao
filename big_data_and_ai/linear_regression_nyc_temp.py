# linear_regression_nyc_temp.py
# -*- coding: utf-8 -*-

import pandas as pd
from scipy import stats
import matplotlib.pyplot as plt
import seaborn as sns


# Components of the Simple Linear Regression Equation
# SciPy’s stats Module
# Pandas
# Seaborn Visualization
# Getting Weather Data from NOAA

# Loading the Average High Temperatures into a DataFrame
nyc = pd.read_csv('ave_hi_nyc_jan_1895-2018.csv')
print(nyc.head())
print()
print(nyc.tail())
print()
# Cleaning the Data
nyc.columns = ['Date', 'Temperature', 'Anomaly']
print(nyc.head(3))
print()
print(nyc.Date.dtype)
print()
nyc.Date = nyc.Date.floordiv(100)
print(nyc.head(6))
print()

# Calculating Basic Descriptive Statistics for the Dataset
pd.set_option('display.precision', 2)
print(nyc.Temperature.describe())
print()

# Forecasting Future January Average High Temperatures
linear_regression = stats.linregress(x=nyc.Date,
                                    y=nyc.Temperature)
print(linear_regression.slope)
print(linear_regression.intercept)
print()
print(linear_regression.slope * 2019 + linear_regression.intercept)
print()
print(linear_regression.slope * 1850 + linear_regression.intercept)
print()

# Plotting the Average High Temperatures and a Regression Line
sns.set_style('whitegrid')
axes = sns.regplot(x=nyc.Date, y=nyc.Temperature)
axes.set_ylim(10, 70)
plt.show()