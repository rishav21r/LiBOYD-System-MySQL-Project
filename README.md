# LiBOYD System MySQL Project

## Background

Life Insurance Co. decided to introduce a "bring your own device" (BYOD) model as part of their post-COVID "Work from Home" policy. Employees can use personal devices such as laptops, tablets, and smartphones to connect to the company network. The IT department aims to ensure cybersecurity compliance for all devices. The following are the business rules and requirements for the LiBOYD system.

- **Departments:** Employees work for specific departments, each having a unique code, name, mailbox number, and phone number.
- **Projects:** New projects are created to address business issues. Each project has a name, description, start and end dates.
- **Devices:** Devices can be desktops or mobile devices. Each device must be registered and approved before connecting to the network.
- **Employee Access:** Employees must get permission to access special services, which are tracked by the system.

### Business Rules

The system ensures that:
- Only registered and approved devices can connect to the network.
- Each device must comply with the IT department's cybersecurity policies.
- Devices are activated only after meeting all security requirements.

## Project Approach

### Step 1: Creating the ERD Diagram

The first step was to identify the key entities and their attributes based on the project requirements. This was documented in the data definition file, which includes detailed data definitions for each entity.

### Step 2: Designing the Database Schema

Using the identified entities and attributes, an Entity-Relationship Diagram (ERD) was created. The ERD provides a visual representation of the database schema, showing how different entities are related to each other.

![LiBOYD ERD](./ERD/LiBoyd_ERD.png)

### Step 3: Implementing the Database in MySQL

With the ERD as a blueprint, the next step was to implement the database schema in MySQL. This involved creating tables for each entity and defining their relationships.

Path: [Database Creation Script](./SQL_Scripts/LiBoyd_create_script.sql)

#### Example Snippet:
```sql
CREATE TABLE `EMPLOYEE` (
  `EmployeeID` INT PRIMARY KEY,
  `FirstName` VARCHAR(255) NOT NULL,
  `MiddleInitial` CHAR(1),
  `LastName` VARCHAR(255) NOT NULL,
  `Title` VARCHAR(255),
  `CorporateEmail` VARCHAR(50) NOT NULL,
  `CorporatePhone` VARCHAR(20),
  `PersonalPhone` VARCHAR(20),
  `DepartmentID` INT,
  FOREIGN KEY (`DepartmentID`) REFERENCES `DEPARTMENT`(`DepartmentID`)
);

CREATE TABLE `DEPARTMENT` (
  `DepartmentID` INT PRIMARY KEY,
  `Name` VARCHAR(255) NOT NULL,
  `MailboxNumber` INT,
  `PhoneNumber` VARCHAR(20)
);
```

### Step 3: Inserting Mock Data

Mock data was inserted into the tables to demonstrate the system's functionality. This data serves as sample records to test and validate the database operations.

Path: [Database Insertion Script](./SQL_Scripts/LiBoyd_insert_script.sql)

#### Example Snippet:
```sql
INSERT INTO `EMPLOYEE` (`EmployeeID`, `FirstName`, `MiddleInitial`, `LastName`, `Title`, `CorporateEmail`, `CorporatePhone`, `PersonalPhone`, `DepartmentID`) VALUES
(1, 'John', 'A', 'Doe', 'Mr.', 'john.doe@lifeinsuranceco.com', '555-1234', '555-5678', 1),
(2, 'Jane', 'B', 'Smith', 'Ms.', 'jane.smith@lifeinsuranceco.com', '555-8765', '555-4321', 2);

INSERT INTO `DEPARTMENT` (`DepartmentID`, `Name`, `MailboxNumber`, `PhoneNumber`) VALUES
(1, 'Sales and Marketing', 101, '555-1010'),
(2, 'Compliance and Legal', 102, '555-2020');

```

### Step 4: Verifying the Database Schema
After creating the database schema in MySQL, the schema was reverse-engineered to generate an Entity-Relationship Model (ERM). This step verified that the ERD and ERM models match, ensuring the correct database creation.

![LiBOYD ERD Reverse Engineered](./ERD/LiByod_ERD_Reverse_engg.png)
