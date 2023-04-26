from django.db import models


class IPAddress(models.Model):
    dynamic_ip = models.CharField(max_length=100)
    host_status = models.BooleanField(default=True)  # True for 'alive', False for 'shutdown'
    user_name = models.CharField(max_length=100, unique=True)
    latest_update = models.DateTimeField(auto_now=True)


    ### This will ensure that there won't be more than one entry with 
    ### the same dynamic_ip and user_name combination.
    class Meta:
        unique_together = (('user_name', 'dynamic_ip'),)
