*** Settings ***
Documentation      Arquivo para controle de variáveis e keywords utilizadas no projeto 

Library             Browser

*** Variables ***

#Seletores vinculados a ações da funcionalidades de login
${LOGIN_URL}                   https://www.saucedemo.com/
${EMAIL}                       standard_user
${SENHA}                       secret_sauce
${inserir_email}               data-test=username
${inserir_senha}               data-test=password
${logar}                       data-test=login-button
${mensagem_erro_login}         data-test=error >> text=Epic sadface: Username and password do not match any user in this service

#Seletores vinculados a ações da funcionalidades de vitrine
${vitrine}                    .title >> text=Products
${btn_ordenacao}              data-test=product_sort_container
${produto}                    .inventory_item_name >> text="Sauce Labs Bolt T-Shirt"       
${preço}                      //button[contains(@data-test,'add-to-cart-sauce-labs-bolt-t-shirt')]/..
${produto2}                   data-test=add-to-cart-sauce-labs-backpack
${produto3}                   data-test=add-to-cart-sauce-labs-fleece-jacket
${validar_add}               .shopping_cart_badge >> text=2

#Seletores vinculados a ações da funcionalidades de resumo do produto
${titulo_produto}             [class='inventory_details_name large_size'] >> text="Sauce Labs Bolt T-Shirt"
${descrição_produto}          [class='inventory_details_desc large_size']

#Seletores vinculados a ações da funcionalidades do carrinho
${add_carrinho}                data-test=add-to-cart-sauce-labs-bolt-t-shirt
${carrinho_compras}            .shopping_cart_link
${num_produtos_carrinho}       .cart_quantity
${remover_item}                data-test=remove-sauce-labs-bolt-t-shirt
${btn_checkout}                data-test=checkout
${qt_no_carrinho}              .shopping_cart_badge
${removido}                    .removed_cart_item

#Seletores vinculados a ações da funcionalidades de dados de finalização da compra 
${confirmar_dados}              .title >> text=Checkout: Your Information             
${nome}                         data-test=firstName
${sobrenome}                    data-test=lastName
${cep}                          data-test=postalCode
${btn_continue}                 data-test=continue
${mensagem_erro}                data-test=error >> text=Error: First Name is required

#Seletores vinculados a ações da funcionalidades de resumo do pedido 
${resumo_pedido}               .summary_info
${btn_finalizar}               data-test=finish

#Seletores vinculados a ações da funcionalidades compra finalizada
${compra_finalizada}           .title >> text=Checkout: Complete!
              


*** Keywords ***
Acessar a home page do site 
    New Page                  ${LOGIN_URL} 
    
Submeter credenciais 
        [Arguments]           ${EMAIL}            ${SENHA}
    Fill Text                 ${inserir_email}    ${EMAIL}
    Fill Text                 ${inserir_senha}    ${SENHA}
    Click                     ${logar}      

Validar se vitrine é exibida
    Wait For Elements State    ${vitrine}         visible   10
    Wait For Elements State    ${produto}         visible   10
    
Ordenar Produtos Por Opções Disponíveis
        [Arguments]                               ${ordena}
        Select Options By                         ${btn_ordenacao}      value    ${ordena}

Validar se o valor do preço é exibido
    Wait For Elements State                       ${preço}              visible    10
    Should Not Be Empty                           ${preço}

Selecionar dois produtos direto da vitrine
    Click                                         ${produto2}
    Click                                         ${produto3}
    Should Not Be Empty                           ${qt_no_carrinho}
    ${qt}=          Get Text                      ${qt_no_carrinho}
    Should Be Equal As Integers     ${qt}    2

Selecionar produto
    Click                                         ${produto} 
    Wait For Elements State                       ${titulo_produto}      visible    10
    Should Not Be Empty                           ${titulo_produto} 
    Wait For Elements State                       ${descrição_produto}   visible    10
    Should Not Be Empty                           ${descrição_produto}

Adicionar produto no carrinho
     Click                                        ${add_carrinho} 

Ir para o carrinho   
    Wait For Elements State                       ${carrinho_compras}      visible  30 
    Click                                         ${carrinho_compras}  

Remover produto do carrinho
    Click                                         ${remover_item} 

Validar remoção    
    ${remove}=  Get Element States                ${removido}              contains    hidden      
    
Validar informação de um produto do carrinho    
    Wait For Elements State                       ${produto}                   visible       30 
    Wait For Elements State                       ${num_produtos_carrinho}     visible       10
    Should Not Be Empty                           ${num_produtos_carrinho}

Sair do carrinho 
    Wait For Elements State                       ${btn_checkout}            visible    10
    Click                                         ${btn_checkout} 
    Wait For Elements State                       ${confirmar_dados}         visible    10
    

Validar campo nome usuario
    [Arguments]      ${first_name}
    ${error_msg}=    Set Variable            Campo nome não deve começar com números / O campo nome não deve aceitar mais de uma palavra / campo não pode ser vazio
    ${regex} =       Set Variable            ^[a-zA-Z]+(\s[a-zA-Z]+)?$
    Click                                    ${nome}
    Should Not Be Empty                      ${first_name}    error=Campo Nome não pode ser em branco
    Should Not Match Regexp                  ${first_name}    ^\d.*        error=${error_msg}
    Should Match Regexp                      ${first_name}    ${regex}     error=${error_msg}
    Clear Text                               ${nome}
    Fill Text                                ${nome}                       ${first_name}

Validar campo sobrenome usuario   
    [Arguments]       ${last_name}
    ${error_msg} =    Set Variable          Campo sobrenome não deve conter números
    ${regex} =        Set Variable          ^[a-zA-Z]+([ -][a-zA-Z]+)*$
    Click                                   ${sobrenome}
    Should Not Be Empty                     ${last_name}    error=Campo Sobrenome não pode ser em branco
    Should Not Match Regexp                 ${last_name}    ^\d.*        error=${error_msg}
    Should Match Regexp                     ${last_name}    ${regex}     error=${error_msg}
    Clear Text                              ${sobrenome}
    Fill Text                               ${sobrenome}                 ${last_name}

 
Validate campo CEP
    [Arguments]     ${cep_value}
    ${error_msg} =  Set Variable            Campo CEP deve conter exatamente 8 dígitos numéricos
    ${regex} =      Set Variable            ^[0-9]{8}$
    Click                                   ${cep}
    Should Not Be Empty                     ${cep_value}                error=Campo CEP não pode ser em branco
    Should Match Regexp                     ${cep_value}    ${regex}    error=${error_msg}
    Clear Text                              ${cep}
    Fill Text                               ${cep}                      ${cep_value}

Continuar a compra
    Click                                   ${btn_continue}

Validar mensagem de erro dos dados solicitados para o usuário
    Wait For Elements State                 ${mensagem_erro}           visible  10

Validar mensagem de erro do login inválido
    Wait For Elements State                ${mensagem_erro_login}      visible  10

Visualizar o resumo do pedido
    Wait For Elements State                ${resumo_pedido}            visible  10
    Wait For Elements State                ${btn_finalizar}            visible  10  
    Click                                  ${btn_finalizar}        
    Wait For Elements State                ${compra_finalizada}        visible  10





  