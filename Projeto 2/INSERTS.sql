SET time_zone='+00:00';

INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('07-BY-53','Ford', 'XPTO', '1', TO_DATE('22/Abril/2011','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('32-TY-32','Toyota', '300D', '2', TO_DATE('11/Maio/2010','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('ZD-45-90','BMW', '300D', '3', TO_DATE('10/Maio/2009','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('ZD-45-10','BMW', '300D', '4', TO_DATE('10/Maio/2009','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('ZD-45-20','Toyota', '300D', '5', TO_DATE('10/Maio/2009','DD/MON/YY'));
    
    
  INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(3,'Supervisor','Rua1',34,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,124, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
        INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(9014,'Diogo','Rua9',42,TO_DATE('20/Janeiro/2018','DD/MON/YY') ,134, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
    INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte,data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(123456789,'Joao','Rua2',35,TO_DATE('15/Maio/1980','DD/MON/YY') ,122, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(019201921,'Manuel','Rua3',36,TO_DATE('20/Maio/1982','DD/MON/YY') ,120, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023158,'Pedro','Rua4',37,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,121, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023148,'Jonas','Rua5',38,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,125, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023138,'Pistolas','Rua6',39,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,123, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 9014);
    
    
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(1234,'Alberto','Rua7',40,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,130, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(5678,'Ruben','Rua8',41,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,133, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);    
INSERT INTO Condutores(nr_idCivil, nome, morada, nr_contribuinte, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(9012,'Diogo','Rua9',42,TO_DATE('20/Janeiro/1990','DD/MON/YY') ,132, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);

INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-90',123456789,TO_DATE('11/Maio/2010','DD/MON/YY'), TO_DATE('11/Maio/2010','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-90',123456789,TO_DATE('11/Maio/2019','DD/MON/YY'), TO_DATE('11/Maio/2020','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('32-TY-32',549023138,TO_DATE('30/Janeiro/2010','DD/MON/YY'), TO_DATE('30/Janeiro/2011','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('07-BY-53',019201921,TO_DATE('20/Janeiro/2010','DD/MON/YY'), TO_DATE('20/Janeiro/2011','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-90',3,TO_DATE('20/Janeiro/2019','DD/MON/YY'), TO_DATE('20/Janeiro/2020','DD/MON/YY'));
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-10',549023148,TO_DATE('20/Janeiro/2008','DD/MON/YY'), TO_DATE('20/Janeiro/2032','DD/MON/YY'));    
INSERT INTO Veiculos_Condutores(matricula, nr_idCivil,data_inicio, data_fim)
    VALUES('ZD-45-20',549023158,TO_DATE('20/Janeiro/2000','DD/MON/YY'), TO_DATE('20/Janeiro/2032','DD/MON/YY'));
    
        INSERT INTO servicos(cod_servico, descricao)
        VALUES('CA','Casual');
        INSERT INTO servicos(cod_servico, descricao)
        VALUES('ECO','Eco');
        INSERT INTO servicos(cod_servico, descricao)
        VALUES('LUXO','Luxo');
        
        INSERT INTO Clientes(nr_idCivil, nr_Contribuinte, login, palavra_passe, nome, data_nascimento)
    VALUES(123256729,123456729, '342', '123456789','Joao',TO_DATE('15/Maio/1980','DD/MON/YY'));
     INSERT INTO Clientes(nr_idCivil, nr_Contribuinte, login, palavra_passe, nome, data_nascimento)
    VALUES(123453729,123456709, '1342', '123456789','Francisco',TO_DATE('17/Maio/1980','DD/MON/YY'));

        INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido, percentagem_acrescimo, percentagem_comissao_normal, percentagem_comissao_afiliado)
        VALUES('CA', TO_DATE('11/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),100,90,50,10,120,30,50,5,2,3);
         INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido, percentagem_acrescimo, percentagem_comissao_normal, percentagem_comissao_afiliado)
        VALUES('ECO', TO_DATE('12/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),50,40,50,10,120,30,25,7,3,3);
         INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido, percentagem_acrescimo, percentagem_comissao_normal, percentagem_comissao_afiliado)
        VALUES('LUXO', TO_DATE('13/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),200,190,60,15,120,30,10,8,4,3);
        
        
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(3,'ZD-45-20',549023158, '342', TO_DATE('20/Janeiro/2010','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(2,'ZD-45-10',549023148, '342', TO_DATE('20/Janeiro/2010','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(1,'ZD-45-90',123456789, '342', TO_DATE('20/Janeiro/2019','DD/MON/YY'),'LUXO',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'N',0);
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(99,'ZD-45-90',123456789, '342', TO_DATE('20/Janeiro/2019','DD/MON/YY'),'CA',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'N',0);        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(96,'07-BY-53',019201921, '1342', TO_DATE('20/Janeiro/2010','DD/MON/YY'),'CA',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(91,'32-TY-32',549023138, '1342', TO_DATE('30/Janeiro/2010','DD/MON/YY'),'ECO',TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(92,'ZD-45-90',123456789, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'CA',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'S',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(93,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'CA',TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),1290,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(94,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1300,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(95,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1220,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(97,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1110,'N',0);
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(98,'ZD-45-90',3, '1342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1010,'N',0);
        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado, custo_a_pagar_cancelado)
        VALUES(10,'ZD-45-90',3, '342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N',0);
        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado,custo_a_pagar_cancelado)
        VALUES(11,'ZD-45-90',3, '342', TO_DATE('11/Maio/2019','DD/MON/YY'),'ECO',TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N',0);
        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado,custo_a_pagar_cancelado)
        VALUES(12,'ZD-45-90',3, '342', TO_DATE('11/Maio/2019','DD/MON/YY'),'LUXO',TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N',0);
        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, login, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado,custo_a_pagar_cancelado)
        VALUES(13,'ZD-45-90',3, '342', TO_DATE('11/Maio/2019','DD/MON/YY'),'CA',TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N',0);
    
    
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(75,03,30,110000);
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(74,02,30,100000);
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(73,01,30,10000);  
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(72,99,30,90);
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(71,98,30,1320);
    INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(70,97,30,2020);
    
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(69,96,10,50);
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(62,91,51,118);
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(63,92,21,198);
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(64,93,19,50);
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(65,94,100,193);    
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(66,95,100,193);    
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(67,97,110,193);
	INSERT INTO viagens(cod_viagem, cod_pedido, atraso_passageiro_minutos, duracao_minutos)
	VALUES(68,98,100,193);

	INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico)
	VALUES(71, 'MARIA', 'MU');
	INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico)
	VALUES(72, 'ROSE', 'M');
	INSERT INTO pontos_turisticos(cod_ponto_turistico, nome_ponto_turistico, tipo_ponto_turistico)
	VALUES(73, 'SHINA', 'MU');
    
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(75,72, '2008-01-01 00:00:01');
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(74,72, '2008-01-01 00:00:01');
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(73,72, '2008-01-01 00:00:01');
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(72,72, '2008-01-01 00:00:01');
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(71,72, '2008-01-01 00:00:01');
    INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(70,72, '2008-01-01 00:00:01');
    
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(69,72, '2008-01-01 00:00:01');
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(62,71, '2009-02-02 00:00:01');
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(63,73, '2010-03-27 00:00:01');
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(64,73, '2010-04-27 00:00:01');
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(65,72, '2011-03-27 00:00:01');    
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(66,72, '2011-03-27 00:00:01');    
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(67,72, '2011-03-27 00:00:01');
	INSERT INTO itenerarios_viagens(cod_viagem,cod_ponto_turistico,hora_passagem)
	VALUES(68,72, '2011-03-27 00:00:01');

INSERT INTO relatorios_viagens(cod_viagem, cod_servico, custo_total_viagem, percentagem_acrescimo, percentagem_comissao_normal)
	VALUES(69, 'ECO', 1020, 10, 5);
INSERT INTO relatorios_viagens(cod_viagem, cod_servico, custo_total_viagem, percentagem_acrescimo, percentagem_comissao_normal)
	VALUES(70, 'ECO', 9020, 18, 7);

INSERT INTO Recibos_Pagamento(nr_recibo, nr_idCivil, cod_servico, nr_viagens, valor_total_comissoes, data_emissao_recibo)
	VALUES(1,3,'CA',2,60,TO_DATE('20/Janeiro/2019','DD/MON/YY'));
INSERT INTO Recibos_Pagamento(nr_recibo, nr_idCivil, cod_servico, nr_viagens, valor_total_comissoes, data_emissao_recibo)
	VALUES(2,123456789,'CA',2,63,TO_DATE('22/Janeiro/2019','DD/MON/YY'));

INSERT INTO Faturas_Recibos(nr_fatura, cod_viagem, custo_total_viagem)
    VALUES(1, 69, 69100);
INSERT INTO Faturas_Recibos(nr_fatura, cod_viagem, custo_total_viagem)
    VALUES(2, 67, 200);   