USE [Work]



CREATE VIEW ab1
AS
SELECT        a.ID, r.Reason, a.Month_of_absence, a.Body_mass_index, CASE WHEN Body_mass_index < 18.5 THEN 'Underweight' WHEN Body_mass_index BETWEEN 18.5 AND 
                         25 THEN 'Healthy weight' WHEN Body_mass_index BETWEEN 25 AND 30 THEN 'Overweight' WHEN Body_mass_index > 30 THEN 'Obesity' ELSE 'Unnown' END AS BMI_Category, CASE WHEN Month_of_absence IN (12, 1, 2) 
                         THEN 'Winter' WHEN Month_of_absence IN (3, 4, 5) THEN 'Spring' WHEN Month_of_absence IN (6, 7, 8) THEN 'Summer' WHEN Month_of_absence IN (9, 10, 11) THEN 'Fall' ELSE 'Unknown' END AS Season_Names, 
                         a.Transportation_expense, a.Day_of_the_week, a.Seasons, a.Social_drinker, a.Social_smoker, a.Education, a.Pet, a.Disciplinary_failure, a.Age, a.Work_load_Average_day, a.Absenteeism_time_in_hours, a.Son
FROM            dbo.Absenteeism_at_work AS a LEFT OUTER JOIN
                         dbo.compensation AS b ON a.ID = b.ID LEFT OUTER JOIN
                         dbo.Reasons AS r ON a.Reason_for_absence = r.Number

