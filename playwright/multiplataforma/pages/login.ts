import test, { Page, expect } from "@playwright/test"

export class LoginPage {
    readonly page: Page

    constructor(page: Page) {
        this.page = page
    }

    async irParaPortal() {
        await this.page.goto('https://hml.chronicles-tim.engenhariapoc-wh.com/')
        await expect(this.page).toHaveTitle('TIM Negocia')
    }

    async preencherDadosPf(cpf: string, dataNascimento: string) {
        await this.page.fill('input[name="cpf"]', cpf)
        await this.page.fill('input[name="birthday"]', dataNascimento)
    }

    async continuar(){
        await this.page.click('button[type="submit"]')
    }
}