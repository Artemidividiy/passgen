
import json
import flask

from controllers.password_controller import PasswordController
from models.settings import Settings
app = flask.Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def home():
    request_data = flask.request.get_json()
    settings = Settings.fromMap(request_data)
    passwords = [PasswordController(settings=settings) for i in range(settings.password_count)]
    d = [i.toMap() for i in passwords]
    return d


if __name__ == "__main__":
    app.run()
    