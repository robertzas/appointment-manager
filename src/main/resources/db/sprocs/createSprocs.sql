
create or replace PROCEDURE SICKCALL (employee_id IN NUMBER, todayDate IN TIMESTAMP)
AS
BEGIN
  NULL;
END SICKCALL;


--create or replace procedure callInSick(employeeID IN integer, weekday)

--Begin 
--pull the employee's schedule for the day
--pull all the appointments on that schedule
--update all the appointment services to SICK



--getTimeRequired

create or replace PROCEDURE getTimeRequired (employee_id IN NUMBER, service_id IN NUMBER, timeRequired OUT NUMBER) AS
     
   BEGIN
      SELECT time_required into timeRequired FROM EMPLOYEE_SERVICE es
      WHERE es.EMPLOYEE_ID = getTimeRequired.employee_id
      and es.SERVICE_ID = getTimeRequired.service_id;
      
      DBMS_OUTPUT.PUT_LINE('Time required is ' || timeRequired);
      
      
   END;



--getEmployeeSchedule

create or replace PROCEDURE getEmployeeSchedule (employee_id IN NUMBER, requestDate IN timestamp, morning IN number, start_ts OUT timestamp, end_ts OUT timestamp) AS
     start_hour char(2) ;
     start_minute char(2);
     end_hour char(2);
     end_minute char(2);
     dayofweek varchar(10);
     wantedDate timestamp := requestDate;
     wantedDateStr varchar(25);
     startDateStr varchar(25);
     endDateStr varchar(25);
     
   BEGIN
     if (requestDate is null ) then 
       select (sysdate + 1) into wantedDate from dual;
     end if;
     
     select to_char(wantedDate, 'DY') into dayofweek from dual;
     DBMS_OUTPUT.PUT_LINE('dayofweek ' || dayofweek);
     
     if morning = 1 then
        SELECT start_am_hour, start_am_minute, end_am_hour, end_am_minute
        into start_hour, start_minute, end_hour, end_minute
        from schedule s
        where s.employee_id = getEmployeeSchedule.employee_id
        and s.day_of_week = dayofweek;
      else 
       SELECT start_pm_hour, start_pm_minute, end_pm_hour, end_pm_minute
        into start_hour, start_minute, end_hour, end_minute
        from schedule s
        where s.employee_id = getEmployeeSchedule.employee_id
        and s.day_of_week = dayofweek;
     end if;
    
      DBMS_OUTPUT.PUT_LINE('start_hour ' || start_hour);
      DBMS_OUTPUT.PUT_LINE('end_hour ' || end_hour);
      DBMS_OUTPUT.PUT_LINE('start_minute ' || start_minute);
      DBMS_OUTPUT.PUT_LINE('end_minute ' || end_minute);
      
      select to_char(wantedDate, 'YYYY-MM-DD ') into wantedDateStr from dual;
      startdateStr := concat (concat (wanteddateStr, start_hour),start_minute);
      
      DBMS_OUTPUT.PUT_LINE('startdateStr ' || startdateStr);
      select to_timestamp( startdateStr, 'YYYY-MM-DD HH24:MI') into start_ts from dual;
      
      endDateStr := concat (concat (wanteddateStr, end_hour),end_minute);
      DBMS_OUTPUT.PUT_LINE('endDateStr ' || endDateStr);
      select to_timestamp( endDateStr, 'YYYY-MM-DD HH24:MI') into end_ts from dual;
      
   END;



--reservationList


create or replace procedure getEmployeeReservationList
(fromdatetime IN timestamp, todatetime IN timestamp, employeeid IN number, emp_cursor out SYS_REFCURSOR )
as

fromtime timestamp := fromdatetime;
totime timestamp  := todatetime;

BEGIN

  if (todatetime is null) then 
    totime := sysdate + 7;
    fromtime := sysdate;
  end if;

open emp_cursor for 
SELECT r.*
from reservation r, employee_service es
      where r.employee_service_id = es.id
      and es.employee_id = employeeid
      and r.start_timestamp between fromtime and totime;

END;



--getCustomerHistory

create or replace procedure getCustomerHistory 
(fromdatetime IN timestamp, todatetime IN timestamp, customerid IN number, cust_cursor out SYS_REFCURSOR )
as

fromtime timestamp := fromdatetime;
totime timestamp  := todatetime;

BEGIN

  if (fromdatetime is null) then 
    fromtime := add_months(sysdate,-3);
    totime := sysdate;
  end if;

open cust_cursor for 
SELECT r.*
      from reservation r
      where r.person_fk = customerid
      and r.start_timestamp between fromtime and totime;

END;



--findnext available time 

create or replace PROCEDURE findNextTime (employee_id NUMBER, service_id NUMBER, morning NUMBER, serviceDate TIMESTAMP) AS
      timeRequired  NUMBER(19,0);
      beginTimestamp TIMESTAMP;
      endTimestamp TIMESTAMP;
      appointmentEndTime TIMESTAMP;
      
   BEGIN
      
      getTimeRequired(employee_id, service_id, timeRequired);
      getEmployeeSchedule(employee_id, serviceDate, morning, beginTimestamp, endTimestamp); 
      
      
      DBMS_OUTPUT.PUT_LINE('Time to do service is ' || timeRequired);
      DBMS_OUTPUT.PUT_LINE('end time ' || endTimestamp  );
      DBMS_OUTPUT.PUT_LINE('beg time ' || beginTimestamp  );
      
      SELECT beginTimestamp + numtodsinterval(timeRequired, 'minute') into appointmentEndTime FROM dual;
      DBMS_OUTPUT.PUT_LINE('appointmentEndTime ' || appointmentEndTime  );
      
      


--calculate appointmentEndTime = beginTimestamp + requiredTime;
--if appointmentEndTime < givenTimestamp then
--select * from reservation where beginTimestamp + timerequred is between reservationBegin and reservationEnd 
--and reservation.employee_id = employee_id  
--else return "no appt time available"
--endif
--if no reservations found, then good to go time is available.
--if reservation is found, then take then endTimestamp of the reservation
--loop through again with appointmentEndTime = newEndTimestamp + requiredTime;
     
   END;
