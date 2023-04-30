*** Settings ***
Documentation       Arquivo base do projeto

Library             Browser
Resource            actions/compra_site.resource
*** Variables ***
 

*** Keywords ***

Abrir o navegador
   New Browser            headless=false
    New Context           viewport={'width': 1500, 'height': 700}
Fechar o Navegador
   Take Screenshot        fileType=jpeg
