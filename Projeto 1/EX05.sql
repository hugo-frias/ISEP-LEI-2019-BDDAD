SET SERVEROUTPUT ON;

create or replace FUNCTION maxMatriculaDate(v_date Veiculos_Condutores.data_inicio%TYPE, v_matricula Veiculos_Condutores.matricula%type) RETURN DATE
IS
    return_date Veiculos_Condutores.data_inicio%TYPE;
BEGIN
  SELECT MIN(data_inicio) INTO return_date
    FROM (SELECT data_inicio FROM Veiculos_Condutores WHERE data_inicio >= v_date AND Veiculos_Condutores.matricula = v_matricula);
    
    IF return_date IS NULL THEN
        return NULL;
     ELSE 
  RETURN (return_date);
    END IF;
  END;


create or replace PROCEDURE procDetetarAssociacoes IS
EX_ERRO EXCEPTION;
aux_date Date;
BEGIN
  FOR um IN (SELECT * FROM Veiculos_Condutores)
  LOOP
  BEGIN
    FOR dois IN (SELECT * FROM Veiculos_Condutores)
    LOOP
    BEGIN
       IF um.data_inicio != dois.data_inicio THEN
          IF um.matricula = dois.matricula OR um.nr_idCivil = dois.nr_idCivil  THEN
            IF (um.data_inicio >= dois.data_inicio AND um.data_inicio <= dois.data_fim) OR (um.data_fim >= dois.data_inicio AND um.data_fim <= dois.data_fim) THEN
            	aux_date := maxmatriculadate(um.data_inicio, um.matricula);
                IF dois.data_inicio IS NULL OR um.data_inicio IS NULL OR aux_date IS NULL THEN
            		RAISE EX_ERRO;
            	ELSE
            		Update Veiculos_Condutores SET data_fim = aux_date
                    WHERE data_fim = um.data_fim;
            	END IF;
            END IF;
          END IF;
       END IF;
    END;
  END LOOP;
  END;
  END LOOP;
    EXCEPTION
        WHEN EX_ERRO THEN
            DBMS_OUTPUT.PUT_LINE('Nao foi possivel corrigir todas as sobreposicoes.');
  END;

BEGIN
procDetetarAssociacoes;
END;
/

SELECT data_inicio, data_fim, matricula
FROM Veiculos_Condutores
WHERE UPPER(matricula) LIKE 'AA-BB-11';