insert into xijiaweb.course_times
  (course_code, start_time, end_time, class_room)
  select jxbh course_code, ksjc start_time, jsjc end_time, jsdm class_room
    from stage.t_bzks_pk t;
