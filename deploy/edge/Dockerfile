# Kshana Station edge image (roadmap 0.42 I10): the kshana command alone on a slim base, for a Raspberry Pi
# (64-bit OS, linux/arm64) or any small amd64 box wired to receivers. Build from the repository root:
#   docker buildx build -f deploy/edge/Dockerfile --platform linux/arm64,linux/amd64 -t kshana-station-edge .
# The build stage runs on the build machine's own architecture and cross-compiles for the target (no
# emulation), so an arm64 image builds as fast as an amd64 one.
# Advisory software, not type-approved navigation or timing equipment.
# Base images are pinned by digest (the multi-architecture index), the same pins as deploy/reference-build.
FROM --platform=$BUILDPLATFORM rust:1-slim-bookworm@sha256:2c3a22f0a5533ea2dd5a16627bc841228151faa2d4de2644ac9987e4a2f1f2fa AS build
ARG TARGETARCH
WORKDIR /src
RUN set -eu; \
    case "$TARGETARCH" in \
      amd64) echo x86_64-unknown-linux-gnu > /target ;; \
      arm64) echo aarch64-unknown-linux-gnu > /target; \
             apt-get update; apt-get install -y --no-install-recommends gcc-aarch64-linux-gnu libc6-dev-arm64-cross; \
             rm -rf /var/lib/apt/lists/* ;; \
      *) echo "unsupported TARGETARCH $TARGETARCH (amd64 or arm64)" >&2; exit 1 ;; \
    esac; \
    rustup target add "$(cat /target)"
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc \
    CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc \
    CARGO_PROFILE_RELEASE_STRIP=symbols \
    CARGO_PROFILE_RELEASE_DEBUG=0
COPY . .
RUN cargo build --release --locked --bin kshana --target "$(cat /target)" \
 && cp "target/$(cat /target)/release/kshana" /kshana

FROM debian:bookworm-slim@sha256:7c7b2c966bc9ee8cedfeef67e0e279108992c77681fa595db4a9d65c06ccc587
# The version below is checked against the engine's by scripts/check-version-sync.sh.
LABEL org.opencontainers.image.version="0.41.0" \
      org.opencontainers.image.title="kshana-station-edge" \
      org.opencontainers.image.description="Kshana Station for edge devices: reads GNSS receiver streams into kshana.obs/1 files and reports on a status port. Advisory software, not type-approved equipment." \
      org.opencontainers.image.source="https://github.com/ashfordeOU/kshana" \
      org.opencontainers.image.licenses="AGPL-3.0-only"
COPY --from=build /kshana /usr/local/bin/kshana
# A fixed numeric user (Kubernetes runAsNonRoot can check it), in dialout for serial receivers.
RUN groupadd --system --gid 10001 kshana \
 && useradd --system --uid 10001 --gid 10001 --home /var/lib/kshana-station --create-home kshana \
 && usermod -aG dialout kshana \
 && mkdir -p /etc/kshana-station
USER 10001:10001
WORKDIR /var/lib/kshana-station
# The status port (docs/STATION.md); listen on 0.0.0.0:8470 with a token_file inside a container.
EXPOSE 8470
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD bash -c 'exec 3<>/dev/tcp/127.0.0.1/8470' || exit 1
ENTRYPOINT ["/usr/local/bin/kshana"]
CMD ["station", "run", "/etc/kshana-station/station.toml"]
