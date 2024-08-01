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

// test('Cenário 01: CNPJ inválido', async ({ page }) => {
//     await login.irParaPortal()
//     await login.selecionarPj()
//     await login.preencherDadosPj('46.556.456/4123-21')
//     await login.esperarAlerta('CPF Inválido.')
// })

// test('Cenário 02: Campos não preenchidos', async ({ page }) => {
//     await login.irParaPortal()
//     await login.selecionarPj()
//     await login.verificarBotaoDesabilitado()
// })

// test('Cenário 03: Cliente sem faturas', async ({ page }) => {
//     await login.irParaPortal()
//     await login.selecionarPj()
//     await login.preencherDadosPj('50.848.265/0001-12')
//     await login.esperarModal()
// })

test('Cenário 05: Visualizar contratos', async ({ page, browser }) => {
    test.slow()
    await login.irParaPortal()
    await login.selecionarPj()
    await login.botaoAcessarPortal()
    await login.preencherDadosPj('02637512000199')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await login.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()
    await login.continuar()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.visualizarFatura()
})

test('Cenário 06: Acessar canais de atendimento', async ({ page }) => {
    await login.irParaPortal()
    await login.selecionarPj()
    await login.botaoAcessarPortal()
    await login.preencherDadosPj('02637512000199')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await login.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.irParaCanaisDeAtendimento()
})

test('Cenário 07: Acessar lista com todos os contratos', async ({ page }) => {
    test.slow()
    await login.irParaPortal()
    await login.selecionarPj()
    await login.botaoAcessarPortal()
    await login.preencherDadosPj('02637512000199')
    await login.continuar()
    const solicitacaoTelefone = page.locator('p[id="phone-helper"]')
    await expect(solicitacaoTelefone).toBeVisible({timeout: 25000})
    await token.preencherTelefone('41991599567')
    await login.continuar()
    const solicitacaoToken = page.locator('p[id="helper-pin"]')
    await expect(solicitacaoToken).toBeVisible({timeout: 25000})
    await token.fluxoToken()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')
    await debts.visualizarListaDeContratos()
})

test('Cenário 08: Opção de pagamento - Cartão de Crédito', async ({ page }) => {
    await login.irParaPortal()
    await login.selecionarPj()
    await login.botaoAcessarPortal()
    await login.preencherDadosPj('02637512000199')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await login.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()

    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')

})

test.only('Cenário 09: Pegar dados do cliente', async ({ page }) => {
    test.slow()
    await login.irParaPortal()
    await login.selecionarPj()
    await login.botaoAcessarPortal()
    await login.preencherDadosPj('02637512000199')
    await token.validarTexto('Insira seu telefone celular:')
    await token.preencherTelefone('41991599567')
    await login.continuar()
    await token.validarTexto('Insira o código de verificação')
    await token.fluxoToken()
    await debts.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')

})


