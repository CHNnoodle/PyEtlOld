select * from XJ_RYXX.T_D_RYXX t;

create table XJ_RYXX.T_D_RYXX
(
  jlrq        CHAR(8),
  partid      CHAR(2),
  wid         VARCHAR2(500),
  xh          VARCHAR2(20),
  xslx        CHAR(1),
  xm          VARCHAR2(90),
  xmpy        VARCHAR2(90),
  cym         VARCHAR2(90),
  xbdm        VARCHAR2(2),
  csrq        VARCHAR2(30),
  mzdm        VARCHAR2(2),
  sfzjlxdm    VARCHAR2(2),
  sfzjh       VARCHAR2(50),
  jgdm        VARCHAR2(50),
  csddm       VARCHAR2(50),
  zzmmdm      VARCHAR2(3),
  syddm       VARCHAR2(6),
  hssbkdm     VARCHAR2(10),
  hkszd       VARCHAR2(200),
  pyfsdm      VARCHAR2(2),
  dwdm        VARCHAR2(10),
  zydm        VARCHAR2(26),
  xslbdm      VARCHAR2(3),
  rxrq        VARCHAR2(10),
  rxnj        VARCHAR2(4),
  xznj        VARCHAR2(4),
  bh          VARCHAR2(20),
  xzdm        VARCHAR2(10),
  xjztdm      VARCHAR2(6),
  jkzkdm      VARCHAR2(20),
  clrq        DATE,
  czlx        VARCHAR2(10),
  opt_time    DATE,
  source_flag VARCHAR2(10)
)
partition by list(partid)
(partition part01 values('01'), partition part02 values('02'),
 partition part03 values('03'), partition part04 values('04'),
 partition part05 values('05'), partition part06 values('06'),
 partition part07 values('07'), partition part08 values('08'),
 partition part09 values('09'), partition part10 values('10'),
 partition part11 values('11'), partition part12 values('12'),
 partition part13 values('13'), partition part14 values('14'),
 partition part15 values('15'), partition part16 values('16'),
 partition part17 values('17'), partition part18 values('18'),
 partition part19 values('19'), partition part20 values('20'),
 partition part21 values('21'), partition part22 values('22'),
 partition part23 values('23'), partition part24 values('24'),
 partition part25 values('25'), partition part26 values('26'),
 partition part27 values('27'), partition part28 values('28'),
 partition part29 values('29'), partition part30 values('30'),
 partition part31 values('31'))
