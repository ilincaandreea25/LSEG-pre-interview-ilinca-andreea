from flask import Flask
from .config import Config
from .models import init_db
from .routes import main

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize the database
    init_db(app)

    # Register blueprint
    app.register_blueprint(main)

    return app
