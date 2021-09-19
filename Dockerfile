FROM alpine:3.13.6

RUN apk add python3 py3-pip zeromq-dev

# Install dependecies nedded for jupyter
RUN apk add bash bzip2 ca-certificates curl file gcc g++ git libressl \
    libsodium-dev make openssh-client patch readline-dev tar tini wget \
    python3-dev libffi-dev

WORKDIR /app
COPY requirements.txt .

# Install python dependencies
RUN pip3 install -r requirements.txt

WORKDIR /notebooks
VOLUME /notebooks

EXPOSE 80 443/TCP

ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/notebooks"]