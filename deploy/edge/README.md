# Kshana Station edge image

A small image with the `kshana` command alone, for a Kshana Station ([docs/STATION.md](../../docs/STATION.md))
on a Raspberry Pi (64-bit Raspberry Pi OS or Ubuntu: `linux/arm64`) or a small `linux/amd64` computer
next to the receivers. The arm64 image is cross-compiled on the build machine, not emulated.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment.

## Build

The image is not published to a registry yet; build it from a checkout:

```sh
docker buildx build -f deploy/edge/Dockerfile --platform linux/arm64 -t kshana-station-edge:arm64 --load .
docker buildx build -f deploy/edge/Dockerfile --platform linux/amd64 -t kshana-station-edge --load .
```

## Run on the device

```sh
mkdir -p station && cp deploy/helm/kshana-station/files/station.toml station/   # then edit [station] and [[source]]
head -c 24 /dev/urandom | base64 > station/token                              # the bearer token for /status
sed -i 's|token_file = .*|token_file = "/etc/kshana-station/token"|' station/station.toml
docker run -d --name kshana-station --restart unless-stopped \
  -v "$PWD/station:/etc/kshana-station:ro" -v kshana-data:/var/lib/kshana-station \
  -p 127.0.0.1:8470:8470 --device /dev/ttyACM0 kshana-station-edge
curl -s 127.0.0.1:8470/health
curl -s -H "Authorization: Bearer $(cat station/token)" 127.0.0.1:8470/status
```

Leave out `--device` for receivers on the network. The container runs as user 10001 (group `dialout`
for serial ports); the observation files go to the `kshana-data` volume.

On Kubernetes (k3s on a Pi, or any cluster), use the Helm chart [`deploy/helm/kshana-station`](../helm/kshana-station/)
or the Terraform module [`deploy/terraform/kshana-station`](../terraform/kshana-station/) with
`image` set to your pushed edge image.

## Checked in CI

`deploy-kits-e2e.yml` builds the image for `linux/amd64` and `linux/arm64`, runs `kshana station
check` in both (the arm64 one under QEMU), and runs the amd64 image against a replayed receiver stream
until `/status` reports epochs. A physical Raspberry Pi is not part of CI.
