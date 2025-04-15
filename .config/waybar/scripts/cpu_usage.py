#!/usr/bin/env python
import psutil

cpu_percent = psutil.cpu_percent(interval=1)
print(f"{cpu_percent}%")
