CREATE OR REPLACE PROCEDURE get_bus_details (
    p_start_stop VARCHAR2,
    p_end_stop VARCHAR2,
    p_sort_order VARCHAR2
) IS
    -- Cursor for sorting by departure time
    CURSOR v_bus_cursor_time IS
        SELECT DISTINCT
            b.bus_number,
            b.bus_type,
            b.capacity,
            s.departure_time,
            s.arrival_time,
            r.total_fare,
            r.total_duration
        FROM bus b
        JOIN schedule s ON b.bus_id = s.bus_id
        JOIN route r ON s.route_id = r.route_id
        JOIN route_stops rs_start ON r.route_id = rs_start.route_id
        JOIN stops st_start ON rs_start.stop_id = st_start.stop_id
        JOIN route_stops rs_end ON r.route_id = rs_end.route_id
        JOIN stops st_end ON rs_end.stop_id = st_end.stop_id
        WHERE UPPER(TRIM(st_start.stop_name)) = UPPER(TRIM(p_start_stop))
          AND UPPER(TRIM(st_end.stop_name)) = UPPER(TRIM(p_end_stop))
          AND rs_start.stop_order < rs_end.stop_order
        ORDER BY s.departure_time;

    -- Cursor for sorting by total fare
    CURSOR v_bus_cursor_fare IS
        SELECT DISTINCT
            b.bus_number,
            b.bus_type,
            b.capacity,
            s.departure_time,
            s.arrival_time,
            r.total_fare,
            r.total_duration
        FROM bus b
        JOIN schedule s ON b.bus_id = s.bus_id
        JOIN route r ON s.route_id = r.route_id
        JOIN route_stops rs_start ON r.route_id = rs_start.route_id
        JOIN stops st_start ON rs_start.stop_id = st_start.stop_id
        JOIN route_stops rs_end ON r.route_id = rs_end.route_id
        JOIN stops st_end ON rs_end.stop_id = st_end.stop_id
        WHERE UPPER(TRIM(st_start.stop_name)) = UPPER(TRIM(p_start_stop))
          AND UPPER(TRIM(st_end.stop_name)) = UPPER(TRIM(p_end_stop))
          AND rs_start.stop_order < rs_end.stop_order
        ORDER BY r.total_fare;

    -- Cursor for sorting by bus type (luxury)
    CURSOR v_bus_cursor_luxury IS
        SELECT DISTINCT
            b.bus_number,
            b.bus_type,
            b.capacity,
            s.departure_time,
            s.arrival_time,
            r.total_fare,
            r.total_duration
        FROM bus b
        JOIN schedule s ON b.bus_id = s.bus_id
        JOIN route r ON s.route_id = r.route_id
        JOIN route_stops rs_start ON r.route_id = rs_start.route_id
        JOIN stops st_start ON rs_start.stop_id = st_start.stop_id
        JOIN route_stops rs_end ON r.route_id = rs_end.route_id
        JOIN stops st_end ON rs_end.stop_id = st_end.stop_id
        WHERE UPPER(TRIM(st_start.stop_name)) = UPPER(TRIM(p_start_stop))
          AND UPPER(TRIM(st_end.stop_name)) = UPPER(TRIM(p_end_stop))
          AND rs_start.stop_order < rs_end.stop_order
        ORDER BY b.bus_type;

    -- Record variables to hold fetched data
    v_bus_number     bus.bus_number%TYPE;
    v_bus_type       bus.bus_type%TYPE;
    v_capacity       bus.capacity%TYPE;
    v_departure_time schedule.departure_time%TYPE;
    v_arrival_time   schedule.arrival_time%TYPE;
    v_total_fare     route.total_fare%TYPE;
    v_total_duration route.total_duration%TYPE;

BEGIN
    IF LOWER(p_sort_order) = 'time' THEN
        OPEN v_bus_cursor_time;
        FETCH v_bus_cursor_time INTO v_bus_number, v_bus_type, v_capacity,
                                   v_departure_time, v_arrival_time,
                                   v_total_fare, v_total_duration;
        IF v_bus_cursor_time%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('No buses found for the given route.');
            CLOSE v_bus_cursor_time;
            RETURN;
        END IF;
        LOOP
            -- Display bus details
            DBMS_OUTPUT.PUT_LINE('Bus Number: ' || v_bus_number);
            DBMS_OUTPUT.PUT_LINE('Bus Type: ' || v_bus_type);
            DBMS_OUTPUT.PUT_LINE('Capacity: ' || v_capacity);
            DBMS_OUTPUT.PUT_LINE('Fare: ' || v_total_fare);
            DBMS_OUTPUT.PUT_LINE('Duration: ' || v_total_duration);
            DBMS_OUTPUT.PUT_LINE('Departure Time: ' || TO_CHAR(v_departure_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('Arrival Time: ' || TO_CHAR(v_arrival_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('------------------------------------');
            FETCH v_bus_cursor_time INTO v_bus_number, v_bus_type, v_capacity,
                                       v_departure_time, v_arrival_time,
                                       v_total_fare, v_total_duration;
            EXIT WHEN v_bus_cursor_time%NOTFOUND;
        END LOOP;
        CLOSE v_bus_cursor_time;
    ELSIF LOWER(p_sort_order) = 'fare' THEN
        OPEN v_bus_cursor_fare;
        FETCH v_bus_cursor_fare INTO v_bus_number, v_bus_type, v_capacity,
                                   v_departure_time, v_arrival_time,
                                   v_total_fare, v_total_duration;
        IF v_bus_cursor_fare%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('No buses found for the given route.');
            CLOSE v_bus_cursor_fare;
            RETURN;
        END IF;
        LOOP
            -- Display bus details
            DBMS_OUTPUT.PUT_LINE('Bus Number: ' || v_bus_number);
            DBMS_OUTPUT.PUT_LINE('Bus Type: ' || v_bus_type);
            DBMS_OUTPUT.PUT_LINE('Capacity: ' || v_capacity);
            DBMS_OUTPUT.PUT_LINE('Fare: ' || v_total_fare);
            DBMS_OUTPUT.PUT_LINE('Duration: ' || v_total_duration);
            DBMS_OUTPUT.PUT_LINE('Departure Time: ' || TO_CHAR(v_departure_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('Arrival Time: ' || TO_CHAR(v_arrival_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('------------------------------------');
            FETCH v_bus_cursor_fare INTO v_bus_number, v_bus_type, v_capacity,
                                       v_departure_time, v_arrival_time,
                                       v_total_fare, v_total_duration;
            EXIT WHEN v_bus_cursor_fare%NOTFOUND;
        END LOOP;
        CLOSE v_bus_cursor_fare;
    ELSIF LOWER(p_sort_order) = 'luxury' THEN
        OPEN v_bus_cursor_luxury;
        FETCH v_bus_cursor_luxury INTO v_bus_number, v_bus_type, v_capacity,
                                    v_departure_time, v_arrival_time,
                                    v_total_fare, v_total_duration;
        IF v_bus_cursor_luxury%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('No buses found for the given route.');
            CLOSE v_bus_cursor_luxury;
            RETURN;
        END IF;
        LOOP
            -- Display bus details
            DBMS_OUTPUT.PUT_LINE('Bus Number: ' || v_bus_number);
            DBMS_OUTPUT.PUT_LINE('Bus Type: ' || v_bus_type);
            DBMS_OUTPUT.PUT_LINE('Capacity: ' || v_capacity);
            DBMS_OUTPUT.PUT_LINE('Fare: ' || v_total_fare);
            DBMS_OUTPUT.PUT_LINE('Duration: ' || v_total_duration);
            DBMS_OUTPUT.PUT_LINE('Departure Time: ' || TO_CHAR(v_departure_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('Arrival Time: ' || TO_CHAR(v_arrival_time, 'DD/MM/YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('------------------------------------');
            FETCH v_bus_cursor_luxury INTO v_bus_number, v_bus_type, v_capacity,
                                        v_departure_time, v_arrival_time,
                                        v_total_fare, v_total_duration;
            EXIT WHEN v_bus_cursor_luxury%NOTFOUND;
        END LOOP;
        CLOSE v_bus_cursor_luxury;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid sort order specified.');
    END IF;
END;
/
