truncate table xijiaweb.home_members;
insert into xijiaweb.home_members
  (SNO,
   HOME_RELATION,
   MEMBER_NAME,
   CONTACT_PHONE,
   IDENTIFY_NUM,
   POLITICAL_STATUS,
   UNIT_NAME,
   POSTCODE,
   JOB_OCCUPATION)
  select distinct xh     SNO,
         jtgxdm HOME_RELATION,
         jsxm   MEMBER_NAME,
         lxdh   CONTACT_PHONE,
         sfzjh  IDENTIFY_NUM,
         zzmmdm POLITICAL_STATUS,
         dwmc   UNIT_NAME,
         dwyb   POSTCODE,
         zw     JOB_OCCUPATION
    from stage.t_bzks_jtcy
