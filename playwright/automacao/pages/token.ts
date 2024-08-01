import { Page, expect, Browser, chromium } from "@playwright/test"
import { LoginPage } from "./login"

export class TokenPage {
    
    readonly page: Page
    readonly browser: Browser
    readonly login: LoginPage

    constructor(page: Page) {
        this.page = page
    }

    async validarTexto(expectText: string) {
        const formText = this.page.locator('div[class="box-form"] h6')
        await expect(formText).toHaveText(expectText, {timeout: 60000})
    }

    async preencherTelefone(phone: string) {
        await this.page.fill('#phone', phone)
    }

    async continuar(){
        await this.page.click('button[type="submit"]')
    }

    async fluxoToken() {
        const browser = await chromium.launch()
        const hermes = await browser.newContext()
        const hermesPage = await hermes.newPage()
        await hermesPage.bringToFront()
        await hermesPage.goto('http://hermes-sms.services.local/')
        await hermesPage.fill('input[id="username"]','filho.arion')
        await hermesPage.fill('input[id="password"]','O2Negw5O3Q#MDagosto')
        await hermesPage.click('button[class="btn btn-login"]')
        const hermesHeader = hermesPage.locator('div[class="nav-wrapper"]')
        await expect(hermesHeader).toBeVisible()
        await hermesPage.click('a[href$="PesquisaSMS"]')
        await hermesPage.fill('input[id="DDD"]','41')
        await hermesPage.fill('input[id="Telefone"]','991279805')
        await hermesPage.click('a[class="waves-effect waves-light btn"]')
        await hermesPage.click('//html/body/div[1]/div/main/section/div/div/div[3]/div[1]/div[2]/div[1]/div/div[6]/a')
        await hermesPage.waitForLoadState('networkidle')
        const message = hermesPage.locator('input[value*="código de segurança"]')
        const messageText = await message.getAttribute('value')
        if (messageText !== null) {
            const splitedMessage = messageText.split(' ')
            const token = splitedMessage[2]
        await hermes.close()
        await this.page.click('input[id="pin-1"]')
        await this.page.keyboard.type(token)
        await this.page.click('//form[2]//button[@type="submit"]')
    }
}}
