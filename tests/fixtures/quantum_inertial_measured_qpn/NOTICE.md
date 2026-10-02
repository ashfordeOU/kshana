# Fixtures for tests/quantum_inertial_measured_qpn.rs

Digitised numbers only; the papers themselves are not vendored.

| File | Source | Generator |
|---|---|---|
| gauguet2009_fig14.csv | A. Gauguet, B. Canuel, T. Lévèque, W. Chaibi, A. Landragin, "Characterization and limits of a cold-atom Sagnac interferometer", Physical Review A 80, 063604 (2009); arXiv:0907.2580v3, Figure 14 (measured rotation noise at one second, blue squares) | digitise_gauguet2009_fig14.py |
| janvier2022_fig2b_qpn_line.csv | C. Janvier, V. Ménoret, B. Desruelle, S. Merlet, A. Landragin, F. Pereira dos Santos, "A compact differential gravimeter at the quantum projection noise limit", Physical Review A 105, 022801 (2022); arXiv:2201.03345v1, Figure 2B (the authors' quantum-projection-noise model line, black dashed) | digitise_janvier2022_fig2b.py |

Licence: the numbers are facts read from published figures, cited with their source;
the arXiv preprints are distributed under the arXiv non-exclusive licence and are not
redistributed here. Retrieved from arxiv.org on 2026-10-01; digitised 2026-10-02.

SHA-256 of the input PDFs (arXiv versions above):
- 0907.2580v3: fee71c36c9013c52ef4d501578ecd18857f6a85b41fafe3a834949c46ed0fed0
- 2201.03345v1: a7f840be506ded8b00b929717d05f436d4b2d98750ac934c96a0b00abbcd4582

SHA-256 of the CSV files as committed:
- gauguet2009_fig14.csv: 7a62ff02ce48cd5213ca8f4330167fe310c154e1ea2be9f1365b4b46c897ee7c
- janvier2022_fig2b_qpn_line.csv: c89be95c1afa3dd05bed438bae7d48eb75973e8f897cc926902656f8772b18ac

Reproduce: `python3 digitise_gauguet2009_fig14.py 0907.2580v3.pdf > gauguet2009_fig14.csv`
and `python3 digitise_janvier2022_fig2b.py 2201.03345v1.pdf > janvier2022_fig2b_qpn_line.csv`.
