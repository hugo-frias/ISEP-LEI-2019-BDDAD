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