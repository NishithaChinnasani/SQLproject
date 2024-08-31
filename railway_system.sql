DROP SCHEMA IF EXISTS railway_system CASCADE;
CREATE SCHEMA IF NOT EXISTS railway_system;

DROP TABLE IF EXISTS railway_system.user_login;
CREATE TABLE IF NOT EXISTS railway_system.user_login (
	user_id VARCHAR(50) PRIMARY KEY,
    user_password VARCHAR(255),
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	sign_up_on DATE,
	email_id VARCHAR(100)
);

DROP TABLE IF EXISTS railway_system.passenger;
CREATE TABLE IF NOT EXISTS railway_system.passenger (
	passenger_id VARCHAR(50) PRIMARY KEY,
    user_password VARCHAR(255),
    first_name VARCHAR(50),
	last_name VARCHAR(50),
	sign_up_on DATE,
	email_id VARCHAR(100),
	contact VARCHAR(15)
);

DROP TABLE IF EXISTS railway_system.train_type;
CREATE TABLE IF NOT EXISTS railway_system.train_type (
	train_type_id VARCHAR(50) PRIMARY KEY,
    train_type VARCHAR(100),
    coaches_count INT,
	passenger_strength INT,
	train_count INT
);

DROP TABLE IF EXISTS railway_system.stations;
CREATE TABLE IF NOT EXISTS railway_system.stations (
	station_id VARCHAR(50) PRIMARY KEY,
    station_name VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(100)
);

DROP TABLE IF EXISTS railway_system.train_details;
CREATE TABLE IF NOT EXISTS railway_system.train_details (
	train_id VARCHAR(50) PRIMARY KEY,
    train_type_id VARCHAR(50) REFERENCES railway_system.train_type (train_type_id),
    source_station_id VARCHAR(50) REFERENCES railway_system.stations (station_id),
	destination_station_id VARCHAR(50) REFERENCES railway_system.stations (station_id),
	duration_minutes INT,
	journey_start TIMESTAMP,
	journey_end TIMESTAMP,
	passenger_strength INT,
	is_available BOOLEAN
);

DROP TABLE IF EXISTS railway_system.journey;
CREATE TABLE IF NOT EXISTS railway_system.journey (
	journey_id VARCHAR(50) PRIMARY KEY,
	passenger_id VARCHAR(50) REFERENCES railway_system.passenger (passenger_id),
	train_id VARCHAR(50) REFERENCES railway_system.train_details (train_id),
    booking_id VARCHAR(50),
	payment_id VARCHAR(50),
	payment_status VARCHAR(50),
	paid_on TIMESTAMP,
	booking_status VARCHAR(50),
	booked_on TIMESTAMP,
	seat_alloted VARCHAR(50),
	meal_booked BOOLEAN
);

DROP TABLE IF EXISTS railway_system.train_routes;
CREATE TABLE IF NOT EXISTS railway_system.train_routes (
	row_id SERIAL PRIMARY KEY,
	route_id VARCHAR(50),
	train_id VARCHAR(50) REFERENCES railway_system.train_details (train_id),
    station_id VARCHAR(50) REFERENCES railway_system.stations (station_id),
	order_number INT,
	halt_duration_minutes INT,
	estimated_arrival TIME,
	estimated_departure TIME
);
