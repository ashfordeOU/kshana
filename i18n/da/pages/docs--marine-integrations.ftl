# docs--marine-integrations: translations (da)

seg-2e34ace70d11 = Signal K-plugin

seg-0857a94a948e = Begrænsninger

seg-2247a2344710 = Betydning

seg-c3c260b7063e = Tests

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = se ovenfor

seg-c353e7bec219 = Nøgle

seg-df52127d74b6 = Hvor

seg-7670cf4ceda3 = Standard

seg-7e304f816037 = Kilde: <c1/>

seg-fb2b0841a172 = Maritime integrationer: tillidsscoren på broen

seg-a88b3968c706 = Kshanas maritime tillidsscore (<a1><c1/></a1>) kan nås fra software, som fritidssejlere allerede kører: et <b>Signal K</b>-serverplugin og <b>OpenCPN</b> gennem NMEA i gate-tilstand over TCP. En referencebygning sætter den på en lille computer ved siden af modtageren.

seg-eb8043b9e269 = <b>Vejledende software.</b> Kshana er ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }) og er ikke vurderet i forhold til nogen ydeevnestandard. Alt på denne side er en hjælp til navigatørens skøn. Operatøren er fortsat ansvarlig for fartøjets sikre navigation og for enhver beslutning om at stole på en positionsbestemmelse eller holde op med at stole på den. Intet her sender, og intet her gør en positionsbestemmelse mere nøjagtig.

seg-dab66f260e56 = Del

seg-40fd2019e974 = Status i { "0.35" }

seg-7bcecf49199c = leveret, enhedstestet på optaget syntetisk output; ikke udgivet på npm

seg-d5278e683d37 = OpenCPN gennem NMEA i gate-tilstand over TCP

seg-a876f5d43e39 = leveret og testet (afspilning på forbrugersiden); selve OpenCPN's brugerflade køres ikke af nogen test

seg-4a6d2f45b403 = Native scorepanel-plugin til OpenCPN

seg-b0d4d32612e9 = bygget, logikken enhedstestet og kørt i OpenCPN { "5.8.4" } under en virtuel skærm (evidens i <c1/>); ikke pakket til plugin-manageren; leveres først efter gennemgang

seg-2e0058b5e057 = Referencebygning

seg-959d93e3a56d = dele, OS-trin, systemd-enheder (kontrolleret med dry-run), en containermulighed; ikke afprøvet på et fartøj

seg-8524cb32f0a3 = Det hele læser én ting: output fra <c1/> (JSON-linjer, sætningen <c2/>, gaten). Trådformaterne er beskrevet i <a1><c3/></a1>. Signal K-pluginet samler sin viden om dem i én fil, <c4/>; en formatændring er en ændring i én fil.

seg-e5b08ab63d78 = Ingen npm-afhængigheder. Selve pluginet kører på Node { "18" } eller nyere; aktuelle udgaver af <c1/> kræver Node { "22" } eller nyere, så i praksis skal du bruge { "22" }. Kopiér eller link <c2/> ind i serverens <c3/> (for eksempel <c4/>), genstart serveren og aktivér <b>Kshana GNSS trust</b> under Server, Plugin Config.

seg-fd80525d7dd1 = Hvor epokerne kommer fra (<c1/>)

seg-013478c9a701 = Hvad pluginet gør

seg-abbd00e9cacf = <c1/> (standard)

seg-8ca5f95ed09d = Kører <c1/> og skriver hver rå NMEA { "0183" }-sætning, serveren modtager (serverens hændelse <c2/>), til dens standardinput. Genstarter den med back-off, hvis den afsluttes | <b>Brug den kun på en server med én enkelt NMEA-kilde</b>: den fodrer med hver sætning fra hver udbyder, sammenflettet, så en anden GNSS-modtager eller AIS ligner én modtager, hvis position hopper, og kan blive scoret som spoofing. Ved mere end én kilde skal du bruge <c3/> med den pågældende modtagers egen <c4/>-strøm eller <c5/> fra en gate.

seg-3b3eadcffb90 = Kører <c1/>, for eksempel <c2/> eller <c3/>

seg-d69b5ebe1042 = Forbinder til en strøm af de JSON-linjer, <c1/> skriver (for eksempel fra relayet i <c2/>)

seg-cd5a419844cc = Forbinder til en NMEA-strøm (for eksempel gate-outputtet fra tjenesten eller containeren i referencebygningen, port { "10110" }) og læser kun dens <c1/>-sætninger

seg-f17c9b7d7abc = En strøm, der allerede bliver spoofet, når monitoren første gang forbinder, har ingen ren baseline (de første <c1/> sekunder scores aldrig). Start den før rejsen.

seg-33fc47100aa6 = Udgivne stier

seg-f032afe8b331 = Hver epoke opdaterer (kilde <c1/>):

seg-b809eaf502ad = Sti

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-d4d4d5d5ec1f = { "0" } til { "100" } eller <c1/> under kalibrering

seg-5280497b5d9f = <c1/>, den største først: hvilke kontroller der sænkede scoren

seg-6089a3166c91 = de monitorer, der aktuelt er over deres tærskel

seg-55280b62eb19 = <c1/>, <c2/> eller <c3/> (når en gate kører et andet sted; <c4/> fra <c5/>, når den mangler)

seg-963da9c0d2a3 = <c1/>: den position, som modtageren under test rapporterede ved den epoke (JSON-skema { "1.1" } eller senere; udgives ikke, når strømmen ikke har nogen, for eksempel fra <c2/> eller en ældre <c3/>). <b>Kun tillidskontekst</b>: pluginet skriver aldrig <c4/>, så fartøjets egen positionssti berøres ikke

seg-50599cef740d = udløses, når tilstanden skifter: <c1/>

seg-ad58b4599f78 = Pluginet sender også Signal K-metadata for disse stier én gang ved start. <c1/> er Kshanas tillidsscore fra { "0" } til { "100" }, en score og ikke et forhold eller en sandsynlighed, så den har ingen SI-enhed; dens metadata angiver intervallet, en beskrivelse og zoner, der følger tærsklerne nedenfor. <c2/> er scorepoint, der trækkes fra denne score fra { "0" } til { "100" }.

seg-bf0c90f5c02a = Meddelelsen er <c1/>, <c2/>, <c3/> eller <c4/>. Den ryddes ved at udgive tilstanden <c5/>, ikke <c6/>: en forbruger, der kun behandler <c7/> som ryddet, bør også behandle <c8/> som ryddet. Som standard giver båndet <b>degraded</b> <c9/>, og båndet <b>untrusted</b> giver <c10/>, med <c11/>. Den sænkes efter <c12/> epoker ved en bedre tilstand. Hvis der ikke kommer nogen epoke i <c13/> sekunder, advarer den om, at scoren ikke opdateres. Kalibrering udløser aldrig en meddelelse. Kilden <c14/> har ingen <c15/>-liste (sætningen har kun båndet, scoren og de to øverste årsager).

seg-89cdf02b58e3 = Konfiguration (hver tærskel)

seg-d7bdd78470ec = den kørbare fil (spawn-tilstande). <b>Den kører enhver kørbar fil som serverens bruger</b>: kun en administrator af Signal K-serveren bør kunne ændre pluginets konfiguration

seg-73091c431bcf = fartøjets grænser, tærskler og scorevægte (spawn-tilstande)

seg-f5f08c50abc7 = argumenter, der føjes til <c1/> i begge spawn-tilstande: input til <c2/>, ekstra flag såsom <c3/> (en gemt log fodret hurtigere end realtid) til <c4/>. Pluginet afviser <c5/>, <c6/>, <c7/> og <c8/> (det læser JSON fra <c9/> på standardoutput) og for <c10/> også inputflagene (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = TCP-tilstande (gaten leverer på { "10110" }: angiv porten for <c1/>)

seg-72b911dea6bd = <c1/>: det bånd, Kshana rapporterer, med grænserne i sessionsfilen. <c2/>: de to scorer nedenfor

seg-76ca56821979 = tilstand <c1/>: herunder er tilstanden <c2/> (Kshanas standardgrænse for nominal)

seg-429d8fc4570f = tilstand <c1/>: herunder er tilstanden <c2/> (Kshanas standardgrænse for degraded)

seg-6d5c9e402211 = tilstand for båndet degraded: <c1/>, <c2/> eller <c3/>

seg-e88a2979ef07 = på hinanden følgende epoker ved en dårligere tilstand, før meddelelsen udløses

seg-0eec67224385 = på hinanden følgende epoker ved en bedre tilstand, før den sænkes

seg-76b52e312539 = advar, når der ikke kommer nogen epoke så længe; <c1/> slår den fra

seg-87d3fcf7fec9 = meddelelsesmetoder

seg-9a455cf4a2f9 = Pluginet fungerer ikke som gate: det ændrer aldrig en positionsbestemmelse. At markere en positionsbestemmelse som ugyldig for et kortsystem er gaten, nedenfor.

seg-30f48b177c1c = <c1/>, ingen afhængigheder, intet netværk ud over <c2/>. Testene fortolker og afspiller et uddrag på 66 epoker af de JSON-linjer og <c3/>-sætninger, som <c4/> skrev for den syntetiske Østersø-demo (opdigtede data, kun tekst), og kontrollerer, at de to formater er enige, samt hold- og rydningsadfærden, scoretilstand, forældelse og de tre inputstier mod en lokal feed og en stand-in-børneproces. Disse tests starter ikke en rigtig Signal K-server; en særskilt scriptet kørsel gør, se nedenfor.

seg-024928983177 = Kørsel i en rigtig Signal K-server

seg-80b5a217d13c = <c1/> rummer et script, der indlæser pluginet i den fastlåste pakke <c2/> { "2.33.0" } (i et privat netværksnavnerum kun med loopback) og optager, hvad serverens egne REST- og WebSocket-API'er viser. Tillidsstierne vises, meddelelsen går warn, alarm, normal (efter holdet) og igen warn, når dataene stopper, og med den rigtige <c3/>, fodret af serverens eget NMEA-input, udgav den også <c4/>, aldrig <c5/>. Én serverversion, én kørsel, intet virkeligt fartøj; begrænsninger og gengivelse står i evidens-README'en.

seg-fea2e7d140c3 = OpenCPN læser NMEA fra netværket, og <c1/> kan selv levere den gatede strøm på en TCP-port.

seg-92981e13bc6f = Anbefalet: den direkte forbindelse.

seg-e6caa4d53b9a = (<c1/> er modtagerens serielle port læst med <c2/> og <c3/>, en multiplexer eller inputtene <c4/>/<c5/> i <c6/> selv; referencebygningens <c7/> gør dette under systemd.) <c8/> binder loopback-adressen; et vilkårligt antal skrivebeskyttede klienter kan forbinde, og en, der ikke kan følge med, droppes uden at forsinke de øvrige.

seg-311e4379acf1 = Alternativ: relayet.

seg-11b4c4791f55 = <c1/> er en afhængighedsfri Node-fan-out, der gør det samme for en <c2/> uden <c3/>, eller leverer enhver anden linjestrøm (containermuligheden bruger den til JSON-epokerne):

seg-93cb82966313 = Den videresender bytes uændret, kun hele linjer, og dropper en klient, der ikke læser. Foretræk den direkte forbindelse: én proces mindre i kæden.

seg-4226afc6175c = I OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protokol <b>TCP</b>, adresse <c1/>, port <c2/>, retning <b>Input</b>. Så længe tilliden ikke er brudt sammen, er strømmen modtagerens egen plus én sætning <c3/> pr. cyklus. Når den er brudt sammen, har den videresendte GGA kvaliteten <c4/>, RMC-status <c5/>, og tilstandsindikatorerne siger ingen positionsbestemmelse, med genberegnede kontrolsummer: udstyret ser modtageren selv erklære positionsbestemmelsen for ugyldig og udløser sin egen alarm. Sætningerne <c6/> kan ses i OpenCPN's NMEA-fejlfindingsvindue (Options, Connections, "NMEA debug window"). Positionsfelterne er uændret, som de blev modtaget.

seg-8549d49f1b2c = Læs "Gate mode" i <a1><c1/></a1>, før du stoler på dette: den er til valg, tilføjer latenstid (en cyklus holdes, indtil dens epoke er scoret), er et enkelt punkt i kæden og kan holde en god positionsbestemmelse tilbage lige så vel som lade en forfalsket passere.

seg-533a911141d6 = <c1/> afspiller et optaget uddrag af den syntetiske gatede strøm ({ "186" } sætninger omkring det øjeblik, hvor tilliden brister, skrevet af <c2/>) gennem relayet over en rigtig TCP-socket og kontrollerer, hvad en forbruger modtager: strømmen byte for byte under vilkårlig opdeling; gyldige kontrolsummer på hver sætning, også de omskrevne; GGA og RMC, der er enige, gyldige og derefter ugyldige uden flimmer; én <c3/> pr. cyklus med dens gate-felt <c4/> præcis dér, hvor positionsbestemmelsen er ugyldig; to forbrugere identiske; en delvis linje, der aldrig videresendes. Dette kontrollerer den strøm, OpenCPN får, ikke OpenCPN's egen skærm.

seg-12fc91a3f69b = En kontrol fra ende til anden med den rigtige binære fil, ikke en del af standardtestene (den kræver en bygget <c1/>):

seg-fea419a50c52 = Begge kører den syntetiske demo på en time og kontrollerer, at positionsbestemmelsen bliver gyldig og derefter ugyldig, med en <c1/> pr. epoke.

seg-e76c11d8f003 = Native plugin

seg-7a5ac2d2f229 = <c1/> er et scorepanel til OpenCPN (score, bånd, gate, de vigtigste årsager, en advarsel, når tilliden bliver untrusted), der læser <c2/> fra OpenCPN's egen NMEA-strøm, så det ikke kræver nogen forbindelse ud over den ovenfor. Det bygges med CMake mod OpenCPN's plugin-API-header (medbragt, med sin kildekommit) og wxWidgets; <c3/> kører logiktestene uden wx og kontrollerer, at biblioteket eksporterer de indgangspunkter, OpenCPN slår op. Det er kørt inde i OpenCPN { "5.8.4" } under en virtuel skærm på den syntetiske gatede strøm (OpenCPN gav <c4/> videre til pluginet, panelet blev rødt, og OpenCPN's egen position frøs, da gaten gik i indgreb; skærmbilleder, log og script i <c5/>), men ikke på et rigtigt skrivebord, andre versioner eller platforme, og det er ikke pakket til OpenCPN's plugin-manager. Se pluginets <a1><c6/></a1>. Det er licenseret under GPL-3.0-or-later, i modsætning til resten af repositoriet (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Skærmbilleder fra den kørsel, i <c1/> (én kørsel, OpenCPN { "5.8.4" } under en virtuel skærm, syntetiske data; <a1><c2/></a1> angiver begrænsningerne):

seg-ee5e8bb5a734 = OpenCPN's kortvindue, der kører Kshana-scorepanelets plugin på den syntetiske gatede strøm, før tillidsbruddet: intet panel er åbent (det åbner selv ved alarmen), skibets position i statuslinjen viser { "54" } { "32.4659" } N { "018" } { "46.1670" } E med fart { "16.48" } kn og kurs { "088" }, og positionsbestemmelsesindikatoren øverst til højre viser tre streger.

seg-1189d82affbb = Det samme OpenCPN-vindue efter bruddet: Kshana-panelet er åbent i rødt med scoren { "47" } og ordet UNTRUSTED, linjerne gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 og alder { "2" } s samt erklæringen om, at dette er vejledende software, ikke typegodkendt navigationsudstyr, og at operatøren er fortsat ansvarlig. Statuslinjen viser stadig { "54" } { "32.4672" } N { "018" } { "46.2227" } E, og positionsbestemmelsesindikatoren er faldet til to streger.

seg-90c7cdee8892 = OpenCPN fodret direkte af kshana receiver-trust live --gate --listen: Kshana-panelet er åbent i rødt med scoren { "44" } og UNTRUSTED, linjerne gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 og alder { "1" } s samt den vejledende erklæring. Denne kørsel understøtter ikke observationen af, at positionen fryser: OpenCPN var stadig i gang med den indledende byge af epoker.

seg-dce06383cde1 = Disse viser rørføringen og den gatede positionsbestemmelse, der når frem til OpenCPN, ikke at nogen alarm er rettidig eller korrekt for et virkeligt fartøj. Vejledende software, ikke typegodkendt udstyr.

seg-f9f39d089438 = <a1><c1/></a1>: en generisk stykliste, OS-opsætning, to systemd-enheder (den vejledende monitor og gaten, der er til valg), en containermulighed og Signal K-forbindelsen. <c2/> kører <c3/> på enhederne uden at starte noget.

seg-5e2a2e8af941 = Scoren er kun så god som de kontroller, der ligger bag den, og de ser på et skibs fysik og dets andre sensorer; en selvkonsistent forfalskning med et ur, der passer, ses ikke af monitorer, der kun bruger NMEA (<a1><c1/></a1>). Fravær af en alarm er ikke belæg for en god positionsbestemmelse.

seg-be1ed291f7c3 = Intet tal på denne side er en målt detektions- eller falsk-alarm-rate. Testene ovenfor kontrollerer rørføringen på syntetisk tekst; de siger intet om, hvordan en monitor klarer sig over for virkelig interferens.

seg-97d775b504c6 = Ikke typegodkendt; operatøren er fortsat ansvarlig.

seg-69222f7d5068 = <s1>Forrige</s1>Interferenskort: datakilder og licenser

seg-8eba9835d7df = <s1>Næste</s1>Himmelgeometri og horisontprofiler

seg-2093a1d8a24e = Hvor epokerne kommer fra (kilde)
