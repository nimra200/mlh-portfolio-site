import os
from flask import Flask, request, Response, render_template, send_from_directory
from dotenv import load_dotenv
from . import db

load_dotenv()
app = Flask(__name__)
app.config['DATABASE'] = os.path.join(os.getcwd(), 'flask.sqlite')
db.init_app(app)

@app.route('/')
def index():
    return render_template('index.html', title="MLH Fellow", url=os.getenv("URL"))

@app.route('/health', methods=['GET'])
def health():
    return Response("HTTP 200 OK", mimetype='text/html'), 200
