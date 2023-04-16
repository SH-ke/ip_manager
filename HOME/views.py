import json, os
from django.conf import settings
from django.http import HttpResponse, Http404
from django.shortcuts import render, redirect, get_object_or_404
from HOME.models import IPAddress
from HOME.forms import IPAddressForm
from HOME.utils import DateTimeEncoder, load_json_to_db

def home(request):
    return render(request, 'home.html')


def ip_list(request):    
    # show ip list
    ip_addresses = IPAddress.objects.all()
    return render(request, 'ip_list.html', {'ip_addresses': ip_addresses})


def create_ip(request):
    # 进入提交界面
    if request.method == 'GET':
        return render(request, 'create_ip.html')
    
    # show ip list
    form = IPAddressForm(request.POST)
    if form.is_valid():
        ip_address = form.save(commit=False)
        ip_address.save()
    return redirect('ip_list')


def download_ip_addresses(request):
    ip_addresses = IPAddress.objects.all().values()
    data = json.dumps(list(ip_addresses), cls=DateTimeEncoder, 
                        sort_keys=True, indent=4, separators=(',', ': '))
    response = HttpResponse(data, content_type='application/json')
    response['Content-Disposition'] = 'attachment; filename="ip_addresses.json"'
    return response


def load_data(request):
    file_path='./data.bak.json'
    load_json_to_db(file_path)
    return HttpResponse('Data loaded successfully')


def download_script(request, filename):
    file_path = os.path.join(settings.BASE_DIR, 'scripts', filename)
    print("download")
    print(filename)
    print(file_path)
    if os.path.exists(file_path):
        print("exist")
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type="application/octet-stream")
            response['Content-Disposition'] = f'attachment; filename="{filename}"'
            print("resp")
            return response
    print("not exist")
    raise Http404


def edit_ip(request, pk):
    ip = get_object_or_404(IPAddress, pk=pk)
    print("edite")
    print(pk)
    print(ip)

    if request.method == 'POST':
        # process form data
        ip.dynamic_ip = request.POST['dynamic_ip']
        ip.host_status = request.POST['host_status']
        ip.user_name = request.POST['user_name']
        ip.save()
        return redirect('ip_list')

    print("render")
    return render(request, 'edit_ip.html', {'ip': ip})

def delete_ip(request, pk):
    ip = get_object_or_404(IPAddress, pk=pk)
    ip.delete()
    return redirect('ip_list')
