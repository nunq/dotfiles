#!/usr/bin/fish
# vim: syntax=sh
set TEXT (tail /run/user/(id -u)/clipmenu.5.(id -un)/line_cache_clipboard | tac | sed 's/^[0-9]* //gi' | dmenu -p "push what?" -l 5 | jq -sRr @uri)

if echo "$TEXT" | grep -q "^http"
  set APICALL "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceId=group.android&apikey=""$JOIN_APIKEY""&url="
else
  set APICALL "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceId=group.android&apikey=""$JOIN_APIKEY""&clipboard="
end
curl "$APICALL""$TEXT" > /dev/null
