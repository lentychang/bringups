docker build --no-cache -t gazebo:latest -f gazebo/Docker/Dockerfile.latest . && \
docker build --no-cache -t moveit:latest -f moveit/Docker/Dockerfile.latest . && \
docker build --no-cache -t pcl:latest -f pcl/Docker/Dockerfile.latest . && \
docker build --no-cache -t pythonocc -f pythonocc/Docker/Dockerfile.latest .
