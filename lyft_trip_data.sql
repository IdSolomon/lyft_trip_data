-- first thing's first, examining the three tables --

SELECT *
FROM trips;

SELECT *
FROM riders;

SELECT *
FROM cars;

-- the primary key for trips, riders, and cars is 'id' --

-- trying out a simple cross join between riders and cars --

SELECT *
FROM riders
CROSS JOIN cars;

-- finding the columns to join between trips and riders --
-- combining the two tables using a LEFT JOIN by letting trips be the left table --

SELECT *
FROM trips
LEFT JOIN riders
    ON trips.rider_id = riders.id;

-- the result had a lot of columns, so --
-- suppose I only wanted certain columns --

SELECT trips.date, 
    trips.pickup, 
    trips.dropoff, 
    trips.type, 
    trips.cost,
    riders.first, 
    riders.last,
    riders.username
FROM trips
LEFT JOIN riders 
    ON trips.rider_id = riders.id;

-- finding the columns to join on and combine --
-- the trips and cars table using an INNER JOIN --

SELECT *
FROM trips
JOIN cars
    ON trips.car_id = cars.id;

-- stacking the riders table on top of the new table named riders2 --

SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

-- finding the average cost for a trip --

SELECT AVG(cost)
FROM trips;

-- rounding out the average cost for a trip by 2 decimal places --

SELECT ROUND(AVG(cost), 2)
FROM trips;

-- finding all the riders who have used Lyft less than 500 times --

SELECT *
FROM riders
WHERE total_trips < 500;

-- finding all the riders who have used Lyft less than 500 times --
-- from 'riders' and 'riders2' --

SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

-- calculating the number of cars that are active --

SELECT COUNT(*)
FROM cars
WHERE status = 'active';

-- finding two cars that have the highest trips_completed --

SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;