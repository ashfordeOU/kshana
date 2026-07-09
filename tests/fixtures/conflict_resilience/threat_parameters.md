# Conflict-resilience threat-parameter provenance catalog (P7 / L36)

This is the human-readable provenance record for the per-layer threat priors the
`conflict-resilience` scenario (paper **P7**) consumes. The single source of truth is
`src/conflict_threat_params.rs::threat_catalog()`; the machine-readable snapshot is
`threat_parameters.json` in this directory. A drift-guard test
(`tests/conflict_threat_params_provenance.rs`) fails if either file diverges from the code,
so this document and the code cannot silently disagree.

## Honesty scope (load-bearing)

Every number below is a **Modelled** input **with provenance** — it is **not** a
**Validated** measurement. The cited campaigns establish the *ordering and rough
magnitude* of the modelled effects (L1 C/A is denied at a lower jammer power than wideband
L5/E5; a message-authenticated layer raises the spoofing bar but shares the RF-denial
vector; an inertial layer is immune to that vector). The exact per-vector denial
probabilities, availabilities and accuracy sigmas are **allocations informed by** those
sources — they are not read off any dataset as calibrated probabilities. The
`[min, nominal, max]` vulnerability triple is exactly the prior range the L35 sensitivity
sweep ranges over, so the reported spread is the honest reflection of that modelling
uncertainty.

What **is** Validated is the *analysis*, not the *inputs*: the Monte-Carlo total-loss
converges to the closed-form independent product, the inverse-variance fuse is a closed-form
identity, the ρ=0 Gaussian copula reduces to the independent model, and each per-vector
survival Monte-Carlo converges to its closed form. **This catalog is not a certification**
and the scenario it feeds is not a certified navigation-availability product.

## Threat vectors (§4.2)

The aggregate `vector_weight` couples a layer to the shared **RF** denial vector used by
the headline resilience-ratio story. The §4.2 breakdown resolves the threat into four named
vectors, each carried as a per-layer susceptibility in `vector_profile`:

| Vector | Meaning |
|---|---|
| `jamming` | broadband RF power denial (loss of lock) |
| `spoofing` | counterfeit-signal capture of the receiver |
| `kinetic` | physical strike on the layer's ground / space assets |
| `cyber` | attack on the layer's control plane / network |

Under vector *v* acting alone at intensity *x*, a layer is denied with probability
`clamp(susceptibility_v · x, 0, 1)`, and the architecture's usable-PNT survival is
`S_v(x) = 1 − Π_i (1 − a_i·(1 − p_i,v))`.

## Layer catalog

The first four rows are the **conflict baseline** — an apparently diverse GNSS stack whose
members all ride the same RF band and therefore share the denial vector (the fragile,
correlated case P7 is built around). The last two are complementary alt-PNT layers a caller
can add for genuine diversity.

### 1. GNSS L1 C/A (open service)
- availability **0.99**, 1σ accuracy **4.0 m**
- vulnerability prior `[min 0.80, nominal 0.90, max 0.98]`, RF `vector_weight` **0.58**
- per-vector susceptibility: jamming **0.98**, spoofing **0.85**, kinetic **0.12**, cyber **0.18**
- **Source:** JammerTest 2024 field campaign, Bleik/Andøya, Norway (Zenodo DOI
  `10.5281/zenodo.15910563`, GPL-3.0; vendored in `crate::realdata::jammertest`) — L1 C/A
  loses lock at the lowest jammer power of any tracked signal, hence the highest jamming
  susceptibility. Conflict-zone L1 interference incidence: OPSGROUP/GPSJAM 2024 daily
  aircraft GNSS-interference maps; EASA Safety Information Bulletin 2022-02. Unauthenticated
  ⇒ high spoofing susceptibility.

### 2. GNSS L5 / E5a (wideband)
- availability **0.97**, 1σ accuracy **3.0 m**
- vulnerability prior `[min 0.70, nominal 0.85, max 0.95]`, RF `vector_weight` **0.60**
- per-vector susceptibility: jamming **0.90**, spoofing **0.80**, kinetic **0.12**, cyber **0.18**
- **Source:** JammerTest 2024 (Zenodo DOI `10.5281/zenodo.15910563`) — the wideband L5/E5
  signal is more jam-resistant than L1 C/A yet is still denied at moderate jammer-to-signal
  ratios and shares the same RF band as the conflict-zone interference documented in EASA
  SIB 2022-02.

### 3. Galileo E1 OS + OSNMA
- availability **0.98**, 1σ accuracy **4.0 m**
- vulnerability prior `[min 0.72, nominal 0.88, max 0.96]`, RF `vector_weight` **0.59**
- per-vector susceptibility: jamming **0.92**, spoofing **0.40**, kinetic **0.12**, cyber **0.22**
- **Source:** TEXBAT — the Texas Spoofing Test Battery (Humphreys et al., University of
  Texas Radionavigation Laboratory, 2012): recorded live-sky spoofing scenarios. Galileo
  OSNMA (navigation-message authentication) sharply lowers the spoofing susceptibility while
  the shared RF band keeps jamming susceptibility high.

### 4. SBAS / augmentation (WAAS/EGNOS-class)
- availability **0.96**, 1σ accuracy **3.0 m**
- vulnerability prior `[min 0.72, nominal 0.86, max 0.95]`, RF `vector_weight` **0.60**
- per-vector susceptibility: jamming **0.90**, spoofing **0.68**, kinetic **0.28**, cyber **0.55**
- **Source:** RTCA DO-229 (SBAS Minimum Operational Performance Standards) nominal accuracy.
  An SBAS relay rides the same L1/L5 RF band (jam-fragile) and, as a networked augmentation
  service, carries a materially larger cyber and ground-segment kinetic surface than a raw
  GNSS signal.

### 5. Inertial (navigation-grade INS)
- availability **0.999**, 1σ accuracy **30.0 m**
- vulnerability prior `[min 0.00, nominal 0.03, max 0.10]`, RF `vector_weight` **0.10**
- per-vector susceptibility: jamming **0.00**, spoofing **0.00**, kinetic **0.20**, cyber **0.10**
- **Source:** Alt-PNT diversity layer — an inertial system is immune to the RF-denial vector
  (residual vulnerability is mechanical shock / upset only), per the DHS/CISA Resilient PNT
  Conformance Framework v2.0 diversity principle and DARPA All-Source Positioning and
  Navigation (ASPN). This is the decisive survivor of a jamming campaign.

### 6. LunaNet / IOAG augmentation relay
- availability **0.95**, 1σ accuracy **30.0 m**
- vulnerability prior `[min 0.10, nominal 0.25, max 0.45]`, RF `vector_weight` **0.30**
- per-vector susceptibility: jamming **0.40**, spoofing **0.35**, kinetic **0.50**, cyber **0.50**
- **Source:** LunaNet Interoperability Specification (NASA/ESA) and the IOAG Lunar
  Communications Architecture — an augmentation / relay PNT layer that shares only a partial
  RF vector with terrestrial GNSS but, as a physical relay on a network, carries the largest
  kinetic and cyber surface in the catalog.

## References

- **JammerTest 2024** field campaign, Bleik/Andøya, Norway — Zenodo DOI
  `10.5281/zenodo.15910563` (GPL-3.0), vendored in `crate::realdata::jammertest`.
- **TEXBAT** (Texas Spoofing Test Battery) — Humphreys et al., University of Texas
  Radionavigation Laboratory, 2012.
- **EASA** Safety Information Bulletin 2022-02 — GNSS outages and spoofing.
- OPSGROUP / GPSJAM 2024 daily aircraft GNSS-interference maps.
- **RTCA DO-229** — SBAS Minimum Operational Performance Standards.
- **DHS/CISA** Resilient PNT Conformance Framework v2.0 (diversity principle).
- **DARPA** All-Source Positioning and Navigation (ASPN).
- **LunaNet** Interoperability Specification (NASA/ESA) and the **IOAG** Lunar
  Communications Architecture.

*All magnitudes above are Modelled inputs with provenance, not Validated measurements. This
document is not a certification.*
