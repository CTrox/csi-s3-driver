#!/usr/bin/env bash
export MINIO_ACCESS_KEY=FJDSJ
export MINIO_SECRET_KEY=DSG643HGDS
export DEPCACHEDIR=$GOPATH/src/github.com/ctrox/csi-s3/.dep

mkdir -p /tmp/minio
minio server --quiet /tmp/minio &>/dev/null &
sleep 5
cd $GOPATH/src/github.com/ctrox/csi-s3
if [ ! -d ./vendor ]; then dep ensure -vendor-only; fi
go test github.com/ctrox/csi-s3/pkg/s3 -cover
