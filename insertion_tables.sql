INSERT INTO stops (stop_id, stop_name) VALUES (1, 'secunderabad');
INSERT INTO stops (stop_id, stop_name) VALUES (2, 'paradise');
INSERT INTO stops (stop_id, stop_name) VALUES (3, 'tadbund');
INSERT INTO stops (stop_id, stop_name) VALUES (4, 'bowenpallyx road');
INSERT INTO stops (stop_id, stop_name) VALUES (5, 'ferozguda');
INSERT INTO stops (stop_id, stop_name) VALUES (6, 'balanagar');
INSERT INTO stops (stop_id, stop_name) VALUES (7, 'prashanth nagar');
INSERT INTO stops (stop_id, stop_name) VALUES (8, 'kukatpally');
INSERT INTO stops (stop_id, stop_name) VALUES (9, 'kphb metro station');
INSERT INTO stops (stop_id, stop_name) VALUES (10, 'jntu x road');
INSERT INTO stops (stop_id, stop_name) VALUES (11, 'nizampet x road');
INSERT INTO stops (stop_id, stop_name) VALUES (12, 'miyapur x road');
INSERT INTO stops (stop_id, stop_name) VALUES (13, 'allwyn x road');
INSERT INTO stops (stop_id, stop_name) VALUES (14, 'chandanagar');
INSERT INTO stops (stop_id, stop_name) VALUES (15, 'lingampally');
INSERT INTO stops (stop_id, stop_name) VALUES (16, 'ashok nagar');
INSERT INTO stops (stop_id, stop_name) VALUES (17, 'beeramguda');
INSERT INTO stops (stop_id, stop_name) VALUES (18, 'patancheruvu');


INSERT INTO driver (driver_id, name, phone_number, license_number)
VALUES (1, 'Rama Chandru', '1234567890', 'TS30Z0021');

INSERT INTO bus (bus_id, bus_number, bus_type, capacity, driver_id)
VALUES (1, '219', 'Metro', 50, 1);

INSERT INTO route (route_id, start_stop, end_stop, total_fare, total_duration)
VALUES (1, 'secunderabad', 'patancheruvu', 50, 80);

-- Insert route stops for bus 219 (Route 1)
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (1, 1, 1, 1); -- secunderabad
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (2, 1, 2, 2); -- paradise
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (3, 1, 3, 3); -- tadbund
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (4, 1, 4, 4); -- bowenpallyx road
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (5, 1, 5, 5); -- ferozguda
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (6, 1, 6, 6); -- balanagar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (7, 1, 7, 7); -- prashanth nagar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (8, 1, 8, 8); -- kukatpally
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (9, 1, 9, 9); -- kphb metro station
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (10, 1, 10, 10); -- jntu x road
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (11, 1, 11, 11); -- nizampet x road
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (12, 1, 12, 12); -- miyapur x road
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (13, 1, 13, 13); -- allwyn x road
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (14, 1, 14, 14); -- chandanagar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (15, 1, 15, 15); -- lingampally
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (16, 1, 16, 16); -- ashok nagar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (17, 1, 17, 17); -- beeramguda
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (18, 1, 18, 18); -- patancheruvu

INSERT INTO schedule (schedule_id, bus_id, route_id, departure_time, arrival_time)
VALUES (1, 1, 1, TO_TIMESTAMP('2024-12-02 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-02 18:45:00', 'YYYY-MM-DD HH24:MI:SS'));
-- commit;

-- Insert new stops from Hyderabad or Telangana
INSERT INTO stops (stop_id, stop_name) VALUES (19, 'Gachibowli');
INSERT INTO stops (stop_id, stop_name) VALUES (20, 'Hitec City');
INSERT INTO stops (stop_id, stop_name) VALUES (21, 'Madhapur');
INSERT INTO stops (stop_id, stop_name) VALUES (22, 'Jubilee Hills');
INSERT INTO stops (stop_id, stop_name) VALUES (23, 'Banjara Hills');
INSERT INTO stops (stop_id, stop_name) VALUES (24, 'Mehdipatnam');
INSERT INTO stops (stop_id, stop_name) VALUES (25, 'Lakdikapul');
INSERT INTO stops (stop_id, stop_name) VALUES (26, 'Ameerpet');
INSERT INTO stops (stop_id, stop_name) VALUES (27, 'Punjagutta');
INSERT INTO stops (stop_id, stop_name) VALUES (28, 'Begumpet');
INSERT INTO stops (stop_id, stop_name) VALUES (29, 'Kondapur');
INSERT INTO stops (stop_id, stop_name) VALUES (30, 'Kothaguda');
INSERT INTO stops (stop_id, stop_name) VALUES (31, 'Charminar');
INSERT INTO stops (stop_id, stop_name) VALUES (32, 'Abids');
INSERT INTO stops (stop_id, stop_name) VALUES (33, 'Afzal Gunj');
INSERT INTO stops (stop_id, stop_name) VALUES (34, 'Koti');
INSERT INTO stops (stop_id, stop_name) VALUES (35, 'Nampally');
INSERT INTO stops (stop_id, stop_name) VALUES (36, 'Khairatabad');

-- Insert new drivers
INSERT INTO driver (driver_id, name, phone_number, license_number)
VALUES (2, 'Syed Ali', '9876543210', 'TS09X1234');
INSERT INTO driver (driver_id, name, phone_number, license_number)
VALUES (3, 'Ramesh Kumar', '9123456780', 'TS10Y5678');
INSERT INTO driver (driver_id, name, phone_number, license_number)
VALUES (4, 'Suresh Reddy', '9988776655', 'TS11Z4321');

-- Insert new buses for each bus type
INSERT INTO bus (bus_id, bus_number, bus_type, capacity, driver_id)
VALUES (2, '225', 'Luxury', 40, 2);
INSERT INTO bus (bus_id, bus_number, bus_type, capacity, driver_id)
VALUES (3, '229', 'Super Luxury', 45, 3);
INSERT INTO bus (bus_id, bus_number, bus_type, capacity, driver_id)
VALUES (4, '47L', 'Metro', 50, 4);

-- Insert new routes
-- Route 2: Charminar to Hitec City
INSERT INTO route (route_id, start_stop, end_stop, total_fare, total_duration)
VALUES (2, 'Charminar', 'Hitec City', 40, 60);

-- Route 3: Gachibowli to Secunderabad
INSERT INTO route (route_id, start_stop, end_stop, total_fare, total_duration)
VALUES (3, 'Gachibowli', 'Secunderabad', 30, 50);

-- Route 4: Mehdipatnam to Patancheruvu
INSERT INTO route (route_id, start_stop, end_stop, total_fare, total_duration)
VALUES (4, 'Mehdipatnam', 'Patancheruvu', 25, 35);

-- Insert route stops for Route 2
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (19, 2, 31, 1); -- Charminar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (20, 2, 33, 2); -- Afzal Gunj
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (21, 2, 34, 3); -- Koti
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (22, 2, 32, 4); -- Abids
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (23, 2, 35, 5); -- Nampally
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (24, 2, 25, 6); -- Lakdikapul
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (25, 2, 36, 7); -- Khairatabad
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (26, 2, 27, 8); -- Punjagutta
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (27, 2, 26, 9); -- Ameerpet
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (28, 2, 21, 10); -- Madhapur
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (29, 2, 20, 11); -- Hitec City

-- Insert route stops for Route 3
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (30, 3, 19, 1); -- Gachibowli
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (31, 3, 30, 2); -- Kothaguda
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (32, 3, 29, 3); -- Kondapur
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (33, 3, 20, 4); -- Hitec City
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (34, 3, 21, 5); -- Madhapur
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (35, 3, 22, 6); -- Jubilee Hills
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (36, 3, 27, 7); -- Punjagutta
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (37, 3, 28, 8); -- Begumpet
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (38, 3, 1, 9);  -- Secunderabad

-- Insert route stops for Route 4
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (39, 4, 24, 1); -- Mehdipatnam
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (40, 4, 15, 2); -- Lingampally
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (41, 4, 14, 3); -- Chandanagar
INSERT INTO route_stops (route_stop_id, route_id, stop_id, stop_order) VALUES (42, 4, 18, 4); -- Patancheruvu

-- Insert schedules for the new routes and buses
INSERT INTO schedule (schedule_id, bus_id, route_id, departure_time, arrival_time)
VALUES (2, 2, 2, TO_TIMESTAMP('2024-12-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO schedule (schedule_id, bus_id, route_id, departure_time, arrival_time)
VALUES (3, 3, 3, TO_TIMESTAMP('2024-12-03 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-03 10:20:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO schedule (schedule_id, bus_id, route_id, departure_time, arrival_time)
VALUES (4, 4, 4, TO_TIMESTAMP('2024-12-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-03 11:35:00', 'YYYY-MM-DD HH24:MI:SS'));
commit;