import test, { Page, expect } from "@playwright/test";

export class DebtsPage {
    readonly page: Page;

    constructor(page: Page) {
        this.page = page;
    }

    async validarTextoDaPagina(texto: string) {
        const pageText = this.page.locator('//div[contains(@class,"container")]//h3');
        await expect(pageText).toHaveText(texto);
    }

    async irParaCanaisDeAtendimento() {
        await this.page.click('footer a[href$="atendimento"]');
        await this.validarTextoDaPagina('Entre em contato conosco através dos canais:');
    }

    async visualizarListaDeContratos() {
        await this.page.click('a[class="bt-view-more"]');
        await this.validarTextoDaPagina('Selecione um dos contratos abaixo para prosseguir com o atendimento:')
    }

    async solicitarEmail() {
        await this.page.click('//button/span[text()="Receber via E-mail"]')
        const modalEmail = this.page.locator('//div[@role="dialog"]//h2[text()="Receber via e-mail"]')
        await expect(modalEmail).toBeVisible()
        await this.page.fill('input[id="email"]', 'arionjuninho2002@gmail.com')
        await this.page.click('button[form="send-invoice-form"]')
        const modalSucessoEnvioEmail = this.page.locator('//div[@role="dialog"]//h2[text()="Boleto enviado com sucesso!"]')
        await expect(modalSucessoEnvioEmail).toBeVisible({ timeout: 10000 })
        await this.page.screenshot({ path: './evidencias/sucesso-email-segunda-via.png' })
        await this.page.click('//div[@role="dialog"]//button[text()="Fechar"]')
    }

    async solicitarSMS() {
        await this.page.click('//button/span[text()="Receber via SMS"]')
        const modalSms = this.page.locator('//div[@role="dialog"]//h2[text()="Receber via SMS"]')
        await expect(modalSms).toBeVisible()
        await this.page.fill('input[id="phone"]', '41995964188')
        await this.page.click('button[form="send-invoice-form"]')
        const modalSucessoEnvioTelefone = this.page.locator('//div[@role="dialog"]//h2[text()="Código de barras enviado com sucesso!"]')
        await expect(modalSucessoEnvioTelefone).toBeVisible()
        await this.page.screenshot({ path: './evidencias/sucesso-sms-segunda-via.png' })
        await this.page.click('//div[@role="dialog"]//button[text()="Fechar"]')
    }

    async baixarBoleto() {
        const aguardarDownload = this.page.waitForEvent('download')
        await this.page.click('//a/span[text()="Baixar boleto"]')
        const boleto = await aguardarDownload
        await boleto.saveAs('./evidencias/boleto.pdf')
    }
    
    async validarOpcaoPagarComAppDoMeuBanco() {
        await this.page.click('//button/span[text()="Pagar com app do meu banco"]')
        await this.page.locator('//div[@role="dialog"]//h2[text()="Pague com o App do seu banco"]').isVisible()
        for (let i = 1; i < 13; i++) {
            const banco = await this.page.locator(`//div[@role="dialog"]//a[${i}]`).textContent()
            await this.page.click(`//div[@role="dialog"]//span[text()="${banco}"]`)
            const siteDoBanco = await this.page.waitForEvent('popup')
            // await siteDoBanco.bringToFront()
            await siteDoBanco.waitForLoadState('networkidle')
            await siteDoBanco.screenshot({ path: `./evidencias/bancos/site-${banco}.png` })
            await siteDoBanco.close()
        }
        await this.page.click('//div[@role="dialog"]//button')
    }

    async selecionarOpcaoSegundaVia() {
        await this.page.click('//div[@role="dialog"]//a[contains(@href,"boleto")]')
        await this.validarTextoDaPagina('Como gostaria de receber a 2ª via do seu boleto?')
        await this.page.screenshot({ path: './evidencias/segunda-via.png', fullPage: true })
    }

    async selecionarOpcaoCodigoDeBarras() {
        await this.page.click('//div[@role="dialog"]//a[contains(@href,"codigo-de-barras")]')
        const textoBoxCodBar = await this.page.locator('//h4[contains(text(),"Código de barras")]')
        await expect(textoBoxCodBar).toBeVisible()
        await this.page.screenshot({ path: './evidencias/codigo-de-barras.png', fullPage: true })
    }
    

    async selecionarOpcaoCartaoDeCredito() {
        await this.page.click('//div[@role="dialog"]//a[contains(@href,"cartao-de-credito")]')
        await this.validarTextoDaPagina('Insira os dados do seu Cartão de Crédito:')
    }

    async selecionarOpcaoDebitoCaixa() {
        await this.page.click('//div[@role="dialog"]//a[contains(@href,"cartao-de-debito")]')
        await this.validarTextoDaPagina('Insira os dados do seu Cartão de Débito:')
    }

    async selecionarOpcaoGPay() {
        await this.page.click('//div[@role="dialog"]//a[contains(@href,"google-pay")]')
        const textoModalDeDados = this.page.locator('//div[contains(@class,"container")]//h4[text()="Informações de conta"]')
        await expect(textoModalDeDados).toHaveText('Informações de conta')
        await this.page.waitForLoadState('networkidle')
        await this.page.screenshot({ path: './evidencias/gpay.png' })
        await this.page.waitForTimeout(6000)
    }

    async botaoVerContas() {
        await this.page.click('//a/span[text()="Ver contas"]')
        await this.validarTextoDaPagina('Escolha a(s) conta(s) que gostaria de realizar o pagamento:')

    }

    async botaoPagarConta() {
        await this.page.click('//button/span[text()="Pagar conta"]')
        await this.page.locator('//div[@role="dialog"]//span[text()="Como você deseja pagar?"]').isVisible()
    }
}
