#!/bin/sh

# Then, copy the newly configured system to the rootfs image
for d in bin etc lib root sbin usr; do tar c "/$d" | tar x -C /rootfs; done
for dir in dev proc run sys var; do mkdir /rootfs/${dir}; done

rm /rootfs/usr/local/bin/docker-entrypoint.sh
