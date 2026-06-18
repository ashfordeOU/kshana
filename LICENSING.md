<!-- SPDX-License-Identifier: AGPL-3.0-only -->

# Licensing

Kshana is **dual-licensed**. You may use the open engine under **either** the open
licence (AGPL-3.0) **or** a **commercial licence** from Ashforde OÜ. Pick the one
that fits how you intend to use it.

> This document explains the model in plain language. It is a guide, not legal
> advice, and it does not modify the licences themselves. The binding terms are in
> [`LICENSE`](LICENSE) (the GNU AGPL-3.0) and in any commercial agreement you sign
> with Ashforde OÜ. If the two ever conflict, those documents govern.

---

## Option A — open source: GNU AGPL-3.0-only

The default. The full text is in [`LICENSE`](LICENSE). In short, the AGPL lets you
use, study, modify, and redistribute Kshana for free, **provided** that:

- if you **distribute** Kshana or a derivative, you make the **complete
  corresponding source** available under the AGPL; and
- if you let users interact with a **modified** Kshana **over a network** (the
  AGPL's distinguishing clause, §13), you must offer **those users** the
  corresponding source of your modified version under the AGPL.

AGPL is an [OSI-approved open-source licence](https://opensource.org/license/agpl-v3)
and strong copyleft. It is the right choice for academic work, open-source projects,
internal evaluation and research, and anyone happy to keep their own derivative open.

## Option B — commercial licence (from Ashforde OÜ)

If the AGPL does not suit you, Ashforde OÜ will license the same engine under
commercial terms. This is the right choice when you want to:

- **embed Kshana in a proprietary / closed-source product** without releasing your
  own source;
- **offer a network service** built on a modified Kshana **without** the §13
  source-disclosure obligation;
- integrate Kshana into a larger system whose other components cannot be AGPL
  (e.g. a prime contractor's proprietary toolchain); or
- obtain a warranty, indemnity, or support terms the AGPL explicitly disclaims.

A commercial licence removes the copyleft obligations for your use, on agreed terms.
**Contact: contact@ashforde.org.**

---

## Why dual-license this way

The goal is to be **publicly verifiable** (so any reviewer can run and audit the
engine) **without** letting a well-resourced competitor fork the validated engine,
close it, and ship a proprietary competitor that gives nothing back. AGPL's network
copyleft achieves that: a closed or hosted derivative must come back to open source —
or take a commercial licence from us. Public credibility and a defended core, at the
same time.

## What is **not** covered by this dual-license

- **Kshana Pro** and other proprietary overlays are **separate, closed-source**
  products under their own commercial terms. They are not part of this repository
  and are not offered under the AGPL.
- **Dependencies** keep their own (permissive) licences. We deliberately keep the
  dependency tree permissive (Apache-2.0 / MIT / BSD / ISC / …) precisely so the
  commercial edition can be offered cleanly — a copyleft dependency would taint it.
  See [`deny.toml`](deny.toml).
- **Trademarks.** "Kshana" and its marks are trademarks of Ashforde OÜ. Neither
  licence grants rights to the name or marks; forks and derivative distributions
  must use a different name. See [`NOTICE`](NOTICE).

## Contributions

Contributions are accepted under the project's inbound contributor terms, which
license your contribution under the AGPL **and** grant Ashforde OÜ the right to
include it in the commercially-licensed edition (so the dual-license keeps working).
See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Questions

Licensing questions, commercial quotes, and "which option applies to us?" →
**contact@ashforde.org**.
