# docs--kind-tracking-loop: translations (da)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = ingen værdi

seg-59afd80736c5 = <b>PARTNER</b> Ikke leveret — Kshana modellerer signalydelse, ikke nyttelast- eller antennehardware. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenarietype i motoren v{ $version }, familie <a1>Jamming, spoofing og spektret</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spektret</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> hviler ikke længere sin nægtelseskontur på ét enkelt skalartal.

seg-05e8854de548 = chip

seg-4f57723d340e = Kilde: <c1/>

seg-e84aabe07c43 = <c1/> (scenarietype)

seg-f6ff1c8c78db = Tab af lås i sporingssløjfen: C/N0 -> lås/oplåsning MED HYSTERESE, den tid det tager at miste låsen, og spoof-indtrækning som funktion af kode- og bærebølge-offset-RATE. Motorens eksisterende kriterier for nægtelse og overtagelse er forhold på modtaget effekt (en jammer nægter ved J/S = { "30" } dB, en spoofer overtager ved { "3" } dB); et reelt tab af lås er ikke et effektforhold, det er der, hvor en sløjfes jitter plus dynamiske belastning forlader dens sporingstærskelbudget. Rapporterer ({ "1" }) bærebølge- (Costas) og kode- (ikke-kohærent early/late) 1-sigma termisk jitter mod C/N0, kvadreringstab inkluderet, mod de angivne regler { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersreglen i tre-sigma-form) og { "3" }</em>sigma_DLL + rampeforsinkelse <= d/2 chips; ({ "2" }) tærsklerne for tab og genindfangning af C/N0 med den bindende sløjfe angivet, genindfangningstærsklen AFLEDT af den bredere båndbredde, en modtager genindtrækker ved, frem for blot påstået, så hysteresebredden skal ligge mellem { "5" }<em>log10(ratio) og { "10" }</em>log10(ratio) dB; ({ "3" }) den erklærede tid til tab af lås fra en låsdetektor med to tærskler og bekræftelsesophold, drevet over en C/N0-rampe, rapporteret adskilt fra den fysiske faseundslippelsestid (Viterbis middeltid mellem cycle slips, i log10 s, fordi den spænder over hundredvis af dekader); ({ "4" }) grænser for spoof-indtrækning — den største kodeslew og bærebølge-Dopplerrate, et offers sløjfer kan følge, med et kort over begge akser, fordi en spoofer, der slewer hurtigere end disse, ikke overtager sløjfen, men løber fra den; og ({ "5" }) NÆGTELSESRADIUSEN, som sløjfedynamikken medfører, rapporteret SAMMEN MED den eksisterende effektforholdsradius, aldrig i stedet for den, med deres fortegnsbehæftede forskel som et eget navngivet felt (denial_radius_delta_km) og en definition ved siden af. Hvert udsendt numerisk felt har en enhed og en proveniensklasse. VALIDATED lukkede former: udtrykkene for bærebølge- og kodejitter, sløjfefilterreduktionen sqrt({ "2" }<em>B_n</em>T) og første ordens rampeforsinkelse er krydskontrolleret mod motorens egen sdr-korrelator, trinvist kørt på seedet syntetisk IF — en anden vej til de samme tal — til henholdsvis { "0.6" } %, { "3.7" } % og { "0.17" } %, og den modificerede Bessel I0 bag cycle-slip-tiden mod standardtabellerede værdier til { "1e-7" }. Den nedre gyldighedsgrænse er hævdet, ikke blot angivet: under ~{ "32" } dB-Hz ved { "1" } ms mættes den reelle atan-diskriminator mod sit +-pi/2-område og måler mindre jitter end enhver lineær teori. MODELLED: sløjfebåndbredder, integrationstid, korrelatorafstand, indtrækningsbåndbreddeforhold, bekræftelsesophold, jammereffekt og antenneforstærkninger er repræsentative båndtal, ikke et datablad. IKKE modelleret: oscillator- (Allan-deviation) og vibrationsjitter, begrænsning af front-end-båndbredde, multipath, AGC-dynamik, tab ved databittransitioner, ekstern støtte og enhver halvcyklus-korrektion af Costas-cycle-slip-formlen. Under sløjfedynamik har spoof-overtagelse slet ingen radius — den bindende begrænsning er offset-raten, ikke effekten — så dette felt er null med en begrundelse frem for et opdigtet tal. Ikke et certificeret produkt til modtagerydeevne.

seg-62d230dfccce = Én kørsel af <c1/> opsummeres som: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (carrier binds), relock { "27.4413" } dB-Hz, hysteresis { "1.9669" } dB | loss of lock declared { "39.101" } s into the ramp | denial radius threshold(J/S { "30" } dB) { "127.413" } km vs loop dynamics { "53.1694" } km, delta -74.2438 km | spoof pull-in <= { "0.966" } chip/s code and { "41.45" } Hz/s carrier (MODELLED loop, VALIDATED closed forms)

seg-7614718317f4 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Eksemplet <c1/> angiver blandt andet:

seg-773fff0feaf7 = omsluttet

seg-23f3aa5c2064 = Resultatbetegnelse (motorens): MIXED — VALIDATED lukkede sløjfeformer, MODELLED sløjfekonfiguration. Udtrykkene for termisk jitter i bærebølge og kode, sløjfefilterreduktionen sqrt({ "2" }<em>B_n</em>T) og første ordens rampeforsinkelse er krydskontrolleret mod motorens egen sdr-korrelator, trinvist kørt på seedet syntetisk IF (en anden vej

seg-72182c1aecd9 = Diagrammet, som motoren skriver for scenarios/tracking-loop.toml, type tracking-loop

seg-346594a654f2 = <b>MODELLED</b> Tab af lås beregnet ud fra sløjfedynamik i stedet for et effektforhold: bærebølge- (Costas) og kode- (ikke-kohærent early/late) 1σ termisk jitter mod C/N₀ med kvadreringstabet, mod de angivne regler 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeforsinkelse

seg-3aa7f9748dc2 = <b>MODELLED</b> Tab af lås beregnet ud fra sløjfedynamik i stedet for et effektforhold: bærebølge- (Costas) og kode- (ikke-kohærent early/late) 1σ termisk jitter mod C/N₀ med kv. Uafhængig reference (ReferenceImpl): Motorens egen sdr-korrelator (sdr::correlate / synth_if / CaCode), trinvist kørt på seedet syntetisk IF ved en kalibreret C/N₀ — en separat kodevej, der når de samme tal ved numerisk korrelation af samplet IQ frem for ved et algebraisk jitterudtryk, så den er en anden vej og ikke en gentagelse — plus standardtabellerede værdier af den modificerede Bessel I₀ for cycle-slip-leddet. Sløjfeteori ifølge Kaplan & Hegar

seg-de048f9cf1f6 = MIXED — VALIDATED lukkede sløjfeformer, MODELLED sløjfekonfiguration. Udtrykkene for termisk jitter i bærebølge og kode, sløjfefilterreduktionen sqrt({ "2" }<em>B_n</em>T) og første ordens rampeforsinkelse er krydskontrolleret mod motorens egen sdr-korrelator, trinvist kørt på seedet syntetisk IF (en anden vej til de samme tal), og den modificerede Bessel I0 mod standardtabellerede værdier. MODELLED: sløjfebåndbredder, integ (resultat <c1/>)

seg-0dc70b7607f0 = MODELLED: sløjfebåndbredder, integrationstid, korrelatorafstand, indtrækningsbåndbreddeforhold, bekræftelsesophold, jammereffekt og antenneforstærkninger er repræsentative båndtal, ikke et datablad. (typekatalog (<c1/>))

seg-a679a9732b2a = IKKE modelleret: oscillator- (Allan-deviation) og vibrationsjitter, begrænsning af front-end-båndbredde, multipath, AGC-dynamik, tab ved databittransitioner, ekstern støtte og enhver halvcyklus-korrektion af Costas-cycle-slip-formlen. (typekatalog (<c1/>))

seg-f8d50cbc6f2c = Hver sløjfeparameter nedenfor er et MODELLED repræsentativt båndtal, ikke et datablad. (kommentar i scenariefilen, linje { "22" })

seg-9241a57823cd = --- sløjfegeometri ----------------------------------------------------------------- En { "10" } Hz Costas-bærebølgesløjfe og en { "1" } Hz bærebølgestøttet kodesløjfe, { "1" } ms kohærent integration (én C/A-koneperiode, så der antages ingen databitsynkronisering), smal { "0.5" } chip-korrelator. (kommentar i scenariefilen, linje { "25" } til { "28" })

seg-3a677e343081 = Tab af lås i sporingssløjfen og spoof-indtrækning under interferens er MODELLED, ikke valideret: kontrolleret mod en separat implementering i samme kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Forrige</s1>timetransfer
