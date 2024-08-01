* Settings *
Documentation           Base de testes do portal [Tim Negocia]

Library                 Browser
Library                 Collections
Library                 String
Library                 OperatingSystem
Library                 ./libs/sendlogs.py
Library                 ./libs/token_hermes.py

Resource                actions/access.robot
Resource                actions/components.robot
Resource                actions/token.robot
Resource                actions/nav.robot
Resource                actions/posprod.robot

* Variables *

${TEXTO_MODAL_SOBRE_COOKIES}        Nosso site armazena cookies para melhorar a sua navegação. Ao continuar, entendemos que você está de acordo com a nossa Política de Privacidade.

${TIM_URL}              https://timnegocia.com.br/
${TIM_HML_URL}          https://homologtimnegocia.servicesdigital.com.br/

${COPYRIGHT_YEAR}       2023

* Keywords *
Abrir Navegador
    New Browser                     Chromium        False     
    New Page                        about:blank
    Set Strict Mode                 False
    Set Browser Timeout             45000

Gravar Teste
    &{video}        Create Dictionary       dir=./video         viewport={'width': 1920, 'height': 1080}
    New Context                             recordVideo=${video}
    New Page            about:blank
    Set Strict Mode     False

Get JSON
    [Arguments]                 ${file_name}
    ${file}                     Get File                ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}              Evaluate                json.loads($file)           json
    [return]                    ${json_object}

Client PF
    ${fixture}                  Get JSON                database.json
    ${client}                   Set Variable            ${fixture['clientpf']}
    Set Suite Variable          ${client}

Client PJ
    ${fixture}                  Get JSON                database.json
    ${client}                   Set Variable            ${fixture['clientpj']}
    Set Suite Variable          ${client}

Evidenciar Limpar Cache e Recarregar Página
    Take Screenshot
    LocalStorage Clear
    Sleep                       2
    Reload
