# docs--kind-holdover-test: translations (da)

seg-f42465f7d066 = ns

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-73929aeded02 = Kilde: <c1/>

seg-218f00012d0e = <c1/> (scenarietype)

seg-c0924aa36e64 = MODELLED holdover-test af et tidssynkroniseringssystem, bedømt ud fra en tidsfejlregistrering, som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-log, en chrony-tracking- eller statistiklog, en TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par). Testen har fire trin, og Kshana udfører ingen af dem: en låst BASELINE, GNSS FJERNET af operatøren (antennekablet eller simulatorens output; Kshana udsender og styrer intet) på et angivet tidspunkt, HOLDOVER på systemets egen oscillator og RECOVERY, efter at operatøren genopretter GNSS på et andet angivet tidspunkt. Registreringen deles ved disse to tidspunkter. Baseline: tidsfejlsstatistik og de ITU-T-masker, der er skrevet til et låst ur. Holdover: statistik, den fraktionelle frekvensoffset, som systemet holdt (en mindste kvadraters linje), de masker, der er skrevet til holdover eller et autonomt ur, ePRTC-A-holdover-kuverten ud fra den angivne låste varighed og tiden til at overskride hvert tidsfejlbudget. Recovery: om og hvornår |TE| kom inden for et angivet bånd og blev der, toppen og det største trin. Hver grænse er afskrevet fra en offentlig ITU-T-tabel (masker for telekommunikationstidssynkronisering); ordene er 'målt mod masken', og de to tidspunkter er operatørens udsagn, ikke verificeret. En registrering, der er for kort til en maske, er INCOMPLETE og aldrig ekstrapoleret. Se docs/TIMING-HIL.md.

seg-cd6d840a1382 = Én kørsel af <c1/> opsummeres sådan: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Obligatoriske felter: <c1/>, <c2/>

seg-4792040e4773 = Valgfrie felter: <c1/>, <c2/>

seg-ad4f9c40e317 = Eksemplet <c1/> angiver blandt andet:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Resultatmærkat (motorens): MODELLED, en holdover-test bedømt ud fra en tidsfejlregistrering, som operatøren leverede. Hver grænse er afskrevet fra den navngivne offentlige ITU-T-anbefaling, og resultatet er målt mod masken; det siger intet om, hvorvidt noget ur eller system lever op til en anbefaling, og ingen har vurderet eller godkendt

seg-8ce93392747b = Diagrammet, som motoren skriver for scenarios/holdover-test-ptp4l.toml, scenarietype holdover-test

seg-3361819ae321 = <b>MODELLED</b> Typen <c1/>: en tidsfejlregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par) deles ved de to tidspunkter, som operatøren angiver for fjernelse og genoprettelse af GNSS, i en baseline, en holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> Den maksimale tidsintervalfejl og tidsafvigelse, som scenarietypen <c1/> rapporterer, på en holdover-registrering i telekomskala: et O(n) monotont kø-glidende. Uafhængig reference (ExternalDataset): allantools { "2024.06" }, et uafhængigt frekvensstabilitetsbibliotek fra tredjepart, mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, hvor serien er parset fra den samme tekst med 17 betydende cifre på begge sider; referencen registrerer seriens SHA-256 og kan genskabes offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORERNE på denne registrering, ikke syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Afskrevne grænser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A-holdover (herunder tabel { "3" }-tidsfejlkuverten. Uafhængig reference (InternalConsistency): Afskrift af de navngivne anbefalinger (frit tilgængelige på itu.int), hvor hver grænse bærer sin tabel eller klausul, opført med alle ubekræftede eller uimplementerede punkter i docs/TELECOM-TIMING.md; de identiteter for kontinuitet i knækpunkter, som tabellerne indebærer, kontrolleres i testene. En afskrift af standarder med interne konsistenskontroller, ikke en overensstemmelsestest og ikke en ekstern validering. { "0.30" } runde { "2" } (præregistrer

seg-142528f34e66 = <b>MODELLED</b> Typen <c1/>: en tidsfejlregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par) deles ved de to tidspunkter. Uafhængig reference (InternalConsistency): Håndberegning på registreringer bygget ud fra formler, hvis hældning, trin, ekstremum og genoprettelsestid er kendt før kørslen (testene angiver dem), og maskerne, kuverten og budgetterne i telecom-timing-rækkerne ovenfor. Ingen laboratoriemåling af en reel holdover blev bedømt, og ingen ekstern uafhængig reference blev sammenlignet, så typen fremsætter ingen påstand om noget ur eller system; en partner med tidssynkroniseringslaboratorium er nødvendig, før nogen fi

seg-59ff0b0e3d2d = MODELLED, en holdover-test bedømt ud fra en tidsfejlregistrering, som operatøren leverede. Hver grænse er afskrevet fra den navngivne offentlige ITU-T-anbefaling, og resultatet er målt mod masken; det siger intet om, hvorvidt noget ur eller system lever op til en anbefaling, og ingen har vurderet eller godkendt det. De tidspunkter, hvor GNSS blev fjernet og genoprettet, er operatørens udsagn og er ikke verificeret. Vejledende sof (resultat <c1/>)

seg-daeb4ad7aa35 = MODELLED holdover-test af et tidssynkroniseringssystem, bedømt ud fra en tidsfejlregistrering, som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-log, en chrony-tracking- eller statistiklog, en TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par). (typekatalog (<c1/>))

seg-ff3008c250cc = ITU-T-masker for telekommunikationstidssynkronisering med PASS/FAIL og margin er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Holdover-test bedømt ud fra en tidsfejlregistrering leveret af operatøren er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Emneside: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Emneside: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Forrige</s1>gravity-map

seg-e7665ee5e30e = <s1>Næste</s1>hybrid-optical-rf
