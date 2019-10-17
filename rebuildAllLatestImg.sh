docker build --no-cache -t lentychang/gazebo:latest -f gazebo/Docker/Dockerfile.latest . && \
docker build --no-cache -t lentychang/moveit:latest -f moveit/Docker/Dockerfile.latest . && \
docker build --no-cache -t lentychang/pcl:latest -f pcl/Docker/Dockerfile.latest . && \
docker build --no-cache -t lentychang/pythonocc -f pythonocc/Docker/Dockerfile.latest .
