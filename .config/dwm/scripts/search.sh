# search.sh
#!/bin/bash
query=$(echo "" | dmenu -p "Search:")
[ -n "$query" ] && firefox "https://duckduckgo.com/?q=$query"
