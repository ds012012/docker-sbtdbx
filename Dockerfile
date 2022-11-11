FROM python:latest

COPY install.sh install.sh

RUN bash install.sh

USER linuxbrew

WORKDIR /home/linuxbrew

