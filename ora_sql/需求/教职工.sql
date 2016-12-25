insert into xijiaweb.employees
  (wno,
   name,
   name_spell,
   used_name,
   gender_code,
   birth_date,
   birthplace,
   native_place,
   nationality,
   nation_code,
   id_type,
   id_num,
   gangaotai_chinese,
   health_status_code,
   marital_code,
   join_work_time,
   join_school_time,
   teacher_date,
   political_code,
   join_party_time,
   register_address,
   department_code,
   preparation_code,
   worker_source_code,
   employee_type,
   employment_institution,
   status_code,
   highest_education,
   graduate_time,
   graduate_school,
   degree_code,
   join_degree_time,
   teacher_certificate_num,
   tutor_category,
   subject_code,
   first_discipline_code,
   study_direction,
   professional_skill_duty_code,
   professional_skill_lvl_code,
   professional_skill_lvl_time,
   technical_type,
   technical_lvl,
   technical_time,
   party_job,
   party_lvl,
   party_time,
   is_shoulders_code)

  select zgh        wno,
         xm         name,
         xmpy       name_spell,
         cym        used_name,
         xbdm       gender_code,
         csrq       birth_date,
         csddm      birthplace,
         jgdm       native_place,
         gjdqdm     nationality,
         mzdm       nation_code,
         sfzjlxdm   id_type,
         sfzjh      id_num,
         gatqdm     gangaotai_chinese,
         jkzkdm     health_status_code,
         hyzkdm     marital_code,
         cjgzrq     join_work_time,
         lxrq       join_school_time,
         cjrq       teacher_date,
         zzmmdm     political_code,
         cjdprq     join_party_time,
         hkszd      register_address,
         szdwdm     department_code,
         bzlbdm     preparation_code,
         jzgly      worker_source_code,
         jzglbdm    employee_type,
         yrfsdm     employment_institution,
         dqztdm     status_code,
         zgxldm     highest_education,
         byrq       graduate_time,
         byxx       graduate_school,
         xwdm       degree_code,
         sxwrq      join_degree_time,
         jszgzh     teacher_certificate_num,
         dslbdm     tutor_category,
         xklbdm     subject_code,
         yjxkdm     first_discipline_code,
         yjfx       study_direction,
         zyjszwdm   professional_skill_duty_code,
         zyjszwjbdm professional_skill_lvl_code,
         zyjszwpdrq professional_skill_lvl_time,
         grjsgzdm   technical_type,
         grjsdjdm   technical_lvl,
         grjsdjpdrq technical_time,
         dzzw       party_job,
         dzzwjbdm   party_lvl,
         dzzwrzrq   party_time,
         sfsjt      is_shoulders_code
    from xj_ryxx.t_d_jzg
   where partid = '21'
