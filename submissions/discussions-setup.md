<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# FOUNDER ACTION — enable GitHub Discussions + seed posts

- **Destination:** repository **Settings → General → Features → Discussions** (one-click
  toggle, FOUNDER-GATED).
- **What to do:** enable Discussions, create the categories below, then paste the two
  seed posts and pin them.

## Categories to create

| Category | Format | Notes |
|----------|--------|-------|
| Q&A | Question / Answer | set as default |
| Ideas | Open-ended | feature ideas, sensor models |
| Show and tell | Open-ended | scenarios, papers, results built on Kshana |
| Announcements | Announcement (maintainers post) | releases, JOSS, talks |

## Seed post 1 — pinned welcome (category: Announcements)

**Title:** Welcome to Kshana Discussions

```
Welcome! Kshana (क्षण, "the precise instant") is an open, reproducible PNT-resilience
simulator: it quantifies what quantum clocks, quantum inertial sensors, and optical time
transfer buy a navigation system over classical PNT during GNSS outages — in hard,
reproducible numbers.

Good first things to do here:
- Ask in **Q&A** how to model a scenario or read a figure of merit.
- Propose a sensor model or pack in **Ideas** (every parameter needs a published source).
- Share what you built in **Show and tell**.

Getting started: try the in-browser playground at https://kshana.dev (no install), read the
README, and see docs/PROVENANCE.md for the cited parameter table. Every result is
reproducible from scenario + seed + engine version — please include all three when you post
a result. Contributions are welcome under AGPL-3.0; see CONTRIBUTING.md.
```

## Seed post 2 — pinned (category: Ideas)

**Title:** Roadmap & how to help

```
Kshana is pre-1.0 and developed in the open. The phased plan lives in ROADMAP.md
(https://github.com/ashfordeOU/kshana/blob/main/ROADMAP.md); released history is in
CHANGELOG.md and per-capability maturity in docs/CAPABILITY.md.

How to help:
- Validate a model against an external reference and add the test (see CONTRIBUTING.md —
  expected values are derived by hand from the physics/relation, never from Kshana itself).
- Add a calibrated sensor model with a published provenance string.
- File a scenario or a result that surprised you in Show and tell, with scenario + seed +
  version so others can reproduce it.

If you are evaluating Kshana for an agency or a prime, tell us what figure of merit you need
— neutral, citable benchmarks are exactly what this project is for.
```
