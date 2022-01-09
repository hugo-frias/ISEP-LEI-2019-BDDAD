-- ** eliminar tabelas se existentes **
-- CASCADE CONSTRAINTS para eliminar as restrições de integridade das chaves primárias e chaves únicas
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
DROP TABLE ResumosVeiculos      CASCADE CONSTRAINTS PURGE;

-- ## tabela Veiculos ##
CREATE TABLE Veiculos (
    matricula     CHAR(8)     CONSTRAINT pk_veiculos_matricula  PRIMARY KEY  CONSTRAINT nn_veiculos_matricula  NOT NULL,
    marca         VARCHAR(40) CONSTRAINT nn_veiculos_marca  NOT NULL,
    modelo        VARCHAR(40) CONSTRAINT nn_veiculos_modelo NOT NULL,
    nr_chassis    VARCHAR(40) CONSTRAINT uk_veiculos_nr_chassis  UNIQUE CONSTRAINT nn_veiculos_nr_chassis NOT NULL,
    data_matricula  DATE      CONSTRAINT nn_veiculos_data_matricula NOT NULL
    
    --CONSTRAINT ck_veiculos_matricula CHECK (REGEXP_LIKE(matricula, '[0-9]{2}-[A-Z]{2}-[0-9]{2}|[0-9]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}'))
    );

-- ## tabela Condutores ##
CREATE TABLE Condutores (
    nr_idCivil        INTEGER     CONSTRAINT  pk_condutores_nr_idCivil  PRIMARY KEY CONSTRAINT  nn_condutores_nr_idCivil NOT NULL,
    nome              VARCHAR(40) CONSTRAINT  nn_condutores_nome NOT NULL,
    data_nascimento   DATE        CONSTRAINT  nn_condutores_data_nascimento NOT NULL,
    nr_carta_conducao INTEGER     CONSTRAINT  nn_condutores_nr_carta_conducao   NOT NULL CONSTRAINT uk_condutores_nr_carta_conducao UNIQUE,
    data_validade_carta_conducao DATE   CONSTRAINT nn_condutores_data_validade_carta_conducao   NOT NULL,
    nr_idCivil_supervisor   INTEGER
    );   
    
-- ## tabela Veiculos_Condutores ##
CREATE TABLE Veiculos_Condutores (
    matricula   CHAR(8)  CONSTRAINT  nn_veiculos_condutores_matricula NOT NULL,
    nr_idCivil  INTEGER  CONSTRAINT  nn_veiculos_condutores_nr_idCivil NOT NULL,    
    data_inicio DATE   CONSTRAINT  nn_veiculos_condutores_data_inicio NOT NULL CONSTRAINT uk_veiculos_condutores_data_inicio UNIQUE,
    data_fim    DATE ,    
    
    CONSTRAINT pk_veiculos_condutores_matricula_nr_idCivil_data_inicio   PRIMARY KEY (matricula, nr_idCivil, data_inicio),
    
    CONSTRAINT fk_veiculos_condutores_matricula  FOREIGN KEY (matricula) REFERENCES Veiculos (matricula),
    CONSTRAINT fk_veiculos_condutores_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores (nr_idCivil)
);

-- # tabela Serviços ##
CREATE TABLE Servicos (
    cod_servico INTEGER CONSTRAINT pk_servicos_cod_servico  PRIMARY KEY CONSTRAINT nn_servicos_cod_servico NOT NULL,
    descricao VARCHAR(40) CONSTRAINT nn_servicos_descricao NOT NULL
);

-- # tabela Custos Serviços ##
CREATE TABLE Custos_Servicos (
    cod_servico INTEGER CONSTRAINT nn_custos_servicos_cod_servico NOT NULL,
    data_inicio_custo DATE CONSTRAINT nn_custos_servicos_data_inicio_custo NOT NULL,
    data_fim_custo DATE,
    preco_base INTEGER CONSTRAINT nn_custos_servicos_preco_base NOT NULL,
    custo_minuto INTEGER CONSTRAINT nn_custos_servicos_custo_minuto NOT NULL,
    custo_km INTEGER CONSTRAINT nn_custos_servicos_custo_km NOT NULL,
    taxa_IVA INTEGER CONSTRAINT nn_custos_servicos_taxa_IVA NOT NULL,
    tempo_maximo_espera_minutos INTEGER CONSTRAINT nn_custos_servicos_tempo_maximo_espera_minutos NOT NULL,
    custo_espera_minuto INTEGER CONSTRAINT nn_custos_servicos_custo_espera_minuto NOT NULL,
    custo_cancelamento_pedido INTEGER CONSTRAINT nn_custos_servicos_custo_cancelamento_pedido NOT NULL,
    
    CONSTRAINT pk_custos_servicos_cod_servico_data_inicio_custo PRIMARY KEY (cod_servico,data_inicio_custo),
    CONSTRAINT fk_custos_servicos_cod_servico FOREIGN KEY (cod_servico) REFERENCES Servicos(cod_servico)
);

-- # tabela Pedidos Viagens ##
CREATE TABLE Pedidos_Viagens (
     cod_pedido INTEGER  CONSTRAINT pk_pedidos_viagens_cod_pedido  PRIMARY KEY CONSTRAINT nn_pedido_viagens_cod_pedido NOT NULL,
     matricula CHAR(8) CONSTRAINT nn_pedidos_viagens_matricula NOT NULL,
     nr_idCivil INTEGER CONSTRAINT nn_pedidos_viagens_nr_idCivil NOT NULL,
     data_inicio DATE  CONSTRAINT nn_pedidos_viagens_data_inicio NOT NULL,
     cod_servico INTEGER CONSTRAINT nn_pedidos_viagens_cod_servico NOT NULL,
     data_hora_pedido TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_hora_pedido NOT NULL,
     data_hora_recolha_passageiro TIMESTAMP CONSTRAINT nn_pedidos_viagens_data_recolha_passageiro NOT NULL,
     distancia_km INTEGER CONSTRAINT nn_pedidos_viagens_distancia_km NOT NULL,
     cancelado CHAR(1) DEFAULT 'N' CONSTRAINT ck_pedidos_viagens_cancelado CHECK (REGEXP_LIKE(cancelado, '[S]{1}|[N]{1}')),
     
     CONSTRAINT ch_pedidos_viagens_data_hora_pedido_data_hora_recolha_passageiro CHECK(data_hora_pedido < data_hora_recolha_passageiro),
     CONSTRAINT fk_pedidos_viagens_nr_idCivil  FOREIGN KEY (nr_idCivil) REFERENCES Condutores(nr_idCivil),
     CONSTRAINT fk_pedidos_viagens_matricula FOREIGN KEY (matricula) REFERENCES Veiculos(matricula),
     CONSTRAINT fk_pedidos_viagens_data_inicio FOREIGN KEY (data_inicio) REFERENCES Veiculos_Condutores(data_inicio)
);

-- ## tabela Viagens ##
CREATE TABLE Viagens (
    cod_viagem INTEGER CONSTRAINT pk_viagens_cod_viagem PRIMARY KEY  CONSTRAINT nn_viagens_cod_viagem NOT NULL,                          
    cod_pedido INTEGER CONSTRAINT nn_viagens_cod_pedido NOT NULL,
    atraso_passageiro_minutos INTEGER CONSTRAINT nn_viagens_atraso_passageiro_minutos NOT NULL,
    duracao_minutos INTEGER CONSTRAINT nn_viagens_duracao_minutos NOT NULL,
    
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
-- ## Tabela Resumos Veiculos ##
CREATE TABLE ResumosVeiculos (
    instante TIMESTAMP
    CONSTRAINT nn_resumos_veiculos_instante NOT NULL,
    data_inicio DATE
    CONSTRAINT nn_resumos_veiculos_data_inicio NOT NULL,
    data_fim DATE
    CONSTRAINT nn_resumos_veiculos_data_fim NOT NULL,
    matricula VARCHAR2(8)
    CONSTRAINT nn_resumos_veiculos_matricula NOT NULL,
    nr_viagens INTEGER
    CONSTRAINT ck_resumos_veiculos_nr_viagens CHECK ( nr_viagens > 0 ),
    soma_km INTEGER
    CONSTRAINT ck_resumos_veiculos_soma_km CHECK ( soma_km > 0 ),
    soma_duracao INTEGER
    CONSTRAINT ck_resumos_veiculos_soma_duracao CHECK ( soma_duracao > 0 ),
    CONSTRAINT ck_resumos_veiculos_data_fim CHECK ( data_fim > data_inicio ) ,
    CONSTRAINT pk_resumos_veiculos_data_inicio_data_fim_matricula PRIMARY KEY (
    matricula, data_inicio, data_fim )
);
/*ALTER TABLE condutores ADD CONSTRAINT fk_condutores_nr_idCivil_supervisor   FOREIGN KEY (nr_idCivil_supervisor) REFERENCES Condutores (nr_idCivil);*/
