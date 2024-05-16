-- Создание таблицы Customer (Клиент)
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PassportNumber VARCHAR(50) NOT NULL,
    DrivingLicenseNumber VARCHAR(50) NOT NULL
);

-- Создание таблицы Car (Автомобиль)
CREATE TABLE Car (
    CarID SERIAL PRIMARY KEY,
    LicensePlate VARCHAR(20) NOT NULL,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Vin VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    CurrentMileage INT NOT NULL,
    Status VARCHAR(20) NOT NULL
);

-- Создание таблицы Employee (Сотрудник)
CREATE TABLE Employee (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary NUMERIC(10, 2) NOT NULL,
    PassportNumber VARCHAR(50) NOT NULL
);

-- Создание таблицы Maintenance (Обслуживание)
CREATE TABLE Maintenance (
    MaintenanceID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Cost NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы RentalAgreement (Договор аренды)
CREATE TABLE RentalAgreement (
    RentalAgreementID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    TotalAmount NUMERIC(10, 2) NOT NULL,
    AgreementDate DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    Deposit NUMERIC(10, 2) NOT NULL,
    Details VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Создание таблицы CarMaintenanceIntegration (Интеграция автомобиля и обслуживания)
CREATE TABLE CarMaintenanceIntegration (
    UniqueID SERIAL PRIMARY KEY,
    CarID INT NOT NULL,
    MaintenanceID INT NOT NULL,
    NumberOfMaintenance INT NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (MaintenanceID) REFERENCES Maintenance(MaintenanceID)
);

-- Создание таблицы EmployeeMaintenanceIntegration (Интеграция сотрудника и обслуживания)
CREATE TABLE EmployeeMaintenanceIntegration (
    UniqueID SERIAL PRIMARY KEY,
    EmployeeID INT NOT NULL,
    MaintenanceID INT NOT NULL,
    NumberOfMaintenance INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (MaintenanceID) REFERENCES Maintenance(MaintenanceID)
);
