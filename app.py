import os
from flask import Flask, render_template, send_from_directory
from logic import theme, biblicalQuote

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'joao'
app.config['MYSQL_PASSWORD'] = '#12tribosdeIsrael'
app.config['MYSQL_DB'] = 'solomon'

transactions = []

@app.route("/", methods=["GET", "POST"])
def home():
    return render_template("form.jinja2")

if __name__ == "__main__":
    app.run(port=8000)