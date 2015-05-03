--------------------------------------------------------
--  File created - Sunday-May-03-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure FINDNEXTTIME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE FINDNEXTTIME (employee_id IN NUMBER, service_id IN NUMBER, morning IN NUMBER, 
  serviceDate IN TIMESTAMP, availableStartTime OUT TIMESTAMP, availableEndTime OUT TIMESTAMP) AS
  
      timeRequired  NUMBER(19,0);
      beginTimestamp TIMESTAMP;
      endTimestamp TIMESTAMP;
      appointmentEndTime TIMESTAMP;
      newEndTS Timestamp;
      
   BEGIN
      
      getTimeRequired(employee_id, service_id, timeRequired);
      getEmployeeSchedule(employee_id, serviceDate, morning, beginTimestamp, endTimestamp); 
      
      
      DBMS_OUTPUT.PUT_LINE('Time to do service is ' || timeRequired);
      DBMS_OUTPUT.PUT_LINE('end time ' || endTimestamp  );
      DBMS_OUTPUT.PUT_LINE('beg time ' || beginTimestamp  );
      
      SELECT beginTimestamp + numtodsinterval(timeRequired, 'minute') into appointmentEndTime FROM dual;
      DBMS_OUTPUT.PUT_LINE('appointmentEndTime ' || appointmentEndTime  );
      
      
      LOOP 
        newEndTs := null;
        DBMS_OUTPUT.PUT_LINE('newEndTS ' ||  newEndTS );
        
        SELECT max(r.end_timestamp)  into newEndTS
        from reservation r, employee_service es 
        where r.employee_service_id = es.id
        and es.employee_id = findNextTime.employee_id
        and  (
           (beginTimestamp >= r.start_timestamp and 
            beginTimestamp < r.end_timestamp)
          or (appointmentEndTime > r.start_timestamp and 
            appointmentEndTime <= r.end_timestamp)
        )
        ;
         
        DBMS_OUTPUT.PUT_LINE('found reservation time: r.end_timestamp ' ||  newEndTS );
         
        IF (newEndTS is not null) THEN
          beginTimestamp := newEndTs;
          DBMS_OUTPUT.PUT_LINE('beginTS ' || beginTimestamp  );
          SELECT beginTimestamp + numtodsinterval(timeRequired, 'minute') into appointmentEndTime FROM dual;
          DBMS_OUTPUT.PUT_LINE('appointmentEndTime ' || appointmentEndTime  );
        END IF;
        
        --if we have exceeded the alloted time the employee works. Just send nulls back.
        DBMS_OUTPUT.PUT_LINE('apptEnd & endofSched ' ||  appointmentEndTime || endTimeStamp );
        IF (appointmentEndTime >= endTimeStamp) THEN
          newEndTs := null;
          beginTimestamp := null;
          appointmentEndTime := null;
        END IF;
        
        EXIT WHEN (newEndTs is null);
        
      END LOOP;
        
        
      DBMS_OUTPUT.PUT_LINE('found reservation time: begin & end ' ||  beginTimestamp || appointmentEndTime );
      availableStartTime := beginTimestamp;
      availableEndTime := appointmentEndTime;
      
--NOTES:
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

/
