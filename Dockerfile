FROM ubuntu:18.04

ARG ssh_key

# Update apt-get
RUN dpkg --add-architecture i386
RUN apt-get update -yqq

# Intall tools
RUN apt-get install -y \
    curl \
    gradle \
    git \
    htop \
    libc6:i386 \
    libgcc1:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    locales \
    make \
    openjdk-8-jdk \
    openssh-client \
    unzip \
    vim \
    wget \
    zip \
    zlib1g:i386 \ 
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

# Install Kotlin
COPY install_kotlin.sh install_kotlin.sh
RUN bash install_kotlin.sh

CMD ["zsh"]