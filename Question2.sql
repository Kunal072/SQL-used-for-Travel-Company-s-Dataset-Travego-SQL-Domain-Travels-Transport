-- 2.	(Medium) Perform read operation on the designed table created in the above task using SQL script. 

-- a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?

SELECT Gender, COUNT(*) AS Count_of_Passengers
FROM Passenger
WHERE Distance >= 600
GROUP BY Gender;


-- b.	Find the minimum ticket price of a Sleeper Bus. 

SELECT MIN(Price) AS MinimumTicketPrice
FROM price
WHERE Bus_type = 'Sleeper';


-- c.	Select passenger names whose names start with character 'S' 

SELECT Passenger_name
FROM Passenger
WHERE Passenger_name LIKE 'S%';


-- d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

SELECT
    p.Passenger_name,
    p.Boarding_City,
    p.Destination_City,
    p.Bus_Type,
    pr.Price AS Price_Charged
FROM Passenger p
JOIN price pr ON p.Bus_Type = pr.Bus_type AND p.Distance = pr.Distance;


-- e.	What is the passenger’s name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 

SELECT
    passenger.passenger_name,
    price.price AS Ticket_Price
FROM passenger
JOIN price ON passenger.Bus_Type = price.Bus_type AND passenger.distance = price.distance
WHERE Passenger.Distance = 1000 AND Passenger.Bus_Type = 'Sitting';

 
-- f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT
    p.Bus_Type,
    pr.Price AS Ticket_Price
FROM Passenger p
JOIN price pr ON p.Bus_Type = pr.Bus_type 
WHERE p.Passenger_name = 'Pallavi' AND p.Boarding_City = 'Bengaluru' AND p.Destination_City = 'Panaji';


-- g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 

SELECT DISTINCT Distance
FROM Passenger
ORDER BY Distance DESC;


-- h.	Display the passenger’s name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables 

SELECT
    Passenger.Passenger_name,
    (Passenger.Distance * 100.0 / TotalDistance.Total_Distance) AS Percentage_of_Total_Distance
FROM Passenger 
JOIN (
    SELECT SUM(Distance) AS Total_Distance
    FROM Passenger
) AS TotalDistance ON 1=1;
