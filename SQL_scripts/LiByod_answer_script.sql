# ------------------------------------------------------
# Databse Selection
# ------------------------------------------------------
USE LiBYOD_DB;
# ------------------------------------------------------
# SQL statements to fetch answer for IT management
# ------------------------------------------------------

-- i. Provide a breakdown of the number of BYOD devices by type, make, model, and operating system.
SELECT dt.TypeName AS DeviceType, d.Brand, d.Model, os.OperatingSystem, COUNT(*) AS NumberOfDevices
FROM DEVICE d
JOIN DEVICE_TYPE dt ON d.DeviceID = dt.DeviceTypeID
JOIN OPERATING_SYSTEM os ON d.DeviceID = os.OSID
GROUP BY dt.TypeName, d.Brand, d.Model, os.OperatingSystem;

-- ii. What is the total cost of all BYODs in use and a cost breakdown of types and models.
SELECT dt.TypeName, d.Brand, d.Model, SUM(d.Value) AS TotalValue
FROM DEVICE d
JOIN DEVICE_TYPE dt ON d.DeviceID = dt.DeviceTypeID
GROUP BY dt.TypeName, d.Brand, d.Model;
-- Total cost of all BYODs
SELECT SUM(Value) AS TotalCostOfAllBYODs FROM DEVICE;

-- iii. What is the average cost of each type of BYOD device?
SELECT dt.TypeName, AVG(d.Value) AS AverageCost
FROM DEVICE d
JOIN DEVICE_TYPE dt ON d.DeviceID = dt.DeviceTypeID
GROUP BY dt.TypeName;

-- iv. What are the average times between registration and approval, approval to activation, and average time from registration to device?
SELECT 
    AVG(DATEDIFF(da.ApprovalDate, d.RegistrationDate)) AS AvgTimeBetweenRegistrationAndApproval,
    AVG(DATEDIFF(dact.ActivationDate, da.ApprovalDate)) AS AvgTimeBetweenApprovalAndActivation,
    AVG(DATEDIFF(dact.ActivationDate, d.RegistrationDate)) AS AvgTimeFromRegistrationToActivation
FROM DEVICE d
LEFT JOIN DEVICE_APPROVAL da ON d.DeviceID = da.DeviceID
LEFT JOIN DEVICE_ACTIVATION dact ON d.DeviceID = dact.DeviceID;

-- v. What type of device and operating system took longest in days to be activated?
SELECT dt.TypeName, os.OperatingSystem, MAX(DATEDIFF(da.ActivationDate, d.RegistrationDate)) AS MaxDaysToActivation
FROM DEVICE d
JOIN DEVICE_TYPE dt ON d.DeviceID = dt.DeviceTypeID
JOIN OPERATING_SYSTEM os ON d.DeviceID = os.OSID
JOIN DEVICE_ACTIVATION da ON d.DeviceID = da.DeviceID
GROUP BY dt.TypeName, os.OperatingSystem
ORDER BY MaxDaysToActivation DESC
LIMIT 1;

-- vi. What are the minimum and maximum times for service delivery to activation?
SELECT
    MIN(DATEDIFF(da.ActivationDate, sa.AccessApprovalDate)) AS MinTimeServiceToActivation,
    MAX(DATEDIFF(da.ActivationDate, sa.AccessApprovalDate)) AS MaxTimeServiceToActivation
FROM SERVICE_ACCESS sa
JOIN EMPLOYEE e ON sa.EmployeeID = e.EmployeeID
JOIN DEVICE d ON e.EmployeeID = d.EmployeeID
JOIN DEVICE_ACTIVATION da ON d.DeviceID = da.DeviceID;
