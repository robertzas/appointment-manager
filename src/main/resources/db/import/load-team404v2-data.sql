delete from cancellation where 1=1;
commit;

delete from reservation where 1=1;
commit;

delete employee_service where 1=1;
commit;

delete schedule where 1=1;
commit;

delete employee where 1=1;
commit;

delete person where 1=1;
commit;

delete location where 1=1;
commit;

delete service where 1=1;
commit;

--delete from day_of_week where 1=1;
--commit;





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

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (100,'10001', '10', 45, 45.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (101,'10001', '15', 30, 35.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (102,'10001', '20', 120, 110.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (103,'10001', '25', 90, 85.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (104,'10002', '10', 45, 35.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (105,'10002', '15', 30, 35.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (106,'10002', '20', 110, 110.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (107,'10002', '25', 80, 85.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (108,'10003', '35', 30, 15.00);

insert into employee_service  (id, employee_id, service_id, time_required, cost)
values (109,'10004', '35', 30, 20.00);

commit;

-- day of week --


--insert into day_of_week (name, description)
--values ('MON', 'Monday');
--insert into day_of_week (name, description)
--values ('TUES', 'Tuesday');
--insert into day_of_week (name, description)
--values ('WED', 'Wednesday');
--insert into day_of_week (name, description)
--values ('THUR', 'Thursday');
--insert into day_of_week (name, description)
--values ('FRI', 'Friday');
--insert into day_of_week (name, description)
--values ('SAT', 'Saturday');
--insert into day_of_week (name, description)
--values ('SUN', 'Sunday');
--
--commit;

-- employee schedule --


insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(1, '10001', 'MON',10,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(2, '10001', 'TUE',10,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(3, '10001', 'WED',10,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(4, '10001', 'THU',10,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(5, '10001', 'FRI',10,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(6, '10001', 'SAT',00,00,00,00,00,00,00,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(7, '10001', 'SUN',00,00,00,00,00,00,00,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(8, '10002', 'MON',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(9, '10002', 'TUE',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(10, '10002', 'WED',9,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(11, '10002', 'THU',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(12, '10002', 'FRI',10,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(13, '10002', 'SAT',00,00,00,00,00,00,00,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(14, '10002', 'SUN',00,00,00,00,00,00,00,00);

--1003
insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(15, '10003', 'MON',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(16, '10003', 'TUE',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(17, '10003', 'WED',9,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(18, '10003', 'THU',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(19, '10003', 'FRI',10,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(20, '10003', 'SAT',00,00,00,00,00,00,00,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(21, '10003', 'SUN',00,00,00,00,00,00,00,00);

--1004


insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(22, '10004', 'MON',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(23, '10004', 'TUE',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(24, '10004', 'WED',9,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(25, '10004', 'THU',9,00,12,00,13,00,16,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(26, '10004', 'FRI',10,00,12,00,13,00,18,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(27, '10004', 'SAT',00,00,00,00,00,00,00,00);

insert into schedule (id, employee_id, day_of_week, start_am_hour, start_am_minute, end_am_hour, end_am_minute, start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute)
values(28, '10004', 'SUN',00,00,00,00,00,00,00,00);

commit;
  
  
insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(1, 45.00,'none','',to_timestamp('2015-04-15 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-04-15 11:00', 'YYYY-MM-DD HH24:MI'), 45.00, 5.00, 100,1000,100,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(2, 45.00,'none','',to_timestamp('2015-03-15 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-03-15 10:45', 'YYYY-MM-DD HH24:MI'), 45.00, 5.00, 100,1000,100,0);


insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(3, 45.00,'none','',to_timestamp('2015-04-16 11:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-03-15 10:45', 'YYYY-MM-DD HH24:MI'), 45.00, 5.00, 100,1001,100,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(4, 45.00,'none','',to_timestamp('2015-04-16 13:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-03-15 13:45', 'YYYY-MM-DD HH24:MI'), 45.00, 5.00, 100,1002,100,0);


insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(10, 80.00,'none','',to_timestamp('2015-02-11 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-02-11 12:00', 'YYYY-MM-DD HH24:MI'), 80.00, 15.00, 100,1000,102,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(11, 80.00,'none','',to_timestamp('2015-02-12 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-02-12 12:00', 'YYYY-MM-DD HH24:MI'), 80.00, 15.00, 100,1003,102,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(12, 80.00,'none','',to_timestamp('2015-02-14 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-02-14 12:00', 'YYYY-MM-DD HH24:MI'), 80.00, 10.00, 100,1004,102,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(13, 15.00,null,null,to_timestamp('2015-05-14 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-05-14 12:00', 'YYYY-MM-DD HH24:MI'), null, null, 100,1004,108,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(14, 15.00,null,null,to_timestamp('2015-05-04 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-05-04 12:00', 'YYYY-MM-DD HH24:MI'), null, null, 100,1004,108,0);

insert into reservation (id, price_quoted, customer_comments,coupon_code,start_timestamp, end_timestamp, amount_paid, tip, location_fk, person_fk, 
employee_service_id, is_cancelled)
values(15, 15.00,null,null,to_timestamp('2015-05-08 10:00', 'YYYY-MM-DD HH24:MI'),to_timestamp('2015-05-08 12:00', 'YYYY-MM-DD HH24:MI'), null, null, 100,1005,108,0);


commit;


