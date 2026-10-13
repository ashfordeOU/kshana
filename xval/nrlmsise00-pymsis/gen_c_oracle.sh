#!/bin/sh
# Build the C-port oracle against an unpacked nrlmsise00-0.1.2 sdist and run it on the grid.
# From the repository root:
#   SRC=/path/to/nrlmsise00-0.1.2/src/c_nrlmsise-00 sh xval/nrlmsise00-pymsis/gen_c_oracle.sh \
#       > tests/fixtures/nrlmsise00/cport_grid.txt
set -eu
here=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d)
gcc -O0 -I"$SRC" "$here/c_oracle.c" "$SRC/nrlmsise-00.c" "$SRC/nrlmsise-00_data.c" -lm -o "$tmp/c_oracle"
python3 -I "$here/grid.py" | "$tmp/c_oracle"
rm -rf "$tmp"
