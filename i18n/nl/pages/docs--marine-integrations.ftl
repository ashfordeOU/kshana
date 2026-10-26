# docs--marine-integrations: translations (nl)

seg-2e34ace70d11 = Signal K-plug-in

seg-0857a94a948e = Beperkingen

seg-2247a2344710 = Betekenis

seg-c3c260b7063e = Tests

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = zie hierboven

seg-c353e7bec219 = Sleutel

seg-df52127d74b6 = Waar

seg-7670cf4ceda3 = Standaard

seg-7e304f816037 = Bron: <c1/>

seg-fb2b0841a172 = Maritieme integraties: de vertrouwensscore op de brug

seg-a88b3968c706 = De maritieme vertrouwensscore van { -brand } (<a1><c1/></a1>) is bereikbaar vanuit software die schippers al gebruiken: een plug-in voor een <b>Signal K</b>-server en <b>OpenCPN</b> via NMEA in gate-modus over TCP. Een referentiebouw zet haar op een kleine computer naast de ontvanger.

seg-eb8043b9e269 = <b>Adviserende software.</b> { -brand } is geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }) en is niet getoetst aan enige prestatienorm. Alles op deze pagina is een hulpmiddel bij het oordeel van de navigator. De exploitant blijft verantwoordelijk voor de veilige navigatie van het vaartuig en voor elke beslissing om op een positiebepaling te vertrouwen of daarmee te stoppen. Niets hier zendt uit, en niets hier maakt een positiebepaling nauwkeuriger.

seg-dab66f260e56 = Onderdeel

seg-40fd2019e974 = Status in { "0.35" }

seg-7bcecf49199c = meegeleverd, unit-getest op vastgelegde synthetische uitvoer; niet gepubliceerd op npm

seg-d5278e683d37 = OpenCPN via NMEA in gate-modus over TCP

seg-a876f5d43e39 = meegeleverd en getest (replay aan de consumentenkant); de gebruikersinterface van OpenCPN zelf wordt door geen enkele test aangestuurd

seg-4a6d2f45b403 = Native scorepaneel-plug-in voor OpenCPN

seg-b0d4d32612e9 = gebouwd, logica unit-getest, en uitgevoerd binnen OpenCPN { "5.8.4" } onder een virtueel scherm (bewijs in <c1/>); niet verpakt voor de pluginmanager; wordt pas meegeleverd na beoordeling

seg-2e0058b5e057 = Referentiebouw

seg-959d93e3a56d = onderdelen, OS-stappen, systemd-units (droog gecontroleerd), een containeroptie; niet getest op een vaartuig

seg-8524cb32f0a3 = Alles leest één ding: de uitvoer van <c1/> (JSON-regels, de zin <c2/>, de gate). De draadformaten staan in <a1><c3/></a1>. De Signal K-plug-in houdt haar kennis daarvan in één bestand, <c4/>; een formaatwijziging is een bewerking van één bestand.

seg-e5b08ab63d78 = Geen npm-afhankelijkheden. De plug-in zelf draait op Node { "18" } of nieuwer; huidige releases van <c1/> vereisen Node { "22" } of nieuwer, dus gebruik in de praktijk { "22" }. Kopieer of koppel <c2/> in de <c3/> van de server (bijvoorbeeld <c4/>), start de server opnieuw en schakel <b>Kshana GNSS trust</b> in onder Server, Plugin Config.

seg-fd80525d7dd1 = Waar de epochs vandaan komen (<c1/>)

seg-013478c9a701 = Wat de plug-in doet

seg-abbd00e9cacf = <c1/> (standaard)

seg-8ca5f95ed09d = Voert <c1/> uit en schrijft elke ruwe NMEA { "0183" }-zin die de server ontvangt (de gebeurtenis <c2/> van de server) naar zijn standaardinvoer. Start het opnieuw, met back-off, als het eindigt | <b>Gebruik het alleen op een server met één enkele NMEA-bron</b>: het voert elke zin van elke provider door elkaar in, zodat een tweede GNSS-ontvanger of AIS eruitziet als één ontvanger waarvan de positie springt en als spoofing kan worden gescoord. Gebruik bij meer dan één bron <c3/> met de eigen <c4/>-stream van die ontvanger, of <c5/> vanaf een gate.

seg-3b3eadcffb90 = Voert <c1/> uit, bijvoorbeeld <c2/> of <c3/>

seg-d69b5ebe1042 = Maakt verbinding met een feed van de JSON-regels die <c1/> schrijft (bijvoorbeeld vanaf het relay in <c2/>)

seg-cd5a419844cc = Maakt verbinding met een NMEA-stream (zoals de gate-uitvoer van de service of container in de referentiebouw, poort { "10110" }) en leest alleen de <c1/>-zinnen ervan

seg-f17c9b7d7abc = Een stream die al wordt gespooft wanneer de monitor voor het eerst verbinding maakt, heeft geen schone basislijn (de eerste <c1/> seconden worden nooit gescoord). Start hem vóór de reis.

seg-33fc47100aa6 = Gepubliceerde paden

seg-f032afe8b331 = Elke epoch werkt bij (bron <c1/>):

seg-b809eaf502ad = Pad

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> of <c4/>

seg-d4d4d5d5ec1f = { "0" } tot { "100" }, of <c1/> tijdens de kalibratie

seg-5280497b5d9f = <c1/>, grootste eerst: welke controles de score hebben verlaagd

seg-6089a3166c91 = de monitors die op dit moment boven hun drempel zitten

seg-55280b62eb19 = <c1/>, <c2/> of <c3/> (wanneer elders een gate draait; <c4/> uit <c5/> wanneer afwezig)

seg-963da9c0d2a3 = <c1/>: de positie die de te testen ontvanger op die epoch meldde (JSON-schema { "1.1" } of later; niet gepubliceerd wanneer de stream er geen draagt, bijvoorbeeld van <c2/> of een oudere <c3/>). <b>Alleen vertrouwenscontext</b>: de plug-in schrijft nooit <c4/>, zodat het eigen positiepad van het vaartuig onaangeroerd blijft

seg-50599cef740d = gegeven wanneer de status verandert: <c1/>

seg-ad58b4599f78 = De plug-in stuurt bij de start ook eenmalig Signal K-metadata voor deze paden. <c1/> is de vertrouwensscore van { -brand } van { "0" } tot { "100" }, een score en geen verhouding of kans, dus zij heeft geen SI-eenheid; haar metadata geeft het bereik, een beschrijving en zones die de onderstaande drempels volgen. <c2/> zijn scorepunten die van die score van { "0" } tot { "100" } worden afgetrokken.

seg-bf0c90f5c02a = De melding is <c1/>, <c2/>, <c3/> of <c4/>. Zij wordt gewist door status <c5/> te publiceren, niet <c6/>: een consument die alleen <c7/> als gewist beschouwt, moet <c8/> ook als gewist beschouwen. Standaard geeft de band <b>degraded</b> <c9/> en de band <b>untrusted</b> <c10/>, met <c11/>. Zij wordt verlaagd na <c12/> epochs op een betere status. Als er <c13/> seconden geen epoch binnenkomt, waarschuwt zij dat de score niet wordt bijgewerkt. Kalibratie geeft nooit een melding. De bron <c14/> draagt geen lijst <c15/> (de zin heeft alleen de band, de score en de twee belangrijkste redenen).

seg-89cdf02b58e3 = Configuratie (elke drempel)

seg-d7bdd78470ec = het uitvoerbare bestand (spawn-modi). <b>Het voert elk uitvoerbaar bestand uit als de gebruiker van de server</b>: alleen een beheerder van de Signal K-server mag de plug-inconfiguratie kunnen wijzigen

seg-73091c431bcf = de grenzen, drempels en scoregewichten van het vaartuig (spawn-modi)

seg-f5f08c50abc7 = argumenten die in beide spawn-modi aan <c1/> worden toegevoegd: de invoer voor <c2/>, extra vlaggen zoals <c3/> (een opgeslagen log sneller dan real time ingevoerd) voor <c4/>. De plug-in weigert <c5/>, <c6/>, <c7/> en <c8/> (zij leest de JSON van <c9/> op de standaarduitvoer), en voor <c10/> ook de invoervlaggen (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = TCP-modi (de gate serveert op { "10110" }: stel de poort in voor <c1/>)

seg-72b911dea6bd = <c1/>: de band die { -brand } meldt, met de randen in het sessiebestand. <c2/>: de twee onderstaande scores

seg-76ca56821979 = Modus <c1/>: eronder is de status <c2/> (de standaardrand van { -brand } voor nominal)

seg-429d8fc4570f = Modus <c1/>: eronder is de status <c2/> (de standaardrand van { -brand } voor degraded)

seg-6d5c9e402211 = status voor de band degraded: <c1/>, <c2/> of <c3/>

seg-e88a2979ef07 = opeenvolgende epochs op een slechtere status voordat de melding wordt gegeven

seg-0eec67224385 = opeenvolgende epochs op een betere status voordat zij wordt verlaagd

seg-76b52e312539 = waarschuw wanneer er zo lang geen epoch binnenkomt; <c1/> schakelt het uit

seg-87d3fcf7fec9 = meldingsmethoden

seg-9a455cf4a2f9 = De plug-in fungeert niet als gate: zij wijzigt nooit een positiebepaling. Een positiebepaling voor een kaartsysteem ongeldig markeren is de gate, hieronder.

seg-30f48b177c1c = <c1/>, geen afhankelijkheden, geen netwerk behalve <c2/>. De tests parseren en spelen een uittreksel van 66 epochs af van de JSON-regels en <c3/>-zinnen die <c4/> schreef voor de synthetische Baltic-demo (verzonnen gegevens, alleen tekst), en controleren de overeenstemming tussen de twee formaten, het vasthoud- en wisgedrag, de scoremodus, veroudering en de drie invoerpaden tegen een lokale feed en een stand-in-kindproces. Die tests starten geen echte Signal K-server; een aparte gescripte run doet dat wel, zie hieronder.

seg-024928983177 = Draaien in een echte Signal K-server

seg-80b5a217d13c = <c1/> bevat een script dat de plug-in laadt in het vastgepinde pakket <c2/> { "2.33.0" } (in een privé-netwerknaamruimte met alleen loopback) en vastlegt wat de eigen REST- en WebSocket-API's van de server tonen. De vertrouwenspaden verschijnen, de melding gaat naar warn, alarm, normal (na het vasthouden) en weer naar warn wanneer de gegevens stoppen, en met de echte <c3/>, gevoed door de eigen NMEA-invoer van de server, publiceerde hij ook <c4/>, nooit <c5/>. Eén serverversie, één run, geen echt vaartuig; beperkingen en reproductie in de README van het bewijs.

seg-fea2e7d140c3 = OpenCPN leest NMEA van het netwerk, en <c1/> kan de gegate stream zelf op een TCP-poort aanbieden.

seg-92981e13bc6f = Aanbevolen: de directe verbinding.

seg-e6caa4d53b9a = (<c1/> is de seriële poort van de ontvanger gelezen met <c2/> en <c3/>, een multiplexer, of de invoer <c4/>/<c5/> van <c6/> zelf; <c7/> van de referentiebouw doet dit onder systemd.) <c8/> bindt het loopback-adres; een willekeurig aantal alleen-lezen clients mag verbinden, en een client die het niet bijhoudt wordt verwijderd zonder de andere te vertragen.

seg-311e4379acf1 = Alternatief: het relay.

seg-11b4c4791f55 = <c1/> is een afhankelijkheidsvrije Node-fan-out die hetzelfde doet voor een <c2/> zonder <c3/>, of een andere regelstream aanbiedt (de containeroptie gebruikt het voor de JSON-epochs):

seg-93cb82966313 = Het stuurt bytes ongewijzigd door, alleen hele regels, en verwijdert een client die niet leest. Geef de voorkeur aan de directe verbinding: één proces minder in de keten.

seg-4226afc6175c = In OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protocol <b>TCP</b>, adres <c1/>, poort <c2/>, richting <b>Input</b>. Zolang het vertrouwen niet is ingestort, is de stream die van de ontvanger zelf, plus een <c3/>-zin per cyclus. Zodra het is ingestort, heeft de doorgestuurde GGA kwaliteit <c4/>, RMC-status <c5/>, en geven de modusindicatoren aan dat er geen positiebepaling is, met opnieuw berekende controlesommen: de apparatuur ziet de ontvanger zelf de positiebepaling ongeldig verklaren en geeft haar eigen alarm. De <c6/>-zinnen zijn zichtbaar in het NMEA-debugvenster van OpenCPN (Options, Connections, "NMEA debug window"). De positievelden blijven zoals ontvangen.

seg-8549d49f1b2c = Lees "Gate mode" in <a1><c1/></a1> voordat u hierop vertrouwt: het is opt-in, voegt latentie toe (een cyclus wordt vastgehouden totdat haar epoch is gescoord), is één enkel punt in de keten, en kan een goede positiebepaling tegenhouden en een vervalste doorlaten.

seg-533a911141d6 = <c1/> speelt een vastgelegd uittreksel van de synthetische gegate stream af ({ "186" } zinnen rond het moment waarop het vertrouwen instort, geschreven door <c2/>) via het relay over een echte TCP-socket en controleert wat een consument ontvangt: de stream byte voor byte bij willekeurige chunking; geldige controlesommen op elke zin, ook de herschreven; GGA en RMC die overeenstemmen, geldig en dan ongeldig zonder flikkering; één <c3/> per cyclus met zijn gate-veld <c4/> precies waar de positiebepaling ongeldig is; twee consumenten identiek; een gedeeltelijke regel nooit doorgestuurd. Dit controleert de stream die OpenCPN krijgt, niet het eigen scherm van OpenCPN.

seg-12fc91a3f69b = Een end-to-end-controle met de echte binary, geen onderdeel van de standaardtests (zij vereist een gebouwde <c1/>):

seg-fea419a50c52 = Beide voeren de synthetische demo van een uur uit en controleren dat de positiebepaling geldig wordt en daarna ongeldig, met een <c1/> per epoch.

seg-e76c11d8f003 = Native plug-in

seg-7a5ac2d2f229 = <c1/> is een scorepaneel voor OpenCPN (score, band, gate, belangrijkste redenen, een waarschuwing wanneer het vertrouwen untrusted wordt) dat <c2/> uit de eigen NMEA-stream van OpenCPN leest, zodat zij geen andere verbinding nodig heeft dan de hierboven genoemde. Zij wordt met CMake gebouwd tegen het headerbestand van de plug-in-API van OpenCPN (meegeleverd, met zijn bron-commit) en wxWidgets; <c3/> voert de wx-vrije logicatests uit en controleert dat de bibliotheek de ingangspunten exporteert die OpenCPN opzoekt. Zij is uitgevoerd binnen OpenCPN { "5.8.4" } onder een virtueel scherm op de synthetische gegate stream (OpenCPN gaf <c4/> door aan de plug-in, het paneel werd rood, en de eigen positie van OpenCPN bevroor toen de gate in werking trad; schermafbeeldingen, log en script in <c5/>), maar niet op een echte desktop, andere versies of platforms, en zij is niet verpakt voor de pluginmanager van OpenCPN. Zie de <a1><c6/></a1> van de plug-in. Zij valt onder GPL-3.0-or-later, anders dan de rest van de repository (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Schermafbeeldingen van die run, in <c1/> (één run, OpenCPN { "5.8.4" } onder een virtueel scherm, synthetische gegevens; <a1><c2/></a1> geeft de beperkingen):

seg-ee5e8bb5a734 = Het OpenCPN-kaartvenster met de scorepaneel-plug-in van Kshana op de synthetische gegate stream, vóór de instorting van het vertrouwen: er is geen paneel open (het opent zichzelf bij het alarm), de scheepspositie in de statusbalk luidt { "54" } { "32.4659" } N { "018" } { "46.1670" } E met snelheid { "16.48" } kn en koers { "088" }, en de positie-indicator rechtsboven toont drie streepjes.

seg-1189d82affbb = Hetzelfde OpenCPN-venster na de instorting: het Kshana-paneel is rood geopend met de score { "47" } en het woord UNTRUSTED, de regels gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 en leeftijd { "2" } s, en de verklaring dat dit adviserende software is, geen typegoedgekeurde navigatieapparatuur, en dat de exploitant verantwoordelijk blijft. De statusbalk luidt nog steeds { "54" } { "32.4672" } N { "018" } { "46.2227" } E, en de positie-indicator is gezakt naar twee streepjes.

seg-90c7cdee8892 = OpenCPN rechtstreeks gevoed door kshana receiver-trust live --gate --listen: het Kshana-paneel is rood geopend met de score { "44" } en UNTRUSTED, de regels gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 en leeftijd { "1" } s, en de adviserende verklaring. Deze run ondersteunt de waarneming van het bevriezen van de positie niet: OpenCPN was nog bezig met de eerste stortvloed aan epochs.

seg-dce06383cde1 = Deze tonen de leidingen en de gegate positiebepaling die OpenCPN bereikt, niet dat enig alarm tijdig of juist is voor een echt vaartuig. Adviserende software, geen typegoedgekeurde apparatuur.

seg-f9f39d089438 = <a1><c1/></a1>: een generieke onderdelenlijst, OS-installatie, twee systemd-units (de adviserende monitor en de opt-in gate), een containeroptie en de Signal K-bedrading. <c2/> voert <c3/> uit op de units zonder iets te starten.

seg-5e2a2e8af941 = De score is slechts zo goed als de controles erachter, die naar de natuurkunde van een schip en zijn andere sensoren kijken; een zelfconsistente vervalsing met een overeenkomende klok wordt door monitors die alleen op NMEA werken niet gezien (<a1><c1/></a1>). Het uitblijven van een alarm is geen bewijs van een goede positiebepaling.

seg-be1ed291f7c3 = Geen cijfer op deze pagina is een gemeten detectie- of valsalarmpercentage. De tests hierboven controleren de leidingen op synthetische tekst; zij zeggen niets over hoe enige monitor het doet bij echte interferentie.

seg-97d775b504c6 = Geen typegoedgekeurde apparatuur; de exploitant blijft verantwoordelijk.

seg-69222f7d5068 = <s1>Vorige</s1>Interferentiekaart: gegevensbronnen en licenties

seg-8eba9835d7df = <s1>Volgende</s1>Hemelgeometrie en skylines

seg-2093a1d8a24e = Waar de epochs vandaan komen (source)
