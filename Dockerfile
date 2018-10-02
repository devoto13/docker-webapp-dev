FROM ubuntu:18.04

MAINTAINER Yaroslav Admin "yaroslav.admin@softwerk.se"

# Install helper packages
RUN apt-get update && apt-get install -y curl gnupg

# Add Yarn repo
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list

# Add Google Chrome repo
RUN curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Add Node.js repo
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Install dependencies
RUN apt-get install -y git nodejs=10.11.0-1nodesource1 yarn=1.10.1-1 google-chrome-stable=69.0.3497.100-1

# Create volume for Yarn cache
VOLUME /usr/local/share/.cache/yarn/v2

# Configure working directory
WORKDIR /usr/src/app

CMD ["sleep", "365d"]
