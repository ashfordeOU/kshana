# docs--marine-integrations: translations (nb)

seg-2e34ace70d11 = Signal K-plugin

seg-c3c260b7063e = Tester

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = se ovenfor

seg-c353e7bec219 = Nøkkel

seg-df52127d74b6 = Hvor

seg-7670cf4ceda3 = Standard

seg-7e304f816037 = Kilde: <c1/>

seg-fb2b0841a172 = Maritime integrasjoner: tillitsscoren på broen

seg-a88b3968c706 = Kshanas maritime tillitsscore (<a1><c1/></a1>) er tilgjengelig fra programvare som båtfolk allerede bruker: en <b>Signal K</b>-serverplugin og <b>OpenCPN</b> gjennom NMEA i gate-modus over TCP. En referansebygging setter den på en liten datamaskin ved siden av mottakeren.

seg-eb8043b9e269 = <b>Veiledende programvare.</b> Kshana er ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }) og er ikke vurdert mot noen ytelsesstandard. Alt på denne siden er et hjelpemiddel for navigatørens skjønn. Operatøren er fortsatt ansvarlig for fartøyets sikre navigasjon og for enhver beslutning om å stole på, eller slutte å stole på, en posisjonsbestemmelse. Ingenting her sender noe, og ingenting her gjør en posisjonsbestemmelse mer nøyaktig.

seg-dab66f260e56 = Del

seg-40fd2019e974 = Status i { "0.35" }

seg-7bcecf49199c = levert, enhetstestet på registrert syntetisk utdata; ikke publisert til npm

seg-d5278e683d37 = OpenCPN via NMEA i gate-modus over TCP

seg-a876f5d43e39 = levert og testet (avspilling på forbrukersiden); selve OpenCPN-brukergrensesnittet styres ikke av noen test

seg-4a6d2f45b403 = OpenCPNs innebygde plugin med scorepanel

seg-b0d4d32612e9 = bygget, logikken enhetstestet, og kjørt inne i OpenCPN { "5.8.4" } under en virtuell skjerm (evidens i <c1/>); ikke pakket for plugin-behandleren; leveres først etter gjennomgang

seg-2e0058b5e057 = Referansebygging

seg-959d93e3a56d = deler, OS-trinn, systemd-enheter (kontrollert med tørrkjøring), et containeralternativ; ikke testet på et fartøy

seg-8524cb32f0a3 = Alt dette leser én ting: utdataene fra <c1/> (JSON-linjer, setningen <c2/>, gaten). Trådformatene står i <a1><c3/></a1>. Signal K-pluginen holder kunnskapen om dem i én fil, <c4/>; en formatendring er en endring i én fil.

seg-e5b08ab63d78 = Ingen npm-avhengigheter. Selve pluginen kjører på Node { "18" } eller nyere; gjeldende <c1/>-utgivelser krever Node { "22" } eller nyere, så bruk i praksis { "22" }. Kopier eller lenk <c2/> inn i serverens <c3/> (for eksempel <c4/>), start serveren på nytt og aktiver <b>Kshana GNSS trust</b> under Server, Plugin Config.

seg-fd80525d7dd1 = Hvor epokene kommer fra (<c1/>)

seg-013478c9a701 = Hva pluginen gjør

seg-abbd00e9cacf = <c1/> (standard)

seg-8ca5f95ed09d = Kjører <c1/> og skriver hver rå NMEA { "0183" }-setning serveren mottar (serverens <c2/>-hendelse) til standard inn. Starter den på nytt, med tilbakeslag, hvis den avslutter | <b>Bruk den bare på en server med én enkelt NMEA-kilde</b>: den mater inn hver setning fra hver leverandør, sammenflettet, så en andre GNSS-mottaker eller AIS ser ut som én mottaker hvis posisjon hopper og kan bli scoret som spoofing. Med mer enn én kilde, bruk <c3/> med den mottakerens egen <c4/>-strøm, eller <c5/> fra en gate.

seg-3b3eadcffb90 = Kjører <c1/>, for eksempel <c2/> eller <c3/>

seg-d69b5ebe1042 = Kobler til en strøm av JSON-linjene <c1/> skriver (for eksempel fra reléet i <c2/>)

seg-cd5a419844cc = Kobler til en NMEA-strøm (for eksempel gate-utdataene fra tjenesten eller containeren i referansebyggingen, port { "10110" }) og leser bare <c1/>-setningene

seg-f17c9b7d7abc = En strøm som allerede blir spoofet når monitoren først kobler til har ingen ren grunnlinje (de første <c1/> sekundene scores aldri). Start den før reisen.

seg-33fc47100aa6 = Publiserte baner

seg-f032afe8b331 = Hver epoke oppdaterer (kilde <c1/>):

seg-b809eaf502ad = Bane

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-d4d4d5d5ec1f = { "0" } til { "100" }, eller <c1/> under kalibrering

seg-5280497b5d9f = <c1/>, største først: hvilke kontroller som reduserte scoren

seg-6089a3166c91 = monitorene som for øyeblikket er over terskelen sin

seg-55280b62eb19 = <c1/>, <c2/> eller <c3/> (når en gate kjører et annet sted; <c4/> fra <c5/> når den mangler)

seg-963da9c0d2a3 = <c1/>: posisjonen mottakeren under test rapporterte i den epoken (JSON-skjema { "1.1" } eller nyere; ikke publisert når strømmen ikke har noen, for eksempel fra <c2/> eller en eldre <c3/>). <b>Bare tillitskontekst</b>: pluginen skriver aldri <c4/>, så fartøyets egen posisjonsbane berøres ikke

seg-50599cef740d = utløst når tilstanden endres: <c1/>

seg-ad58b4599f78 = Pluginen sender også Signal K-metadata for disse banene én gang ved start. <c1/> er Kshanas tillitsscore fra { "0" } til { "100" }, en score og ikke et forhold eller en sannsynlighet, så den har ingen SI-enhet; metadataene gir området, en beskrivelse og soner som følger tersklene nedenfor. <c2/> er scorepoeng trukket fra den scoren fra { "0" } til { "100" }.

seg-bf0c90f5c02a = Varselet er <c1/>, <c2/>, <c3/> eller <c4/>. Det fjernes ved å publisere tilstanden <c5/>, ikke <c6/>: en forbruker som bare behandler <c7/> som fjernet bør behandle <c8/> som fjernet også. Som standard gir båndet <b>degraded</b> <c9/> og båndet <b>untrusted</b> gir <c10/>, med <c11/>. Det senkes etter <c12/> epoker med en bedre tilstand. Hvis ingen epoke kommer på <c13/> sekunder, advarer det om at scoren ikke oppdateres. Kalibrering utløser aldri et varsel. Kilden <c14/> har ingen <c15/>-liste (setningen har bare båndet, scoren og de to viktigste årsakene).

seg-89cdf02b58e3 = Konfigurasjon (hver terskel)

seg-d7bdd78470ec = den kjørbare filen (spawn-moduser). <b>Den kjører en hvilken som helst kjørbar fil som serverens bruker</b>: bare en administrator av Signal K-serveren bør kunne endre plugin-konfigurasjonen

seg-73091c431bcf = fartøyets grenser, terskler og scorevekter (spawn-moduser)

seg-f5f08c50abc7 = argumenter lagt til <c1/> i begge spawn-modusene: inndata for <c2/>, ekstra flagg som <c3/> (en lagret logg matet raskere enn sanntid) for <c4/>. Pluginen avviser <c5/>, <c6/>, <c7/> og <c8/> (den leser <c9/>s JSON på standard ut), og for <c10/> også inndataflaggene (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = TCP-moduser (gaten serverer på { "10110" }: sett porten for <c1/>)

seg-72b911dea6bd = <c1/>: båndet Kshana rapporterer, med kantene i sesjonsfilen. <c2/>: de to scorene nedenfor

seg-76ca56821979 = <c1/>-modus: under dette er tilstanden <c2/> (Kshanas standardkant for nominal)

seg-429d8fc4570f = <c1/>-modus: under dette er tilstanden <c2/> (Kshanas standardkant for degraded)

seg-6d5c9e402211 = tilstand for båndet degraded: <c1/>, <c2/> eller <c3/>

seg-e88a2979ef07 = påfølgende epoker med en dårligere tilstand før varselet utløses

seg-0eec67224385 = påfølgende epoker med en bedre tilstand før det senkes

seg-76b52e312539 = advar når ingen epoke kommer så lenge; <c1/> slår det av

seg-87d3fcf7fec9 = varselmetoder

seg-9a455cf4a2f9 = Pluginen fungerer ikke som gate: den endrer aldri en posisjonsbestemmelse. Å markere en posisjonsbestemmelse som ugyldig for et kartsystem er gaten, nedenfor.

seg-30f48b177c1c = <c1/>, ingen avhengigheter, ingen nettverk utover <c2/>. Testene tolker og spiller av et utdrag på 66 epoker av JSON-linjene og <c3/>-setningene som <c4/> skrev for den syntetiske Østersjø-demoen (oppdiktede data, bare tekst), og kontrollerer samsvar mellom de to formatene, hold- og fjerningsoppførselen, scoremodus, foreldelse og de tre inndatabanene mot en lokal strøm og en erstatningsunderprosess. Disse testene starter ikke en ekte Signal K-server; en separat skriptet kjøring gjør det, se nedenfor.

seg-024928983177 = Kjøring i en ekte Signal K-server

seg-80b5a217d13c = <c1/> inneholder et skript som laster pluginen inn i den låste <c2/> { "2.33.0" }-pakken (i et privat navnerom kun for loopback) og registrerer det serverens egne REST- og WebSocket-API-er viser. Tillitsbanene dukker opp, varselet går warn, alarm, normal (etter holdet) og warn igjen når dataene stopper, og med den ekte <c3/> matet av serverens egen NMEA-inngang publiserte den også <c4/>, aldri <c5/>. Én serverversjon, én kjøring, intet reelt fartøy; begrensninger og gjengivelse står i evidens-README-en.

seg-fea2e7d140c3 = OpenCPN leser NMEA fra nettverket, og <c1/> kan selv servere den gatede strømmen på en TCP-port.

seg-92981e13bc6f = Anbefalt: den direkte tilkoblingen.

seg-e6caa4d53b9a = (<c1/> er mottakerens serieport lest med <c2/> og <c3/>, en multiplekser, eller <c4/>/<c5/>-inndataene til <c6/> selv; referansebyggingens <c7/> gjør dette under systemd.) <c8/> binder seg til loopback-adressen; et hvilket som helst antall skrivebeskyttede klienter kan koble til, og en som ikke henger med, kobles fra uten å forsinke de andre.

seg-311e4379acf1 = Alternativ: reléet.

seg-11b4c4791f55 = <c1/> er en avhengighetsfri Node-fan-out som gjør det samme for en <c2/> uten <c3/>, eller serverer en hvilken som helst annen linjestrøm (containeralternativet bruker den for JSON-epokene):

seg-93cb82966313 = Den videresender byte uendret, bare hele linjer, og kobler fra en klient som ikke leser. Foretrekk den direkte tilkoblingen: én prosess mindre i kjeden.

seg-4226afc6175c = I OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protokoll <b>TCP</b>, adresse <c1/>, port <c2/>, retning <b>Input</b>. Så lenge tilliten ikke er kollapset, er strømmen mottakerens egen, pluss en <c3/>-setning per syklus. Mens den er kollapset, har den videresendte GGA kvalitet <c4/>, RMC-status <c5/>, og modusindikatorene sier ingen posisjonsbestemmelse, med sjekksummer regnet ut på nytt: utstyret ser at selve mottakeren erklærer posisjonsbestemmelsen ugyldig og utløser sin egen alarm. <c6/>-setningene er synlige i OpenCPNs NMEA-feilsøkingsvindu (Options, Connections, "NMEA debug window"). Posisjonsfeltene er uendret slik de ble mottatt.

seg-8549d49f1b2c = Les «Gate mode» i <a1><c1/></a1> før du stoler på dette: den er frivillig, legger til forsinkelse (en syklus holdes til epoken er scoret), er et enkelt punkt i kjeden, og kan holde tilbake en god posisjonsbestemmelse like godt som å slippe gjennom en forfalsket.

seg-533a911141d6 = <c1/> spiller av et registrert utdrag av den syntetiske gatede strømmen ({ "186" } setninger rundt tidspunktet tilliten kollapser, skrevet av <c2/>) gjennom reléet over en ekte TCP-socket og kontrollerer hva en forbruker mottar: strømmen byte for byte under vilkårlig oppdeling; gyldige sjekksummer på hver setning, også de omskrevne; GGA og RMC som stemmer overens, gyldige og deretter ugyldige uten flimmer; én <c3/> per syklus med gate-feltet <c4/> nøyaktig der posisjonsbestemmelsen er ugyldig; to forbrukere identiske; en delvis linje videresendes aldri. Dette kontrollerer strømmen OpenCPN får, ikke OpenCPNs egen skjerm.

seg-12fc91a3f69b = En ende-til-ende-kontroll med den ekte binærfilen, ikke en del av standardtestene (den trenger en bygget <c1/>):

seg-fea419a50c52 = Begge kjører den syntetiske demoen på én time og kontrollerer at posisjonsbestemmelsen blir gyldig, deretter ugyldig, med en <c1/> per epoke.

seg-e76c11d8f003 = Innebygd plugin

seg-7a5ac2d2f229 = <c1/> er et scorepanel for OpenCPN (score, bånd, gate, viktigste årsaker, et varsel når tilliten blir untrusted) som leser <c2/> fra OpenCPNs egen NMEA-strøm, så den trenger ingen tilkobling utover den ovenfor. Den bygges med CMake mot OpenCPNs plugin-API-header (medfølgende, med kildecommit) og wxWidgets; <c3/> kjører de wx-frie logikktestene og kontrollerer at biblioteket eksporterer inngangspunktene OpenCPN slår opp. Den er kjørt inne i OpenCPN { "5.8.4" } under en virtuell skjerm på den syntetiske gatede strømmen (OpenCPN ga <c4/> til pluginen, panelet ble rødt, og OpenCPNs egen posisjon frøs da gaten grep inn; skjermbilder, logg og skript i <c5/>), men ikke på et reelt skrivebord, andre versjoner eller plattformer, og den er ikke pakket for OpenCPNs plugin-behandler. Se pluginens <a1><c6/></a1>. Den er lisensiert under GPL-3.0-or-later, i motsetning til resten av depotet (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Skjermbilder fra den kjøringen, i <c1/> (én kjøring, OpenCPN { "5.8.4" } under en virtuell skjerm, syntetiske data; <a1><c2/></a1> oppgir begrensningene):

seg-ee5e8bb5a734 = OpenCPN-kartvinduet som kjører Kshana-pluginen med scorepanel på den syntetiske gatede strømmen, før tillitskollapsen: ingen panel er åpent (det åpner seg selv ved alarm), skipets posisjon i statuslinjen viser { "54" } { "32.4659" } N { "018" } { "46.1670" } E med fart { "16.48" } kn og kurs { "088" }, og posisjonsindikatoren øverst til høyre viser tre streker.

seg-1189d82affbb = Det samme OpenCPN-vinduet etter kollapsen: Kshana-panelet er åpent i rødt med scoren { "47" } og ordet UNTRUSTED, linjene gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 og alder { "2" } s, og uttalelsen om at dette er veiledende programvare, ikke typegodkjent navigasjonsutstyr, og at operatøren er fortsatt ansvarlig. Statuslinjen viser fortsatt { "54" } { "32.4672" } N { "018" } { "46.2227" } E, og posisjonsindikatoren har falt til to streker.

seg-90c7cdee8892 = OpenCPN matet direkte av kshana receiver-trust live --gate --listen: Kshana-panelet er åpent i rødt med scoren { "44" } og UNTRUSTED, linjene gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 og alder { "1" } s, og den veiledende uttalelsen. Denne kjøringen gir ikke belegg for observasjonen av at posisjonen fryser: OpenCPN var fortsatt i gang med den første strømmen av epoker.

seg-dce06383cde1 = Disse viser rørleggerarbeidet og at den gatede posisjonsbestemmelsen når OpenCPN, ikke at noe varsel kommer til rett tid eller er riktig for et reelt fartøy. Veiledende programvare, ikke typegodkjent utstyr.

seg-f9f39d089438 = <a1><c1/></a1>: en generisk delliste, OS-oppsett, to systemd-enheter (den veiledende monitoren og den frivillige gaten), et containeralternativ og Signal K-koblingen. <c2/> kjører <c3/> på enhetene uten å starte noe.

seg-5e2a2e8af941 = Scoren er bare så god som kontrollene bak den, som ser på et skips fysikk og dets andre sensorer; en selvkonsistent forfalskning med en matchende klokke ses ikke av monitorer som bare bruker NMEA (<a1><c1/></a1>). Fravær av alarm er ikke belegg for en god posisjonsbestemmelse.

seg-be1ed291f7c3 = Ingen tall på denne siden er en målt deteksjons- eller falsk alarm-rate. Testene ovenfor kontrollerer rørleggerarbeidet på syntetisk tekst; de sier ingenting om hvordan noen monitor klarer seg mot reell interferens.

seg-97d775b504c6 = Ikke typegodkjent; operatøren er fortsatt ansvarlig.

seg-69222f7d5068 = <s1>Forrige</s1>Interferenskart: datakilder og lisenser

seg-8eba9835d7df = <s1>Neste</s1>Himmelgeometri og skylinjer

seg-2093a1d8a24e = Hvor epokene kommer fra (source)
