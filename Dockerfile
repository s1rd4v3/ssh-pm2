FROM debian:jessie-slim

MAINTAINER Dave Steck

# Install main dependencies
RUN apt-get update && apt-get install apt-utils sudo curl gnupg2 sshpass openssh-server rsync vim -y

# Adding SSH web user
RUN /usr/sbin/useradd -d /web -m -p $(echo "ChangeMe$" | openssl passwd -1 -stdin) -s /bin/bash web -c "Web User"
RUN usermod -aG sudo web

# Prepare node installation
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# Install nodejs
RUN sudo apt-get install -y nodejs
RUN ln -s nodejs node
RUN npm install npm@latest -g

# Install pm2
RUN npm install --no-optional --no-shrinkwrap --no-package-lock pm2 -g

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

# Expose ports needed
EXPOSE 80 443 22

# Start up ssh and exec pm2 process file
ENTRYPOINT ["/entrypoint.sh"]
