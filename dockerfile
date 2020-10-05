FROM ubuntu:18.04 AS base

# Install needed software
RUN apt update -y && apt upgrade -y && apt-get install -y nano git unzip zip wget automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev

# Copy scripts files
WORKDIR /usr/libexec/
COPY ./scripts/ ./veriumminer/
RUN find ./veriumminer/ -type f -iname "*.sh" -exec chmod +x {} \;

##############################################
### Starting new container for building
FROM base AS build

# Git Clone
WORKDIR /root/git/
#RUN git clone -v https://github.com/fireworm71/veriumMiner ~/git/veriumminer/
RUN git clone -v https://github.com/VeriConomy/veriumMiner ~/git/veriumminer/

# Build veriumminer
WORKDIR /root/git/veriumminer/
RUN ./build.sh
RUN ./autogen.sh
RUN ./configure CFLAGS= --with-crypto --with-curl
RUN make -j4
RUN mkdir -p /app/publish
RUN cp cpuminer /app/publish

##############################################
### Starting new container for publish
FROM base AS publish

#copy from build
COPY --from=build /app/publish /usr/bin/

# Add entrypoint
ENTRYPOINT ["/usr/libexec/veriumminer/startup.sh"]
