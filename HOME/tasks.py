from django.utils import timezone
from HOME.models import IPAddress

def update_host_status():
    print("\n\n\n\n\nupdate task\n\n\n\n\n")
    five_minutes_ago = timezone.now() - timezone.timedelta(minutes=5)
    # 挑选 host_status=False 的用户，判断是否超过5min未更新
    ip_addresses = IPAddress.objects.filter(latest_update__lte=five_minutes_ago, host_status=True)
    for ip_address in ip_addresses:
        ip_address.host_status = False
        ip_address.save()
