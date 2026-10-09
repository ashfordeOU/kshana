# Container option for the Kshana trust monitor. Build from the repository root:
#   docker build -f deploy/reference-build/Dockerfile -t kshana-trust .
# Advisory software, not type-approved equipment: the operator stays responsible for navigation.
FROM rust:1-slim-bookworm AS build
WORKDIR /src
COPY . .
RUN cargo build --release --locked --bin kshana

FROM node:22-slim
# node is only for the optional TCP relay (OpenCPN); the monitor itself is a static-ish Rust binary.
COPY --from=build /src/target/release/kshana /usr/local/bin/kshana
COPY integrations/opencpn/nmea-tcp-relay.mjs /opt/kshana/nmea-tcp-relay.mjs
RUN useradd --system --home /var/lib/kshana --create-home kshana && usermod -aG dialout kshana
USER kshana
WORKDIR /var/lib/kshana
# Default: the advisory monitor on stdin (the receiver's NMEA), JSON lines on stdout.
ENTRYPOINT ["/usr/local/bin/kshana", "receiver-trust", "live"]
CMD ["/etc/kshana/session.toml"]
