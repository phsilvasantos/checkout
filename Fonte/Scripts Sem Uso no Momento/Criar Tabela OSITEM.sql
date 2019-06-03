CREATE TABLE OSITEM (
       OSA13ID              CHAR(13) NOT NULL,
       OSITICOD             INTEGER NOT NULL,
       OSITTSTATUS          CHAR(1),
       PRODICOD             INTEGER,
       OSITA30NRONF         CHAR(30),
       OSITCORIGNF          CHAR(1),
       OSITA60EMPRESANF     CHAR(60),
       OSITA60SERIEEQUIP    CHAR(60),
       OSITTDESCREQUIP      VARCHAR(5000),
       OSITTPROBLEMA        VARCHAR(5000),
       OSITTSOLUCAO         VARCHAR(5000),
       OSITTSOFTDRIVEUTIL   VARCHAR(500),
       OSITTOBS             VARCHAR(500),
       OSITN2VLRITEM        NUMERIC(15,2) DEFAULT 0,
       OSITN2VLRDESC        NUMERIC(15,2) DEFAULT 0,
       OSITN2PERCDESC       NUMERIC(15,2),
       OSITN2VLRTOTITEM     NUMERIC(15,2),
       OSITDCONCLUSAO       DATE,
       USUA60RESPCONC       CHAR(60),
       USUA60LOGIN          CHAR(60),
       PENDENTE             CHAR(1),
       REGISTRO             DATE,
       OSITN2QTDE           NUMERIC(15,2),
       FUNCA13ID            CHAR(13),
       OSITDCANC            DATE,
       PRIMARY KEY (OSA13ID, OSITICOD)
);

CREATE UNIQUE INDEX XPKOSITEM ON OSITEM
(
       OSA13ID,
       OSITICOD
);

CREATE INDEX XIF251OSITEM ON OSITEM
(
       OSA13ID
);

CREATE INDEX XIF252OSITEM ON OSITEM
(
       PRODICOD
);