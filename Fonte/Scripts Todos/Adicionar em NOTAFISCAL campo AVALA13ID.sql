ALTER TABLE NOTAFISCAL ADD AVALA13ID CHAR(13);
CREATE INDEX AVALA13ID_NOTAFISCAL ON NOTAFISCAL(AVALA13ID);