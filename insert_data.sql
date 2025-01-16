-- Inserindo Especialidades
INSERT INTO T_especialidade (nome_especialidade)
VALUES 
    ('Automóveis(geral)'), 
    ('Motor'), 
    ('Suspensão/Direção'), 
    ('Freios'), 
    ('Transmissão/Câmbio'), 
    ('Eletricista'), 
    ('Injeção Eletrônica'), 
    ('Ar-Condicionado'), 
    ('Pneus');

-- Inserindo Clientes
INSERT INTO T_cliente (nome_cliente, sobrenome_cliente, cpf_cliente, contato_cliente, endereco_cliente)
VALUES
    ('João', 'Silva', '12345678901', '99999-0001', 'Rua A, 123'),
    ('Maria', 'Souza', '98765432100', '99999-0002', 'Rua B, 456'),
    ('Carlos', 'Oliveira', '45678912300', '99999-0003', 'Rua C, 789'),
    ('Ana', 'Pereira', '78912345600', '99999-0004', 'Rua D, 321'),
    ('José', 'Ferreira', '32165498700', '99999-0005', 'Rua E, 654'),
    ('Paula', 'Almeida', '65432178900', '99999-0006', 'Rua F, 987'),
    ('Ricardo', 'Gomes', '15975348600', '99999-0007', 'Rua G, 111'),
    ('Fernanda', 'Lima', '75395125800', '99999-0008', 'Rua H, 222');

-- Inserindo Veículos
INSERT INTO T_veiculo (id_cliente, placa_veiculo, modelo_veiculo, ano_veiculo, cor_veiculo)
VALUES
    (1, 'ABC1234', 'Civic', 2018, 'Prata'),
    (2, 'XYZ5678', 'Corolla', 2020, 'Preto'),
    (3, 'LMN9101', 'Onix', 2019, 'Branco'),
    (4, 'OPQ1122', 'Hilux', 2021, 'Cinza'),
    (5, 'RST3344', 'Gol', 2017, 'Vermelho'),
    (6, 'UVW5566', 'HB20', 2016, 'Azul'),
    (7, 'DEF7788', 'Kwid', 2018, 'Preto'),
    (8, 'GHI9900', 'Strada', 2022, 'Prata');

-- Inserindo Mecânicos
INSERT INTO T_mecanico (id_especialidade, nome_mecanico, sobrenome_mecanico, endereco_mecanico)
VALUES
    (1, 'Luiz', 'Santos', 'Rua I, 333'),
    (2, 'Roberto', 'Mendes', 'Rua J, 444'),
    (3, 'Thiago', 'Araújo', 'Rua K, 555'),
    (4, 'Cláudio', 'Silva', 'Rua L, 666'),
    (5, 'Fábio', 'Costa', 'Rua M, 777'),
    (6, 'Marcelo', 'Vieira', 'Rua N, 888'),
    (7, 'Juliano', 'Carvalho', 'Rua O, 999'),
    (8, 'Rafael', 'Pereira', 'Rua P, 101');

-- Inserindo Equipes
INSERT INTO T_equipe ()
VALUES (), (), (); -- 3 equipes

-- Associando Mecânicos às Equipes
INSERT INTO T_equipe_mecanico (id_equipe, id_mecanico)
VALUES
    (1, 1), (1, 2), (1, 3),
    (2, 4), (2, 5), (2, 6),
    (3, 7), (3, 8);

-- Inserindo Serviços
INSERT INTO T_servico (descricao_servico, valor_servico)
VALUES
    ('Troca de óleo', 150.00),
    ('Alinhamento e balanceamento', 200.00),
    ('Revisão elétrica', 300.00),
    ('Troca de pastilhas de freio', 250.00),
    ('Revisão de suspensão', 400.00),
    ('Recarga de ar-condicionado', 180.00),
    ('Diagnóstico de injeção eletrônica', 350.00),
    ('Troca de pneus', 500.00);

-- Inserindo Peças
INSERT INTO T_peca (nome_peca, valor_peca)
VALUES
    ('Filtro de óleo', 50.00),
    ('Pneu 175/70', 350.00),
    ('Amortecedor', 200.00),
    ('Pastilha de freio', 120.00),
    ('Bateria 60Ah', 400.00),
    ('Compressor de ar-condicionado', 700.00),
    ('Velas de ignição', 80.00),
    ('Correia dentada', 150.00);
    
-- Inserindo Ordens de Serviço
INSERT INTO T_ordem_servico (id_equipe, id_veiculo, dt_emissao_ordem_serv, dt_conclusao_ordem_serv, status_ordem_serv, valor_tot_ordem_serv)
VALUES
    (1, 1, '2025-01-15', '2025-01-16', 'Concluída', 650.00),
    (2, 2, '2025-01-14', NULL, 'Em Execução', NULL),
    (3, 3, '2025-01-10', '2025-01-12', 'Entregue', 1200.00),
    (1, 4, '2025-01-13', '2025-01-15', 'Concluída', 900.00);

-- Inserindo Peças por Ordem de Serviço
INSERT INTO T_pecas_por_ordem_serv (id_ordem_servico, id_peca, quantidade_peca)
VALUES
    (1, 1, 1), -- Filtro de óleo
    (1, 4, 2), -- Pastilha de freio
    (2, 5, 1), -- Bateria
    (3, 6, 1), -- Compressor de ar-condicionado
    (4, 2, 4); -- Pneu

-- Inserindo Serviços por Ordem de Serviço
INSERT INTO T_servico_por_ordem_serv (id_ordem_servico, id_servico, quantidade_servico)
VALUES
    (1, 1, 1), -- Troca de óleo
    (1, 4, 1), -- Troca de pastilhas de freio
    (2, 3, 1), -- Revisão elétrica
    (3, 6, 1), -- Recarga de ar-condicionado
    (4, 8, 1); -- Troca de pneus

