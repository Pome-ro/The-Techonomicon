from uptime_kuma_api import UptimeKumaApi, MonitorType
import os
import re

api = UptimeKumaApi('http://uptime.mps.internal/')

homeDIR = os.path.expanduser('~')
tokenPath = os.path.join(homeDIR,'tokens','uptime.token')
with open(tokenPath,'r') as file:
    token = file.read().rstrip()

api.login_by_token(token)

monitors = api.get_monitors()

def filterByMonitorName(dic,monName):
    return re.match(dic['name'],monName)

def filterByBuilding(dic,buildingName):
    for tag in dic['tags']:
        if tag['tag_id'] == 3 and tag['value'] == buildingName:
            return True

def filterByTagName(dic,tagName):
    for tag in dic['tags']:
        if tag['name'] == tagName:
            return True

filteredMon = [d for d in monitors if filterByTagName(d,'IT Services')]

for mon in filteredMon:
    api.add_monitor_tag(
        tag_id=5,
        monitor_id=mon['id'],
        value="Server"
    )
print(filteredMon)