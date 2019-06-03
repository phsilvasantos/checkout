CREATE TABLE NCM(
    NCMICOD             INTEGER NOT NULL,
    NCMA30CODIGO        VARCHAR(30),
    NCMA100DESCR        VARCHAR(100),
    NCMA5UNIDADE        VARCHAR(5),
    REGISTRO             TIMESTAMP,
    PENDENTE             CHAR(01),
  PRIMARY KEY (NCMICOD));