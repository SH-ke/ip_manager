import json
from datetime import datetime
from HOME.models import IPAddress


# 使用以下代码将datetime对象转换为字符串：
# Object of type datetime is not JSON serializable
class DateTimeEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        return json.JSONEncoder.default(self, obj)

# data = {'name': 'John', 'age': 30, 'created_at': datetime.now()}
# json_data = json.dumps(data, cls=DateTimeEncoder)
# print(json_data)


def load_json_to_db(file_path='./data.bak.json'):
    with open(file_path, 'r') as f:
        data = json.load(f)
        for item in data:
            item.pop('id', None)  # Remove 'id' key
            latest_update_str = item.pop('latest_update')
            latest_update = datetime.strptime(latest_update_str, '%Y-%m-%d %H:%M:%S')
            ip_address = IPAddress(**item, latest_update=latest_update)
            ip_address.save()