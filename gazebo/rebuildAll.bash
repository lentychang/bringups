enable_nvidia=false
IMG_NAME=lentychang/gazebo
docker build --build-arg ENABLE_NVIDIA=${enable_nvidia} -t ${IMG_NAME}:base -f Docker/Dockerfile.base .
docker build -t ${IMG_NAME}:latest -f Docker/Dockerfile.latest .
