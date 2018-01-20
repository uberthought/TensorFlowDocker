FROM ubuntu:latest

# basic setup
RUN apt-get update
RUN apt-get upgrade -y

# install python3 and tensorflow
RUN apt-get install -y python3-pip python3-dev
RUN pip3 install tensorflow

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

RUN apt-get install -y git python3-tk vim

RUN echo "export LC_ALL=C" >> /root/.bashrc
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
RUN git config --global credential.helper cache
RUN git config --global push.default simple

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# setup OpenCV

RUN apt-get install -y build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev

RUN pip3 install numpy

WORKDIR /
ENV OPENCV_VERSION="3.4.0"
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip

RUN mkdir /opencv-${OPENCV_VERSION}/cmake_binary

RUN cd /opencv-${OPENCV_VERSION}/cmake_binary \
  && cmake -DBUILD_TIFF=ON \
    -DBUILD_opencv_java=OFF \
    -DWITH_CUDA=OFF \
    -DENABLE_AVX=OFF \
    -DWITH_OPENGL=ON \
    -DWITH_OPENCL=ON \
    -DWITH_IPP=ON \
    -DWITH_TBB=ON \
    -DWITH_EIGEN=ON \
    -DWITH_V4L=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=$(python3.6 -c "import sys; print(sys.prefix)") \
    -DPYTHON_EXECUTABLE=$(which python3.6) \
    -DPYTHON_INCLUDE_DIR=$(python3.6 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
    -DPYTHON_PACKAGES_PATH=$(python3.6 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
  && make install

RUN rm /${OPENCV_VERSION}.zip \
    rm -r /opencv-${OPENCV_VERSION}

