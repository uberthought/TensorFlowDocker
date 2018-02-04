FROM ubuntu:latest

# basic setup

RUN apt-get update --fix-missing
RUN apt-get upgrade -y

RUN apt-get install -y git vim

# install python3

RUN apt-get install -y python3-pip python3-dev python3-tk
RUN pip3 install --upgrade pip

# install tensorflow

RUN pip3 install tensorflow

# setup sshd

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN useradd --create-home --shell /bin/bash tf
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# setup Pillow

RUN apt-get install -y imagemagick

RUN pip3 install \
  numpy \
  pillow

# setup matplotlib

RUN apt-get install -y python3-matplotlib

# ffmpeg

RUN apt-get install -y ffmpeg

# av

RUN apt-get install pkg-config \
  libavformat-dev libavcodec-dev libavdevice-dev \
  libavutil-dev libswscale-dev libavresample-dev
RUN pip3 install av