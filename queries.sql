-- Exibir todos os mecânicos e especialidades
SELECT nome_mecanico, sobrenome_mecanico, id_especialidade
FROM T_mecanico;

-- Recuperar os veiculos de cor preta cadastrados
SELECT modelo_veiculo, placa_veiculo, cor_veiculo
FROM T_veiculo
WHERE cor_veiculo = 'Preto';

-- Calcular o valor total de cada peça usada na ordem de serviço (preço da peça vezes quantidade)
SELECT pp.id_ordem_servico, p.nome_peca, p.valor_peca, pp.quantidade_peca, 
       (p.valor_peca * pp.quantidade_peca) AS valor_total_peca
FROM T_pecas_por_ordem_serv pp
JOIN T_peca p ON pp.id_peca = p.id_peca;

-- Listar os clientes em ordem alfabética pelo sobrenome
SELECT nome_cliente, sobrenome_cliente, contato_cliente
FROM T_cliente
ORDER BY sobrenome_cliente ASC;

-- Listar os veiculos junto com o nome dos clientes
SELECT v.modelo_veiculo, v.placa_veiculo, c.nome_cliente, c.sobrenome_cliente
FROM T_veiculo v
JOIN T_cliente c ON v.id_cliente = c.id_cliente;

-- Listar as ordens de serviço com os veículos, o nome dos clientes e o status
SELECT os.id_ordem_servico, v.modelo_veiculo, c.nome_cliente, c.sobrenome_cliente, os.status_ordem_serv
FROM T_ordem_servico os
JOIN T_veiculo v ON os.id_veiculo = v.id_veiculo
JOIN T_cliente c ON v.id_cliente = c.id_cliente;

-- Exibir ordens de serviço que estão "Aguardando Peças" ou "Em Execução" emitidas após 2025-01-10
SELECT id_ordem_servico, dt_emissao_ordem_serv, status_ordem_serv
FROM T_ordem_servico
WHERE (status_ordem_serv = 'Aguardando Peças' OR status_ordem_serv = 'Em Execução')
  AND dt_emissao_ordem_serv > '2025-01-10';

-- Agrupar as ordens de serviço pelo status e exibir a quantidade em cada status
SELECT status_ordem_serv, COUNT(id_ordem_servico) AS total_ordens
FROM T_ordem_servico
GROUP BY status_ordem_serv;

-- Exibir todas as equipes e seus respectivos mecânicos
SELECT e.id_equipe, m.nome_mecanico, m.sobrenome_mecanico
FROM T_equipe e
JOIN T_equipe_mecanico em ON e.id_equipe = em.id_equipe
JOIN T_mecanico m ON em.id_mecanico = m.id_mecanico;
