# Downloads latest zig main branch release and links to it in bin
FROM alpine:latest

RUN apk update && \
    apk add git && \
    apk add grep && \
    apk add jq && \
    apk add curl && \
    apk add wget && \
    wget -O zig.tar.xz $(curl https://ziglang.org/download/index.json | jq .master.\"x86_64-linux\".tarball -r) && \
    mkdir /zig && tar -xf zig.tar.xz -C /zig --strip-components 1 && \
    ln -s /zig/zig /bin/zig

# Build using something like
# docker build -t zigedge:latest
# Run using something like
# docker run zigedge:latest
