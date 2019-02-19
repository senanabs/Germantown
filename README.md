

The data consist of total number of monthly visitors to Germantown metropark from 2012 to 2017. There are seven 
different gates to the park and the number of visitors are broken down by gate. Nature Center gate was 
permanently closed in October of 2015 and is excluded from the analysis. But the number of visitors using that 
gate in previous years is included in the total visitor count for the final analysis. 

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

