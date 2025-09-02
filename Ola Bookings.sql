CREATE Database Ola;
Use Ola;


#1.  Retretive all successful bookling: 

Create View Successful_Booking AS
SELECT * FROM booking
WHERE Booking_Status = 'Success';


Select * From Successful_Bookings;



#2. Find the average distance of vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM booking
GROUP BY Vehicle_Type;

# Find the average distance of vehicle type:
SELECT * FROM ride_distance_for_each_vehicle;


#3. Get the total number of cancelled rides by customers:

CREATE VIEW cancle_rides_by_customers AS
SELECT Customer_ID, COUNT(*) AS total_cancle_rides
FROM booking
WHERE Booking_Status = 'Cancled by Customer'
GROUP BY Customer_ID;

SELECT * FROM cancle_rides_by_customers;




#4 List the top 5 customer who booked the highest number of rides;

CREATE VIEW highest_number_of_rides_booking AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM booking
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM highest_number_of_rides_booking;


#5. Get the number of rides canceled by drivers due to personal and car related issues.
CREATE VIEW Max_Min_Driver_Rating AS
SELECT COUNT(*) 
FROM booking
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Max_Min_Driver_Rating;




# 6. Find the maximum and minimum driver ratings for prime sedan booking


CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM booking 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;


#7. Retrieve all rides where payment was made using UPI

CREATE VIEW UPI_Payment AS
SELECT * FROM booking
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;




#8. Find the average Customer rating per vehicle type.

CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM booking
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;




#9. Calcualate the total booking value of rides completed successifully.

CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM booking
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_ride_value;



# 10. List all incomplete rides along with the reason.

CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM booking
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;

