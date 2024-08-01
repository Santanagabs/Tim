import { expect, test } from '@playwright/test';
import { LoginPage } from '../pages/login'

let login: LoginPage

test.beforeEach(async ({ page })=> {
    login = new LoginPage(page)
})

test('Acessar o portal', async ({ page }) => {
    test.slow()
    await login.irParaPortal()
    await login.preencherDadosPf('00000529141','28/06/1984')
    await login.continuar()
    // await page.waitForTimeout(30000)
    await expect(page.getByText('Para sua segurança precisamos que insira um número de telefone celular para receber o código de acesso.').first()).toBeVisible({timeout:30000})
})