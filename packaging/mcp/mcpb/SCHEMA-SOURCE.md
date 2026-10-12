# manifest-v0.3.schema.json: where it comes from

A byte-for-byte copy of the published MCPB manifest schema, version 0.3 (the `manifest_version` the
extension declares):

* source: https://github.com/modelcontextprotocol/mcpb/blob/main/schemas/mcpb-manifest-v0.3.schema.json
  (the same file ships in the packer's 2.1.2 release, published 2025-12-04)
* sha256: `3a0ac9d845711a1b9b17dfa5a52f8b60628239d6a86a9db417206a9efc78592d`
* format specification: https://github.com/modelcontextprotocol/mcpb/blob/main/MANIFEST.md

`scripts/build_mcpb.py` refuses to build if the committed copy's hash differs from the one above, and
validates every manifest it writes against it. To update: replace the file from the source, update the
hash here and in the script, and review the diff.
