FROM tensorflow/tensorflow:latest-gpu-py3

# Install base packages
RUN apt-get update && apt-get install -y \
  git \
  sudo \
  curl \
  build-essential \
  software-properties-common \
  cmake \
  python3-pip \
  p7zip-full \
  nano \
  wget \
  unzip \
  default-jdk \
  ffmpeg \
  libsndfile-dev

WORKDIR /root

COPY src src

# pip stuff
RUN pip3 install --upgrade pip
RUN pip3 install -U setuptools
RUN pip3 install -r src/requirements.txt
RUN pip3 install tensorflow-gpu
RUN pip3 install protobuf

WORKDIR "/root/src"