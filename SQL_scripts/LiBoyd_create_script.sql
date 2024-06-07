# -----------------------------------------------------
# Databse Selection
# -----------------------------------------------------

CREATE DATABaSE LiBYOD_DB;

# -----------------------------------------------------
# Databse Selection
# -----------------------------------------------------

USE LiBYOD_DB;

# -----------------------------------------------------
# Table Creation
# -----------------------------------------------------

-- Table for DEPARTMENT
CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    MailboxNumber INT,
    PhoneNumber VARCHAR(20)
);

-- Table for EMPLOYEE
CREATE TABLE EMPLOYEE (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    MiddleInitial CHAR(1),
    LastName VARCHAR(255) NOT NULL,
    Title VARCHAR(255),
    CorporateEmail VARCHAR(50) NOT NULL,
    CorporatePhone VARCHAR(20),
    PersonalPhone VARCHAR(20),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);

-- Table for DEVICE
CREATE TABLE DEVICE (
    DeviceID INT PRIMARY KEY,
    Brand VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Value DECIMAL(10, 2),
    RegistrationDate DATE NOT NULL,
    DisposalDate DATE,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);

-- Table for LOCATION
CREATE TABLE LOCATION (
    LocationID INT PRIMARY KEY,
    BuildingName VARCHAR(255),
    OfficeNumber VARCHAR(50)
);

-- Table for DESKTOP
CREATE TABLE DESKTOP (
    DeviceID INT PRIMARY KEY,
    StaticIP VARCHAR(15),
    LocationID INT,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID),
    FOREIGN KEY (LocationID) REFERENCES LOCATION(LocationID)
);

-- Table for MOBILE_DEVICE
CREATE TABLE MOBILE_DEVICE (
    DeviceID INT PRIMARY KEY,
    ScreenLockEnabled BOOLEAN,
    IsEncrypted BOOLEAN,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID)
);

-- Table for ASSET_REGISTER
CREATE TABLE ASSET_REGISTER (
    AssetID INT PRIMARY KEY,
    DeviceID INT,
    AcquisitionDate DATE,
    DisposalDate DATE,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID)
);

-- Table for DEVICE_TYPE
CREATE TABLE DEVICE_TYPE (
    DeviceTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL
);

-- Table for SERVICE
CREATE TABLE SERVICE (
    ServiceID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Table for SERVICE_ACCESS
CREATE TABLE SERVICE_ACCESS (
    ServiceID INT,
    EmployeeID INT,
    AccessApprovalDate DATE,
    PRIMARY KEY (ServiceID, EmployeeID),
    FOREIGN KEY (ServiceID) REFERENCES SERVICE(ServiceID),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);

-- Table for ROLE
CREATE TABLE ROLE (
    RoleID INT PRIMARY KEY,
    Description TEXT
);

-- Table for PROJECT
CREATE TABLE PROJECT (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE
);

-- Table for PROJECT_MEMBERSHIP
CREATE TABLE PROJECT_MEMBERSHIP (
    ProjectID INT,
    EmployeeID INT,
    RoleID INT,
    PRIMARY KEY (ProjectID, EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES PROJECT(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    FOREIGN KEY (RoleID) REFERENCES ROLE(RoleID)
);


-- Table for OPERATING_SYSTEM
CREATE TABLE OPERATING_SYSTEM (
    OSID INT PRIMARY KEY,
    OperatingSystem VARCHAR(255) NOT NULL,
    OperatingSystemVersion VARCHAR(60)
);

-- Table for DEVICE_HISTORY
CREATE TABLE DEVICE_HISTORY (
    HistoryID INT PRIMARY KEY,
    DeviceID INT,
    PreviousDeviceTypeID INT,
    PreviousOSID INT,
    ChangeDate DATE,
    ChangedBy INT,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID),
    FOREIGN KEY (PreviousDeviceTypeID) REFERENCES DEVICE_TYPE(DeviceTypeID),
    FOREIGN KEY (PreviousOSID) REFERENCES OPERATING_SYSTEM(OSID),
    FOREIGN KEY (ChangedBy) REFERENCES EMPLOYEE(EmployeeID)
);

-- Table for APPROVAL_STATUS_CODE
CREATE TABLE APPROVAL_STATUS_CODE (
    ApprovalStatusID INT PRIMARY KEY,
    StatusCode INT,
    StatusDescription VARCHAR(50)
);

-- Table for DEVICE_APPROVAL
CREATE TABLE DEVICE_APPROVAL (
    ApprovalID INT PRIMARY KEY,
    DeviceID INT,
    ApprovalStatusID INT,
    ApprovalDate DATE,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID),
    FOREIGN KEY (ApprovalStatusID) REFERENCES APPROVAL_STATUS_CODE(ApprovalStatusID)
);

-- Table for IT_STAFF
CREATE TABLE IT_STAFF (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Table for DEVICE_ACTIVATION
CREATE TABLE DEVICE_ACTIVATION (
    ActivationID INT PRIMARY KEY,
    DeviceID INT,
    ActivationDate DATE NOT NULL,
    ActivatedBy INT,
    FOREIGN KEY (DeviceID) REFERENCES DEVICE(DeviceID),
    FOREIGN KEY (ActivatedBy) REFERENCES IT_STAFF(StaffID)
);

-- Table for GROUP_POLICY
CREATE TABLE GROUP_POLICY (
    PolicyID INT PRIMARY KEY,
    DepartmentID INT,
    PolicyName VARCHAR(255) NOT NULL,
    PolicyDetails TEXT,
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);
