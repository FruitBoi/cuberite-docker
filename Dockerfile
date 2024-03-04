FROM ubuntu as build

RUN apt-get update 
RUN apt-get install -y git make cmake clang python3 gcc 
WORKDIR /build

RUN git clone --recursive https://github.com/cuberite/cuberite.git .

WORKDIR /build/build
RUN cmake -DCMAKE_BUILD_TYPE=RELEASE -DDISABLE_SYSTEM_LUA=1 -DWHOLE_PROGRAM_OPTIMISATION=1 -DNO_NATIVE_OPTIMIZATION=1 .. && make -j$(nproc) && mkdir /cuberite && cp -Lr /build/build/Server/* /cuberite

FROM ubuntu as final
WORKDIR /
COPY --from=build /cuberite /cuberite

WORKDIR /data

COPY entry.sh /entry.sh

EXPOSE 8080/tcp
EXPOSE 25565/tcp
ENTRYPOINT ["sh", "/entry.sh"]
