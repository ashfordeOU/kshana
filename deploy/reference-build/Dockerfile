# Container option for the Kshana trust gate. Build from the repository root:
#   docker build -f deploy/reference-build/Dockerfile -t kshana-trust-gate .
# Advisory software, not type-approved equipment: the operator stays responsible for navigation.
# Base images are pinned by digest (the multi-architecture index), so a rebuild does not silently change. The digests were
# read on 2026-10-10 from a public Docker Hub mirror (mirror.gcr.io), not from Docker Hub itself: check them against
# `docker buildx imagetools inspect <tag>` before relying on them, and refresh them deliberately.
FROM rust:1-slim-bookworm@sha256:2c3a22f0a5533ea2dd5a16627bc841228151faa2d4de2644ac9987e4a2f1f2fa AS build
WORKDIR /src
COPY . .
RUN cargo build --release --locked --bin kshana

FROM debian:bookworm-slim@sha256:7c7b2c966bc9ee8cedfeef67e0e279108992c77681fa595db4a9d65c06ccc587
# The version below is the one place the image's version is written (read by the version-sync check).
LABEL org.opencontainers.image.version="0.35.0" \
      org.opencontainers.image.title="kshana-trust-gate" \
      org.opencontainers.image.description="Kshana receiver-trust gate: serves gated NMEA 0183 with a \$PKSHT trust sentence over TCP. Advisory software, not type-approved equipment." \
      org.opencontainers.image.source="https://github.com/ashfordeOU/kshana" \
      org.opencontainers.image.licenses="AGPL-3.0-only"
COPY --from=build /src/target/release/kshana /usr/local/bin/kshana
COPY deploy/reference-build/docker-entrypoint.sh /usr/local/bin/kshana-entrypoint
RUN useradd --system --home /var/lib/kshana --create-home kshana && usermod -aG dialout kshana
USER kshana
WORKDIR /var/lib/kshana
# The gate serves the gated stream on 10110 inside the container, bound to all of the container's own addresses
# (0.0.0.0) so that a published port reaches it; publish it to loopback on the host (-p 127.0.0.1:10110:10110).
EXPOSE 10110
# Healthy while the gate accepts a connection on its listen port (the port in KSHANA_LISTEN, else 10110).
HEALTHCHECK --interval=30s --timeout=3s --start-period=15s --retries=3 \
  CMD bash -c 'p="${KSHANA_LISTEN##*:}"; exec 3<>/dev/tcp/127.0.0.1/${p:-10110}' || exit 1
# Input and session come from environment variables, see docker-entrypoint.sh.
ENTRYPOINT ["/usr/local/bin/kshana-entrypoint"]
