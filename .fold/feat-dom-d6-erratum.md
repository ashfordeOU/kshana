# Draft erratum note for the LSIS authors (not sent; for the founder)

**To:** the authors of the LunaNet Signal-In-Space Recommended Standard - Augmented Forward
Signal (LSIS), Volume A (NASA, ESA, JAXA)
**Document:** LSIS V1.0, 29 January 2025 (ESC-CCR-0690 initial release), PDF SHA-256
`986e07959f527d24280d87b5477298424ffdf754c4625f08041b5749592e61b6`

**Subject:** Table E-5, PRN 147, "Last 24 Chips (HEX)" duplicates the PRN 151 entry

Table E-5 ("1500 Chip tertiary Weil code index k for PRN 127-168", page 61) gives the last 24
chips of tertiary PRN 147 (Weil index 607) as `A14850`. The same table gives `A14850` for
PRN 151 (Weil index 612). The code generated from the Appendix E construction with k = 607
ends in `5677E8`, and so does the PRN 147 line of the standard's own electronic attachment
`008_Weil1500hex210prns.txt` [Annex3]. With k = 612 the generated code ends in `A14850`,
matching the PRN 151 cell. The PRN 147 cell therefore appears to repeat the PRN 151 value; the
correct value is `5677E8`.

We compared every generated chip of the AFS-I, AFS-Q primary and tertiary codes of PRNs 1-210,
the two Legendre tables and every printed G2 initialisation and first/last 24 chips with the
standard's tables and Annex 3 files (2 937 232 chips and bits); this cell is the only
difference.

Four typographical notes from the same comparison, offered for the next revision:

- The caption of Table D-1 reads "AFS-Q Primary Code 10233 Legendre Sequence"; the text and the
  code construction use length 10223.
- Table D-2 prints PRN 38 as "3" (the same entry reads "3" in IS-GPS-800J Table 3.2-2).
- Table 17 gives the interleaver as "60 x 98 (n columns x k rows)", while the text of
  2.4.3.1.5 describes 60 rows and 98 columns.
- Table E-5 prints three "last 24 chips" fields without their leading zeros (PRN 127 `37936`,
  PRN 132 `9394`, PRN 134 `99982`).

The comparison is described at <repository link to be added by the sender>.
