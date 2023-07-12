# In this project I used BeautifulSoup and Request Library for web scraping and FlipCart was the website where I get the all data.

# Working:

1. First, this Dataset is made from the FlipCart Website by using Python(BeautifulSoup and Request) libraries and doing some preprocessing to get the complete dataset from this site.
2. Secondly, This dataset is also used in the MSSQL server for cleaning and analysis. In this SQL is used for cleaning and Analysis I used the aggregate functions and different techniques to clean this dataset.
3. Thirdly, this dataset is directly imported to Power Bi for visualization by using the server to get the data. In this, I visualize the importance of each feature with respect to the other features. Data cleaning is also done in this software by a Data transformer and made more columns for visualization.
4. Lastly, this dataset is preprocessed in Python by using Google Colab and Google Drive to get the data. Begin with data cleaning in which I fill the null and duplicated values and delete the useless columns. I Extract the data from the columns like the Ram size from the Ram column which has more details than the Size. Then, visualize the data by using Matplotlib, seaborn and Plotly in which I highlighted the main dataset features. Furthermore, I use this dataset for Statistical data analysis in which I perform Descriptive, Inferential and Hypothesis testing here I used Pandas, Numpy, Math and Scipy libraries to perform all the tasks. In the end, I use the Scikit learn and Tensorflow libraries to make machine learning and deep learning models in which I performed the following:

1. Linear Regression
2. SVM
3. KNN
4. Decision Tree
5. Random Forest
6. XGBoost
7. AdaBoost
8. GradientBoost
9. AutoML
10. ANN

Of all these models the best performing was XGBoost with 87% accuracy.
