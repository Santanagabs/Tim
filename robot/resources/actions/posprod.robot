*** Settings ***
Documentation       Ações da validação pós produção do portal

Resource            ../base.robot


*** Keywords ***
Pegar Nome
    ${saudacao}    Get Text    xpath=//h2[contains(text(),"Olá")]
    ${saudacao_split}    Split String    ${saudacao}    ${SPACE}
    Set Suite Variable    ${nome}    ${saudacao_split}[1]
    Take Screenshot

Pegar Protocolo
    ${protocolo}    Get Text    xpath=//p[text()="Protocolo de atendimento:"]/..//p[2]
    Set Suite Variable    ${protocolo}
    Take Screenshot

Pegar Contrato
    ${numeroDoContrato}    Get Text    xpath=//p[text()="Contrato:"]/..//p[2]
    Set Suite Variable    ${numeroDoContrato}
    Take Screenshot

Pegar Telefone
    ${telefoneDoCliente}    Get Text    xpath=//div/ul[contains(@class,'gap-5')]//li[2]
    Set Suite Variable    ${telefoneDoCliente}
    ${length}    Get Length    ${telefoneDoCliente}
    ${tem_telefone}    Run Keyword And Return Status    Should Be Equal    ${length}    25
    Set Suite Variable    ${tem_telefone}
    Take Screenshot

Pegar Quantidade De Contas
    ${quantidadeDeContas}    Get Text    xpath=//p[text()="Conta(s)"]/..//p[2]
    Set Suite Variable    ${quantidadeDeContas}
    Take Screenshot

Pegar Valor Em Aberto
    ${valorDaConta}    Get Text    xpath=//p[text()="Valor em aberto"]/..//p[2]
    Set Suite Variable    ${valorDaConta}
    Take Screenshot

Pegar Mes Referencia
    ${mesReferencia}    Get Text    xpath=//div[text()="Mês referência"]/..//div[2]
    Set Suite Variable    ${mesReferencia}
    Take Screenshot

Pegar Status Da Conta
    ${statusDaConta}    Get Text    xpath=//div[text()="Status"]/..//div[2]
    Set Suite Variable    ${statusDaConta}
    Take Screenshot

Pegar Vencimento Da Conta
    ${vencimentoDaConta}    Get Text    xpath=//div[text()="Vencimento"]/..//div[2]
    Set Suite Variable    ${vencimentoDaConta}
    Take Screenshot

Pegar Valor Da Conta
    ${valorDaConta}    Get Text    xpath=//div[text()="Valor"]/..//div[2]
    Set Suite Variable    ${valorDaConta}
    Take Screenshot

Pegar Valor Sem Desconto
    ${valorSemDesconto}    Get Text    xpath=//p[text()="Valor sem desconto"]/..//p[2]
    Set Suite Variable    ${valorSemDesconto}
    Take Screenshot

Pegar Valor Com Desconto
    ${valorComDesconto}    Get Text    xpath=//p[text()="Valor com desconto"]/..//p[2]
    Set Suite Variable    ${valorComDesconto}
    Take Screenshot

Pegar Codigo De Barras
    ${codBar}    Get Text    xpath=//h4[contains(text(),"Código de barras")]/..//p
    Set Suite Variable    ${codBar}
    Take Screenshot

Pegar Pix Copia e Cola
    ${cod_pix}    Get Text    xpath=//h4[text()="Pix copia e cola"]/..//p
    Set Suite Variable    ${cod_pix}
    Take Screenshot

Validar Codigo Pix
    New Page    https://openpix.com.br/qrcode/scanner/
    Fill Text    css=textarea[class*="input"]    ${cod_pix}
    Click    xpath=//button[@type="button"][1]
    ${transactionAmount}    Get Text    xpath=//td[text()="Transaction Amount"]/..//td[4]
    ${valorQrScanner}   Replace String    ${transactionAmount}    .    ,
    ${countryCode}    Get Text    xpath=//td[text()="Country Code"]/..//td[4]
    ${merchantName}    Get Text    xpath=//td[text()="Merchant Name"]/..//td[4]

    Should Contain        ${valorComDesconto}    ${valorQrScanner}
    Should Be Equal       ${countryCode}         BR
    Should Be Equal       ${merchantName}        TIM S A

    Close Page

Pegar Contrato Tela Credito
    ${contratoCredito}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//b
    Set Suite Variable    ${contratoCredito}

Pegar Telefone Tela Credito
    ${telefoneCredito}    Get Text    xpath=//span[contains(text(),"Telefone")]/..//b
    Set Suite Variable    ${telefoneCredito}

Pegar Qtd De Contas Tela Credito
    ${qtdContasCredito}    Get Text    xpath=//span[contains(text(),"Quantidade de conta(s)")]/..//b
    Set Suite Variable    ${qtdContasCredito}

Pegar Valor Tela Credito
    ${valorCredito}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//b
    Set Suite Variable    ${valorCredito}

Pegar Contrato Tela Debito
    ${contratoDebito}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//b
    Set Suite Variable    ${contratoDebito}

Pegar Telefone Tela Debito
    ${telefoneDebito}    Get Text    xpath=//span[contains(text(),"Telefone")]/..//b
    Set Suite Variable    ${telefoneDebito}

Pegar Qtd De Contas Tela Debito
    ${qtdContasDebito}    Get Text    xpath=//span[contains(text(),"Quantidade de conta(s)")]/..//b
    Set Suite Variable    ${qtdContasDebito}

Pegar Valor Tela Debito
    ${valorDebito}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//b
    Set Suite Variable    ${valorDebito}

Pegar Contrato Tela Segunda Via
    ${contratoSegundaVia}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//b
    Set Suite Variable    ${contratoSegundaVia}

Pegar Telefone Tela Segunda Via
    ${telefoneSegundaVia}    Get Text    xpath=//span[contains(text(),"Telefone")]/..//b
    Set Suite Variable    ${telefoneSegundaVia}

Pegar Qtd De Contas Tela Segunda Via
    ${qtdContasSegundaVia}    Get Text    xpath=//span[contains(text(),"Quantidade de conta(s)")]/..//b
    Set Suite Variable    ${qtdContasSegundaVia}

Pegar Valor Tela Segunda Via
    ${valorSegundaVia}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//b
    Set Suite Variable    ${valorSegundaVia}

Pegar Contrato Tela Cod Barras
    ${contratoCodBar}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//b
    Set Suite Variable    ${contratoCodBar}

Pegar Telefone Tela Cod Barras
    ${telefoneCodBar}    Get Text    xpath=//span[contains(text(),"Telefone")]/..//b
    Set Suite Variable    ${telefoneCodBar}

Pegar Qtd De Contas Tela Cod Barras
    ${qtdContasCodBar}    Get Text    xpath=//span[contains(text(),"Quantidade de conta(s)")]/..//b
    Set Suite Variable    ${qtdContasCodBar}

Pegar Valor Tela Cod Barras
    ${valorCodBar}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//b
    Set Suite Variable    ${valorCodBar}

Pegar Contrato Tela Gpay
    ${contratoGpay}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//strong
    Set Suite Variable    ${contratoGpay}

Pegar Valor Tela Gpay
    ${valorGpay}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//strong
    Set Suite Variable    ${valorGpay}

Pegar Mes Referencia Tela Gpay
    ${mesReferenciaGpay}    Get Text    xpath=//span[contains(text(),"Mês de referência")]/..//strong
    Set Suite Variable    ${mesReferenciaGpay}

Pegar Vencimento Tela Gpay
    ${vencimentoGpay}    Get Text    xpath=//span[contains(text(),"Vencimento")]/..//strong
    Set Suite Variable    ${vencimentoGpay}

Pegar Contrato Tela Pix
    ${contratoPix}    Get Text    xpath=//span[contains(text(),"Contrato")]/..//b
    Set Suite Variable    ${contratoPix}

Pegar Telefone Tela Pix
    ${telefonePix}    Get Text    xpath=//span[contains(text(),"Telefone")]/..//b
    Set Suite Variable    ${telefonePix}

Pegar Qtd De Contas Tela Pix
    ${qtdContasPix}    Get Text    xpath=//span[contains(text(),"Quantidade de conta(s)")]/..//b
    Set Suite Variable    ${qtdContasPix}

Pegar Valor Tela Pix
    ${valorPix}    Get Text    xpath=//span[contains(text(),"Valor total")]/..//b
    Set Suite Variable    ${valorPix}

Pegar Dados Do Acesso
    Pegar Nome
    Pegar Protocolo
    Take Screenshot

Pegar Dados Do Contrato
    ${texto_do_contrato}    Get Text    xpath=//a[contains(@href,'contas')]/../..
    ${tem_desconto}    Run Keyword And Return Status    Should Contain    ${texto_do_contrato}    desconto
    Set Suite Variable    ${tem_desconto}

    IF    ${tem_desconto} == True
        Set Suite Variable    ${tipo_de_contrato}    Contrato com campanha
        Click    xpath=//button/span[text()="Detalhes"]
        Pegar Telefone
        Pegar Contrato
        Pegar Valor Sem Desconto
        Pegar Valor Com Desconto
    ELSE IF    ${tem_desconto} == False
        Set Suite Variable    ${tipo_de_contrato}    Contrato sem campanha
        Pegar Telefone
        Pegar Contrato
        Pegar Quantidade De Contas
        Pegar Valor Em Aberto
    END

    Take Screenshot

Pegar Dados Da Fatura
    Pegar Mes Referencia
    Pegar Status Da Conta
    Pegar Vencimento Da Conta
    Pegar Valor Da Conta

Validar Dados Na Tela de Segunda Via
    Pegar Contrato Tela Segunda Via
    Pegar Qtd De Contas Tela Segunda Via
    Pegar Valor Tela Segunda Via

    IF    ${tem_desconto} == False
        Should Contain    ${valorSegundaVia}    ${valorDaConta}
        Should Contain    ${qtdContasSegundaVia}    ${quantidadeDeContas}
        Should Contain    ${contratoSegundaVia}    ${numeroDoContrato}
    ELSE IF    ${tem_desconto} == True
        Should Contain    ${valorSegundaVia}    ${valorComDesconto}
        Should Contain    ${contratoSegundaVia}    ${numeroDoContrato}
    END

    IF    ${tem_telefone} == True
        Pegar Telefone Tela Segunda Via
        Should Contain    ${telefoneSegundaVia}    ${telefoneDoCliente}
    END

    Take Screenshot

Validar Dados Na Tela de Cod Barras
    Pegar Contrato Tela Cod Barras
    Pegar Qtd De Contas Tela Cod Barras
    Pegar Valor Tela Cod Barras

    IF    ${tem_desconto} == False
        Should Contain    ${valorCodBar}    ${valorDaConta}
        Should Contain    ${qtdContasCodBar}    ${quantidadeDeContas}
        Should Contain    ${contratoCodBar}    ${numeroDoContrato}
    ELSE IF    ${tem_desconto} == True
        Should Contain    ${valorCodBar}    ${valorComDesconto}
        Should Contain    ${contratoCodBar}    ${numeroDoContrato}
    END

    IF    ${tem_telefone} == True
        Pegar Telefone Tela Cod Barras
        Should Contain    ${telefoneCodBar}    ${telefoneDoCliente}
    END

    Take Screenshot

Validar Dados Na Tela de Cartao de Credito
    Pegar Contrato Tela Credito
    Pegar Qtd De Contas Tela Credito
    Pegar Valor Tela Credito

    IF    ${tem_desconto} == False
        Should Contain    ${valorCredito}    ${valorDaConta}
        Should Contain    ${qtdContasCredito}    ${quantidadeDeContas}
        Should Contain    ${contratoCredito}    ${numeroDoContrato}
    ELSE IF    ${tem_desconto} == True
        Should Contain    ${valorCredito}    ${valorComDesconto}
        Should Contain    ${contratoCredito}    ${numeroDoContrato}
    END

    IF    ${tem_telefone} == True
        Pegar Telefone Tela Credito
        Should Contain    ${telefoneCredito}    ${telefoneDoCliente}
    END

    Take Screenshot
    Botao Inicio

Validar Dados Na Tela de Debito Caixa
    Pegar Contrato Tela Debito
    Pegar Qtd De Contas Tela Debito
    Pegar Valor Tela Debito

    IF    ${tem_desconto} == False
        Should Contain    ${valorDebito}    ${valorDaConta}
        Should Contain    ${qtdContasDebito}    ${quantidadeDeContas}
        Should Contain    ${contratoDebito}    ${numeroDoContrato}
    ELSE IF    ${tem_desconto} == True
        Should Contain    ${valorDebito}    ${valorComDesconto}
        Should Contain    ${contratoDebito}    ${numeroDoContrato}
    END

    IF    ${tem_telefone} == True
        Pegar Telefone Tela Debito
        Should Contain    ${telefoneDebito}    ${telefoneDoCliente}
    END

    Take Screenshot
    Botao Inicio

Validar Dados Na Tela de Gpay
    Pegar Valor Tela Gpay
    Pegar Mes Referencia Tela Gpay
    Pegar Contrato Tela Gpay
    Pegar Vencimento Tela Gpay

    # Should Contain                    ${valorGPay}        ${valorDaConta}
    # Should Contain                    ${mesReferenciaGPay}).toEqual(mesReferencia)
    # Should Contain                    ${contratoGPay}     ${numeroDoContrato}
    # Should Contain                    ${vencimentoGPay}).toEqual(vencimento)
    
    Take Screenshot
    Botao Inicio

Validar Dados Na Tela de Pix
    Pegar Contrato Tela Pix
    Pegar Qtd De Contas Tela Pix
    Pegar Valor Tela Pix

    IF    ${tem_desconto} == False
        Should Contain    ${valorPix}    ${valorDaConta}
        Should Contain    ${qtdContasPix}    ${quantidadeDeContas}
        Should Contain    ${contratoPix}    ${numeroDoContrato}
    ELSE IF    ${tem_desconto} == True
        # Should Contain    ${valorPix}    ${valorComDesconto}
        Should Contain    ${contratoPix}    ${numeroDoContrato}
    END

    IF    ${tem_telefone} == True
        Pegar Telefone Tela Pix
        Should Contain    ${telefonePix}    ${telefoneDoCliente}
    END

    Take Screenshot

Copiar Codigo de Barras
    Click    xpath=//button[text()="Copiar"]
    Wait For Elements State    xpath=//li[@role="status"]//p
    ${alerta}    Get Text    xpath=//li[@role="status"]//p
    Should Contain    ${alerta}    Código de barras copiado
    Take Screenshot    Alerta cod barras copiado

Copiar Pix
    Click    xpath=//button[text()="Copiar"]
    Wait For Elements State    xpath=//li[@role="status"]//p
    ${alerta}    Get Text    xpath=//li[@role="status"]//p
    Should Contain    ${alerta}    PIX copiado
    Take Screenshot    Alerta Pix copiado

Responder NPS
    Click           xpath=//form//button[text()="9"]
    Click           xpath=//form//button/span[text()="Continuar"]
    Click           xpath=//span[text()="Navegação do site"]/..//div
    Click           xpath=//p[text()="O que você mais gostou?"]/..//button/span[text()="Continuar"]
    Click           xpath=//span[text()="Envio do token"]/..//div
    Click           xpath=//p[text()="O que você mais gostou na navegação do site?"]/..//button/span[text()="Continuar"]
    Wait For Elements State    xpath=//div//p[text()="Feedback concluído"]    visible    10
    Take Screenshot
    Botao Inicio
    
Validar Funcionalidades da Tela Pix
    Validar Dados Na Tela de Pix
    Pegar Pix Copia e Cola
    Validar Codigo Pix
    Solicitar SMS
    Validar Notificacao de Envio do Pix por SMS
    Solicitar Email
    Validar Notificacao de Envio do Pix por Email

Validar Funcionalidades da Tela de Segunda Via
    Validar Dados Na Tela de Segunda Via
    Solicitar SMS
    Validar Notificacao de Envio do Boleto por SMS
    Solicitar Email
    Validar Notificacao de Envio do Boleto por Email
    Baixar Boleto
    Botao Inicio

Validar Funcionalidades da Tela de Codigo de Barras
    Validar Dados Na Tela de Cod Barras
    Pegar Codigo De Barras
    Copiar Codigo de Barras
    Solicitar SMS
    Validar Notificacao de Envio do Boleto por SMS
    Solicitar Email
    Validar Notificacao de Envio do Boleto por Email
    # Validar Opcao Pagar Com App Do Meu Banco
    Botao Inicio



Criar Report PF
    [Arguments]    ${client}
    IF    ${tem_desconto} == True
        @{pp_data}    Create List    PORTAL TIM NEGOCIA
        ...    Cliente
        ...    Nome do cliente: ${nome}
        ...    Telefone do cliente: ${telefoneDoCliente}
        ...    Contrato
        ...    Tipo de contrato: ${tipo_de_contrato}
        ...    Número do contrato: ${numeroDoContrato}
        ...    Número do protocolo: ${protocolo}
        ...    Valor sem desconto: ${valorSemDesconto}
        ...    Valor com desconto: ${valorComDesconto}
        ...    Fatura
        ...    Mês referência: ${mesReferencia}
        ...    Status: ${statusDaConta}
        ...    Vencimento: ${vencimentoDaConta}
        ...    Código de barras: ${codBar}
        ...    Valor a pagar: ${valorComDesconto}
    ELSE IF    ${tem_desconto} == False
        @{pp_data}    Create List    PORTAL TIM NEGOCIA
        ...    Cliente
        ...    Nome do cliente: ${nome}
        ...    Telefone do cliente: ${telefoneDoCliente}
        ...    Contrato
        ...    Tipo de contrato: ${tipo_de_contrato}
        ...    Número do contrato: ${numeroDoContrato}
        ...    Número do protocolo: ${protocolo}
        ...    Fatura
        ...    Mês referência: ${mesReferencia}
        ...    Status: ${statusDaConta}
        ...    Vencimento: ${vencimentoDaConta}
        ...    Código de barras: ${codBar}
        ...    Valor da conta: ${valorDaConta}
    END

    Log Many    @{pp_data}

Criar Report PJ
    [Arguments]    ${client}
    IF    ${tem_desconto} == True
        @{pp_data}    Create List    PORTAL TIM NEGOCIA
        ...    Cliente
        ...    Nome do cliente: ${nome}
        ...    Telefone do cliente: ${telefoneDoCliente}
        ...    Contrato
        ...    Tipo de contrato: ${tipo_de_contrato}
        ...    Número do contrato: ${numeroDoContrato}
        ...    Número do protocolo: ${protocolo}
        ...    Valor sem desconto: ${valorSemDesconto}
        ...    Valor com desconto: ${valorComDesconto}
        ...    Fatura
        ...    Mês referência: ${mesReferencia}
        ...    Status: ${statusDaConta}
        ...    Vencimento: ${vencimentoDaConta}
        ...    Código de barras: ${codBar}
    ELSE IF    ${tem_desconto} == False
        @{pp_data}    Create List    PORTAL TIM NEGOCIA
        ...    Cliente
        ...    Nome do cliente: ${nome}
        ...    Telefone do cliente: ${telefoneDoCliente}
        ...    Contrato
        ...    Tipo de contrato: ${tipo_de_contrato}
        ...    Número do contrato: ${numeroDoContrato}
        ...    Número do protocolo: ${protocolo}
        ...    Fatura
        ...    Mês referência: ${mesReferencia}
        ...    Status: ${statusDaConta}
        ...    Vencimento: ${vencimentoDaConta}
        ...    Código de barras: ${codBar}
        ...    Valor da conta: ${valorDaConta}
    END

    Log Many    @{pp_data}
