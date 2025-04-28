#!/usr/bin/env python3
import os

LOCK_FILE = "/tmp/expand_soundbar.lock"

if os.path.exists(LOCK_FILE):
    print("expand")
    os.remove(LOCK_FILE)
else:
    print("collapse")
    open(LOCK_FILE, "w").close()
