## Automação interface SauceLabs ##

## Introdução ##

Robot Framework é uma estrutura genérica de automação de teste para testes de aceitação e desenvolvimento orientado a testes de aceitação. É uma estrutura de teste orientada por palavras-chave que usa a sintaxe de dados de teste tabular.

## Pré-requisitos ##

* Possuir Python instalado
(https://www.python.org/)

Para instalação precisa da versão 3.7 ou maior do Python

* Possuir node instalado
(https://nodejs.org/en/download/)

## Instalando o Robot Framework ##
Para instalação o Robot, rode o comando:

pip install robotframework

Para acessar mais informações sobre instruções de instalação, acesse 

Link = https://github.com/robotframework/robotframework/blob/master/INSTALL.rst

## Instalando bibliotecas utilizadas ##

Documentação da library = https://marketsquare.github.io/robotframework-browser/Browser.html

Update pip, rode o comando:
  pip install -U pip

Para instalar a library browser, rode o comando:
  pip install robotframework-browser

Para instalar as dependências do node, rode o comando:
  run rfbrowser init no seu (shell)

Se o comando não funcionar, rode o comando:
  python -m Browser.entry init

Para acessar mais informações sobre instruções de instalação, acesse
  https://github.com/MarketSquare/robotframework-browser


## 1)  Estrutura do projeto em Robot ##
Antes de add ou modificar o script é necessário entender como são as estruturas de dados
no framework.

 Settings = Aqui onde chamamos(configuramos) as bibliotecas que serão usadas nos testes (normalmente contextos hooks e testes setups).

 Variables = Aqui listamos as variaveis e seus respectivos valores que serão usadas nos testes.

 Tests Cases = Para nosso teste rodar, precisamos dessa seção. É aqui que nossos cenários devem ficar.

 Keywords = Aqui definimos nossas palavras chaves (já existentes ou criadas por nós).

 Documentation = Podemos colocar alguma informação como descrição da funcionalidade ou dos cenários.

 Tags =  No robot também podemos rodar apenas um ou um conjuntos de testes específicos. Para isso, precisamos apenas colocar tags nos tests cases:
  exemplo comentado no projeto - loginportal

 Indentação = Como no python, precisamos tratar com tabulações nossa escrita de código.

## 2) Abrindo e entendendo o projeto localmente ##
Precisa abrir o code na pasta raiz do projeto (tests)

Na pasta Logs, após a execução dos testes o robot gera automaticamente um report e um log em HTML.
O report é o resumo da execução, mostra os dados do teste e o resultado.

No log, existe um detalhamento da execução. Exibe keyword por keyword dos testes.
Se algum teste falhar, abra o arquivo log.html.

arquivo.resources = recursos dos testes do projeto: 
Na pasta Resources > arquivo main (Arquivo base) - informações iniciais que todos os cenários necessitam.
Na pasta Resources > Actions > estão os elementos, variáveis e keywords separados por funcionalidade.


arquivo.robot = Scripts de testes (suites de testes): 
Na pasta Tests_compra > estão nossos casos de testes (cenários da nossa última camada (UI))


###  Rodando os testes no terminal ###

Para executar os testes, rode o comando abaixo:
  robot -L trace -d ./log Tests_compra/

** trace é o tipo de detalhamento que eu quero da execução.
** -d ./logs onde eu quero que meu arquivo de log vá.


