# Container option for the Kshana trust gate. Build from the repository root:
#   docker build -f deploy/reference-build/Dockerfile -t kshana-trust-gate .
# Advisory software, not type-approved equipment: the operator stays responsible for navigation.
FROM rust:1-slim-bookworm AS build
WORKDIR /src
COPY . .
RUN cargo build --release --locked --bin kshana

FROM debian:bookworm-slim
# The version below is the one place the image's version is written (read by the version-sync check).
LABEL org.opencontainers.image.version="0.35.0" \
      org.opencontainers.image.title="kshana-trust-gate" \
      org.opencontainers.image.description="Kshana receiver-trust gate: serves gated NMEA 0183 with a $PKSHT trust sentence over TCP. Advisory software, not type-approved equipment." \
      org.opencontainers.image.source="https://github.com/ashfordeOU/kshana" \
      org.opencontainers.image.licenses="AGPL-3.0-only"
COPY --from=build /src/target/release/kshana /usr/local/bin/kshana
COPY deploy/reference-build/docker-entrypoint.sh /usr/local/bin/kshana-entrypoint
RUN useradd --system --home /var/lib/kshana --create-home kshana && usermod -aG dialout kshana
USER kshana
WORKDIR /var/lib/kshana
# The gate serves the gated stream on 10110 inside the container; publish it to loopback on the host.
EXPOSE 10110
# Input and session come from environment variables, see docker-entrypoint.sh.
ENTRYPOINT ["/usr/local/bin/kshana-entrypoint"]
