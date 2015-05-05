create or replace TRIGGER SICKEMAIL 
BEFORE UPDATE ON RESERVATION
FOR EACH ROW
WHEN (new.is_CANCELLED = 1)

DECLARE
   cancelId number := cancellation_seq.nextval;
   employeeId number;
   personId number := :new.person_fk;
BEGIN

  SELECT es.employee_id into employeeId 
  FROM EMPLOYEE_SERVICE es
  WHERE es.id = :new.employee_service_id;
  
  DBMS_OUTPUT.PUT_LINE('employee id is: ' || employeeId);
  
  INSERT INTO CANCELLATION columns (id, reservation_id, reason, cancelled_by_id)
  values (cancelId, :new.ID, 'SICK', employeeId);
  
  DBMS_OUTPUT.PUT_LINE('Emails sent out to cancelled appointment for ' || personId);
END;
