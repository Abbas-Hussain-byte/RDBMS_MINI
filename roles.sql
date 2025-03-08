CREATE ROLE end_user_role;
CREATE ROLE dba_bus_role;

GRANT SELECT ON DBA_BUS_VIEW TO dba_bus_role;

GRANT SELECT ON user_view TO end_user_role;

