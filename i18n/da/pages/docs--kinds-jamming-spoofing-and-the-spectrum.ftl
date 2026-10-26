# docs--kinds-jamming-spoofing-and-the-spectrum: translations (da)

seg-b03d56f501c3 = Type

seg-98e740d32860 = Testbed til evaluering af maskinlæringsbaseret detektion af RF-forstyrrelser ({ "13494" }): generér et mærket, parameterforankret SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), bedøm en detektor (energy|agc|sqm|parity|fused) med den detektoruafhængige harness, og rapportér AUC/ROC/forvekslingsmatrix + Pd pr. klasse ved en mål-Pfa samt optimismegabet mellem fordeling inden for og uden for træning. Kun MODELLED driftskarakteristika, aldrig felt/IQ, ingen dom om god/dårlig.

seg-7e7b07bc5545 = Diagrammet, som motoren skriver for scenarios/impairment-eval.toml, scenarietype impairment-eval

seg-60bf3f0ff000 = Jamming med linkbudget: J/S → effektiv C/N₀ → tab af lås.

seg-42d46b928d09 = Diagrammet, som motoren skriver for scenarios/jamming-demo.toml, scenarietype jamming

seg-fef00c827c6a = Spektrummodel og vandfald for L-båndet: hele GNSS-L-båndet som én effektspektraltæthed (PSD), frekvens på tværs og tid nedad, over en scriptet tidslinje for jammere. SIGNALER: GPS L1 C/A og L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11) eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), hver på sin bærebølge med den mindste modtagne effekt fra grænsefladespecifikationen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), medmindre den tilsidesættes; GLONASS, BeiDou og Galileo E6 er ikke modelleret. JAMMERE: tone med kontinuert bølge, flad smalbåndsstøj, lineær savtands-chirp og bredbåndsstøj afstemt efter et bånds egen modulation, hver med en centerfrekvens, en båndbredde, en modtaget effekt (direkte eller EIRP og afstand gennem frirumsdæmpningen i jamming-typen) og tidspunkter for til og fra. Hver jammer vurderes mod hvert bånd ved sin spektrale separationskoefficient kappa over modtagerens båndbredde, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer er dette lig med ligningen for anti-jam i jamming-typen med Q = 1/(R_c kappa), og rapporten bærer den krydskontrol (og tallet for repræsentativ Q fra jamming-typen ved siden af). Støjgulvet er k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Vandfaldet middelværdisætter hver celle over dens bin og dens række (chirps nøjagtigt, hele sweeps plus det delvise; jammere, der skifter midt i en række, efter deres duty), så tidslinjen for C/N0 og billedet kommer fra de samme tal; result.json bærer gitteret blokmiddelværdisat i effekt, C/N0 og J/S pr. række for hvert bånd og pr. jammer pr. bånd SSC, Q, J/S, J/S i båndet og stationær C/N0. Valgfri [iq]: modellen tegnet som kompleks IQ på ét tidspunkt, skrevet til og læst tilbage fra en SigMF-optagelse (cf32_le eller ci16_le) og sammenlignet med et Welch-estimat. Valgfri [recording] (native builds): Welch-PSD'en for en reel SigMF-optagelse ved siden af modellen. VALIDATED: signalernes PSD'er mod lærebogens bredder af hovedlap (BPSK(n) 2n x { "1.023" } MHz nul til nul; BOC({ "1,1" })-lapper centreret ved +/-1.023 MHz) og de spektrale separationskoefficienter mod deres lukkede former efter Parseval og Kaplan & Hegartys Q = { "1" } (CW) og { "1.5" } (afstemt). MODELLED: jammernes effekter, tidslinjen, båndbredderne i front-enden, behandlingen med kontinuert spektrum (ingen kodelinjer) og fraværet af AGC, blanking og antennediagram.

seg-ea1678eb9e84 = Diagrammet, som motoren skriver for scenarios/l-band-waterfall-jamming.toml, type spectrum

seg-f43fe94d84e0 = Kombineret detektor for spoofing i RF og målinger (RAIM-konsistens over flere SV + AGC + SQM, fusioneret) mod et parametriseret angreb (effektfordel, justering af bærebølgefase, skub i tid/position; i stil med TEXBAT).

seg-268ebf4cba99 = Diagrammet, som motoren skriver for scenarios/spoof-detect.toml, type spoof-detect

seg-cbd77f6ffd63 = Stokastisk detektor for tidsspoofing (Neyman–Pearson / χ²₁) med Monte Carlo-P_fa/P_md.

seg-6f6a8c975111 = Diagrammet, som motoren skriver for scenarios/spoof-attack.toml, type spoof
