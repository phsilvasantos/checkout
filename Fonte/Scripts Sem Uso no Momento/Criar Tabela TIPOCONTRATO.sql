CREATE TABLE TIPOCONTRATO 
(
  TPCTICOD                   INTEGER NOT NULL,
  TPCTA60DESCR               CHAR(60),
  TPCTBCORPOCONTRATO         BLOB SUB_TYPE TEXT SEGMENT SIZE 80,
  REGISTRO                   TIMESTAMP,
  PENDENTE                   CHAR(1) DEFAULT "S",
 PRIMARY KEY (TPCTICOD)
);