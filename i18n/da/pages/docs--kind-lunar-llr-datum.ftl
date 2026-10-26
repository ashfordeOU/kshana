# docs--kind-lunar-llr-datum: translations (da)

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-8f8871ac8a0f = Emneside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Kovariansen for Helmert-referencesystemet med syv parametre, hvor de to simulerede input er erstattet af målte: planen er jordsendingsepokerne for { "337" } arkiverede ILRS-normalpunkter fra månelaserafstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Kilde: <c1/>

seg-5329c6c75887 = <c1/> (scenarietype)

seg-25455a33523c = Lunart referencesystem med syv Helmert-parametre, drevet af en REEL, ARKIVERET observationskampagne i stedet for en simuleret. Hvor lunar-frame-campaign fjernede den tilførte transformation, men stadig angav sit stationsnet, sin plan og sin sigma pr. observation som ILLUSTRATIVE input, henter denne type alle tre fra målinger: epokerne er jordsendingstidspunkterne for arkiverede ILRS Consolidated Laser Ranging Data-normalpunkter, observationerne er de laserafstandsmålinger, der virkelig er affyret mod de fem retroreflektorarrays på Månen, og hver observationsvægt er det pågældende normalpunkts egen arkiverede præcision bin_rms/sqrt(n_raw) læst ud af filen. Stationskoordinaterne kommer fra IERS ITRF2020 SLR-løsningen (propageret til epoken med deres offentliggjorte hastigheder) og reflektorkoordinaterne fra JPL DE430 tabel { "7" } i det mean-Earth/mean-rotation-system, som IAU { "2015" } WGCCRE-modellen realiserer. Afstandspartialer akkumuleres til den fælles Fisher-informationsmatrix for reflektorkoordinaterne og udbredes gennem samme Helmert-design til datumkovariansen, diagnosticeret af crate::fim::crlb. Rang, defekt, konditionstal, spektrum, uobserverbare retninger i basen med syv parametre, den svageste retning ved fuld rang og hver parameters andel af den udsendes ved hver kørsel, og en ubegrænset parameter offentliggøres som NULL med en status. Korrelationen mellem arrays er MÅLT til præcis nul i stedet for antaget, fordi en laserafstandsmåling berører ét array. En post, som katalogerne ikke kan placere — en station uden offentliggjort ITRF-position — SPRINGES OVER OG TÆLLES, og får aldrig en erstatningskoordinat. HVILKE LINKS DER ER MÅLT, OG HVILKE DER ER MODELLED, ER SELVE RAPPORTEN, IKKE EN NOTE: Måne-centrets efemeride og IAU's legemsorientering forbliver modelleret, og deres samlede størrelse udsendes som den observerede-minus-beregnede enkeltvejs afstandsrest over hvert anvendt punkt; troposfære, faste-jord-tidevand, stationsexcentricitet, polbevægelse, UT1-UTC, relativistisk forsinkelse og stationsure er fraværende og ligger inde i denne rest. Fordi en efemeridefejl kun når en kovarians gennem retningen af hver sigtelinje, løser hver kørsel også hele referencesystemet igen med alle partialer vippet med sensitivity_tilt_deg (skiftende fortegn) og udsender forholdet, så kovariansens ufølsomhed over for den modellerede efemeride er et tal frem for et argument. Den simulerede kampagnes egne tal KØRES og udskrives ved siden af de målte, ikke afskrevet. MODELLED: tallene for de syv parametre er en Cramer-Rao-grænse for et reduceret parametersæt på en reel plan — ikke et løst referencesystem, ikke en LLR-analyse og ikke et geodætisk produkt. Det committede udsnit af reelle data følger med repositoriet, men ikke med den udgivne crate; peg data_dir på en kopi af det.

seg-f4359803d67a = Én kørsel af <c1/> opsummeres som: lunar-llr-datum: { "337" } archived normal points ({ "349" } parsed) from { "2" } station(s) to { "5" } retroreflector arrays over { "80.9" } d; median measured normal-point precision { "5.13" } mm one-way; reflector information rank 15/15; Helmert rank 7/7 cond { "2.399e4" }; datum translation sigma { "1.851746e-2" } m; observed-minus-computed one-way residual RMS { "156493.9" } m (the modelled links, chiefly the analytic lunar ephemeris)

seg-7eda56c1285a = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Eksemplet <c1/> sætter blandt andet:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Resultatmærkat (motorens egen): Lunart referencesystem fra en REEL observationskampagne. Planen, antallet af observationer og hver observationsvægt kommer fra arkiverede ILRS-normalpunkter for månelaserafstandsmåling (målt); stationskoordinaterne kommer fra IERS ITRF2020 og retroreflektorkoordinaterne fra JPL DE430 tabel { "7" } (offentliggjort

seg-e4da113cbe18 = Diagrammet, som motoren skriver for scenarios/lunar-llr-datum.toml, type lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Kovariansen for Helmert-referencesystemet med syv parametre i lunar-llr-datum ud fra arkiverede ILRS-normalpunkter og deres målte vægte, på kernevejen: Månens geocentriske centrum læses fra JPL DE440 af motorens egen kernelæser (planetary_ker Tests: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Kovariansen for Helmert-referencesystemet med syv parametre, hvor de to simulerede input er erstattet af målte: planen er jordsendingsepokerne for { "337" } arkiv. Uafhængig reference (ExternalDataset): Identiteter i lukket form, en uafhængig vej i selve repositoriet og, siden { "0.36" }, en uafhængig SPICE- og NumPy-biblioteksreference på friske målte data (nedenfor); der findes intet offentliggjort par af lunar LLR-datumkovarians at kontrollere mod, så der gøres ikke krav på nogen nøjagtighed. Den eneste nye afledede — afstandspartialet med hensyn til reflektorens legemsfaste position — udledes igen ved central differenskvotient af den tovejs lystid, den diff

seg-61ac3609406a = Lunart referencesystem fra en REEL observationskampagne. Planen, antallet af observationer og hver observationsvægt kommer fra arkiverede ILRS-normalpunkter for månelaserafstandsmåling (målt); stationskoordinaterne kommer fra IERS ITRF2020 og retroreflektorkoordinaterne fra JPL DE430 tabel { "7" } (offentliggjort). Måne-centrets efemeride, IAU { "2015" } WGCCRE-legemsorienteringen og fraværet af troposfære, tidevand, stationsexce (resultat <c1/>)

seg-97610a2cca73 = Korrelationen mellem arrays er MÅLT til præcis nul i stedet for antaget, fordi en laserafstandsmåling berører ét array. (kategori-katalog (<c1/>))

seg-64b1c08eeb11 = HVILKE LINKS DER ER MÅLT, OG HVILKE DER ER MODELLED, ER SELVE RAPPORTEN, IKKE EN NOTE: Måne-centrets efemeride og IAU's legemsorientering forbliver modelleret, og deres samlede størrelse udsendes som den observerede-minus-beregnede enkeltvejs afstandsrest over hvert anvendt punkt; troposfære, faste-jord-tidevand, stationsexcentricitet, polbevægelse, UT1-UTC, relativistisk forsinkelse og stationsure er fraværende og ligger inde i denne rest. (kategori-katalog (<c1/>))

seg-d38710f3ce4a = MODELLED: tallene for de syv parametre er en Cramer-Rao-grænse for et reduceret parametersæt på en reel plan — ikke et løst referencesystem, ikke en LLR-analyse og ikke et geodætisk produkt. (kategori-katalog (<c1/>))

seg-a19e2b1fcaf1 = epokerne er jordsendingstidspunkterne for arkiverede ILRS Consolidated Laser Ranging Data-normalpunkter; * observationerne er de laserafstandsmålinger, der virkelig er affyret mod de fem retroreflektorarrays på Månen; * hver observationsvægt er det pågældende normalpunkts EGEN arkiverede præcision, bin_rms/sqrt(n_raw), læst ud af filen i stedet for antaget. (kommentar i scenariefilen, linje { "7" } til { "12" })

seg-5ed6b83c01da = HVILKE LINKS DER ER MÅLT, OG HVILKE DER ER MODELLED, ER SELVE RAPPORTEN, IKKE EN NOTE. Måne-centrets efemeride og IAU's legemsorientering forbliver modelleret, og deres samlede størrelse udsendes som den observerede-minus-beregnede enkeltvejs afstandsrest over hvert anvendt punkt; troposfære, faste-jord-tidevand, stationsexcentricitet, polbevægelse, UT1-UTC, relativistisk forsinkelse og stationsure er fraværende og ligger inde i denne rest. Beca (kommentar i scenariefilen, linje { "18" } til { "26" })

seg-7e7ff3ce4971 = Korrelationen mellem arrays er MÅLT til præcis nul i stedet for antaget, fordi en laserafstandsmåling berører ét array. En post, som katalogerne ikke kan placere — en station uden offentliggjort ITRF-position — SPRINGES OVER OG TÆLLES, og får aldrig en erstatningskoordinat. Den simulerede kampagnes egne tal KØRES og udskrives ved siden af de målte. (kommentar i scenariefilen, linje { "28" } til { "31" })

seg-8bfe258bedf5 = MODELLED: tallene for de syv parametre er en Cramer-Rao-grænse for et reduceret parametersæt på en reel plan. Ikke et løst referencesystem, ikke en LLR-analyse, ikke et geodætisk produkt. (kommentar i scenariefilen, linje { "33" } til { "34" })

seg-598a7d6ba1e7 = <s1>Forrige</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Næste</s1>lunar-station-coverage
