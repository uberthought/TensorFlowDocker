FROM ubuntu:16.04

# install some key tools like git and vi
RUN apt-get update
RUN apt-get install -y git vim curl
RUN apt-get install -y python3-pip python3-dev python-virtualenv

# Install bazel (needed to compile tensorflow)
RUN apt-get install -y openjdk-8-jdk
RUN  echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y bazel

# Install python development libraries
RUN apt-get install -y python3-numpy python3-dev python3-pip python3-wheel

# Install other python machine learning related libraries
RUN pip3 install --upgrade pip
RUN pip3 install \
        numpy
        matplotlib \
        scipy \
        sklearn


# Install tensorflow source
WORKDIR /root
RUN git clone https://github.com/tensorflow/tensorflow

CMD ["/bin/bash"]

# this is how I built the CPU version of tensorflow

# cd tensorflow
# ./configure
# bazel build --config=opt --local_resources 2048,.5,1.0 //tensorflow/tools/pip_package:build_pip_package
# bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
# pip3 install /tmp/tensorflow_pkg/tensorflow-1.3.0-py2-none-any.whl
