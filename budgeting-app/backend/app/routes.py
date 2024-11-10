from flask import Blueprint, jsonify, request
from .models import get_db

main = Blueprint('main', __name__)

@main.route('/api/categories', methods=['GET'])
def get_categories():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM categories")
    categories = cursor.fetchall()
    cursor.close()
    return jsonify([
        {"id": c[0], "name": c[1], "total_budget": c[2], "remaining_budget": c[3]}
        for c in categories
    ])

@main.route('/api/transactions', methods=['POST'])
def create_transaction():
    data = request.json
    db = get_db()
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO transactions (category_id, amount, description) VALUES (%s, %s, %s)",
        (data['category_id'], data['amount'], data['description'])
    )
    db.commit()
    cursor.close()
    return jsonify({"status": "success"}), 201
