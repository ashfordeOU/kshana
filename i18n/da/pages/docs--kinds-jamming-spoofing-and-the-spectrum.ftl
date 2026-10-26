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

seg-f6ff1c8c78db = Tab af lås i sporingssløjfen: C/N0 -> lås/oplåsning MED HYSTERESE, den tid det tager at miste låsen, og spoof-indtrækning som funktion af kode- og bærebølge-offset-RATE. Motorens eksisterende kriterier for nægtelse og overtagelse er forhold på modtaget effekt (en jammer nægter ved J/S = { "30" } dB, en spoofer overtager ved { "3" } dB); et reelt tab af lås er ikke et effektforhold, det er der, hvor en sløjfes jitter plus dynamiske belastning forlader dens sporingstærskelbudget. Rapporterer ({ "1" }) bærebølge- (Costas) og kode- (ikke-kohærent early/late) 1-sigma termisk jitter mod C/N0, kvadreringstab inkluderet, mod de angivne regler { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersreglen i tre-sigma-form) og { "3" }</em>sigma_DLL + rampeforsinkelse <= d/2 chips; ({ "2" }) tærsklerne for tab og genindfangning af C/N0 med den bindende sløjfe angivet, genindfangningstærsklen AFLEDT af den bredere båndbredde, en modtager genindtrækker ved, frem for blot påstået, så hysteresebredden skal ligge mellem { "5" }<em>log10(ratio) og { "10" }</em>log10(ratio) dB; ({ "3" }) den erklærede tid til tab af lås fra en låsdetektor med to tærskler og bekræftelsesophold, drevet over en C/N0-rampe, rapporteret adskilt fra den fysiske faseundslippelsestid (Viterbis middeltid mellem cycle slips, i log10 s, fordi den spænder over hundredvis af dekader); ({ "4" }) grænser for spoof-indtrækning — den største kodeslew og bærebølge-Dopplerrate, et offers sløjfer kan følge, med et kort over begge akser, fordi en spoofer, der slewer hurtigere end disse, ikke overtager sløjfen, men løber fra den; og ({ "5" }) NÆGTELSESRADIUSEN, som sløjfedynamikken medfører, rapporteret SAMMEN MED den eksisterende effektforholdsradius, aldrig i stedet for den, med deres fortegnsbehæftede forskel som et eget navngivet felt (denial_radius_delta_km) og en definition ved siden af. Hvert udsendt numerisk felt har en enhed og en proveniensklasse. VALIDATED lukkede former: udtrykkene for bærebølge- og kodejitter, sløjfefilterreduktionen sqrt({ "2" }<em>B_n</em>T) og første ordens rampeforsinkelse er krydskontrolleret mod motorens egen sdr-korrelator, trinvist kørt på seedet syntetisk IF — en anden vej til de samme tal — til henholdsvis { "0.6" } %, { "3.7" } % og { "0.17" } %, og den modificerede Bessel I0 bag cycle-slip-tiden mod standardtabellerede værdier til { "1e-7" }. Den nedre gyldighedsgrænse er hævdet, ikke blot angivet: under ~{ "32" } dB-Hz ved { "1" } ms mættes den reelle atan-diskriminator mod sit +-pi/2-område og måler mindre jitter end enhver lineær teori. MODELLED: sløjfebåndbredder, integrationstid, korrelatorafstand, indtrækningsbåndbreddeforhold, bekræftelsesophold, jammereffekt og antenneforstærkninger er repræsentative båndtal, ikke et datablad. IKKE modelleret: oscillator- (Allan-deviation) og vibrationsjitter, begrænsning af front-end-båndbredde, multipath, AGC-dynamik, tab ved databittransitioner, ekstern støtte og enhver halvcyklus-korrektion af Costas-cycle-slip-formlen. Under sløjfedynamik har spoof-overtagelse slet ingen radius — den bindende begrænsning er offset-raten, ikke effekten — så dette felt er null med en begrundelse frem for et opdigtet tal. Ikke et certificeret produkt til modtagerydeevne.

seg-72182c1aecd9 = Diagrammet, som motoren skriver for scenarios/tracking-loop.toml, type tracking-loop

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-f6a18b7cb172 = Kilde: <c1/>

seg-d4ae70a5d619 = Jamming, spoofing og spektret (scenarietypefamilie)

seg-b4b8b72e060b = Emnesider: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Kør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-cc031b964086 = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Jamming, spoofing og spektret

seg-bbbd87f888b9 = Tab af lås i sporingssløjfen: C/N0 -> lås/oplåsning MED HYSTERESE, den tid det tager at miste låsen, og spoof-indtrækning som funktion af kode- og bærebølge-offset-RATE.

seg-e37f1e071b2c = L-bånds-spektrummodel og vandfaldsdiagram: hele GNSS L-båndet som én effektspektraltæthed (PSD), frekvens på tværs, tid nedad, over en scriptet jammer-tidslinje.

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = Testbænk til evaluering af maskinlæringsbaseret detektion af RF-forstyrrelser ({ "13494" }): generér et mærket, parameterforankret SYNTETISK korpus (nominel/jamming/spoof-tid/spoof-position/multipath), bedøm en detektor (energy/agc/s

seg-f6dcb5b36454 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-7bb2f42902f0 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>jamming</a1>.

seg-d5f06ff66e1b = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1bd760afbaca = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>spoof</a1>.

seg-fb15ecc29f7c = Obligatoriske felter: <c1/>. Valgfrie: <c2/>, <c3/>.

seg-15c08ee5ae76 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>spoof-detect</a1>.

seg-c65b9d45bdcc = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

seg-bd1b04ccfe22 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>tracking-loop</a1>.

seg-5024b537d000 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-a73f44c04565 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>spectrum</a1>.

seg-cbcc6f5302b8 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-d14fa8348a2a = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>impairment-eval</a1>.

seg-5242026d2998 = <s1>Forrige</s1>Inertial fusion og kvantesensorer

seg-6b9b04e59491 = <s1>Næste</s1>Navigation i lav jordbane
