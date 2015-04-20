CREATE TABLE customer(
    customer_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    first_name    VARCHAR2 (128 CHAR),
    last_name     VARCHAR2 (128 CHAR),
    email_address VARCHAR2 (128 CHAR),
    phone_number  VARCHAR2 (12 CHAR),
    username      VARCHAR2 (32 CHAR),
    password      VARCHAR2 (32 CHAR),
    date_joined   TIMESTAMP,
    location_location_id LONGINTEGER NOT NULL
   );
ALTER TABLE customer
ADD CONSTRAINT customer_PK
PRIMARY KEY (customer_id);

CREATE TABLE employee(
    employee_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    first_name    VARCHAR2 (128 CHAR),
    last_name     VARCHAR2 (128 CHAR),
    email_address VARCHAR2 (128 CHAR),
    phone_number  VARCHAR2 (12 CHAR),
    location_location_id LONGINTEGER NOT NULL,
    username         VARCHAR2 (32 CHAR),
    password         VARCHAR2 (32 CHAR),
    date_joined      TIMESTAMP,
    allows_discounts CHAR (1)
   );
ALTER TABLE employee
ADD CONSTRAINT employee_PK
PRIMARY KEY (employee_id);

CREATE TABLE employee_schedule(
    employee_employee_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    day_of_week        VARCHAR2 (6 CHAR) NOT NULL,
    start_am_timestamp TIMESTAMP,
    end_am_timestamp   TIMESTAMP,
    start_pm_timestamp TIMESTAMP,
    end_pm_timestamp   TIMESTAMP
   );
ALTER TABLE employee_schedule
ADD CONSTRAINT employee_schedule_PK
PRIMARY KEY (day_of_week, employee_employee_id);

CREATE TABLE location(
    location_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    name            VARCHAR2 (128 CHAR),
    address_line1   VARCHAR2 (128 CHAR),
    address_line2   VARCHAR2 (128 CHAR),
    city            VARCHAR2 (128 CHAR),
    state_code      CHAR (2 CHAR),
    zip_code        VARCHAR2 (12 CHAR),
    geolocation_dms VARCHAR2 (32 CHAR)
   );
ALTER TABLE location
ADD CONSTRAINT location_PK
PRIMARY KEY (location_id);

CREATE TABLE reservation(
    reservation_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    customer_customer_id LONGINTEGER NOT NULL,
    employee_employee_id LONGINTEGER NOT NULL,
    service_service_id LONGINTEGER NOT NULL,
    location_location_id LONGINTEGER NOT NULL,
    start_timestamp   TIMESTAMP,
    end_timestamp     TIMESTAMP,
    price_quoted      NUMBER (7,2),
    customer_comments VARCHAR2 (500 CHAR),
    amount_paid       NUMBER (7,2),
    coupon_code       VARCHAR2 (10 CHAR),
    tip               NUMBER (7,2)
   );
ALTER TABLE reservation
ADD CONSTRAINT reservation_PK
PRIMARY KEY (reservation_id);

CREATE TABLE service(
    service_id LONGINTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    service_name VARCHAR2 (128 CHAR),
    is_active    CHAR (1)
);
ALTER TABLE service
ADD CONSTRAINT service_PK
PRIMARY KEY (service_id);

CREATE TABLE service_employee(
    employee_employee_id NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    service_service_id LONGINTEGER NOT NULL,
    time_required INTEGER,
    cost          NUMBER (7,2)
 );
ALTER TABLE service_employee
    ADD CONSTRAINT service_employee_PK
    PRIMARY KEY (service_service_id, employee_employee_id);

ALTER TABLE customer
    ADD CONSTRAINT customer_location_FK
    FOREIGN KEY (location_location_id)
    REFERENCES location(location_id);

ALTER TABLE employee
    ADD CONSTRAINT employee_location_FK
    FOREIGN KEY (location_location_id)
    REFERENCES location(location_id);

ALTER TABLE employee_schedule
    ADD CONSTRAINT employee_schedule_employee_FK
    FOREIGN KEY (employee_employee_id)
    REFERENCES employee(employee_id);

ALTER TABLE reservation
    ADD CONSTRAINT reservation_customer_FK
    FOREIGN KEY (customer_customer_id)
    REFERENCES customer(customer_id);

ALTER TABLE reservation
    ADD CONSTRAINT reservation_employee_FK
    FOREIGN KEY (employee_employee_id)
    REFERENCES employee(employee_id);

ALTER TABLE reservation
    ADD CONSTRAINT reservation_location_FK
    FOREIGN KEY (location_location_id)
    REFERENCES location(location_id);

ALTER TABLE reservation
    ADD CONSTRAINT reservation_service_FK
    FOREIGN KEY (service_service_id)
    REFERENCES service(service_id);

ALTER TABLE service_employee
    ADD CONSTRAINT service_employee_employee_FK
    FOREIGN KEY (employee_employee_id)
    REFERENCES employee(employee_id);

ALTER TABLE service_employee
    ADD CONSTRAINT service_employee_service_FK
    FOREIGN KEY (service_service_id)
    REFERENCES service(service_id);