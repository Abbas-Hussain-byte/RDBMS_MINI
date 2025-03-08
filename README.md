
# DBMS Project: Bus Journey Details

This repository contains a PL/SQL implementation for retrieving bus journey details based on user inputs for start and end stops, as well as the sorting order. The system is designed to handle queries efficiently and provide detailed output regarding the bus journey.

---

## Features

- **User Inputs**:
  - Start Stop
  - End Stop
  - Sorting Order (e.g., by time, fare, etc.)

- **Detailed Output**:
  - Bus Number
  - Bus Type
  - Capacity
  - Start and End Stops
  - Fare
  - Duration
  - Departure and Arrival Times

- **Efficient PL/SQL Procedures**:
  - Implements a stored procedure `get_bus_details2` for querying and formatting the bus details.

---

## Files

1. `bus_details.sql`: Contains the PL/SQL script to execute the stored procedure and fetch bus details.

2. **Usage Instructions**:
    ```sql
    DECLARE
        v_start_stop VARCHAR2(50) := '&start_stop';
        v_end_stop VARCHAR2(50) := '&end_stop';
        v_sort_order VARCHAR2(20) := '&sort_order';
    BEGIN
        get_bus_details2(v_start_stop, v_end_stop, v_sort_order);
    END;
    /
    ```

3. **Sample Execution**:
    - Input:
      - Start Stop: Charminar
      - End Stop: Hitec City
      - Sorting Order: time
    - Output:
      ```
      Bus Number: 225
      Bus Type: Luxury
      Capacity: 40
      Start Stop: Charminar
      End Stop: Hitec City
      Fare: 40
      Duration: 60
      Departure Time: 03/12/2024 08:00:00
      Arrival Time: 03/12/2024 09:00:00
      ```

---

## Prerequisites

- **Database**: Oracle Database or any PL/SQL compatible RDBMS.
- **Tools**: SQL*Plus or any compatible query execution environment.

---

## How to Use

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd dbms-project
