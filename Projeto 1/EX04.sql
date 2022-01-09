SET SERVEROUTPUT ON;

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
  
  DBMS_OUTPUT.PUT_LINE(maior_codigo);
  select data_inicio_custo into aux
      from custos_Servicos
      where custos_servicos.cod_servico = maior_codigo
      order by cod_servico
      FETCH FIRST 1 ROW ONLY;
    
   DBMS_OUTPUT.PUT_LINE(aux); 
  if aux between add_months(data_update, -6) and data_update
  then
    DBMS_OUTPUT.PUT_LINE('Servico atualizado num periodo inferior a 6 meses');
 else
    UPDATE custos_Servicos SET preco_base  = preco_base + (preco_base*x)/100, custo_minuto  = custo_minuto+ (custo_minuto)*x/100, 
    custo_espera_minuto  = custo_espera_minuto+(custo_espera_minuto*x)/100, custo_cancelamento_pedido  = custo_cancelamento_pedido+(custo_cancelamento_pedido*x)/100  WHERE custos_servicos.cod_servico = maior_codigo;
 end if;
   end;
   /
  
  SELECT *
  FROM custos_servicos;
  
  begin
 procAtualizarCustosServico(10, TO_DATE('12/Dezembro/2019', 'dd/mon/yy'));
 end;
 /