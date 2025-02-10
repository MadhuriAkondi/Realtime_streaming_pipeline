import requests
import json
import time
from random import randint


# Function to fetch data from Fake Store API
def fetch_fake_store_data():
    url = "https://fakestoreapi.com/products"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()  # Returns a list of product details
    else:
        print("Failed to fetch data")
        return None


# Simulate streaming data: Fetch and print every 5 seconds
while True:
    data = fetch_fake_store_data()
    if data:
        # Simulating the data stream by selecting a random product
        product = data[randint(0, len(data) - 1)]  # Randomly select a product
        transaction_data = {
            "transaction_id": randint(1000, 9999),
            "product_id": product["id"],
            "product_name": product["title"],
            "category": product["category"],
            "price": product["price"],
            "quantity": randint(1, 5),  # Simulate random quantities
            "timestamp": time.time()
        }

        # Print the generated transaction to simulate stream (you can push to Kafka or file)
        print(json.dumps(transaction_data))

    # Wait for 5 seconds before fetching the next batch of data
    time.sleep(5)


