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
       select (sysdate +1) into wantedDate from dual;
     end if;
     
     select to_char(wantedDate, 'DY') into dayofweek from dual;
     
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
