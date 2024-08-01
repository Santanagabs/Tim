import test, { Page, expect } from "@playwright/test"

export class LoginPage {
    readonly page: Page

    constructor(page: Page) {
        this.page = page
    }

    async irParaPortal() {
        await this.page.goto('https://homologtimnegocia.servicesdigital.com.br/')
        await expect(this.page).toHaveTitle('TIM Negocia')
    }

    async botaoAcessarPortal() {
        await this.page.click('//button//span[text()="Acessar portal"]')
    }

    async preencherDadosPf(cpf: string, dataNascimento: string) {
        await this.page.fill('input[name="cpf"]', cpf)
        await this.page.fill('input[name="birthday"]', dataNascimento)
    }

    async preencherDadosPj(cnpj: string) {
        await this.page.fill('input[name="cnpj"]', cnpj)
    }

    async continuar(){
        await this.page.click('button[type="submit"]')
    }

    async verificarBotaoDesabilitado(){
        const botaoLogin = this.page.locator('button[type="submit"]')
        expect(botaoLogin).toBeDisabled()
    }

    async esperarAlerta(alertText: string) {
        const span = this.page.locator('div[id="notification-wrapper"] span')
        expect(span).toBeVisible()
        const spanText = this.page.locator('div[id="notification-wrapper"] span')
        expect(spanText).toHaveText(alertText, {timeout: 25000})
    }

    async esperarModal() {
        const modalSemFatura = this.page.locator('div[class^=box-modal]')
        expect(modalSemFatura).toBeVisible({timeout: 25000})
    }

    async selecionarPj() {
        await this.page.click('button[id$="PJ"]')
    }

    async validarAlertaCpf(){
        const alertaCpf = this.page.locator('//input[@name="cpf"]/../..//p')
        expect(alertaCpf).toBeVisible()
        expect(alertaCpf).toHaveText('required')
    }

    async validarAlertaDataDeNascimento(){
        const alertaDataN = this.page.locator('//input[@name="birthday"]/../..//p')
        expect(alertaDataN).toBeVisible()
        expect(alertaDataN).toHaveText('required')
    }

    async validarVantagens() {
        const vantagem1 = await this.page.locator('//section[@id="advantages"]//li[1]//span').textContent()
        const vantagem2 = await this.page.locator('//section[@id="advantages"]//li[2]//span').textContent()
        const vantagem3 = await this.page.locator('//section[@id="advantages"]//li[3]//span').textContent()
        const vantagem4 = await this.page.locator('//section[@id="advantages"]//li[4]//span').textContent()
        const vantagem5 = await this.page.locator('//section[@id="advantages"]//li[5]//span').textContent()
        const vantagem6 = await this.page.locator('//section[@id="advantages"]//li[6]//span').textContent()
        const vantagem7 = await this.page.locator('//section[@id="advantages"]//li[7]//span').textContent()
        const vantagem8 = await this.page.locator('//section[@id="advantages"]//li[8]//span').textContent()
        expect(vantagem1).toContain('Pagamento com Cartão de Crédito')
        expect(vantagem2).toContain('Pagamento com o C6BANK')
        expect(vantagem3).toContain('Agilidade e Segurança')
        expect(vantagem4).toContain('Pagamento via Pix')
        expect(vantagem5).toContain('Pagamento com Débito Virtual Caixa')
        expect(vantagem6).toContain('Envio de código de barras (SMS/E-mail)')
        expect(vantagem7).toContain('Negociação rápida e fácil')
        expect(vantagem8).toContain('Negociação a qualquer hora')
    }

    async validarPassoAPasso() {
        const passo1 = await this.page.locator('//section[@id="tutorial"]//li[1]//h6').textContent()
        const passo2 = await this.page.locator('//section[@id="tutorial"]//li[2]//h6').textContent()
        const passo3 = await this.page.locator('//section[@id="tutorial"]//li[3]//h6').textContent()
        const passo4 = await this.page.locator('//section[@id="tutorial"]//li[4]//h6').textContent()
        const passo5 = await this.page.locator('//section[@id="tutorial"]//li[5]//h6').textContent()
        expect(passo1).toContain('Insira seus dados')
        expect(passo2).toContain('Insira o código de verificação')
        expect(passo3).toContain('Selecione o contrato e a conta que deseja pagar')
        expect(passo4).toContain('Formas de pagamento')
        expect(passo5).toContain('Prontinho')
    }

    async validarTelefonesParaContato() {
        const numeroNegociacaoDeDebitos = await this.page.locator('//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="Negociação de débitos"]/..//p[2]').textContent()
        const numeroTimUltrafibra = await this.page.locator('//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="TIM Ultrafibra"]/..//p[2]').textContent()
        const numeroTimPosContreEEmpresa = await this.page.locator('//h6[text()="Entre em contato conosco através dos canais:"]/..//p[text()="TIM Pós, TIM Controle e TIM Empresa"]/..//p[2]').textContent()
        expect(numeroTimPosContreEEmpresa).toContain('*144 ou 1056')
        expect(numeroTimUltrafibra).toContain('103 41')
        expect(numeroNegociacaoDeDebitos).toContain('0800 888 2373')
    }
}