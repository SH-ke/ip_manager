import requests

base_url = "http://localhost:8000"

# Function to create a new IP address entry using a GET request
def update(dynamic_ip, user_name, host_status='0'):
    url = f"{base_url}/api/update/"
    params = {
        "dynamic_ip": dynamic_ip,
        "user_name": user_name,
        "host_status": host_status, 
    }
    response = requests.get(url, params=params)
    return response.json

# Test the update function
response_text = update("192.168.1.1", "johndoe")
response_text = update("192.200.1.1", "smith")
response_text = update("192.144.1.1", "kamijo")
response_text = update("192.23.1.1", "sesy")
response_text = update("192.331.1.1", "shke", host_status='1')
print(response_text)

