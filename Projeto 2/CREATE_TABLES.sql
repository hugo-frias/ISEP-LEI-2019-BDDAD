-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restriÃ§Ãµes de integridade das chaves primÃ¡rias e chaves Ãºnicas
-- PURGE elimina a tabela da base de dados e da "reciclagem"
DROP TABLE Viagens              CASCADE CONSTRAINTS PURGE;
DROP TABLE Itenerarios_Viagens  CASCADE CONSTRAINTS PURGE;
DROP TABLE Pontos_Turisticos    CASCADE CONSTRAINTS PURGE;
DROP TABLE Pedidos_Viagens      CASCADE CONSTRAINTS PURGE;
DROP TABLE Servicos             CASCADE CONSTRAINTS PURGE;
DROP TABLE Custos_Servicos      CASCADE CONSTRAINTS PURGE;
DROP TABLE Veiculos             CASCADE CONSTRAINTS PURGE;
DROP TABLE Veiculos_Condutores  CASCADE CONSTRAINTS PURGE;
DROP TABLE Condutores           CASCADE CONSTRAINTS PURGE;
DROP TABLE Clientes 		    CASCADE CONSTRAINTS PURGE;
DROP TABLE Faturas_Recibos	    CASCADE CONSTRAINTS PURGE;
DROP TABLE Recibos_Pagamento    CASCADE CONSTRAINTS PURGE;
DROP TABLE Relatorios_Viagens	    CASCADE CONSTRAINTS PURGE;

-- ## tabela Veiculos ##
CREATE TABLE Veiculos (
    matricula     CHAR(8)     CONSTRAINT pk_veiculos_matricula  PRIMARY KEY  CONSTRAINT nn_veiculos_matricula  NOT NULL CONSTRAINT ck_veiculos_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
    marca         VARCHAR(40) CONSTRAINT nn_veiculos_marca  NOT NULL,
    modelo        VARCHAR(40) CONSTRAINT nn_veiculos_modelo NOT NULL,
    nr_chassis    VARCHAR(40) CONSTRAINT uk_veiculos_nr_chassis  UNIQUE CONSTRAINT nn_veiculos_nr_chassis NOT NULL,
    data_matricula  DATE      CONSTRAINT nn_veiculos_data_matricula NOT NULL
    );

-- ## tabela Condutores ##
CREATE TABLE Condutores (
    nr_idCivil        INTEGER     CONSTRAINT  pk_condutores_nr_idCivil  PRIMARY KEY CONSTRAINT  nn_condutores_nr_idCivil NOT NULL,
    nome              VARCHAR(40) CONSTRAINT  nn_condutores_nome NOT NULL,
    morada            VARCHAR(40) CONSTRAINT  nn_condutores_morada NOT NULL,
    nr_contribuinte   INTEGER     CONSTRAINT  nn_condutores_nr_contribuinte NOT NULL,
    data_nascimento   DATE        CONSTRAINT  nn_condutores_data_nascimento NOT NULL,
    nr_carta_conducao INTEGER     CONSTRAINT  nn_condutores_nr_carta_conducao   NOT NULL CONSTRAINT uk_condutores_nr_carta_conducao UNIQUE,
    data_validade_carta_conducao DATE   CONSTRAINT nn_condutores_data_validade_carta_conducao   NOT NULL,
    nr_idCivil_supervisor   INTEGER,
    
    CONSTRAINT fk_condutores_nr_idCivil_supervisor FOREIGN KEY (nr_idCivil_supervisor) REFERENCES Condutores (nr_idCivil)
    );   
    
-- ## tabela Veiculos_Condutores ##
CREATE TABLE Veiculos_Condutores (
    matricula   CHAR(8)  CONSTRAINT  nn_veiculos_condutores_matricula NOT NULL CONSTRAINT ck_veiculos_condutores_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
    nr_idCivil  INTEGER  CONSTRAINT  nn_veiculos_condutores_nr_idCivil NOT NULL,    
    data_inicio DATE   CONSTRAINT  nn_veiculos_condutores_data_inicio NOT NULL CONSTRAINT k_veiculos_condutores_data_inicio UNIQUE,
    data_fim    DATE,   
    
    CONSTRAINT pk_veiculos_condutores_matricula_nr_idCivil_data_inicio   PRIMARY KEY (matricula, nr_idCivil, data_inicio),
    
    CONSTRAINT fk_veiculos_condutores_matricula  FOREIGN KEY (matricula) REFERENCES Veiculos (matricula),
    CONSTRAINT fk_veiculos_condutores_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores (nr_idCivil)
);

-- # tabela ServiÃ§os ##
CREATE TABLE Servicos (
    cod_servico VARCHAR(4) CONSTRAINT pk_servicos_cod_servico  PRIMARY KEY CONSTRAINT nn_servicos_cod_servico NOT NULL CONSTRAINT ck_servicos_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
    descricao VARCHAR(40) CONSTRAINT nn_servicos_descricao NOT NULL
);

-- # tabela Custos ServiÃ§os ##
CREATE TABLE Custos_Servicos (
    cod_servico VARCHAR(4) CONSTRAINT nn_custos_servicos_cod_servico NOT NULL CONSTRAINT ck_custos_servicos_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
    data_inicio_custo DATE CONSTRAINT nn_custos_servicos_data_inicio_custo NOT NULL,
    data_fim_custo DATE,
    preco_base INTEGER CONSTRAINT nn_custos_servicos_preco_base NOT NULL,
    custo_minuto INTEGER CONSTRAINT nn_custos_servicos_custo_minuto NOT NULL,
    custo_km INTEGER CONSTRAINT nn_custos_servicos_custo_km NOT NULL,
    taxa_IVA INTEGER CONSTRAINT nn_custos_servicos_taxa_IVA NOT NULL,
    tempo_maximo_espera_minutos INTEGER CONSTRAINT nn_custos_servicos_tempo_maximo_espera_minutos NOT NULL,
    custo_espera_minuto INTEGER CONSTRAINT nn_custos_servicos_custo_espera_minuto NOT NULL,
    custo_cancelamento_pedido INTEGER CONSTRAINT nn_custos_servicos_custo_cancelamento_pedido NOT NULL,
    percentagem_acrescimo INTEGER CONSTRAINT nn_percentagem_acrescimo NOT NULL,
    percentagem_comissao_normal INTEGER CONSTRAINT nn_custos_servicos_comissao_normal NOT NULL,
    percentagem_comissao_afiliado INTEGER CONSTRAINT nn_custos_servicos_comissao_afiliado NOT NULL,
    
    CONSTRAINT pk_custos_servicos_cod_servico_data_inicio_custo PRIMARY KEY (cod_servico,data_inicio_custo),
    CONSTRAINT fk_custos_servicos_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico)
);

CREATE TABLE Clientes (
    nr_idCivil INTEGER CONSTRAINT  nn_clientes_nr_idCivil NOT NULL,
    nr_Contribuinte INTEGER CONSTRAINT  nn_clientes_nr_contribuinte NOT NULL,
    login VARCHAR(8) CONSTRAINT  nn_clientes_login NOT NULL CONSTRAINT uk_clientes_login UNIQUE,
    palavra_passe VARCHAR(12) CONSTRAINT  nn_clientes_nr_password NOT NULL,
    nome VARCHAR(40) CONSTRAINT  nn_clientes_nome NOT NULL,
    data_nascimento DATE CONSTRAINT  nn_clientes_data_nascimento NOT NULL,

    CONSTRAINT pk_cliente_primary_key PRIMARY KEY (nr_idCivil, nr_Contribuinte, login)
);

-- # tabela Pedidos Viagens ##
CREATE TABLE Pedidos_Viagens (
     cod_pedido INTEGER  CONSTRAINT pk_pedidos_viagens_cod_pedido  PRIMARY KEY CONSTRAINT nn_pedido_viagens_cod_pedido NOT NULL,
     matricula CHAR(8) CONSTRAINT nn_pedidos_viagens_matricula NOT NULL CONSTRAINT ck_pedidos_viagens_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}')),
     nr_idCivil INTEGER CONSTRAINT nn_pedidos_viagens_nr_idCivil NOT NULL,
     data_inicio DATE  CONSTRAINT nn_pedidos_viagens_data_inicio NOT NULL,
     login VARCHAR(8) CONSTRAINT  nn_pedidos_viagens_login NOT NULL,
     cod_servico VARCHAR(4) CONSTRAINT nn_pedidos_viagens_cod_servico NOT NULL CONSTRAINT ck_pedidos_viagens_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
     data_hora_pedido TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_hora_pedido NOT NULL,
     data_hora_recolha_passageiro TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_recolha_passageiro NOT NULL,
     distancia_km INTEGER CONSTRAINT nn_pedidos_viagens_distancia_km NOT NULL,
     cancelado CHAR(1) DEFAULT 'N' CONSTRAINT ck_pedidos_viagens_cancelado CHECK (REGEXP_LIKE(cancelado, '[S]{1}|[N]{1}')),
     custo_a_pagar_cancelado INTEGER,
     
     CONSTRAINT ch_pedidos_viagens_data_hora_pedido_data_hora_recolha_passageiro CHECK(data_hora_pedido < data_hora_recolha_passageiro),
     CONSTRAINT fk_pedidos_viagens_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores(nr_idCivil),
     CONSTRAINT fk_pedidos_viagens_matricula FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
     CONSTRAINT fk_pedidos_viagens_data_inicio FOREIGN KEY (data_inicio) REFERENCES Veiculos_Condutores(data_inicio),
     CONSTRAINT fk_pedidos_viagens_login FOREIGN KEY (login) REFERENCES Clientes(login),
     CONSTRAINT fk_pedidos_viagens_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico)
);

-- ## tabela Viagens ##
CREATE TABLE Viagens (
    cod_viagem INTEGER CONSTRAINT pk_viagens_cod_viagem PRIMARY KEY  CONSTRAINT nn_viagens_cod_viagem NOT NULL,                          
    cod_pedido INTEGER CONSTRAINT nn_viagens_cod_pedido NOT NULL,
    duracao_minutos INTEGER CONSTRAINT nn_viagens_duracao_minutos NOT NULL,
    atraso_passageiro_minutos INTEGER CONSTRAINT nn_viagens_atraso_passageiro_minutos NOT NULL,
    
    CONSTRAINT fk_viagens_cod_pedido FOREIGN KEY (cod_pedido) REFERENCES Pedidos_Viagens (cod_pedido)
);

-- ## Tabela Pontos Turisticos ##
-- 
CREATE TABLE Pontos_Turisticos (
    cod_ponto_turistico INTEGER CONSTRAINT pk_pontos_turisticos_cod_ponto_turistico PRIMARY KEY,                            
    nome_ponto_turistico VARCHAR(40) CONSTRAINT nn_pontos_turisticos_nome_ponto_turistico NOT NULL,
    tipo_ponto_turistico VARCHAR(2) CONSTRAINT ck_pontos_turisticos_tipo_ponto_turistico CHECK (REGEXP_LIKE(tipo_ponto_turistico, '[M]{1}|[MU]{2}|[PN]{2}|[MI]{2}'))
);

-- ## tabela Itinerarios Viagens ##
CREATE TABLE Itenerarios_Viagens (
    cod_viagem INTEGER CONSTRAINT nn_itenerarios_viagens_cod_viagem NOT NULL,                            
    cod_ponto_turistico INTEGER CONSTRAINT nn_itenerarios_viagens_cod_ponto_turistico NOT NULL,
    hora_passagem TIMESTAMP CONSTRAINT nn_itenerarios_viagens_hora_passagem NOT NULL,
    
    CONSTRAINT pk_itenerarios_viagens_primary_key PRIMARY KEY (cod_viagem, cod_ponto_turistico),
    CONSTRAINT fk_itenerarios_viagens_cod_viagem FOREIGN KEY (cod_viagem) REFERENCES Viagens (cod_viagem),
    CONSTRAINT fk_pontos_turisticos_cod_ponto_turistico FOREIGN KEY (cod_ponto_turistico) REFERENCES Pontos_Turisticos (cod_ponto_turistico)
);

-- ## tabela Faturas Recibos ##
CREATE TABLE Faturas_Recibos (
    nr_fatura INTEGER CONSTRAINT nn_fatura_recibo_nr_fatura NOT NULL,
    cod_viagem INTEGER CONSTRAINT nn_fatura_cod_viagem NOT NULL,
    custo_total_viagem INTEGER CONSTRAINT fatura_recibo_custo_total NOT NULL,

    CONSTRAINT pk_fatura_recibo_nr_fatura_cod_viagem PRIMARY KEY (nr_fatura, cod_viagem),

    CONSTRAINT fk_fatura_recibo_cod_viagem FOREIGN KEY (cod_viagem) REFERENCES Viagens (cod_viagem)
);

-- ## tabela Recibos Pagamento ##
CREATE TABLE Recibos_Pagamento (
    nr_recibo INTEGER CONSTRAINT nn_recibo_pagamento_nr_recibo NOT NULL,
    nr_idCivil INTEGER CONSTRAINT nn_recibo_pagamento_nr_idCivil NOT NULL,
    cod_servico VARCHAR(4) CONSTRAINT nn_recibo_pagamento_cod_servico NOT NULL CONSTRAINT ck_recibo_pagamento_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
    nr_viagens INTEGER CONSTRAINT nn_recibo_pagamento_nr_viagens NOT NULL,
    valor_total_comissoes INTEGER CONSTRAINT nn_recibo_pagamento_valor_total_comissoes NOT NULL,
    data_emissao_recibo DATE CONSTRAINT nn_recibo_pagamento_data_emissao_recibo NOT NULL,
    
    CONSTRAINT pk_recibo_pagamento_nr_recibo_nr_idCivil_cod_servico PRIMARY KEY (nr_recibo, nr_idCivil, cod_servico),
    
    CONSTRAINT fk_recibo_pagamento_nr_idCivil FOREIGN KEY (nr_idCivil) REFERENCES Condutores (nr_idCivil),
    CONSTRAINT fk_recibo_pagamento_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos (cod_servico)
);

-- ## tabela RelatÃ³rios Viagens ##
CREATE TABLE Relatorios_Viagens (
    cod_viagem INTEGER  CONSTRAINT  pk_relatorio_viagem_cod_viagem  PRIMARY KEY CONSTRAINT nn_relatorio_viagem_cod_viagem NOT NULL,
    cod_servico VARCHAR(4) CONSTRAINT nn_relatorio_viagem_cod_servico NOT NULL CONSTRAINT ck_relatorio_viagem_cod_servico CHECK (REGEXP_LIKE(cod_servico, '[CA]{2}|[ECO]{3}|[LUXO]{4}|[GR] {2}')),
    custo_total_viagem INTEGER CONSTRAINT nn_relatorio_viagem_custo_total_viagem NOT NULL,
    percentagem_acrescimo INTEGER CONSTRAINT nn_relatorio_viagem_percentagem_acrescimo NOT NULL,
    percentagem_comissao_normal INTEGER CONSTRAINT nn_relatorio_viagem_percentagem_comissao_normal NOT NULL,
    
    CONSTRAINT fk_relatorio_viagem_nr_idCivil FOREIGN KEY (cod_viagem) REFERENCES Viagens(cod_viagem),
    CONSTRAINT fk_relatorio_viagem_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico)
);