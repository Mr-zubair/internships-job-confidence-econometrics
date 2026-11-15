# Do Internships Build Job Confidence? Evidence from Pooled Survey Data of University Students[cite: 3]

An applied econometrics study investigating whether internship exposure, non-internship work experience, and self-reported skills are associated with perceived graduate employability among university students[cite: 4].

## Research Overview
* **Sample:** Primary cross-sectional survey ($N = 109$) collected across four undergraduate departments at Namal University: Mathematics ($31.2\%$), BBA ($29.4\%$), Electrical Engineering ($20.2\%$), and Computer Science ($19.3\%$)[cite: 3, 4, 10, 24].
* **Dependent Variable:** `Job Confidence Index` (mean of five 5-point Likert items measuring job-search, interview, CV, and competitive readiness; sample mean $= 3.921$, $\text{SD} = 0.593$)[cite: 7, 8, 10, 24].
* **Methodology:** Multivariable Ordinary Least Squares (OLS) regression estimated in **Stata** with **Huber–White robust standard errors (`vce(robust)`)** to correct for heteroskedasticity detected via Breusch–Pagan ($\chi^2(1) = 4.42, p = 0.0355$) and White’s ($\chi^2(35) = 53.39, p = 0.0240$) tests[cite: 13, 14, 24, 25].

## Key Empirical Findings ($N = 109$, $R^2 = 0.281$, $F(8,100) = 4.68$)[cite: 11, 24]

| Explanatory Variable | Coefficient ($\beta$) | Robust Std. Error | $t$-statistic | $p$-value |
| :--- | :---: | :---: | :---: | :---: |
| **Internship Experience** (`1 = Yes`)[cite: 8] | **+0.671**[cite: 11] | 0.152[cite: 11] | 4.42[cite: 24] | **< 0.001**[cite: 11] |
| **Skills Index** (`1–5 scale`)[cite: 8, 17] | +0.126[cite: 11] | 0.066[cite: 11] | 1.92[cite: 24] | 0.058[cite: 11] |
| **Work Experience** (`1 = Yes`)[cite: 8] | -0.074[cite: 11] | 0.109[cite: 11] | -0.67[cite: 24] | 0.503[cite: 11] |
| **CGPA Category** (`1–4 scale`)[cite: 8] | -0.059[cite: 11] | 0.059[cite: 11] | -1.01[cite: 24] | 0.315[cite: 11] |
| **Female** (`1 = Female`)[cite: 8] | -0.052[cite: 11] | 0.100[cite: 11] | -0.53[cite: 24] | 0.600[cite: 11] |
| *Department Controls (CS, BBA, Maths vs. EE)*[cite: 8] | *Included* | — | — | *Joint $p = 0.300$*[cite: 24] |

* **Internship Impact:** Completing at least one internship is associated with a **+0.671-point increase** on the 5-point Job Confidence Index ($p < 0.001$), holding skills, work experience, CGPA, gender, and department constant[cite: 11, 12].
* **Diagnostic Validation:** Low multicollinearity ($\text{mean VIF} = 1.35$, $\max \text{VIF} = 1.85$) and normally distributed residuals (skewness/kurtosis joint test $p = 0.9885$)[cite: 14, 24].

## Repository Structure
* data/ — Cleaned Stata dataset (`.dta`) and CSV export (`.csv`)[cite: 1, 25]
* scripts/ — Reproducible Stata `.do` files and execution output `.log`[cite: 23, 24, 25]
* report/ — Full 19-page PDF research report and survey coding documentation[cite: 3, 27]
* figures/ — Diagnostic plots (residual histogram, normal Q–Q plot, and residuals vs. fitted)[cite: 19, 20, 21]
