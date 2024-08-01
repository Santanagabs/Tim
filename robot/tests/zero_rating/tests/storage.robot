* Settings *
Documentation           Teste referente à remoção de arquivos externos ao portal

Library                 Browser

* Test Cases *
Cenário 01: Arquivos google storage (prod)
    New Browser          chromium
    New Page             https://timnegocia.com.br/
    ${img}               Get Element Count               css=img[src*="storage"]
    ${analytics}         Get Element Count               css=script[src*="analytics"]
    ${hotjar}            Get Element Count               css=script[src*="hotjar"]

    Log                  ${img}   +   ${analytics}   +   ${hotjar}
# Cenário 02: Arquivos google storage (hml)
#     New Browser          chromium         
#     New Page             https://homologtimnegocia.servicesdigital.com.br/
#     ${img}               Get Element Count               css=img[src*="storage"]
#     Log                  ${img}

# Cenário 03: Arquivos google storage no código fonte (prod)
#     New Browser          chromium         
#     New Page             https://timnegocia.com.br/
#     ${source}            Get Page Source                 contains               storage

# Cenário 04: Arquivos google storage no código fonte (hml)
#     New Browser          chromium         
#     New Page             https://homologtimnegocia.servicesdigital.com.br/
#     ${source}            Get Page Source                 not contains           storage
