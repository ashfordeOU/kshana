# docs--kinds-clocks-timing-and-holdover: translations (nb)

seg-b03d56f501c3 = Type

seg-78cba87823f7 = Klokkens holdover mot spesifikasjonen; valgfritt Monte Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = Diagrammet motoren skriver for scenarios/clock-ensemble.toml, typen clock

seg-c0924aa36e64 = MODELLED holdover-test av et system for tidssynkronisering, vurdert ut fra en tidsfeilregistrering som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistikklogg, en TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns). Testen har fire trinn, og Kshana utfører ingen av dem: en låst GRUNNLINJE, GNSS FJERNET av operatøren (antennekabelen eller simulatorutgangen; Kshana sender ingenting og styrer ingenting) på et oppgitt tidspunkt, HOLDOVER på systemets egen oscillator, og GJENOPPRETTING etter at operatøren har gjenopprettet GNSS på et andre oppgitt tidspunkt. Registreringen deles ved disse to tidspunktene. Grunnlinje: tidsfeilstatistikk og ITU-T-maskene skrevet for en låst klokke. Holdover: statistikk, den relative frekvensavviket systemet holdt (en minstekvadraters linje), maskene skrevet for holdover eller en autonom klokke, ePRTC-A-holdoverenvelopen fra den oppgitte låste varigheten, og tiden til hvert tidsfeilbudsjett overskrides. Gjenoppretting: om og når |TE| kom innenfor et oppgitt bånd og ble der, toppen og det største trinnet. Hver grense er avskrevet fra en offentlig ITU-T-tabell (maskene for tidssynkronisering i telekommunikasjon); ordlyden er 'målt mot masken', og de to tidspunktene er operatørens opplysning, ikke verifisert. En registrering som er for kort for en maske er INCOMPLETE, aldri ekstrapolert. Se docs/TIMING-HIL.md.

seg-8ce93392747b = Diagrammet motoren skriver for scenarios/holdover-test-ptp4l.toml, typen holdover-test

seg-540545e6f846 = MODELLED kjede for pålitelig kvantetidssynkronisering: et budsjett for tidsoverføring fra ende til ende for kvante (optisk gitterklokke + sammenfiltring/enkeltfotonlenke) mot klassisk (CSAC + toveis RF), et gjenbrukt beskyttelsesnivå for tidssynkronisering + et kvalitetsmål for sikkerhet mot forsinknings- og replay-angrep (1-P_md), en sannsynlighet for deteksjon av klokkeanomali + CUSUM-latens, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med en post for representativitet og gap til flyging. Illustrative parametere for enhet og lenke fra offentlige kilder; modellerer klassen, ingen TRL, ingen flyging og ingen sertifisering påstås.

seg-09760f892c7b = Diagrammet motoren skriver for scenarios/quantum-time-transfer.toml, type quantum-time-transfer

seg-1b61962464c5 = Slot-tidssynkronisering: sekunder til en frittløpende klokke forlater guardintervallet til en tidsindeksert rutings- eller oppgaveslot (den største absolutte tidsfeilen slotten tåler), bidraget fra hvert ledd i det øyeblikket med det dominerende leddet navngitt (usikkerhet i posisjonsbestemmelsen, hvit fasestøy, hvit, flicker, random-walk og random-run frekvensstøy, restfrekvensavvik, temperatur, aldring), tiden som er igjen siden siste posisjonsbestemmelse, og det største intervallet mellom posisjonsbestemmelser som holder klokken innenfor, fratrukket latensen for posisjonsbestemmelsen. Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: ett sitert Allan-avvik for ett sekund og et antatt rødstøygulv), en FORHÅNDSINNSTILLING FRA DATABLAD for tidssynkronisering i telekom eller et innebygd DATABLAD (maksimalverdier for Allan-avvik tilpasset som en omhylling, pluss aldring og en temperaturkoeffisient), eller en innebygd MEASURED FASEREGISTRERING (dens overlappende Allan-avvik tilpasset med vektede minste kvadrater i basisen for hvit fase og frekvensmodulasjon etter IEEE Std { "1139" }, slik at rødstøygulvet er målt og ikke antatt). Et brudd utover den lengste midlingstiden databladet eller registreringen støtter, merkes som ekstrapolert. En valgfri seksjon for spoofing legger til beskyttelsesnivået for tidssynkronisering for en mottaker i bane: banehastighet og omløpstid, hvor lenge en enkelt bakkespoofer kan nå satellitten per passering, gulvet for den klokkestøttede monitoren og CUSUM-latensen for deteksjon, den betingede grensen, trekket en spoofer ved en oppgitt maksimal rampehastighet samler opp før satellitten forlater rekkevidden eller en uavhengig kontroll kjøres, og om hver kontroll mot bakkekontakt eller krysslenke er uavhengig av den spooferen. VALIDATED: inversjonen av holdover fra en tilpasset registrering, holdt tilbake på en virkelig cesiumklokke målt mot en hydrogenmaser (tests/slot_timing_cs5071a_holdout.rs, datastyrt); på en målt krystalloscillator er den tilbakeholdte prediksjonen konservativ, men ikke innenfor terskelen, så krystalltilfellet er MODELLED. MODELLED: klasse- og databladkilder, de deterministiske leddene og vurderingen av spoofing.

seg-97a91c8a60cd = Diagrammet motoren skriver for scenarios/slot-timing-ocxo-leo.toml, type slot-timing

seg-4f19d4fb1341 = Generisk N-D-sveip over en vilkårlig pakke via TOML-nøkler med punktum / JSON-metrikkstier.

seg-621a18c07044 = Diagrammet motoren skriver for scenarios/sweep-nd-inertial.toml, type sweep-nd

seg-e7ab7b55c969 = 1-D-sveip for avveiningsstudie over en parameter i klokkepakken.

seg-c784b8f22f12 = Diagrammet motoren skriver for scenarios/sweep-clock-stability.toml, type sweep

seg-a448b24ded2b = Tidssynkronisering i telekom: tidsfeil, maksimal tidsintervallfeil (MTIE) og tidsavvik (TDEV) for en GNSS-holdover, kontrollert mot ITU-T-masker med PASS eller FAIL og en margin per maske. Inndata er enten en SYNTETISK HOLDOVER (en forhåndsinnstilling for oscillator, ocxo, rubidium, cesium eller csac, hver med tallene for stabilitet, aldring og temperatur fra et navngitt offentlig Microchip-datablad, pluss tidspunktet for GNSS-tap, registreringslengden og samplingsintervallet; den frittløpende klokken bærer hvit, flicker og, der tilpasningen til databladet krever det, random-walk frekvensstøy, lineær aldring og et sinusformet temperaturledd) eller en INNLEST SERIE av par [time_s, time_error_ns] oppgitt innebygd (og, kun i native bygg, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (maks|TE| { "100" } / { "40" } ns, MTIE tabell 1-2, TDEV tabell 3-4); G.8272.1 ({ "2024" }) tillegg { "1" } (07/2025) ePRTC låst ({ "30" } ns, tabell 1-2) og ePRTC-A holdover (tidsfeilomhyllingen i tabell { "3" } som stiger fra { "30" } ns til { "100" } ns over holdover-perioden H bestemt av den låste varigheten, MTIE tabell { "4" }, TDEV tabell { "5" }); G.8273.2 ({ "2023" }) tillegg { "2" } (11/2025) T-BC/T-TSC klassene A-C (maks|TE|, konstant tidsfeil, lavpassfiltrert MTIE og TDEV) og klasse D (maks|TE_L| { "5" } ns, det eneste tallet for klasse D som ikke er overlatt til videre studium); G.8271.1 ({ "2022" }) tillegg { "3" } (05/2025) referansepunkt C (maks|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE tabell 7-1 til 7-3). Hver post en anbefaling markerer for videre studium er utelatt i stedet for fylt inn, og hver rapport lister hva som ikke er implementert. Rapporterer også tiden til hvert budsjett for maksimal tidsfeil overskrides (standard: { "100" } ns ePRTC maks|TE_HO|, { "400" } ns tildeling for nettverks-holdover, { "1100" } ns punkt C, { "1.5" } us klasse { "4" }), kurvene for MTIE/TDEV som en CSV-tabell med hver maskegrense, og en oppføring for enheter og opphav per numerisk felt. VALIDATED: estimatorene for MTIE og TDEV mot pakken allantools på en innsjekket holdover-serie. MODELLED: masketabellene er transkripsjoner, og en syntetisk holdover er en modell bygget fra maksimalverdier i datablad, ikke en måling av noen enhet. Ikke en overensstemmelsestest.

seg-ec7745a09d08 = Diagrammet motoren skriver for scenarios/telecom-synce-eec.toml, type telecom-timing

seg-9a2bb9809aed = Toveis satellittbasert tid- og frekvensoverføring mellom to stasjoner via et geostasjonært relé: toveisligningen løst for T_A - T_B med hvert ikke-resiprokt ledd (stasjonsutstyrets forsinkelser, ionosfære i Ku-bånd, transponder, Sagnac), et usikkerhetsbudsjett i kvadratsum der type A-leddet er den simulerte lenkens TDEV ved midlingstiden, en simulert lenke med hvit og flicker-fasestøy og en døgnlig ikke-resiprositet, og stabiliteten (rate, residual-RMS, TDEV, ADEV) til enhver oppgitt serie fra BIPM Circular T, seksjon { "1" }, MJD,ns-CSV eller IGS RINEX-stasjonsklokkeposter. MODELLED.

seg-92d3c84024d7 = Diagrammet motoren skriver for scenarios/time-transfer-budget.toml, type time-transfer-budget

seg-ccb244e60d60 = Optisk mot RF toveis tids-/frekvensoverføring.

seg-bd76bd68eab3 = Diagrammet motoren skriver for scenarios/timetransfer.toml, type timetransfer

seg-4e31c8daf798 = Register

seg-45a59bc9ac90 = Kilde: <c1/>

seg-3b549536beed = Klokker, tidssynkronisering og holdover (scenariotypefamilie)

seg-9095869ec445 = { "9" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-59c2beac56b5 = Temasider: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Kjør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-b333618375db = Kontaktark over diagrammene motoren skriver for typene i familien Klokker, tidssynkronisering og holdover

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-ff7dca09f0f2 = Telekomtidssynkronisering: tidsfeil, maksimal tidsintervallfeil (MTIE) og tidsavvik (TDEV) for en GNSS-holdover, kontrollert mot ITU-T-masker med PASS eller FAIL og en margin per maske.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Slot-tidssynkronisering: sekunder til en fritt gående klokke forlater vernet til en tidsindeksert rutings- eller oppdragsslot (den største absolutte tidsfeilen sloten tåler), bidraget fra hvert ledd på det

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Toveis satellittbasert tid- og frekvensoverføring mellom to stasjoner via et geostasjonært relé: toveisligningen løst for T_A - T_B med hvert ikke-resiprokt ledd (stasjonsutstyrets forsinkelser, Ku

seg-a2a710b3204f = MODELLED holdover-test av et tidssynkroniseringssystem, vurdert ut fra en tidsfeilregistrering OPERATØREN oppgir (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistikklogg, en TICC-, TimeLab- eller RINEX

seg-1da440dd525c = MODELLED kjede for pålitelig kvantetidssynkronisering: et ende-til-ende-budsjett for tidsoverføring, kvante (optisk gitterklokke + sammenfiltrings-/enkeltfotonlenke) mot klassisk (CSAC + RF toveis), en gjenbrukt tidsbeskyttelse

seg-50d75d48ed43 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>, <c8/>.

seg-3273244f755c = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>clock</a1>.

seg-ee8d6e20c844 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>.

seg-e359cc42506e = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>sweep</a1>.

seg-616716b33732 = Obligatoriske felt: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>telecom-timing</a1>.

seg-248e1686fddc = Obligatoriske felt: <c1/>, <c2/>. Valgfrie: <c3/>.

seg-cc04bc2d43c5 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>slot-timing</a1>.

seg-50273a29deec = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Valgfrie: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Obligatoriske felt: <c1/>, <c2/>. Valgfrie: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Forrige</s1>Kampanjer

seg-960d5c757310 = <s1>Neste</s1>Konstellasjoner, dekning og geometri
