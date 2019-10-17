#!/bin/bash
# usage: bash init_build.sh \[true\|false\]
echo argv\[1\] ENABLE_NVIDIA to install nvidia driver, here nvidia-384
enable_nvidia=$1
imgname_prefix=lentychang/
ROS_DISTRO=melodic
docker build --build-arg ENABLE_NVIDIA=$enable_nvidia -t ${imgname_prefix}ros-base:${ROS_DISTRO} -f ros-base/Docker/Dockerfile . 
docker build --build-arg ENABLE_NVIDIA=$enable_nvidia -t ${imgname_prefix}gazebo:base -f gazebo/Docker/Dockerfile.base . 
docker build -t ${imgname_prefix}gazebo:ide -f gazebo/Docker/Dockerfile.ide . 
docker build -t ${imgname_prefix}gazebo:latest -f gazebo/Docker/Dockerfile.latest . 
docker build --build-arg ENABLE_NVIDIA=$enable_nvidia -t ${imgname_prefix}moveit:base -f moveit/Docker/Dockerfile.base . 
docker build -t ${imgname_prefix}moveit:ide -f moveit/Docker/Dockerfile.ide . 
docker build -t ${imgname_prefix}moveit:latest -f moveit/Docker/Dockerfile.latest . 
docker build -t ${imgname_prefix}miniconda:python3.7 -f conda/Dockerfile.python3 .
docker build --build-arg ENABLE_NVIDIA=$enable_nvidia -t ${imgname_prefix}pythonocc:base -f pythonocc/Docker/Dockerfile.base . 
docker build -t ${imgname_prefix}pythonocc:ide -f pythonocc/Docker/Dockerfile.ide . 
docker build -t ${imgname_prefix}pythonocc:latest -f pythonocc/Docker/Dockerfile.latest . 
docker build --build-arg ENABLE_NVIDIA=$enable_nvidia -t ${imgname_prefix}pcl:base -f pcl/Docker/Dockerfile.base .
docker build -t ${imgname_prefix}pcl:ide -f pcl/Docker/Dockerfile.ide .
docker build -t ${imgname_prefix}pcl:latest -f pcl/Docker/Dockerfile.latest .
