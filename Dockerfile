FROM ubuntu:16.04
MAINTAINER Arnis Lielturks <arnis@example.com>

# Install all the dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y libgl1-mesa-dev git cmake g++ libx11-dev gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 binutils-mingw-w64-x86-64 \
    && apt-get purge --auto-remove -y && apt-get clean

# Clone the repo and build linux and windows versions
RUN git clone https://github.com/Urho3D/Urho3D.git && \
    cd Urho3D && \
    bash script/cmake_generic.sh build -DURHO3D_SAMPLES=0 -DURHO3D_TOOLS=0 && \
    bash script/cmake_mingw.sh build-windows -DURHO3D_SAMPLES=0 -DURHO3D_TOOLS=0 -DMINGW_PREFIX=/usr/bin/x86_64-w64-mingw32 -DDIRECTX_LIB_SEARCH_PATHS=/usr/bin/x86-w64-mingw32/lib && \
    cd build-windows && make -j $(nproc) && \
    cd .. && \
    cd build && make -j $(nproc) && \
    cd ..

WORKDIR /var/source
