CREATE OR REPLACE TRIGGER trgAtribuicaoPedido
BEFORE INSERT OR UPDATE OF matricula ON pedidos_Viagens
FOR EACH ROW

DECLARE
Pragma Autonomous_Transaction;
data_invalida_ex    EXCEPTION;
data_inicio_aux     DATE;
data_hora_aux       TIMESTAMP;

BEGIN

    SELECT data_inicio into data_inicio_aux
    FROM veiculos_condutores vc
    WHERE vc.matricula = :new.matricula;

    SELECT data_hora_recolha_passageiro into data_hora_aux
    from pedidos_viagens pv
    where pv.cod_pedido = :new.cod_pedido;
    
  
    IF(data_inicio_aux > data_hora_aux) THEN
       RAISE data_invalida_ex;
       END IF;
       
EXCEPTION
        WHEN data_invalida_ex THEN
        RAISE_APPLICATION_ERROR(-20010, 'Data inválida! A data de inicio do veiculo condutor tem de ser inferior ou igual á data hora recolha passageiro!');
END;
/
-- inserts de dados corretos
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('01-AA-02','Tesla', 'XPTO', '50', TO_DATE('22/Abril/2011','DD/MON/YY'));
    
  INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(112311234,'Zé tó','Rua1',40,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,902, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
    
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('01-AA-02',112311234,TO_DATE('11/Maio/1999','DD/MON/YY'), TO_DATE('11/Maio/2000','DD/MON/YY'));

UPDATE pedidos_viagens set matricula = '01-AA-02' where cod_pedido = 1;
---
-- inserts dados incorretos

INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('01-AA-03','Tesla', 'XPTO', '51', TO_DATE('22/Abril/2011','DD/MON/YY'));
    
  INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(112311232,'Zé tó','Rua1',41,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,992, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
    
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('01-AA-03',112311232,TO_DATE('11/Maio/2030','DD/MON/YY'), TO_DATE('11/Maio/2040','DD/MON/YY'));

UPDATE pedidos_viagens set matricula = '01-AA-03' where cod_pedido = 1;

---

select *
FROM PEDIDOS_VIAGENS
WHERE COD_PEDIDO = 1;

select *
FROM veiculos_condutores
where matricula = '01-AA-02';


select *
FROM veiculos_condutores
where matricula = '01-AA-03';