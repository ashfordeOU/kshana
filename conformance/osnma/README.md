# Open OSNMA vector set

`v1/` is version 1.0.0 of the open synthetic OSNMA vector set (`kshana-osnma-synthetic`): 27
vectors made by Kshana's own generator from its own keys and chains, each with one fixed bar
pinned by SHA-256. Run them with

```sh
kshana osnma vectors run conformance/osnma/v1          # table
kshana osnma vectors run conformance/osnma/v1 --json   # result document
```

Format, coverage, the bar rules and the scope are in [`docs/OSNMA-VECTORS.md`](../../docs/OSNMA-VECTORS.md).
Synthetic data from our reading of the Galileo OSNMA SIS ICD Issue 1.1 and Receiver Guidelines
Issue 1.3 (© European Union, source acknowledged): a pass shows consistency with that reading, not
conformance or certification. No official test vector, ICD or Guidelines content is stored here;
the official vectors are fetched on demand (`tools/fetch_osnma_official_vectors.sh`).
