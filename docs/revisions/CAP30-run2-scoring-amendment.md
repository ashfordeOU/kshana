<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAP-30 run 2 (release 0.36): scoring amendment R2-A1 and the run-2 result

**Programme rule R4:** a changed published number is a revision. No published number changes
here. This entry discloses an amendment made after a scored run.

## What happened

- Run 2 of the Mars short-arc orbit determination (`xval/mro-od/PREREGISTRATION-RUN2.md`,
  committed alone before the run) was executed once on the scored arc. The fit converged, but
  the harness stopped while computing B3/B4: it sampled the estimate up to 2007-305T12:45 UTC,
  beyond the fit's integrated span. Only the iteration log was seen, and it already put B2 above
  its bar.
- Amendment R2-A1, committed alone, changed only the scoring. B3/B4 sample the estimate
  propagated over the whole scored arc. The deterministic fit was executed again unchanged;
  its iteration log matched the first execution line for line, with B2 = 0.04856 Hz both times.
- Run 1's harness has the same latent sampling defect. It was never reached, and run 1 is not
  re-scored.

## Cells

| Ledger row | was | is |
|---|---|---|
| TRK-2-18 status | MODELLED | MODELLED (unchanged) |
| Run-2 orbit bars | none | B2 NOT MET 0.04856 Hz; B3 MET 0.362 km; B4 MET 0.527 km; B5 MET 2.9 % |
