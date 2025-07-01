USE RentalDB;

#Subquery in SELECT: Show properties with their rent + average rent (scalar subquery)
SELECT PropertyID,Title,RentAmount,
(SELECT ROUND(AVG(RentAmount), 2) FROM Properties WHERE RentAmount IS NOT NULL) AS AvgRentAcrossProperties
FROM Properties;

#Subquery in WHERE using IN: Properties in cities where bookings exist
SELECT Title, RentAmount
FROM Properties
WHERE LocationID IN (
    SELECT P.LocationID
    FROM Properties P
    JOIN Bookings B ON P.PropertyID = B.PropertyID
);

#Subquery in WHERE using EXISTS: Owners with at least one booked property
SELECT Name
FROM Owners O
WHERE EXISTS (
    SELECT 1
    FROM Properties P
    JOIN Bookings B ON P.PropertyID = B.PropertyID
    WHERE P.OwnerID = O.OwnerID
);

#Correlated subquery: Renters who booked properties with rent above average
SELECT Name
FROM Renters R
WHERE EXISTS (
    SELECT 1
    FROM Bookings B
    JOIN Properties P ON B.PropertyID = P.PropertyID
    WHERE B.RenterID = R.RenterID
      AND P.RentAmount > (SELECT AVG(RentAmount) FROM Properties WHERE RentAmount IS NOT NULL)
);

#Subquery in FROM (derived table): Total rent by city
SELECT City, SUM(RentAmount) AS TotalRentCollected
FROM (
    SELECT L.City, P.RentAmount
    FROM Properties P
    JOIN Locations L ON P.LocationID = L.LocationID
) AS RentDetails
GROUP BY City;

#Subquery in WHERE using = : Properties with rent equal to max rent
SELECT Title, RentAmount
FROM Properties
WHERE RentAmount = (
    SELECT MAX(RentAmount) FROM Properties
);

#Scalar subquery in SELECT: Payment with % of max payment
SELECT 
  PaymentID,
  AmountPaid,
  ROUND((AmountPaid / (SELECT MAX(AmountPaid) FROM Payments WHERE AmountPaid IS NOT NULL)) * 100, 2) AS PercentOfMax
FROM Payments
WHERE AmountPaid IS NOT NULL;

#Correlated subquery with filtering: Renters who booked properties in their city
SELECT R.Name
FROM Renters R
WHERE EXISTS (
    SELECT 1
    FROM Bookings B
    JOIN Properties P ON B.PropertyID = P.PropertyID
    JOIN Locations L ON P.LocationID = L.LocationID
    WHERE B.RenterID = R.RenterID 
      AND L.City IN (
          SELECT L2.City
          FROM Properties P2
          JOIN Locations L2 ON P2.LocationID = L2.LocationID
          JOIN Bookings B2 ON P2.PropertyID = B2.PropertyID
          WHERE B2.RenterID = R.RenterID
      )
);

#Subquery with NOT EXISTS: Properties never booked
SELECT Title
FROM Properties P
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bookings B
    WHERE B.PropertyID = P.PropertyID
);

#Subquery inside SELECT: Total bookings per renter (scalar correlated subquery)
SELECT 
  Name,
  (SELECT COUNT(*) FROM Bookings B WHERE B.RenterID = R.RenterID) AS TotalBookings
FROM Renters R;
