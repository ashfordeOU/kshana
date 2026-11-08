<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C7: the tools named, and how criterion 3 is read

Recorded before the fourth tool's adapter is written, as the sign-off of 3 November 2026 requires.

## The four tools

| Class | Tool | Version | Licence | Reads |
|---|---|---|---|---|
| Orekit | Orekit, through orekit_jpype | 13.1.9 (orekit_jpype 13.1.9.0) | Apache-2.0 | OEM, OPM |
| GMAT | GMAT | R2026a | Apache-2.0 | OEM, SPK |
| Basilisk | Basilisk (`bsk`), through the SPICE Toolkit it ships | 2.12.2 | ISC | SPK |
| File-based (the fourth class) | ANISE (`anise` on PyPI) | 0.10.6 | MPL-2.0 | SPK |

8 November 2026: ANISE is named as the fourth, file-based tool. It is an open toolkit that reads SPICE kernels with its own reader, not the SPICE Toolkit. So the SPK is checked by a second independent reader as well as by SPICE.

## How criterion 3 is read

8 November 2026: a tool that parses each written value to the written double and then converts units (Orekit holds metres; the OEM carries kilometres) passes criterion 3. The data is carried at the written precision. The report names the tool as one that rounds further than the digits written, because its conversion is a second rounding of at most one ulp. A value that is not the tool's own conversion of the written double, or an epoch that differs, fails.

## How criterion 3 is read for a tool that evaluates a kernel

8 November 2026: some tools evaluate an SPK and do not hand back its stored records (ANISE's Python API). For those, the file is carried when every epoch is the written one and no state at a node epoch is further from the written state than SPICE's own evaluation of the same kernel is. Rule set by the apps session, confirmed by the seat on 8 November. Nothing was pre-registered for evaluating tools.
