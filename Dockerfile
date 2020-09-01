FROM node:14.3.0-buster-slim

# Install helper packages
RUN apt-get update && apt-get install -y curl apt-transport-https gnupg procps

# Add Google Chrome repo
RUN curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install dependencies
RUN apt-get update && apt-get install -y git google-chrome-stable=85.0.4183.83-1

# Create volume for Yarn cache
VOLUME /usr/local/share/.cache/yarn/v6

# Configure working directory
WORKDIR /usr/src/app

CMD ["sleep", "365d"]
