
CREATE TABLE CONSULTA (
       CONSA13ID            CHAR(13) NOT NULL,
       EMPRICOD             INTEGER,
       CONSICOD             INTEGER,
       CONSA60DESCR         CHAR(60),
       CONSA255TABELAS      CHAR(255),
       CONSA255CAMPOS       CHAR(255),
       CONSA255JOINS        CHAR(255),
       CONSA255FILTROS      VARCHAR(1024),
       CONSA255ORDEM        CHAR(255),
       PENDENTE             CHAR(1),
       REGISTRO             DATE,
       PRIMARY KEY (CONSA13ID)
);

CREATE UNIQUE INDEX XPKCONSULTA ON CONSULTA
(
       CONSA13ID
);

CREATE INDEX XPENDENTE_CONSULTA ON CONSULTA
(
       PENDENTE
);

CREATE INDEX XREGISTRO_CONSULTA ON CONSULTA
(
       REGISTRO
);

