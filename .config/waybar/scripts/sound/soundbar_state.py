#!/usr/bin/env python3
import os

LOCK_FILE = "/tmp/expand_soundbar.lock"

if os.path.exists(LOCK_FILE):
    print(0)
else:
    print(1)
