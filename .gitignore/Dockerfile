FROM rastasheep/ubuntu-sshd

MAINTAINER Dave Steck

# Update
RUN apt-get update
# Install main dependencies
RUN apt-get install sudo curl gnupg2 -y

# Adding Web User
RUN adduser web --home /web --disabled-password --gecos "Web User"
RUN echo web:web | chpasswd

# Prepare node installation
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
# Install nodejs
RUN sudo apt-get install -y nodejs

# Install pm2
RUN npm install pm2 -g

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

# Expose ports needed
EXPOSE 80 443

# Start up ssh and exec pm2 process file
ENTRYPOINT ["/entrypoint.sh"]
