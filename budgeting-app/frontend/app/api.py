import requests
from flask import current_app

def fetch_categories():
    response = requests.get(f"{current_app.config['API_BASE_URL']}/api/categories")
    if response.status_code == 200:
        return response.json()
    return []

def add_transaction(category_id, amount, description):
    transaction_data = {
        "category_id": category_id,
        "amount": amount,
        "description": description
    }
    response = requests.post(f"{current_app.config['API_BASE_URL']}/api/transactions", json=transaction_data)
    return response.status_code == 201
