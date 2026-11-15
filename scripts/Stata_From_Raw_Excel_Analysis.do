*******************************************************
* Econometrics Semester Project - Full Stata Workflow
* Topic: Do Internships Build Job Confidence?
* This file imports the original Google Forms Excel file,
* cleans/codes the variables, creates indexes, and runs OLS.
*******************************************************

clear all
set more off

* Project folder
cd "C:\Users\pc\OneDrive - Higher Education Commission\BBA Documents\Semester 8\Econometrics\Semester_Project"

* Original survey response file
local raw_excel "C:\Users\pc\Downloads\Eco project (Responses).xlsx"

* Start log file
capture log close
log using "Stata_From_Raw_Excel_Output.log", replace text

*******************************************************
* 1. Import raw Excel responses
*******************************************************

* The first row contains question headers, so data start from row 2.
* Current file has 109 responses, so the data range is A2:M110.
* allstring keeps Yes/No and CGPA categories clean during import.
import excel using "`raw_excel'", clear cellrange(A2:M110) allstring

* Rename columns from A-M to simple variable names
rename A internship_text
rename B work_text
rename C jc1
rename D jc2
rename E jc3
rename F jc4
rename G jc5
rename H skill1
rename I skill2
rename J skill3
rename K gender
rename L department
rename M cgpa_group

describe
list in 1/10

*******************************************************
* 2. Convert Likert-scale responses to numeric variables
*******************************************************

foreach var of varlist jc1 jc2 jc3 jc4 jc5 skill1 skill2 skill3 {
    destring `var', replace force
}

*******************************************************
* 3. Create dependent variable and main indexes
*******************************************************

* Dependent variable: average of five job-confidence questions
egen job_confidence = rowmean(jc1 jc2 jc3 jc4 jc5)
label variable job_confidence "Job Confidence Index"

* Skills Index: average of three skill questions
egen skill_index = rowmean(skill1 skill2 skill3)
label variable skill_index "Skills Index"

*******************************************************
* 4. Code independent variables and controls
*******************************************************

* Internship dummy
gen internship = .
replace internship = 1 if internship_text == "Yes"
replace internship = 0 if internship_text == "No"
label variable internship "Internship Experience"

* Work experience dummy
gen work_experience = .
replace work_experience = 1 if work_text == "Yes"
replace work_experience = 0 if work_text == "No"
label variable work_experience "Work Experience"

* Gender dummy
gen female = .
replace female = 1 if gender == "Female"
replace female = 0 if gender == "Male"
label variable female "Female"

* Department dummies; EE is the base category
gen cs = department == "CS"
gen bba = department == "BBA"
gen maths = department == "Maths"
gen ee = department == "EE"

label variable cs "CS Department"
label variable bba "BBA Department"
label variable maths "Maths Department"
label variable ee "EE Department"

* CGPA category
gen cgpa_cat = .
replace cgpa_cat = 1 if cgpa_group == "Below 2.50"
replace cgpa_cat = 2 if cgpa_group == "2.50-2.99"
replace cgpa_cat = 3 if cgpa_group == "3.00-3.49"
replace cgpa_cat = 4 if cgpa_group == "3.50-4.00"
label variable cgpa_cat "CGPA Category"

label define yesno 0 "No" 1 "Yes"
label values internship yesno
label values work_experience yesno

label define genderlbl 0 "Male" 1 "Female"
label values female genderlbl

label define cgpalbl 1 "Below 2.50" 2 "2.50-2.99" 3 "3.00-3.49" 4 "3.50-4.00"
label values cgpa_cat cgpalbl

* Drop observations with missing key variables, if any
drop if missing(job_confidence, internship, work_experience, skill_index, cgpa_cat, female)

*******************************************************
* 5. Save cleaned Stata dataset
*******************************************************

save "cleaned_survey_data_stata.dta", replace
export delimited using "cleaned_survey_data_from_stata.csv", replace

*******************************************************
* 6. Descriptive statistics and frequency tables
*******************************************************

summarize job_confidence internship work_experience skill_index cgpa_cat female cs bba maths

tab internship
tab work_experience
tab gender
tab department
tab cgpa_group

*******************************************************
* 7. Reliability checks for indexes
*******************************************************

alpha jc1 jc2 jc3 jc4 jc5
alpha skill1 skill2 skill3

*******************************************************
* 8. Correlation matrix
*******************************************************

pwcorr job_confidence internship work_experience skill_index cgpa_cat, sig obs

*******************************************************
* 9. Bivariate comparison
*******************************************************

ttest job_confidence, by(internship)

*******************************************************
* 10. Main OLS regression model
*******************************************************

reg job_confidence internship work_experience skill_index cgpa_cat female cs bba maths

*******************************************************
* 11. Regression assumption checks
*******************************************************

* Multicollinearity
estat vif

* Heteroskedasticity
estat hettest
estat imtest, white

* Residual normality
predict residuals, resid
summarize residuals, detail
sktest residuals

* Optional diagnostic graphs
histogram residuals, normal title("Histogram of Regression Residuals")
graph export "residual_histogram.png", replace

qnorm residuals
graph export "residual_qnorm.png", replace

rvfplot, yline(0)
graph export "residual_vs_fitted.png", replace

*******************************************************
* 12. Final model with robust standard errors
*******************************************************

reg job_confidence internship work_experience skill_index cgpa_cat female cs bba maths, vce(robust)

*******************************************************
* 13. Hypothesis tests
*******************************************************

* H1: Internship experience affects job confidence
test internship

* H2: Work experience affects job confidence
test work_experience

* H3: Skills Index affects job confidence
test skill_index

* Joint significance of department dummies
test cs bba maths

*******************************************************
* 14. Close log
*******************************************************

log close

*******************************************************
* End of full Stata workflow
*******************************************************
