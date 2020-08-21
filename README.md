# bringups
ROS system bringups for simlulation env for robot assembly task

# Installation regarding OpenGL
Since Gazebo utilize OpenGL to render. Be sure you have install correct version of openGL regarding your GPU. Also check your nvidia driver version on host with `nvidia-smi`. You need to install the same version of `libnvidia-gl-xxx`

## docker images  
Use the rebuildAll.sh to build some of images below
- ros  
    env for roscore
- pcl  
    env for ros_pcl
- gazebo  
    simulation env for sim_devices pkg
- moveit 
    env for sim_devices pkg
- pythonocc
    env for rel_pose_ext pkg
- kinetic2  
