-- Banco de Dados
CREATE DATABASE oficina_mecanica;

USE oficina_mecanica;

-- Tabela Cliente
CREATE TABLE T_cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(20) NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    sobrenome_cliente VARCHAR(30) NOT NULL,
    contato_cliente VARCHAR(45) NOT NULL,
    endereco_cliente VARCHAR(45)
);
 
-- Tabela Especialidade
CREATE TABLE T_especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(45) NOT NULL
); 

 -- Tabela Serviço
CREATE TABLE T_servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao_servico VARCHAR(45) NOT NULL,
    valor_servico FLOAT NOT NULL
);
 
-- Tabela Peça
CREATE TABLE T_peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome_peca VARCHAR(45) NOT NULL,
    valor_peca FLOAT NOT NULL
);
 
 -- Tabela Mecânico
CREATE TABLE T_mecanico (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    id_especialidade INT NOT NULL,
    nome_mecanico VARCHAR(20) NOT NULL,
    sobrenome_mecanico VARCHAR(30) NOT NULL,
    endereco_mecanico VARCHAR(45) NOT NULL,
    CONSTRAINT fk_mecanico_especialidade FOREIGN KEY (id_especialidade) REFERENCES T_especialidade(id_especialidade)
);
 
-- Tabela Veículo
CREATE TABLE T_veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa_veiculo CHAR(7) UNIQUE NOT NULL,
    modelo_veiculo VARCHAR(30) NOT NULL,
    ano_veiculo YEAR,
    cor_veiculo ENUM('Preto', 'Branco', 'Prata', 'Vermelho', 'Azul', 'Cinza', 'Outra'),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES T_cliente(id_cliente)
);
 
-- Tabela Equipe
CREATE TABLE T_equipe (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY
);

 -- Tabela Ordem de Serviço
CREATE TABLE T_ordem_servico (
    id_ordem_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_equipe INT NOT NULL,
    id_veiculo INT NOT NULL,
    dt_emissao_ordem_serv DATE NOT NULL,
    dt_conclusao_ordem_serv DATE,
    status_ordem_serv ENUM(
        'Aberta',
        'Aguardando Aprovação',
        'Aguardando Peças',
        'Em Execução',
        'Aguardando Testes',
        'Concluída',
        'Entregue',
        'Cancelada',
        'Pendente',
        'Revisão Necessária',
        'Aguardando Pagamento'
    ),
    valor_tot_ordem_serv FLOAT,
    CONSTRAINT fk_ordem_equipe FOREIGN KEY (id_equipe) REFERENCES T_equipe(id_equipe),
    CONSTRAINT fk_ordem_veiculo FOREIGN KEY (id_veiculo) REFERENCES T_veiculo(id_veiculo)
);
 
-- Tabela Peças por Ordem de Serviço
CREATE TABLE T_pecas_por_ordem_serv (
    id_ordem_servico INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_peca INT,
    PRIMARY KEY (id_ordem_servico, id_peca),
    CONSTRAINT fk_pecas_ordem FOREIGN KEY (id_ordem_servico) REFERENCES T_ordem_servico(id_ordem_servico),
    CONSTRAINT fk_pecas FOREIGN KEY (id_peca) REFERENCES T_peca(id_peca)
);
 
 -- Tabela Serviço por Ordem de Serviço
CREATE TABLE T_servico_por_ordem_serv (
    id_ordem_servico INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade_servico INT,
    PRIMARY KEY (id_ordem_servico, id_servico),
    CONSTRAINT fk_servico_ordem FOREIGN KEY (id_ordem_servico) REFERENCES T_ordem_servico(id_ordem_servico),
    CONSTRAINT fk_servico FOREIGN KEY (id_servico) REFERENCES T_servico(id_servico)
);

CREATE TABLE T_equipe_mecanico (
    id_equipe INT NOT NULL,
    id_mecanico INT NOT NULL,
    PRIMARY KEY (id_equipe, id_mecanico),
    CONSTRAINT fk_equipe_mecanico_equipe FOREIGN KEY (id_equipe) REFERENCES T_equipe(id_equipe),
    CONSTRAINT fk_equipe_mecanico_mecanico FOREIGN KEY (id_mecanico) REFERENCES T_mecanico(id_mecanico)
);
 