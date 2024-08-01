import { expect, test } from '@playwright/test';
import { LoginPage } from '../pages/login';
import { TokenPage } from '../pages/token';

let login: LoginPage;
let token: TokenPage;

test.beforeEach(async ({ page })=> {
    login = new LoginPage(page)
    token = new TokenPage(page)
})

test('Cenário 01: Telefone obrigatório', async ({ page, browser }) => {
    test.slow();
    await login.irParaPortal();
    await login.preencherDadosPf('688.779.600-78', '01/01/2001');
    await token.validarTexto('Insira seu telefone celular:');
    await token.preencherTelefone('');
    await login.verificarBotaoDesabilitado();

});

test('Cenário 02: Token obrigatório', async ({ page, browser }) => {
    test.slow();
    await login.irParaPortal();
    await login.preencherDadosPf('688.779.600-78', '01/01/2001');
    await token.validarTexto('Insira seu telefone celular:');
    await token.preencherTelefone('41995964188');
    await login.continuar();
    await token.validarTexto('Insira o código de verificação');
    await page.click('input[name="input1"]');
    await page.keyboard.type('');
    await login.verificarBotaoDesabilitado();

});

test('Cenário 03: Token inválido', async ({ page, browser }) => {
    test.slow();
    await login.irParaPortal();
    await login.preencherDadosPf('688.779.600-78', '01/01/2001');
    await token.validarTexto('Insira seu telefone celular:');
    await token.preencherTelefone('41995964188');
    await login.continuar();
    await token.validarTexto('Insira o código de verificação');
    await page.keyboard.type('123456');
    await login.continuar()
    await login.esperarAlerta('O Código informado não é válido, por favor digite novamente.')

});

test('Cenário 04: Reenvio de token', async ({ page, browser }) => {
    test.slow();
    await login.irParaPortal();
    await login.preencherDadosPf('688.779.600-78', '01/01/2001');
    await token.validarTexto('Insira seu telefone celular:');
    await token.preencherTelefone('41995964188');
    await login.continuar();
    await token.validarTexto('Insira o código de verificação');
    await page.click('button[class="bt-send-code"]')
    await token.validarTexto('Insira seu telefone celular:');

});