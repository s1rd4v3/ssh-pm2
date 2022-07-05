#!/bin/sh

# Start SSH server
service ssh start

# reown home + app folder if linked volume is mounted
chown -R app:app /home/app
chown -R app:app /app

if [ -z "$PM2_START_FILE" ]
then
  echo "Please define PM2_START_FILE env"
  bash
else
  pm2-runtime start $PM2_START_FILE --no-auto-exit
fi


