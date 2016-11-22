insert into xijiaweb.library_books
  (book_code, library_code, book_name, year, author)
  select tstxm book_code,
         gcdm  library_code,
         tm    book_name,
         cbrq  year,
         dyzz  author
    from stage.t_ts;
