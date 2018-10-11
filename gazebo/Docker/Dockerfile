ARG DOCKER_BASE_IMAGE=ros-docker-base
FROM $DOCKER_BASE_IMAGE
ARG ROS_DISTRO=kinetic

RUN cd /root && \ 
    curl -sSL http://get.gazebosim.org | sh
#RUN cd /root && \   
#    gazebo
RUN apt-get update && \
    apt-get install -y ros-${ROS_DISTRO}-gazebo9-ros-pkgs ros-${ROS_DISTRO}-gazebo9-ros-control
RUN apt-get install -y ros-${ROS_DISTRO}-controller-manager ros-${ROS_DISTRO}-ompl
RUN apt-get install -y ros-${ROS_DISTRO}-pr2-mechanism ros-${ROS_DISTRO}-ros-control ros-${ROS_DISTRO}-ros-controllers
RUN apt-get install -y ros-${ROS_DISTRO}-rqt-plot ros-${ROS_DISTRO}-rqt-graph \
                       ros-${ROS_DISTRO}-rqt-rviz ros-${ROS_DISTRO}-rqt-tf-tree 
RUN apt-get install -y ros-${ROS_DISTRO}-joint-state-controller ros-${ROS_DISTRO}-joint-trajectory-controller ros-${ROS_DISTRO}-rqt \
                       ros-${ROS_DISTRO}-rqt-controller-manager ros-${ROS_DISTRO}-rqt-joint-trajectory-controller \
                       ros-${ROS_DISTRO}-ros-control ros-${ROS_DISTRO}-rqt-gui \
                       ros-${ROS_DISTRO}-gazebo9-ros ros-${ROS_DISTRO}-kdl-conversions ros-${ROS_DISTRO}-kdl-parser \
                       ros-${ROS_DISTRO}-forward-command-controller ros-${ROS_DISTRO}-tf-conversions \
                       ros-${ROS_DISTRO}-xacro ros-${ROS_DISTRO}-joint-state-publisher ros-${ROS_DISTRO}-robot-state-publisher 
RUN cd /root/catkin_ws/src && \
    mkdir sim_device && cd sim_device && \
    git clone https://github.com/BRML/depth_sensors.git && \
    git clone https://github.com/nalt/wsg50-ros-pkg.git && \
    git clone https://github.com/IFL-CAMP/iiwa_stack.git 

RUN cd /root/catkin_ws && \
    source devel/setup.bash && catkin_make

RUN cd /root && \
    apt-get update && \ 
    apt-get install -y libxss1 libxss-dev && \
    wget -c https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb


RUN cd /root && \
    dpkg -i vscode.deb || true && \
    apt -f install -y && \
    dpkg -i vscode.deb  && \
    rm vscode.deb

RUN code --user-data-dir --install-extension austin.code-gnu-global && \
    code --user-data-dir --install-extension ms-vscode.cpptools && \
    code --user-data-dir --install-extension xaver.clang-format && \ 
    code --user-data-dir --install-extension twxs.cmake && \
    code --user-data-dir --install-extension vector-of-bool.cmake-tools && \
    code --user-data-dir --install-extension christian-kohler.path-intellisense && \
    code --user-data-dir --install-extension visualstudioexptteam.vscodeintellicode

#RUN apt-get install -y software-properties-common && \
#    add-apt-repository ppa:graphics-drivers && \ 
#    apt-get update && \
#    apt-get install -y nvidia-390    

RUN cd /root/catkin_ws/src && \
    mkdir opt && \
    cd opt && \
    git clone https://github.com/ros/joint_state_publisher.git && \
    git clone https://github.com/ros/robot_state_publisher.git && \
    git clone https://github.com/ros/robot_model.git && \
    git clone https://github.com/ros/urdf.git && \
    git clone https://github.com/ros/collada_urdf.git && \
    apt-get install -y ros-kinetic-four-wheel-steering-controller && \
    git clone https://github.com/ros-controls/ros_controllers.git && \
    cd /root/catkin_ws && \ 
    rm -r build && \
    source devel/setup.bash && catkin_make    

RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:graphics-drivers && \ 
    apt-get update && \ 
    apt-get install -y nvidia-384
