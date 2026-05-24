SELECT
    target_id,
    count(*) AS findings,
    count(DISTINCT run_id) AS runs,
    count(*) FILTER (WHERE priority = 'HIGH') AS high_priority,
    count(*) FILTER (WHERE risk_level = 'HIGH') AS high_risk,
    count(*) FILTER (WHERE requires_maintenance_window IS TRUE) AS maintenance_window,
    min(collected_at) AS first_collected_at,
    max(collected_at) AS last_collected_at
FROM pga_global_advisor_snapshot
GROUP BY target_id
ORDER BY high_priority DESC, high_risk DESC, findings DESC;
