
insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (1, 'abc hair studio', '300 walnut st', '201', 'boulder', 'CO', '80002',123);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (2, 'xyz nail studio', '400 walnut st', '101', 'boulder', 'CO', '80002',234);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (3, 'Hair designs', '4000 simpson st', '101', 'boulder', 'CO', '80002',345);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (4, 'Sally''s Salon', '7200 gregory st', 'suite 5', 'georgetown', 'CO', '80005',456);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (5, 'Nails R Us', '4300 walker st', 'suite 1', 'golden', 'CO', '80100',567);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (6, 'All about U', '2033 starlight st', 'suite 33', 'denver', 'CO', '80023',678);

insert into location (id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values (7, 'Fantastik Sam''s', '204 pitkin st', 'suite 10', 'georgetown', 'CO', '80005',789);


--load service--

insert into service (id, service_name, is_active)
values (1,'hair cut', 'Y');
  
insert into service (id, service_name, is_active)
values (2,'hair shampoo/blowdry', 'Y');
  
insert into service (id, service_name, is_active)
values (3,'full highlights', 'Y');
  
insert into service (id, service_name, is_active)
values (4,'partial highlights', 'Y');
  
insert into service (id, service_name, is_active)
values (5,'bang cut', 'Y');
  
insert into service (id, service_name, is_active)
values (6,'spa manicure', 'Y');
  
insert into service (id, service_name, is_active)
values (7,'spa pedicure', 'Y');
  
insert into service (id, service_name, is_active)
values (8,'foot massage', 'Y');
  
insert into service (id, service_name, is_active)
values (9,'special occasion styling', 'Y');
  
insert into service (id, service_name, is_active)
values (10,'nail polish change', 'Y');
  
insert into service (id, service_name, is_active)
values (11,'nail designs', 'Y');
  
insert into service (id, service_name, is_active)
values (12,'time off', 'Y');

  
  --load employees ---


insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (1, 'Sally', 'Jones', 'saljones@me.com', '3032221111','100', 'sjones', 'encryptme', sysdate, 'Y');
    
insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (2, 'Samantha', 'Smith', 'samsmith@me.com', '3032221122','100', 'ssmith', 'encryptme', sysdate, 'Y');

insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (3, 'Jill', 'Simpson', 'jsimpson@me.com', '3032221122','100', 'jsimpson', 'encryptme', sysdate, 'Y');
    
insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (4, 'Tim', 'Jacobs', 'tj@me.com', '303222311','200', 'tjacobs', 'encryptme', sysdate, 'Y');
    
insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (5, 'Darcey', 'Doe', 'ddoe@me.com', '3032221121','300', 'ddoe', 'encryptme', sysdate, 'Y');

insert into employee (id, first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values (6, 'Olga', 'Brown', 'obrown@me.com', '3032223322','400', 'obrown', 'encryptme', sysdate, 'Y');

   --load Cost ---

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (1, 45, 35.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (2, 30, 35.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (3, 120, 110.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (4, 90, 85.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (5, 45, 35.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (6, 30, 35.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (7, 110, 110.00);

insert into service_employee  (id, time_required, cost, employee_fk, service_fk)
values (8, 80, 85.00);



-- day of week --


insert into day_of_week (name, description)
values ('MON', 'Monday');
insert into day_of_week (name, description)
values ('TUES', 'Tuesday');
insert into day_of_week (name, description)
values ('WED', 'Wednesday');
insert into day_of_week (name, description)
values ('THUR', 'Thursday');
insert into day_of_week (name, description)
values ('FRI', 'Friday');
insert into day_of_week (name, description)
values ('SAT', 'Saturday');
insert into day_of_week (name, description)
values ('SUN', 'Sunday');

-- employee schedule --


insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('MON',10,00,12,00,13,00,16,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('TUES',10,00,12,00,13,00,16,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('WED',10,00,12,00,13,00,16,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('THUR',10,00,12,00,13,00,16,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('FRI',10,00,12,00,13,00,16,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('SAT',00,00,00,00,00,00,00,00);

insert into employee_schedule (day_of_week_name, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('SUN',00,00,00,00,00,00,00,00);
