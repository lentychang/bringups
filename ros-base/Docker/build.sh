#!/bin/bash
docker build -f Dockerfile -t lentychang/ros-base:base .
#docker build -f Dockerfile.user --build-arg USER=$USER --build-arg PW=iloveyen --build-arg UID=1002  -t ros-base:user .
