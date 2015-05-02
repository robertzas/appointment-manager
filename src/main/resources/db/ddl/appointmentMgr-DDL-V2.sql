-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-05-01 09:51:06 MDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE CANCELLATION CASCADE CONSTRAINTS ;

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS ;

DROP TABLE EMPLOYEE_SERVICE CASCADE CONSTRAINTS ;

DROP TABLE LOCATION CASCADE CONSTRAINTS ;

DROP TABLE PERSON CASCADE CONSTRAINTS ;

DROP TABLE RESERVATION CASCADE CONSTRAINTS ;

DROP TABLE SCHEDULE CASCADE CONSTRAINTS ;

DROP TABLE SERVICE CASCADE CONSTRAINTS ;

CREATE TABLE CANCELLATION
  (
    ID              NUMBER (19) NOT NULL ,
    RESERVATION_ID  NUMBER (19) NOT NULL ,
    REASON          VARCHAR2 (255) ,
    CANCELLED_BY_ID NUMBER (19) NOT NULL
  ) ;
ALTER TABLE CANCELLATION ADD CONSTRAINT CANCELLATION_PK PRIMARY KEY ( ID ) ;

CREATE TABLE EMPLOYEE
  (
    ID             NUMBER (19) NOT NULL ,
    IS_ADMIN       NUMBER (1) ,
    ALLOWS_COUPONS NUMBER (1) ,
    PERSON_ID      NUMBER (19) NOT NULL
  ) ;
CREATE UNIQUE INDEX UK_PERSON_IDX ON EMPLOYEE
  (
    PERSON_ID ASC
  )
  ;
  ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_PK PRIMARY KEY ( ID ) ;
  ALTER TABLE EMPLOYEE ADD CONSTRAINT UK_PERSON_UNIQUE_CONSTRAINT UNIQUE ( PERSON_ID ) ;

CREATE TABLE EMPLOYEE_SERVICE
  (
    ID            NUMBER (19) NOT NULL ,
    EMPLOYEE_ID   NUMBER (19) NOT NULL ,
    SERVICE_ID    NUMBER (19) NOT NULL ,
    COST          NUMBER (19) NOT NULL ,
    TIME_REQUIRED NUMBER (19) ,
    IS_ACTIVE     NUMBER (1)
  ) ;
ALTER TABLE EMPLOYEE_SERVICE ADD CONSTRAINT EMPLOYEE_SERVICE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE EMPLOYEE_SERVICE ADD CONSTRAINT EMPLOYEE_SERVICE__UNIQ UNIQUE ( EMPLOYEE_ID , SERVICE_ID ) ;

CREATE TABLE LOCATION
  (
    ID              NUMBER (19) NOT NULL ,
    NAME            VARCHAR2 (255) ,
    ADDRESS_LINE1   VARCHAR2 (255) ,
    ADDRESS_LINE2   VARCHAR2 (255) ,
    CITY            VARCHAR2 (255) ,
    STATE_CODE      CHAR (2) ,
    ZIP_CODE        VARCHAR2 (9) NOT NULL ,
    GEOLOCATION_DMS VARCHAR2 (35)
  ) ;
ALTER TABLE LOCATION ADD CONSTRAINT LOCATION_PK PRIMARY KEY ( ID ) ;

CREATE TABLE PERSON
  (
    ID                    NUMBER (19) NOT NULL ,
    FIRST_NAME            VARCHAR2 (255) ,
    LAST_NAME             VARCHAR2 (255) ,
    EMAIL_ADDRESS         VARCHAR2 (255) ,
    PHONE_NUMBER          VARCHAR2 (12) ,
    DATE_JOINED           TIMESTAMP WITH TIME ZONE ,
    USERNAME              VARCHAR2 (128) ,
    PASSWORD              VARCHAR2 (128) ,
    PREFERRED_LOCATION_ID NUMBER (19)
  ) ;
ALTER TABLE PERSON ADD CONSTRAINT PERSON_PK PRIMARY KEY ( ID ) ;

CREATE TABLE RESERVATION
  (
    ID                  NUMBER (19) NOT NULL ,
    PRICE_QUOTED        NUMBER (9,2) ,
    CUSTOMER_COMMENTS   VARCHAR2 (255) ,
    COUPON_CODE         VARCHAR2 (8) ,
    START_TIMESTAMP     TIMESTAMP WITH TIME ZONE ,
    END_TIMESTAMP       TIMESTAMP WITH TIME ZONE ,
    AMOUNT_PAID         NUMBER (9,2) ,
    TIP                 NUMBER (9,2) ,
    LOCATION_FK         NUMBER (19) ,
    PERSON_FK           NUMBER (19) ,
    EMPLOYEE_SERVICE_ID NUMBER (19) NOT NULL ,
    IS_CANCELLED        NUMBER (1)
  ) ;
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_PK PRIMARY KEY ( ID ) ;

CREATE TABLE SCHEDULE
  (
    ID              NUMBER (19) NOT NULL ,
    DAY_OF_WEEK     VARCHAR2 (10) NOT NULL ,
    EMPLOYEE_ID     NUMBER (19) NOT NULL ,
    START_AM_HOUR   CHAR (2) ,
    START_AM_MINUTE CHAR (2) ,
    END_AM_HOUR     CHAR (2) ,
    END_AM_MINUTE   CHAR (2) ,
    START_PM_HOUR   CHAR (2) ,
    START_PM_MINUTE CHAR (2) ,
    END_PM_HOUR     CHAR (2) ,
    END_PM_MINUTE   CHAR (2)
  ) ;
ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE__UNIQ UNIQUE ( DAY_OF_WEEK , EMPLOYEE_ID ) ;

CREATE TABLE SERVICE
  (
    ID        NUMBER (19) NOT NULL ,
    IS_ACTIVE NUMBER (1) ,
    SERVICE   VARCHAR2 (255 CHAR)
  ) ;
ALTER TABLE SERVICE ADD CONSTRAINT SERVICE_PK PRIMARY KEY ( ID ) ;

ALTER TABLE CANCELLATION ADD CONSTRAINT CANCELLATION_PERSON_FK FOREIGN KEY ( CANCELLED_BY_ID ) REFERENCES PERSON ( ID ) ;

ALTER TABLE CANCELLATION ADD CONSTRAINT CANCELLATION_RESERVATION_FK FOREIGN KEY ( RESERVATION_ID ) REFERENCES RESERVATION ( ID ) ;

ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_PERSON FOREIGN KEY ( PERSON_ID ) REFERENCES PERSON ( ID ) ;

ALTER TABLE EMPLOYEE_SERVICE ADD CONSTRAINT FK_EMPSERV_EMPLOYEE FOREIGN KEY ( EMPLOYEE_ID ) REFERENCES EMPLOYEE ( ID ) ;

ALTER TABLE EMPLOYEE_SERVICE ADD CONSTRAINT FK_EMPSERV_SERVICE FOREIGN KEY ( SERVICE_ID ) REFERENCES SERVICE ( ID ) ;

ALTER TABLE PERSON ADD CONSTRAINT FK_PERSON_LOCATION FOREIGN KEY ( PREFERRED_LOCATION_ID ) REFERENCES LOCATION ( ID ) ;

ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_EMPL_SERV FOREIGN KEY ( EMPLOYEE_SERVICE_ID ) REFERENCES EMPLOYEE_SERVICE ( ID ) ;

ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_LOCATION FOREIGN KEY ( LOCATION_FK ) REFERENCES LOCATION ( ID ) ;

ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_PERSON FOREIGN KEY ( PERSON_FK ) REFERENCES PERSON ( ID ) ;

ALTER TABLE SCHEDULE ADD CONSTRAINT FK_SCHEDULE_EMPLOYEE FOREIGN KEY ( EMPLOYEE_ID ) REFERENCES EMPLOYEE ( ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             1
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
