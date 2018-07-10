ARG DOCKER_BASE_IMAGE=ros:kinetic-robot
FROM $DOCKER_BASE_IMAGE

ARG ROS_DISTRO=kinetic

ENV DEBIAN_FRONTEND noninteractive

#default behaviour
ENV WAIT_FOR_ROSCORE 0
ENV WAIT_FOR_CONFIG_MANAGER 0

#use bash shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#install system stuff
RUN apt-get clean && \
    apt-get update && apt-get -y install \
    htop \
    build-essential \
    apt-utils \
    python-pip \
    python-ipdb \
    ssh \
    git \
    terminator \
    vim \
    wget \
    curl \
    ros-$ROS_DISTRO-rqt-tf-tree \
    ros-$ROS_DISTRO-node-manager-fkie \
    ros-$ROS_DISTRO-mongodb-store && \

# create catkin_ws
    source /opt/ros/$ROS_DISTRO/setup.bash && \
    mkdir -p /root/catkin_ws/src/prj-iki-robotics && \
    cd /root/catkin_ws/src && \
    catkin_init_workspace && \
    cd /root/catkin_ws && \
    catkin_make && \
    echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc && \

# axcli to trigger actions
    cd /root/catkin_ws/src && \
    git clone https://github.com/po1/axcli.git

RUN apt-get -y install bash-completion ros-$ROS_DISTRO-rviz && \

# https://wiki.ubuntuusers.de/Bash/Prompt/
    echo "PS1='🐳  \[\033[1;36m\]\h \[\033[1;34m\]\W\[\033[0;35m\] \[\033[1;36m\]# \[\033[0m\]'" >> /root/.bashrc

