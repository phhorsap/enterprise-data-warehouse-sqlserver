CREATE VIEW v_MonthlyProductionSummary AS
WITH MonthlyStats AS (
    SELECT 
        m.MachineName,
        m.Location,
        t.Year,
        t.Month,
        SUM(f.ProducedQty) AS TotalProduced,
        SUM(f.GoodQty) AS TotalGood,
        SUM(f.DowntimeMinutes) AS TotalDowntime,
        COUNT(f.DateKey) * 480 AS ScheduledTime
    FROM FactProduction f
    JOIN DimMachine m ON f.MachineID = m.MachineID
    JOIN DimTime t ON f.DateKey = t.DateKey
    GROUP BY m.MachineName, m.Location, t.Year, t.Month
),
Calculations AS (
  SELECT 
        *,
        (CAST(TotalGood AS FLOAT) / NULLIF(TotalProduced, 0)) * 100 AS QualityRate,
        ((CAST(ScheduledTime AS FLOAT) - TotalDowntime) / NULLIF(ScheduledTime, 0)) * 100 AS AvailabilityRate
    FROM MonthlyStats
)
SELECT 
    Year,
    Month,
    MachineName,
    Location,
    TotalProduced,
    TotalGood,
    TotalDowntime,
    ROUND(QualityRate, 2) AS QualityPercent,
    ROUND(AvailabilityRate, 2) AS AvailabilityPercent,
    ROUND((QualityRate * AvailabilityRate) / 100, 2) AS EfficiencyScore
FROM Calculations;
