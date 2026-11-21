#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Download the official Galileo OSNMA test vectors (an annex to the OSNMA Receiver Guidelines
# Issue 1.3, published by the European GNSS Service Centre) into a directory of YOUR choice,
# check the archive against the SHA-256 pinned below, and unpack it. Nothing is stored in or
# redistributed by this repository: the archive carries its own terms of use (those of the
# Receiver Guidelines), which you accept by downloading it. Run it only when you want the
# opt-in conformance test:
#
#   tools/fetch_osnma_official_vectors.sh /path/outside/the/repo
#   KSHANA_OSNMA_VECTORS=/path/outside/the/repo/Test_vectors \
#   KSHANA_OSNMA_VECTORS_ZIP=/path/outside/the/repo/Test_vectors.zip \
#       cargo test --release --test osnma_official_vectors
#
# A different hash means the published archive changed: the script stops and unpacks nothing.
set -eu
URL="https://www.gsc-europa.eu/sites/default/files/sites/all/files/Test_vectors.zip"
SHA256="ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370"
DIR="${1:?usage: tools/fetch_osnma_official_vectors.sh <directory outside the repository>}"
mkdir -p "$DIR"
curl -sSfL -o "$DIR/Test_vectors.zip" "$URL"
GOT="$(sha256sum "$DIR/Test_vectors.zip" 2>/dev/null | cut -d' ' -f1 || shasum -a 256 "$DIR/Test_vectors.zip" | cut -d' ' -f1)"
if [ "$GOT" != "$SHA256" ]; then
    echo "Test_vectors.zip has SHA-256 $GOT, not the pinned $SHA256: not unpacked" >&2
    exit 1
fi
unzip -q -o "$DIR/Test_vectors.zip" -d "$DIR"
echo "official vectors checked (sha256 $SHA256) and unpacked in $DIR/Test_vectors"
