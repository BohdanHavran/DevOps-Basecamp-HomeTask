FROM ubuntu:22.04

RUN apt update && \
    apt install -y inetutils-ping

ARG time=600
ENV envtime=$time

CMD ["sh", "-c", "sleep ${envtime}"]
