ALTER TABLE ORDEMSERVICO ADD teste NUMERIC(15,3);
commit work;
UPDATE ORDEMSERVICO SET teste = ORSEN3TOTALTERCEIROS;
commit work;
ALTER TABLE ORDEMSERVICO DROP ORSEN3TOTALTERCEIROS;
commit work;
ALTER TABLE ORDEMSERVICO ADD ORSEN3TOTALTERCEIROS NUMERIC(15,3);
commit work;
UPDATE ORDEMSERVICO SET ORSEN3TOTALTERCEIROS = teste;
commit work;
ALTER TABLE ORDEMSERVICO DROP teste;
commit work;

