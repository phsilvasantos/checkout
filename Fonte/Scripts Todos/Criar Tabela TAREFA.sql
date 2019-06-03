CREATE TABLE TAREFA(
 TAREA13ID	        CHAR(13) NOT NULL,
 EMPRICOD      	INTEGER,
 TAREICOD	        INTEGER NOT NULL,
 TAREDDIGITACAO	TIMESTAMP,
 TAREDLEMBRETE	        TIMESTAMP,
 TAREHLEMBRETE	        CHAR(8),
 TAREDPRAZOMAX          TIMESTAMP,   
 TAREDINICIO	        TIMESTAMP,
 TAREDTERMINO	        TIMESTAMP,
 USUAICODORIG   	INTEGER,
 USUAICODDEST	        INTEGER,
 CLIEA13ID	        CHAR(13),
 TARECSTATUS            CHAR(1),
 TAREA30TITULO	        CHAR(30),
 TARETSOLICITACAO	VARCHAR(5000),
 TARETEXECUCAO	        VARCHAR(5000),
 TAREA254MOTIVOCANCEL   VARCHAR(5000),
 TAREA60MOTIVOADIO      VARCHAR(5000), 
 PENDENTE               CHAR(01), 
 REGISTRO	        TIMESTAMP,
 PRIMARY KEY (TAREA13ID));