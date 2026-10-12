# syntax=docker/dockerfile:1
# OCI image for the kshana-mcp Model Context Protocol server.
#
# The build context MUST be the repository ROOT, because this crate depends on the
# sibling `kshana` crate via a relative path (`kshana = { path = "../.." }`):
#
#   docker build -f mcp/kshana-mcp/Dockerfile -t kshana-mcp .
#
# Run it (stdio transport — the MCP client speaks JSON-RPC over stdin/stdout):
#
#   docker run --rm -i ghcr.io/ashfordeou/kshana-mcp
#
# ---- build stage -----------------------------------------------------------------
# Pinned to the SAME compiler as rust-toolchain.toml (channel = "1.93.0") rather than
# the floating `rust:1-slim-bookworm`, which resolves to whatever the newest stable 1.x
# is that morning — 1.98.1 as of this writing. The floating tag was not producing a
# 1.98.1 binary, because `COPY . .` below brings rust-toolchain.toml into /src and
# rustup honours it; it was quietly downloading a second toolchain on every build, on
# both architectures, with the arm64 leg under QEMU. Pinning the base makes the two
# agree, so the image is built by the reviewed compiler with nothing to fetch. Keep
# rust-toolchain.toml in the build context: it is the belt to this tag's braces, and
# mcp-publish.yml runs no toolchain gate that would catch the two drifting apart.
# The slim image carries the C linker the build needs. The server is self-contained
# (it links the `kshana` library and runs scenarios in-process), and nothing in the
# graph needs system libraries — pure Rust + stdio.
# Both bases are pinned by multi-arch INDEX digest as well as tag, so a re-push of the tag
# cannot change what gets built. Dependabot's docker ecosystem (.github/dependabot.yml,
# directory /mcp/kshana-mcp) proposes the digest bumps, so the OS layers still receive
# security updates — through a reviewed PR instead of silently.
FROM rust:1.93.0-slim-bookworm@sha256:776861219cd851131c1cec3bbd7cbeb16b99a794048097eb69ad9682a8ed0d57 AS build
WORKDIR /src
COPY . .
WORKDIR /src/mcp/kshana-mcp
RUN cargo build --release --locked && strip target/release/kshana-mcp

# ---- runtime stage ---------------------------------------------------------------
# bookworm-slim matches the builder's glibc (2.36), so the dynamically linked binary
# runs as-is. No extra packages: over stdio the server makes no network calls; with
# `--http` it only listens (see docs/deploy/mcp-http.md).
FROM debian:bookworm-slim@sha256:3783cc01769c7b2b1b83a5c5ad96c815348e28ed7da68e2e3687004faa906251 AS runtime

# Ownership marker that links this image to its entry in the official MCP registry.
# The registry reads this label to verify `server.json` ↔ image ownership.
LABEL io.modelcontextprotocol.server.name="io.github.ashfordeOU/kshana-mcp"
LABEL org.opencontainers.image.title="kshana-mcp"
LABEL org.opencontainers.image.description="MCP server exposing the validated Kshana PNT-resilience simulator to AI agents."
LABEL org.opencontainers.image.source="https://github.com/ashfordeOU/kshana"
LABEL org.opencontainers.image.url="https://kshana.dev"
LABEL org.opencontainers.image.licenses="AGPL-3.0-only"

COPY --from=build /src/mcp/kshana-mcp/target/release/kshana-mcp /usr/local/bin/kshana-mcp

# HTTP mode (self-hosted; Kshana runs no endpoint): the container must listen on 0.0.0.0,
# which needs the explicit flag and a bearer token:
#   docker run --rm -p 127.0.0.1:8080:8080 -e KSHANA_MCP_HTTP_TOKEN \
#     ghcr.io/ashfordeou/kshana-mcp --http 0.0.0.0:8080 --allow-remote \
#     --allowed-host localhost:8080
# The IQ file tools are always off in HTTP mode.
#
# Run as an unprivileged user; the server needs no network access over stdio, and touches the
# filesystem only for the GNSS IQ tools, inside the folder KSHANA_MCP_IQ_DIR names (unset by
# default, which leaves those tools off). To enable them, mount a volume and point the
# variable at it: `docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ...`.
RUN useradd --create-home --uid 10001 kshana
USER kshana

ENTRYPOINT ["/usr/local/bin/kshana-mcp"]
