ARG DOCKER_BASE_IMAGE=ros-docker-base
FROM $DOCKER_BASE_IMAGE
ARG ROS_DISTRO=kinetic

RUN apt-get update &&\
    apt-get -y install ros-kinetic-moveit  ros-kinetic-moveit-visual-tools && \ 
    apt-get install -y --only-upgrade ros-kinetic-* && \
    source /opt/ros/kinetic/setup.bash 

