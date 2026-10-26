# docs--kind-holdover-test: translations (nb)

seg-f42465f7d066 = ns

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-73929aeded02 = Kilde: <c1/>

seg-218f00012d0e = <c1/> (scenariotype)

seg-c0924aa36e64 = MODELLED holdover-test av et system for tidssynkronisering, vurdert ut fra en tidsfeilregistrering som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistikklogg, en TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns). Testen har fire trinn, og Kshana utfører ingen av dem: en låst GRUNNLINJE, GNSS FJERNET av operatøren (antennekabelen eller simulatorutgangen; Kshana sender ingenting og styrer ingenting) på et oppgitt tidspunkt, HOLDOVER på systemets egen oscillator, og GJENOPPRETTING etter at operatøren har gjenopprettet GNSS på et andre oppgitt tidspunkt. Registreringen deles ved disse to tidspunktene. Grunnlinje: tidsfeilstatistikk og ITU-T-maskene skrevet for en låst klokke. Holdover: statistikk, den relative frekvensavviket systemet holdt (en minstekvadraters linje), maskene skrevet for holdover eller en autonom klokke, ePRTC-A-holdoverenvelopen fra den oppgitte låste varigheten, og tiden til hvert tidsfeilbudsjett overskrides. Gjenoppretting: om og når |TE| kom innenfor et oppgitt bånd og ble der, toppen og det største trinnet. Hver grense er avskrevet fra en offentlig ITU-T-tabell (maskene for tidssynkronisering i telekommunikasjon); ordlyden er 'målt mot masken', og de to tidspunktene er operatørens opplysning, ikke verifisert. En registrering som er for kort for en maske er INCOMPLETE, aldri ekstrapolert. Se docs/TIMING-HIL.md.

seg-cd6d840a1382 = Én kjøring av <c1/> oppsummeres slik: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Obligatoriske felt: <c1/>, <c2/>

seg-4792040e4773 = Valgfrie felt: <c1/>, <c2/>

seg-ad4f9c40e317 = Eksemplet <c1/> setter blant annet:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Resultatetikett (motorens): MODELLED — en holdover-test vurdert ut fra en tidsfeilregistrering operatøren har levert. Hver grense er avskrevet fra den navngitte offentlige ITU-T-anbefalingen, og resultatet er målt mot masken; det sier ingenting om hvorvidt noen klokke eller noe system tilfredsstiller en anbefaling, og ingen har vurdert eller godk

seg-8ce93392747b = Diagrammet motoren skriver for scenarios/holdover-test-ptp4l.toml, typen holdover-test

seg-3361819ae321 = <b>MODELLED</b> Typen <c1/>: en tidsfeilregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns) deles ved de to tidspunktene operatøren oppgir for fjerning og gjenoppretting av GNSS i en grunnlinje, en holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> Maksimal tidsintervallfeil og tidsavvik som scenariotypen <c1/> rapporterer, på en holdover-registrering i telekommunikasjonsskala: en O(n) monoton kø-glidende. Uavhengig referanse (ExternalDataset): allantools { "2024.06" }, et uavhengig tredjeparts bibliotek for frekvensstabilitet, mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien tolket fra den samme teksten med 17 gjeldende sifre på begge sider; referansen registrerer seriens SHA-256 og kan gjenskapes frakoblet via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORENE på denne registreringen, ikke syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Avskrevne grenser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (inkludert tidsfeilenvelopen i tabell { "3" }. Uavhengig referanse (InternalConsistency): Avskrift av de navngitte anbefalingene (fritt tilgjengelige på itu.int), der hver grense bærer sin tabell eller sin klausul, oppført sammen med hvert ubekreftet eller uimplementert punkt i docs/TELECOM-TIMING.md; identitetene for kontinuitet i knekkpunktene som tabellene medfører, kontrolleres i testene. En standardavskrift med interne konsistenskontroller, ikke en test av overensstemmelse og ikke en ekstern validering. { "0.30" } runde { "2" } (forhåndsregistrert

seg-142528f34e66 = <b>MODELLED</b> Typen <c1/>: en tidsfeilregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns) deles ved de to tidspunktene. Uavhengig referanse (InternalConsistency): Håndberegning på registreringer bygd fra formler der stigning, trinn, ekstremum og gjenopprettingstid er kjent før kjøringen (testene oppgir dem), og maskene, envelopen og budsjettene i radene for tidssynkronisering i telekommunikasjon ovenfor. Ingen laboratoriemåling av en virkelig holdover er vurdert og ingen ekstern uavhengig referanse er sammenlignet, så typen fremsetter ingen påstand om noen klokke eller noe system; en partner med tidslaboratorium trengs før noen per-klokkeklasse fi

seg-59ff0b0e3d2d = MODELLED — en holdover-test vurdert ut fra en tidsfeilregistrering operatøren har levert. Hver grense er avskrevet fra den navngitte offentlige ITU-T-anbefalingen, og resultatet er målt mot masken; det sier ingenting om hvorvidt noen klokke eller noe system tilfredsstiller en anbefaling, og ingen har vurdert eller godkjent det. Tidspunktene da GNSS ble fjernet og gjenopprettet er operatørens opplysning og er ikke verifisert. Veiledende programvare (resultat <c1/>)

seg-daeb4ad7aa35 = MODELLED holdover-test av et system for tidssynkronisering, vurdert ut fra en tidsfeilregistrering som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistikklogg, en TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns). (typekatalog (<c1/>))

seg-ff3008c250cc = ITU-T-masker for tidssynkronisering i telekommunikasjon med PASS/FAIL og margin er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Holdover-test vurdert ut fra en tidsfeilregistrering levert av operatøren er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Temaside: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Temaside: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Forrige</s1>gravity-map

seg-e7665ee5e30e = <s1>Neste</s1>hybrid-optical-rf
