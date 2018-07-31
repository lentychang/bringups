ARG DOCKER_BASE_IMAGE=ros-docker-base
FROM $DOCKER_BASE_IMAGE

ARG ROS_DISTRO=kinetic

#default behaviour
ENV WAIT_FOR_ROSCORE 0
ENV WAIT_FOR_CONFIG_MANAGER 0

#use bash shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN cd /root/catkin_ws/src && \
    git clone https://github.com/nalt/wsg50-ros-pkg.git && \ 
    cd  /root/catkin_ws && \
    source devel/setup.bash && \
    catkin_make
