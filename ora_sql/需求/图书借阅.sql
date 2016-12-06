insert into xijiaweb.book_library_infos
  (book_code,
   book_name,
   person_no,
   borrowed_time,
   returned_time,
   is_refill)
  select tstm book_code,
         tsmc book_name,
         dztm person_no,
         jsrq borrowed_time,
         yhrq returned_time,
         xjbs is_refill
    from xj_gl.t_d_ts_jy
