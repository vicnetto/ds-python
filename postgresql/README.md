# **Banco de Dados -- Como funciona SQL?**

Esse documento está sendo utilizado para estudo pessoal na área de banco de dados, principalmente envolvendo **SQL**. Um pouco sobre o que será aprendido é: criação de banco de dados e tabelas, principais comandos (inserção, deleção, atualização e seleção), chave primária e estrangeira e junção de tabelas (comando **join**).

## O que é o banco de dados?

Basicamente um banco de dados armazena dados, como login, senha, id de usuário e coisas relacionadas. Ao criar um banco de dados a primeira tarefa a ser feita é a geração de tabelas (colunas). Essas **colunas** vão ter um certo tipo, como **string**, **integer** e **float**.

> Como uma anologia, o banco de dados funciona como uma planilha do **Excel**. Existem divesas **sheets** e dentro delas existem informações contidas no banco de dados.

É ideal sempre trabalhar com os comandos do **SQL**, pois caso mude o SGDB a linguagem sempre continuará a mesma.

## Entre todos os bancos de dados, qual foi o escolhido?

Devido a diversos fatores, os comandos apresentados nesse documento serão pertencentes do **PostgreSQL**.

## Alguns comandos básicos de **PostgreeSQL**:

1. Tabelas:
    **Tabelas** são dados armazenados em colunas, como as próprias tabelas do Excel.
- **CREATE TABLE** *tableName* (...); -> Cria uma tabela
- **DROP TABLE** *tableName*; -> Remove a tabela e todos os seus dados.
- **INSERT INTO** *tableName* (tuple with columns) **VALUES** (tuple with values) -> Insere na tabela.
    - Não é necessário especificar as colunas caso seja inserido valores para todos os elementos.
- **SELECT** *columns* **FROM** *tableName*; -> Seleciona colunas certas (* para todas) e apresenta os resultados.
- **SELECT** * **FROM** *tableName* **WHERE** *condition*; -> Usando *where* é possível escolher os dados apresentados, com condições.
    - É possível utilizar nas condições do *where* frases como: **AGE IN (25, 27)** ou **NAME LIKE 'Pa%'**.
- **SELECT** *operation* **AS** *operationName* -> Fazendo operações matemáticas com o *PostgreSQL*.
    - Algumas operações podem ser realizadas como **avg()**, **sum()** e **count()** nas colunas.

2. Schemas:
    **Schemas** são coleções de tabelas. Na verdade os *schemas* podem incluir muito mais do que apenas tabelas, como views, indexes, sequências, operadores e funções.

- **CREATE SCHEMA** *name*; -> Cria um novo *schema* nesse mesmo banco de dados.
- **DROP SCHEMA** *name*; -> Deleta o *schema*.











