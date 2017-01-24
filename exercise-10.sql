CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Hotel (id INT auto_increment primary key, type ENUM('Hotel', 'Janitor Closet', ' Public Laundry Room', 'Gym'), floor_no INT, occupancy_no TINYINT(8), availability_date DATE, has_private_kitchen BOOLEAN, has_carpet BOOLEAN, num_windows TINYINT(8) );

INSERT INTO Hotel VALUES
(null, 'Janitor Closet', 1, null, null, null, null, null), 
(null, 'Public Laundry Room', 1, null, null, null, null, null), 
(null, 'Hotel', 2, 2, '2017-01-23', TRUE, FALSE, 1), 
(null, 'Hotel', 2, 2, '2017-01-23', FALSE, TRUE, 1), 
(null, 'Hotel', 1, 4, '2017-02-01', TRUE, FALSE, 1), 
(null, 'Gym', 2, 15, null, null, null, 4), 
(null, 'Hotel', 1, 2, '2017-01-10', FALSE, TRUE, 1), 
(null, 'Hotel', 3, 8, '2017-02-03', TRUE, FALSE, 2), 
(null, 'Hotel', 3, 8, '2017-01-20', TRUE, FALSE, 2);

--making queries

-- number of rooms total in Hotel
SELECT COUNT(*) FROM Hotel;
-- list of rooms available for rent on specific date
SELECT * FROM Hotel WHERE availability_date <= "2017-01-23";
--list of rooms which can be occupied by at least 3 people on specific date
SELECT * FROM Hotel WHERE occupancy_no >=3 and availability_date <= "2017-01-23";
--amount of unrentable rooms
SELECT SUM(CASE WHEN Type = 'Hotel' THEN 1 ELSE 0 END) AS Hotel FROM Hotel;
--amount of rooms having private kitchen
SELECT * FROM Hotel WHERE type = 'Hotel' AND has_private_kitchen = TRUE;

--total number of windows on floor 3
SELECT SUM(num_windows) FROM Hotel WHERE floor_no=3;

--average amount of windows per floor
SELECT AVG(num_windows) FROM Hotel WHERE floor_no=3;
SELECT floor_no, AVG(num_windows) FROM Hotel GROUP BY floor_no;

--amount of floors having rooms with carpets
SELECT floor_no, SUM(has_carpet) as num_rooms_with_carpets FROM Hotel GROUP BY floor_no;