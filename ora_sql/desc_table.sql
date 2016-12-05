SELECT X2.*, X1.DXZWM, BZ
  FROM (SELECT * FROM XIJIA.NJUST_BOOK T WHERE SJY = '本科生教务管理系统') X1,
       (SELECT T1.OWNER || '.' || T1.TABLE_NAME TABLE_NAME,
               T1.COLUMN_NAME,
               T2.COMMENTS,
               DATA_TYPE ||
               DECODE(DATA_TYPE,
                      'NUMBER',
                      DECODE('(' || NVL(TO_CHAR(DATA_PRECISION), '*') || ',' ||
                             NVL(TO_CHAR(DATA_SCALE), '*') || ')',
                             '(*,*)',
                             NULL,
                             '(*,0)',
                             '(38)',
                             '(' || NVL(TO_CHAR(DATA_PRECISION), '*') || ',' ||
                             NVL(TO_CHAR(DATA_SCALE), '*') || ')'),
                      'FLOAT',
                      '(' || DATA_PRECISION || ')',
                      'DATE',
                      NULL,
                      'TIMESTAMP(6)',
                      NULL,
                      '(' || DATA_LENGTH || ')') AS DATA_TYPE,
               DATA_LENGTH,
               NULLABLE
          FROM DBA_TAB_COLUMNS T1, DBA_COL_COMMENTS T2
         WHERE T1.OWNER = T2.OWNER
           AND T1.TABLE_NAME = T2.TABLE_NAME
           AND T1.COLUMN_NAME = T2.COLUMN_NAME
           AND T1.OWNER IN ('STAGE')
           AND T1.TABLE_NAME IN ('T_BZKS_XJYD',
                                 'T_BZKS_ZY',
                                 'T_BZKS_ZYFX',
                                 'T_BZKS_KC',
                                 'T_BZKS_PYJHXFYQ',
                                 'T_BZKS_JXJH',
                                 'T_BZKS_FXZYSXW',
                                 'T_BZKS_JS',
                                 'T_BZKS_JXGZL',
                                 'T_BZKS_PJ',
                                 'T_BZKS_KK',
                                 'T_BZKS_PK',
                                 'T_BZKS_XK',
                                 'T_BZKS_KCAP',
                                 'T_BZKS_KSAP',
                                 'T_JS_SY')
         ORDER BY T1.OWNER, T1.TABLE_NAME, T1.COLUMN_ID) X2
 WHERE X1.DXM = X2.TABLE_NAME
