FROM ubuntu:focal

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential libxml2-dev python3-dev python3-pip zlib1g-dev python3-requests git jq python3-aiohttp nodejs npm cpio && \
    python3 -m pip install --upgrade pip 

COPY . /app
WORKDIR /app

RUN make build
RUN pip install build

ENTRYPOINT ["cellxgene"]
