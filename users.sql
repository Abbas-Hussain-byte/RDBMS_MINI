CREATE USER end_user IDENTIFIED BY null;
CREATE USER bus_admin IDENTIFIED BY system123;

alter user end_user IDENTIFIED by end_user;
GRANT CREATE SESSION TO end_user;
GRANT CREATE SESSION TO bus_admin;


GRANT end_user_role TO end_user;
GRANT dba_bus_role TO bus_admin;

connect end_user/end_user;
select * from user_view;

