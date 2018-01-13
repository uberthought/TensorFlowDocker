FROM tensorflow/tensorflow:latest-py3

# setup SSHD
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
#RUN echo 'root:qwerty' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "export LC_ALL=C" >> /root/.bashrc

RUN apt-get install -y git python3-tk

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
