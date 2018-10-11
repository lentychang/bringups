ARG DOCKER_BASE_IMAGE=ros-docker-base
FROM $DOCKER_BASE_IMAGE
ARG ROS_DISTRO=kinetic

RUN cd /root && \
    git clone https://github.com/OpenKinect/libfreenect2.git && \
    cd libfreenect2 && \
    apt-get install -y build-essential software-properties-common cmake pkg-config \
      libusb-1.0-0-dev libturbojpeg libjpeg-turbo8-dev \ 
      libglfw3-dev libopenni2-dev \
    # for intel gpu
    beignet-dev libva-dev libjpeg-dev && \
   
    mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2 -Dfreenect2_DIR=$HOME/freenect2/lib/cmake/freenect2 -DENABLE_CXX11=ON && \
    make -j3 && \
    make install

RUN apt-get -y install openni2-utils && \
    cd /root/libfreenect2/build && \
    make install-openni2 

RUN add-apt-repository ppa:floe/beignet && apt-get update;exit 0 && \ 
RUN apt-get -y install beignet opencl-headers


RUN cd /root/catkin_ws/src/ && \
    git clone https://github.com/code-iai/iai_kinect2.git && \
    cd iai_kinect2 && \
    rosdep install -y -r --from-paths .
RUN cd /root/catkin_ws && \
    source devel/setup.bash && \
    catkin_make -DCMAKE_BUILD_TYPE="Release"
