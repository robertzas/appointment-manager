--Create a Reservation
--IN  :  employee_id, customer_id, service_id, reservationStartTime, comments, coupon
--OUT : reservationId
create or replace PROCEDURE createReservation (employee_id IN NUMBER, customer_id IN NUMBER, service_id IN NUMBER, 
  reservationStartTime IN TIMESTAMP, comments IN STRING, coupon IN STRING, reservationId OUT NUMBER) AS
      
    thecost number(19,0);
    timeRequired number(19,0);
    es_id number(19,0);
    location_id number(19,0);
    reservationEndTime timestamp;
    
   BEGIN
   
    --find service quote amount and time required and employee_service_id
   select cost, time_required, id into thecost, timeRequired, es_id
   from employee_service es
   where es.employee_id = createReservation.employee_id
   and es.service_id = createReservation.service_id;
   
    DBMS_OUTPUT.PUT_LINE('thecost ' || thecost);
    DBMS_OUTPUT.PUT_LINE('timeRequired ' ||  timeRequired  );
    DBMS_OUTPUT.PUT_LINE('es_id ' || es_id  );
    
    --find employee location
   select preferred_location_id into location_id 
   from person p, employee e
   where e.person_id = p.id
   and e.id = createReservation.employee_id;
   
   DBMS_OUTPUT.PUT_LINE('location_id ' || location_id);
   
  
    --calculate necessary time for appointment.
   SELECT reservationStartTime + numtodsinterval(timeRequired, 'minute') into reservationEndTime FROM dual;
      DBMS_OUTPUT.PUT_LINE('reservationStartTime ' || reservationStartTime  );
      DBMS_OUTPUT.PUT_LINE('reservationEndTime ' || reservationEndTime  );
      
   reservationId := reservation_seq.nextval;
   INSERT INTO RESERVATION columns (id, price_quoted, customer_comments, coupon_code, start_timestamp,
    end_timestamp, amount_paid, tip, location_fk, person_fk, employee_service_id, is_cancelled)
    VALUES (reservationId, thecost, comments, coupon, reservationStartTime, reservationEndTime, null, null, location_id, customer_id, 
    es_id,0);
    
    commit;
  
   EXCEPTION 
    WHEN OTHERS THEN
      reservationId := null;
      DBMS_OUTPUT.PUT_LINE('ERROR! Insert into reservation failed'  );
      rollback;
    
  END;