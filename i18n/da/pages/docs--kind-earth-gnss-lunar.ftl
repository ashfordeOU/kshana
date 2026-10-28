# docs--kind-earth-gnss-lunar: translations (da)

seg-37d29d8303fe = km

seg-b054c73f22e5 = ingen værdi

seg-59afd80736c5 = <b>PARTNER</b> Ikke leveret — Kshana modellerer signalydelse, ikke nyttelast- eller antennehardware. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-9a399fed06c4 = Kilde: <c1/>

seg-886b3796afaa = <c1/> (scenarietype)

seg-c8a8be4b8894 = Modtagelse af Jord-GNSS på månens afstand, det svagsignal-lag, som artiklen om modstandsdygtighed i konflikt nævner, og som motoren ikke havde nogen model for. En GNSS-satellit peger sin antenne mod Jorden; en modtager nær Månen sidder cirka femten gange baneradius væk, så tre ting slår igennem på én gang. Jorden SKJULER BORESIGHT: fra { "26,560" } km spænder den en halv vinkel på { "13.9" } deg, så enhver stråle mod Månen skal forlade senderen mindst så langt fra nadir, hvilket fjerner strålens top, før nogen effekt overhovedet beregnes. Det, der er tilbage, er HOVEDLOBENS KANT OG SIDELOBERNE, det regime, som LuGRE-nyttelasten faktisk arbejdede i under { "2025" }. Og frirumstabet er cirka { "208" } dB ved L1, omtrent { "25" } dB mere, end en jordbaseret bruger betaler. Rapporten udsender én række pr. satellit (vinkel uden for boresight, Jord-okkultation, afstand, vejtab, senderforstærkning ved den vinkel, modtaget effekt, forhold mellem bærebølge og støjtæthed) og aggregerer kun de links, der overstiger sporingstærsklen. DEN RAPPORTERER OGSÅ KONDITIONERINGEN, fordi det er det, der definerer dette lag: hver synlig satellit ligger inden for en kegle på et par grader set fra Månen, så sigtelinjerne er næsten parallelle, præcisionsudvandingen er enorm, og en Jord-GNSS-positionsbestemmelse på månens afstand er en observation af tidssynkroniseringskvalitet langt mere end af positionskvalitet. MODELLED, og senderens mønster er grunden: forstærkningen ved en vinkel er en ensartet cirkulær apertur (Airy), mens en rigtig GPS L1-antenne er en tolvelements helixarray med en formet hovedlobe og ikke-Airy-sidelober. Målte mønstre findes og er ikke medleveret her, så rækkefølger og størrelsesordener er meningsfulde, mens dB for en enkelt satellit ikke er. Bevidst FRAVÆRENDE, hver især med det resultat, at budgettet bliver optimistisk: intet ionosfærisk eller troposfærisk tab på de stråler, der strejfer randen, intet tab ved polarisation, pegning eller implementering, og en kugleformet Jord uden refraktiv udvidelse. Månens position er et INPUT (afstand plus inertial retning) frem for et efemeridenopslag, fordi størrelsen under test er linket og stråle-geometrien. At opgradere denne række til Validated kræver et målt sendermønster og LuGRE-normalpunkter; ingen af delene findes i repositoriet, og ingen af dem er opfundet her.

seg-75b6814c0091 = Én kørsel af <c1/> opsummeres som: Jord-GNSS på månens afstand — { "24" } satellitter, modtager ved { "384400" } km Jordens rand fra konstellationen: { "13.90" } deg fra nadir — enhver stråle mod Månen skal overstige dette { "22" } af { "24" } ikke skjult; { "0" } overstiger sporingstærsklen på { "25.0" } dB-Hz ingen link når tærsklen færre end to sporbare links; ingen vinkelspredning at rapportere færre end fire sporbare links, eller en singulær geometri: ingen DOP SWEEP over { "64" } epoker / { "43082" } s: signaltilgængelighed { "0.375" }, tilgængelighed af positionsbestemmelse { "0.000" } sporbare links middel { "0.75" }, maks. { "2" }; bedste C/N0 { "30.93" } dB-Hz; bedste PDOP ingen Tag tilgængeligheden af positionsbestemmelse som dette lags prior, ikke signaltilgængeligheden: ét link er en urobservation, fire er en position. MODELLED: senderforstærkningen er en erstatning med ensartet apertur (Airy), ikke en målt GPS-stråle, og der anvendes intet atmosfærisk tab, polarisationstab eller implementeringstab — så budgettet her er optimistisk. Størrelsesordener og rækkefølger er meningsfulde; en enkelt satellits dB er ikke.

seg-6c0897da2efa = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Eksemplet <c1/> angiver blandt andet:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Diagrammet, som motoren skriver for scenarios/earth-gnss-lunar.toml, type earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Modtagelse af Jord-GNSS på månens afstand: det svagsignal-lag, som P7 Table { "1" } nævner, og som motoren ikke havde nogen model for.

seg-9531f6b14fc8 = <b>MODELLED</b> Modtagelse af Jord-GNSS på månens afstand: det svagsignal-lag, som P7 Table { "1" } nævner, og som motoren ikke havde nogen model for. Pr. satellit og pr. epoke beregner den off-. Uafhængig reference (InternalConsistency): Lukkede identiteter og intern konsistens; INGEN ekstern uafhængig reference påstås. Randens halve vinkel kontrolleres mod asin(R_earth/r_orbit) og geometrien mod den; frirumstabet, DOP-kernen og SGP4-propageringen, som dette sammensætter, er hver især eksternt valideret i deres egne rækker, og denne række låner ikke deres status. HVORFOR MODELLED, og det er senderens mønster: forstærkningen ved en vinkel er en ensartet belyst

seg-6dfc5503f58f = MODELLED, og senderens mønster er grunden: forstærkningen ved en vinkel er en ensartet cirkulær apertur (Airy), mens en rigtig GPS L1-antenne er en tolvelements helixarray med en formet hovedlobe og ikke-Airy-sidelober. (typekatalog (<c1/>))

seg-c40d3fd8c12e = HVAD DER ER MODELLED, OG HVORFOR DET IKKE ER VALIDATED Senderforstærkningen ved en vinkel er en ensartet belyst cirkulær apertur — et Airy-mønster. En rigtig GPS L1-antenne er en tolvelements helixarray, hvis målte mønster har en formet hovedlobe, bevidst toppet uden for boresight for at udjævne effekten over Jordens skive, og sidelober, der slet ikke er Airy. Målte mønstre er publiceret; de er ikke medleveret i dette re (kommentar i scenariefilen, linje { "29" } til { "35" })

seg-01fa469abd95 = Jord-GNSS på månens afstand er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Forrige</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Næste</s1>entry-heating

seg-a349aa76b0ed = PARTNER
