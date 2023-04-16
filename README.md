# IP 管理服务

description .

## Django Setup

To set up a Django project with SQLite using the command line, follow these steps:

进入虚拟环境

```
cd ~/Desktop/myproject
```

Once you're in the desired directory, create a virtual environment for your project using the following command:

```

python3 -m venv myvenv
```

This will create a new virtual environment in a directory called "myvenv" within your project directory.

Activate the virtual environment by running the following command:

```
bash
source myvenv/bin/activate
```

You should see the name of your virtual environment appear in your terminal prompt.

Install Django within the virtual environment using the following command:

```

pip install Django
```

Create a new Django project using the following command:

```

django-admin startproject myproject
```

This will create a new directory called "myproject" with the basic structure of a Django project.

Navigate to the "myproject" directory using the `cd` command.

Open the "settings.py" file located within the "myproject" directory using a text editor of your choice. 默认使用 SQLite

```django
arduino
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
```

Run the following command to create the initial database schema:

```

python manage.py migrate
```

Your project is now ready to use SQLite as its database backend. You can start the development server by running the following command:

```

python manage.py runserver
```

This will start the development server on your local machine, and you can access your project by navigating to http://127.0.0.1:8000/ in your web browser.



## 新建 app

To create a new app named "HOME" in your Django project using the command line, follow these steps:

1. Open a terminal or command prompt on your computer.

2. Navigate to the root directory of your Django project using the `cd` command. For example, if your project is located in a directory called "myproject" on your desktop, you can use the following command:

   ```
   bashCopy code
   cd ~/Desktop/myproject
   ```

3. Once you're in the root directory of your project, run the following command to create a new app named "HOME":

   ```
   Copy code
   python manage.py startapp HOME
   ```

   This will create a new directory called "HOME" within your project directory, with the basic structure of a Django app.

4. Open the "settings.py" file located within the "myproject" directory using a text editor of your choice.

5. Locate the "INSTALLED_APPS" section of the "settings.py" file and add the name of your new app to the list. In this case, you would add `'HOME',` to the list of installed apps.

   ```
   cssCopy code
   INSTALLED_APPS = [    'django.contrib.admin',    'django.contrib.auth',    'django.contrib.contenttypes',    'django.contrib.sessions',    'django.contrib.messages',    'django.contrib.staticfiles',    'HOME',]
   ```

6. Save the changes to the "settings.py" file and close the text editor.

Your new "HOME" app is now ready to use. You can create views, models, templates, and other components of your app in the appropriate directories within the app directory.

## 网页模板

Sure, here's an example HTML page written using Bootstrap 3.4.1 that could be used as the home page of your Django project:

```
javascriptCopy code{% extends 'base.html' %}

{% block content %}
  <div class="jumbotron">
    <h1>Welcome to my Django project!</h1>
    <p class="lead">This is the home page of my project.</p>
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
  </div>
{% endblock %}
```

This is a Django template that extends a base template called "base.html". You'll need to create this base template and include the appropriate Bootstrap CSS and JavaScript files.

Here's an example of what the "base.html" file might look like:

```
phpCopy code<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <title>{% block title %}My Django Project{% endblock %}</title>
  </head>
  <body>
    <div class="container">
      {% block content %}
      {% endblock %}
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </body>
</html>
```

This base template includes the necessary Bootstrap CSS and JavaScript files and provides a container for your content. You can then use the `{% block content %}` and `{% endblock %}` tags to define the content of each page.

Once you've created these templates, you'll need to configure your Django project to use them. You can do this by updating the "TEMPLATES" section of your project's settings file to include the directories where your templates are stored. Here's an example of what that might look like:

```
cssCopy codeTEMPLATES = [    {        'BACKEND': 'django.template.backends.django.DjangoTemplates',        'DIRS': ['path/to/templates/directory'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```

Make sure to replace `'path/to/templates/directory'` with the actual path to your templates directory. Once you've done this, your Django project should be able to find and use your templates.

## 表格网页界面

i want edit a page to manage some ip addrs, there is a table. the columns are id, dynamic ip, host status, user name, latest update. can you give me the html with bootstrap  3.4.1 and using a django template? give the template code of html. 





Sure, here's an example Django template that uses Bootstrap 3.4.1 to display a table of IP addresses:

```
javascript
{% extends 'base.html' %}

{% block content %}
  <div class="container">
    <h1>IP Address Management</h1>
    <p>
      <a class="btn btn-primary" href="#">Add IP Address</a>
    </p>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>ID</th>
          <th>Dynamic IP</th>
          <th>Host Status</th>
          <th>User Name</th>
          <th>Latest Update</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        {% for ip_address in ip_addresses %}
        <tr>
          <td>{{ ip_address.id }}</td>
          <td>{{ ip_address.dynamic_ip }}</td>
          <td>{{ ip_address.host_status }}</td>
          <td>{{ ip_address.user_name }}</td>
          <td>{{ ip_address.latest_update }}</td>
          <td>
            <a class="btn btn-primary" href="#">Edit</a>
            <a class="btn btn-danger" href="#">Delete</a>
          </td>
        </tr>
        {% endfor %}
      </tbody>
    </table>
  </div>
{% endblock %}
```

In this example, we're extending the "base.html" template and adding a container with a header, a "Add IP Address" button, and a table to display the IP addresses.

We're using a Bootstrap table with striped rows to make it easier to read. The table has six columns: ID, Dynamic IP, Host Status, User Name, Latest Update, and Action.

We're then using a Django for loop to iterate through a list of IP addresses and display them in the table. For each IP address, we're displaying the ID, Dynamic IP, Host Status, User Name, Latest Update, and two buttons for editing or deleting the IP address.

You'll need to define a view and a model in your Django project to provide the list of IP addresses to the template. Once you have that set up, you can render this template using the `render` function in your Django view.

## 表格数据库操作

can you give me the operating functions to the table in django ?





Sure, here are the basic Django functions you'll need to perform CRUD operations (Create, Read, Update, Delete) on the `ip_addresses` table:

**Create a new IP address:**

To create a new IP address in Django, you'll need to define a model to represent the data in the `ip_addresses` table. Here's an example model:

```
python
from django.db import models

class IPAddress(models.Model):
    dynamic_ip = models.CharField(max_length=100)
    host_status = models.CharField(max_length=100)
    user_name = models.CharField(max_length=100)
    latest_update = models.DateTimeField(auto_now=True)
```

This model defines four fields to match the columns in the `ip_addresses` table: `dynamic_ip`, `host_status`, `user_name`, and `latest_update`. The `latest_update` field is a `DateTimeField` that will automatically update to the current time whenever the IP address is saved.

Once you have a model defined, you can create new IP addresses using the `create` method on the model:

```
python
IPAddress.objects.create(
    dynamic_ip='192.168.0.1',
    host_status='Active',
    user_name='admin'
)
```

This code will create a new `IPAddress` object and save it to the database.

**Read IP addresses:**

To read IP addresses from the database in Django, you can use the `objects.all()` method on the model:

```
python
ip_addresses = IPAddress.objects.all()
```

This will return a queryset containing all of the IP addresses in the database. You can then pass this queryset to a template for display.

**Update an IP address:**

To update an existing IP address in Django, you can retrieve the object from the database using its ID and then update its fields using the dot notation:

```
python
ip_address = IPAddress.objects.get(id=1)
ip_address.host_status = 'Inactive'
ip_address.save()
```

This code will retrieve the IP address with ID 1 from the database, update its `host_status` field, and save the changes to the database.

**Delete an IP address:**

To delete an existing IP address in Django, you can retrieve the object from the database using its ID and then call the `delete` method:

```
python
ip_address = IPAddress.objects.get(id=1)
ip_address.delete()
```

This code will retrieve the IP address with ID 1 from the database and delete it from the database.



## 新建条目功能

i want to use get method to create entries, can you give me the view.py utils code ?





Sure, here's an example `views.py` file that uses a Django form to create new entries in the `ip_addresses` table using the GET method:

```
python
from django.shortcuts import render
from .forms import IPAddressForm
from .models import IPAddress

def create_ip_address(request):
    form = IPAddressForm(request.GET or None)
    if form.is_valid():
        ip_address = form.save(commit=False)
        ip_address.save()
    ip_addresses = IPAddress.objects.all()
    return render(request, 'ip_addresses.html', {'form': form, 'ip_addresses': ip_addresses})
```

This view function uses a `GET` request to render a form (`IPAddressForm`) that allows the user to input values for the `dynamic_ip`, `host_status`, and `user_name` fields. When the form is submitted, the `is_valid()` method is called to validate the form data, and if the form is valid, a new `IPAddress` object is created and saved to the database.

Finally, the view retrieves all of the IP addresses from the database and passes them to the `ip_addresses.html` template for display.

Note that in this example, we're using the `request.GET` parameter to populate the form with any query string parameters that were included in the URL. You could also use `request.POST` instead to handle form submissions via `POST` instead of `GET`.

### post 版本

ok, i will consider this. can you give me the post method version, and the web page html code of this ? using bootstrap  3.4.1 template 





Certainly! Here's an example `views.py` file that uses a Django form to create new entries in the `ip_addresses` table using the POST method:

```
python
from django.shortcuts import render
from .forms import IPAddressForm
from .models import IPAddress

def create_ip_address(request):
    if request.method == 'POST':
        form = IPAddressForm(request.POST)
        if form.is_valid():
            ip_address = form.save(commit=False)
            ip_address.save()
    else:
        form = IPAddressForm()
    ip_addresses = IPAddress.objects.all()
    return render(request, 'ip_addresses.html', {'form': form, 'ip_addresses': ip_addresses})
```

In this version, we're checking for a `POST` request using `if request.method == 'POST'`, and creating the `IPAddressForm` object using `request.POST`. If the form is valid, we create a new `IPAddress` object and save it to the database.

Here's an example `ip_addresses.html` template that displays the IP addresses in a table, and includes a form for creating new IP addresses:

```
html
{% extends "base.html" %}

{% block content %}
    <h1>IP Addresses</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Dynamic IP</th>
                <th>Host Status</th>
                <th>User Name</th>
                <th>Latest Update</th>
            </tr>
        </thead>
        <tbody>
            {% for ip_address in ip_addresses %}
                <tr>
                    <td>{{ ip_address.id }}</td>
                    <td>{{ ip_address.dynamic_ip }}</td>
                    <td>{{ ip_address.host_status }}</td>
                    <td>{{ ip_address.user_name }}</td>
                    <td>{{ ip_address.latest_update }}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
    <h2>Create IP Address</h2>
    <form method="post">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
{% endblock %}
```

This template includes a table that displays the ID, Dynamic IP, Host Status, User Name, and Latest Update for each IP address in the database. It also includes a form for creating new IP addresses, which is generated using the `{{ form.as_p }}` template tag. When the form is submitted, the CSRF token is included for security purposes using `{% csrf_token %}`. Finally, a submit button is included using `<button type="submit" class="btn btn-primary">Save</button>`.

## 下载表格

i also think there should be a function for file download. when there is a get request, the server will give the json file which contains the table data, and send it to user





Sure! Here's an updated version of the `views.py` file that includes a function to generate a JSON file containing the data from the `ip_addresses` table, and allows users to download it using a GET request:

```
python
import json
from django.http import HttpResponse
from django.shortcuts import render
from .forms import IPAddressForm
from .models import IPAddress

def create_ip_address(request):
    if request.method == 'POST':
        form = IPAddressForm(request.POST)
        if form.is_valid():
            ip_address = form.save(commit=False)
            ip_address.save()
    else:
        form = IPAddressForm()
    ip_addresses = IPAddress.objects.all()
    return render(request, 'ip_addresses.html', {'form': form, 'ip_addresses': ip_addresses})

def download_ip_addresses(request):
    ip_addresses = IPAddress.objects.all().values()
    data = json.dumps(list(ip_addresses))
    response = HttpResponse(data, content_type='application/json')
    response['Content-Disposition'] = 'attachment; filename="ip_addresses.json"'
    return response
```

This version includes a new function called `download_ip_addresses()` that retrieves all the IP addresses from the database using `IPAddress.objects.all().values()`, and converts them to a JSON-formatted string using the `json.dumps()` function. It then creates an `HttpResponse` object with the JSON data, sets the content type to `application/json`, and adds a `Content-Disposition` header to specify the filename of the downloaded file.

To allow users to download the file, you can add a link to the `ip_addresses.html` template that points to the `download_ip_addresses` URL:

```
html
{% extends "base.html" %}

{% block content %}
    <h1>IP Addresses</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Dynamic IP</th>
                <th>Host Status</th>
                <th>User Name</th>
                <th>Latest Update</th>
            </tr>
        </thead>
        <tbody>
            {% for ip_address in ip_addresses %}
                <tr>
                    <td>{{ ip_address.id }}</td>
                    <td>{{ ip_address.dynamic_ip }}</td>
                    <td>{{ ip_address.host_status }}</td>
                    <td>{{ ip_address.user_name }}</td>
                    <td>{{ ip_address.latest_update }}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
    <h2>Create IP Address</h2>
    <form method="post">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
    <h2>Download IP Addresses</h2>
    <p><a href="{% url 'download_ip_addresses' %}" class="btn btn-primary">Download</a></p>
{% endblock %}
```

This template includes a new section that displays a "Download IP Addresses" heading, and a download link that points to the `download_ip_addresses` URL using the `{% url %}` template tag. When the user clicks the link, the `download_ip_addresses()` function will be called, and the JSON file will be downloaded to the user's computer.

## 客户端下载及创建

do you think the script get latest_update, dynamic_ip those 2 values itself automatically is better ?





It depends on the specific requirements of your project. If you want to automatically capture the latest update time and the dynamic IP address of the client making the request, you could modify the `create_ip_address` function to extract these values from the request object and include them in the JSON data. Here's an example of how you could modify the function to do this:

```
powershell
# Function to create a new IP address entry using a POST request
function create_ip_address {
    $url = "$base_url/ip_addresses/create/"
    $data = @{
        dynamic_ip = $env:REMOTE_ADDR
        host_status = "Active"
        user_name = "johndoe"
        latest_update = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    }
    $json = $data | ConvertTo-Json
    $headers = @{
        "Content-Type" = "application/json"
    }
    $response = curl -X POST -H $headers -d $json $url
    return $response
}
```

In this version of the `create_ip_address` function, the `dynamic_ip` value is set to the IP address of the client making the request, which is accessed using the `$env:REMOTE_ADDR` environment variable. The `latest_update` value is set to the current date and time, which is obtained using the `Get-Date` cmdlet and formatted as a string using the `"yyyy-MM-dd HH:mm:ss"` format specifier.

If you want to capture additional information about the client or the request, you could explore other environment variables that are available to PowerShell scripts, such as `$env:HTTP_USER_AGENT` for the user agent string or `$env:HTTP_REFERER` for the referring URL.

## 关机信号

thank, i mean pc dose these before shutdown, can you wirte it into the script?





If you want to execute some code on a client's PC before it shuts down, you can create a Windows PowerShell script that listens for the Windows Event Log event indicating that the PC is about to shut down. You can then include code in the script to send a request to your web server to update the `host_status` field for the corresponding IP address entry.

Here's an example PowerShell script that listens for the `1074` event ID, which is generated when the system is shutting down:

```
powershell
$Log = 'System'
$EventID = 1074

# Start the event log watcher
$Watcher = New-Object System.Diagnostics.Eventing.Reader.EventLogWatcher("`<QueryList>`<Query Id=`"0`" Path=`"$Log`"`<Select Path=`"$Log`"`>[System[(EventID=$EventID)]]`</Select>`</Query>`</QueryList>")
$Watcher.EventRecordWrittenEvent += {
    $ShutdownEvent = $_.EventRecord
    
    # Extract the reason for the shutdown from the event data
    $Reason = ($ShutdownEvent.Properties.Value | Where-Object {$_.Name -eq 'ReasonCode'}).Value
    
    # Send a request to update the host status for the corresponding IP address entry
    Invoke-WebRequest -Uri 'http://your-web-server/update-host-status/' -Method POST -Body @{
        ip_address = '192.168.1.100'
        host_status = 'shutdown'
        reason = $Reason
    }
}

# Start the event log watcher
$Watcher.Start()
```

This script listens for the `1074` event ID in the `System` event log, which is generated when the system is shutting down. When the script receives the event, it extracts the reason for the shutdown from the event data and sends a request to update the host status for the corresponding IP address entry. You'll need to modify the `ip_address` parameter in the `Invoke-WebRequest` command to match the IP address of the client that is shutting down.

## 服务器接收关机信号

so there shuld be a function in server to receive shutdown signal, right ?





Yes, that's correct. You'll need to create a server-side function that can receive the shutdown signal from the client and update the `host_status` field for the corresponding IP address entry in the database.

Here's an example Django view that handles the shutdown signal:

```
python
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from myapp.models import IPAddress

@require_POST
def update_host_status(request):
    ip_address = request.POST.get('ip_address')
    host_status = request.POST.get('host_status')
    reason = request.POST.get('reason')

    try:
        # Get the corresponding IP address entry from the database
        ip_obj = IPAddress.objects.get(ip=ip_address)

        # Update the host status and reason fields
        ip_obj.host_status = host_status
        ip_obj.reason = reason
        ip_obj.save()

        return JsonResponse({'success': True})
    except IPAddress.DoesNotExist:
        return JsonResponse({'success': False, 'error': 'IP address not found'})
```

This view expects a `POST` request with three parameters: `ip_address`, `host_status`, and `reason`. It then updates the corresponding `IPAddress` object in the database with the provided `host_status` and `reason` values.

You'll need to add the `update_host_status` view to your `urls.py` file, so that it can be accessed via a URL. For example:

```
python
from django.urls import path
from myapp.views import update_host_status

urlpatterns = [
    path('update-host-status/', update_host_status, name='update_host_status'),
    # ... other URL patterns ...
]
```

Once you have this view set up on your server, you can modify the PowerShell script to send a `POST` request to the `update-host-status` URL with the appropriate parameters when it receives the shutdown event.

# 常用命令

## 数据库操作

您可以通过以下命令查看SQLite数据库中的所有表：  
```sqlite
SELECT name FROM sqlite_master WHERE type='table' order by name;
```
这个命令将返回一个按字母顺序排列的表名列表。

如果您想查看特定表的结构，可以使用以下命令：  
```sqlite
SELECT * FROM sqlite_master WHERE type='table' AND name='table_name';
```
其中，`table_name`是您要查看的表的名称。

## 定时任务

添加并启动定时任务

```python
#添加并启动定时任务
python manage.py crontab add
```

其它命令：

```python
#显示当前的定时任务
python manage.py crontab show

#删除所有定时任务
python manage.py crontab remove
```

## todo

settings.py 中 INSTALLED APPS 怎么使用？