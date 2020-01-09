FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get -y install \
        build-essential \
	cmake \
	curl \
	g++ \
	git \
	libglew-dev \
	libglew2.0 \
	libglfw3 \
	libglfw3-dev \
	libopenimageio-dev \
	libopenimageio1.7 \
	libxcursor-dev \
	libxcursor1 \
	libxi-dev \
	libxi6 \
	libxinerama-dev \
	libxinerama1 \
	libxrandr-dev \
	libxrandr2 \
	pyside-tools \
	python \
	python-dev \
	python-opengl \
	python-pyside \
	python3-opengl \
	python3-pyside \
	python3.7 \
	python3.7-dev \
	zlib1g-dev \
	zlibc && \
    apt-get -y autoclean && \
    apt-get -y autoremove

COPY ./USD /opt/USD
WORKDIR /opt/USD

ENV PATH=/opt/USD-inst/bin:${PATH}
ENV PYTHONPATH=/opt/USD-inst/lib/python:${PYTHONPATH}

CMD [ "/bin/bash" ]

