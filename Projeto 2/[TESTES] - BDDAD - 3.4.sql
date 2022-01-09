SET SERVEROUTPUT ON;

DROP TABLE Veiculos_Condutores  CASCADE CONSTRAINTS PURGE;

CREATE TABLE Veiculos_Condutores (
    matricula   CHAR(8)  CONSTRAINT  nn_veiculos_condutores_matricula NOT NULL,
    nr_idCivil  INTEGER  CONSTRAINT  nn_veiculos_condutores_nr_idCivil NOT NULL,    
    data_inicio DATE   CONSTRAINT  nn_veiculos_condutores_data_inicio NOT NULL CONSTRAINT uk_veiculos_condutores_data_inicio UNIQUE,
    data_fim    DATE
);

insert into Veiculos_Condutores values('AA-BB-11', 5678, to_date('2019-10-04', 'yyyy-mm-dd'), to_date('2019-10-05',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('AA-BB-11', 9012, to_date('2019-10-06', 'yyyy-mm-dd'), to_date('2019-10-09',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('CC-DD-11', 6652, to_date('2019-10-08', 'yyyy-mm-dd'), to_date('2019-10-14',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('AA-BB-11', 1234, to_date('2019-10-10', 'yyyy-mm-dd'), to_date('2019-10-17', 'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('EE-FF-11', 8620, to_date('2019-10-18', 'yyyy-mm-dd'), to_date('2019-10-19', 'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('GG-HH-11', 7558, to_date('2019-10-01', 'yyyy-mm-dd'), to_date('2019-10-03', 'yyyy-mm-dd'));

CREATE OR REPLACE TRIGGER trgCondutoresVeiculosAssociacoes
BEFORE INSERT OR UPDATE OF matricula, nr_idCivil ON Veiculos_Condutores
FOR EACH ROW

DECLARE
    Pragma Autonomous_Transaction;
    ex_update_homem_invalido EXCEPTION;
    ex_update_carro_invalido EXCEPTION;

BEGIN
  FOR vehicleToBeAnalyzed IN (SELECT * FROM Veiculos_Condutores)
    LOOP
    BEGIN
       IF vehicleToBeAnalyzed.data_inicio != :NEW.data_inicio OR (:OLD.matricula = NULL OR :OLD.nr_idCivil = NULL) THEN
          IF vehicleToBeAnalyzed.matricula = :NEW.matricula OR vehicleToBeAnalyzed.nr_idCivil = :NEW.nr_idCivil  THEN
             IF (vehicleToBeAnalyzed.data_inicio >= :NEW.data_inicio AND vehicleToBeAnalyzed.data_inicio <= :NEW.data_fim) OR (vehicleToBeAnalyzed.data_fim >= :NEW.data_inicio AND vehicleToBeAnalyzed.data_fim <= :NEW.data_fim) THEN
                IF(vehicleToBeAnalyzed.matricula != :NEW.matricula AND vehicleToBeAnalyzed.nr_idCivil = :NEW.nr_idCivil) THEN
                    RAISE ex_update_homem_invalido;
                IF(vehicleToBeAnalyzed.matricula = :NEW.matricula AND vehicleToBeAnalyzed.nr_idCivil != :NEW.nr_idCivil) THEN
                    RAISE ex_update_carro_invalido;
                END IF;
                END IF;
                RAISE ex_update_carro_invalido;
             END IF;
          END IF;
       END IF;
    END;
  END LOOP;
EXCEPTION
    WHEN ex_update_carro_invalido THEN
        RAISE_APPLICATION_ERROR(-20008, 'O veículo em questão já está selecionado no intervalo de tempo pretendido.');
    WHEN ex_update_homem_invalido THEN
        RAISE_APPLICATION_ERROR(-20010, 'O condutor em questão já está selecionado no intervalo de tempo pretendido.');
END;
/

SELECT *
FROM Veiculos_Condutores;


-- UPDATE CORRETO COM FOCO NO HOMEM --
UPDATE veiculos_condutores
SET nr_idCivil=9012
WHERE matricula='GG-HH-11' AND data_inicio = to_date('2019-10-01', 'yyyy-mm-dd');

-- UPDATE CORRETO COM FOCO NO CARRO --
UPDATE veiculos_condutores
SET matricula='GG-HH-11'
WHERE nr_idCivil = 8620 AND data_inicio = to_date('2019-10-18', 'yyyy-mm-dd');

-- TESTE DE SOBREPOSIÇÃO COM FOCO NO CONDUTOR --
UPDATE veiculos_condutores
SET nr_idCivil=9012
WHERE matricula='CC-DD-11' AND data_inicio = to_date('2019-10-08', 'yyyy-mm-dd');

-- TESTE SOBREPOSIÇÃO COM FOCO NO CARRO --
UPDATE veiculos_condutores
SET matricula='CC-DD-11'
WHERE nr_idCivil = 1234 AND data_inicio = to_date('2019-10-10', 'yyyy-mm-dd');

-- INSERT CORRETO COM FOCO NO HOMEM --
INSERT INTO Veiculos_Condutores VALUES('GG-HH-11', 9012, to_date('2019-10-20', 'yyyy-mm-dd'), to_date('2019-10-23', 'yyyy-mm-dd'));

-- INSERT CORRETO COM FOCO NO CARRO --
INSERT INTO Veiculos_Condutores VALUES('GG-HH-11', 6969, to_date('2019-10-25', 'yyyy-mm-dd'), to_date('2019-10-26', 'yyyy-mm-dd'));

-- SOBREPOSIÇÃO DE CONDUTOR --
INSERT INTO Veiculos_Condutores VALUES('CC-DD-11', 9012, to_date('2019-10-07', 'yyyy-mm-dd'), to_date('2019-10-10', 'yyyy-mm-dd'));

-- SOBREPOSIÇÃO DE CARRO --
INSERT INTO Veiculos_Condutores VALUES('CC-DD-11', 5678, to_date('2019-10-10', 'yyyy-mm-dd'), to_date('2019-10-27', 'yyyy-mm-dd'));

-- DELETE PARA TESTES --
DELETE FROM veiculos_condutores WHERE nr_idCivil = 5678 AND data_inicio = to_date('2019-10-14', 'yyyy-mm-dd');