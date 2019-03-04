FROM mengqingyang/todobackend-base:latest
MAINTAINER Mengqing Yang

COPY target /wheelhouse

RUN . /appenv/bin/activate && \
    pip install --no-index -f /wheelhouse todobackend && \
    rm -rf /wheelhouse