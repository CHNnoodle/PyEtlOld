insert into xijiaweb.library_book_book_categories
  (book_code, library_book_id, book_category_id, category_code)
  select tstxm book_code,
         tstxm library_book_id,
         ktf   book_category_id,
         ktfdl category_code
    from xj_gl.t_sd_ts_sm;
commit;
