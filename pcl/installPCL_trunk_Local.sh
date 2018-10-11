apt-get update && apt-get -y install \
      software-properties-common \
      libwayland-client0 \
      libset-scalar-perl \
      libgl1-mesa-dev \
      libxcursor-dev \
      libxi-dev \
      libxinerama-dev \
      libxrandr-dev

apt-get -y install \
      libflann-dev \
      libflann1.8 \
      libboost-all-dev \
      libxt-dev \
      libeigen3-dev \
      libqhull* libqhull-dev \
      mpi-default-dev openmpi-bin openmpi-common \
      libusb-1.0-0-dev freeglut3-dev doxygen graphviz

# Build dependency-VTK      
cd /home/lenty/opt && \
    wget http://www.vtk.org/files/release/7.1/VTK-7.1.0.tar.gz && \
    tar -xf VTK-7.1.0.tar.gz && \
    cd VTK-7.1.0 && mkdir build && cd build && \
    cmake .. && \
    make -j $3 && \
    make install

apt-get -y install openni2-utils

# PCL install
cd /home/lenty/opt && \
git clone http://github.com/PointCloudLibrary/pcl pcl-trunk 

cd /home/lenty/opt && \
cd pcl-trunk && mkdir build && cd build && \
apt-get -y install libopenni-dev libopenni2-dev && \
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_tools=ON -DWITH_OPENNI2=ON .. && \
make -j3

cd /home/lenty/pcl-trunk/build && \
make install && \
cd /home/lenty && \ 
echo "export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib" >> ~/.bashrc && \
echo "export CPLUS_INCLUDE_PATH=/usr/local/include/pcl-1.8:/usr/local/include/vtk-7.1:/usr/include/eigen3" >> ~/.bashrc && \
echo "export C_INCLUDE_PATH=$CPLUS_INCLUDE_PATH" >> ~/.bashrc && \
echo "export PATH=$PATH:/home/lenty/opt/pcl-trunk/build/bin" >> ~/.bashrc

apt-get update && \
apt-get install -y gdb


cd /home/lenty/opt && \
git clone http://github.com/OpenKinect/libfreenect2.git && \
cd libfreenect2 && \
apt-get install -y build-essential software-properties-common cmake pkg-config \
                   libusb-1.0-0-dev libturbojpeg libjpeg-turbo8-dev \
                   libglfw3-dev libopenni2-dev \
                   beignet-dev libva-dev libjpeg-dev && \
mkdir build && cd build && \
cmake -DCMAKE_INSTALL_PREFIX=$HOME/freenect2 -Dfreenect2_DIR=$HOME/freenect2/lib/cmake/freenect2 -DENABLE_CXX11=ON .. && \
make -j3 && \
make install

cd /home/lenty/opt/libfreenect2/build && \
make install-openni2


