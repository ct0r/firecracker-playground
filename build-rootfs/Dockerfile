FROM alpine

RUN apk --no-cache add --update openrc util-linux

RUN mkdir /rootfs

# Set up a login terminal on the serial console (ttyS0)
RUN ln -s agetty /etc/init.d/agetty.ttyS0 \
    && echo ttyS0 > /etc/securetty \
    && rc-update add agetty.ttyS0 default

# Make sure special file systems are mounted on boot
RUN rc-update add devfs boot \
    && rc-update add procfs boot \
    && rc-update add sysfs boot

VOLUME /rootfs

COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]
