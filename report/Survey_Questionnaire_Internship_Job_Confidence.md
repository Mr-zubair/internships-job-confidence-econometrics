# Survey Questionnaire

## Project Title

**Do Internships Build Job Confidence? Evidence from Pooled Survey Data of University Students**

## Research Question

Does internship experience increase job confidence among university students, and does the quality of internship experience matter for students' perceived employability?

## Introductory Note for Google Forms

Dear respondent,

I am conducting this survey for an Econometrics semester project. The purpose of this study is to examine whether internship experience and practical skills affect job confidence among university students. The survey is anonymous and will be used only for academic purposes. It will take around 5 minutes to complete.

Please answer honestly. There are no right or wrong answers.

## Section 1: Consent and Eligibility

### Q1. Do you agree to participate in this academic survey?

- Yes
- No

**Google Forms setting:** If the answer is "No", submit the form.

### Q2. Are you currently a university student?

- Yes
- No

**Google Forms setting:** If the answer is "No", submit the form or move to the end of the form.

### Q3. What is your current academic level?

- Final year undergraduate student
- Other undergraduate student
- Master's student
- Recent graduate

**Recommended sample rule:** Prefer final-year undergraduate students. Other university students can be included if needed for a larger pooled sample.

## Section 2: Demographic Information

### Q4. Gender

- Male
- Female
- Prefer not to say

### Q5. Age

- Below 20
- 20-22
- 23-25
- Above 25

### Q6. University name

Short answer.

### Q7. University type

- Public
- Private

### Q8. Degree/program

- BBA
- BS Economics
- BS Accounting and Finance
- BS Computer Science
- BS Social Sciences
- Other

### Q9. Current semester/year

- 5th semester
- 6th semester
- 7th semester
- 8th semester
- Other

### Q10. Current CGPA

- Below 2.50
- 2.50-2.99
- 3.00-3.49
- 3.50-4.00
- Prefer not to say

## Section 3: Internship and Work Experience

### Q11. Have you completed at least one internship?

- Yes
- No

**Google Forms setting:** If "Yes", go to Section 4. If "No", skip Section 4 and go to Section 5.

### Q12. Apart from internship, do you have any work experience?

Examples: part-time job, family business work, freelancing, online work, paid project, volunteer work, or campus job.

- Yes
- No

### Q13. If yes, what type of work experience do you have?

- Part-time job
- Freelancing/online work
- Family business
- Volunteer work
- Campus job
- Paid project
- Not applicable
- Other

### Q14. Approximate total duration of work experience

- No work experience
- Less than 1 month
- 1-3 months
- 4-6 months
- More than 6 months

## Section 4: Internship Details

**This section is only for respondents who answered "Yes" to Q11.**

### Q15. How many internships have you completed?

- 1
- 2
- 3 or more

### Q16. Was your most recent internship related to your field of study?

- Yes
- No
- Somewhat

### Q17. Was your most recent internship paid?

- Paid
- Unpaid
- Stipend/allowance only

### Q18. Duration of your most recent internship

- Less than 1 month
- 1-2 months
- 3 months
- More than 3 months

### Q19. Internship Quality Statements

Use this scale:

1 = Strongly disagree  
2 = Disagree  
3 = Neutral  
4 = Agree  
5 = Strongly agree

Please rate the following statements about your most recent internship:

1. My internship tasks were related to my field of study.
2. I was given meaningful work during the internship.
3. I received proper guidance or supervision.
4. The internship helped me improve practical skills.
5. The internship helped me understand workplace expectations.
6. The internship improved my professional network.
7. The internship made me more confident about applying for jobs.

## Section 5: Skills and Career Preparation

### Q20. Skill and Career Preparation Statements

Use this scale:

1 = Strongly disagree  
2 = Disagree  
3 = Neutral  
4 = Agree  
5 = Strongly agree

Please rate yourself on the following:

1. I have strong communication skills.
2. I have good computer/digital skills.
3. I can prepare a professional CV or resume.
4. I feel prepared for job interviews.
5. I know how to search and apply for suitable jobs.
6. I have practical skills required in my field.
7. I have participated in workshops, trainings, or career guidance sessions.

### Q21. Have you received any career counseling or job placement support from your university?

- Yes
- No
- Not sure

## Section 6: Job Confidence

### Q22. Job Confidence Statements

Use this scale:

1 = Strongly disagree  
2 = Disagree  
3 = Neutral  
4 = Agree  
5 = Strongly agree

Please rate the following statements:

1. I am confident that I can get a job after graduation.
2. I am confident that I can get a job within six months after graduation.
3. I feel confident competing with other graduates in the job market.
4. I believe employers will value my current skills and experience.
5. I feel prepared to enter the professional job market.
6. I am confident that I can perform well in job interviews.

## Section 7: Optional Open-Ended Question

### Q23. In your opinion, what is the biggest factor that increases a student's confidence in getting a job?

Paragraph answer.

# Coding Guide for Data Analysis

## Main Variables

| Concept | Survey Question | Variable Name | Coding |
|---|---:|---|---|
| Job confidence index | Q22 | `job_confidence` | Average of Q22 items 1-6 |
| Internship experience | Q11 | `internship` | Yes = 1, No = 0 |
| Work experience | Q12 | `work_experience` | Yes = 1, No = 0 |
| Internship quality index | Q19 | `internship_quality` | Average of Q19 items 1-7, interns only |
| Skill index | Q20 | `skill_index` | Average of Q20 items 1-7 |
| Career support | Q21 | `career_support` | Yes = 1, No/Not sure = 0 |
| Gender | Q4 | `female` | Female = 1, Male = 0; prefer not to say can be left missing or separate |
| University type | Q7 | `private_uni` | Private = 1, Public = 0 |
| CGPA | Q10 | `cgpa_cat` | Below 2.50 = 1, 2.50-2.99 = 2, 3.00-3.49 = 3, 3.50-4.00 = 4 |

## Recommended Econometric Models

### Model 1: Full Sample

Use all valid student responses.

```text
job_confidence_i = beta0 + beta1 internship_i + beta2 work_experience_i
                   + beta3 skill_index_i + beta4 cgpa_cat_i
                   + beta5 female_i + beta6 private_uni_i + u_i
```

### Model 2: Internship Quality Model

Use only students who have completed an internship.

```text
job_confidence_i = beta0 + beta1 internship_quality_i + beta2 work_experience_i
                   + beta3 skill_index_i + beta4 cgpa_cat_i
                   + beta5 female_i + beta6 private_uni_i + u_i
```

## Hypotheses

| Hypothesis | Statement | Expected Sign |
|---|---|---:|
| H1 | Internship experience has a positive effect on job confidence. | beta1 > 0 |
| H2 | Work experience has a positive effect on job confidence. | beta2 > 0 |
| H3 | Skill level has a positive effect on job confidence. | beta3 > 0 |
| H4 | Internship quality has a positive effect on job confidence among students with internship experience. | beta1 > 0 in Model 2 |

## Regression Assumption Checks

Include the following in the final project:

1. Descriptive statistics for all key variables.
2. Correlation matrix.
3. Multicollinearity check using VIF.
4. Heteroskedasticity test using Breusch-Pagan or White test.
5. Residual normality check using histogram or normal probability plot.
6. Discussion of independent observations: each respondent should submit the survey only once.
7. Discussion of omitted variable bias as a limitation.

## Suggested Minimum Sample

Target at least 100 responses. A sample of 120-150 responses would be stronger.

## Important Note for Interpretation

Because this is cross-sectional survey data, avoid claiming strict causality. Use careful language such as:

"Internship experience is positively associated with job confidence."

Instead of:

"Internship experience causes job confidence."
