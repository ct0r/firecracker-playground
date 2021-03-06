# firecracker binaries
release_url="https://github.com/firecracker-microvm/firecracker/releases"
latest=$(basename $(curl -fsSLI -o /dev/null -w %{url_effective} ${release_url}/latest))
arch=$(uname -m)

rm -rf bin &&
    curl -L ${release_url}/download/${latest}/firecracker-${latest}-${arch}.tgz | tar -xz &&
    mv release-${latest} bin &&
    cd bin &&
    mv firecracker-${latest}-${arch} firecracker &&
    mv jailer-${latest}-${arch} jailer &&
    mv -- -${latest}.yaml swagger.yml

# kernel & rootfs
dest_kernel="hello-vmlinux.bin"
dest_rootfs="hello-rootfs.ext4"
image_bucket_url="https://s3.amazonaws.com/spec.ccfc.min/img"
kernel="${image_bucket_url}/hello/kernel/hello-vmlinux.bin"
rootfs="${image_bucket_url}/hello/fsfiles/hello-rootfs.ext4"

curl -fsSL -o $dest_kernel $kernel &&
    curl -fsSL -o $dest_rootfs $rootfs