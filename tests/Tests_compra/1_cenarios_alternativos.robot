*** Settings ***

Documentation       Teste de compra com falhas

#Devido algumas regras não serem validadas no site, alguns testes meus falharão pois as regras estão aplicadas nesse código

Resource            ../resources/main.resource

Test Setup           Abrir o navegador     
Test Teardown        Fechar o Navegador


*** Test Cases ***
Cenário: Login Inválido 
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     rot
    Validar mensagem de erro do login inválido



Cenário: Tentativa de Compra com nome Incorreto
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Validar campo nome usuario        123LAURA costa
    Validar campo sobrenome usuario   clara paula costa
    Validate campo CEP                11111111
    Continuar a compra  
    Visualizar o resumo do pedido 


Cenário: Tentativa de Compra com Sobrenome Incorreto
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Validar campo nome usuario        LAURA 
    Validar campo sobrenome usuario   87clara paula costa
    Validate campo CEP                11111111
    Continuar a compra  
    Visualizar o resumo do pedido 

Cenário: Tentativa de Compra com CEP Incorreto
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Validar campo nome usuario        LAURA 
    Validar campo sobrenome usuario   clara paula costa
    Validate campo CEP                TESTE 
    Continuar a compra 
    Visualizar o resumo do pedido 


Cenário: Tentativa de Compra com Nome e Sobrenome em branco
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Validar campo nome usuario        "" 
    Validar campo sobrenome usuario   ""
    Validate campo CEP                11111111  
    Continuar a compra
    Visualizar o resumo do pedido 
  

Cenário: Não informar dados obrigatórios para a compra
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Continuar a compra  
    Validar mensagem de erro dos dados solicitados para o usuário