import re
import pywhatkit as whats

    #path é o caminho da imagem
    #group é uma string contendo o id do grupo
    #message é uma string contendo a mensagem que será enviada
    #15 é um tempo que ele vai esperar
    #true é um parametro booleano indicando se após fazer o envio da mensagem ele deve fechar ou não a janela do whatsapp

group = 'Gc2XQ0JH7831b734KuMftA'  

# ICt5apyX75A8V8Tovq6xCG - grupo teste
# Gc2XQ0JH7831b734KuMftA - grupo de QA
# message = ''  , path4, path5

def send_logs(path, message ):
    whats.sendwhats_image(group, f'{path}', f"{message}", 15, False)
