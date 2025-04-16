#!/usr/bin/env python3
import json
import time

while True:
    print(json.dumps({"text": "Test Clock"}), flush=True)
    time.sleep(1)
