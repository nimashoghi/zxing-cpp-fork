FROM debian:slim

RUN apt-get update \
    && apt-get install --no-install-recommends \
    build-essential cmake

WORKDIR /app/zxing-cpp
COPY . .
RUN mkdir -p build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make -j \
    && make install
