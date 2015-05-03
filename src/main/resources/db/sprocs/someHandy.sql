--this will execute sickCall sproc with a given date.
execute sickCall(10001, to_timestamp('2015-05-04','YYYY-MM-DD'));


--this will back out those changes so you can run it again
update reservation set is_cancelled = 0
where is_cancelled = 1;
delete from cancellation where 1=1;
commit;

--we should probably do error checking, but we don't! 
rollback;
