FROM python:3.7-alpine
MAINTAINER "handson user" <>
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN apk add --no-cache --virtual .build-deps ca-certificates gcc mysql-dev linux-headers musl-dev libffi-dev jpeg-dev zlib-dev \
    && pip install -r requirements.txt
ADD app.py /code/