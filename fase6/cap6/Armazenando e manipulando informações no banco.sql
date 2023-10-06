/* 
  Cadastro e alteração 
*/

INSERT INTO T_TIPO_LANCAMENTO (cd_tipo, ds_tipo) VALUES (1, 'Crédito');
INSERT INTO T_TIPO_LANCAMENTO (cd_tipo, ds_tipo) VALUES (2, 'Débito');
INSERT INTO T_TIPO_LANCAMENTO (cd_tipo, ds_tipo) VALUES (3, 'CDC');

-- Cadastrar os dados do usuário. 
INSERT INTO T_USUARIO (cd_usuario, vl_cpf_usuario, ds_senha, nm_usuario, ck_usuario_ativo) 
VALUES (1, '03901750053', '123mudar', 'João das Couves', 1);

-- Cadastrar os dados para a conta do usuário. 
INSERT INTO T_CONTA (cd_conta, vl_agencia, vl_conta, vl_banco, cd_usuario) 
VALUES (1, '3357-4', '00003574-3', '0033', 1);

-- Alterar todos os dados do usuário, utilizando seu código como referência. 
UPDATE T_USUARIO SET nm_usuario = 'João das Couves da Silveira' WHERE cd_usuario = 1;

-- Cadastrar as receitas do usuário. 
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (1, 100.00, TO_DATE('10/10/2023', 'DD/MM/YYYY'), 'Prestação de serviço - banco de dados', 1, 1, 1);
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (2, 1829.22, TO_DATE('10/10/2023', 'DD/MM/YYYY'), 'Prestação de Serviço - desenvolvimento de sistemas', 1, 1, 1);
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (3, 2437.55, TO_DATE('30/09/2023', 'DD/MM/YYYY'), 'Parcela do imóvel', 1, 1, 2);

-- Alterar todos os dados das receitas do usuário, utilizando o código como referência. 
UPDATE T_LANCAMENTO SET vl_lancamento = 1000.00 WHERE cd_lancamento = 1;
UPDATE T_LANCAMENTO SET vl_lancamento = 8534.94 WHERE cd_lancamento = 2;

-- Cadastrar as despesas do usuário. 
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (4, 185.32, TO_DATE('01/10/2023', 'DD/MM/YYYY'), 'Conta de Luz', 2, 1, 1);
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (5, 1829.22, TO_DATE('10/10/2023', 'DD/MM/YYYY'), 'Fatura de Cartão de Crédito', 2, 1, 1);
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) 
VALUES (6, 2437.55, TO_DATE('30/09/2023', 'DD/MM/YYYY'), 'Parcela do imóvel', 2, 1, 2);

-- Alterar todos os dados das despesas do usuário, utilizando o código como referência. 


-- Cadastrar os dados para investimentos. 


-- Alterar todos os dados para investimentos do usuário, utilizando o código como referência. 



/* 
  Consultas 
*/

-- Consultar os dados de um usuário (filtrar a partir do seu código). 


-- Consultar os dados de um único registro de despesa de um  usuário 
-- (filtrar a partir do código do usuário e do código da despesa). 


-- Consultar os dados de todos os registros de despesas de um  usuário, 
-- ordenando-os dos registros mais recentes para os mais antigos 
-- (filtrar a partir do seu código). */


-- Consultar os dados de um único registro de investimento de um  usuário 
-- (filtrar a partir do código do usuário e do código de investimento. */


-- Consultar os dados de todos os registros de investimentos de um  usuário, 
-- ordenando-os dos registros mais recentes para os mais antigos 
-- (filtrar a partir do seu código). */


-- Consultar os dados básicos de um usuário, o último investimento registrado 
-- e a última despesa registrada (filtrar a partir do código de 
-- usuário – consulta necessária para o dashboard. Dica: veja consulta 
-- com junções). 
