delete employee_service where 1=1;
commit;
delete schedule where 1=1;
commit;
delete employee where 1=1;
commit;

delete location where 1=1;
commit;

delete service where 1=1;
commit;

--delete from day_of_week where 1=1;
commit;



insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('100', 'abc hair studio', '300 walnut st', '201', 'boulder', 'CO', '80002',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('200', 'xyz nail studio', '400 walnut st', '101', 'boulder', 'CO', '80002',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('300', 'Hair designs', '4000 simpson st', '101', 'boulder', 'CO', '80002',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('400', 'Sally''s Salon', '7200 gregory st', 'suite 5', 'georgetown', 'CO', '80005',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('500', 'Nails R Us', '4300 walker st', 'suite 1', 'golden', 'CO', '80100',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('600', 'All about U', '2033 starlight st', 'suite 33', 'denver', 'CO', '80023',null); 

insert into location (
id, name, address_line1, address_line2, city, state_code, zip_code, geolocation_dms)
values ('700', 'Fantastik Sam''s', '204 pitkin st', 'suite 10', 'georgetown', 'CO', '80005',null); 

commit;

--load service--



insert into service (
  id, service, is_active)
  values (10, 'hair cut', 1);
  
  insert into service (
  id, service, is_active)
  values (15, 'hair shampoo/blowdry', 1);
  
  insert into service (
  id, service, is_active)
  values (20, 'full highlights', 1);
  
  insert into service (
  id, service, is_active)
  values (25, 'partial highlights', 1);
  
  insert into service (
  id, service, is_active)
  values (30, 'bang cut', 1);
  
  insert into service (
  id, service, is_active)
  values (35, 'spa manicure', 1);
  
   insert into service (
  id, service, is_active)
  values (40, 'spa pedicure', 1);
  
   insert into service (
  id, service, is_active)
  values (45, 'foot massage', 1);
  
   insert into service (
  id, service, is_active)
  values (50, 'special occasion styling', 1);
  
  insert into service (
  id, service, is_active)
  values (55, 'nail polish change', 1);
  
  insert into service (
  id, service, is_active)
  values (60, 'nail designs', 1);
  
  insert into service (
  id, service, is_active)
  values (9000, 'time off', 1);
  
  commit;
  
  
  --load persons ---


  insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1000', 'Sally', 'Jones', 'saljones@me.com', '3032221111','100', 'sjones', 'encryptme', sysdate);
    
    insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1001', 'Samantha', 'Smith', 'samsmith@me.com', '3032221122','100', 'ssmith', 'encryptme', sysdate);
  
  
  insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1002', 'Jill', 'Simpson', 'jsimpson@me.com', '3032221122','100', 'jsimpson', 'encryptme', sysdate);
    
    
    insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1003', 'Tim', 'Jacobs', 'tj@me.com', '303222311','200', 'tjacobs', 'encryptme', sysdate);
    
    insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1004', 'Darcey', 'Doe', 'ddoe@me.com', '3032221121','300', 'ddoe', 'encryptme', sysdate);
  
  
  insert into person (
      id, first_name, last_name, email_address, phone_number, preferred_location_id, username, password, date_joined)
    values 
    ('1005', 'Olga', 'Brown', 'obrown@me.com', '3032223322','400', 'obrown', 'encryptme', sysdate);
  
commit;
   --load employees ---



insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10000,0,0,1000);

insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10001,0,0,1001);


insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10002,0,1,1002);


insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10003,1,1,1003);

insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10004,1,1,1004);
  
insert into employee (
  id, is_admin, allows_coupons, person_id)
  values 
  (10005,1,1,1005);
  
commit;

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10001', '10', 45, 35.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10001', '15', 30, 35.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10001', '20', 120, 110.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10001', '25', 90, 85.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10002', '10', 45, 35.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10002', '15', 30, 35.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10002', '20', 110, 110.00);

insert into employee_service  (employee_id, service_id, time_required, cost)
values ('10002', '25', 80, 85.00);

commit;

-- day of week --


--insert into day_of_week (name, description)
--values ('MON', 'Monday');
--insert into day_of_week (name, description)
--values ('TUE', 'Tuesday');
--insert into day_of_week (name, description)
--values ('WED', 'Wednesday');
--insert into day_of_week (name, description)
--values ('THU', 'Thursday');
--insert into day_of_week (name, description)
--values ('FRI', 'Friday');
--insert into day_of_week (name, description)
--values ('SAT', 'Saturday');
--insert into day_of_week (name, description)
--values ('SUN', 'Sunday');
--
--commit;

-- employee schedule --


insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'MON',10,00,12,00,13,00,16,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'TUES',10,00,12,00,13,00,16,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'WED',10,00,12,00,13,00,16,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'THUR',10,00,12,00,13,00,16,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'FRI',10,00,12,00,13,00,16,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'SAT',00,00,00,00,00,00,00,00);

insert into schedule (employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values('10001', 'SUN',00,00,00,00,00,00,00,00);


commit;
  
