FROM gcr.io/tensorflow/tensorflow:1.5.0-py3
#FROM gcr.io/tensorflow/tensorflow:latest-py3

# basic setup

RUN apt-get update

RUN apt-get install -y git vim

# setup sshd

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN useradd --create-home --shell /bin/bash tf
RUN echo "export LC_ALL=C" >> /home/tf/.bashrc
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

# ms code

RUN apt-get install -y \
	curl apt-transport-https \
	libgtk2.0-bin xterm
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get update
RUN apt-get install -y code
