FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl
RUN apt-get autoremove

COPY _output/sandbox /my-echo

EXPOSE 1323

ENTRYPOINT ["/my-echo"]
