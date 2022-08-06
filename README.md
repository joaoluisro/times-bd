# Trabalho 2 CI1010 - Programação Web

para executar o programa basta invocar o interpretador ruby:

``
  ruby bd.rb [TABELA] [OPERAÇÃO] [PARAMETROS]
``

O trabalho foi feito de modo que 5 tabelas existam como entrada, sendo elas:

1) Jogador
2) Time
3) Técnico
4) Patrocinador
5) Join Patrocinador e Time

existem 4 operações possíveis:

1) inclusao
2) exclusao
3) lista
4) alteracao

No caso da alteração para a tabela de patrocinador, é necessário informar se deseja adicionar ou remover um patrocinio de um time.

Para os parametros, é possível utilizar o comando de ajuda -h, exemplo:
``
  ruby bd.rb inclusao tecnico -h
``
Que informará quais parametros são aceitos.

Exemplos de inserção, listagem, exclusão e alteração podem ser encontrados no arquivo "test.sh"
