FROM gcr.io/tensorflow/tensorflow

RUN apt-get update
RUN apt-get install -y git vim
RUN apt-get install -y python3-pip python3-dev python-virtualenv

RUN pip3 install --upgrade pip
RUN pip3 install \
        numpy

#        matplotlib \
#        scipy \
#        sklearn
#RUN python3 -V

# Install TensorFlow CPU version from central repo
RUN pip3 install tensorflow

#CMD ["/bin/bash"]

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:qwerty' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
