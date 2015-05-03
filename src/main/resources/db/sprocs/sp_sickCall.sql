create or replace PROCEDURE SICKCALL (employee_id IN NUMBER, cancelDate IN TIMESTAMP)
AS
  sickdatefrom TIMESTAMP;
  sickdateto TIMESTAMP;
BEGIN

  IF (cancelDate is null) THEN
    select cast(trunc(sysdate) as timestamp) into sickdatefrom from dual;
    select cast(trunc(sysdate +1) as timestamp) into sickdateto from dual;
  ELSE
    select cast(trunc(cancelDate) as timestamp) into sickdatefrom from dual;
    select cast(trunc(cancelDate +1) as timestamp) into sickdateto from dual;
  END IF;
  
  UPDATE RESERVATION r
  SET r.IS_CANCELLED = 1
  WHERE  r.id in 
      (SELECT r.id FROM RESERVATION r, employee_service es
         where r.employee_service_id = es.id
         and es.employee_id = sickcall.employee_id
         and 
         r.start_timestamp between sickdatefrom and sickdateto
         and is_cancelled = 0
      );
  commit;

END SICKCALL;

--get employee schedule
--find appointments on schedule
--update to cancelled
