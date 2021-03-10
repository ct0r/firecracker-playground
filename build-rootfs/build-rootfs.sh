rm -rf tmp &&
    rm -rf /tmp/rootfs &&
    mkdir tmp &&
    dd if=/dev/zero of=tmp/rootfs.ext4 bs=1M count=50 &&
    mkfs.ext4 tmp/rootfs.ext4 &&
    mkdir /tmp/rootfs &&
    sudo mount tmp/rootfs.ext4 /tmp/rootfs &&

    # Docker
    podman build -t firecracker-rootfs . &&
    podman run \
        --name firecracker-rootfs \
        -v /tmp/rootfs:/rootfs \
        firecracker-rootfs &&

    # Clean it up!
    podman rm firecracker-rootfs &&
    podman rmi firecracker-rootfs
    sudo umount /tmp/rootfs