
/* Table: TAREFA, Owner: SYSDBA */

CREATE TABLE TAREFAPROSPECT
(
  TAREA13ID	CHAR(13) NOT NULL,
  EMPRICOD	INTEGER,
  TERMICOD	INTEGER,
  TAREICOD	INTEGER NOT NULL,
  USUAICODDEST	INTEGER,
  CLIEA13ID	CHAR(13),
  TAREDDIGITACAO	TIMESTAMP,
  TAREDLEMBRETE	TIMESTAMP,
  TARETSOLICITACAO	VARCHAR(5000),
  TAREDINICIO	TIMESTAMP,
  TARETEXECUCAO	VARCHAR(5000),
  TAREDTERMINO	TIMESTAMP,
  TARECPENDENTE	CHAR(1),
  REGISTRO	TIMESTAMP,
  TPTAICOD	INTEGER,
  TAREA30TITULO	CHAR(30),
  HELPA13ID	CHAR(13),
  TAREDPRAZOMAX	TIMESTAMP,
  TAREDULTAGEND	TIMESTAMP,
  TAREHLEMBRETE	CHAR(8),
  TAREA60MOTIVOADIO	CHAR(60),
  CLASSICOD	INTEGER,
  USUAICOD	INTEGER,
  USUUICOD	INTEGER,
 PRIMARY KEY (TAREA13ID)
);