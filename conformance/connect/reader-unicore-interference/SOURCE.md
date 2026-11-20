# Source of this vector

SELF-DERIVED vector, built by `conformance/tools/gen_receiver_format_vectors.py` from the layouts of
Unicore's *Reference Commands Manual for N4 High Precision Products* V2 R1.13: the binary header (Table
7-48), `OBSVM` (message 12, Table 7-126), `AGC` (220, Table 7-55), `JAMSTATUS` (511, Table 7-106) and
`FREQJAMSTATUS` (519, Table 7-91). Three epochs in which one GPS satellite's C/N0 falls, the AGC falls and
the CW flag rises from 0 to 1; the last epoch adds a `FREQJAMSTATUS` with L1 flag 2. Invented values: no
receiver output is reproduced.
