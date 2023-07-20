FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ssh_key

# Update apt-get
RUN apt-get update -yqq

# Intall tools
RUN apt-get install -y \
    curl \
    gradle \
    git \
    htop \
    libcurl4-openssl-dev \
    locales \
    make \
    openjdk-8-jdk \
    openssh-client \
    unzip \
    vim \
    wget \
    zip \
    zsh

# Clean up apt-get
RUN apt-get clean

# Trick out zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Copy ssh key into container
WORKDIR /root
RUN mkdir /root/.ssh
RUN echo "$ssh_key" > /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

CMD ["zsh"]