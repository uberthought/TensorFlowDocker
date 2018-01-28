FROM ubuntu:latest

# basic setup

RUN apt-get update
RUN apt-get upgrade -y

# install python3

RUN apt-get install -y python3-pip python3-dev
RUN pip3 install --upgrade pip

# install tensorflow

RUN pip3 install tensorflow

# setup sshd

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
#RUN echo 'root:qwerty' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get install -y git python3-tk vim

RUN echo "export LC_ALL=C" >> /root/.bashrc
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
RUN git config --global credential.helper cache
RUN git config --global push.default simple

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# setup Pillow

RUN apt-get install -y imagemagick

RUN pip3 install \
  numpy \
  pillow

# setup matplotlib

RUN apt-get install -y python3-matplotlib