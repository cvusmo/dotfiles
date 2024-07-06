#!/bin/bash

# Get disk usage
diskusage=$(df -h / | awk 'NR==2{print $4}')

echo "$diskusage"
