* Settings *
Documentation                       Ações de navegação dentro do sistema

Resource                            ../base.robot

* Keywords *
Go To Portal
    Go To                           https://timnegocia.com.br/
    Take Screenshot
    Wait Until Network Is Idle
    ${title}                        Get Title
    Should Be Equal    ${title}     TIM Negocia

Go To Portal Hml
    Go To                           https://hml.chronicles-tim.engenhariapoc-wh.com/
    Wait Until Network Is Idle
    ${title}                        Get Title
    Should Be Equal    ${title}     TIM Negocia
    # Botao Acessar Portal

Go To Attendance Channels 
    Click                           xpath=//header/div//a[@class="bt-option-menu"][@href="/attendance"]
    Validar Texto da Pagina         Entre em contato conosco através dos canais:
