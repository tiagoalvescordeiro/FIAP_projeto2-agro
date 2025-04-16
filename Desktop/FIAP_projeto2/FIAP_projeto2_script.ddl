-- Gerado por Oracle SQL Developer Data Modeler 4.1.3.901
--   em:        2025-04-15 22:21:21 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c




CREATE TABLE CULTURA
  (
    ID_Cultura    INTEGER NOT NULL ,
    Nome          VARCHAR2 (100) ,
    Tipo          VARCHAR2 (50) ,
    Ciclo_Cultivo VARCHAR2 (50)
  ) ;
ALTER TABLE CULTURA ADD CONSTRAINT Cultura_PK PRIMARY KEY ( ID_Cultura ) ;


CREATE TABLE LEITURA
  (
    codigo_leitura INTEGER NOT NULL ,
    codigo_sensor  INTEGER NOT NULL ,
                   TIMESTAMP DATE ,
    valor          NUMBER
  ) ;
ALTER TABLE LEITURA ADD CONSTRAINT LEITURA_PK PRIMARY KEY ( codigo_leitura ) ;


CREATE TABLE SENSOR
  (
    codigo_sensor  INTEGER NOT NULL ,
    tipo           VARCHAR2 (50) NOT NULL ,
    unidade_medida NUMBER NOT NULL ,
    latitude       NUMBER NOT NULL ,
    longitude      NUMBER NOT NULL
  ) ;
ALTER TABLE SENSOR ADD CONSTRAINT Sensor_PK PRIMARY KEY ( codigo_sensor ) ;


CREATE TABLE T_AJUSTE_APLICAO
  (
    id_ajuste    INTEGER NOT NULL ,
    data_hora    DATE ,
    tipo_ajuste  VARCHAR2 (50) ,
    quantidade   INTEGER ,
    id_plantacao INTEGER NOT NULL
  ) ;
ALTER TABLE T_AJUSTE_APLICAO ADD CONSTRAINT AjusteAplicacao_PK PRIMARY KEY ( id_ajuste ) ;


CREATE TABLE T_APLICACAO_INSUMO
  (
    id           INTEGER NOT NULL ,
    quantidade   NUMBER NOT NULL ,
                 TIMESTAMP DATE NOT NULL ,
    cd_insumo    INTEGER NOT NULL ,
    cd_aplicador INTEGER NOT NULL
  )
  LOGGING ;
ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT T_APLICACAO_INSUMO_PK PRIMARY KEY ( id ) ;


CREATE TABLE T_APLICADOR
  (
    codigo_aplicador INTEGER NOT NULL ,
    tipo             VARCHAR2 (50) NOT NULL ,
    nome             VARCHAR2 (100) NOT NULL
  )
  LOGGING ;
ALTER TABLE T_APLICADOR ADD CONSTRAINT T_APLICADOR_PK PRIMARY KEY ( codigo_aplicador ) ;

ALTER TABLE T_INSUMOS ADD CONSTRAINT T_INSUMOS_PK PRIMARY KEY ( codigo_insumo ) ;


CREATE TABLE T_PLANTACAO
  (
    ID_Plantacao INTEGER NOT NULL ,
    Localizacao  VARCHAR2 (100) ,
    Area UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    ,
    ID_Cultura INTEGER
  ) ;
ALTER TABLE T_PLANTACAO ADD CONSTRAINT Plantacao_PK PRIMARY KEY ( ID_Plantacao ) ;


ALTER TABLE T_PLANTACAO ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( ID_Cultura ) REFERENCES CULTURA ( ID_Cultura ) NOT DEFERRABLE ;

ALTER TABLE LEITURA ADD CONSTRAINT LEITURA_SENSOR_FK FOREIGN KEY ( codigo_sensor ) REFERENCES SENSOR ( codigo_sensor ) NOT DEFERRABLE ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE T_AJUSTE_APLICAO ADD CONSTRAINT T_AJUSTE_APLICAO_T_PLANTACAO_FK FOREIGN KEY ( id_plantacao ) REFERENCES T_PLANTACAO ( ID_Plantacao ) NOT DEFERRABLE ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT T_APLICACAO_INSUMO_T_APLICADOR_FK FOREIGN KEY ( cd_aplicador ) REFERENCES T_APLICADOR ( codigo_aplicador ) NOT DEFERRABLE ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT T_APLICACAO_INSUMO_T_INSUMOS_FK FOREIGN KEY ( cd_insumo ) REFERENCES T_INSUMOS ( codigo_insumo ) NOT DEFERRABLE ;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   4
-- WARNINGS                                 0
