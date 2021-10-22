#!/bin/bash

count=0

until [ "$started" = true ] || [[ ( "$count" == 3 ) ]]; do
  count=$((count+1))
  echo "[$STAGE_NAME] Starting container [Attempt: $count]"

  testStart=$(curl --write-out '%{http_code}' --silent --output /dev/null http://172.17.0.1:8000)
  echo "$testStart"

  if [[ ( "$testStart" == 200 ) ]]; then
    started=true
    echo "Success"
  else
    started=false
    sleep 1
  fi
done

if [ "$started" = false ]; then
  echo "Failure"
  exit 1
fi
