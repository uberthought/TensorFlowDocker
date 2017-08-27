FROM gcr.io/tensorflow/tensorflow

RUN apt-get update
RUN apt-get install -y git vim
RUN apt-get install -y python3-pip python3-dev python-virtualenv

RUN pip3 install --upgrade pip
RUN pip3 install \
        matplotlib \
        numpy \
        scipy \
        sklearn
RUN python3 -V

# Install TensorFlow CPU version from central repo
RUN pip3 install tensorflow

