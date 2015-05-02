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
