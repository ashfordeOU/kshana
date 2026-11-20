# Source of this vector

DOCUMENT vector. The input is the three example output lines of Unicore's *Reference Commands Manual
for N4 High Precision Products* V2 R1.13 (en.unicore.com), copied byte for byte with their CRCs:
§7.5.36 `FREQJAMSTATUSA` (message 519, Table 7-91), §7.5.49 `JAMSTATUSA` (message 511, Table 7-106) and
§7.5.7 `AGCA` (message 220, Table 7-55), each line ended with CR LF. The ASCII header is Table 7-49 and
the CRC (over the characters between `#` and `*`) Table 7-46; `conformance/tools/gen_receiver_format_vectors.py`
checks each CRC before it writes the file.

What the expected output states, and why: `FREQJAMSTATUS` gives L1 `CWFlag` 2 (strong CW jam), read as the
receiver's jamming state 3; `JAMSTATUS` gives `CWFlag` 0, state 1; `AGC` gives the master antenna's L1, L2
and L5 values 44, 46 and 63, whose mean (51) is the epoch's AGC. The mapping of the flag to a state is
Kshana's (`src/receiver_trust/machines/unicore.rs`), not the manual's.
