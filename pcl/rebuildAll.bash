enable_nvidia=false
IMG_NAME=pcl
docker build --build-arg ENABLE_NVIDIA=${enable_nvidia} -t ${IMG_NAME}:base -f Docker/Dockerfile.base .
docker build -t ${IMG_NAME}:ide -f Docker/Dockerfile.ide .
docker build -t ${IMG_NAME}:latest -f Docker/Dockerfile.latest .
