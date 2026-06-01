# Kshana

Open, reproducible simulator for hybrid quantum/classical PNT (positioning,
navigation, timing). Quantify what quantum clocks, sensors, and time-transfer
buy a navigation system over classical PNT — scored against operational
figures of merit, with every result reproducible from `scenario + seed + version`.

> **Status: research-grade, v0.1.** Implements the clock-holdover-during-GNSS-outage
> scenario. Clock figures are placeholders pending calibration to published data —
> see `docs/VALIDATION.md`. Do not cite the numbers as validated.

## Quick start
```bash
cargo run -- scenarios/clock-holdover.toml
```

## License
Apache-2.0.
