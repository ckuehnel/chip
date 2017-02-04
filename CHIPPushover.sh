#!/bin/sh

#set -- "${1:-$(</dev/stdin)}" "${@:2}"

if [ $# -lt 1 ] 
then
  echo "Usage: ./CHIPPushover.sh <message>"
else
  msg=$1
  echo [$msg] will be pushed to mobile device

  curl -s \
    --form-string "token=a4aah3ayh5b1nirrff2dxdz5dp1oix" \
    --form-string "user=uojfahpyozqtj6gbgccg61e5jngg93" \
    --form-string "message=$msg" \
    https://api.pushover.net/1/messages.json
    echo
fi
