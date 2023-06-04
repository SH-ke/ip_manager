import requests

base_url = "http://http://20.163.99.216/:8000"

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
response_text = update("192.331.1.1", "template", host_status='1')
print(response_text)

