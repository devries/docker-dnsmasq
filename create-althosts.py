#!/usr/bin/env python
import subprocess
import json

p1 = subprocess.Popen(['docker','ps','-q'],stdout=subprocess.PIPE)

process_list = [p for p in p1.communicate()[0].split('\n') if p]

p2 = subprocess.Popen(['docker','inspect']+process_list,stdout=subprocess.PIPE)

inspect_data = json.loads(p2.communicate()[0])

for container in inspect_data:
    print container['NetworkSettings']['IPAddress'],container['Name'].lstrip('/')
