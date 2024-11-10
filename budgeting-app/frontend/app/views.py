from flask import Blueprint, render_template, request, redirect, url_for, flash
from .api import fetch_categories, add_transaction

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/budget-overview')
def budget_overview():
    categories = fetch_categories()
    return render_template('budget_overview.html', categories=categories)

@main.route('/transactions', methods=['GET', 'POST'])
def transactions():
    if request.method == 'POST':
        category_id = request.form['category_id']
        amount = request.form['amount']
        description = request.form['description']
        success = add_transaction(category_id, amount, description)
        if success:
            flash("Transaction added successfully!")
        else:
            flash("Failed to add transaction.")
        return redirect(url_for('main.transactions'))

    return render_template('transactions.html')
