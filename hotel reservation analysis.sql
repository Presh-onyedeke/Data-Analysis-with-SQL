SELECT * FROM hotel.`hotel reservation dataset`;

/*question 1: What is the total number of reservations in the dataset? */
select count(room_type_reserved) as total_number_of_reservations
from hotel.`hotel reservation dataset`;

/*question 2: Which meal plan is the most popular among guests?*/
select type_of_meal_plan as most_popular_meal_plan, count(type_of_meal_plan) as number_of_most_popular_meal_plan
from hotel.`hotel reservation dataset`
group by type_of_meal_plan
limit 1;

/*question 3: What is the average price per room for
reservations involving children?*/
select no_of_children, avg(avg_price_per_room) as average_price_per_room
from hotel.`hotel reservation dataset`
where no_of_children > 0
group by no_of_children ;

/*question 4: How many reservations were made for the year 20XX 
(replace XX with the desired year)?*/
select count(room_type_reserved) as number_of_reservation_made_in_2018
from hotel.`hotel reservation dataset`
where arrival_date like  "%2018";

/*question 5: What is the most commonly booked room type?*/
select room_type_reserved as commonly_booked_room, count(room_type_reserved) as number_of_commonly_booked_room
from hotel.`hotel reservation dataset`
group by room_type_reserved
limit 1;

/*question 6: How many reservations fall on a weekend (no_of_weekend_nights > 0)? */
select count(room_type_reserved) as number_of_reservation_that_fall_on_the_weekends
from hotel.`hotel reservation dataset`
where no_of_weekend_nights > 0;

/*question 7: What is the highest and lowest lead time for reservations? */
select max(lead_time) as highest_lead_time, min(lead_time) as lowest_lead_time
from hotel.`hotel reservation dataset`
order by lead_time desc;

/*question 8: What is the most common market segment type for reservations?*/
select market_segment_type as common_market_segment, 
count(market_segment_type) as number_of_market_segement
from hotel.`hotel reservation dataset`
group by market_segment_type
order by market_segment_type desc
limit 1;

/*question 9: How many reservations have a booking status of "Confirmed"? */
select count(room_type_reserved) as number_of_reservations
from hotel.`hotel reservation dataset`
where booking_status = "Confirmed";

/*question 10: What is the total number of adults 
and children across all reservations?*/
select sum(no_of_adults) as number_of_adult, 
sum(no_of_children) as number_of_children
from hotel.`hotel reservation dataset`;

/*question 11: What is the average number of weekend nights
 for reservations involving children?*/
select round(avg(no_of_weekend_nights),1) as average_weekend_night_for_children
from hotel.`hotel reservation dataset`
where no_of_children > 0;

/*question 12: How many reservations were made in each month of the year?*/
select arrival_date, count(room_type_reserved) as number_of_reservations
from hotel.`hotel reservation dataset`
group by arrival_date
order by arrival_date asc;  

/*question 13: What is the average number of nights (both weekend and weekday)
 spent by guests for each room type?*/
select room_type_reserved, round(avg(no_of_weekend_nights),1) as Average_weekend_nights, 
round(avg(no_of_week_nights),1) as Average_week_nights
from hotel.`hotel reservation dataset`
group by room_type_reserved
order by room_type_reserved asc;

/*question 14: For reservations involving children, 
what is the most common room type, and what is the average
price for that room type?*/
select room_type_reserved, round(avg(avg_price_per_room),1) as Average_price_per_room
from hotel.`hotel reservation dataset`
where no_of_children > 0
group by room_type_reserved
order by room_type_reserved asc;

/*question 15: Find the market segment type that
 generates the highest average price per room.*/
select market_segment_type, avg(avg_price_per_room) as Average_price_per_room
from hotel.`hotel reservation dataset`
group by market_segment_type
order by market_segment_type;