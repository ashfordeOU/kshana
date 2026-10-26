# docs--kind-leo-signal: translations (nb)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-ae15d15bf151 = Temaside: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinusintegralet (sine_integral), BPSK-R-andelen av effekten innenfor et dobbeltsidig bånd i lukket form (bpsk_power_in_band_closed_form), det bånd. Uavhengig referanse (ExternalDataset): Eksternt festet: { "90.3" } prosent hovedlobeeffekt, den koherente early-late-jitteren ved det oppgitte driftspunktet, tabellverdiene for sinusintegralet, og BPSK-koeffisienten for spektral selvseparasjon 2/({ "3" } R_c) ved null forskyvning. Kun interne krysskontroller, ikke ekstern validering: den lukkede formen for Gabor-båndbredden til båndbegrenset BPSK og dens asymptote, og koeffisienten for spektral separasjon for forskjøvet BPSK ved forskyvninger ulik null, begge

seg-faf2775f3003 = <b>MODELLED</b> Typen <c1/>: parametriserte signalutforminger (bånd, sendebåndbredde, ITU-tildeling; innhentings-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MB. Uavhengig referanse (InternalConsistency): De validerte lukkede formene i de to radene ovenfor, kvadratlov-identiteten for falsk alarm P_d(snr = { "0" }) = P_fa og Holmes' gjennomsnittlige innhentingstid, og reduksjon til spektrumtypens egen SSC-kjede (den samme koden Jammer::ssc). Utformingene selv er inndata: forhåndsinnstillinger merket REPRESENTATIVE eller WORKSHOP er ikke publiserte spesifikasjoner, forbedrede Feher QPSK-, kodeskifte- og OFDM-spektre er tilnærmet, og formen

seg-051999733048 = Kilde: <c1/>

seg-16ae2a08d3c8 = <c1/> (scenariotype)

seg-97b8d07150d4 = LEO-PNT-signalutforminger: parametriserte signaler for posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO), for ethvert system, bånd og struktur. Et SIGNAL er et bånd (senterfrekvens, sendebåndbredde, ITU-tildeling RNSS/RDSS/MSS/EESS/non-RNSS/other) og komponenter (akkvisisjon, data, pilot; en hvilken som helst delmengde), hver med en modulasjon (BPSK(n) med brøk-n, BOC(m,n), MBOC({ "6,1" },p) eller et flatt OFDM-lignende bånd), en effektandel, valgfrie FDMA-underbærebølgeforskyvninger, en kodelengde og en datarate. Signalene kommer fra innebygde, offentlige preset-filer (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; hver med sin kilde-URL og hver upublisert verdi merket REPRESENTATIVE) eller skrives inline. PER SIGNAL: den båndbegrensede effekttettheten og andelen av hver komponents effekt som sendebåndet slipper gjennom (lukket form for BPSK ved siden av den numeriske verdien), RMS-båndbredden (Gabor), den termiske støyjitteren i kodesporingen med forsinkelseslåst sløyfe mot C/N0 og early-late-avstand fra den båndbegrensede koherente (eller ikke-koherente) early-late-formelen til Betz & Kolodziejski { "2009" }, med lærebokformen for ubegrenset bånd og Gabor-grensen for forsvinnende avstand, avstandsnøyaktigheten i meter, akkvisisjonssøkerommet (Doppler-binger fra banens maksimale Doppler pluss oscillator- og brukerledd, ganger kodebinger), deteksjonssannsynlighet med kvadratisk detektor og gjennomsnittlig seriell og kodeparallell akkvisisjonstid, signalets spektrale separasjonskoeffisient mot GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og E5 AltBOC og hver av dem mot signalet med C/N0-forringelsen, og den CW-, bredbånds- og tilpassede J/S som den sporede komponenten tåler, fra spektrumtypens egen SSC-maskineri. Et BÅNDVALG: førsteordens ionosfærisk forsinkelse ({ "40.3" } TEC/f^{ "2" }), frirommstap, avstandsnøyaktighet ved lik C/N0 og ved lik EIRP, og jammertoleranse. Valgfrie FORMKONTROLLER holder spekteret til en utforming opp mot en beskrevet måling (MODELLED konsistens). VALIDATED: BPSK-effekt i bånd ({ "90.3" } % i hovedlappen) og lukkede former for Gabor-båndbredde, den båndbegrensede jitteren som reduseres til lærebokformen for koherent early-late og til sin Gabor-grense, den spektrale separasjonskoeffisienten for forskjøvet BPSK mot sin lukkede Parseval-form, AltBOC-spektrets enhetsareal, og maksimal LEO-Doppler mot de publiserte verdiene for Xona Pulsar (32-34 kHz) og Iridium ({ "36" } kHz). MODELLED: hver utforming, effektfordeling, C/N0 og jammernivå; spektrene for EFQPSK, CSK og OFDM er approksimert.

seg-37e5fdff9d4d = Én kjøring av <c1/> oppsummeres slik: scenario leo-signal | { "5" } signaler | støygulv -202.0 dBW/Hz | fineste avstandsbestemmelse generic-c-wide { "0.022" } m ved { "45.0" } dB-Hz

seg-b538d3ff9fdb = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Eksempelet <c1/> setter blant annet:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = koherent

seg-0f29946fe4fb = Resultatetikett (motorens egen): MODELLED: parametriserte signalutforminger for posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO), båndbegrenset til sendebåndbredden. De lukkede formene under er VALIDATED (BPSK-effekt i bånd og Gabor-båndbredde, den båndbegrensede early-late-kodesporingsjitteren som reduseres til textboo

seg-8bf45b6989d1 = Diagrammet motoren skriver for scenarios/leo-band-trade.toml, type leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: sinusintegralet (sine_integral), BPSK-R-andelen av effekten innenfor et dobbeltsidig bånd i lukket form (bpsk_power_in_band_closed_form), den båndbegrensede Gabor-båndbredden for BPSK i lukket form (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: den største satellittdopplerforskyvningen ved en overflyvning rett over hodet ved høydemasken for en sirkulær bane, v R_E cos(el) / (R_E + h) ganger f / c, fra hver preset-fils egen bærebølge og banehøyde; typen <c1/> legger til o

seg-e0a4f53c5a96 = <b>MODELLED</b> Typen <c1/>: parametriserte signalutforminger (bånd, sendebåndbredde, ITU-tildeling; akkvisisjons-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flate spektre, effektandeler, FDMA-underbærebølger, kodelengder og datarater Tester: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> utvidet utover L-båndet: bånd gitt som en preset-signalutforming (tegnet med hver komponent, båndbegrenset til sendebåndbredden, C/N0 og J/S referert til den sporede komponenten) eller som en egendefinert bærebølge og modulasjon Tester: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: den største satellittdopplerforskyvningen ved en overflyvning rett over hodet ved høydemasken for en sirkulær bane, v R_E cos(el) / (R_E + h) ganger f / c,. Uavhengig referanse (ExternalDataset): Publiserte verdier: Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler opptil +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordrotasjonen er utelatt, noe som flytter verdien med opptil omtrent { "2.3" } kHz; begge de publiserte verdiene nås uten den.

seg-1ab79cdbd269 = de eksakte spektrene til forbedret Feher-QPSK, kodeskiftnøkling og OFDM: en BPSK-omhylling med rektangulære chips eller et flatt bånd brukes i stedet, slik hver preset-fil oppgir (resultat <c1/>)

seg-0561c3ed88fb = linjestrukturen i spredningskodene og kryss-korrelasjon mellom koder ved flertilgang (resultat <c1/>)

seg-8b4df054a7b3 = sende- og mottaksfiltrene utover en ideell mursteinsvegg ved sendebåndbredden: ingen utenfor-bånd-emisjon, ingen gruppeforsinkelse i filteret (resultat <c1/>)

seg-ad5f7cc4a439 = flerveisutbredelse, kvantisering i mottakeren og automatisk forsterkningsstyring (resultat <c1/>)

seg-e38fc1a121ab = jordrotasjon i Doppler-grensen (opptil omtrent { "0.46" } km/s avstandsrate ved ekvator) (resultat <c1/>)

seg-32a132809a9b = ionosfærisk forsinkelse utover første orden, og fordelingen av elektroninnholdet over og under en LEO-satellitt: den skrå TEC-verdien er en inngangsverdi (resultat <c1/>)

seg-8189e06f4a56 = atmosfære-, regn- og polarisasjonstap: bare frirommstapet sammenlignes (regn har betydning i C-bånd) (resultat <c1/>)

seg-445cecb7370c = akkvisisjon utover én enkelt dwell med straff for falsk alarm: ingen verifikasjonslogikk med flere dwell, en uniform a priori-fordeling av kodefasen, verste tilfelle av straddle (resultat <c1/>)

seg-8eefe4197d7f = <s1>Forrige</s1>leo-pvt

seg-60423e1ed0ca = <s1>Neste</s1>link-budget
