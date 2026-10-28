# docs--kind-link-budget: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Månenativt jammer-til-signal-forhold, effektiv C/N₀ og tab af lås for en selenografisk overfladebruger under en jammer på månens overflade (eller hævet) over den illustrative Moonlight/LCNS-klasse-konstellation fra offentlige kilder.

seg-120fcc840b87 = Kilde: <c1/>

seg-738aa7d45efb = <c1/> (scenarietype)

seg-953188c11165 = Enkeltvejs linkbudget efter CCSDS { "401" } / DSN 810-005-linkligningen: fripladstab, C/N₀, Eb/N₀, margin og lukning for en sende-EIRP, modtage-G/T, afstand, datahastighed og bånd (s|x|ka) mod et krævet Eb/N₀. En deterministisk ingeniørberegning ud fra de leverede input (ikke et kalibreret terminaldatablad).

seg-6697c741d09c = Én kørsel af <c1/> opsummeres som: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margin { "92.1" } dB (lukker)

seg-2305502051b6 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Eksemplet <c1/> sætter blandt andet:

seg-ebb923e1a3b5 = Resultatmærkat (motorens egen): Enkeltvejs linkbudget efter CCSDS { "401" } / DSN 810-005-linkligningen (EIRP − FSPL − L_other + G/T − k); en deterministisk ingeniørberegning ud fra de leverede input, IKKE et kalibreret terminaldatablad

seg-bd375631bc7e = Diagrammet, som motoren skriver for scenarios/link-budget.toml, type link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Fripladstab, C/N₀, Eb/N₀, margin og lukning efter CCSDS { "401" } / DSN 810-005-linkligningen for EIRP/G·T/afstand/hastighed/bånd mod et krævet Eb/N₀. Tests: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Fripladstab, C/N₀, Eb/N₀, margin og lukning efter CCSDS { "401" } / DSN 810-005-linkligningen for EIRP/G·T/afstand/hastighed/bånd mod et krævet Eb/N₀. Runn. Uafhængig reference (ExternalDataset): Offentliggjort designkontroltabel for telekommunikation i dybt rum som fastlåste numeriske vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabel 1-1 (Galileo X-band) — kshana samler tabellens linjeposter igen og gengiver dens offentliggjorte samlede L_fs { "290.54" } dB og Pr/N0 { "54.6" } dB-Hz; fripladstabet er også kontrolleret mod ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Linkbudgetrapporten angiver hver absolut konstant, som dens egen margin blev beregnet ud fra -- den bærebølgefrekvens, som fripladstabet brugte, EIRP, tallet o. Uafhængig reference (InternalConsistency): Ingen ekstern uafhængig reference: dette er en selvbeskrivelse oven på en ligning, der allerede er valideret mod en offentliggjort designkontroltabel (se rækken om enkeltvejs linkbudget). Den er indført, fordi fraværet af den var en målt fejl -- for at gengive den udgivne d1_rate_gain_beamwidth.csv skulle man baglæns løse én effektiv konstant til { "0.0034" } dB ud fra alle tredive rækker, og motoren navngiver nu både denne kombination og beviser med test

seg-c779823e860c = Valgfrit: modtagesystemets støjtemperatur (K). Den er IKKE et input til linkligningen -- den kræver kun forholdet G/T -- men når den angives, kan rapporten også give den modtageantennegevinst, som kvalitetstallet medfører (G = G/T + { "10" }*log10(T_sys)). Udelades den, mangler gevinstfordelingen i rapporten i stedet for at blive antaget. tsys_k = { "300.0" } (kommentar i scenariefilen, linje { "21" } til { "25" })

seg-d717412c4f06 = Selvbeskrivelsen i linkbudgetrapporten er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Forrige</s1>leo-signal

seg-59d4cb995cb9 = <s1>Næste</s1>lunar-attack-surface

seg-410a790785e7 = <s1>Næste</s1>lunar-ascent
