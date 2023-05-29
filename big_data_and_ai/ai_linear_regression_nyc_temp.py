# ai_linear_regression_nyc_temp.py
# Time Series and Simple Linear Regression.

import pandas as pd

# Loading the Average High Temperatures into a DataFrame.
nyc = pd.read_csv('ave_hi_nyc_jan_1895-2018.csv')
nyc.columns = ['Date', 'Temperature', 'Anomaly']
nyc.Date = nyc.Date.floordiv(100)
print(nyc.head(3))