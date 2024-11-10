from flask import Flask

def create_app():
    app = Flask(__name__)

    # Load configurations
    app.config.from_pyfile('../.env')

    # Register views
    from .views import main
    app.register_blueprint(main)

    return app
