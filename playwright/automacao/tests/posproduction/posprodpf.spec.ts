import { expect, test } from '@playwright/test'
import { LoginPage } from '../../pages/login'
import { TokenPage } from '../../pages/token'
import { DebtsPage } from '../../pages/debts'
import { GetData } from '../../pages/data'
import { Components } from '../../pages/components'

let login: LoginPage
let token: TokenPage
let debts: DebtsPage
let data: GetData
let component: Components

test.beforeEach(async ({ page })=> {
    login = new LoginPage(page)
    token = new TokenPage(page)
    debts = new DebtsPage(page)
    data = new GetData(page)
    component = new Components(page)
})

test('Validação Pós Produção',async ({ page }) => {
    test.setTimeout(300000)
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    
    await component.validarCopyright()
    await component.validarPoliticaDePrivacidade()
    
    await login.validarVantagens()
    await login.validarPassoAPasso()
    await login.validarTelefonesParaContato()

    await login.preencherDadosPf('10966938445','01/01/2001')
    await login.continuar()

    await component.validarCopyright()
    await token.preencherTelefone('41991279805')
    await token.continuar()
    await component.validarCopyright()
    // await page.waitForTimeout(10000)
    await token.fluxoToken()

    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await component.validarCopyright()

    const nome = await data.pegarNome()
    const telefone = await data.pegarTelefone()
    const contrato = await data.pegarContrato()
    const protocolo = await data.pegarProtocolo()
    const quantidadeDeContas = await data.pegarQuantidadeDeContas()
    const valorEmAberto = await data.pegarValorEmAberto()

    await debts.botaoVerContas()
    await component.validarCopyright()

    const mesReferencia = await data.pegarMesReferencia()
    const status = await data.pegarStatusDaConta()
    const vencimento = await data.pegarVencimentoDaConta()
    const valorDaConta = await data.pegarValorDaConta()

    await debts.botaoPagarConta()
    await debts.selecionarOpcaoSegundaVia()
    await component.validarCopyright()

    const contratoSegundaVia = await data.pegarContratoTelasBoleto()
    const telefoneSegundaVia = await data.pegarTelefoneTelasBoleto()
    const qtdContasSegundaVia = await data.pegarQtdDeContasTelasBoleto()
    const valorSegundaVia = await data.pegarValorTelasBoleto()

    expect(valorSegundaVia).toEqual(valorEmAberto)
    expect(qtdContasSegundaVia).toEqual(quantidadeDeContas)
    expect(contratoSegundaVia).toEqual(contrato)
    expect(telefoneSegundaVia).toEqual(telefone)
    
    await debts.solicitarEmail()
    await debts.solicitarSMS()
    await debts.baixarBoleto()

    await component.botaoInicio()
    
    await debts.botaoVerContas()
    await debts.botaoPagarConta()

    await debts.selecionarOpcaoCodigoDeBarras()
    await component.validarCopyright()
    
    const contratoCodBar = await data.pegarContratoTelasBoleto()
    const telefoneCodBar = await data.pegarTelefoneTelasBoleto()
    const qtdContasCodBar = await data.pegarQtdDeContasTelasBoleto()
    const valorCodBar = await data.pegarValorTelasBoleto()

    expect(valorCodBar).toEqual(valorEmAberto)
    expect(qtdContasCodBar).toEqual(quantidadeDeContas)
    expect(contratoCodBar).toEqual(contrato)
    expect(telefoneCodBar).toEqual(telefone)

    const codBar = await data.pegarCodigoDeBarras()

    await page.click('//button[text()="Copiar"]')

    await debts.solicitarEmail()
    // await debts.validarOpcaoPagarComAppDoMeuBanco()

    await component.botaoInicio()

    await debts.botaoVerContas()
    await debts.botaoPagarConta()

    await debts.selecionarOpcaoCartaoDeCredito()
    await component.validarCopyright()

    const contratoCredito = await data.pegarContratoTelaCredito()
    const telefoneCredito = await data.pegarTelefoneTelaCredito()
    const qtdContasCredito = await data.pegarQtdDeContasTelaCredito()
    const valorCredito = await data.pegarValorTelaCredito()

    expect(valorCredito).toEqual(valorEmAberto)
    expect(qtdContasCredito).toEqual(quantidadeDeContas)
    expect(contratoCredito).toEqual(contrato)
    expect(telefoneCredito).toEqual(telefone)

    const iframeCredito = await page.frame({ url: "https://web-timnegocia.stg.m4u.com.br/digiframe/credit"})
    await page.waitForTimeout(8000)
    await iframeCredito?.waitForLoadState('networkidle')
    await page.screenshot({ path: './evidencias/iframe-credito.png', fullPage: true })

    // await component.botaoInicio()
    await page.waitForTimeout(8000)

    await debts.botaoVerContas()
    await debts.botaoPagarConta()

    await debts.selecionarOpcaoDebitoCaixa()
    await component.validarCopyright()

    const contratoDebito = await data.pegarContratoTelaDebito()
    const telefoneDebito = await data.pegarTelefoneTelaDebito()
    const qtdContasDebito = await data.pegarQtdDeContasTelaDebito()
    const valorDebito = await data.pegarValorTelaDebito()

    expect(valorDebito).toEqual(valorEmAberto)
    expect(qtdContasDebito).toEqual(quantidadeDeContas)
    expect(contratoDebito).toEqual(contrato)
    expect(telefoneDebito).toEqual(telefone)

    const iframeDebito = await page.frame({ url: "https://web-timnegocia.stg.m4u.com.br/digiframe/debit"})
    await page.waitForTimeout(8000)
    await iframeDebito?.waitForLoadState('networkidle')
    await page.screenshot({ path: './evidencias/iframe-debito.png', fullPage: true })

    // await component.botaoInicio()
    
    await debts.botaoVerContas()
    await debts.botaoPagarConta()

    await debts.selecionarOpcaoGPay()
    await component.validarCopyright()

    const contratoGPay = await page.locator('//span[contains(text(),"Contrato")]/..//strong').textContent()
    const vencimentoGPay = await page.locator('//span[contains(text(),"Vencimento")]/..//strong').textContent()
    const mesReferenciaGPay = await page.locator('//span[contains(text(),"Mês de referência")]/..//strong').textContent()
    const valorGPay = await page.locator('//span[contains(text(),"Valor total")]/..//strong').textContent()

    expect(valorGPay).toEqual(valorDaConta)
    // expect(mesReferenciaGPay).toEqual(mesReferencia)
    expect(contratoGPay).toEqual(contrato)
    // expect(vencimentoGPay).toEqual(vencimento)

    console.log('Cliente')
    console.log('Nome do cliente:', nome)
    console.log('Telefone do cliente', telefone)
    console.log('Contrato')
    console.log('Número do contrato:', contrato)
    console.log('Número do protocolo:', protocolo)
    console.log('Quantidade de contas:', quantidadeDeContas)
    console.log('Valor em aberto:', valorEmAberto)
    console.log('Fatura')
    console.log('Mês referência:', mesReferencia)
    console.log('Status:', status)
    console.log('Vencimento:', vencimento)
    console.log('Código de barras:', codBar)
    console.log('Valor da conta:', valorDaConta)
})