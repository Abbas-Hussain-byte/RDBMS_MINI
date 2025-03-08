CREATE OR REPLACE VIEW user_view AS
SELECT 
    b.bus_number,
    b.bus_type,
    b.capacity,
    r.start_stop,
    r.end_stop,
    r.total_fare,
    r.total_duration,
    s.departure_time,
    s.arrival_time
FROM 
    bus b
JOIN 
    schedule s ON b.bus_id = s.bus_id
JOIN 
    route r ON s.route_id = r.route_id
JOIN 
    driver d ON b.driver_id = d.driver_id

WITH READ ONLY;


CREATE OR REPLACE FORCE NONEDITIONABLE VIEW dba_bus_view AS 
  SELECT 
    b.bus_number,
    d.name AS driver_name,
    s.departure_time,
    s.arrival_time,
    r.start_stop,
    r.end_stop,
    r.total_fare,
    r.total_duration,
    b.capacity,
    b.bus_type,
    d.phone_number AS driver_phone
FROM route r
JOIN schedule s ON r.route_id = s.route_id
JOIN bus b ON s.bus_id = b.bus_id
JOIN driver d ON b.driver_id = d.driver_id;

commit;