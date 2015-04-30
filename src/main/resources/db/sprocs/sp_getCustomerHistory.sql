create or replace procedure getCustomerHistory 
(fromdatetime IN timestamp, todatetime IN timestamp, customerid IN number, cust_cursor out SYS_REFCURSOR )
as

fromtime timestamp := fromdatetime;
totime timestamp  := todatetime;

BEGIN

  if (fromdatetime is null) then 
    fromtime := add_months(sysdate,-3);
    totime := sysdate;
  end if;

open cust_cursor for 
SELECT r.*
      from reservation r
      where r.person_fk = customerid
      and r.start_timestamp between fromtime and totime;

END;
