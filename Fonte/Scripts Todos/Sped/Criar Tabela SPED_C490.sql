CREATE TABLE SPED_C490 (
    NUMEROSERIEECF  VARCHAR(20) NOT NULL,
    DATAREDUCAO     DATE NOT NULL,
    CST             VARCHAR(3) NOT NULL,
    CFOPITEM        VARCHAR(4) NOT NULL,
    ALIQUOTA        NUMERIC(6,2) NOT NULL,
    VALOROPERACAO   DOUBLE PRECISION NOT NULL,
    VALOR_BC_ICMS   DOUBLE PRECISION NOT NULL,
    VALOR_ICMS      DOUBLE PRECISION NOT NULL,
    COD_OBS         VARCHAR(6)
);