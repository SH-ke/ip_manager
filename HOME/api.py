import json
from HOME.models import IPAddress
from HOME.forms import IPAddressForm
from django.http import JsonResponse

def update(request):
    if request.method == 'GET':
        # Get data from the request parameters
        dynamic_ip = request.GET.get('dynamic_ip')
        print(dynamic_ip)
        host_status = request.GET.get('host_status')
        print(host_status)
        user_name = request.GET.get('user_name')
        print(user_name)
        
        # Save the data to the database
        # Note: Replace this with your own code to interact with the SQLite database
        # Example:
        obj, created = IPAddress.objects.update_or_create(
            user_name=user_name,
            defaults={
                'dynamic_ip': dynamic_ip,
                'host_status': host_status,
            }
        )
    
        # Return a JSON response with a success message
        return JsonResponse({'success': True, 'message': 'IP address created successfully.'})
    
