## Este projeto tem como objetivo automatizar o envio dos logs, em um grupo de WhatsApp, após a execução dos testes Pós Produção realizados nos portais


### Clonando o repositório

    git clone https://github.com/Ankit404butfound/PyWhatKit.git

### Instalação PyWhatKit

<a href="https://pypi.org/project/pywhatkit/">Pywhatkit Documentation</a>

#### execute o comando abaixo no terminal:

    python3 -m pip install pywhatkit

#### caso não funcione, tente este outro comando: 
    
    pip3 install pywhatkit

### Instalação CopyQ - serviço para manipular a área de tranferência

<a href="https://copyq.readthedocs.io/en/latest/installation.html">CopyQ Documentation</a>

    sudo apt install copyq


### Importando a Library no código da automação
    
    *** Settings ***

    Library             ../libs/sendlogs.py

### Exemplo de uso

    Enviar log no whats

        New Browser         chromium    false
        New Page            file:///caminho-do-log
        
        Click               xpath=//div[@id="s1-t1"]
        Click               xpath=//div[@id="s1-t1-k26"]
        Take Screenshot     Log       selector=xpath=//div[@id="s1-t1-k26"]

        Send Logs           caminho-da-imagem.png
