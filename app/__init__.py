from flask import Flask
from .db import init_db
from .routes import main

def create_app():
    app = Flask(__name__)

    # Configuration for MySQL database
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'username'
    app.config['MYSQL_PASSWORD'] = 'password'
    app.config['MYSQL_DATABASE'] = 'movie_streaming'

    # Initialize database
    init_db(app)

    # Register routes
    from .routes import main
    app.register_blueprint(main)

    return app
