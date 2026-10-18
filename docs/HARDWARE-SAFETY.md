<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Hardware safety: what Kshana does with hardware, and what it never does

**Status: owner legal review pending.** The legal notes below are the maintainers' reading of
public sources, written so a user knows where the limits are. They are not legal advice, they
have not been reviewed by counsel, and the law differs by country. Read them as a reason to ask
a lawyer, not as a permission.

Kshana is advisory software for research, simulation and test. It is not type-approved
equipment and does not rate or approve a receiver, a clock or a laboratory. See the advisory statement
in the README.

## The rule

**Receive is the product. Transmitting is never in the open engine.**

- Kshana contains no code that drives a transmitter. There is no SDR transmit path (no UHD,
  HackRF, bladeRF or Soapy transmit call), and no jamming or spoofing waveform is written to
  a file meant for playback.
- Files Kshana writes (IQ scenes, SigMF and ION `.sdrx` recordings, NMEA and bench exports)
  describe **simulated, legitimate** signals or motion, and the metadata Kshana writes for a scene
  says it was written by `kshana iq scene` (the ION `.sdrx` comment says it is a simulated scene, not a
  recording).
- Where an experiment needs RF on a bench, the **operator's own equipment** produces it, in
  the operator's own enclosure, under the operator's own authorisation. Kshana records what
  the operator says was done, and never infers it.

## Stages

Each stage names what Kshana does, what hardware is involved, who emits RF (if anyone), and the
gate that must hold before Kshana will treat the result as evidence.

| Stage | Kshana's role | Hardware | RF emission | Gate | State in 0.38 |
|---|---|---|---|---|---|
| **0** | Files: replay logs, IQ, bench exports, live NMEA or UBX over stdin, TCP or UDP | none | none | none | shipped |
| **1** | Passive receive: receivers read-only; timing logs (linuxptp, chrony, TICC); IMU CSV; `iq monitor --follow` on a growing SigMF file | the user's receivers, grandmaster, SDR in receive | **none** | any configuration write to a receiver needs an explicit `--configure`; the default is read-only | partly shipped: timing-log formats, `holdover-test`, `iq monitor --follow`; serial receiver input is planned |
| **2** | Lab orchestration with no RF from Kshana: a test-conditions specification, operator steps (antenna pull, simulator start) prompted and time-stamped, round-trip scoring and evidence | lab-owned simulators, shielded boxes | by the **lab's** simulator only, conducted | a signed `lab-attestation` (below) recorded in the evidence pack; Kshana refuses to score a lab run without it | the record is implemented in evidence packs; the refusal to score without it is not yet (no lab-run command exists) |
| **3** | Conducted replay of **legitimate** GNSS IQ scenes: Kshana writes the scene file, and the user replays it with their own tool into a cable with attenuators and a device under test in an RF enclosure | the user's SDR, attenuators, enclosure | conducted only, the user's responsibility | no transmit code in the open engine; interference and spoofing waveforms stay out of scope; export-control review; counsel | not in the open engine; a commercial-edition item to be done with counsel |
| **4** | Real-time closed-loop RF hardware-in-the-loop | partner equipment | partner | integrate through the stage 2 specification instead | not planned |

"Shipped" means the code is in this release. Nothing in this table says any stage has been
used with any partner, laboratory or authority; none has.

## Principles

1. Receive is the product, and transmitting is never in the open code.
2. Every hardware session yields an evidence pack with hashes of the inputs, the conditions and
   the thresholds used.
3. A conducted or shielded attestation is recorded, never inferred.
4. Numbers that come from hardware stay **MODELLED** until an independent external oracle
   agrees (for example a laboratory truth trajectory or a reference clock). A pre-registered
   bar is not loosened after a run.
5. Antennas with controlled patterns, inertial units and chip-scale atomic clocks are treated
   as data sources (patterns, logs, published stability curves), not as devices Kshana drives.
6. Wording: a result is "measured against the mask" or "supports evidence for" a requirement.
   Kshana does not say that a device meets a standard, and nobody has rated or approved it.

## Legal notes (owner legal review pending)

Receiving GNSS signals is legal almost everywhere. Transmitting in GNSS bands is not.

- **United States.** Wilful interference with radio communications is barred under 47 U.S.C.
  §333, and the FCC enforces against jammers (<https://www.fcc.gov/general/jammer-enforcement>).
  A transmission from a bench can reach beyond the bench.
- **Elsewhere.** The maintainers have not reviewed other countries' law. The community around
  gps-sdr-sim states that transmitting its output is prohibited by law in most countries; treat
  that as the working assumption wherever counsel has not said otherwise.
- **A shielded or conducted setup is a safeguard, not a licence.** The attestation below records
  the safeguard the operator says was in place. It does not make an emission lawful.
- **Recording.** Recording radio signals can raise privacy and legality questions in some
  places. `iq monitor --follow` and any capture recipe are receive-only, and the operator is
  responsible for where and what they record.
- **Export control.** Hardware-in-the-loop software that drives signal generators can fall under
  export-control rules. That is why stage 3 is outside the open engine.
- **Nothing here is an endorsement or an agreement.** No regulator, test range, laboratory or
  vendor has been consulted about this document or has agreed to anything in it.

## The `lab-attestation` field

For stage 2 and above, a run that involved lab equipment carries a `lab-attestation` object,
recorded in the evidence pack beside the hashes of the inputs. It is a statement by a named
operator, not a measurement, and Kshana does not verify it.

```toml
[lab-attestation]                                     # or the same keys at the top level of the file
operator = "name or role of the person responsible"   # required
organisation = "laboratory or company"                # required
date = "2026-11-02"                                   # required, the day of the session
setup = "conducted"                                   # required: "conducted" or "shielded"
attenuation_db = 60.0                                 # required for "conducted": total, emitter to device
enclosure = "RF-shielded box, model and ID"           # required for "shielded"
emitter = "laboratory-owned simulator, model"         # required: what produced any RF
statement = "No emission outside the enclosure or cable path."   # required, free text
signature = "ed25519:..."                             # optional: the operator's own detached signature, recorded as given
```

What is implemented in 0.38:

- `kshana receiver-trust evidence ... --lab-attestation <file.toml>` validates the file and records
  the attestation in the pack's `manifest.json`. The manifest is covered by the pack's Ed25519
  signature, so the record cannot be edited without breaking verification. The same is available as
  the `lab_attestation` argument of the Python `evidence_create` and the `lab_attestation_toml` argument
  of the MCP `create_evidence_pack` tool (the browser build does not create packs).
- A pack made without an attestation is byte-for-byte what it was before.
- `kshana evidence verify` reports the attestation and says it is "attested by the named operator; not
  verified by Kshana".
- An attestation that is incomplete, or whose `setup` is neither `conducted` nor `shielded` (an
  over-the-air setup is not accepted as a lab run), is refused and no pack is made.

What is **not** implemented yet: the stage 2 rule that Kshana refuses to *score* a lab run that has no
attestation. No command takes a lab-run flag in 0.38, so there is nothing to refuse; the rule arrives with
the lab orchestration commands. An attestation records the operator's statement of a safeguard. It does not
make any emission lawful and it does not change a result's label: a scored lab run is MODELLED unless an
external oracle agrees.

## What this means for a contributor

- Do not add a transmit path, a transmit dependency or a transmit example to the open engine.
- Do not add a waveform generator whose output is a jamming or spoofing signal meant for
  playback.
- New hardware inputs are read-only by default; a write needs an explicit flag and a line in this
  file.
- A new command that touches hardware goes on every surface or is marked N/A with a reason in
  [`SURFACES.md`](SURFACES.md), and states its stage here.
