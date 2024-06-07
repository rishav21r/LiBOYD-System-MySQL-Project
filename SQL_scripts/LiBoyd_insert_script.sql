# ------------------------------------------------------
# Databse Selection
# ------------------------------------------------------

USE LiBYOD_DB;

# ------------------------------------------------------
# Adding Sample Records to LiBYOD_DB tables
# ------------------------------------------------------
#
-- Testing
#SELECT * FROM OPERATING_SYSTEM;

-- Inserting data into DEPARTMENT
INSERT INTO DEPARTMENT (DepartmentID, Name, MailboxNumber, PhoneNumber) VALUES
(1, 'Sales and Marketing', 101, '555-0101'),
(2, 'Compliance and Legal', 102, '555-0102'),
(3, 'Human Resources', 103, '555-0103'),
(4, 'Underwriting', 104, '555-0104'),
(5, 'Claims', 105, '555-0105'),
(6, 'Customer Services', 106, '555-0106'),
(7, 'Policy', 107, '555-0107'),
(8, 'Risk Management', 108, '555-0108'),
(9, 'Finance and Accounting', 109, '555-0109'),
(10, 'Product Development', 110, '555-0110'),
(11, 'Actuarial', 111, '555-0111'),
(12, 'IT', 112, '555-0112');

-- Inserting data into EMPLOYEE
INSERT INTO EMPLOYEE (EmployeeID, FirstName, MiddleInitial, LastName, Title, CorporateEmail, CorporatePhone, PersonalPhone, DepartmentID) VALUES
(1, 'John', 'D', 'Doe', 'Mr.', 'john.doe@email.com', '555-1001', '444-1001', 1),
(2, 'Jane', 'M', 'Smith', 'Ms.', 'jane.smith@email.com', '555-1002', '444-1002', 2),
(3, 'Alice', 'B', 'Jones', 'Dr.', 'alice.jones@email.com', '555-1003', '444-1003', 3),
(4, 'Bob', 'C', 'Brown', 'Mr.', 'bob.brown@email.com', '555-1004', '444-1004', 4),
(5, 'Clara', 'E', 'White', 'Mrs.', 'clara.white@email.com', '555-1005', '444-1005', 5);
-- Inserting missing employees if necessary
INSERT INTO EMPLOYEE (EmployeeID, FirstName, MiddleInitial, LastName, Title, CorporateEmail, CorporatePhone, PersonalPhone, DepartmentID) VALUES
(6, 'Elena', 'F', 'Garcia', 'Dr.', 'elena.garcia@email.com', '555-2006', '444-2006', 3),
(7, 'Marco', 'J', 'Santos', 'Mr.', 'marco.santos@email.com', '555-2007', '444-2007', 4),
(8, 'Liu', 'H', 'Wen', 'Ms.', 'liu.wen@email.com', '555-2008', '444-2008', 5);


-- Inserting data into DEVICE
INSERT INTO DEVICE (DeviceID, Brand, Model, Value, RegistrationDate, EmployeeID) VALUES
(1, 'Apple', 'iPhone 12', 800.00, '2023-01-10', 1),
(2, 'Samsung', 'Galaxy S21', 700.00, '2023-01-11', 2),
(3, 'Google', 'Pixel 5', 650.00, '2023-01-12', 3),
(4, 'Apple', 'MacBook Pro', 1500.00, '2023-01-13', 4),
(5, 'Dell', 'XPS 13', 1200.00, '2023-01-14', 5);
-- Adding new devices to the DEVICE table for Desktop integration
INSERT INTO DEVICE (DeviceID, Brand, Model, Value, RegistrationDate, EmployeeID) VALUES
(6, 'HP', 'EliteDesk 800', 900.00, '2023-01-15', 6),
(7, 'Lenovo', 'ThinkCentre M720', 850.00, '2023-01-16', 7),
(8, 'Asus', 'VivoPC', 780.00, '2023-01-17', 8);

-- Inserting data into MOBILE_DEVICE
INSERT INTO MOBILE_DEVICE (DeviceID, ScreenLockEnabled, IsEncrypted) VALUES
(1, TRUE, TRUE),
(2, TRUE, TRUE),
(3, TRUE, FALSE),
(4, FALSE, TRUE),
(5, TRUE, TRUE);

-- Inserting data into DEVICE_TYPE
INSERT INTO DEVICE_TYPE (DeviceTypeID, TypeName) VALUES
(1, 'Smartphone'),
(2, 'Tablet'),
(3, 'Laptop'),
(4, 'Desktop'),
(5, 'Server');

-- Inserting data into OPERATING_SYSTEM
INSERT INTO OPERATING_SYSTEM (OSID, OperatingSystem, OperatingSystemVersion) VALUES
(1, 'iOS', '14.4'),
(2, 'Android', '11'),
(3, 'Windows', '10'),
(4, 'macOS', 'Catalina 10.15'),
(5, 'Linux', 'Ubuntu 20.04');

-- Inserting data into DEVICE_HISTORY
INSERT INTO DEVICE_HISTORY (HistoryID, DeviceID, PreviousDeviceTypeID, PreviousOSID, ChangeDate, ChangedBy) VALUES
(1, 1, 1, 1, '2023-01-30', 1),
(2, 2, 2, 2, '2023-01-31', 2),
(3, 3, 3, 3, '2023-02-01', 3),
(4, 4, 4, 4, '2023-02-02', 4),
(5, 5, 5, 5, '2023-02-03', 5);

-- Inserting data into APPROVAL_STATUS_CODE
INSERT INTO APPROVAL_STATUS_CODE (ApprovalStatusID, StatusCode, StatusDescription) VALUES
(1, 100, 'Pending Approval'),
(2, 200, 'Approved'),
(3, 300, 'Rejected'),
(4, 400, 'Requires Review'),
(5, 500, 'Re-Submitted');

-- Inserting data into DEVICE_APPROVAL
INSERT INTO DEVICE_APPROVAL (ApprovalID, DeviceID, ApprovalStatusID, ApprovalDate) VALUES
(1, 1, 1, '2023-01-20'),
(2, 2, 1, '2023-01-21'),
(3, 3, 2, '2023-01-22'),
(4, 4, 3, '2023-01-23'),
(5, 5, 3, '2023-01-24');

-- Inserting data into IT_STAFF
INSERT INTO IT_STAFF (StaffID, FirstName, LastName, Email) VALUES
(1, 'Alan', 'Turing', 'alan.turing@email.com'),
(2, 'Grace', 'Hopper', 'grace.hopper@email.com'),
(3, 'Ada', 'Lovelace', 'ada.lovelace@email.com'),
(4, 'Tim', 'Berners-Lee', 'tim.bernerslee@email.com'),
(5, 'Linus', 'Torvalds', 'linus.torvalds@email.com');

-- Inserting data into DEVICE_ACTIVATION
INSERT INTO DEVICE_ACTIVATION (ActivationID, DeviceID, ActivationDate, ActivatedBy) VALUES
(1, 1, '2023-01-25', 1),
(2, 2, '2023-01-26', 2),
(3, 3, '2023-01-27', 3),
(4, 4, '2023-01-28', 4),
(5, 5, '2023-01-29', 5);

-- Inserting data into LOCATION
INSERT INTO LOCATION (LocationID, BuildingName, OfficeNumber) VALUES
(1, 'Headquarters', '101A'),
(2, 'Headquarters', '102B'),
(3, 'Annex Building', '201A'),
(4, 'Annex Building', '202B'),
(5, 'East Wing', '301C');

-- Inserting data into DESKTOP
INSERT INTO DESKTOP (DeviceID, StaticIP, LocationID) VALUES
(4, '192.168.1.101', 1),
(5, '192.168.1.102', 2),
(6, '192.168.1.103', 3),
(7, '192.168.1.104', 4),
(8, '192.168.1.105', 5);

-- Inserting data into ASSET_REGISTER
INSERT INTO ASSET_REGISTER (AssetID, DeviceID, AcquisitionDate, DisposalDate) VALUES
(1, 1, '2023-01-01', NULL),
(2, 2, '2023-01-02', NULL),
(3, 3, '2023-01-03', NULL),
(4, 4, '2023-01-04', NULL),
(5, 5, '2023-01-05', NULL);

-- Inserting data into SERVICE
INSERT INTO SERVICE (ServiceID, Name, Description) VALUES
(1, 'HR Management', 'Human resources related services'),
(2, 'Payroll', 'Monthly payroll processing'),
(3, 'Training', 'Personal development and training services'),
(4, 'IT Support', 'IT-related support services'),
(5, 'Legal Consulting', 'Legal advice and compliance consulting');

-- Inserting data into SERVICE_ACCESS
INSERT INTO SERVICE_ACCESS (ServiceID, EmployeeID, AccessApprovalDate) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-01-16'),
(3, 3, '2023-01-17'),
(4, 4, '2023-01-18'),
(5, 5, '2023-01-19');

-- Inserting data into ROLE
INSERT INTO ROLE (RoleID, Description) VALUES
(1, 'Project Manager'),
(2, 'Team Lead'),
(3, 'Software Developer'),
(4, 'Quality Assurance'),
(5, 'Business Analyst');

-- Inserting data into PROJECT
INSERT INTO PROJECT (ProjectID, Name, Description, StartDate, EndDate) VALUES
(1, 'NextGen Product', 'Developing next generation of products', '2023-02-01', '2023-08-01'),
(2, 'Compliance Update', 'Updating compliance protocols', '2023-03-01', '2023-04-15'),
(3, 'Website Revamp', 'Redesigning the company website', '2023-04-01', '2023-10-01'),
(4, 'Security Enhancement', 'Enhancing IT security', '2023-05-01', '2023-07-01'),
(5, 'Market Expansion', 'Expanding into new markets', '2023-06-01', '2024-01-01');

-- Inserting data into PROJECT_MEMBERSHIP
INSERT INTO PROJECT_MEMBERSHIP (ProjectID, EmployeeID, RoleID) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 4, 4),
(2, 5, 5);

-- Inserting data into GROUP_POLICY
INSERT INTO GROUP_POLICY (PolicyID, DepartmentID, PolicyName, PolicyDetails) VALUES
(1, 1, 'Standard Access', 'Access to standard departmental resources'),
(2, 2, 'Enhanced Access', 'Access to sensitive data and systems'),
(3, 3, 'Restricted Access', 'Limited access to specific applications'),
(4, 4, 'Admin Access', 'Full access with administrative privileges'),
(5, 5, 'Guest Access', 'Access for temporary and guest users');

