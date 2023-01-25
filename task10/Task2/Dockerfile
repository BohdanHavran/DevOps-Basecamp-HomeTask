FROM ubuntu:22.04

RUN apt update && \
    apt install -y inetutils-ping

ARG time=600
ENV time=$time

ENTRYPOINT ["sleep"]
CMD ["$time"] 
