Vendored, hash-pinned (bundled to one ESM file each with esbuild 0.25.0, minified), Apache-2.0, Mozilla Foundation and others:

| file | package | sha256 |
|---|---|---|
| fluent-bundle-0.19.1.mjs | @fluent/bundle 0.19.1 | c0a28b71df855485ebcb0535e1b13eaad35ed456608518b3e72f18ef228954cb |
| fluent-syntax-0.19.0.mjs | @fluent/syntax 0.19.0 | 1d52859091d89f89850d3d5c2238ebe2c069746a1812565b521e63631260b988 |

The site and Studio load the same bundle copy from `web/js/vendor/` (copied by the port).
