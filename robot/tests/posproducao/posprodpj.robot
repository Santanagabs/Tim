* Settings *
Documentation                         Automação para validação pós produção PJ

Resource                              ../../resources/base.robot
Suite Setup                           Abrir Navegador
Test Setup                            Go To Portal

* Test Cases *
Validação Pós Produção
    Client PJ
    Botao Acessar Portal
    Validar Copyright
    Validar Politica De Privacidade
    
    Validar Vantagens
    Validar Passo A Passo
    Validar Telefones Para Contato

    Preencher dados PJ                ${client}
    Clicar em Continuar

    Validar Copyright
    Preencher Telefone Para Recebimento do Token             ${client}[phone]
    Pegar e Confirmar Token

    Validar Pagina Inicial

    Pegar Dados Do Acesso
    Pegar Dados Do Contrato

    Selecionar Contrato
    Validar Copyright

    Pegar Mes Referencia
    Pegar Status Da Conta
    Pegar Vencimento Da Conta
    # Pegar Valor Da Conta

    Abrir Opções de Pagamento
    Selecionar Opcao de Pagamento Segunda Via
    Validar Copyright

    Validar Dados Na Tela de Segunda Via

    Solicitar Email
    Solicitar SMS
    Baixar Boleto

    Botao Inicio

    Selecionar Contrato
    Abrir Opções de Pagamento

    Selecionar Opcao de Pagamento Codigo De Barras
    Validar Copyright

    Validar Dados Na Tela de Cod Barras
    Pegar Codigo De Barras
    Copiar Codigo de Barras
    Solicitar Email
    # Validar Opcao Pagar Com App Do Meu Banco

    Botao Inicio

    Selecionar Contrato
    Abrir Opções de Pagamento

    Selecionar Opcao de Pagamento Cartao De Credito
    Validar Copyright

    Validar Dados Na Tela de Cartao de Credito

    # const iframeCredito = await page.frame({ url: "https://web-timnegocia.stg.m4u.com.br/digiframe/credit"})
    # await page.waitForTimeout(8000)
    # await iframeCredito?.waitForLoadState('networkidle')
    # await page.screenshot({ path: './evidencias/iframe-credito.png', fullPage: true })

    Botao Inicio
    
    Selecionar Contrato
    Abrir Opções de Pagamento

    Selecionar Opcao de Pagamento Debito Caixa
    Validar Copyright
    
    Validar Dados Na Tela de Debito Caixa

    # const iframeDebito = await page.frame({ url: "https://web-timnegocia.stg.m4u.com.br/digiframe/debit"})
    # await page.waitForTimeout(8000)
    # await iframeDebito?.waitForLoadState('networkidle')
    # await page.screenshot({ path: './evidencias/iframe-debito.png', fullPage: true })

    Botao Inicio

    Selecionar Contrato
    Abrir Opções de Pagamento

    Selecionar Opcao de Pagamento GPay
    Validar Copyright

    Pegar Valor Tela Gpay
    Pegar Mes Referencia Tela Gpay
    Pegar Contrato Tela Gpay
    Pegar Vencimento Tela Gpay

    # Should Contain                    ${valorGPay}        ${valorDaConta}
    # Should Contain                    ${mesReferenciaGPay}).toEqual(mesReferencia)
    # Should Contain                    ${contratoGPay}     ${numeroDoContrato}
    # Should Contain                    ${vencimentoGPay}).toEqual(vencimento)

    Criar Report PJ            ${client}



# Pegar Telefone
#     [Tags]        temp

#     Client PJ
#     Botao Acessar Portal

#     Preencher dados PJ                ${client}
#     Clicar em Continuar

#     Confirmar Phone Token             ${client}[phone]

#     Pegar Token Novo Hermes
#     Confirmar Token                   ${token}

#     Validar Texto da Pagina           Selecione o contrato desejado para prosseguir com o atendimento:

#     Pegar Dados Do Acesso
#     Pegar Dados Do Contrato
