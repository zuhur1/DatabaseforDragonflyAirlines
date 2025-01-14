This project involves designing and implementing a database system for a fictional airline, Dragonfly Airlines. 
The database includes entities such as routes, airports, luggage, payments, passengers, maintenance requests, services, reservations, aircraft, flight history, flights, flight crew, employees, pilots, gate agents, reviews, and flight attendants. 

Additionally, the database incorporates the following views: 
- AvgPassengerSatisfaction
- LowestRevenueMonths
- DepartureStatusSummary
- AverageTicketPrice

Triggers implemented in the system include: 
- set_passenger_email
- PaymentInsertAfterReservation
- AfterMaintenanceRequestUpdate
- UpdateSeatsAndCheckCapacity

Stored Procedure: 
- GetPassengerbyName: Automates the retrieval of passenger details by full name

Insights derives from queries were: 
- average ticket price is $306
- 65% of flights departed within 15 minutes of scheduled departure time, while 35% departed after 15 minutes of the scheduled departure time
- The 5 months of the year with the lowest revenue were January, April, June, October and November
- 40% of customers did not submit a satisfaction rating 