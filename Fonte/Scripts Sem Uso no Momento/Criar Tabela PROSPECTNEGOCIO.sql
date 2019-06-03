CREATE TABLE PROSPECTNEGOCIO 
(
  PRNEA13ID                  CHAR(13) NOT NULL,
  PRNEICOD                   INTEGER,
  EMPRICOD                   INTEGER NOT NULL,
  VENDICOD                   INTEGER,
  PRCLA13ID                  CHAR(13),
  PRNEDEMISSAO               TIMESTAMP,
  PRNEA100DESCRICAO          CHAR(100),
  PRNEA60CONTATO             CHAR(60),
  PRNEA15CONTATOFONE1        CHAR(15),
  PRNEA15CONTATOFONE2        CHAR(15),
  PRNEN2VALOR                NUMERIC(15, 2),
  PRNEA254OBS                VARCHAR(254),
  PRNEA15VALIDADE            CHAR(15),
  PLRCICOD                   INTEGER,
  PRNECTIPOFRETE             CHAR(1),
  PRNEA254MOTFECHA           VARCHAR(254),
  PRNEA60END                 CHAR(60),
  PRNEA60BAIRRO              CHAR(60),
  PRNEA60CIDADE              CHAR(60),
  PRNEA2UF                   CHAR(2),
  PRNEA8CEP                  CHAR(8),
  PRNEA60EMAIL               CHAR(60),
  REGISTRO                   TIMESTAMP,
  PENDENTE                   CHAR(1),
  PRNSICOD                   INTEGER,
  PNFEICOD                   INTEGER,
 PRIMARY KEY (PRNEA13ID)
);