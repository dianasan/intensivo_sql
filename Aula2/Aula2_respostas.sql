# --- AULA 2: COMANDOS ESSENCIAIS DO SQL --- #

# 1. APRESENTAÇÃO
-- A hashtagmovie é um banco de dados que tem como principal objetivo armazenar as informações de desempenho dos filmes alugados pelo serviço de streaming da empresa ao longo do período. 

-- Esse banco de dados é composto por 5 tabelas:
	# alugueis: armazena os dados relacionados aos aluguéis dos filmes
    # atores: armazena os dados dos atores dos diferentes filmes
    # atuacoes: tabela contendo a participação de cada ator no respectivo filme
    # clientes: tabela com os dados dos clientes da empresa
    # filmes: dados sobre os filmes disponíveis para aluguel


-- Esses dados serão fundamentais para que futuramente sejam feitas análises dos dados para tomadas de decisão de curto e longo prazo, como:

-- i) Decisão de investir em determinados filmes baseado na sua popularidade (nota)
-- ii) Número total de locações definirá a RECEITA DA EMPRESA
-- iii) A média de avaliação dos filmes definirá a SATISFAÇÃO DOS CLIENTES
-- iv) O número de clientes ativos definirá o ENGAJAMENTO DOS CLIENTES

-- O projeto então terá alguns objetivos, como:	
		-- Descobrir as preferências dos clientes de acordo com região e sexo
		-- Popularidade dos filmes por gênero e ano de lançamento
        -- Filmes com nota acima da média
        -- Dentre outros
        
-- Para que a gente seja capaz de realizar todas essas análises no SQL (aula 3), precisaremos aprender os COMANDOS ESSENCIAIS, que serão mostrados na aula de hoje (e continuaremos na aula 3).

# =======        PARTE 1:       =======#
# =======  COMANDOS DE SELEÇÃO  =======#


-- SELECT, SELECT LIMIT, SELECT DISTINCT 

-- 1. Você foi alocado como analista responsável da hashtagmovie. 
-- Seu primeiro desafio é fazer um reconhecimento das tabelas do banco de dados, isso será importante para as próximas etapas do projeto.
-- Além disso, identifique a quantidade de linhas que existem para cada tabela. Esse check será importante para garantir que nenhuma informação está faltando.
SELECT * FROM alugueis;			-- 578 linhas
SELECT * FROM atores;			-- 145 linhas
SELECT * FROM atuacoes;			-- 213 linhas
SELECT * FROM clientes;			-- 123 linhas
SELECT * FROM filmes;			-- 71 linhas

-- 2. Pensando que as tabelas do SQL podem ter milhões de linhas, para fazer o reconhecimento de tabelas nem sempre é necessário visualizar todas as linhas, basta verificar as N primeiras linhas. 

-- Por isso, uma boa prática para selecionar os dados no SQL é limitar a quantidade de linhas que são visualizadas na tabela. 
-- a) Utilize o comando LIMIT para visualizar apenas as 10 primeiras linhas da tabela de FILMES.
SELECT 
	* 
FROM filmes
LIMIT 10;

-- b) Utilize o comando LIMIT para visualizar apenas as 50 primeiras linhas da tabela de CLIENTES.
SELECT 
	* 
FROM clientes
LIMIT 50;	

-- 3. O responsável pela criação das tabelas disse que os filmes se dividem em um total de 7 GÊNEROS: 1) Comédia; 2) Drama; 3) Ficção e Fantasia; 4) Mistério e Suspense; 5) Arte; 6) Animação; 7) Ação e Aventura.

-- Nesse momento, você terá o IMPORTANTE trabalho de verificar se todos esses gêneros estão de fato presentes na tabela FILMES. Caso não esteja, você deverá reportar ao responsável.
SELECT 
	DISTINCT genero
FROM filmes;

-- 4. A empresa sabe que precisa expandir seu mercado para o máximo de estados possível. Como analista dos dados, você deverá identificar quais são os estados onde atualmente a empresa possui clientes. Quantos são esses estados no total? Pensando que o país tem 27 UF (26 estados + DF), ainda há espaço para expandir para quantos estados?
SELECT 
	DISTINCT estado
FROM clientes;

-- Atualmente a empresa possui clientes em 11 estados e tem possibilidade de expandir para os outros 16 (15 estados e DF)

# =======         PARTE 2:        =======#
# =======  COMANDOS DE ORDENAÇÃO  =======#

-- ORDER BY ASC, ORDER BY DESC

-- 1. Faça uma análise em cima do ano de nascimento de cada um dos atores. Ordene a tabela de atores para mostrar os atores com os anos de nascimento do maior para o menor.
SELECT 
	*
FROM atores
ORDER BY ano_nascimento DESC;

-- 2. O setor de controle de dados vai precisar fazer uma segmentação dos clientes, separando por ordem alfabética. Faça uma ordenação na tabela de clientes a partir da coluna nome_cliente para facilitar o trabalho dos seus colegas.
SELECT 
	*
FROM clientes
ORDER BY nome_cliente;

-- 3. Na tabela de clientes, tente descobrir qual foi o cliente com a data de criação de conta mais antiga, ou seja, o primeiro cliente cadastrado na base.
SELECT 
	*
FROM clientes
ORDER BY data_criacao_conta 
LIMIT 1;

-- 4. A empresa gostaria de saber quais são os TOP 5 filmes com a maior duração. Você seria capaz de fazer essa análise?
SELECT 
	* 
FROM filmes
ORDER BY duracao DESC
LIMIT 5;

# =======         PARTE 3:        =======#
# =======  COMANDOS DE FILTRAGEM  =======#

-- WHERE (padrão, AND/OR, IN, BETWEEN)


-- 1. A empresa deseja incluir em seu catálogo mais filmes do gênero de COMÉDIA. Para isso, ela deverá adquirir os direitos de transmissão junto ao estúdio responsável.
-- Porém, a empresa deve tomar cuidado para não negociar um filme que já existe em seu catálogo.
-- O seu trabalho, portanto, é listar todos os filmes do gênero COMÉDIA e fornecer essas informações ao seu gestor.
SELECT 
	*
FROM filmes
WHERE genero = 'Comédia';

-- 2. A equipe de estratégia fez um levantamento com os críticos de cinema mais conhecidos e descobriram que o ano de 2003 foi um dos anos de sucesso do cinema. Alguns desses críticos foram contratados para ajudar na melhoria do catálogo de filmes, e querem sugerir mais opções de filmes que foram lançados em 2003.
-- Para isso, os críticos contratados precisarão da lista de filmes que a empresa já tem, para que eles possam avaliar se esses filmes realmente são boas opções de se ter no catálogo, e também aproveitar para sugerir outros títulos.
-- O seu trabalho, portanto, é fazer uma consulta ao banco de dados para essa solicitação do projeto. 
SELECT 
	*
FROM filmes
WHERE ano_lancamento = '2003';

-- 3. Um dos analistas da equipe percebeu que alguns filmes do gênero Drama, com mais de 120 minutos de duração, não tinham uma boa avaliação dos clientes. Por isso, ele levantou a ideia de se analisar com mais cuidado todos os filmes que se enquadrassem nesses critérios, para verificar se de fato eles estão tendo um baixo rendimento.
-- O seu trabalho é listar todos esses filmes para que seja possível realizar essa análise.
SELECT 
	*
FROM filmes
WHERE genero = 'Drama' AND duracao > '120';

-- 4. A empresa está percebendo que os países do: Canadá, Austrália e Irlanda do Norte estão produzindo bons filmes nos últimos anos. Vendo esse movimento, a empresa decidiu listar todos os atores dessas nacionalidades para pesquisar filmes relacionados e avaliar a possibilidade de incluir mais opções no catálogo, referentes ao cinema desses 3 países.
-- O seu trabalho é listar todos os atores de nacionalidade: Canadá, Austrália e Irlanda do Norte para facilitar essa análise.
SELECT 
	* 
FROM atores
WHERE nacionalidade = 'Canadá' OR nacionalidade = 'Austrália' OR nacionalidade = 'Irlanda do Norte';

-- 5. A empresa decidiu criar uma opção de catálogo alternativa para os seus filmes: agora, os clientes poderão escolher, por exemplo, alugar filmes na faixa de duração entre 90 min e 100 minutos. Seu trabalho será o de iniciar essa organização, e começar mostrando os filmes que possuem uma duração neste intervalo.
SELECT 
	* 
FROM filmes
WHERE duracao BETWEEN 90 AND 100; 

# =======        PARTE 4:       =======#
# =======  FUNÇÕES MATEMÁTICAS  =======#

-- Funções de Agregação: COUNT, COUNT DISTINCT, SUM, MIN, MAX, AVG

-- 1. A tabela de ALUGUEIS tem o registro de todos os aluguéis feitos no serviço de streaming da empresa.

-- a) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna id_aluguel para esse cálculo).
SELECT 
	COUNT(id_aluguel)
FROM alugueis;
-- 578

-- b) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna nota para esse cálculo).
SELECT 
	COUNT(nota)
FROM alugueis;
-- 328

-- c) Você viu alguma diferença no resultado? O que aconteceu?
-- Sim, a função COUNT conta os valores não nulos, a coluna nota deve ter muitas linhas vazias.

-- 2. O setor de catálogo precisa saber quantos gêneros de filmes existem na empresa atualmente. Você saberia fazer essa análise?
SELECT 
	COUNT(DISTINCT genero)
FROM filmes;
-- 7

-- 3. Quantos minutos no total a empresa possui de filmes catalogados?
SELECT 
	SUM(duracao)
FROM filmes;
-- 88592

-- 4. Qual é a duração em minutos do filme mais longo disponível no catálogo? E qual a duração do filme mais curto?
SELECT 
	MAX(duracao) AS 'Maior duração',
    MIN(duracao) AS 'Menor duração'
FROM filmes;
-- Maior 200  // Menor 91

-- 5. Qual é a média de satisfação dos clientes da empresa em relação aos filmes alugados?
SELECT 
	AVG(nota) AS 'Média das avaliações'
FROM alugueis;
-- 7.93