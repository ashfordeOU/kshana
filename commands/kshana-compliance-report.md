---
description: Fill the public-framework mapping from Kshana result documents (which framework rows the runs support evidence for, and the gap each row keeps) via the kshana-mcp server
argument-hint: "[the result files or runs to map, e.g. 'map these two scenario results' or 'show the DHS and IMO tables']"
---

# Map runs to public resilience frameworks

Kshana can say, row by row, which requirements of five public frameworks and standards (the
US DHS Resilient PNT framework v2.0, IMO guidance for ships, EASA guidance for aviation, NIS2
Article 21 and EN 16803) a set of its runs **supports evidence for**, and which it does not. It
is a mapping from Kshana outputs to requirement topics, not a rating or an approval of any
product, and Kshana is not an assessment body. Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. **Just the tables?** Call `compliance_mapping` (`sources: true` for the source documents the
   tables cite, with versions and URLs). It needs no runs.
2. **From runs.** Call `compliance_report` with `runs`, a list of `{label, result, scenario}`:
   `result` is the result JSON **text** a Kshana run wrote, `label` the name to show, and
   `scenario` the scenario TOML text when you have it (a result does not name its scenario kind;
   a receiver-trust result needs no scenario). At most 64 runs and 4 MiB in all. Nothing is read
   from disk, so read the files and pass their text.
3. The reply holds `statement`, `runs`, `unrecognised` (inputs not used, each with the reason;
   they count for nothing), `capabilities`, `receiver_trust` and one entry per framework row with
   a `status` and its `gap`, plus a `markdown` rendering of the same report.
4. **Report it faithfully.** Show the `statement` with any result, word for word. Statuses are
   `evidenced`, `partly-evidenced`, `not-evidenced` and `out-of-scope`. `evidenced` means the
   runs given support evidence for the capabilities the row names; the row's `gap` still says
   what they do not show, so give it too. Say which runs were used and which were not.
5. The report is only as broad as the runs given: a missing run is a missing capability, not a
   finding about the product. Suggest the runs that would move a row (the `missing_capabilities`).
