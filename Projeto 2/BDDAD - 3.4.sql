SET SERVEROUTPUT ON;

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
             END IF;
          END IF;
       END IF;
    END;
  END LOOP;
EXCEPTION
    WHEN ex_update_invalido THEN
        RAISE_APPLICATION_ERROR(-20008, 'O veículo em questão já está selecionado no intervalo de tempo pretendido.');
    WHEN ex_update_homem_invalido THEN
        RAISE_APPLICATION_ERROR(-20010, 'O condutor em questão já está selecionado no intervalo de tempo pretendido.');
END;
/