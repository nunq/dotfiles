#!/usr/bin/fish

set TEXT (tail /run/user/(id -u)/clipmenu.5.(id -un)/line_cache_clipboard | sort -r | sed 's/^[0-9]* //gi' | dmenu -p "paste what?" -l 5 | jq -sRr @uri)
set API "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceId=group.android&apikey=""$JOIN_APIKEY""&clipboard="
curl "$API""$TEXT" > /dev/null 2>&1
