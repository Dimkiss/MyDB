-- 1. Получение всех клиентов, зарегистрированных после 1 января 1990 года, упорядоченных по дате рождения
SELECT *
FROM Customer
WHERE DateOfBirth > '1990-01-01'
ORDER BY DateOfBirth;

-- 2. Подсчет количества автомобилей каждой марки
SELECT Make, COUNT(*) AS CarCount
FROM Car
GROUP BY Make
ORDER BY CarCount DESC;

-- 3. Получение всех активных договоров аренды вместе с информацией о клиентах и автомобилях
SELECT RentalAgreement.*, Customer.FirstName, Customer.LastName, Car.Make, Car.Model
FROM RentalAgreement
JOIN Customer ON RentalAgreement.CustomerID = Customer.CustomerID
JOIN Car ON RentalAgreement.CarID = Car.CarID
WHERE RentalAgreement.Status = 'Active';

-- 4. Получение среднего пробега автомобилей по каждому году выпуска
SELECT Year, AVG(CurrentMileage) AS AvgMileage
FROM Car
GROUP BY Year
ORDER BY Year;

-- 5. Получение всех сотрудников, нанятых после 1 января 2018 года, упорядоченных по дате найма
SELECT *
FROM Employee
WHERE HireDate > '2018-01-01'
ORDER BY HireDate;

-- 6. Подсчет количества услуг обслуживания, выполненных каждым сотрудником
SELECT Employee.FirstName, Employee.LastName, COUNT(*) AS MaintenanceCount
FROM Employee
JOIN EmployeeMaintenanceIntegration ON Employee.EmployeeID = EmployeeMaintenanceIntegration.EmployeeID
GROUP BY Employee.EmployeeID
HAVING COUNT(*) > 0
ORDER BY MaintenanceCount DESC;

-- 7. Получение всех клиентов, у которых есть активные договоры аренды, с суммарной стоимостью аренды
SELECT Customer.FirstName, Customer.LastName, SUM(RentalAgreement.TotalAmount) AS TotalSpent
FROM Customer
JOIN RentalAgreement ON Customer.CustomerID = RentalAgreement.CustomerID
WHERE RentalAgreement.Status = 'Active'
GROUP BY Customer.CustomerID
ORDER BY TotalSpent DESC;

-- 8. Получение всех автомобилей, которые были обслужены больше двух раз
SELECT Car.*
FROM Car
JOIN CarMaintenanceIntegration ON Car.CarID = CarMaintenanceIntegration.CarID
GROUP BY Car.CarID
HAVING COUNT(CarMaintenanceIntegration.MaintenanceID) > 2;

-- 9. Получение всех договоров аренды, заключенных в 2023 году, с информацией о клиентах и сотрудниках
SELECT RentalAgreement.*, Customer.FirstName AS CustomerFirstName, Customer.LastName AS CustomerLastName,
       Employee.FirstName AS EmployeeFirstName, Employee.LastName AS EmployeeLastName
FROM RentalAgreement
JOIN Customer ON RentalAgreement.CustomerID = Customer.CustomerID
JOIN Employee ON RentalAgreement.EmployeeID = Employee.EmployeeID
WHERE RentalAgreement.AgreementDate BETWEEN '2023-01-01' AND '2023-12-31';

-- 10. Получение автомобилей с самой высокой суммарной стоимостью обслуживания
SELECT Car.Make, Car.Model, SUM(Maintenance.Cost) AS TotalMaintenanceCost
FROM Car
JOIN CarMaintenanceIntegration ON Car.CarID = CarMaintenanceIntegration.CarID
JOIN Maintenance ON CarMaintenanceIntegration.MaintenanceID = Maintenance.MaintenanceID
GROUP BY Car.CarID
ORDER BY TotalMaintenanceCost DESC
LIMIT 10;
