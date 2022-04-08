-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KMs?
SELECT 
    Gender, COUNT(*)
FROM
    passenger
WHERE
    Distance >= 600
GROUP BY passenger.Gender;

-- 4) Find the minimum ticket price for Sleeper Bus.
SELECT 
    MIN(Price)
FROM
    price
WHERE
    Bus_TYPE = 'Sleeper';

-- 5) Select passenger names whose names start with character 'S'
SELECT 
    Passenger_name
FROM
    passenger
WHERE
    Passenger_name LIKE '%S'
        OR Passenger_name LIKE 'S%';

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output
SELECT DISTINCT
    passenger.Passenger_name,
    passenger.Boarding_City,
    passenger.Destination_City,
    passenger.Bus_Type,
    price.Price
FROM
    passenger,
    price
WHERE
    passenger.Bus_Type = price.Bus_Type
        AND passenger.Distance = price.Distance;
-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
-- distance of 1000 KMs.				
SELECT DISTINCT
    Passenger_name, Price
FROM
    passenger,
    price
WHERE
    passenger.Bus_Type = price.Bus_Type
        && passenger.Distance = price.Distance
        AND passenger.Bus_Type = 'Sitting'
        AND passenger.Distance = 1000;
    

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel 
	SELECT DISTINCT p1.Passenger_name, p1.Boarding_city 
    as Destination_city, p1.Destination_city 
    as Boardng_city, 
    p1.Bus_type, p2.Price FROM passenger p1, 
    price p2 WHERE Passenger_name = 'Pallavi'
    and p1.Distance = p2.Distance;


-- 9) List the distances from the "Passenger" table which are unique 
	SELECT DISTINCT
    Distance
FROM
    passenger
ORDER BY Distance DESC;

-- 10) Display the passenger name and percentage of distance travelled by that passenger 
	SELECT 
    Passenger_name,
    Distance * 100.0 / (SELECT 
            SUM(Distance)
        FROM
            passenger)
FROM
    passenger;

-- 11) Display the distance, price in three categories in table Price
	SELECT 
    Distance,
    Price,
    CASE
        WHEN Price >= 1000 THEN 'Expensive'
        WHEN Price < 1000 AND Price >= 500 THEN 'Average Cost'
        WHEN Price < 500 THEN 'Cheap'
    END AS Category
FROM
    Price;