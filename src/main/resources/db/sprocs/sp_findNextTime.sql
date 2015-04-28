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