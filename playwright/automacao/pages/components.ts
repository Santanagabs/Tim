import test, { Page, expect } from "@playwright/test";
import { DebtsPage } from "./debts";

export class Components {
    readonly page: Page;

    constructor(page: Page) {
        this.page = page;
    }

    async validarCopyright() {
        await this.page.waitForLoadState('networkidle')
        const textoCopyright = await this.page.locator('//p[contains(text(),"©")]').textContent()
        expect(textoCopyright).toContain('Webhelp')
        expect(textoCopyright).toContain('2023')
    } 

    async validarPoliticaDePrivacidade() {
        await this.page.click('//footer//a[text()="Política de privacidade"]')
        await this.page.waitForLoadState('load')
        await this.page.waitForTimeout(1000)
        const politicaDePrivacidade = await this.page.locator('main').textContent()
        expect(politicaDePrivacidade).toMatch('Política de Privacidade')
        expect(politicaDePrivacidade).toMatch('lgpd@gruposervices.com.br')
        await this.page.screenshot({ path: './evidencias/politica-de-privacidade.png', fullPage: true })
        await this.page.click('//button[text()="Política de Privacidade"]')
        await this.page.waitForLoadState('load')
    }

    async validarTextoDaPagina(texto: string) {
        const pageText = this.page.locator('//div[contains(@class,"container")]//h3');
        expect(pageText).toHaveText(texto);
    }

    async botaoInicio() {
        await this.page.click('//a[contains(@class,"gap-2 ")]//span[text()="Início"]')
        await this.validarTextoDaPagina('Selecione o contrato desejado para prosseguir com o atendimento:')  
    }
}