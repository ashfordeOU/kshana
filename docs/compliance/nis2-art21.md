<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# EU NIS2 Directive, Article 21: what Kshana supports evidence for

Article 21 lists, in paragraph 2 points (a) to (j), the measures essential and important entities take to manage risks to their network and information systems. Most points are organisational. Kshana speaks to the positioning-and-timing dependency of a system: how it behaves when GNSS is interfered with, and how that behaviour is tested and dated.

Every row says which Kshana outputs **support evidence for** the requirement and what is
left over. Nothing here says a framework is met or that any product has been rated or
approved by anyone. Run `kshana compliance-report` on your own result files to see which
rows your runs actually evidence; see [README.md](README.md).

## Source documents

- **Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)**: OJ L 333, 27.12.2022, pp. 80-152. <https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32022L2555>. Read 2026-10-09: the Article 21 paragraph letters were read from a summary of the EUR-Lex page and match the published text; confirm against the page before citing a letter in a filing.

## Mapping

<!-- mapping:start -->
| Reference | What it asks (paraphrased) | Kshana outputs that support evidence for it | Gap |
|---|---|---|---|
| Article 21(1) | Take proportionate technical, operational and organisational measures to manage the risks to network and information systems, in light of the state of the art, exposure, size and the likelihood and severity of incidents. | Resilience scoring over threat ensembles; Jamming link-budget effects | Kshana speaks only to the positioning and timing dependency of a system, not to information-security risk in general. |
| Article 21(2)(a) | Policies on risk analysis and on information system security. | Resilience scoring over threat ensembles; Jamming link-budget effects; Spoofing and meaconing detection | Supports the PNT part of a risk analysis; the policy itself is organisational. |
| Article 21(2)(b) | Incident handling. | Receiver-log trust assessment | A scored receiver log helps date the start and end of a PNT interference incident; the handling process is organisational. |
| Article 21(2)(c) | Business continuity, such as backup management, disaster recovery and crisis management. | Holdover and coasting; Alternative and diverse PNT sources | Shows how long a modelled fallback keeps a timing or position bound; continuity plans are organisational. |
| Article 21(2)(d) | Supply chain security, including relationships with direct suppliers. | none | Kshana does not assess suppliers. Using a neutral, reproducible bench for receiver acceptance is one input a buyer can use, not a supply-chain assessment. |
| Article 21(2)(e) | Security in acquiring, developing and maintaining systems, including vulnerability handling and disclosure. | Receiver-log trust assessment; Reproducible run provenance | Repeatable acceptance tests of a receiver's interference behaviour support evidence for the acquisition part; vulnerability handling is outside. |
| Article 21(2)(f) | Policies and procedures to assess how effective the cybersecurity risk-management measures are. | Reproducible run provenance; Receiver-log trust assessment | Hashed, repeatable runs and events stated before scoring support evidence for an effectiveness test; the policy and its schedule are organisational. |
| Article 21(2)(g) to (j) | Cyber hygiene and training; cryptography and encryption; human-resources security, access control and asset management; multi-factor authentication and secured communications. | none | Not addressable by positioning and timing run outputs. |
| Article 21(3) | When choosing supply chain measures, consider each supplier's vulnerabilities and the quality and secure development of its products. | none | See Article 21(2)(d). |
<!-- mapping:end -->
