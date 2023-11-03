use quest;

create view league_summary_view as


SELECT 
    Comp,
    ROUND(AVG(PasTotCmp), 3) AS avg_pass_accuracy,
    ROUND(AVG(Assists), 3) AS avg_assists
FROM 
    Player_data
GROUP BY 
    Comp
ORDER BY 
    avg_pass_accuracy DESC, avg_assists DESC