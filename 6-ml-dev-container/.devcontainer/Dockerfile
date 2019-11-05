FROM tensorflow/tensorflow:latest-py3

ENV DEBIAN_FRONTEND=noninteractive

RUN python -m pip install -U pylint --user && \
    apt-get update && \
    apt-get install -y python3-matplotlib
    