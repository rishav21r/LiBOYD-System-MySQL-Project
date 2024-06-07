# Data Definitions and Normalization

## Data Definitions
Detailed data definitions for all entities are listed below.

### EMPLOYEE

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| EmployeeID      | INT          | PRIMARY KEY   | Unique identifier for each employee.         |
| FirstName       | VARCHAR(255) | NOT NULL      | Employee's first name.                       |
| MiddleInitial   | CHAR(1)      |               | Employee's middle initial.                   |
| LastName        | VARCHAR(255) | NOT NULL      | Employee's last name.                        |
| Title           | VARCHAR(255) |               | Professional title of the employee (Mr., Ms.)|
| CorporateEmail  | VARCHAR(50)  | NOT NULL      | Employee's corporate email address.          |
| CorporatePhone  | VARCHAR(20)  |               | Employee's corporate phone number.           |
| PersonalPhone   | VARCHAR(20)  |               | Employee's personal phone number.            |
| DepartmentID    | INT          | FOREIGN KEY   | ID linking to the employee's department.     |

### DEPARTMENT

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| DepartmentID    | INT          | PRIMARY KEY   | Unique identifier for each department.       |
| Name            | VARCHAR(255) | NOT NULL      | Name of the department.                      |
| MailboxNumber   | INT          |               | Mailbox number assigned to the department.   |
| PhoneNumber     | VARCHAR(20)  |               | Contact phone number for the department.     |

### DEVICE

| Attribute         | Data Type    | Constraints   | Description                                |
|-------------------|--------------|---------------|--------------------------------------------|
| DeviceID          | INT          | PRIMARY KEY   | Unique identifier for each device.         |
| Brand             | VARCHAR(255) | NOT NULL      | Brand of the device.                       |
| Model             | VARCHAR(255) | NOT NULL      | Model of the device.                       |
| Value             | DECIMAL(10,2)|               | Monetary value of the device in euros.     |
| RegistrationDate  | DATE         | NOT NULL      | Date when the device was registered.       |
| DisposalDate      | DATE         |               | Date when the device was disposed of.      |
| EmployeeID        | INT          | FOREIGN KEY   | ID of the employee to whom the device is assigned. |

### LOCATION

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| LocationID      | INT          | PRIMARY KEY   | Unique identifier for a location.            |
| BuildingName    | VARCHAR(255) |               | Name of the building.                        |
| OfficeNumber    | VARCHAR(50)  |               | Number of the office.                        |

### DESKTOP

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| DeviceID        | INT          | PRIMARY KEY, FOREIGN KEY | Unique identifier for a desktop device, references DEVICE. |
| StaticIP        | VARCHAR(15)  |                          | Static IP address of the desktop.            |
| LocationID      | INT          | FOREIGN KEY              | Location of the desktop, references LOCATION.|

### MOBILE_DEVICE

| Attribute           | Data Type    | Constraints   | Description                                  |
|---------------------|--------------|---------------|----------------------------------------------|
| DeviceID            | INT          | PRIMARY KEY, FOREIGN KEY | Unique identifier for a mobile device, references DEVICE. |
| ScreenLockEnabled   | BOOLEAN      |               | Indicates if the screen lock is enabled.     |
| IsEncrypted         | BOOLEAN      |               | Indicates if the device is encrypted.        |

### ASSET_REGISTER

| Attribute         | Data Type    | Constraints   | Description                                  |
|-------------------|--------------|---------------|----------------------------------------------|
| AssetID           | INT          | PRIMARY KEY   | Unique identifier for an asset.              |
| DeviceID          | INT          | FOREIGN KEY   | Associated device ID, references DEVICE.     |
| AcquisitionDate   | DATE         |               | Date when the asset was acquired.            |
| DisposalDate      | DATE         |               | Date when the asset was disposed of.         |

### DEVICE_TYPE

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| DeviceTypeID    | INT          | PRIMARY KEY   | Unique identifier for a device type.         |
| TypeName        | VARCHAR(255) | NOT NULL      | Name of the device type.                     |

### SERVICE

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| ServiceID       | INT          | PRIMARY KEY   | Unique identifier for a service.             |
| Name            | VARCHAR(255) | NOT NULL      | Name of the service.                         |
| Description     | TEXT         |               | Description of the service.                  |

### SERVICE_ACCESS

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| ServiceID       | INT          | PRIMARY KEY, FOREIGN KEY | ID of the service, references SERVICE.   |
| EmployeeID      | INT          | PRIMARY KEY, FOREIGN KEY | ID of the employee, references EMPLOYEE. |
| AccessApprovalDate | DATE      |               | Date when access was approved for the employee.|

### PROJECT_MEMBERSHIP

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| ProjectID       | INT          | PRIMARY KEY, FOREIGN KEY | Identifier for the project, references PROJECT. |
| EmployeeID      | INT          | PRIMARY KEY, FOREIGN KEY | Identifier for the employee, references EMPLOYEE. |
| RoleID          | INT          | FOREIGN KEY   | Identifier for the role, references the ROLE table. |

### PROJECT

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| ProjectID       | INT          | PRIMARY KEY   | Unique identifier for a project.             |
| Name            | VARCHAR(255) | NOT NULL      | Name of the project.                         |
| Description     | TEXT         |               | Description of the project.                  |
| StartDate       | DATE         |               | Start date of the project.                   |
| EndDate         | DATE         |               | End date of the project.                     |

### ROLE

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| RoleID          | INT          | PRIMARY KEY   | Unique identifier for a role.                |
| Description     | TEXT         |               | Description of the role.                     |

### OPERATING_SYSTEM

| Attribute               | Data Type    | Constraints   | Description                                  |
|-------------------------|--------------|---------------|----------------------------------------------|
| OSID                    | INT          | PRIMARY KEY   | Unique identifier for an operating system.   |
| OperatingSystem         | VARCHAR(255) | NOT NULL      | Name of the operating system.                |
| OperatingSystemVersion  | VARCHAR(60)  |               | Version of the operating system.             |

### DEVICE_HISTORY

| Attribute               | Data Type    | Constraints   | Description                                  |
|-------------------------|--------------|---------------|----------------------------------------------|
| HistoryID               | INT          | PRIMARY KEY   | Unique identifier for a device history record. |
| DeviceID                | INT          | FOREIGN KEY   | ID of the device, references DEVICE.         |
| PreviousDeviceTypeID    | INT          | FOREIGN KEY   | Previous type of the device, references DEVICE_TYPE. |
| PreviousOSID            | INT          | FOREIGN KEY   | Previous operating system of the device, references OPERATING_SYSTEM. |
| ChangeDate              | DATE         |               | Date when the change was recorded.           |
| ChangedBy               | INT          | FOREIGN KEY   | ID of the employee who recorded the change, references EMPLOYEE. |

### DEVICE_APPROVAL

| Attribute               | Data Type    | Constraints   | Description                                  |
|-------------------------|--------------|---------------|----------------------------------------------|
| ApprovalID              | INT          | PRIMARY KEY   | Unique identifier for a device approval record. |
| DeviceID                | INT          | FOREIGN KEY   | ID of the device, references DEVICE.         |
| ApprovalStatusID        | INT          | FOREIGN KEY   | Status of the approval, references APPROVAL_STATUS_CODE. |
| ApprovalDate            | DATE         |               | Date when the device was approved.           |

### APPROVAL_STATUS_CODE

| Attribute               | Data Type    | Constraints   | Description                                  |
|-------------------------|--------------|---------------|----------------------------------------------|
| ApprovalStatusID        | INT          | PRIMARY KEY   | Unique identifier for an approval status.    |
| StatusCode              | INT          |               | Numeric code for the status.                 |
| StatusDescription       | VARCHAR(50)  |               | Description of the status.                   |

### DEVICE_ACTIVATION

| Attribute               | Data Type    | Constraints   | Description                                  |
|-------------------------|--------------|---------------|----------------------------------------------|
| ActivationID            | INT          | PRIMARY KEY   | Unique identifier for a device activation.   |
| DeviceID                | INT          | FOREIGN KEY   | Identifier for the device, references DEVICE.|
| ActivationDate          | DATE         | NOT NULL      | Date when the device was activated.          |
| ActivatedBy             | INT          | FOREIGN KEY   | Identifier for the IT staff who activated the device, references IT_STAFF. |

### IT_STAFF

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| StaffID         | INT          | PRIMARY KEY   | Unique identifier for an IT staff.           |
| FirstName       | VARCHAR(255) | NOT NULL      | First name of the IT staff.                  |
| LastName        | VARCHAR(255) | NOT NULL      | Last name of the IT staff.                   |
| Email           | VARCHAR(255) | NOT NULL      | Email address of the IT staff.               |

### GROUP_POLICY

| Attribute       | Data Type    | Constraints   | Description                                  |
|-----------------|--------------|---------------|----------------------------------------------|
| PolicyID        | INT          | PRIMARY KEY   | Unique identifier for a group policy.        |
| DepartmentID    | INT          | FOREIGN KEY   | Identifier for the department, references DEPARTMENT. |
| PolicyName      | VARCHAR(255) | NOT NULL      | Name of the group policy.                    |
| PolicyDetails   | TEXT         |               | Details of the group policy.                 |

## Normalization

### First Normal Form (1NF)
An entity is in 1NF if it meets the following criteria:
- Contains only atomic individual values, meaning each column is indivisible.
- Each column has a unique name.
- The values in each column are of the same data type.
- Each row is unique.

### Second Normal Form (2NF)
An entity is in 2NF if:
- It is already in 1NF, and
- All non-key attributes are fully functionally dependent on the primary key.

### Third Normal Form (3NF)
An entity is in 3NF if:
- It is already in 2NF, and
- There are no transitive relationships between non-key attributes.

### Examples Demonstrating Normalization

#### First Normal Form (1NF)
In the EMPLOYEE entity, each field contains only atomic values:
- EmployeeID
- FirstName
- MiddleInitial
- LastName
- Title
- CorporateEmail
- CorporatePhone
- PersonalPhone
- DepartmentID

#### Second Normal Form (2NF)
The SERVICE_ACCESS entity has a composite primary key (ServiceID, EmployeeID). The AccessApprovalDate is fully dependent on the entire composite key.

#### Third Normal Form (3NF)
In the DEVICE entity, all attributes are directly dependent on the primary key DeviceID:
- Brand
- Model
- Value
- RegistrationDate
- DisposalDate
- EmployeeID

All entities in the ERD comply with 3NF, ensuring that the design is free of redundancy and ensures data integrity.
