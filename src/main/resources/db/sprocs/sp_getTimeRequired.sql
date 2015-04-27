create or replace PROCEDURE getTimeRequired (employee_id IN NUMBER, service_id IN NUMBER, timeRequired OUT NUMBER) AS
     
   BEGIN
      SELECT time_required into timeRequired FROM EMPLOYEE_SERVICE es
      WHERE es.EMPLOYEE_ID = getTimeRequired.employee_id
      and es.SERVICE_ID = getTimeRequired.service_id;
      
      DBMS_OUTPUT.PUT_LINE('Time required is ' || timeRequired);
      
      
   END;