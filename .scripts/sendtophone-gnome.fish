#!/usr/bin/fish
# vim: syntax=sh
set TEXT (jq ".[-1].contents" $HOME/.cache/clipboard-indicator@tudmotu.com/registry.txt | sed 's/"//g' | dmenu -p "push this?" -l 5 | jq -sRr @uri)

if echo "$TEXT" | grep -q "^http"
  set APICALL "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceId=group.android&apikey=""$JOIN_APIKEY""&url="
else
  set APICALL "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceId=group.android&apikey=""$JOIN_APIKEY""&clipboard="
end
curl "$APICALL""$TEXT" > /dev/null
