CREATE OR REPLACE TRIGGER trgCalculoCustoCancelamento
AFTER INSERT OR UPDATE OF cancelado on pedidos_viagens
FOR EACH ROW

DECLARE
Pragma Autonomous_Transaction;
data_invalida_ex    EXCEPTION;
pedido_a_alterar    INTEGER;
data_marcada        TIMESTAMP;
cod_servico_aux     VARCHAR(04);
custo_cancelamento_aux      INTEGER;
distancia_aux       INTEGER;
custo_km_aux        INTEGER;
percentagem_acrescimo_aux   INTEGER;
BEGIN
    
    SELECT cod_pedido into pedido_a_alterar
    FROM pedidos_viagens pv
    WHERE pv.cod_pedido = :new.cod_pedido;
    
    select data_hora_recolha_passageiro into data_marcada
    from pedidos_viagens pv
    where pv.cod_pedido = pedido_a_alterar;
    
    select cod_servico into cod_servico_aux
    from pedidos_viagens pv
    where pv.cod_pedido = pedido_a_alterar;
    
    select custo_cancelamento_pedido into custo_cancelamento_aux
    from custos_servicos cs
    where cs.cod_servico = cod_servico_aux;
    
    select distancia_km into distancia_aux
    from pedidos_viagens pv
    where pv.cod_pedido = pedido_a_alterar;
    
    select custo_km into custo_km_aux
    from custos_servicos cs
    where cs.cod_servico = cod_servico_aux;
    
    select percentagem_acrescimo into percentagem_acrescimo_Aux
    from custos_servicos cs
    where cs.cod_servico = cod_servico_aux;
    
    
    if( systimestamp < data_marcada - (1/24)) then
    update pedidos_viagens pv set custo_a_pagar_cancelado = custo_cancelamento_aux where pv.cod_pedido = pedido_a_alterar;
    else
    update pedidos_viagens pv set custo_a_pagar_cancelado = custo_cancelamento_aux + percentagem_acrescimo_Aux * (custo_km_aux * distancia_aux) where pv.cod_pedido = pedido_a_alterar;
    end if;
    end;
    /
    -- paga a mais
    update pedidos_viagens pv set cancelado = 'S' where pv.cod_pedido = 2;
    -- paga a menos
    update pedidos_viagens pv set cancelado = 'S' where pv.cod_pedido = 99;
    
