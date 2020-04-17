FROM golang:1.14-buster

RUN apt-get update && apt-get install libgeos-dev -y && cp /usr/lib/x86_64-linux-gnu/libgeos-3.7.1.so /usr/lib/x86_64-linux-gnu/libgeos.so
ENV workdir /build
WORKDIR $workdir
COPY . .

VOLUME ["/data"]
WORKDIR /data
COPY . .
CMD ["/bin/bash"]

RUN go get github.com/cockroachdb/cockroach/pkg/cmd/geoviz && go install -v github.com/cockroachdb/cockroach/pkg/cmd/geoviz
CMD ["geoviz", "--geo_libs=/usr/lib/x86_64-linux-gnu/"]
