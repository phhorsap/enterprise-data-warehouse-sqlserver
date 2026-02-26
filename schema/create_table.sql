CREATE TABLE DimMachine (
    MachineID INT PRIMARY KEY,
    MachineName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100)
);

CREATE TABLE DimTime (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    Day INT
);

CREATE TABLE FactProduction (
    ProductionID INT PRIMARY KEY,
    MachineID INT,
    ProductID INT,
    DateKey INT,
    ProducedQty INT,
    DowntimeMinutes INT,
    GoodQty INT,
    FOREIGN KEY (MachineID) REFERENCES DimMachine(MachineID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (DateKey) REFERENCES DimTime(DateKey)
);
