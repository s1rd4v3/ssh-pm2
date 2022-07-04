#!/bin/sh
service ssh start

if [ -z "$PM2_START_FILE" ]
then
  echo "Please define PM2_START_FILE env"
  bash
else
  pm2-runtime start $PM2_START_FILE --no-auto-exit
fi


