
insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('abc hair studio', '300 walnut st', '201', 'boulder', 'CO', '80002',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('xyz nail studio', '400 walnut st', '101', 'boulder', 'CO', '80002',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('Hair designs', '4000 simpson st', '101', 'boulder', 'CO', '80002',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('Sally''s Salon', '7200 gregory st', 'suite 5', 'georgetown', 'CO', '80005',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('Nails R Us', '4300 walker st', 'suite 1', 'golden', 'CO', '80100',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('All about U', '2033 starlight st', 'suite 33', 'denver', 'CO', '80023',null);

insert into location (name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('Fantastik Sam''s', '204 pitkin st', 'suite 10', 'georgetown', 'CO', '80005',null);


--load service--

insert into service (service_name, is_active)
values ('hair cut', 'Y');
  
insert into service (service_name, is_active)
values ('hair shampoo/blowdry', 'Y');
  
insert into service (service_name, is_active)
values ('full highlights', 'Y');
  
insert into service (service_name, is_active)
values ('partial highlights', 'Y');
  
insert into service (service_name, is_active)
values ('bang cut', 'Y');
  
insert into service (service_name, is_active)
values ('spa manicure', 'Y');
  
insert into service (service_name, is_active)
values ('spa pedicure', 'Y');
  
insert into service (service_name, is_active)
values ('foot massage', 'Y');
  
insert into service (service_name, is_active)
values ('special occasion styling', 'Y');
  
insert into service (service_name, is_active)
values ('nail polish change', 'Y');
  
insert into service (service_name, is_active)
values ('nail designs', 'Y');
  
insert into service (service_name, is_active)
values ('time off', 'Y');

  
  
  --load employees ---


insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Sally', 'Jones', 'saljones@me.com', '3032221111','100', 'sjones', 'encryptme', sysdate, 'Y');
    
insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Samantha', 'Smith', 'samsmith@me.com', '3032221122','100', 'ssmith', 'encryptme', sysdate, 'Y');

insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Jill', 'Simpson', 'jsimpson@me.com', '3032221122','100', 'jsimpson', 'encryptme', sysdate, 'Y');
    
insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Tim', 'Jacobs', 'tj@me.com', '303222311','200', 'tjacobs', 'encryptme', sysdate, 'Y');
    
insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Darcey', 'Doe', 'ddoe@me.com', '3032221121','300', 'ddoe', 'encryptme', sysdate, 'Y');

insert into employee (first_name, last_name, email_address, phone_number, location_id, username, password, date_joined, allows_discounts)
values ('Olga', 'Brown', 'obrown@me.com', '3032223322','400', 'obrown', 'encryptme', sysdate, 'Y');

   --load employees ---

insert into service_employee  (service_id, time_required, cost)
values ('10', 45, 35.00);

insert into service_employee  (service_id, time_required, cost)
values ('15', 30, 35.00);

insert into service_employee  (service_id, time_required, cost)
values ('20', 120, 110.00);

insert into service_employee  (service_id, time_required, cost)
values ('25', 90, 85.00);

insert into service_employee  (service_id, time_required, cost)
values ('10', 45, 35.00);

insert into service_employee  (service_id, time_required, cost)
values ('15', 30, 35.00);

insert into service_employee  (service_id, time_required, cost)
values ('20', 110, 110.00);

insert into service_employee  (service_id, time_required, cost)
values ('25', 80, 85.00);



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
