SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION funcSobreposicoesVeiculosAutomoveis RETURN BOOLEAN
IS
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
                RETURN TRUE;
             END IF;
          END IF;
       END IF;
    END;
  END LOOP;
  END;
  END LOOP;
  RETURN FALSE;
  END;
/
  BEGIN
  IF funcSobreposicoesVeiculosAutomoveis = FALSE then
  DBMS_OUTPUT.PUT_LINE('Não existe sobreposição!');
  ELSE
  DBMS_OUTPUT.PUT_LINE('Existe sobreposição!');
  END if;
  END;