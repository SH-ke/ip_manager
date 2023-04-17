"""
URL configuration for ip_manager project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from HOME import views, api


urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', views.home),
    path('ip_list/', views.ip_list, name='ip_list'),
    path('add/', views.add_ip, name='add_ip'),
    path('edit/<int:pk>/', views.edit_ip, name='edit_ip'),
    path('delete/<int:pk>/', views.delete_ip, name='delete_ip'),
    path('download/ip/', views.download_ip_addresses, name='download_ip_addresses'), 
    path('download/<str:filename>/', views.download_script, name='download_script'), 
    path('load_data/', views.load_data, name='load_data'),
    path('api/update/', api.update, name='update'),
]

