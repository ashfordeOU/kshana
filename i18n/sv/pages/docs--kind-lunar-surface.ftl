# docs--kind-lunar-surface: translations (sv)

seg-f942b36a11c4 = Ännu inte på GitHub

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de andra finns i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariotyp i motorn v{ $version }, familj <a1>Månen och cislunart rum</a1>. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en säkerhetskritisk tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Månen och cislunart rum</a1>

seg-6a26b9ab59fe = Ämnessida: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultatetikett (motorns): MODELLED

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e66e2ca31e54 = Ämnessida: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Rådgivande programvara, inte certifierad navigat

seg-feea03a2c628 = Källa: <c1/>

seg-6c0eff9f9211 = <c1/> (scenariotyp)

seg-6c7d25f672fb = MODELLED tillgänglighet för positionering och tidssynkronisering på ytan per plats och årstid för platser nära sydpolen i Artemis-klass. För varje plats och årstid (en epok och ett fönster efter den) redovisas positionering med reläer (fyra eller fler reläer i en ILLUSTRATIVE konstellation i LCNS-klass i sikte och PDOP under en tröskel, från samma funktioner som moonlight-service-volume och, med ett terrängavsnitt, den siluett framräknad med strålmarsch för terrängen i lunar-station-coverage), om jorden och solen ligger över platsens horisont (analytisk sol, måne och månorientering, libration inräknad, vilket är det som varierar med årstiden), och tillgänglighet för tidssynkronisering (ett relä eller jorden i sikte) med den längsta sträckan utan någotdera, den holdover som en ytklocka måste klara. Ett resultat för en enda plats är lika med moonlight-service-volumes, bit för bit. MODELLED: illustrativ keplersk reläuppsättning på en måne med medelrotation; reläsiffran ändras inte med årstiden; terrängen är LOLA-utsnittet på { "1200" } m. Inte stött av någon rymdorganisation; rådgivande programvara, inte certifierad navigationsutrustning.

seg-3c13aefe4093 = En körning av <c1/> sammanfattas som: lunar-surface | { "4" } platser x { "4" } årstider | positionering { "41" } % till { "41" } % | sämsta tillgänglighet för tidssynkronisering { "100.0" } % | längsta glapp i tidssynkronisering { "0.0" } h (MODELLED)

seg-02bc245c436e = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = Exemplet <c1/> anger bland annat:

seg-0ceb87f45323 = sydpolär { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = förs över oförändrad

seg-94b84de6c958 = Diagrammet som motorn skriver för scenarios/lunar-surface.toml, typ lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> Typen och fasen <c1/>: reläers tillgänglighet och PDOP, synlighet för jorden och solen samt en styrd ytklocka för varje plats och årstid, med terrängsiluetten från <c2/>; en körning för en enda plats ger exakt samma som den typens

seg-70f63c99a478 = <b>MODELLED</b> Typen och fasen <c1/>: reläers tillgänglighet och PDOP, synlighet för jorden och solen samt en styrd ytklocka för varje plats och årstid, med ter. Oberoende referens (ReferenceImpl): Exakt likhet med den befintliga typen för en plats, samt monotonicitetskontroller, i testerna. Reläuppsättningen är ILLUSTRATIVE och ingen ytmätning jämförs

seg-ab29e0e308d0 = MODELLED tillgänglighet för positionering och tidssynkronisering på ytan per plats och årstid för platser nära sydpolen i Artemis-klass. (typkatalog (<c1/>))

seg-3f948092eba6 = MODELLED: illustrativ keplersk reläuppsättning på en måne med medelrotation; reläsiffran ändras inte med årstiden; terrängen är LOLA-utsnittet på { "1200" } m. (typkatalog (<c1/>))

seg-5b217c0bb606 = ÄRLIGHET: MODELLED. Reläuppsättningen är illustrativ och keplersk, med månen roterande med medelhastigheten för reläerna (ingen libration) som i moonlight-service-volume; jorden och solen använder den analytiska orienteringen, så de två referenssystemen skiljer sig åt genom den utelämningen. Reläpositioneringssiffran ändras inte med årstiden i den här modellen; jord- och solsiffrorna gör det. Ingen samstämmighet med någon verklig tjänst eller plats hävdas. Råd (kommentar i scenariofilen, rad { "11" } till { "15" })

seg-958f00c2d647 = Tillgänglighet för positionering och tidssynkronisering på ytan per plats och årstid vid månens poler (<c1/>) är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Föregående</s1>lunar-station-coverage

seg-625c1973128e = <s1>Nästa</s1>lunar-time-budget
