#!/bin/bash

image="focal-server-cloudimg-amd64"
if [ ! -f "${image}.img" ]; then
    wget https://cloud-images.ubuntu.com/daily/server/focal/current/${image}.img
fi
if [ ! -f "${image}.raw" ]; then
    qemu-img convert "./${image}.img" -O raw "./${image}.raw"
fi
if [ ! -f "${image}.raw.gz" ]; then
    gzip "./${image}.raw"
fi
