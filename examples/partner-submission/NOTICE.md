# examples/partner-submission

A made-up example of a data-partner submission (`kshana.partner-submission/1`) and its data file, written by `generate.py`
from a linear congruential generator. **The record is synthetic: it is not a measurement of any clock and says nothing about
any device.** It exists so that `kshana partner check examples/partner-submission/submission.toml` and the tests have
something to read, and so a partner can see the shape of a submission. The statement `measured_not_simulated = true` in
the file is there to show the field; a real submission must make it truthfully, and this one does not. See
`docs/PARTNER-DATA.md`.
