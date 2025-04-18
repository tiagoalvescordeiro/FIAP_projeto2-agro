-- Gerado por Oracle SQL Developer Data Modeler 4.1.3.901
--   em:        2025-04-18 20:11:54 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g




DROP TABLE T_APLICACAO_INSUMO CASCADE CONSTRAINTS ;

DROP TABLE T_APLICADOR CASCADE CONSTRAINTS ;

DROP TABLE T_COMPRA CASCADE CONSTRAINTS ;

DROP TABLE T_CULTURA CASCADE CONSTRAINTS ;

DROP TABLE T_FAZENDA CASCADE CONSTRAINTS ;

DROP TABLE T_FORNECEDOR CASCADE CONSTRAINTS ;

DROP TABLE T_FUNCIONARIO CASCADE CONSTRAINTS ;

DROP TABLE T_INSUMO CASCADE CONSTRAINTS ;

DROP TABLE T_INSUMO_CULTURA CASCADE CONSTRAINTS ;

DROP TABLE T_LEITURA CASCADE CONSTRAINTS ;

DROP TABLE T_PLANTACAO CASCADE CONSTRAINTS ;

DROP TABLE T_SENSOR CASCADE CONSTRAINTS ;

CREATE TABLE T_APLICACAO_INSUMO
  (
    cd_aplicacao INTEGER NOT NULL ,
    cd_insumo    INTEGER NOT NULL ,
    cd_aplicador INTEGER NOT NULL ,
    quantidade   NUMBER (5,2) NOT NULL ,
    tipo         VARCHAR2 (50) NOT NULL ,
                 TIMESTAMP DATE NOT NULL
  ) ;
ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT CK_APLICACAO_INSUMO_QTD CHECK (quantidade > 0) ;
ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT PK_T_APLIC_INSU PRIMARY KEY ( cd_aplicacao ) ;


CREATE TABLE T_APLICADOR
  (
    cd_aplicador INTEGER NOT NULL ,
    cd_fazenda   INTEGER NOT NULL ,
    nome         VARCHAR2 (100) NOT NULL ,
    tipo         VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE T_APLICADOR ADD CONSTRAINT PK_T_APLICADOR PRIMARY KEY ( cd_aplicador ) ;


CREATE TABLE T_COMPRA
  (
    cd_compra      INTEGER NOT NULL ,
    cd_fazenda     INTEGER NOT NULL ,
    cd_insumo      INTEGER NOT NULL ,
    cd_fornecedor  INTEGER NOT NULL ,
    valor          NUMBER (7,2) NOT NULL ,
    quantidade     NUMBER (7,2) NOT NULL ,
    unidade_medida CHAR (10) NOT NULL ,
    dt_compra      DATE NOT NULL
  ) ;
ALTER TABLE T_COMPRA ADD CONSTRAINT PK_T_COMPRA PRIMARY KEY ( cd_compra, cd_fazenda, cd_insumo ) ;


CREATE TABLE T_CULTURA
  (
    cd_cultura        INTEGER NOT NULL ,
    nome              VARCHAR2 (100) NOT NULL ,
    tipo              VARCHAR2 (50) NOT NULL ,
    tmp_colheita_dias INTEGER NOT NULL
  ) ;
ALTER TABLE T_CULTURA ADD CONSTRAINT PK_T_CULTURA PRIMARY KEY ( cd_cultura ) ;
ALTER TABLE T_CULTURA ADD CONSTRAINT UN_T_CULTURA_NOME UNIQUE ( nome ) ;


CREATE TABLE T_FAZENDA
  (
    cd_fazenda INTEGER NOT NULL ,
    cnpj       NUMBER (14) NOT NULL ,
    nome       VARCHAR2 (50) NOT NULL ,
    endereco   VARCHAR2 (100) NOT NULL ,
    telefone   NUMBER (11) NOT NULL ,
    cnpjf      NUMBER (14) NOT NULL
  ) ;
ALTER TABLE T_FAZENDA ADD CONSTRAINT PK_T_FAZENDA PRIMARY KEY ( cd_fazenda ) ;
ALTER TABLE T_FAZENDA ADD CONSTRAINT UN_T_FAZENDA_CNPJ_NAME UNIQUE ( cnpj , nome ) ;


CREATE TABLE T_FORNECEDOR
  (
    cd_fornecedor INTEGER NOT NULL ,
    nome          VARCHAR2 (100) NOT NULL ,
    cnpj          NUMBER (11) NOT NULL ,
    email         VARCHAR2 (50) NOT NULL ,
    telefone      NUMBER (11) NOT NULL
  ) ;
ALTER TABLE T_FORNECEDOR ADD CONSTRAINT PK_T_FORNECEDOR PRIMARY KEY ( cd_fornecedor ) ;
ALTER TABLE T_FORNECEDOR ADD CONSTRAINT UN_T_FORNECEDOR_CNPJ UNIQUE ( cnpj ) ;


CREATE TABLE T_FUNCIONARIO
  (
    cd_funcionario  INTEGER NOT NULL ,
    cd_fazenda      INTEGER NOT NULL ,
    cpf             NUMBER (11) NOT NULL ,
    email           VARCHAR2 (50) NOT NULL ,
    salario         NUMBER (7,2) NOT NULL ,
    nome            VARCHAR2 (50) NOT NULL ,
    telefone        NUMBER (11) NOT NULL ,
    endereco        VARCHAR2 (100) NOT NULL ,
    dt_contratacao  DATE NOT NULL ,
    dt_desligamento DATE
  ) ;
ALTER TABLE T_FUNCIONARIO ADD CONSTRAINT CK_FUNC_SALARIO CHECK (salario                  >= 1518) ;
ALTER TABLE T_FUNCIONARIO ADD CONSTRAINT CK_FUNC_DT_DESLIGAMENTO CHECK (data_desligamento > data_contratacao) ;
ALTER TABLE T_FUNCIONARIO ADD CONSTRAINT PK_T_FUNCIONARIO PRIMARY KEY ( cd_funcionario ) ;
ALTER TABLE T_FUNCIONARIO ADD CONSTRAINT UN_T_FUNC_CPF UNIQUE ( cpf ) ;


CREATE TABLE T_INSUMO
  (
    cd_insumo      INTEGER NOT NULL ,
    nome           VARCHAR2 (100) NOT NULL ,
    tipo           VARCHAR2 (50) NOT NULL ,
    unidade_medida CHAR (10) NOT NULL
  ) ;
ALTER TABLE T_INSUMO ADD CONSTRAINT PK_T_INSUMO PRIMARY KEY ( cd_insumo ) ;
ALTER TABLE T_INSUMO ADD CONSTRAINT UN_T_INSUMO_NOME UNIQUE ( nome ) ;


CREATE TABLE T_INSUMO_CULTURA
  (
    cd_cultura INTEGER NOT NULL ,
    cd_insumo  INTEGER NOT NULL ,
    quantidade NUMBER (5,2) NOT NULL
  ) ;
ALTER TABLE T_INSUMO_CULTURA ADD CONSTRAINT CK_INSUMO_CULTURA_QTD CHECK (quantidade > 0) ;
ALTER TABLE T_INSUMO_CULTURA ADD CONSTRAINT PK_T_INSU_CLTR PRIMARY KEY ( cd_cultura, cd_insumo ) ;


CREATE TABLE T_LEITURA
  (
    cd_leitura INTEGER NOT NULL ,
    cd_sensor  INTEGER NOT NULL ,
    valor      NUMBER (7,2) NOT NULL ,
               TIMESTAMP DATE NOT NULL
  ) ;
ALTER TABLE T_LEITURA ADD CONSTRAINT PK_T_LEITURA PRIMARY KEY ( cd_sensor, cd_leitura ) ;


CREATE TABLE T_PLANTACAO
  (
    cd_plantacao      INTEGER NOT NULL ,
    cd_fazenda        INTEGER NOT NULL ,
    cd_cultura        INTEGER NOT NULL ,
    largura           NUMBER (7,2) NOT NULL ,
    altura            NUMBER (7,2) NOT NULL ,
    dt_inicio_plantio DATE NOT NULL ,
    dt_colheita       DATE
  ) ;
CREATE UNIQUE INDEX IDX_PLANTACAO ON T_PLANTACAO
  (
    cd_cultura ASC
  )
  ;
ALTER TABLE T_PLANTACAO ADD CONSTRAINT PK_T_PLANTACAO PRIMARY KEY ( cd_plantacao ) ;


CREATE TABLE T_SENSOR
  (
    cd_sensor  INTEGER NOT NULL ,
    cd_fazenda INTEGER NOT NULL ,
    tipo       VARCHAR2 (50) NOT NULL ,
    nome       VARCHAR2 (100) NOT NULL ,
    ativado    CHAR (1) ,
    posicao_x  NUMBER (3,2) NOT NULL ,
    posicao_y  NUMBER (3,2) NOT NULL
  ) ;
ALTER TABLE T_SENSOR ADD CONSTRAINT PK_T_SENSOR PRIMARY KEY ( cd_sensor ) ;


ALTER TABLE T_APLICADOR ADD CONSTRAINT FK_T_APLICADOR_T_FAZENDA FOREIGN KEY ( cd_fazenda ) REFERENCES T_FAZENDA ( cd_fazenda ) ;

ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT FK_T_APL_INSU_T_APLDR FOREIGN KEY ( cd_aplicador ) REFERENCES T_APLICADOR ( cd_aplicador ) ;

ALTER TABLE T_APLICACAO_INSUMO ADD CONSTRAINT FK_T_APL_INSU_T_INSU FOREIGN KEY ( cd_insumo ) REFERENCES T_INSUMO ( cd_insumo ) ;

ALTER TABLE T_COMPRA ADD CONSTRAINT FK_T_COMPRA_T_FAZENDA FOREIGN KEY ( cd_fazenda ) REFERENCES T_FAZENDA ( cd_fazenda ) ;

ALTER TABLE T_COMPRA ADD CONSTRAINT FK_T_COMPRA_T_FORNECEDOR FOREIGN KEY ( cd_fornecedor ) REFERENCES T_FORNECEDOR ( cd_fornecedor ) ;

ALTER TABLE T_COMPRA ADD CONSTRAINT FK_T_COMPRA_T_INSUMO FOREIGN KEY ( cd_insumo ) REFERENCES T_INSUMO ( cd_insumo ) ;

ALTER TABLE T_FUNCIONARIO ADD CONSTRAINT FK_T_FUNC_T_FAZENDA FOREIGN KEY ( cd_fazenda ) REFERENCES T_FAZENDA ( cd_fazenda ) ;

ALTER TABLE T_INSUMO_CULTURA ADD CONSTRAINT FK_T_INSU_CLTR_T_CLTR FOREIGN KEY ( cd_cultura ) REFERENCES T_CULTURA ( cd_cultura ) ;

ALTER TABLE T_INSUMO_CULTURA ADD CONSTRAINT FK_T_INSU_CLTR_T_INSU FOREIGN KEY ( cd_insumo ) REFERENCES T_INSUMO ( cd_insumo ) ;

ALTER TABLE T_LEITURA ADD CONSTRAINT FK_T_LEITURA_T_SENSOR FOREIGN KEY ( cd_sensor ) REFERENCES T_SENSOR ( cd_sensor ) ;

ALTER TABLE T_PLANTACAO ADD CONSTRAINT FK_T_PLANTACAO_T_CULTURA FOREIGN KEY ( cd_cultura ) REFERENCES T_CULTURA ( cd_cultura ) ;

ALTER TABLE T_PLANTACAO ADD CONSTRAINT FK_T_PLANTACAO_T_FAZENDA FOREIGN KEY ( cd_fazenda ) REFERENCES T_FAZENDA ( cd_fazenda ) ;

ALTER TABLE T_SENSOR ADD CONSTRAINT FK_T_SENSOR_T_FAZENDA FOREIGN KEY ( cd_fazenda ) REFERENCES T_FAZENDA ( cd_fazenda ) ;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             1
-- ALTER TABLE                             34
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
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
