# Kshana

Open, reproducible simulator for hybrid quantum/classical PNT (positioning,
navigation, timing). Quantify what quantum clocks, sensors, and time-transfer
buy a navigation system over classical PNT — scored against operational
figures of merit, with every result reproducible from `scenario + seed + version`.

> **Status: research-grade, v0.2.** Implements the clock-holdover-during-GNSS-outage
> scenario. Clock white-FM noise is calibrated to published `sigma_y(1 s)` (Microchip
> CSAC datasheet; ESA SOC optical-clock space goal) and validated against simulated
> Allan deviation (~2%); flicker floors and aging are not yet modeled. See
> `docs/VALIDATION.md`.

## Quick start
```bash
cargo run -- scenarios/clock-holdover.toml
```

## License
Apache-2.0.
