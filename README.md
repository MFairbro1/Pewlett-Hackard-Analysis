# Pewlett-Hackard-Analysis

## Overview

### The purpose of this analysis is to find out which employees are retiring from Pewlett Hackard in order to make decisions about retirement packages, and to determine how many vacancies will need to be filled. We need to find out how many employees are retiring per job title and identify which employees are eligible for a mentorship program in order to train the new generation of employees.

## Results

### From the "retirement_titles.csv" we can see that many thousands of employees are approaching retirement, but many of them also have held multiple titles at the company so these need to be narrowed down to only the current job titles:
![281133884_768233227875633_7778270841866974981_n](https://user-images.githubusercontent.com/104467100/175457217-5fc9f5c6-a5bf-43cd-91dc-410ea0bda2b6.png)

### From "unique_titles.csv" we can see that now we have only a single entry for each employee since we have eliminated past titles they have held:
![286258160_486526023248096_1639646123739108327_n](https://user-images.githubusercontent.com/104467100/175457531-099bbe81-613c-42e4-b8e0-0ff235dec920.png)

### "retiring_titles.csv" gives us a count of how many employees are leaving per job title:
![281266295_1136560556891121_1711667215487673667_n](https://user-images.githubusercontent.com/104467100/175457798-48a460ba-e68f-42b5-9880-4e558a0ab35b.png)

### "mentorship_eligibility.csv" gives a list of every employee eligible to take on a part-time mentorship position:
![287476133_1749593578725025_3393141725164776232_n](https://user-images.githubusercontent.com/104467100/175458392-3ffa2a5f-52e4-469f-b192-0a6ee1baed52.png)

## Summary

### The wave of retiring employees will leave 72,458 vacancies at the company. There are 1549 qualified, retirement-ready employees who can mentor the next generation of employees. This is roughly only 2% of the retiring employees. If divided evenly, that would mean each mentor would be responsible for training almost 50 new employees which may be a difficult task. It does not look like Pewlett Hackard has enough qualified mentors to train the next generation of employees. If we use the following query, we get the count of mentorship-eligible employees per title:

### SELECT COUNT(title), title
### INTO mentorship_count
### FROM mentorship_eligibility
### GROUP BY title
### ORDER BY count DESC

### If we look at the results of this query, we find that title with the largest number of upcoming vacancies (Senior Engineer) will also have comparatively few eligible retiring employees who could mentor the new generation. Certain titles are better off, such as "Engineer" and "Assistant Engineer" as they would each have less than 20 new employees per mentor. It may also help to add the following query, which would give a count of all current employees per title. This allows us to see how much of an impact the retirements will have on each title. More than 25% of senior engineers and senior staff will be lost:

### SELECT COUNT(title), title
### INTO employees_count
### FROM employees
### LEFT JOIN titles
### ON employees.emp_no = titles.emp_no
### GROUP BY title
### ORDER BY count DESC
