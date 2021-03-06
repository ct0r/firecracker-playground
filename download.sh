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
