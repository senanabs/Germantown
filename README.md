**Background**

Total number of yearly visitors to Germantown metropark is calculated with +/-10% accuracy. Currently each 
entrance to the park is equipped with a traffic counter. The client states that it is expensive to maintain all 
the counters. As a cost-cutting measure, the client would like to remove some of the counters while still 
estimating the total visitors to the park with accuracy of the actual value of the yearly total.

**Data**

The data consist of total number of monthly visitors to Germantown metropark from 2012 to 2017. There are seven 
different gates to the park and the number of visitors are broken down by gate. Nature Center gate was 
permanently closed in October of 2015 and is excluded from the analysis. But the number of visitors using that 
gate in previous years is included in the total visitor count for the final analysis. 

**Method**

Total attendance is sorted by quarter (Jan-March, April-June, July-Aug, Sep-Dec) per gate per year. Total 
visitors to the park for each quarter is separately calculated. Leave One Out Cross Validation (LOOCV) process 
with simple linear regression in statistical software package R is utilized to carry out the analysis with 
quarterly total attendance for the park for each year as the dependent variable and quarterly attendance for 
each gate for each year as the independent variable. Separate models are implemented in the training process for 
each quarter and each gate totaling 24 different models (4 quarters per year and 6 different gates). 

In LOOCV, data is divided into subsets and a single subset is designated as validation data while the remaining 
subsets are used as training data. This process is repeated such that each subset is used once as the validation 
data. The goal of this cross-validation process is to test the model’s ability to predict new data that was not 
used in estimating it. 

In this project, each iteration of LOOCV for each gate consists of designating that gate’s quarterly attendance 
for a specific year (independent variable) and that gate’s total quarterly attendance for all years (dependent 
variable) as validation data and using the data for same two variables from all other years as training data. 
Mean Absolute Error (MAE) from each training iteration is divided by average quarterly park attendance from the 
respective quarter to calculate average MAE. This value is utilized to measure the accuracy of the prediction. 

**Results**

Only the Main Park gate has average MAE within ±10% accuracy. Thus, a simple linear regression model with 
Germantown Park’s total quarterly attendance for each year as the dependent variable and Main Park gate’s 
quarterly attendance for each year as the independent variable is utilized to make predictions on the total 
yearly attendance. 

Simple linear regression models for each quarter are as follows:

Quarter 1: y =10890+1.304x     →AdjR^2=0.3583    
Quarter 2: y =17970.191+1.518x     →AdjR^2=0.6258
Quarter 3: y =20810+1.179x     →AdjR^2=0.7931
Quarter 4: y =9424.0035+1.5147x     →AdjR^2=0.7451

To calculate the total park attendance for a specific quarter, substitute the number of visitors using the Main 
Park gate in that quarter to x and solve for y. This y value is the total park attendance for that quarter with 
±10% error. Adjusted R^2 in this case represents the proportion of variance for a dependent variable that’s 
explained by the independent variable. 



