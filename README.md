# ssh-pm2
Docker image to manage bundled meteor with pm2

__You have to define the environment variable `PM2_START_FILE` which points to the pm2 process file.__

## Example pm2 process file for Meteor Apps (in YAML)
```yml
---
apps:
  - script    : /web/main.js
    name      : Meteor App
    watch     : 
      - /web/main.js
        /web/pm2.yml
    env: 
      APP_NAME  : My Meteor App
      PORT      : 443
      MONGO_URL : mongodb://MONGO_USER:MONGO_PASSWORD@MONGO_SERVER_PATH:MONGO_SERVER_PORT/MONGO_DB_NAME
      ROOT_URL  : https://MY-DOMAIN.COM/
      METEOR_SETTINGS:
        MAIL_URL  : smtp://EMAIL_AUTH_USER:EMAIL_AUTH_PASSOWRD@EMAIL_DOMAIN:587
        MAIL      : FULL_EMAIL
```

all options can be found [here](http://pm2.keymetrics.io/docs/usage/application-declaration/#yaml-format)
