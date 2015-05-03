create or replace TRIGGER SICKEMAIL 
BEFORE UPDATE ON RESERVATION
FOR EACH ROW
WHEN (new.is_CANCELLED = 1)

DECLARE
   cancelId number := :new.ID;
   employeeId number;
   personId number := :new.person_fk;
BEGIN

  SELECT es.employee_id into employeeId 
  FROM EMPLOYEE_SERVICE es
  WHERE es.id = :new.employee_service_id;
  
  DBMS_OUTPUT.PUT_LINE('employee id is: ' || employeeId);
  
  INSERT INTO CANCELLATION 
  Values (cancelId, cancelId, 'SICK', employeeId);
  
  DBMS_OUTPUT.PUT_LINE('Emails sent out to cancelled appointment for ' || personId);
END;
