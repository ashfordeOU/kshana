# Source of this vector

SELF-DERIVED vector: an RTCM 3 stream built by `conformance/tools/gen_receiver_format_vectors.py` with
GPS MSM1, MSM2 and MSM3 (satellites 5 and 12, signals 1C and 2S, three cells, invalid-value markers in
some cells), a BeiDou MSM5 and a Galileo MSM6. Field widths and order from the open decoders RTKLIB
`rtcm3.c` (demo5, BSD 2-Clause) and pyrtcm 1.2.0 (BSD 3-Clause), as for `../rtcm3-decode`; no RTCM
document text was consulted. MSM1-3 send no whole milliseconds, so their ranges are modulo one
light-millisecond (`modulo_1ms`). Invented values.
