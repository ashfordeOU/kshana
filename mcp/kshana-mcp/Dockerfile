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
FROM rust:1.93.0-slim-bookworm AS build
WORKDIR /src
COPY . .
WORKDIR /src/mcp/kshana-mcp
RUN cargo build --release && strip target/release/kshana-mcp

# ---- runtime stage ---------------------------------------------------------------
# bookworm-slim matches the builder's glibc (2.36), so the dynamically linked binary
# runs as-is. No extra packages: the server makes no network calls.
FROM debian:bookworm-slim AS runtime

# Ownership marker that links this image to its entry in the official MCP registry.
# The registry reads this label to verify `server.json` ↔ image ownership.
LABEL io.modelcontextprotocol.server.name="io.github.ashfordeOU/kshana-mcp"
LABEL org.opencontainers.image.title="kshana-mcp"
LABEL org.opencontainers.image.description="MCP server exposing the validated Kshana PNT-resilience simulator to AI agents."
LABEL org.opencontainers.image.source="https://github.com/ashfordeOU/kshana"
LABEL org.opencontainers.image.url="https://kshana.dev"
LABEL org.opencontainers.image.licenses="AGPL-3.0-only"

COPY --from=build /src/mcp/kshana-mcp/target/release/kshana-mcp /usr/local/bin/kshana-mcp

# Run as an unprivileged user; the server needs no filesystem or network access.
RUN useradd --create-home --uid 10001 kshana
USER kshana

ENTRYPOINT ["/usr/local/bin/kshana-mcp"]
