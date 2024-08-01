#!/usr/bin/env python

from mitmproxy import http
import requests

def add_header(flow: http.HTTPFlow) -> None:
    if flow.request.pretty_url == "https://claronegocie.com.br/api/register-page":
        flow.request.headers["test-header"] = "testando"

# import requests
# from requests_toolbelt import MultipartEncoderMonitor

# # Defina a URL do endpoint que você deseja acessar e o token de acesso
# url = "https://claronegocie.com.br/api/register-page"
# # token = "seu-token-de-acesso"

# # Crie um dicionário de cabeçalhos para enviar o token de acesso
# headers = {
#     "header_teste": "Testando"
# }

# # Crie a requisição usando o método HTTP apropriado (GET, POST, PUT, etc.) e inclua os cabeçalhos e dados
# response = requests.post(url, headers=headers)

# # Verifique o código de resposta
# if response.status_code == 200:
#     print("Requisição bem-sucedida!")
#     print(response.json())
# else:
#     print("Erro na requisição. Código de resposta:", response.status_code)
#     print(response.text)
