-- A --

SELECT nome FROM (Condutores
INNER JOIN Veiculos_Condutores ON Condutores.nr_idCivil = Veiculos_Condutores.nr_idCivil
INNER JOIN Veiculos ON Veiculos.matricula = Veiculos_Condutores.matricula)
WHERE Veiculos.marca NOT LIKE 'Toyota';

-- B --

WITH TOP3 AS (
    SELECT SERVICOS.cod_servico, CONDUTORES.*,
    preco_base + (custo_minuto*duracao_minutos) + (custo_km*distancia_km) + (custo_espera_minuto*atraso_passageiro_minutos) + (preco_base + (custo_minuto*duracao_minutos) + (custo_km*distancia_km) + (custo_espera_minuto*atraso_passageiro_minutos)*taxa_IVA/100) AS "Custo_Viagem", 
    ROW_NUMBER() OVER (PARTITION BY SERVICOS.cod_servico 
    ORDER BY SERVICOS.cod_servico,
    preco_base + (custo_minuto*duracao_minutos) + (custo_km*distancia_km) + (custo_espera_minuto*atraso_passageiro_minutos) + (preco_base + (custo_minuto*duracao_minutos) + (custo_km*distancia_km) + (custo_espera_minuto*atraso_passageiro_minutos)*taxa_IVA/100) DESC)
    AS nr_rows   
    FROM CONDUTORES
    INNER JOIN PEDIDOS_VIAGENS ON CONDUTORES.nr_idCivil = PEDIDOS_VIAGENS.nr_idCivil
    FULL JOIN SERVICOS ON PEDIDOS_VIAGENS.cod_servico = SERVICOS.cod_servico
    INNER JOIN VIAGENS ON PEDIDOS_VIAGENS.cod_pedido = VIAGENS.cod_pedido
    INNER JOIN CUSTOS_SERVICOS ON SERVICOS.cod_servico = CUSTOS_SERVICOS.cod_servico
    WHERE PEDIDOS_VIAGENS.cancelado LIKE 'N'
    )

   SELECT * FROM TOP3 WHERE nr_rows <= 3;
-- C --

SELECT V.*
	FROM VIAGENS V
	INNER JOIN ITENERARIOS_VIAGENS IV ON V.cod_viagem = IV.cod_viagem
	WHERE hora_passagem > (SELECT MEDIAN(hora_passagem) FROM ITENERARIOS_VIAGENS 
    		INNER JOIN PONTOS_TURISTICOS ON ITENERARIOS_VIAGENS.COD_PONTO_TURISTICO = PONTOS_TURISTICOS.COD_PONTO_TURISTICO
    		WHERE PONTOS_TURISTICOS.TIPO_PONTO_TURISTICO = 'MU');

-- D --
SELECT *
FROM pedidos_viagens p
INNER JOIN viagens v ON v.cod_pedido = p.cod_pedido
WHERE (120<(SELECT SUM(aux)
     FROM(SELECT atraso_passageiro_minutos as aux
     FROM viagens
     WHERE atraso_passageiro_minutos = v.atraso_passageiro_minutos
     UNION ALL
     SELECT duracao_minutos as aux
     FROM viagens
     WHERE duracao_minutos = v.duracao_minutos)) AND
     p.cancelado = 'N');



-- F --
SELECT C.NOME, C.NR_IDCIVIL, V.COD_VIAGEM
FROM Condutores C
INNER JOIN PEDIDOS_VIAGENS PV ON C.NR_IDCIVIL = PV.NR_IDCIVIL
INNER JOIN VIAGENS V ON PV.COD_PEDIDO = V.COD_PEDIDO
INNER JOIN SERVICOS S ON PV.COD_SERVICO = S.COD_SERVICO
INNER JOIN CUSTOS_SERVICOS CS ON S.COD_SERVICO = CS.COD_SERVICO
WHERE C.nr_idCivil NOT LIKE C.NR_IDCIVIL_SUPERVISOR
AND UPPER(PV.CANCELADO) NOT LIKE 'S'
AND  preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos) + (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos)) * taxa_iva < (SELECT AVG((preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos) + (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos)) * taxa_iva)) FROM (SELECT (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos) + (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos)) * taxa_iva) FROM CUSTOS_SERVICOS
INNER JOIN SERVICOS ON CUSTOS_SERVICOS.COD_SERVICO = SERVICOS.COD_SERVICO
INNER JOIN PEDIDOS_VIAGENS ON SERVICOS.COD_SERVICO = PEDIDOS_VIAGENS.COD_SERVICO
INNER JOIN VIAGENS ON PEDIDOS_VIAGENS.COD_PEDIDO = VIAGENS.COD_PEDIDO
INNER JOIN CONDUTORES ON PEDIDOS_VIAGENS.NR_IDCIVIL = CONDUTORES.NR_IDCIVIL
WHERE CONDUTORES.NR_IDCIVIL = C.NR_IDCIVIL
AND UPPER(PEDIDOS_VIAGENS.CANCELADO) NOT LIKE 'S'
ORDER BY (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos) + (preco_base + (custo_minuto * duracao_minutos) + (custo_km * distancia_km)
+ (custo_espera_minuto * atraso_passageiro_minutos)) * taxa_iva) ASC
FETCH FIRST 20 PERCENT ROWS ONLY));
-- G --
-- H --

SELECT C.nome, C.nr_idCivil, v.*
FROM CONDUTORES C
INNER JOIN PEDIDOS_VIAGENS PV ON c.nr_idCivil = PV.nr_idCiviL
INNER JOIN VIAGENS V ON PV.cod_pedido = V.cod_pedido
INNER JOIN ITENERARIOS_VIAGENS IV ON V.cod_viagem = IV.cod_viagem
INNER JOIN PONTOS_TURISTICOS PT ON IV.cod_ponto_turistico = PT.cod_ponto_turistico
WHERE PV.cancelado LIKE 'N'
AND IV.hora_passagem = ALL(
SELECT hora_passagem 
FROM (
SELECT DISTINCT ITENERARIOS_VIAGENS.*
FROM ITENERARIOS_VIAGENS
INNER JOIN VIAGENS ON ITENERARIOS_VIAGENS.cod_viagem = VIAGENS.cod_viagem
INNER JOIN PEDIDOS_VIAGENS ON VIAGENS.cod_pedido = PEDIDOS_VIAGENS.cod_pedido
WHERE PEDIDOS_VIAGENS.nr_idCivil = PV.nr_idCivil
AND VIAGENS.cod_viagem = V.cod_viagem));
-- I --



SELECT DISTINCT C.NOME, C.NR_IDCIVIL
FROM CONDUTORES C
INNER JOIN PEDIDOS_VIAGENS PV ON C.NR_IDCIVIL = PV.NR_IDCIVIL
INNER JOIN VIAGENS V ON PV.COD_PEDIDO = V.COD_PEDIDO
INNER JOIN ITENERARIOS_VIAGENS IV ON V.COD_VIAGEM = IV.COD_VIAGEM
INNER JOIN PONTOS_TURISTICOS PT ON IV.COD_PONTO_TURISTICO = PT.COD_PONTO_TURISTICO
WHERE UPPER(PV.CANCELADO) NOT LIKE 'S'
AND 5 <= (SELECT COUNT(DISTINCT CONDUTORES.NR_IDCIVIL) FROM CONDUTORES 
INNER JOIN PEDIDOS_VIAGENS ON CONDUTORES.NR_IDCIVIL = PEDIDOS_VIAGENS.NR_IDCIVIL
INNER JOIN VIAGENS ON PEDIDOS_VIAGENS.COD_PEDIDO = VIAGENS.COD_PEDIDO
INNER JOIN ITENERARIOS_VIAGENS ON VIAGENS.COD_VIAGEM = ITENERARIOS_VIAGENS.COD_VIAGEM
INNER JOIN PONTOS_TURISTICOS ON ITENERARIOS_VIAGENS.COD_PONTO_TURISTICO = PONTOS_TURISTICOS.COD_PONTO_TURISTICO
WHERE UPPER(PONTOS_TURISTICOS.TIPO_PONTO_TURISTICO) LIKE UPPER(PT.TIPO_PONTO_TURISTICO)
AND UPPER(PEDIDOS_VIAGENS.CANCELADO) NOT LIKE 'S');




-- PARTE 2 ---
-- EX1 
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

-- FIRST n ROWS 
-- EX 4
   CREATE OR REPLACE PROCEDURE procAtualizarCustosServico (x Integer, data_update date)
   as
   maior_codigo custos_servicos.cod_servico%type;
   aux DATE;
   BEGIN
  select s.cod_servico into maior_codigo
  FROM servicos s
  INNER JOIN pedidos_viagens pv ON s.cod_servico = pv.cod_servico
  INNER JOIN custos_servicos cs ON s.cod_servico = cs.cod_servico
  WHERE (CAST(pv.data_inicio AS DATE) > add_months(sysdate,-12))
  ORDER BY (SELECT COUNT(cod_servico)
            FROM pedidos_viagens pv 
            where pv.cod_servico = s.cod_servico) DESC
  FETCH FIRST 1 ROW ONLY;
  
  select data_inicio_custo into aux
      from custos_Servicos
      where custos_servicos.cod_servico = maior_codigo
      order by cod_servico
      FETCH FIRST 1 ROW ONLY;
    
  if aux  between data_update and add_months(data_update,-6)
  then
    DBMS_OUTPUT.PUT_LINE('Servico atualizado num periodo inferior a 6 meses');
 else
    UPDATE custos_Servicos SET preco_base  = preco_base + (preco_base*x)/100, custo_minuto  = custo_minuto+ (custo_minuto)*x/100, 
    custo_espera_minuto  = custo_espera_minuto+(custo_espera_minuto*x)/100, custo_cancelamento_pedido  = custo_cancelamento_pedido+(custo_cancelamento_pedido*x)/100  WHERE custos_servicos.cod_servico = maior_codigo;
    end if;
   end;
   /
  
  SELECT preco_base, custo_minuto, custo_espera_minuto, custo_cancelamento_pedido
  FROM custos_servicos;
  
  begin
 procAtualizarCustosServico(10, TO_DATE('12/Dezembro/2019', 'dd/mon/yy'));
 end;
 /


  

