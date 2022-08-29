FROM node:18

# Install main dependencies
RUN apt-get update && apt-get install apt-utils sudo curl gnupg2 sshpass openssh-server rsync vim -y

# Adding SSH app user
RUN /usr/sbin/useradd -d /home/app -m -s /bin/bash app -c "App User"
RUN usermod -aG sudo app

# Install pm2
RUN npm install --no-optional --no-shrinkwrap --no-package-lock pm2 -g

# Expose ports needed
EXPOSE 80 443 22

RUN mkdir -p /app
VOLUME /app
WORKDIR /app

VOLUME /home/app

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Start up ssh and exec pm2 process file
ENTRYPOINT ["/entrypoint.sh"]
