FROM ubuntu:latest

ENV MOV_FILE_PATH /data/mov
ENV GIF_FILE_PATH /data/gif

RUN apt update && apt upgrade --assume-yes
RUN apt install --assume-yes ffmpeg gifsicle
RUN mkdir /data
RUN mkdir /data/mov
RUN mkdir /data/gif

WORKDIR /mov_to_gif

COPY ./mov_to_gif.sh .

CMD ["bash", "mov_to_gif.sh"]