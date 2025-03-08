CREATE TABLE bus_schedule (
    schedule_id NUMBER PRIMARY KEY,
    bus_id NUMBER NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    status VARCHAR2(20) DEFAULT 'Scheduled'
);

CREATE OR REPLACE TRIGGER update_bus_status
BEFORE UPDATE ON bus_schedule
FOR EACH ROW
BEGIN
    -- Check if arrival_time has passed and status is still 'Scheduled'
    IF :NEW.arrival_time < CURRENT_TIMESTAMP AND :NEW.status = 'Scheduled' THEN
        :NEW.status := 'Completed';
    END IF;
END;
/


-- Insert a test record
INSERT INTO bus_schedule (schedule_id, bus_id, departure_time, arrival_time)
VALUES (1, 101, TO_TIMESTAMP('2024-12-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
              TO_TIMESTAMP('2024-12-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO bus_schedule (schedule_id, bus_id, departure_time, arrival_time)
VALUES (2, 102, TO_TIMESTAMP('2024-12-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),
              TO_TIMESTAMP('2024-12-04 11:45:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Simulate an update to trigger the condition
UPDATE bus_schedule
SET arrival_time = TO_TIMESTAMP('2024-12-03 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE schedule_id = 1;

-- Check the updated status
SELECT * FROM bus_schedule;
