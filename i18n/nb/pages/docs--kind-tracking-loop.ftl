# docs--kind-tracking-loop: translations (nb)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = ingen verdi

seg-59afd80736c5 = <b>PARTNER</b> Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariotype i motoren v{ $version }, familie <a1>Jamming, spoofing og spekteret</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spekteret</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> hviler ikke lenger sin nektelseskontur på én skalar.

seg-05e8854de548 = chip

seg-4f57723d340e = Kilde: <c1/>

seg-e84aabe07c43 = <c1/> (scenariotype)

seg-f6ff1c8c78db = Tap av lås i sporingssløyfen: C/N0 -> lås/ulåst MED HYSTERESE, tiden det tar å miste låsen, og spoof pull-in som funksjon av kode- og bærebølgeforskyvningens HASTIGHET. Motorens eksisterende kriterier for denial og capture er forholdstall på mottatt effekt (en jammer nekter ved J/S = { "30" } dB, en spoofer overtar ved { "3" } dB); reelt tap av lås er ikke et effektforhold, men det punktet der en sløyfes jitter pluss dynamisk belastning sprenger budsjettet for sporingsterskelen. Rapporterer ({ "1" }) 1-sigma termisk jitter for bærebølge (Costas) og kode (ikke-koherent early/late) mot C/N0, med kvadreringstap, mot de oppgitte reglene { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-gradersregelen i tresigmaform) og { "3" }</em>sigma_DLL + rampeetterslep <= d/2 chip; ({ "2" }) terskelverdiene for tap og gjenopprettet lås i C/N0 med den bindende sløyfen navngitt, der terskelen for gjenopprettet lås er UTLEDET av den bredere båndbredden en mottaker henter seg inn igjen med, i stedet for å være påstått, slik at hysteresebredden må ligge mellom { "5" }<em>log10(forhold) og { "10" }</em>log10(forhold) dB; ({ "3" }) den deklarerte tiden til tap av lås fra en låsdetektor med to terskler og bekreftelsesopphold, drevet over en C/N0-rampe, rapportert atskilt fra den fysiske faseflukttiden (Viterbis midlere tid mellom syklusslipp, i log10 s fordi den spenner over hundrevis av tiere); ({ "4" }) grenser for spoof pull-in — den største kodeslewen og Doppler-raten for bærebølgen en offersløyfe kan følge, med et kart over begge akser, fordi en spoofer som slewer raskere enn dette ikke fanger sløyfen, men løper fra den; og ({ "5" }) NEKTELSESRADIUSEN sløyfedynamikken tilsier, rapportert SAMMEN MED den eksisterende effektforholdsradiusen, aldri i stedet for den, med deres fortegnsbelagte differanse som et eget navngitt felt (denial_radius_delta_km) og en definisjon ved siden av. Hvert utgitt numerisk felt har en enhet og en proveniensklasse. VALIDATED lukkede former: uttrykkene for jitter i bærebølge og kode, sløyfefilterreduksjonen sqrt({ "2" }<em>B_n</em>T) og førsteordens rampeetterslep er kryssjekket mot motorens egen sdr-korrelator, stegvis kjørt på seedet syntetisk IF — en annen vei til de samme tallene — til henholdsvis { "0.6" } %, { "3.7" } % og { "0.17" } %, og den modifiserte Bessel I0 bak syklusslipptiden mot standard tabulerte verdier til { "1e-7" }. Den nedre gyldighetsgrensen er påstått, ikke bare oppgitt: under ~{ "32" } dB-Hz ved { "1" } ms metter den reelle atan-diskriminatoren mot sitt +-pi/2-område og måler mindre jitter enn noen lineær teori. MODELLED: sløyfebåndbreddene, integrasjonstiden, korrelatoravstanden, forholdet for pull-in-båndbredde, bekreftelsesoppholdene, jammereffekten og antenneforsterkningene er representative båndverdier, ikke et datablad. IKKE modellert: oscillatorjitter (Allan-deviasjon) og vibrasjonsjitter, båndbreddebegrensning i frontenden, flerveisutbredelse, AGC-dynamikk, tap ved databitovergang, ekstern støtte, og enhver halvsyklus-korreksjon i Costas' syklusslippformel. Under sløyfedynamikk har spoof-capture ingen radius i det hele tatt — den bindende begrensningen er forskyvningsraten, ikke effekten — så det feltet er null med en begrunnelse i stedet for et oppdiktet tall. Ikke et sertifisert produkt for mottakerytelse.

seg-62d230dfccce = Én kjøring av <c1/> gir denne oppsummeringen: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (carrier binds), relock { "27.4413" } dB-Hz, hysteresis { "1.9669" } dB | loss of lock declared { "39.101" } s into the ramp | denial radius threshold(J/S { "30" } dB) { "127.413" } km vs loop dynamics { "53.1694" } km, delta -74.2438 km | spoof pull-in <= { "0.966" } chip/s code and { "41.45" } Hz/s carrier (MODELLED loop, VALIDATED closed forms)

seg-7614718317f4 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Eksemplet <c1/> setter blant annet:

seg-773fff0feaf7 = avgrenset

seg-23f3aa5c2064 = Resultatetikett (motorens egen): MIXED — VALIDATED lukkede former for sløyfen, MODELLED sløyfekonfigurasjon. Uttrykkene for termisk jitter i bærebølge og kode, sløyfefilterreduksjonen sqrt({ "2" }<em>B_n</em>T) og førsteordens rampeetterslep er kryssjekket mot motorens egen sdr-korrelator, stegvis kjørt på seedet syntetisk IF (en annen v

seg-72182c1aecd9 = Diagrammet motoren skriver for scenarios/tracking-loop.toml, type tracking-loop

seg-346594a654f2 = <b>MODELLED</b> Tap av lås beregnet fra sløyfedynamikk i stedet for et effektforhold: 1σ termisk jitter for bærebølge (Costas) og kode (ikke-koherent early/late) mot C/N₀ med kvadreringstap, mot de oppgitte reglene 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeetterslep

seg-3aa7f9748dc2 = <b>MODELLED</b> Tap av lås beregnet fra sløyfedynamikk i stedet for et effektforhold: 1σ termisk jitter for bærebølge (Costas) og kode (ikke-koherent early/late) mot C/N₀ med kvadreringstap, mot s. Uavhengig referanse (ReferenceImpl): Motorens egen sdr-korrelator (sdr::correlate / synth_if / CaCode), stegvis kjørt på seedet syntetisk IF ved en kalibrert C/N₀ — en separat kodevei som når de samme tallene ved numerisk korrelasjon av samplet IQ i stedet for et algebraisk jitteruttrykk, så det er en annen vei og ikke en gjentakelse — pluss standard tabulerte verdier for modifisert Bessel I₀ til syklusslippleddet. Sløyfeteori ifølge Kaplan & Hegar

seg-de048f9cf1f6 = MIXED — VALIDATED lukkede former for sløyfen, MODELLED sløyfekonfigurasjon. Uttrykkene for termisk jitter i bærebølge og kode, sløyfefilterreduksjonen sqrt({ "2" }<em>B_n</em>T) og førsteordens rampeetterslep er kryssjekket mot motorens egen sdr-korrelator, stegvis kjørt på seedet syntetisk IF (en annen vei til de samme tallene), og den modifiserte Bessel I0 mot standard tabulerte verdier. MODELLED: sløyfebåndbreddene, integ (resultat <c1/>)

seg-0dc70b7607f0 = MODELLED: sløyfebåndbreddene, integrasjonstiden, korrelatoravstanden, forholdet for pull-in-båndbredde, bekreftelsesoppholdene, jammereffekten og antenneforsterkningene er representative båndverdier, ikke et datablad. (typekatalog (<c1/>))

seg-a679a9732b2a = IKKE modellert: oscillatorjitter (Allan-deviasjon) og vibrasjonsjitter, båndbreddebegrensning i frontenden, flerveisutbredelse, AGC-dynamikk, tap ved databitovergang, ekstern støtte, og enhver halvsyklus-korreksjon i Costas' syklusslippformel. (typekatalog (<c1/>))

seg-f8d50cbc6f2c = Hver sløyfeparameter nedenfor er en MODELLED representativ båndverdi, ikke et datablad. (kommentar i scenariofilen, linje { "22" })

seg-9241a57823cd = --- sløyfegeometri ----------------------------------------------------------- En Costas-bærebølgesløyfe på { "10" } Hz og en bærebølgestøttet kodesløyfe på { "1" } Hz, { "1" } ms koherent integrasjon (én C/A-kodeperiode, så ingen databitsynkronisering antas), smal korrelator på { "0.5" } chip. (kommentar i scenariofilen, linje { "25" } til { "28" })

seg-3a677e343081 = Tap av lås i sporingssløyfen og spoof pull-in under interferens er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Forrige</s1>timetransfer
