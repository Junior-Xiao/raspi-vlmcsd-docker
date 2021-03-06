FROM multiarch/alpine:armv7-edge as builder
WORKDIR /root
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Junior-Xiao/vlmcsd.git && \
    cd vlmcsd/ && \
    make

FROM multiarch/alpine:armv7-edge
WORKDIR /root/
COPY --from=builder /root/vlmcsd/bin/vlmcsd /usr/bin/vlmcsd
EXPOSE 1688/tcp
CMD [ "/usr/bin/vlmcsd", "-D", "-d" ]
