CREATE TABLE LISTAPRECO(
       LSPCICOD             INTEGER NOT NULL,
       DATA                 DATE,
       STATUS               CHAR(1),
       ALTERAPRECO          CHAR(1),
       RemoveItem           CHAR(1),
       PRODICOD             INTEGER,
       VLRCOMPRAATUAL       DOUBLE PRECISION,
       VLRCUSTOATUAL        DOUBLE PRECISION,
       VLRVENDA1ATUAL       DOUBLE PRECISION,
       VLRVENDA2ATUAL       DOUBLE PRECISION,
       PERCIPIENTRADA       DOUBLE PRECISION,
       PERCICMSST           DOUBLE PRECISION,
       PERCFRETE            DOUBLE PRECISION,
       PERCOUTRAS           DOUBLE PRECISION,
       PERCDIFICMS          DOUBLE PRECISION,
       PERCDESC             DOUBLE PRECISION,
       VLRCOMPRA            DOUBLE PRECISION,
       VLRCUSTO             DOUBLE PRECISION,
       QTDCOMPRA            DOUBLE PRECISION,
       PERCMGVAREJO         DOUBLE PRECISION,
       PERCMGATACADO        DOUBLE PRECISION,
       VLRVENDA1            DOUBLE PRECISION,
       VLRVENDA2            DOUBLE PRECISION,
       DESCRICAO            VARCHAR(60),
       REFFABRIC            VARCHAR(30),
       NOCPA13ID            VARCHAR(13),
       NRONF                VARCHAR(15),
       FORNECEDOR           VARCHAR(60),
       UNIDADE              VARCHAR(05),
       PRIMARY KEY(LSPCICOD));