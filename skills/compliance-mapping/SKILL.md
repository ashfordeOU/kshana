---
name: compliance-mapping
description: Map a set of Kshana runs to public PNT-resilience frameworks (US DHS Resilient PNT framework, IMO, EASA, NIS2 Article 21, EN 16803) to see which requirement rows the runs support evidence for and which they do not. Use when the user asks what Kshana evidence exists for a framework, or wants a gap list for a set of runs.
---

# Compliance mapping

Use the `kshana` MCP server's `compliance_report` (from runs) and `compliance_mapping` (the
static tables and sources). See `/kshana-compliance-report` for the step list and
`docs/compliance/` for the tables.

Rules that apply every time:

- A row marked `evidenced` means a run in the set **supports evidence for** the capabilities the
  row names. It is not a finding that a framework is met and does not mean any product has been
  rated or approved by anyone. Kshana is not an assessment body.
- Show the report's `statement` verbatim with any result, and give each row's `gap`: it stays
  even when the row is evidenced.
- Use those words. Do not describe a status as a pass, an approval or a stronger claim, and do
  not describe the engine's output as anything beyond "supports evidence for".
- Tell the user which runs were read and which landed in `unrecognised`, with the reason.
- Pass result and scenario **text**, not paths; inputs are capped at 4 MiB in all and 64 runs.
- The paid standard (EN 16803) is mapped by part and catalogue-visible clause numbers only;
  requirement text everywhere is paraphrased.
