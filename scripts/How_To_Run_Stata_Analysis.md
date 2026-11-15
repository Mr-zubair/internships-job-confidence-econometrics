# How to Run the Project Analysis in Stata

## Recommended Do-File

Use this file:

```text
Stata_From_Raw_Excel_Analysis.do
```

This is the best version because it imports the original Google Forms Excel file, creates the variables inside Stata, runs the regression, and performs the assumption checks.

## Run Command in Stata

Open Stata and type:

```stata
do "C:\Users\pc\OneDrive - Higher Education Commission\BBA Documents\Semester 8\Econometrics\Semester_Project\Stata_From_Raw_Excel_Analysis.do"
```

## What the Do-File Does

1. Imports the original Excel survey responses.
2. Renames the columns into simple variable names.
3. Creates the Job Confidence Index.
4. Creates the Skills Index.
5. Codes internship, work experience, gender, department, and CGPA variables.
6. Runs descriptive statistics and frequency tables.
7. Runs correlation analysis.
8. Runs the OLS regression model.
9. Checks VIF for multicollinearity.
10. Runs Breusch-Pagan and White tests for heteroskedasticity.
11. Checks residual normality.
12. Runs the final regression with robust standard errors.

## Output Files Created

After running the do-file, Stata will create:

```text
Stata_From_Raw_Excel_Output.log
cleaned_survey_data_stata.dta
cleaned_survey_data_from_stata.csv
residual_histogram.png
residual_qnorm.png
residual_vs_fitted.png
```

## Important Note

The current do-file uses this Excel range:

```stata
cellrange(A2:M110)
```

This matches the current 109 responses. If you collect more responses later, update the ending row number. For example, if you have 130 responses, change it to:

```stata
cellrange(A2:M131)
```
