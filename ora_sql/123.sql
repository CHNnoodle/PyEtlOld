???-----------------------------------------------------
-- Export file for user API@ORCLRAC                --
-- Created by Administrator on 2016/11/28, 0:02:51 --
-----------------------------------------------------

set define off
spool 123.log

prompt
prompt Creating table APIS
prompt ===================
prompt
create table API.APIS
(
  id           NUMBER(10) not null,
  name         VARCHAR2(255 CHAR) not null,
  code         VARCHAR2(255 CHAR) not null,
  description  VARCHAR2(255 CHAR),
  url          VARCHAR2(255 CHAR) not null,
  format       VARCHAR2(255 CHAR),
  image_url    VARCHAR2(255 CHAR),
  category_id  NUMBER(10) not null,
  request_type VARCHAR2(255 CHAR),
  is_enable    NUMBER(10) default '1',
  hour_limit   NUMBER(10),
  day_limit    NUMBER(10),
  month_limit  NUMBER(10),
  created_at   DATE not null,
  updated_at   DATE not null
)
;
alter table API.APIS
  add constraint PRIMARY_3 primary key (ID);
alter table API.APIS
  add constraint CODE_UNIQUE_6 unique (CODE);
alter table API.APIS
  add constraint NAME_UNIQUE_7 unique (NAME);

prompt
prompt Creating table API_APPLICATIONS
prompt ===============================
prompt
create table API.API_APPLICATIONS
(
  id                NUMBER(10) not null,
  api_id            NUMBER(10) not null,
  application_id    NUMBER(10) not null,
  hour_limit        NUMBER(10),
  day_limit         NUMBER(10),
  month_limit       NUMBER(10),
  apply_user        VARCHAR2(45 CHAR),
  apply_description VARCHAR2(255 CHAR),
  apply_status      VARCHAR2(45 CHAR),
  apply_time        DATE,
  audit_time        DATE,
  audit_description VARCHAR2(255 CHAR),
  created_at        DATE not null,
  updated_at        DATE not null
)
;
alter table API.API_APPLICATIONS
  add constraint PRIMARY_1 primary key (ID);

prompt
prompt Creating table API_APPLICATION_FIELDS
prompt =====================================
prompt
create table API.API_APPLICATION_FIELDS
(
  id                NUMBER(10) not null,
  api_id            NUMBER(10) not null,
  application_id    VARCHAR2(45 CHAR) not null,
  apply_id          NUMBER(10) not null,
  field_name        VARCHAR2(45 CHAR) not null,
  audit_status      VARCHAR2(45 CHAR),
  audit_time        DATE,
  audit_description VARCHAR2(255 CHAR),
  created_at        DATE not null,
  updated_at        DATE not null
)
;
alter table API.API_APPLICATION_FIELDS
  add constraint PRIMARY primary key (ID);

prompt
prompt Creating table API_CATEGORIES
prompt =============================
prompt
create table API.API_CATEGORIES
(
  id          NUMBER(10) not null,
  name        VARCHAR2(45 CHAR) not null,
  code        VARCHAR2(45 CHAR) not null,
  description VARCHAR2(255 CHAR),
  image_url   VARCHAR2(255 CHAR),
  parent_id   NUMBER(10) not null,
  is_enable   NUMBER(10) default '1',
  created_at  DATE not null,
  updated_at  DATE not null
)
;
alter table API.API_CATEGORIES
  add constraint PRIMARY_2 primary key (ID);
alter table API.API_CATEGORIES
  add constraint CODE_UNIQUE unique (CODE);
alter table API.API_CATEGORIES
  add constraint NAME_UNIQUE unique (NAME);

prompt
prompt Creating table API_FIELDS
prompt =========================
prompt
create table API.API_FIELDS
(
  id          NUMBER(10) not null,
  api_id      NUMBER(10) not null,
  name        VARCHAR2(45 CHAR) not null,
  alias       VARCHAR2(45 CHAR),
  description VARCHAR2(255 CHAR),
  default_    VARCHAR2(45 CHAR),
  data_type   VARCHAR2(45 CHAR) default 'string',
  is_search   NUMBER(10),
  is_enable   NUMBER(10) default '1',
  is_required NUMBER(10),
  is_request  NUMBER(10),
  is_response NUMBER(10),
  is_encrypt  NUMBER(10),
  created_at  DATE not null,
  updated_at  DATE not null
)
;
alter table API.API_FIELDS
  add constraint PRIMARY_6 primary key (ID);

prompt
prompt Creating table API_MESSAGES
prompt ===========================
prompt
create table API.API_MESSAGES
(
  id          NUMBER(10) not null,
  api_id      NUMBER(10) not null,
  code        VARCHAR2(45 CHAR) not null,
  is_enable   NUMBER(10) default '1',
  name        VARCHAR2(255 CHAR) not null,
  description VARCHAR2(255 CHAR)
)
;
alter table API.API_MESSAGES
  add constraint PRIMARY_4 primary key (ID);
alter table API.API_MESSAGES
  add constraint CODE_UNIQUE_7 unique (CODE);

prompt
prompt Creating table API_REQUEST_LOGS
prompt ===============================
prompt
create table API.API_REQUEST_LOGS
(
  id         NUMBER(10) not null,
  api_id     VARCHAR2(45 CHAR) not null,
  app_id     VARCHAR2(45 CHAR),
  is_fail    NUMBER(10) default '0',
  created_at DATE not null,
  updated_at DATE not null
)
;
alter table API.API_REQUEST_LOGS
  add constraint PRIMARY_5 primary key (ID);

prompt
prompt Creating sequence APIS_ID_SEQ
prompt =============================
prompt
create sequence API.APIS_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_APPLICATIONS_ID_SEQ
prompt =========================================
prompt
create sequence API.API_APPLICATIONS_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_APPLICATION_FIELDS_ID_SEQ
prompt ===============================================
prompt
create sequence API.API_APPLICATION_FIELDS_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_CATEGORIES_ID_SEQ
prompt =======================================
prompt
create sequence API.API_CATEGORIES_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_FIELDS_ID_SEQ
prompt ===================================
prompt
create sequence API.API_FIELDS_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_MESSAGES_ID_SEQ
prompt =====================================
prompt
create sequence API.API_MESSAGES_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence API_REQUEST_LOGS_ID_SEQ
prompt =========================================
prompt
create sequence API.API_REQUEST_LOGS_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating trigger APIS_ID_TRG
prompt ============================
prompt
CREATE OR REPLACE TRIGGER API.apis_id_TRG BEFORE INSERT ON apis
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  apis_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM apis;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT apis_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_APPLICATIONS_ID_TRG
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER API.api_applications_id_TRG BEFORE INSERT ON api_applications
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_applications_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_applications;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_applications_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_APPLICATION_FIELDS_ID_TRG
prompt ==============================================
prompt
CREATE OR REPLACE TRIGGER API.api_application_fields_id_TRG BEFORE INSERT ON api_application_fields
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_application_fields_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_application_fields;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_application_fields_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_CATEGORIES_ID_TRG
prompt ======================================
prompt
CREATE OR REPLACE TRIGGER API.api_categories_id_TRG BEFORE INSERT ON api_categories
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_categories_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_categories;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_categories_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_FIELDS_ID_TRG
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER API.api_fields_id_TRG BEFORE INSERT ON api_fields
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_fields_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_fields;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_fields_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_MESSAGES_ID_TRG
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER API.api_messages_id_TRG BEFORE INSERT ON api_messages
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_messages_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_messages;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_messages_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger API_REQUEST_LOGS_ID_TRG
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER API.api_request_logs_id_TRG BEFORE INSERT ON api_request_logs
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  api_request_logs_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM api_request_logs;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT api_request_logs_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/


spool off
