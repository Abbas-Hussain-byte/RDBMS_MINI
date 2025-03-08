
CREATE TABLE driver (
    driver_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    phone_number VARCHAR2(15) UNIQUE NOT NULL,
    license_number VARCHAR2(20) UNIQUE NOT NULL
);

CREATE TABLE bus (
    bus_id NUMBER PRIMARY KEY,
    bus_number VARCHAR2(10) NOT NULL,
    bus_type VARCHAR2(20) NOT NULL, -- e.g., ac, non_ac, luxury
    capacity NUMBER NOT NULL,
    driver_id NUMBER NOT NULL,
    CONSTRAINT fk_bus_driver FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
    CONSTRAINT chk_bus_capacity CHECK (capacity > 0)
);

CREATE TABLE stops (
    stop_id NUMBER PRIMARY KEY,
    stop_name VARCHAR2(50) NOT NULL UNIQUE
);

CREATE TABLE route (
    route_id NUMBER PRIMARY KEY,
    start_stop VARCHAR2(50) NOT NULL,
    end_stop VARCHAR2(50) NOT NULL,
    total_fare NUMBER NOT NULL,
    total_duration NUMBER NOT NULL, -- duration in minutes
    CONSTRAINT chk_route_fare CHECK (total_fare >= 0),
    CONSTRAINT chk_route_duration CHECK (total_duration > 0)
);

CREATE TABLE route_stops (
    route_stop_id NUMBER PRIMARY KEY,
    route_id NUMBER NOT NULL,
    stop_id NUMBER NOT NULL,
    stop_order NUMBER NOT NULL, -- order of the stops on the route
    CONSTRAINT fk_rs_route FOREIGN KEY (route_id) REFERENCES route(route_id),
    CONSTRAINT fk_rs_stop FOREIGN KEY (stop_id) REFERENCES stops(stop_id),
    CONSTRAINT chk_stop_order CHECK (stop_order > 0)
);

CREATE TABLE schedule (
    schedule_id NUMBER PRIMARY KEY,
    bus_id NUMBER NOT NULL,
    route_id NUMBER NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    CONSTRAINT fk_schedule_bus FOREIGN KEY (bus_id) REFERENCES bus(bus_id),
    CONSTRAINT fk_schedule_route FOREIGN KEY (route_id) REFERENCES route(route_id),
    CONSTRAINT chk_schedule_time CHECK (arrival_time > departure_time)
);


commit;