*** Settings ***
Documentation       Teste de compra com Sucesso

Resource            ../resources/main.resource

Test Setup           Abrir o navegador     
Test Teardown        Fechar o Navegador


*** Test Cases ***
Cenário: Compra de um produto com sucesso
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Validar se o valor do preço é exibido
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Validar informação de um produto do carrinho
    Sair do carrinho   
    Validar campo nome usuario        LAURA
    Validar campo sobrenome usuario   clara paula costa
    Validate campo CEP                12345678 
    Continuar a compra  
    Visualizar o resumo do pedido 

    
Cenário: Compra de mais de um produto com sucesso
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar dois produtos direto da vitrine
    Ir para o carrinho
    Sair do carrinho  
    Validar campo nome usuario        LAURA
    Validar campo sobrenome usuario   clara paula costa
    Validate campo CEP                12345678 
    Continuar a compra  
    Visualizar o resumo do pedido 

    
Cenário: Remover item do carrinho com sucesso
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Selecionar produto
    Adicionar produto no carrinho 
    Ir para o carrinho
    Remover produto do carrinho
    Validar remoção

Cenário: Ordenar produtos
    Acessar a home page do site
    Submeter credenciais             ${EMAIL}     ${SENHA} 
    Validar se vitrine é exibida
    Ordenar Produtos Por Opções Disponíveis    hilo
