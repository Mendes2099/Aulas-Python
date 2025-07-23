from flask import render_template
from galeria.main import app


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/sobre")
def sobre():
    return '<a href="/">Back</a>'
