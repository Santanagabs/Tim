import { expect, test } from '@playwright/test'
import { LoginPage } from '../pages/login'
import { TokenPage } from '../pages/token'
import { DebtsPage } from '../pages/debts'

let login: LoginPage
let token: TokenPage
let debts: DebtsPage

test.beforeEach(async ({ page })=> {
    login = new LoginPage(page)
    token = new TokenPage(page)
    debts = new DebtsPage(page)
})

// test('Cenário 01: CPF inválido', async ({ page }) => {
//     await login.irParaPortal()
//     await login.botaoAcessarPortal()
//     await login.preencherDadosPf('546.879.231-76', '21/09/1983')
//     await login.esperarAlerta('CPF Inválido.')
// })

// test('Cenário 02: Data de nascimento Inválida', async ({ page }) => {
//     await login.irParaPortal()
//     await login.botaoAcessarPortal()
//     await login.preencherDadosPf('744.725.740-04', '21/16/1971')
//     await login.esperarAlerta('Data de nascimento inválida.')
// })

test('Cenário 03: Campos não preenchidos', async ({ page }) => {
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    await login.continuar()
    await login.validarAlertaCpf()
    await login.validarAlertaDataDeNascimento()
})

test('Cenário 04: Cliente sem faturas', async ({ page }) => {
    await login.irParaPortal()
    await login.botaoAcessarPortal()   
    await login.preencherDadosPf('372.654.540-90', '12/08/1992')
    await login.esperarModal()
})

test('Cenário 05: Visualizar contratos', async ({ page, browser }) => {
    test.slow()
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    await login.preencherDadosPf('10966938445', '01/01/2001')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await token.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()
    await token.continuar()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.visualizarFatura()
})

test('Cenário 06: Acessar canais de atendimento', async ({ page }) => {
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    await login.preencherDadosPf('10966938445', '01/01/2001')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await token.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.irParaCanaisDeAtendimento()
})

test.only('Cenário 07: Acessar lista com todos os contratos', async ({ page }) => {
    test.slow()
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    await login.preencherDadosPf('10966938445', '01/01/2001')
    await login.continuar()
    const solicitacaoTelefone = page.locator('p[id="phone-helper"]')
    await expect(solicitacaoTelefone).toBeVisible({timeout: 25000})
    await token.preencherTelefone('41991599567')
    await token.continuar()
    const solicitacaoToken = page.locator('p[id="helper-pin"]')
    await expect(solicitacaoToken).toBeVisible({timeout: 25000})
    await token.fluxoToken()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.visualizarListaDeContratos()
})

test('Cenário 08: Opção de pagamento - Cartão de Crédito', async ({ page }) => {
    await login.irParaPortal()
    await login.botaoAcessarPortal()
    await login.preencherDadosPf('10966938445', '01/01/2001')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await login.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()

    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')


})

// test.only('admin and user', async ({ browser }) => {
//   // Create two isolated browser contexts
//   const hermes = await browser.newContext()
//   const userContext = await browser.newContext()
  
//   // Create pages and interact with contexts independently
//   const adminPage = await adminContext.newPage()
//   const userPage = await userContext.newPage()

//   await adminPage.waitForTimeout(10000)
//   await userPage.waitForTimeout(10000)

// })