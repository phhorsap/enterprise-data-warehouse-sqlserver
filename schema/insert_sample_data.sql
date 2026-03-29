MERGE INTO DimProduct AS Target
USING (SELECT 101 AS ProductID, 'EV-Battery-Pack' AS ProductName, 'Energy' AS Category
       UNION ALL
       SELECT 102, 'Motor-Inverter', 'DriveUnit'
       UNION ALL
       SELECT 103, 'Chassis-Frame', 'Body') AS Source
ON (Target.ProductID = Source.ProductID)
WHEN MATCHED THEN
    UPDATE SET Target.ProductName = Source.ProductName,
               Target.Category = Source.Category
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Category)
    VALUES (Source.ProductID, Source.ProductName, Source.Category);
