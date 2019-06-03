CREATE TABLE PRODUTOPDVs 
(
  TERMICOD	              INTEGER NOT NULL,
  PRODICOD	              INTEGER NOT NULL,
  PRODIAGRUPGRADE	      INTEGER NOT NULL,
  PRODICODPAI                 INTEGER,
  PRODICODBALANCA	      INTEGER,
  PRODIPRINCIPAL              INTEGER,
  PRODA60CODBAR	              CHAR(60),
  PRODA60DESCR	              CHAR(60),
  PRODA30ADESCRREDUZ	      CHAR(30),
  UNIDICOD	              INTEGER,
  ICMSICOD	              INTEGER,
  PRODDCAD	              TIMESTAMP,
  PRODN3VLRVENDA	      DECIMAL(15,3),
  PRODN3VLRVENDAPROM	      DECIMAL(15,3),
  PRODDINIPROMO	              TIMESTAMP,
  PRODDFIMPROMO	              TIMESTAMP,
  PRODN3VLRCOMPRA	      DECIMAL(15,3),
  PRODN3VLRCUSTO	      DECIMAL(15,3),
  PRODN3VLRCUSTOMED	      DECIMAL(15,3),
  PRODN3PERCMARGLUCR	      DECIMAL(15,3),
  PRODCATIVO	              CHAR(1),
  PRODCRAPIDO                 CHAR(1),
  PRODCSERVICO	              CHAR(1),
  PRODCTIPO                   CHAR(5),
  PRODCTIPOBAIXA              CHAR(5),
  PRODIORIGEM                 INTEGER,
  PRODISITTRIB                INTEGER,
  PRODITIPOPRODBALAN          CHAR(15),
  NCMICOD                     INTEGER,
  PRIMARY KEY (TERMICOD, PRODICOD)
);
