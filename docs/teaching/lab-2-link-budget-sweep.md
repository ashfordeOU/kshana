<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Lab 2: a link-budget sweep

**Goal.** Drive the engine from a loop: change one input of a scenario's text, run, collect a figure,
and compare the trend with the link equation. **Time:** about 60 minutes. **Data:** the shipped
`scenarios/link-budget.toml`, edited in memory only (MODELLED; a deterministic calculation from the
stated inputs, not a terminal datasheet).

The link equation the scenario applies (its header names CCSDS 401 and DSN 810-005):
Eb/N0 = EIRP − FSPL − L_other + G/T − k − 10 log10(R_b), margin = Eb/N0 − required Eb/N0, and
FSPL = 20 log10(4π d f / c).

## Exercises

**1. Range.** Run the scenario at 2,000 km and at 20,000 km. What is the margin at each, and what is
the difference? Which term of the equation explains it?

**2. The longest range.** Using only the margin at 2,000 km, predict the longest range at which the
link still closes. Run the scenario at your predicted range: what margin do you get?

**3. Deep space.** Set the range to one astronomical unit (1.496e8 km) at the shipped 1 Mbit/s. Does
the link close? What is the highest data rate that closes at that range? Check a rate just below it.

**4. Band.** Run the scenario in each band (`band = "s"`, `"x"`, `"ka"`). How does the margin change,
and by how much does the loss grow from X to Ka band? Explain it from the carrier frequencies
(`link_constants.carrier_frequency_hz`).

## Worked answers

1. **92.12 dB** at 2,000 km and **72.12 dB** at 20,000 km: a difference of **20.00 dB**. Only FSPL
   depends on range, and it grows 20 log10(10) = 20 dB per decade of range.
2. The margin reaches zero when 20 log10(d / 2,000 km) = 92.12 dB, at d = 2,000 × 10^(92.12/20) =
   **80,770,682 km** (about 0.54 AU). At that range the engine gives a margin of **0.000 dB**.
3. At 1 AU the margin is **-5.35 dB**: the link does not close. The rate enters as −10 log10(R_b),
   so the highest rate that closes is 1e6 × 10^(−5.35/10) = **291.5 kbit/s**. At 290 kbit/s
   (`data_rate_bps = 2.9e5`) the margin is **+0.02 dB** and the link closes.
4. S band **103.42 dB**, X band **92.12 dB**, Ka band **80.53 dB**. Only FSPL changes, by 20 log10 of
   the frequency ratio: from X (8.42 GHz) to Ka (32 GHz) the loss grows by **11.60 dB**. With EIRP and
   G/T held fixed this is the whole story; in practice a higher band gives more antenna gain for the
   same dish, which this calculation leaves to the EIRP and G/T you enter.

## Track notes

- **MATLAB:** [`solutions/lab2.m`](solutions/lab2.m) uses `regexprep` on the `key = value` line and a
  `for` loop; plot with `semilogx(ranges, margins)` if you like.
- **LabVIEW:** a **For Loop** around **Format Into String** (build the `range_km = …` line), **Search
  and Replace String** (regular expression `(?m)^range_km = .*$`) and `Kshana Run Scenario.vi`; collect
  `margin_db` in an indexing tunnel and wire it to a **Waveform Graph**.
- **Python:** [`solutions/lab2.py`](solutions/lab2.py), which also checks every answer above against
  the engine.
