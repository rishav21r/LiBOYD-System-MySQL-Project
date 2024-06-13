## Datasets and Tables


### Department Table:
| DepartmentID | Name                   | MailboxNumber | PhoneNumber |
|--------------|------------------------|---------------|-------------|
| 1            | Sales and Marketing    | 101           | 555-0101    |
| 2            | Compliance and Legal   | 102           | 555-0102    |
| 3            | Human Resources        | 103           | 555-0103    |
| 4            | Underwriting           | 104           | 555-0104    |
| 5            | Claims                 | 105           | 555-0105    |
| 6            | Customer Services      | 106           | 555-0106    |
| 7            | Policy                 | 107           | 555-0107    |
| 8            | Risk Management        | 108           | 555-0108    |
| 9            | Finance and Accounting | 109           | 555-0109    |
| 10           | Product Development    | 110           | 555-0110    |
| 11           | Actuarial              | 111           | 555-0111    |
| 12           | IT                     | 112           | 555-0112    |


### Employee Table:
| EmployeeID | FirstName | MiddleInitial | LastName | Title | CorporateEmail       | CorporatePhone | PersonalPhone | DepartmentID |
|------------|-----------|---------------|----------|-------|----------------------|----------------|---------------|--------------|
| 1          | John      | D             | Doe      | Mr.   | john.doe@email.com   | 555-1001       | 444-1001      | 1            |
| 2          | Jane      | M             | Smith    | Ms.   | jane.smith@email.com | 555-1002       | 444-1002      | 2            |
| 3          | Alice     | B             | Jones    | Dr.   | alice.jones@email.com| 555-1003       | 444-1003      | 3            |
| 4          | Bob       | C             | Brown    | Mr.   | bob.brown@email.com  | 555-1004       | 444-1004      | 4            |
| 5          | Clara     | E             | White    | Mrs.  | clara.white@email.com| 555-1005       | 444-1005      | 5            |
| 6          | Elena     | F             | Garcia   | Dr.   | elena.garcia@email.com| 555-2006      | 444-2006      | 3            |
| 7          | Marco     | J             | Santos   | Mr.   | marco.santos@email.com| 555-2007      | 444-2007      | 4            |
| 8          | Liu       | H             | Wen      | Ms.   | liu.wen@email.com    | 555-2008       | 444-2008      | 5            |


### Device Table:
| DeviceID | Brand  | Model        | Value | RegistrationDate | DisposalDate | EmployeeID |
|----------|--------|--------------|-------|------------------|--------------|------------|
| 1        | Apple  | iPhone 12    | 800.00| 2023-01-10       | NULL         | 1          |
| 2        | Samsung| Galaxy S21   | 700.00| 2023-01-11       | NULL         | 2          |
| 3        | Google | Pixel 5      | 650.00| 2023-01-12       | NULL         | 3          |
| 4        | Apple  | MacBook Pro  | 1500.00| 2023-01-13      | NULL         | 4          |
| 5        | Dell   | XPS 13       | 1200.00| 2023-01-14      | NULL         | 5          |
| 6        | HP     | EliteDesk 800| 900.00| 2023-01-15       | NULL         | 6          |
| 7        | Lenovo | ThinkCentre M720| 850.00| 2023-01-16    | NULL         | 7          |
| 8        | Asus   | VivoPC       | 780.00| 2023-01-17       | NULL         | 8          |


### Device Table:
| DeviceID | Brand  | Model        | Value | RegistrationDate | DisposalDate | EmployeeID |
|----------|--------|--------------|-------|------------------|--------------|------------|
| 1        | Apple  | iPhone 12    | 800.00| 2023-01-10       | NULL         | 1          |
| 2        | Samsung| Galaxy S21   | 700.00| 2023-01-11       | NULL         | 2          |
| 3        | Google | Pixel 5      | 650.00| 2023-01-12       | NULL         | 3          |
| 4        | Apple  | MacBook Pro  | 1500.00| 2023-01-13      | NULL         | 4          |
| 5        | Dell   | XPS 13       | 1200.00| 2023-01-14      | NULL         | 5          |
| 6        | HP     | EliteDesk 800| 900.00| 2023-01-15       | NULL         | 6          |
| 7        | Lenovo | ThinkCentre M720| 850.00| 2023-01-16    | NULL         | 7          |
| 8        | Asus   | VivoPC       | 780.00| 2023-01-17       | NULL         | 8          |

### Location Table:
| LocationID | BuildingName  | OfficeNumber |
|------------|---------------|--------------|
| 1          | Headquarters  | 101A         |
| 2          | Headquarters  | 102B         |
| 3          | Annex Building| 201A         |
| 4          | Annex Building| 202B         |
| 5          | East Wing     | 301C         |

### Desktop Table:
| DeviceID | StaticIP      | LocationID |
|----------|---------------|------------|
| 4        | 192.168.1.101 | 1          |
| 5        | 192.168.1.102 | 2          |
| 6        | 192.168.1.103 | 3          |
| 7        | 192.168.1.104 | 4          |
| 8        | 192.168.1.105 | 5          |


### Mobile Device Table:
| DeviceID | ScreenLockEnabled | IsEncrypted |
|----------|-------------------|-------------|
| 1        | 1                 | 1           |
| 2        | 1                 | 1           |
| 3        | 1                 | 0           |
| 4        | 0                 | 1           |
| 5        | 1                 | 1           |


### Asset Register Table:
| AssetID | DeviceID | AcquisitionDate | DisposalDate |
|---------|----------|-----------------|--------------|
| 1       | 1        | 2023-01-01      | NULL         |
| 2       | 2        | 2023-01-02      | NULL         |
| 3       | 3        | 2023-01-03      | NULL         |
| 4       | 4        | 2023-01-04      | NULL         |
| 5       | 5        | 2023-01-05      | NULL         |


### Device Type Table:
| DeviceTypeID | TypeName  |
|--------------|-----------|
| 1            | Smartphone|
| 2            | Tablet    |
| 3            | Laptop    |
| 4            | Desktop   |
| 5            | Server    |









