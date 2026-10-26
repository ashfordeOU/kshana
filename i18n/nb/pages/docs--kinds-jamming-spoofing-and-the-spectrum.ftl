# docs--kinds-jamming-spoofing-and-the-spectrum: translations (nb)

seg-b03d56f501c3 = Type

seg-98e740d32860 = Evalueringstestbenk for maskinlæringsbasert deteksjon av RF-forstyrrelser ({ "13494" }): generer et merket, parameterforankret SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), vurder en detektor (energy|agc|sqm|parity|fused) med den detektoruavhengige harnessen, og rapporter AUC/ROC/forvekslingsmatrise + Pd per klasse ved en målsatt Pfa, samt optimismegapet mellom i og utenfor distribusjonen. Kun MODELLED driftskarakteristikker, aldri felt-/IQ-data, ingen dom om bra/dårlig.

seg-7e7b07bc5545 = Diagrammet motoren skriver for scenarios/impairment-eval.toml, typen impairment-eval

seg-60bf3f0ff000 = Jamming med linkbudsjett: J/S → effektiv C/N₀ → tap av lås.

seg-42d46b928d09 = Diagrammet motoren skriver for scenarios/jamming-demo.toml, typen jamming

seg-fef00c827c6a = Spektrummodell og fossefall for L-båndet: hele GNSS L-båndet som én effekttetthet (PSD), frekvens på tvers, tid nedover, over en skriptet tidslinje for jammere. SIGNALER: GPS L1 C/A og L2C (BPSK({ "1" })), Galileo E1 åpen tjeneste (MBOC(6,1,1/11) eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), hver ved sin bærebølge med minste mottatte effekt fra grensesnittspesifikasjonen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) med mindre den overstyres; GLONASS, BeiDou og Galileo E6 er ikke modellert. JAMMERE: tone med kontinuerlig bølge, flatt smalbåndsstøy, lineær sagtannchirp og bredbåndsstøy tilpasset et bånds egen modulasjon, hver med et senter, en båndbredde, en mottatt effekt (direkte, eller EIRP og avstand gjennom frirommstapet til jamming-typen) og tidspunkter for på og av. Hver jammer vurderes mot hvert bånd med sin spektrale separasjonskoeffisient kappa over mottakerens båndbredde, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer er dette lik anti-jam-ligningen til jamming-typen med Q = 1/(R_c kappa), og rapporten bærer den kontrollen (og tallet for representativ Q i jamming-typen ved siden av). Støygulvet er k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Fossefallet midler hver celle over sin bin og sin rad (chirper eksakt, hele sveip pluss det delvise; jammere som slår om midt i raden etter sin driftssyklus), slik at C/N0-tidslinjen og bildet kommer fra de samme tallene; result.json bærer nettet blokkmidlet i effekt, C/N0 og J/S per bånd per rad, og per jammer per bånd SSC, Q, J/S, J/S i båndet og stabil C/N0. Valgfri [iq]: modellen tegnet som kompleks IQ ved ett tidspunkt, skrevet til og lest tilbake fra en SigMF-opptaking (cf32_le eller ci16_le), og sammenlignet med et Welch-estimat. Valgfri [recording] (native bygg): Welch-PSD-en til en virkelig SigMF-opptaking ved siden av modellen. VALIDATED: signalenes PSD-er mot lærebokens bredder på hovedloben (BPSK(n) 2n x { "1.023" } MHz null til null; BOC({ "1,1" })-lober sentrert ved +/-1.023 MHz) og de spektrale separasjonskoeffisientene mot sine lukkede former etter Parseval og Kaplan & Hegartys Q = { "1" } (CW) og { "1.5" } (tilpasset). MODELLED: jammereffekter, tidslinje, båndbredder i frontenden, behandlingen av kontinuerlig spektrum (ingen kodelinjer) og fraværet av AGC, blanking og antennediagram.

seg-ea1678eb9e84 = Diagrammet motoren skriver for scenarios/l-band-waterfall-jamming.toml, type spectrum

seg-f43fe94d84e0 = Kombinert spoofingdetektor for RF og målinger (RAIM-konsistens over flere SV + AGC + SQM, fusjonert) mot et parametrisert angrep (effektfordel, justering av bærebølgefase, push av tid/posisjon; i stil med TEXBAT).

seg-268ebf4cba99 = Diagrammet motoren skriver for scenarios/spoof-detect.toml, type spoof-detect

seg-cbd77f6ffd63 = Stokastisk detektor for tidsspoofing (Neyman–Pearson / χ²₁) med Monte Carlo P_fa/P_md.

seg-6f6a8c975111 = Diagrammet motoren skriver for scenarios/spoof-attack.toml, type spoof

seg-f6ff1c8c78db = Tap av lås i sporingssløyfen: C/N0 -> lås/ulåst MED HYSTERESE, tiden det tar å miste låsen, og spoof pull-in som funksjon av kode- og bærebølgeforskyvningens HASTIGHET. Motorens eksisterende kriterier for denial og capture er forholdstall på mottatt effekt (en jammer nekter ved J/S = { "30" } dB, en spoofer overtar ved { "3" } dB); reelt tap av lås er ikke et effektforhold, men det punktet der en sløyfes jitter pluss dynamisk belastning sprenger budsjettet for sporingsterskelen. Rapporterer ({ "1" }) 1-sigma termisk jitter for bærebølge (Costas) og kode (ikke-koherent early/late) mot C/N0, med kvadreringstap, mot de oppgitte reglene { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersregelen i tresigmaform) og { "3" }</em>sigma_DLL + rampeetterslep <= d/2 chip; ({ "2" }) terskelverdiene for tap og gjenopprettet lås i C/N0 med den bindende sløyfen navngitt, der terskelen for gjenopprettet lås er UTLEDET av den bredere båndbredden en mottaker henter seg inn igjen med, i stedet for å være påstått, slik at hysteresebredden må ligge mellom { "5" }<em>log10(forhold) og { "10" }</em>log10(forhold) dB; ({ "3" }) den deklarerte tiden til tap av lås fra en låsdetektor med to terskler og bekreftelsesopphold, drevet over en C/N0-rampe, rapportert atskilt fra den fysiske faseflukttiden (Viterbis midlere tid mellom syklusslipp, i log10 s fordi den spenner over hundrevis av tiere); ({ "4" }) grenser for spoof pull-in — den største kodeslewen og Doppler-raten for bærebølgen en offersløyfe kan følge, med et kart over begge akser, fordi en spoofer som slewer raskere enn dette ikke fanger sløyfen, men løper fra den; og ({ "5" }) NEKTELSESRADIUSEN sløyfedynamikken tilsier, rapportert SAMMEN MED den eksisterende effektforholdsradiusen, aldri i stedet for den, med deres fortegnsbelagte differanse som et eget navngitt felt (denial_radius_delta_km) og en definisjon ved siden av. Hvert utgitt numerisk felt har en enhet og en proveniensklasse. VALIDATED lukkede former: uttrykkene for jitter i bærebølge og kode, sløyfefilterreduksjonen sqrt({ "2" }<em>B_n</em>T) og førsteordens rampeetterslep er kryssjekket mot motorens egen sdr-korrelator, stegvis kjørt på seedet syntetisk IF — en annen vei til de samme tallene — til henholdsvis { "0.6" } %, { "3.7" } % og { "0.17" } %, og den modifiserte Bessel I0 bak syklusslipptiden mot standard tabulerte verdier til { "1e-7" }. Den nedre gyldighetsgrensen er påstått, ikke bare oppgitt: under ~{ "32" } dB-Hz ved { "1" } ms metter den reelle atan-diskriminatoren mot sitt +-pi/2-område og måler mindre jitter enn noen lineær teori. MODELLED: sløyfebåndbreddene, integrasjonstiden, korrelatoravstanden, forholdet for pull-in-båndbredde, bekreftelsesoppholdene, jammereffekten og antenneforsterkningene er representative båndverdier, ikke et datablad. IKKE modellert: oscillatorjitter (Allan-deviasjon) og vibrasjonsjitter, båndbreddebegrensning i frontenden, flerveisutbredelse, AGC-dynamikk, tap ved databitovergang, ekstern støtte, og enhver halvsyklus-korreksjon i Costas' syklusslippformel. Under sløyfedynamikk har spoof-capture ingen radius i det hele tatt — den bindende begrensningen er forskyvningsraten, ikke effekten — så det feltet er null med en begrunnelse i stedet for et oppdiktet tall. Ikke et sertifisert produkt for mottakerytelse.

seg-72182c1aecd9 = Diagrammet motoren skriver for scenarios/tracking-loop.toml, type tracking-loop

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-f6a18b7cb172 = Kilde: <c1/>

seg-d4ae70a5d619 = Jamming, spoofing og spekteret (scenariotypefamilie)

seg-b4b8b72e060b = Temasider: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Kjør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-cc031b964086 = Kontaktark over diagrammene motoren skriver for typene i familien Jamming, spoofing og spekteret

seg-bbbd87f888b9 = Tap av lås i sporingssløyfen: C/N0 -> lås/ulåst MED HYSTERESE, tiden det tar å miste låsen, og spoof pull-in som funksjon av kode- og bærebølgeforskyvningens HASTIGHET.

seg-e37f1e071b2c = Spektrummodell og vannfall for L-båndet: hele GNSS L-båndet som én effektspektraltetthet (PSD), frekvens bortover, tid nedover, over en skriptet jammer-tidslinje.

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = Testbenk for evaluering av maskinlæringsbasert deteksjon av RF-forstyrrelser ({ "13494" }): generer et merket, parameterforankret SYNTETISK korpus (nominell/jamming/spoof-tid/spoof-posisjon/multipath), vurder en detektor (energy/agc/s

seg-f6dcb5b36454 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-7bb2f42902f0 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>jamming</a1>.

seg-d5f06ff66e1b = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1bd760afbaca = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>spoof</a1>.

seg-fb15ecc29f7c = Obligatoriske felt: <c1/>. Valgfrie: <c2/>, <c3/>.

seg-15c08ee5ae76 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>spoof-detect</a1>.

seg-c65b9d45bdcc = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

seg-bd1b04ccfe22 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>tracking-loop</a1>.

seg-5024b537d000 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-a73f44c04565 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>spectrum</a1>.

seg-cbcc6f5302b8 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-d14fa8348a2a = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>impairment-eval</a1>.

seg-5242026d2998 = <s1>Forrige</s1>Treghets-, fusjons- og kvantesensorer

seg-6b9b04e59491 = <s1>Neste</s1>Navigasjon i lav jordbane
