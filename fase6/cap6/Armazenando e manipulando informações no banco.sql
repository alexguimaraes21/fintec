/* 
  Cadastro e alteração 
*/

-- Cadastrar os dados do usuário. 
INSERT INTO T_USUARIO (cd_usuario, vl_cpf_usuario, ds_senha, nm_usuario, ck_usuario_ativo) VALUES ([CD USUARIO], '[CPF USUARIO]', '[SENHA USUARIO]', '[NOME USUARIO]', [VERDADEIRO OU FALSO]);

-- Cadastrar os dados para a conta do usuário. 
INSERT INTO T_CONTA (cd_conta, vl_agencia, vl_conta, vl_banco, cd_usuario) VALUES ([CD CONTA], '[AGENCIA E DIGITO]', '[CONTA E DIGITO]', '[COD BANCO]', [CD USUARIO]);

-- Alterar todos os dados do usuário, utilizando seu código como referência. 
UPDATE T_USUARIO SET nm_usuario = '[NOME USUARIO]', vl_cpf_usuario = '[CPF USUARIO]', ds_senha = '[SENHA USUARIO]', nm_usuario = '[NOME USUARIO]', ck_usuario_ativo = [VERDADEIRO OU FALSO] WHERE cd_usuario = [CD USUARIO];

-- Inicializar tabela com os tipos dos lançamentos (RECEITA, DESPESA ou INVESTIMENTO).
INSERT INTO T_TIPO_LANCAMENTO (cd_tipo_lancamento, ds_tipo_lancamento) VALUES ([CD TIPO LANCAMENTO], '[DESCR TIPO LANCAMENTO]')

-- Inicializar tabela com as carteiras de investimentos (Tipos de carteiras (CDC, CDB, etc))
INSERT INTO T_TIPO_INVESTIMENTO (cd_tipo_invesimento, ds_tipo_investimento, vl_rendimento_mensal, prazo_minino_investimento) VALUES ([CD TIPO INVESTIMENTO], '[DESCR TIPO INVESTIMENTO]', [VL DA % RENDIMENTO MENSAL], [PRAZO MININO INVESTIMENTO EM MESES])

-- Cadastrar as receitas do usuário. 
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) VALUES ([CD LANCAMENTO], [VALOR LANCAMENTO], TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), '[DESCRICAO DO LANCAMENTO]', [CD TIPO RECEITA], [CD USUARIO], [CD CONTA]);

-- Alterar todos os dados das receitas do usuário, utilizando o código como referência. 
UPDATE T_LANCAMENTO SET vl_lancamento = [VALOR LANCAMENTO], dt_lancamento = TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), ds_lancamento = '[DESCRICAO DO LANCAMENTO]', cd_tipo = [CD TIPO RECEITA], cd_conta = [CD CONTA] WHERE cd_lancamento = [CD LANCAMENTO];

-- Cadastrar as despesas do usuário. 
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta) VALUES ([cd_lancamento], [VALOR LANCAMENTO], TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), '[DESCRICAO DO LANCAMENTO]', [CD TIPO DESPESA], [CD USUARIO], [CD CONTA]);

-- Alterar todos os dados das despesas do usuário, utilizando o código como referência. 
UPDATE T_LANCAMENTO SET vl_lancamento = [VALOR LANCAMENTO], dt_lancamento = TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), ds_lancamento = '[DESCRICAO DO LANCAMENTO]', cd_tipo = [CD TIPO DESPESA], cd_conta = [CD CONTA] WHERE cd_lancamento = [CD LANCAMENTO];

-- Cadastrar os dados para investimentos. 
INSERT INTO T_LANCAMENTO(cd_lancamento, vl_lancamento, dt_lancamento, ds_lancamento, cd_tipo, cd_usuario, cd_conta, cd_tipo_investimento) VALUES ([cd_lancamento], [VALOR LANCAMENTO], TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), '[DESCRICAO DO LANCAMENTO]', [CD TIPO INVESTIMENTO], [CD USUARIO], [CD CONTA], [CD TIPO CARTEIRA INVESTIMENTO]);

-- Alterar todos os dados para investimentos do usuário, utilizando o código como referência. 
UPDATE T_LANCAMENTO SET vl_lancamento = [VALOR LANCAMENTO], cd_tipo_investimento = [CD TIPO CARTEIRA INVESTIMENTO], dt_lancamento = TO_DATE('[DATA DO LANCAMENTO]', 'DD/MM/YYYY'), ds_lancamento = '[DESCRICAO DO LANCAMENTO]', cd_tipo = [CD TIPO INVESTIMENTO], cd_conta = [CD CONTA] WHERE cd_lancamento = [CD LANCAMENTO];


/* 
  Consultas 
*/

-- Consultar os dados de um usuário (filtrar a partir do seu código). 
SELECT * FROM T_USUARIO WHERE cd_usuario = [CD USUARIO];

-- Consultar os dados de um único registro de despesa de um usuário 
-- (filtrar a partir do código do usuário e do código da despesa). 
SELECT * FROM T_LANCAMENTO WHERE cd_usuario = [CD USUARIO] AND cd_lancamento = [CD LANCAMENTO];

-- Consultar os dados de todos os registros de despesas de um  usuário, 
-- ordenando-os dos registros mais recentes para os mais antigos 
-- (filtrar a partir do seu código).
SELECT * FROM T_LANCAMENTO WHERE cd_usuario = [CD USUARIO] ORDER BY cd_lancamento DESC;

-- Consultar os dados de um único registro de investimento de um  usuário 
-- (filtrar a partir do código do usuário e do código de investimento.
SELECT * FROM T_LANCAMENTO WHERE cd_usuario = [CD USUARIO] AND cd_lancamento = [CD LANCAMENTO];

-- Consultar os dados de todos os registros de investimentos de um  usuário, 
-- ordenando-os dos registros mais recentes para os mais antigos 
-- (filtrar a partir do seu código).
SELECT * FROM T_LANCAMENTO WHERE cd_usuario = [CD USUARIO] AND cd_tipo = [CD TIPO INVESTIMENTO];

-- Consultar os dados básicos de um usuário, o último investimento registrado 
-- e a última despesa registrada (filtrar a partir do código de 
-- usuário – consulta necessária para o dashboard. Dica: veja consulta 
-- com junções). 
SELECT 
  u.nm_usuario, 
  i.vl_lancamento AS vl_investimento, 
  i.dt_lancamento AS dt_investimento,
  d.vl_lancamento AS vl_despesa, 
  d.dt_lancamento AS dt_despesa
FROM T_USUARIO u
LEFT JOIN T_LANCAMENTO i 
    ON i.cd_usuario = u.cd_usuario 
    AND i.cd_tipo = [CD TIPO INVESTIMENTO]
    AND i.dt_lancamento = (
        SELECT MAX(dt_lancamento)
        FROM T_LANCAMENTO 
        WHERE cd_usuario = u.cd_usuario AND cd_tipo = [CD TIPO INVESTIMENTO]
    )
LEFT JOIN T_LANCAMENTO d 
    ON d.cd_usuario = u.cd_usuario 
    AND d.cd_tipo = [CD TIPO DESPESA]
    AND d.dt_lancamento = (
        SELECT MAX(dt_lancamento)
        FROM T_LANCAMENTO 
        WHERE cd_usuario = u.cd_usuario AND cd_tipo = [CD TIPO DESPESA]
    )
WHERE cd_usuario = [CD USUARIO];