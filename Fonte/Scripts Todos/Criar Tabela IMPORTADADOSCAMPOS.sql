CREATE TABLE IMPORTADADOSCAMPOS (
	IDCAICOD	INTEGER NOT NULL,
	IMDAICOD	INTEGER NOT NULL,
	IDCAA30CAMPO	CHAR(30),
	IDCAIPOSICAO	INTEGER,
	IDCAITAMANHO 	INTEGER,
	REGISTRO	DATE,
	PRIMARY KEY(IDCAICOD,IMDAICOD)
);