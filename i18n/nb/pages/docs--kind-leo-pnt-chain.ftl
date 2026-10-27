# docs--kind-leo-pnt-chain: translations (nb)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } trinn { "3" } til { "9" } (referansesigma fra N_wet, effektiv banelengde, antenne-midlingsfaktor, fadingdybde for { "0.01" } % til { "50" } % av tiden. Uavhengig referanse (ExternalDataset): Valideringseksemplene til ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillasjon, med hvert steds P.453-14 N_wet fra de samme eksemplene; innsjekket i tests/fixtures/leo_link/p618_14_scintillation.csv med URL-ene og hentedato. Uttrykket for våt refraktivitet fra temperatur og fuktighet dekkes ikke av denne raden

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } per bånd; de ionosfærefrie koeffisientene f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støyforsterkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Uavhengig referanse (ExternalDataset): IS-GPS-200 avsnitt { "20.3.3.3.3.2" }, som oppgir L1/L2-gruppeforsinkelsesforholdet gamma = (77/60)^{ "2" } som følger av førsteordens 1/f^{ "2" }-skalering, og Friis' overføringsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-ae15d15bf151 = Temaside: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Kilde: <c1/>

seg-3a66efa79aa2 = <c1/> (scenariotype)

seg-81d1604171a5 = Ett LEO-PNT-system (posisjonering, navigasjon og tidssynkronisering fra lav jordbane) fra ende til ende, for enhver konstellasjon og ethvert signal: leo-signal-utformingen navngitt av signal_design (en offentlig forhåndsinnstilling eller en innebygd [signal]-utforming) setter senter, båndbredde, chiprate og EIRP-fordeling for et [pass]-bånd, linkbudsjettet leo-pass gir den sporede C/N0 og den båndbegrensede kodejitteren over passeringen, en C/N0-linje i sin(elevasjon) og den kringkastede SISRE-en fra meldingen [navmsg] (tilpasset ved passeringssatellittens høyde) mates til hvert LEO-system i den felles posisjonsbestemmelsen leo-pvt i [fusion], og valgfritt til tilfellene leo-ppp i [ppp]; hver overlevering er oppført med verdi og enhet. MODELLED.

seg-9dec9cd6fbfc = Én kjøring av <c1/> oppsummeres slik: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = Obligatoriske felt: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Eksemplet <c1/> setter blant annet:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Resultatetikett (motorens): MODELLED — kjeden leverer hvert trinns utdata videre til det neste; trinnene beholder sine egne etiketter (radene leo-signal, leo-pass, leo-navmsg, leo-pvt og leo-ppp i verifikasjonsmatrisen).

seg-abe0599498c9 = Diagrammet motoren skriver for scenarios/leo-pnt-end-to-end.toml, typen leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Typen <c1/>: en leo-signal-utforming (offentlig forhåndsinnstilling eller innebygd) setter senter, båndbredde, chiprate og EIRP-fordeling for et leo-pass-bånd; passeringen gir C/N0 for den sporede komponenten og båndbegrenset kodejitter per epoke; en minstekvadraters C/ Tester: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinusintegralet (sine_integral), BPSK-R-andelen av effekten innenfor et dobbeltsidig bånd i lukket form (bpsk_power_in_band_closed_form), det bånd. Uavhengig referanse (ExternalDataset): Eksternt festet: { "90.3" } prosent hovedlobeeffekt, den koherente early-late-jitteren ved det oppgitte driftspunktet, tabellverdiene for sinusintegralet, og BPSK-koeffisienten for spektral selvseparasjon 2/({ "3" } R_c) ved null forskyvning. Kun interne krysskontroller, ikke ekstern validering: den lukkede formen for Gabor-båndbredden til båndbegrenset BPSK og dens asymptote, og koeffisienten for spektral separasjon for forskjøvet BPSK ved forskyvninger ulik null, begge

seg-faf2775f3003 = <b>MODELLED</b> Typen <c1/>: parametriserte signalutforminger (bånd, sendebåndbredde, ITU-tildeling; innhentings-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MB. Uavhengig referanse (InternalConsistency): De validerte lukkede formene i de to radene ovenfor, kvadratlov-identiteten for falsk alarm P_d(snr = { "0" }) = P_fa og Holmes' gjennomsnittlige innhentingstid, og reduksjon til spektrumtypens egen SSC-kjede (den samme koden Jammer::ssc). Utformingene selv er inndata: forhåndsinnstillinger merket REPRESENTATIVE eller WORKSHOP er ikke publiserte spesifikasjoner, forbedrede Feher QPSK-, kodeskifte- og OFDM-spektre er tilnærmet, og formen

seg-752b6d88fc9c = Posisjonsbestemmelsestrinnet modellerer C/N0 som en rett linje i sinus til elevasjonen mellom masken og zenit; kjeden tilpasser den linjen til passeringens sporede C/N0, slik at en passeringsspesifikk form (et isoflux-platå, en strålekant) reduseres til to tall. (resultat <c1/>)

seg-f609a2991c7f = SISRE-en som leveres videre til posisjonsbestemmelsestrinnene er navigasjonsmeldingens representasjonsfeil mot en sannhetsbane integrert av Kshana, pluss scenarioets oppgitte od_sisre_m som kvadratroten av kvadratsummen; meldingstrinnet selv modellerer ingen banebestemmelse eller prediksjon. (resultat <c1/>)

seg-f75f874cdfaa = Posisjonsbestemmelsestrinnet beregner sin egen jitter i delay-lock-loop fra den videreleverte C/N0 med en formel for ubegrenset båndbredde; passeringen rapporterer den båndbegrensede jitteren til den faktiske utformingen ved siden av. (resultat <c1/>)

seg-174ce18ade58 = Trinnet for presis punktposisjonering tar meldingens SISRE som LEO-bane- og klokkefeil; kode- og fasestøyen forblir trinnets egne inndata. (resultat <c1/>)

seg-0aaff940eacb = Én satellitt, den første hvis bånd bærer utformingen, står for hele LEO-systemet i passerings- og meldingstrinnene. (resultat <c1/>)

seg-65930be43134 = MODELLED — kjeden leverer hvert trinns utdata videre til det neste; trinnene beholder sine egne etiketter (radene leo-signal, leo-pass, leo-navmsg, leo-pvt og leo-ppp i verifikasjonsmatrisen). (resultat <c1/>)

seg-bf452e9ae07f = MODELLED: hvert trinn beholder sin egen etikett; kjeden tilfører ingen fysikk. (kommentar i scenariofilen, linje { "25" })

seg-0bff72185f12 = <s1>Forrige</s1>leo-pass

seg-851e55b87d01 = <s1>Neste</s1>leo-ppp
