---
name: Adapter submission
about: Offer a mapping file so Kshana reads a new device or log format (docs/ADAPTERS.md)
labels: adapter
---

**Device or export**
(The receiver, monitor or logger, and the export format: CSV, TSV, JSON lines.)

**Files in the pull request** (one folder under `adapters/`, see docs/ADAPTERS.md)
- [ ] `adapter.toml`
- [ ] the mapping file (`kshana.connect/1`)
- [ ] a sample log that is yours to share (no customer data, no personal data)
- [ ] a conformance vector and its expected `kshana.obs/1` output
- [ ] `kshana connect adapters check adapters` passes locally

**Licence of the sample and mapping**
(SPDX id. By opening the pull request you grant what CONTRIBUTING.md "Licensing of contributions"
describes, and sign off your commits.)

**Public documentation of the format** (a link, if there is one)
