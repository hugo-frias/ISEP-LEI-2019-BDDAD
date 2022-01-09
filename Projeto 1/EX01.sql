SET SERVEROUTPUT ON; 
     
      
create or replace FUNCTION funcTopServico (
    v_tipo_servico servicos.cod_servico%TYPE ,  
    v_periodo_inicio TIMESTAMP,
    v_periodo_fim TIMESTAMP,
    n INTEGER
    ) RETURN sys_refcursor  
    
    
    as
    cursor_final sys_refcursor;   
    
BEGIN    
IF
    v_periodo_inicio>v_periodo_fim then
    return null;
end if;
    
open cursor_final for

SELECT pv.nr_idCivil
            FROM Viagens v
            INNER JOIN Pedidos_Viagens pv ON v.cod_pedido = pv.cod_pedido
            INNER JOIN Servicos s ON pv.cod_servico = s.cod_servico
            INNER JOIN Custos_servicos cs ON cs.cod_servico = s.cod_servico
               WHERE v_tipo_servico = pv.cod_servico  AND pv.data_hora_recolha_passageiro BETWEEN v_periodo_inicio AND v_periodo_fim 
            GROUP BY
            pv.nr_idCivil
            ORDER BY SUM((preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
            	+ (custo_espera_minuto * atraso_passageiro_minutos))) ASC
            FETCH FIRST n ROWS ONLY;

        return (cursor_final);
end;
/


DECLARE


c_cursor sys_refcursor;
r_condutor integer;
BEGIN
c_cursor := funcTopServico(1,TO_TIMESTAMP('2000-11-10 01:00:00','YYYY/MM/DD HH24:MI:SS'), TO_TIMESTAMP('2030-11-10 01:00:00','YYYY/MM/DD HH24:MI:SS'), 3); 
DBMS_OUTPUT.PUT_LINE('ID Civil dos condutores');    
 loop
        fetch c_cursor INTO r_condutor;
        exit when c_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(r_condutor);        
        end loop; 
 close c_cursor;
END;
/   