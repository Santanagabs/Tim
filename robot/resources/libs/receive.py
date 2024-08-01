import os
from flask import Flask, request
import telnyx

telnyx.api_key = "KEY018955781017444940D4F0B4F8CD8410_W7QpyW5QWQUnx4IoH98Ih0"

app = Flask(__name__)

@app.route('/webhooks', methods=['POST'])
def webhooks():
    body = request.json

    print(body)

    return '', 200

if __name__ == "__main__":
    app.run(port=8000)

def get_token():
    message = telnyx.Message.retrieve('')
