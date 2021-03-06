# make sure firecracker can create its API socket
rm -f /tmp/firecracker.socket

# then, start firecracker
bin/firecracker --api-sock /tmp/firecracker.socket --config-file config.json

