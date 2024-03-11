# Create a simple Flask app here -->
from flask import Flask, render_template
import redis
import json

app = Flask(__name__)

# Set up a redis client to host our data →

redis_client = redis.Redis(host='redis', port=6379)

# json.dumps converts our test data from a python dictionary of products into a json to store in our redis database →

redis_client.set('product', json.dumps([
        {'id': 1, 'name': 'Power Drill', 'barcode': '406780655784', 'price': 300},
        {'id': 2, 'name': 'Circular Saw', 'barcode': '522687161043', 'price': 200},
        {'id': 3, 'name': 'Desk', 'barcode': '757543429691', 'price': 150}
        ]))

# Retrieve product json from redis to be used in our application →

items = json.loads(redis_client.get('product'))

# Set up routing as normal... →

@app.route('/')

# Send our python dictionary to index.html via render_template →

def products_page():

    return render_template('index.html', items=items)