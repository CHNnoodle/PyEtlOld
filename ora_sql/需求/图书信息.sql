insert into xijiaweb.library_books
  (book_code, library_code, book_name, year, author)
  select tstxm book_code,
         gcdm  library_code,
         tm    book_name,
         cbrq  year,
         dyzz  author
    from stage.t_ts;
    commit;

truncate table xijiaweb.library_books;
insert into xijiaweb.library_books
  (book_code, library_code, book_name, year, author,call_no)
  select tstxm book_code,
         gcdm  library_code,
         tm    book_name,
         cbrq  year,
         dyzz  author,
         t2.category_code call_no
    from stage.t_ts t1,xijiaweb.library_book_book_categories t2
    where t1.tstxm=t2.book_code(+)
