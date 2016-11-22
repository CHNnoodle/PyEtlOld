insert into xijiaweb.course_times
  (COURSE_CODE, START_TIME, END_TIME, CLASS_ROOM)
  select JXBH COURSE_CODE, ksjc START_TIME, jsjc END_TIME, JSDM CLASS_ROOM
    from STAGE.T_BZKS_pk t;

