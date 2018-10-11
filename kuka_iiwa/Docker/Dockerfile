ARG DOCKER_BASE_IMAGE=ros-docker-base
FROM $DOCKER_BASE_IMAGE
ARG ROS_DISTRO=kinetic

RUN cd /root/catkin_ws && \
    apt-get update && \
    apt-get install -y python-catkin-tools && \
    git clone https://github.com/SalvoVirga/iiwa_stack.git src/iiwa_stack && \
    rosdep install --from-paths src --ignore-src -r -y && \
    source devel/setup.bash && \
    catkin_make
   

