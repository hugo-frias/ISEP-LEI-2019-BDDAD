create or replace FUNCTION funcObterInfoSemanalVeiculos(v_date Veiculos_Condutores.data_inicio%type) RETURN sys_refcursor
AS
    c_all_info sys_refcursor;
BEGIN

IF
    v_date > sysdate then
    return NULL;
end if;

    OPEN c_all_info FOR 
        SELECT COUNT (pv.cod_pedido) AS "QTDVIAGENS", pv.matricula AS "MATRICULA", SUM(pv.distancia_km) AS "TOTALKM", SUM(v.duracao_minutos) AS "TOTALMIN", TRUNC(v_date, 'iw') AS "STARTWEEK", TRUNC(v_date, 'iw') +7 -1/86400 AS "ENDWEEK"
        FROM Pedidos_Viagens pv
        INNER JOIN Viagens v ON pv.cod_pedido = v.cod_pedido
        INNER JOIN Veiculos_Condutores vc ON pv.matricula = vc.matricula
        WHERE TRUNC(v_date, 'iw') <= vc.data_inicio
        AND TRUNC(v_date, 'iw') +7 -1/86400  >= vc.data_fim
        GROUP BY pv.matricula;
    
        RETURN (c_all_info);
END;
/