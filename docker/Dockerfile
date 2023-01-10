FROM ubuntu

ARG FT_PROJ_NAME=ft_demo

ARG DEBIAN_FRONTEND=noninteractive
COPY build.sh /root/build.sh
RUN sh /root/build.sh $FT_PROJ_NAME
