*******************************************************
* Econometrics Semester Project - Stata Analysis
* Topic: Do Internships Build Job Confidence?
* Data: Primary survey data from university students
*******************************************************

clear all
set more off

* Set project folder
cd "C:\Users\pc\OneDrive - Higher Education Commission\BBA Documents\Semester 8\Econometrics\Semester_Project"

* Start log file
capture log close
log using "Stata_Analysis_Output.log", replace text

*******************************************************
* 1. Import cleaned survey data
*******************************************************

import delimited "cleaned_survey_data.csv", clear varnames(1)

describe
list in 1/10

*******************************************************
* 2. Label variables
*******************************************************

label variable job_confidence "Job Confidence Index"
label variable internship "Internship Experience"
label variable work_experience "Work Experience"
label variable skill_index "Skills Index"
label variable cgpa_cat "CGPA Category"
label variable female "Female"
label variable cs "CS Department"
label variable bba "BBA Department"
label variable maths "Maths Department"

label define yesno 0 "No" 1 "Yes"
label values internship yesno
label values work_experience yesno

label define genderlbl 0 "Male" 1 "Female"
label values female genderlbl

label define cgpalbl 1 "Below 2.50" 2 "2.50-2.99" 3 "3.00-3.49" 4 "3.50-4.00"
label values cgpa_cat cgpalbl

*******************************************************
* 3. Descriptive statistics and frequency tables
*******************************************************

summarize job_confidence internship work_experience skill_index cgpa_cat female cs bba maths

tab internship
tab work_experience
tab gender
tab department
tab cgpa_group

*******************************************************
* 4. Reliability of constructed indexes
*******************************************************

* Reliability of Job Confidence Index
alpha jc1 jc2 jc3 jc4 jc5

* Reliability of Skills Index
alpha skill1 skill2 skill3

*******************************************************
* 5. Correlation matrix
*******************************************************

pwcorr job_confidence internship work_experience skill_index cgpa_cat, sig obs

*******************************************************
* 6. Main OLS regression model
*******************************************************

* Non-robust OLS regression
reg job_confidence internship work_experience skill_index cgpa_cat female cs bba maths

* Store model
estimates store ols_model

*******************************************************
* 7. Regression assumption checks
*******************************************************

* 7.1 Multicollinearity check using VIF
estat vif

* 7.2 Heteroskedasticity test: Breusch-Pagan test
estat hettest

* 7.3 Heteroskedasticity test: White's general test
estat imtest, white

* 7.4 Residual normality checks
predict residuals, resid
summarize residuals, detail
sktest residuals

* Optional residual graphs
histogram residuals, normal title("Histogram of Regression Residuals")
graph export "residual_histogram.png", replace

qnorm residuals
graph export "residual_qnorm.png", replace

rvfplot, yline(0)
graph export "residual_vs_fitted.png", replace

*******************************************************
* 8. Final model with robust standard errors
*******************************************************

reg job_confidence internship work_experience skill_index cgpa_cat female cs bba maths, vce(robust)

estimates store robust_model

*******************************************************
* 9. Hypothesis testing
*******************************************************

* H1: Internship experience positively affects job confidence
test internship

* H2: Work experience affects job confidence
test work_experience

* H3: Skills Index affects job confidence
test skill_index

* Joint significance of department dummies
test cs bba maths

*******************************************************
* 10. Close log
*******************************************************

log close

*******************************************************
* End of Stata analysis
*******************************************************
