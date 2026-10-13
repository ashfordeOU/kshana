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

- **The native OpenCPN plugin** (`integrations/opencpn/plugin/`) is licensed **GPL-3.0-or-later** (see the `LICENSE` file in
  that directory), not AGPL-3.0, and is **not** offered under the commercial licence. It is loaded into OpenCPN and built
  against its GPL-2.0-or-later plugin API header, which is the usual basis for OpenCPN plugins. The rest of
  `integrations/` (the Signal K plugin and the OpenCPN TCP relay) stays AGPL-3.0-only.

- **Kshana Pro** and other proprietary overlays are **separate, closed-source**
  products under their own commercial terms. They are not part of this repository
  and are not offered under the AGPL.
- **Dependencies** keep their own (permissive) licences. We deliberately keep the
  dependency tree permissive (Apache-2.0 / MIT / BSD / ISC / …) precisely so the
  commercial edition can be offered cleanly — a copyleft dependency would taint it.
  See [`deny.toml`](deny.toml).
- **Galileo E1 primary memory codes** (`C7_E1B.txt`, `C8_E1C.txt`; **not bundled since 0.36**:
  each user supplies their own copy, `scripts/fetch_galileo_e1_codes.sh` or
  `KSHANA_GALILEO_E1B` / `KSHANA_GALILEO_E1C`, read by `src/iq/signals/galileo.rs`). These are the E1-B and E1-C primary codes of
  Annex C.7 and C.8 of the Galileo Open Service Signal-In-Space Interface Control Document
  (OS SIS ICD), Issue 2.0, January 2021, © European Union 2021, extracted unmodified from the
  PDF's attachments (source URL, SHA-256 and a cross-check against Issue 1.3 are in
  [`data/galileo-os-sis-icd/PROVENANCE.md`](data/galileo-os-sis-icd/PROVENANCE.md)). They are
  **not** covered by the AGPL-3.0 or the commercial licence, and neither licence grants
  anything over them. What the ICD itself says, quoted from Issue 2.0:
  - Terms of Use §3: "The information contained in the OS SIS ICD, including its Annexes, is
    subject to intellectual property rights". "The OS SIS ICD may only be partly or wholly
    reproduced and/or transmitted to a third party in accordance with the herein described
    permitted use and under the following conditions: the present “Terms of Use and
    Disclaimers”, as well as the terms of Annex G, are accepted, reproduced and transmitted
    entirely and unmodified together with the reproduced and/or transmitted information; the
    copyright notice “© European Union 2021” is not removed from any page." And: "The use of
    the information contained in the OS SIS ICD, including the spreading codes which are
    subject to IPR, is authorised under the terms and conditions stated in Annex G."
  - Annex G (Issue 2.0; Annex H in Issue 2.1, same wording) defines "Technical Data of the OS
    SIS ICD" to include the "E1 and E5 Memory Codes", and grants a covenant not to assert that
    is "non-exclusive and royalty-free" and "non-transferable and non-licensable". Its §G.3
    list, which it calls exhaustive, covers: "a) the use of the Technical Data of the OS SIS
    ICD, including their integration and incorporation into any Products"; "b) the storage of
    the Technical Data of the OS SIS ICD, provided the source is acknowledged"; "c) the
    reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication
    for non-commercial not-for-profit purposes and scale without amending the document or
    adding any element"; and "d) providing links to the EU website where the document is
    published". "Products" means software, devices and value-added services "making use of the
    OS Signal". It also says: "The Authorised Person shall not state or imply in any
    promotional material or elsewhere that the Products were developed by, are used by or for
    or have been approved or endorsed by the EU".

  **Decision (0.36): not redistributed.** No explicit open licence is stated. Use inside a
  software product (G.3 a) and storage with the source acknowledged (G.3 b) are covered on the
  ICD's own terms, but redistribution (G.3 c) only for non-commercial, not-for-profit purposes
  and with the Terms and Annex G reproduced unmodified alongside. Because Kshana is also offered
  under a commercial licence, the files were removed from the repository and its packages; the
  engine reads the user's own copy at run time, and without it the Galileo E1 signals return an
  error that says how to supply them. Each
  user relies on the EU's Authorisation directly; Kshana cannot pass it on. Kshana is not
  developed by, used by, approved by or endorsed by the European Union.
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
