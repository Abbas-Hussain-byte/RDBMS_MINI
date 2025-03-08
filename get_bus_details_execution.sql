SET SERVEROUTPUT ON
SET VERIFY OFF

-- Prompt the user for input
-- ACCEPT start_stop PROMPT 'Enter value for start_stop: '
-- ACCEPT end_stop PROMPT 'Enter value for end_stop: '
-- ACCEPT sort_order PROMPT 'Enter value for sort_order: '

DECLARE
    v_start_stop VARCHAR2(50) := '&start_stop';
    v_end_stop   VARCHAR2(50) := '&end_stop';
    v_sort_order VARCHAR2(20) := '&sort_order';
BEGIN
    get_bus_details(v_start_stop, v_end_stop, v_sort_order);
END;
/
