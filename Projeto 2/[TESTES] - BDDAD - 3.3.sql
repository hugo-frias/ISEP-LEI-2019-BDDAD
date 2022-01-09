-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE Viagens              CASCADE CONSTRAINTS PURGE;
DROP TABLE Itenerarios_Viagens  CASCADE CONSTRAINTS PURGE;
DROP TABLE Pontos_Turisticos    CASCADE CONSTRAINTS PURGE;
DROP TABLE Pedidos_Viagens      CASCADE CONSTRAINTS PURGE;
DROP TABLE Servicos             CASCADE CONSTRAINTS PURGE;
DROP TABLE Custos_Servicos      CASCADE CONSTRAINTS PURGE;
DROP TABLE Veiculos             CASCADE CONSTRAINTS PURGE;
DROP TABLE Veiculos_Condutores  CASCADE CONSTRAINTS PURGE;
DROP TABLE Condutores           CASCADE CONSTRAINTS PURGE;
DROP TABLE Clientes 		    CASCADE CONSTRAINTS PURGE;
DROP TABLE Fatura_Recibo	    CASCADE CONSTRAINTS PURGE;
DROP TABLE Recibo_Pagamento     CASCADE CONSTRAINTS PURGE;
DROP TABLE Relatorio_Viagem	    CASCADE CONSTRAINTS PURGE;

-- TABELAS

-- ## tabela Veiculos ##
CREATE TABLE Veiculos (
    matricula     CHAR(8)     CONSTRAINT pk_veiculos_matricula  PRIMARY KEY  CONSTRAINT nn_veiculos_matricula  NOT NULL CONSTRAINT ck_veiculos_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
    marca         VARCHAR(40) CONSTRAINT nn_veiculos_marca  NOT NULL,
    modelo        VARCHAR(40) CONSTRAINT nn_veiculos_modelo NOT NULL,
    nr_chassis    VARCHAR(40) CONSTRAINT uk_veiculos_nr_chassis  UNIQUE CONSTRAINT nn_veiculos_nr_chassis NOT NULL,
    data_matricula  DATE      CONSTRAINT nn_veiculos_data_matricula NOT NULL
    );

-- ## tabela Condutores ##
CREATE TABLE Condutores (
    nr_idCivil        INTEGER     CONSTRAINT  pk_condutores_nr_idCivil  PRIMARY KEY CONSTRAINT  nn_condutores_nr_idCivil NOT NULL,
    nome              VARCHAR(40) CONSTRAINT  nn_condutores_nome NOT NULL,
    morada            VARCHAR(40) CONSTRAINT  nn_condutores_morada NOT NULL,
    nr_contribuinte   INTEGER     CONSTRAINT  nn_condutores_nr_contribuinte NOT NULL,
    data_nascimento   DATE        CONSTRAINT  nn_condutores_data_nascimento NOT NULL,
    nr_carta_conducao INTEGER     CONSTRAINT  nn_condutores_nr_carta_conducao   NOT NULL CONSTRAINT uk_condutores_nr_carta_conducao UNIQUE,
    data_validade_carta_conducao DATE   CONSTRAINT nn_condutores_data_validade_carta_conducao   NOT NULL,
    nr_idCivil_supervisor   INTEGER,
    
    CONSTRAINT fk_condutores_nr_idCivil_supervisor FOREIGN KEY (nr_idCivil_supervisor) REFERENCES Condutores (nr_idCivil)
    );   
    
-- ## tabela Veiculos_Condutores ##
CREATE TABLE Veiculos_Condutores (
    matricula   CHAR(8)  CONSTRAINT  nn_veiculos_condutores_matricula NOT NULL CONSTRAINT ck_veiculos_condutores_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
    nr_idCivil  INTEGER  CONSTRAINT  nn_veiculos_condutores_nr_idCivil NOT NULL,    
    data_inicio DATE   CONSTRAINT  nn_veiculos_condutores_data_inicio NOT NULL CONSTRAINT k_veiculos_condutores_data_inicio UNIQUE,
    data_fim    DATE,   
    
    CONSTRAINT pk_veiculos_condutores_matricula_nr_idCivil_data_inicio   PRIMARY KEY (matricula, nr_idCivil, data_inicio),
    
    CONSTRAINT fk_veiculos_condutores_matricula  FOREIGN KEY (matricula) REFERENCES Veiculos (matricula),
    CONSTRAINT fk_veiculos_condutores_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores (nr_idCivil)
);

-- # tabela Serviços ##
CREATE TABLE Servicos (
    cod_servico VARCHAR(4) CONSTRAINT pk_servicos_cod_servico  PRIMARY KEY CONSTRAINT nn_servicos_cod_servico NOT NULL CONSTRAINT ck_servicos_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
    descricao VARCHAR(40) CONSTRAINT nn_servicos_descricao NOT NULL
);

CREATE TABLE Clientes (
    nr_idCivil INTEGER CONSTRAINT  nn_clientes_nr_idCivil NOT NULL,
    nr_Contribuinte INTEGER CONSTRAINT  nn_clientes_nr_contribuinte NOT NULL,
    login VARCHAR(8) CONSTRAINT  nn_clientes_login NOT NULL CONSTRAINT uk_clientes_login UNIQUE,
    palavra_passe VARCHAR(12) CONSTRAINT  nn_clientes_nr_password NOT NULL,
    nome VARCHAR(40) CONSTRAINT  nn_clientes_nome NOT NULL,
    data_nascimento DATE CONSTRAINT  nn_clientes_data_nascimento NOT NULL,

    CONSTRAINT pk_cliente_primary_key PRIMARY KEY (nr_idCivil, nr_Contribuinte, login)
);

-- # tabela Pedidos Viagens ##
CREATE TABLE Pedidos_Viagens (
     cod_pedido INTEGER  CONSTRAINT pk_pedidos_viagens_cod_pedido  PRIMARY KEY CONSTRAINT nn_pedido_viagens_cod_pedido NOT NULL,
     matricula CHAR(8) CONSTRAINT nn_pedidos_viagens_matricula NOT NULL CONSTRAINT ck_pedidos_viagens_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
     nr_idCivil INTEGER CONSTRAINT nn_pedidos_viagens_nr_idCivil NOT NULL,
     data_inicio DATE  CONSTRAINT nn_pedidos_viagens_data_inicio NOT NULL,
     login VARCHAR(8) CONSTRAINT  nn_pedidos_viagens_login NOT NULL,
     cod_servico VARCHAR(4) CONSTRAINT nn_pedidos_viagens_cod_servico NOT NULL CONSTRAINT ck_pedidos_viagens_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
     data_hora_pedido TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_hora_pedido NOT NULL,
     data_hora_recolha_passageiro TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_recolha_passageiro NOT NULL,
     distancia_km INTEGER CONSTRAINT nn_pedidos_viagens_distancia_km NOT NULL,
     cancelado CHAR(1) DEFAULT 'N' CONSTRAINT ck_pedidos_viagens_cancelado CHECK (REGEXP_LIKE(cancelado, '[S]{1}|[N]{1}')),
     custo_a_pagar_cancelado INTEGER,

     CONSTRAINT ch_pedidos_viagens_data_hora_pedido_data_hora_recolha_passageiro CHECK(data_hora_pedido < data_hora_recolha_passageiro),
     CONSTRAINT fk_pedidos_viagens_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores(nr_idCivil),
     CONSTRAINT fk_pedidos_viagens_matricula FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
     CONSTRAINT fk_pedidos_viagens_data_inicio FOREIGN KEY (data_inicio) REFERENCES Veiculos_Condutores(data_inicio),
     CONSTRAINT fk_pedidos_viagens_login FOREIGN KEY (login) REFERENCES Clientes(login),
     CONSTRAINT fk_pedidos_viagens_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico)
);

-- ## tabela Viagens ##
CREATE TABLE Viagens (
    cod_viagem INTEGER CONSTRAINT pk_viagens_cod_viagem PRIMARY KEY  CONSTRAINT nn_viagens_cod_viagem NOT NULL,                          
    cod_pedido INTEGER CONSTRAINT nn_viagens_cod_pedido NOT NULL,
    duracao_minutos INTEGER CONSTRAINT nn_viagens_duracao_minutos NOT NULL,
    atraso_passageiro_minutos INTEGER CONSTRAINT nn_viagens_atraso_passageiro_minutos NOT NULL,
    
    CONSTRAINT fk_viagens_cod_pedido FOREIGN KEY (cod_pedido) REFERENCES Pedidos_Viagens (cod_pedido)
);

-- INSERTS

INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('32-TY-32','Toyota', '300D', '2', TO_DATE('11/Maio/2010','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('ZD-45-90','BMW', '300D', '3', TO_DATE('10/Maio/2009','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('ZD-45-20','Toyota', '300D', '5', TO_DATE('10/Maio/2009','DD/MON/YY'));
    
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(3,'Supervisor','Rua1',34,TO_DATE('20/Janeiro/1950','DD/MON/YY') ,124, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte,data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(123456789,'Joao','Rua2',35,TO_DATE('15/Maio/1990','DD/MON/YY') ,122, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023158,'Pedro','Rua4',37,TO_DATE('20/Janeiro/1970','DD/MON/YY') ,121, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023138,'Pistolas','Rua6',39,TO_DATE('20/Janeiro/2010','DD/MON/YY') ,123, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023140,'Pistolas','Rua6',39,TO_DATE('20/Janeiro/2000','DD/MON/YY') ,126, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);

INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-90',123456789,TO_DATE('11/Maio/2010','DD/MON/YY'), TO_DATE('11/Maio/2010','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('32-TY-32',549023138,TO_DATE('30/Janeiro/2010','DD/MON/YY'), TO_DATE('30/Janeiro/2011','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'), TO_DATE('20/Janeiro/2020','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-20',549023158,TO_DATE('20/Janeiro/2000','DD/MON/YY'), TO_DATE('20/Janeiro/2032','DD/MON/YY'));
    
INSERT INTO servicos(cod_servico, descricao)
    VALUES('LUXO','Luxo');
        
INSERT INTO Clientes(nr_idCivil, nr_Contribuinte, login, palavra_passe, nome, data_nascimento)
    VALUES(123453729,123456709, '1342', '123456789','Francisco',TO_DATE('17/Maio/1980','DD/MON/YY'));
            
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(3,'ZD-45-20',549023158, '1342', TO_DATE('20/Janeiro/2000','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(1,'ZD-45-90',123456789, '1342', TO_DATE('11/Maio/2010','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(91,'32-TY-32',549023138, '1342', TO_DATE('30/Janeiro/2010','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(93,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),1290,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(94,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1300,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(95,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1220,'N',0);
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
    VALUES(97,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1110,'N',0);
    
    
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(75,03,30,110000);
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(73,01,30,10000);
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(70,97,30,2020);
    
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(62,91,51,118);
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(64,93,19,50);
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(65,94,100,193);    
INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(66,95,100,193);
    
-- TRIGGER

Set serveroutput on;

CREATE OR REPLACE TRIGGER trgCondutoresImpedirSupervisores
AFTER INSERT OR UPDATE ON Condutores
  DECLARE
  idade_invalida EXCEPTION;
  viagens_invalida EXCEPTION;
  idade NUMBER;
  viagens_supervisionados NUMBER;
  viagens_supervisor NUMBER;
  data_n DATE;
  BEGIN
     FOR aux IN (SELECT nr_idCivil_supervisor 
                 FROM Condutores C)
     LOOP
     BEGIN
         SELECT data_nascimento INTO data_n
         FROM Condutores E 
         WHERE E.nr_idCivil = aux.nr_idCivil_supervisor;
         
         SELECT COUNT(*) INTO idade 
         FROM Condutores D 
         WHERE D.nr_idCivil != aux.nr_idCivil_supervisor
         AND D.nr_idCivil_supervisor = aux.nr_idCivil_supervisor
         AND ABS(EXTRACT(YEAR FROM data_n) - EXTRACT(YEAR FROM D.data_nascimento)) <= 5;

         IF idade > 0 THEN            
            RAISE idade_invalida;
         END IF;
         SELECT COUNT(*) into viagens_supervisionados
            FROM Viagens V
            INNER JOIN Pedidos_Viagens PV ON V.cod_pedido = PV.cod_pedido
            INNER JOIN Veiculos_Condutores VC ON PV.nr_idCivil = VC.nr_idCivil
            INNER JOIN Condutores C1 ON VC.nr_idCivil = C1.nr_idCivil
            WHERE C1.nr_idCivil_supervisor = aux.nr_idCivil_supervisor
            AND C1.nr_idCivil != aux.nr_idCivil_supervisor;
            
            SELECT COUNT(*) into viagens_supervisor
            FROM Viagens V1
            INNER JOIN Pedidos_Viagens PV1 ON V1.cod_pedido = PV1.cod_pedido
            INNER JOIN Veiculos_Condutores VC1 ON PV1.nr_idCivil = VC1.nr_idCivil
            INNER JOIN Condutores C1 ON VC1.nr_idCivil = C1.nr_idCivil
            WHERE C1.nr_idCivil = aux.nr_idCivil_supervisor;

            IF viagens_supervisionados >= viagens_supervisor THEN
               RAISE viagens_invalida;
            END IF;
                  END;
                  END LOOP;
      EXCEPTION
      WHEN idade_invalida THEN
        IF INSERTING THEN
        raise_application_error(-20001,'Idade do supervisor inválida no insert.');
        ELSE
        raise_application_error(-20001,'Idade do supervisor inválida no update.');
        END IF;
      WHEN viagens_invalida THEN
      IF INSERTING THEN
        raise_application_error(-20001,'Número de viagens do supervisor inválido no insert.');
        ELSE
        raise_application_error(-20001,'Número de viagens do supervisor inválido no update.');
        END IF;
END;
/

-- Com este dado, o trigger deverá permitir que o update seja dado com sucesso--
UPDATE Condutores
SET  nr_idCivil_supervisor = 3 
WHERE nr_idCivil = 549023138;

-- Com este dado, o trigger deverá apresentar uma mensagem de erro de update relativa à idade do supervisor
UPDATE Condutores
SET data_nascimento = TO_DATE('20/Janeiro/1970','DD/MON/YY')
WHERE nr_idCivil = 3;

-- Com este dado, o trigger deverá apresentar uma mensagem de erro de insert relativa à idade do supervisor
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023145,'Pistolas','Rua6',39,TO_DATE('20/Janeiro/1953','DD/MON/YY') ,125, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
    
-- Com este dado, o trigger deverá apresentar uma mensagem de erro de update relativa ao número de viagens do supervisor
UPDATE Condutores
SET  nr_idCivil_supervisor = 549023138
WHERE nr_idCivil = 3;

-- Com este dado, o trigger deverá dar uma mensagem de erro de insert relativa ao número de viagens do supervisor
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023145,'Pistolas','Rua6',39,TO_DATE('20/Janeiro/1953','DD/MON/YY') ,127, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 549023140);

-- Select de Condutores
SELECT *
FROM Condutores;