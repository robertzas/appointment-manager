create or replace PROCEDURE findNextTime (employee_id NUMBER, service_id NUMBER, morning NUMBER, serviceDate TIMESTAMP) AS
      timeRequired  NUMBER(19,0);
      beginTimestamp TIMESTAMP;
      endTimestamp TIMESTAMP;
   BEGIN
      
      getTimeRequired(employee_id, service_id, timeRequired);
      getEmployeeSchedule(employee_id, serviceDate, morning, beginTimestamp, endTimestamp); 
      
      DBMS_OUTPUT.PUT_LINE('Time to do service is ' || timeRequired);
      DBMS_OUTPUT.PUT_LINE('end time ' || endTimestamp  );
      DBMS_OUTPUT.PUT_LINE('beg time ' || beginTimestamp  );
     
      
      
   END;