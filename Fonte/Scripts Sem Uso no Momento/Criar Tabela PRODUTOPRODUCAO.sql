CREATE TABLE PRODUTOPRODUCAO 
(
  PRODICOD                   INTEGER NOT NULL,
  PRPRICOD                   INTEGER,
  PENDENTE                   CHAR(1) DEFAULT 'S',
  REGISTRO                   TIMESTAMP,
 PRIMARY KEY (PRODICOD)
);
