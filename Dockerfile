#FROM gcr.io/tensorflow/tensorflow:1.5.0-py3
FROM gcr.io/tensorflow/tensorflow:latest-py3

# basic setup

RUN apt-get update

RUN apt-get install -y git vim

# setup sshd

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN useradd --create-home --shell /bin/bash tf
RUN echo "export LC_ALL=C" >> /home/tf/.bashrc
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
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
