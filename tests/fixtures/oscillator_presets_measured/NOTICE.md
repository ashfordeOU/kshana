# Fixtures for tests/oscillator_presets_measured.rs

| File | Source | Licence | Generator |
|---|---|---|---|
| thu2_8040c_esa_mgex.csv | ESA/ESOC Navigation Office, MGEX final 30 s clock products (ESA0MGNFIN_YYYYDDD0000_01D_30S_CLK.CLK.gz), http://navigation-office.esa.int/products/gnss-products/ ; the receiver clock of IGS station THU2, whose site log (thu200grl_20260327.log, section 6.3) records a Symmetricom 8040C rubidium standard, s/n 0652013964, from 2013-03-19 to 2019-05-04 | IGS products: open use with attribution (IGS data policy); attribution: ESA/ESOC Navigation Support Office and the International GNSS Service | fetch_thu2_8040c.py |
| sa45s_lutwak2011.csv | R. Lutwak, "The SA.45s Chip-Scale Atomic Clock - Early Production Statistics", Proc. 43rd PTTI Meeting (2011), pp. 207-219, Figures 4 and 8; http://time.kinali.ch/ptti/2011papers/Paper27.pdf | numbers read from a published figure, cited; the paper is not redistributed | digitise_lutwak2011.py |

Retrieved 2026-10-01 (paper) and 2026-10-02 (clock products). The per-day product
file names and SHA-256 sums are in the comment header of thu2_8040c_esa_mgex.csv.
Three pre-registered days have no THU2 record (2015-07-15, 2015-10-15, 2019-04-15)
and are listed there as missing; 19 days are used.

SHA-256:
- Paper27.pdf (input): b5a3ad437f01846f89d10e9670c91b0caff578650d47e3b723170d6a687e407f
- thu2_8040c_esa_mgex.csv: 32a211b8a6e6cbf0355d463bf349a1cf977d0a175d85f1d2ce307c2c203c7edb
- sa45s_lutwak2011.csv: 9b0926a8ffaa1d8b00c80087a93b568aadc7f75e506686d670887947c07673a1

The caesium oracle (the 5071A phase record) is not here: it has no redistribution
licence and is fetched by scripts/fetch_cs5071a.sh into the git-ignored cache.
