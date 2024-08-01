import test, { Page, expect } from "@playwright/test";

export class GetData {
    readonly page: Page;

    constructor(page: Page) {
        this.page = page;
    }

    async pegarNome() {
        const saudacao = (await this.page.locator('//h2[contains(text(),"Olá")]').textContent())?.split(' ')
        const nome = saudacao?.[1]
        return nome
    }

    async pegarProtocolo() {
        const protocolo = await this.page.locator('//p[text()="Protocolo de atendimento:"]/..//p[2]').first().textContent()
        return protocolo
    }

    async pegarContrato() {
        const numeroDoContrato = await this.page.locator('//p[text()="Contrato:"]/..//p[2]').first().textContent()
        return numeroDoContrato
    }

    async pegarTelefone() {
        const telefoneDoCliente = await this.page.locator('//p[text()="Telefone:"]/..//p[2]').first().textContent()
        return telefoneDoCliente
    }

    async pegarQuantidadeDeContas() {
        const quantidadeDeContas = await this.page.locator('//p[text()="Conta(s)"]/..//p[2]').first().textContent()
        return quantidadeDeContas
    }

    async pegarValorEmAberto() {
        const valorEmAberto = await this.page.locator('//p[text()="Valor em aberto"]/..//p[2]').first().textContent()
        return valorEmAberto
    }

    async pegarMesReferencia() {
        const mesReferencia = await this.page.locator('//div[text()="Mês referência"]/..//div[2]').first().textContent()
        return mesReferencia
    }

    async pegarStatusDaConta() {
        const statusDaConta = await this.page.locator('//div[text()="Status"]/..//div[2]').first().textContent()
        return statusDaConta
    }

    async pegarVencimentoDaConta() {
        const vencimentoDaConta = await this.page.locator('//div[text()="Vencimento"]/..//div[2]').first().textContent()
        return vencimentoDaConta
    }

    async pegarValorDaConta() {
        const valorDaConta = await this.page.locator('//div[text()="Valor"]/..//div[2]').first().textContent()
        return valorDaConta
    }

    async pegarCodigoDeBarras() {
        const codBar = await this.page.locator('//h4[contains(text(),"Código de barras")]/..//p').textContent()
        return codBar
    }

    async pegarContratoTelaCredito() {
        const contratoCredito = await this.page.locator('//span[contains(text(),"Contrato")]/..//b').textContent()
        return contratoCredito
    }

    async pegarTelefoneTelaCredito() {
        const telefoneCredito = await this.page.locator('//span[contains(text(),"Telefone")]/..//b').textContent()
        return telefoneCredito
    }

    async pegarQtdDeContasTelaCredito() {
        const qtdContasCredito = await this.page.locator('//span[contains(text(),"Quantidade de conta(s)")]/..//b').textContent()
        return qtdContasCredito
    }

    async pegarValorTelaCredito() {
        const valorCredito = await this.page.locator('//span[contains(text(),"Valor total")]/..//b').textContent()
        return valorCredito
    }

    async pegarContratoTelaDebito() {
        const contratoDebito = await this.page.locator('//span[contains(text(),"Contrato")]/..//b').textContent()
        return contratoDebito
    }

    async pegarTelefoneTelaDebito() {
        const telefoneDebito = await this.page.locator('//span[contains(text(),"Telefone")]/..//b').textContent()
        return telefoneDebito
    }

    async pegarQtdDeContasTelaDebito() {
        const qtdContasDebito = await this.page.locator('//span[contains(text(),"Quantidade de conta(s)")]/..//b').textContent()
        return qtdContasDebito
    }

    async pegarValorTelaDebito() {
        const valorDebito = await this.page.locator('//span[contains(text(),"Valor total")]/..//b').textContent()
        return valorDebito
    }

    async pegarContratoTelasBoleto() {
        const contratoSegundaVia = await this.page.locator('//span[contains(text(),"Contrato")]/..//b').textContent()
        return contratoSegundaVia
    }

    async pegarTelefoneTelasBoleto() {
        const telefoneSegundaVia = await this.page.locator('//span[contains(text(),"Telefone")]/..//b').textContent()
        return telefoneSegundaVia
    }

    async pegarQtdDeContasTelasBoleto() {
        const qtdContasSegundaVia = await this.page.locator('//span[contains(text(),"Quantidade de conta(s)")]/..//b').textContent()
        return qtdContasSegundaVia
    }

    async pegarValorTelasBoleto() {
        const valorSegundaVia = await this.page.locator('//span[contains(text(),"Valor total")]/..//b').textContent()
        return valorSegundaVia
    }
}