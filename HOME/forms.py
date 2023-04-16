from django import forms
from HOME.models import IPAddress

class IPAddressForm(forms.ModelForm):
    class Meta:
        model = IPAddress
        fields = '__all__'