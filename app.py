from flask import Flask, render_template, send_from_directory
import json
from logic import theme, biblicalQuote

with open('access.json') as f:
    access = json.load(f)

app = Flask(__name__)

app.config['MYSQL_HOST'] = access['MYSQL_HOST']
app.config['MYSQL_USER'] = access['MYSQL_USER']
app.config['MYSQL_PASSWORD'] = access['MYSQL_PASSWORD']
app.config['MYSQL_DB'] = access['MYSQL_DB']

transactions = []

@app.route("/", methods=["GET", "POST"])
def home():
    return render_template("form.jinja2")

if __name__ == "__main__":
    app.run(port=8000)