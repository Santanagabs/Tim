import os
from google.cloud import bigquery
from dotenv import load_dotenv

load_dotenv()

def pegar_token_bigquery(phone):
    project_id = os.getenv("PROJECT_ID")
    service_account_key_path = os.getenv("SERVICE_ACCOUNT_KEY_PATH")
    # query = f"SELECT * FROM `gs-hermes.hermes_hml.messages-sent` WHERE phone = '55{phone}' ORDER BY sent_at DESC LIMIT 1"
    query = f"SELECT * FROM `gs-hermes.hermes_prod.messages-sent` WHERE (DATE(_PARTITIONTIME) = '2024-04-24' OR _PARTITIONTIME IS NULL) and provider = 'tim' and phone = '55{phone}' ORDER BY sent_at DESC LIMIT 1"
    client = bigquery.Client.from_service_account_json(service_account_key_path)
    query_job = client.query(query)
    result = query_job.result()

    message = " ".join(str(row["message"]) for row in result)
    print(message)
    return message
