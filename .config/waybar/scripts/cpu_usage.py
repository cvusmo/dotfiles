#!/usr/bin/env python
import psutil  # must install psutil

cpu_percent = psutil.cpu_percent(interval=1)
print(f"{cpu_percent}%")
