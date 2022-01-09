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
    
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('AA-BB-11','Toyota', '300D', '6', TO_DATE('10/Maio/2009','DD/MON/YY'));    
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('CC-DD-11','Toyota', '300D', '7', TO_DATE('10/Maio/2009','DD/MON/YY'));
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('EE-FF-11','Toyota', '300D', '8', TO_DATE('10/Maio/2009','DD/MON/YY'));    
INSERT INTO Veiculos(matricula,marca, modelo, nr_chassis, data_matricula)
    VALUES('GG-HH-11','Toyota', '300D', '9', TO_DATE('10/Maio/2009','DD/MON/YY'));
    
    
    
    INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(123456789,'Joao',TO_DATE('15/Maio/1980','DD/MON/YY') ,122, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(019201921,'Manuel',TO_DATE('20/Maio/1982','DD/MON/YY') ,120, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023158,'Pedro',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,121, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023148,'Jonas',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,125, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(549023138,'Pistolas',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,123, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(3,'Supervisor',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,124, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
    
    
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(1234,'Alberto',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,130, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(5678,'Ruben',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,133, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);    
INSERT INTO Condutores(nr_idCivil, nome, data_nascimento, nr_carta_conducao, data_validade_carta_conducao, nr_idCivil_supervisor)
    VALUES(9012,'Diogo',TO_DATE('20/Janeiro/1990','DD/MON/YY') ,132, TO_DATE('20/Janeiro/2020','DD/MON/YY'), 3);

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
        VALUES(01,'Casual');
        INSERT INTO servicos(cod_servico, descricao)
        VALUES(02,'Eco');
        INSERT INTO servicos(cod_servico, descricao)
        VALUES(03,'Luxo');

        INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido)
        VALUES(01, TO_DATE('11/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),100,90,50,10,120,30,50);
        INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido)
        VALUES(02, TO_DATE('11/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),50,40,50,10,120,30,25);
        INSERT INTO custos_servicos(cod_servico, data_inicio_custo, data_fim_custo, preco_base, custo_minuto, custo_km, taxa_IVA, tempo_maximo_espera_minutos, custo_espera_minuto, custo_cancelamento_pedido)
        VALUES(03, TO_DATE('11/Novembro/2019','DD/MON/YY'), TO_DATE('11/Junho/2020','DD/MON/YY'),200,190,60,15,120,30,10);
        
        
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(3,'ZD-45-20',549023158,TO_DATE('20/Janeiro/2010','DD/MON/YY'),03,TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N');
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(2,'ZD-45-10',549023148,TO_DATE('20/Janeiro/2010','DD/MON/YY'),03,TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N');
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(1,'ZD-45-90',123456789,TO_DATE('20/Janeiro/2019','DD/MON/YY'),03,TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'N');
         INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(99,'ZD-45-90',123456789,TO_DATE('20/Janeiro/2019','DD/MON/YY'),01,TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'N');        
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(96,'07-BY-53',019201921,TO_DATE('20/Janeiro/2010','DD/MON/YY'),01,TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N');
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(91,'32-TY-32',549023138,TO_DATE('30/Janeiro/2010','DD/MON/YY'),02,TO_DATE('20/Janeiro/2019','DD/MON/YY'),TO_DATE('25/Abril/2019','DD/MON/YY'),120,'N');
        INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(92,'ZD-45-90',123456789,TO_DATE('11/Maio/2019','DD/MON/YY'),01,TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),120,'S');
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(93,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),02,TO_DATE('20/Janeiro/2020','DD/MON/YY'),TO_DATE('25/Abril/2020','DD/MON/YY'),1290,'N');
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(94,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1300,'N');
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(95,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1220,'N');
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(97,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1110,'N');
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(98,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Janeiro/2020','DD/MON/YY'),TO_DATE('26/Abril/2020','DD/MON/YY'),1010,'N');
        
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(10,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N');
        
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(11,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),02,TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N');
        
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(12,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),03,TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N');
        
INSERT INTO pedidos_viagens(cod_pedido, matricula, nr_idCivil, data_inicio, cod_servico, data_hora_pedido, data_hora_recolha_passageiro, distancia_km, cancelado)
        VALUES(13,'ZD-45-90',3,TO_DATE('11/Maio/2019','DD/MON/YY'),01,TO_DATE('21/Junho/2020','DD/MON/YY'),TO_DATE('26/Junho/2020','DD/MON/YY'),1010,'N');
    
    
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
    
    insert into Veiculos_Condutores values('AA-BB-11', 5678, to_date('2019-10-04', 'yyyy-mm-dd'), to_date('2019-10-08',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('AA-BB-11', 9012, to_date('2019-10-06', 'yyyy-mm-dd'), to_date('2019-10-09',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('CC-DD-11', 1234, to_date('2019-10-08', 'yyyy-mm-dd'), to_date('2019-10-14',
    'yyyy-mm-dd'));
    insert into Veiculos_Condutores values('AA-BB-11', 1234, to_date('2019-10-10', 'yyyy-mm-dd'), null);
    insert into Veiculos_Condutores values('EE-FF-11', 1234, to_date('2019-10-18', 'yyyy-mm-dd'), null);
    insert into Veiculos_Condutores values('GG-HH-11', 1234, to_date('2019-10-01', 'yyyy-mm-dd'), null);
    commit;