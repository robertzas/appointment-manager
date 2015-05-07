--set the serverouput on.
SET SERVEROUTPUT ON;


--call FIND NEXT TIME
--10001 is the employee we want
--10 is the service we want, it takes 45 minutes
--0 == afternoon, 1 == morning
--date we want the service
DECLARE
   foundBegin timestamp;
   foundEnd timestamp;
BEGIN
  findNextTime(10001, 10, 0, to_timestamp('2015-05-04','YYYY-MM-DD'),foundBegin,foundEnd);
  dbms_output.put_line('*** RETURNED FROM FIND NEXT TIME ***** ');
  dbms_output.put_line('foundBegintime: ' || foundBegin);
END;


--make a reservation
--(employee_id IN NUMBER, customer_id IN NUMBER, service_id IN NUMBER, reservationStartTime IN TIMESTAMP, comments IN STRING, coupon IN STRING) AS
DECLARE
  reservationNumber NUMBER;
BEGIN
  createReservation(10001, 1005, 10, to_timestamp('2015-05-04 13:00','YYYY-MM-DD HH24:MI'),null, 'XtraSav5', reservationNumber);
  dbms_output.put_line('reservationNumber: ' || reservationNumber);
 
END;



--this will execute sickCall sproc with a given date.
execute sickCall(10001, to_timestamp('2015-05-04','YYYY-MM-DD'));

--this will back out those changes so you can run it again
update reservation set is_cancelled = 0
where is_cancelled = 1;
delete from cancellation where 1=1;
commit;



--Get the Employee's schedule
variable rc refcursor;
exec getEmployeeReservationList(to_timestamp('2015-04-01', 'YYYY-MM-DD'),to_timestamp('2015-04-30' ,'YYYY-MM-DD'),10001, :rc);
print rc;

--Get the Customer's History
variable rc refcursor;
exec getCustomerHistory(to_timestamp('2015-01-01', 'YYYY-MM-DD'),to_timestamp('2015-04-30' ,'YYYY-MM-DD'),1000, :rc);
print rc;



--we should probably do error checking, but we don't! 
rollback;


delete reservation
where id > 100;
commit;
