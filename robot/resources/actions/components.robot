* Settings *
Documentation                       Ações de componentes genéricos do projeto

Resource                            ../base.robot

* Keywords *
Clicar em Continuar
    Wait For Elements State         css=button[type="submit"]          enabled         120
    Click                           css=button[type="submit"]
    Wait Until Network Is Idle

Validar Alerta Cpf Invalido
    [Arguments]          ${expected_text}
    ${alerta_cpf}        Get Text          xpath=//input[@name="cpf"]/../..//p
    Should Contain       ${alerta_cpf}     ${expected_text}

Validar Alerta Cnpj Invalido
    [Arguments]          ${expected_text}
    ${alerta_cnpj}       Get Text          xpath=//input[@name="cnpj"]/../..//p
    Should Contain       ${alerta_cnpj}    ${expected_text}

Validar Alerta Data de Nascimento Invalida
    [Arguments]          ${expected_text}
    ${alerta_data_n}     Get Text             xpath=//input[@name="birthday"]/../..//p
    Should Contain       ${alerta_data_n}     ${expected_text}

Validar Alerta de CPF Obrigatório
    [Arguments]          ${expected_text}
    ${alerta_cpf}        Get Text          xpath=//input[@name="cpf"]/../..//p
    Should Contain       ${alerta_cpf}     ${expected_text}

Validar Alerta de Data de Nascimento Obrigatória
    [Arguments]          ${expected_text}
    ${alerta_data_n}     Get Text             xpath=//input[@name="birthday"]/../..//p
    Should Contain       ${alerta_data_n}     ${expected_text}

Validar Alerta de CNPJ Obrigatório
    [Arguments]          ${expected_text}
    ${alerta_cnpj}       Get Text          xpath=//input[@name="cnpj"]/../..//p
    Should Contain       ${alerta_cnpj}    ${expected_text}

Verificar Botao Desabilitado
    @{states}                       Get Element States              css=button[type="submit"]
    Log                             ${states}
    List Should Contain Value       ${states}                       disabled

Aguardar Solicitação
    [Arguments]                     ${expected_text}
    Wait For Elements State         css=div[class="box-form"] >> text=${expected_text}           visible               60

Modal Cliente Sem Faturas
    Wait For Elements State         xpath=//div[@role="dialog"]//span[text()="Não encontramos débitos"]             visible               30

Validar Texto da Pagina
    [Arguments]                     ${expected_text}
    Wait For Elements State         css=div[class*="container"] >> text=${expected_text}                 visible               120

Validar Pagina Inicial
    Validar Texto da Pagina          Selecione o contrato desejado para prosseguir com o atendimento:
    Validar Copyright

Selecionar Fatura
    Visualizar Fatura
    Selecionar Conta

Selecionar Conta
    Click                           css=div[class="select-debt"]

Selecionar Fatura Camp
    Visualizar Fatura
    Selecionar Conta Camp

Selecionar Conta Camp
    Click                           css=label[class="box-offer"]

Visualizar Fatura
    Click                           css=a[class^="box-slider pulse"]
    Validar Texto da Pagina         Selecione a(s) conta(s) que gostaria de realizar o pagamento:

Visualizar Lista de Faturas
    Click                           css=a[class="bt-view-more"]
    Validar Texto da Pagina         Selecione um dos contratos abaixo para prosseguir com o atendimento:

Botão de Ajuda
    Wait For Elements State         css=button[class="icon-bt-atendimento-home"]        visible    60
    Click                           css=button[class="icon-bt-atendimento-home"]
    
Ligar no Mesmo Numero
    Click                           css=#bt-ligar-mesmo-num
    Wait For Elements State         css=#bt-fechar-fluxo-4                              visible     5
    Click                           css=#bt-fechar-fluxo-4

Ligar em Outro Numero
    [Arguments]         ${number}
    Click                           css=#bt-ligar-outro-num
    Wait For Elements State         css=.input-atendimento-home             visible     5
    Fill Text                       css=.input-atendimento-home             ${number}
    Click                           css=#bt-continuar-fluxo-3

Voltar
    Go Back

Botão Voltar
    Click                           css=a[class="bt-voltar"]

Abrir Feedback
    Click                         css=button[id=bt-feedback-mini]

Dar Nota
    [Arguments]     ${nota}    
    Click                         css=label[class=bt-item-nps-${nota}]
    Wait For Elements State       css=button[id="bt-avaliar"]       enabled     10
    Click                         css=button[id="bt-avaliar"]

Motivo Feedback
    Wait For Elements State       css=div[class="row"] p >> text=Por que você deu esta nota?        visible         10
    Click                         xpath=//div[@class="column"]//label
    Wait For Elements State       css=button[class="bt-next-nps"]       enabled     10
    Click                         css=button[class="bt-next-nps"]

Comentar e Enviar Feedback
    Wait For Elements State       css=div[class^="row"] >> text=Quer deixar um comentário? (Opcional)        visible         10
    Click                         css=button[class="bt-next-nps"]
    Wait For Elements State       css=div[class^="title"] >> text=Feedback concluído

Validar Click To Call
    Click                         xpath=//div[@class="sticky bottom-6 p-6"]/button
    Wait For Elements State       xpath=//div[@role="dialog"]//h2[text()="Atendimento via ligação"]
    Click                         xpath=//div[@role="dialog"]//button[text()="Continuar"]
    Wait For Elements State       xpath=//div[@role="dialog"]//h2[text()="Telefone registrado"]
    Take Screenshot
    Click                         xpath=//div[@role="dialog"]//button[text()="Fechar"]

Validar Vantagens
    ${vantagem1}        Get Text           xpath=//section[@id="advantages"]//li[1]//span
    ${vantagem2}        Get Text           xpath=//section[@id="advantages"]//li[2]//span
    ${vantagem3}        Get Text           xpath=//section[@id="advantages"]//li[3]//span
    ${vantagem4}        Get Text           xpath=//section[@id="advantages"]//li[4]//span
    ${vantagem5}        Get Text           xpath=//section[@id="advantages"]//li[5]//span
    ${vantagem6}        Get Text           xpath=//section[@id="advantages"]//li[6]//span
    ${vantagem7}        Get Text           xpath=//section[@id="advantages"]//li[7]//span
    ${vantagem8}        Get Text           xpath=//section[@id="advantages"]//li[8]//span
    Should Be Equal     ${vantagem1}       Pagamento com Cartão de Crédito
    Should Be Equal     ${vantagem2}       Pagamento com o C6BANK
    Should Be Equal     ${vantagem3}       Agilidade e Segurança
    Should Be Equal     ${vantagem4}       Pagamento via Pix
    Should Be Equal     ${vantagem5}       Pagamento com Débito Virtual Caixa
    Should Be Equal     ${vantagem6}       Envio de código de barras (SMS/E-mail)
    Should Be Equal     ${vantagem7}       Negociação rápida e fácil
    Should Be Equal     ${vantagem8}       Negociação a qualquer hora

Validar Passo A Passo
    ${passo1}           Get Text          xpath=//section[@id="tutorial"]//li[1]//h6
    ${passo2}           Get Text          xpath=//section[@id="tutorial"]//li[2]//h6
    ${passo3}           Get Text          xpath=//section[@id="tutorial"]//li[3]//h6
    ${passo4}           Get Text          xpath=//section[@id="tutorial"]//li[4]//h6
    ${passo5}           Get Text          xpath=//section[@id="tutorial"]//li[5]//h6
    Should Be Equal     ${passo1}         Insira seus dados
    Should Be Equal     ${passo2}         Insira o código de verificação
    Should Be Equal     ${passo3}         Selecione o contrato e a conta que deseja pagar
    Should Be Equal     ${passo4}         Formas de pagamento
    Should Be Equal     ${passo5}         Prontinho 😉

Validar Telefones Para Contato
    ${numeroNegociacaoDeDebitos}        Get Text           xpath=//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="Negociação de débitos"]/..//p[2]
    ${numeroTimUltrafibra}              Get Text           xpath=//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="TIM Ultrafibra"]/..//p[2]
    ${numeroTimPosContreEEmpresa}       Get Text           xpath=//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="TIM Pós, TIM Controle e TIM Empresa"]/..//p[2]
    Should Be Equal     ${numeroTimPosContreEEmpresa}      *144 ou 1056
    Should Be Equal     ${numeroTimUltrafibra}             103 41
    Should Be Equal     ${numeroNegociacaoDeDebitos}       0800 888 2373

Validar Copyright
    ${texto_copyright}        Get Text        xpath=//p[contains(text(),"©")]
    Should Contain            ${texto_copyright}           Concentrix
    Should Contain            ${texto_copyright}           2024

Validar Politica De Privacidade
    Click               xpath=//footer//a[text()="Política de privacidade"]
    Sleep               1
    Wait Until Network Is Idle
    ${politica_de_privacidade}          Get Text           css=main
    Should Contain      ${politica_de_privacidade}         Política de Privacidade
    Should Contain      ${politica_de_privacidade}         proteccion.dedatos@webhelp.com
    Take Screenshot     Política de Privacidade
    Go Back

Validar Politica De Privacidade do Aviso Sobre Cookies
    Click               css=article[class^="container"] a
    Sleep               1
    Wait Until Network Is Idle
    ${politica_de_privacidade}          Get Text           css=main
    Should Contain      ${politica_de_privacidade}         Política de Privacidade
    Should Contain      ${politica_de_privacidade}         proteccion.dedatos@webhelp.com
    Take Screenshot     Política de Privacidade
    Go Back

Botao Inicio
    Click               xpath=//a[contains(@class,"gap-2 ")]//span[text()="Início"]
    Validar Texto da Pagina                Selecione o contrato desejado para prosseguir com o atendimento:

Ir Para Canais De Atendimento
    Click            css=footer a[href$="atendimento"]
    Validar Texto Da Pagina        Entre em contato conosco através dos canais:

Visualizar Lista De Contratos
    Click            css=a[class="bt-view-more"]
    Validar Texto Da Pagina        Selecione um dos contratos abaixo para prosseguir com o atendimento:

Solicitar Email
    Click            xpath=//button/span[text()="Receber via E-mail"]
    Wait For Elements State    xpath=//div[@role="dialog"]//h2[text()="Receber via e-mail"]    visible    60
    Fill Text        css=input[id="email"]      ${client}[email]
    Click            css=button[form="send-invoice-form"]
    Wait For Elements State    xpath=//div[@role="dialog"]//h2[text()="Boleto enviado com sucesso!"]    visible    60
    Take Screenshot    Sucesso Email Segunda Via
    Click            xpath=//div[@role="dialog"]//button[text()="Fechar"]

Solicitar SMS
    Click            xpath=//button/span[text()="Receber via SMS"]
    Wait For Elements State    xpath=//div[@role="dialog"]//h2[text()="Receber via SMS"]    visible    60
    Fill Text        css=input[id="phone"]       ${client}[phone]
    Click            css=button[form="send-invoice-form"]
    Wait For Elements State    xpath=//div[@role="dialog"]//h2[text()="Boleto enviado com sucesso!"]    visible    60
    Take Screenshot    Sucesso SMS Segunda Via
    Click            xpath=//div[@role="dialog"]//button[text()="Fechar"]

Baixar Boleto
    # ${aguardarDownload} = this.page.waitForEvent('download')
    Click            xpath=//a/span[text()="Baixar boleto"]
    # Sleep            6
    # ${boleto} = await aguardarDownload
    # await boleto.saveAs('./evidencias/boleto.pdf')

Validar Opcao Pagar Com App Do Meu Banco
    Click            xpath=//button/span[text()="Pagar com app do meu banco"]
    Wait For Elements State        xpath=//div[@role="dialog"]//h2[text()="Pague com o App do seu banco"]    visible    60
    FOR     ${index}     IN RANGE     1     13
        ${banco}             Get Text        xpath=//div[@role="dialog"]//a[${index}]
        Click                xpath=//div[@role="dialog"]//span[text()="${banco}"]
        Switch Page          NEW
        Take Screenshot      ${banco}
        Close Page
        # ${siteDoBanco} = await this.page.waitForEvent('popup')
        # await siteDoBanco.bringToFront()
        # await siteDoBanco.waitForLoadState('networkidle')
        # await siteDoBanco.screenshot({ path: `./evidencias/bancos/site-${banco}.png` })
        # await siteDoBanco.close()
    END
    Click            xpath=//div[@role="dialog"]//button

Selecionar Opcao de Pagamento Segunda Via
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"boleto")]
    Wait Until Network Is Idle
    Validar Texto Da Pagina        Como gostaria de receber a 2ª via do seu boleto?
    Take Screenshot    Segunda Via
    Validar Copyright

Selecionar Opcao de Pagamento Codigo De Barras
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"codigo-de-barras")]
    Wait For Elements State    xpath=//h4[contains(text(),"Código de barras")]    visible    60
    Take Screenshot    Código De Barras
    Validar Copyright

Selecionar Opcao de Pagamento Cartao De Credito
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"cartao-de-credito")]
    Wait Until Network Is Idle
    Validar Texto Da Pagina        Insira os dados do seu Cartão de Crédito:
    Take Screenshot    Iframe Cartão de Crédito
    Validar Copyright

Selecionar Opcao de Pagamento Debito Caixa
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"cartao-de-debito")]
    Wait Until Network Is Idle
    Validar Texto Da Pagina        Insira os dados do seu Cartão de Débito:
    Take Screenshot    Iframe Débito Caixa
    Validar Copyright

Selecionar Opcao de Pagamento Pix
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"pix")]
    Validar Texto da Pagina        Escaneie o QRcode ou copie a chave pix.
    Take Screenshot    Pix
    Validar Copyright

Selecionar Opcao de Pagamento GPay
    Abrir Opções de Pagamento
    Click            xpath=//div[@role="dialog"]//a[contains(@href,"google-pay")]
    Wait Until Network Is Idle
    ${textoModalDeDados}    Get Text       xpath=//div[contains(@class,"container")]//h4[text()="Informações de conta"]
    Should Contain          ${textoModalDeDados}    Informações de conta
    Take Screenshot    Gpay
    Validar Copyright

Selecionar Contrato
    Click            xpath=//a[contains(@href,'contas')]
    Wait Until Network Is Idle
    Take Screenshot
    Validar Copyright
    
Abrir Opções de Pagamento
    ${tem_campanha}    Run Keyword And Return Status    Should Be Equal    ${tipo_de_contrato}    Contrato com campanha
    IF          ${tem_campanha} == True
        Click                    xpath=//button/span[text()="Ir para opções de pagamento"]
    ELSE IF     ${tem_campanha} == False
        Click            xpath=//button/span[text()="Pagar conta"]
    END
    Wait For Elements State        xpath=//div[@role="dialog"]//span[text()="Como você deseja pagar?"]    visible    60

Botao Acessar Portal
    Click            xpath=//button//span[text()="Acessar portal"]

Validar Notificacao de Envio do Pix por SMS
    Click                xpath=//button//span[text()="Notificações"]
    ${titulo_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//h3
    ${texto_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//p
    Should Be Equal    ${titulo_notificacao}    Pix enviado
    Should Be Equal    ${texto_notificacao}    SMS enviado com sucesso.
    Take Screenshot
    Keyboard Key       press    Escape

Validar Notificacao de Envio do Pix por Email
    Click                xpath=//button//span[text()="Notificações"]
    ${titulo_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//h3
    ${texto_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//p
    Should Be Equal    ${titulo_notificacao}    Pix enviado
    Should Be Equal    ${texto_notificacao}    E-mail enviado com sucesso.
    Take Screenshot
    Keyboard Key       press    Escape

Validar Notificacao de Envio do Boleto por SMS
    Click                xpath=//button//span[text()="Notificações"]
    ${titulo_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//h3
    ${texto_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//p
    Should Be Equal    ${titulo_notificacao}    Boleto enviado
    Should Be Equal    ${texto_notificacao}    SMS enviado com sucesso.
    Take Screenshot
    Keyboard Key       press    Escape

Validar Notificacao de Envio do Boleto por Email
    Click                xpath=//button//span[text()="Notificações"]
    ${titulo_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//h3
    ${texto_notificacao}        Get Text        xpath=//div[@role="dialog"]//li//p
    Should Be Equal    ${titulo_notificacao}    Boleto enviado
    Should Be Equal    ${texto_notificacao}    E-mail enviado com sucesso.
    Take Screenshot
    Keyboard Key       press    Escape

Validar Texto do Aviso Sobre Cookies
    ${texto_aviso_sobre_cookies}        Get Text        css=article[class^="container"] p
    Should Be Equal                     ${texto_aviso_sobre_cookies}            	${TEXTO_MODAL_SOBRE_COOKIES}        collapse_spaces=true

Aceitar Política de Privacidade 
    Click            css=article[class^="container"] button >> text="Aceitar"
    Wait For Elements State       css=article[class^="container"]        hidden        10

Aguardar Visualização do Formulário de Login
    Wait For Elements State           css=form[id="form-login"]        visible        30

Aguardar Visualização do Formulário de Solicitação do Token
    Wait For Elements State           css=form p[id="phone-helper"] >> text="Insira seu telefone celular"        visible        30

Aguardar Visualização do Formulário de Confirmação do Token
    Wait For Elements State           css=form p[id="helper-pin"] >> text="Insira o código de verificação"       visible        30

Abrir e Fechar Libras Rybená
    Click         css=button[class^="btn-rybena-sign-language"]
    Wait For Elements State        css=div[id="rybena-player-div"]        visible        10
    Sleep         3
    Take Screenshot
    Click         css=div[id="rybena-close"]

Abrir e Fechar Voz Rybená
    Click         css=button[class^="btn-rybena-voice"]
    Wait For Elements State        css=div[id="rybena-player-div"]        visible        10
    Sleep         3
    Take Screenshot
    Click         css=div[id="rybena-close"]

Abrir e Fechar Acessibilidade Rybená
    Click         css=button[class^="btn-rybena-vision"]
    Wait For Elements State        css=div[id="rybena-player-div"]        visible        10
    Sleep         3
    Take Screenshot
    Click         css=div[id="rybena-close"]