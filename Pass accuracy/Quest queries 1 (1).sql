use quest;
create view pass_accuracy_view as
select
CASE
WHEN PasTotCmp >= 80 THEN 'High Accuracy'
WHEN PasTotCmp >= 60 AND PasTotCmp < 80 THEN 'Moderate Accuracy'
ELSE 'Low Accuracy'
END AS passing_accuracy_category,
ROUND(AVG(Assists),3) AS avg_assists
FROM
Player_data
GROUP BY
passing_accuracy_category
ORDER BY
passing_accuracy_category;






