declare
  test_job_really number;

begin
  dbms_job.submit(test_job_really,
                  'xijia.job_p_t_d_procedure;',
                  sysdate,
                  'trunc(sysdate)+1');
  commit;
end;
