# Marriage-Divorce-Dataset
Project from Fall 2022-Data Science 1

**Learning Objectives:** <br>
1.	Learn how to manage and preprocess datasets  and how to compute basic statistics and to create basic data visualizations (using R or other tools) <br>
2.	Learn how to interpret popular displays, such as histograms, scatter plots, box plots, density plots,… <br>
3.	Get some practical experience in exploratory data analysis <br>
4.	Learn how to create background knowledge for a dataset <br>
5.	Learn to distinguish expected from unexpected results in data analysis and data mining—in general, this task is quite challenging, as it requires background knowledge with respect to the employed data mining technique, and also practical experience.<br> <br>

The Marriage and Divorce Dataset is a collection of most important factors leading up to marriage, as determined by a human expert (family counselor). The data was collected over 5 years from 115 subjects. The goal of this project is to perform exploratory data analysis for the Processed Marriage and Divorce Dataset which is a modification of the Marriage Dataset (https://www.kaggle.com/datasets/hosseinmousavi/marriage-and-divorce-dataset). The original Marriage dataset is a (30+1)D dataset and Processed Marriage and Divorce Dataset is a (30+2)D dataset with an nominal Recommendation attribute added; the continous attributes of this dataset are listed below; their range in square brackets: <br>

1 Age Gap [0 10] <br>
2 Education [1 5] <br>
3 Economic Similarity [1 100] <br>
4 Social Similarities [1 100] <br>
5 Cultural Similarities [1 100] <br>
6 Social Gap [1 100] <br>
7 Common Interests [50 100] <br>
8 Religion Compatibility [1 100] <br>
9 No of Children from Previous Marriage [1 5] <br>
10 Desire to Marry [1 100] <br>
11 Independency [1 2] <br>
12 Relationship with the Spouse Family [1 100] <br>
13 Trading in [0 100] <br>
14 Engagement Time [1 10] <br>
15 Love [30 100] <br>
16 Commitment [40 100] <br>
17 Mental Health [50 100] <br>
18 The Sense of Having Children [10 100] <br>
19 Previous Trading [1 80] <br>
20 Previous Marriage [1 5] <br>
21 The Proportion of Common Genes [1 50]fir <br>
22 Addiction [1 5] <br>
23 Loyalty [20 100] <br>
24 Height Ratio [1 100] <br>
25 Good Income [1 100] <br>
26 Self Confidence [40 100] <br>
27 Relation with Non-spouse Before Marriage [1 10] <br>
28 Spouse Confirmed by Family [1 10] <br>
29 Divorce in the Family of Grade 1 [1 10] <br>
30 Start Socializing with the Opposite Sex Age [15 40] <br>
31. (original target variable) Divorce Score [1 3] <br>
32. (processed target variable) Recommendation (‘Marry’ and ‘Divorce’; computed from attribute Divorce Scoer) <br> <br>

The values of the class  attribute Recommendation have been computed from the Divorce Probability attribute as follows: [1.0-2.0)Marry, [2.0-3.0}Divorce; here Divorce represents both ‘do not get married’ and ‘high possibility of divorce if married.’ In general, we are interested in predicting Attributes 31 and 32 using the other attributes; that is, we like to predict whether or not the couple should marry based on the factors described by the values of the first 30 attributes in the dataset. Another subject we are interested in is finding relationships between the continous attributes in the dataset, and to understand what factors influences successful marriages the most. 
