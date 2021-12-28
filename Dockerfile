FROM ubuntu:20.04

WORKDIR /honeypot

RUN apt update && \
    apt install libcurl4-openssl-dev libssl-dev python3-dev build-essential curl git -y && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 - && \
    git clone https://github.com/thomaspatzke/Log4Pot.git && \
    cd Log4Pot && \
    $HOME/.poetry/bin/poetry install

WORKDIR /honeypot/Log4Pot

EXPOSE 8080

CMD $HOME/.poetry/bin/poetry run python log4pot.py --log log4j.log -p 8080



