# reentry_point_mass_accelerometer_oracle fixture

Used only by `tests/reentry_point_mass_accelerometer_oracle.rs`; not shipped in any published package.

## What is here

- `measured_entries.txt`: for each included entry, the printed entry-interface state, mass,
  diameter and hypersonic-continuum drag coefficient that fix the ballistic coefficient by the
  pre-registered rule, and the peak deceleration printed as measured by an on-board
  accelerometer. Generator: none (numbers are typed from the cited sources). As of 2026-10-02 no
  entry is included; the file holds only its header.

## Sources consulted (retrieved 2026-10-02; none vendored)

| Reference | Use | SHA-256 of the copy read |
|---|---|---|
| NTRS 20240000629, OSIRIS-REx sample return capsule entry, descent and landing (AAS preprint) | shows the capsule had g-switches only | 4cdfd7f0e0e5ef991156432800b5a4b983a69a6068f7864684714753b6576f66 |
| NTRS 20240014280, "OSIRIS-REx Entry, Descent, and Landing Performance" | peak deceleration is a POST2 simulation output | 0dc8b764aeb91ead1c320e30d638f8582f5bc6987647a0d484e244ae9fe695b2 |
| JAXA, Hayabusa2 press briefing 2021-03-05 (`Hayabusa2_Press_20210305_ver5.pdf`) | REMM recorded acceleration at 125 Hz; no peak printed | 61a0766c10966a0e70a0f52aa15e348311ccf554a4db52c0a136ddb47cb09f7f |
| Yamada, Kawahara, Itou and Nakazawa, Trans. JSASS Aerospace Tech. Japan 19(4) 514 (2021) | mass, diameter; pre-flight predicted maximum (not an oracle) | 0a367f1ae530f7979ade58314b35305416dd2b2bf3997fd20765fbb2f9c369f5 |
| Tsuda et al., Trans. JSASS 67(6) 340 (2024), CC BY-NC-ND 4.0 | derived entry state at 200 km | 5be922def190deb2f196f61a3dbb5ffe0c2477b3b66d48fd7d3e4e64aff3cf82 |
| "The Aerodynamic Data Base for Asteroid Sample Return Capsule", ISAS report SP (2003), JAXA repository record 33260 | candidate drag-coefficient database (not read: needs Japanese fonts) | 96e98ad1fe7c7e8b92c413af8b6adb561643d8785d5aa0f330a2db242390aaf6 |

Not retrievable here: Yamada and Yoshihara, Journal of Evolving Space Activities 1 (2023) 16,
doi 10.57350/jesa.16 (open access; host refuses this session's egress, PDF over the fetch
limit); AIAA 2022-3801 (paywalled).
