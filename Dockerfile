FROM ubuntu:latest

# basic setup
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git vim

# setup sshd
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN useradd --create-home --shell /bin/bash tf
RUN echo "export LC_ALL=C" >> /home/tf/.bashrc
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# python3
RUN apt-get update
RUN apt-get install -y \
  python3 \
  python3-pip
RUN pip3 install --upgrade pip

# tensorflow
RUN pip3 install tensorflow

# Pillow
RUN apt-get update
RUN apt-get install -y imagemagick
RUN pip3 install \
  numpy \
  pillow

# matplotlib
RUN apt-get update
RUN apt-get install -y python3-matplotlib

# ffmpeg
RUN apt-get update
RUN apt-get install -y ffmpeg

# dash
RUN pip3 install dash
RUN pip3 install dash-renderer
RUN pip3 install dash-html-components
RUN pip3 install dash-core-components
RUN pip3 install plotly --upgrade
EXPOSE 8050
