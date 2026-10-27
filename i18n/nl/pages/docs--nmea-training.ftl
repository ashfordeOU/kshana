# docs--nmea-training: translations (nl)

seg-2247a2344710 = Betekenis

seg-45425f378b61 = betekenis

seg-6940543aa3c0 = tekenreeks

seg-f5e7215e6835 = object

seg-c5fb6b91dc68 = graden

seg-99427ab75a03 = veld

seg-bbcdd898d24d = geheel getal

seg-ba00d0453fbf = Bron: <c1/>

seg-738956d0a4b9 = NMEA-trainingsstromen: <c1/>

seg-3663955f80c7 = Maritieme academies en simulatiecentra kunnen door Kshana gegenereerde NMEA { "0183" } in een brugsimulator of een kaartplotter voeren om bemanningen te trainen GNSS-jamming en spoofing te herkennen.

seg-4012bc6376aa = <b>Alleen voor training en test.</b> De gegenereerde stromen zijn synthetisch. Ze mogen nooit in de live navigatiesystemen van een vaartuig worden gevoerd. Kshana is adviserend, geen typegoedgekeurde navigatieapparatuur. Elke stroom begint met, en herhaalt elke tien seconden, een eigen markeringszin, <c1/>, die ontvangers negeren; <c2/> verwijdert die voor een simulator die onbekende zinnen weigert. Dit schrijft <b>alleen NMEA-tekst</b>: er is geen RF-, IQ- of golfvormuitvoer, en niets zendt uit behalve de tekst naar het adres dat u opgeeft.

seg-b66ff9ca2ff4 = Trainingsstroom uit het scenario coastal-drag-off (engine v{ $version }, seed { "22" }, { "25" } minuten bij één positiebepaling per { "10" } s van het instructeurslogboek). Een kaart toont het ware spoor van het vaartuig en het spoor dat de ontvanger meldt: ze komen overeen tot een gescripte positie-drag-off begint bij { "421" } s, het gemelde spoor wijkt daarna af van het ware terwijl de ontvanger een geldige positiebepaling behoudt, en het springt terug wanneer de gebeurtenis eindigt bij { "1140" } s. Ernaast de afstand tussen de twee sporen in de tijd en de gemiddelde draaggolf-ruisdichtheid die de ontvanger meldt, die stijgt naar één verhoogd niveau zolang de gebeurtenis duurt. Synthetische trainingsdata, gegenereerd door Kshana. Alleen voor training en test: voer deze stroom nooit in de live navigatiesystemen van een vaartuig. Adviserend, geen typegoedgekeurde navigatieapparatuur. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. Posities, data en sporen zijn verzonnen.

seg-1f70c2c761ac = De figuur is getekend uit het instructeurslogboek van <c1/>.

seg-32b620b3574e = Gebruik

seg-9cbd24964be4 = Optie

seg-aadcf289aed2 = schrijf de stroom naar een bestand; zonder netwerkuitvoer is de standaard <c1/>

seg-a3fc46437059 = schrijf <c1/> en <c2/> (standaard: naast het bestand)

seg-14dad363af8a = <c1/> of <c2/>

seg-8e105cf0979b = TCP-server; de run begint wanneer een client is verbonden (<c1/>). Een kale poort luistert alleen op <c2/>

seg-63ee193b90b4 = <c1/> of <c2/>

seg-fc322c7ce2db = UDP, één zin per datagram; <c1/> staat een broadcastadres toe. Een kale poort verzendt naar <c2/>

seg-8ca50e2a4b8d = bepaal het tempo van de stroom; <c1/> is zo snel mogelijk. Netwerkuitvoer gebruikt standaard realtime, bestanden zo snel mogelijk

seg-97b82dfe97a7 = vervang de seed van het scenario

seg-86ac66fd2771 = laat de markeringszin weg

seg-f6cc05a6d39a = <b>Er is geen authenticatie.</b> Een TCP-server met een niet-lokaal adres levert de stroom aan iedereen die hem kan bereiken, en UDP verzendt naar elk adres dat u opgeeft. Een TCP-client die zijn data niet binnen twee seconden afneemt, wordt losgekoppeld, zodat één vastgelopen afnemer de andere niet kan ophouden.

seg-b4abb5a132ba = Dezelfde seed geeft op één platform dezelfde bytes, en tempo verandert de bytes nooit. Tussen platforms is de eigen rekenkunde van de generator bitgelijk (hij gebruikt de draagbare wiskundelaag), maar satellietposities en kijkhoeken komen van enginefuncties die de wiskundebibliotheek van de host aanroepen, dus in een zeldzaam grensgeval kan een afgeronde elevatie-, azimut- of C/N0-digit in GSV tussen platforms verschillen.

seg-97e31fc7f0d1 = Wat er wordt geschreven

seg-632a4ca26567 = Elke epoch ({ "1" }, { "2" }, { "5" } of { "10" } per seconde) bevat: <b>RMC, GGA, GNS</b> (positiebepaling, positie, tijd), <b>GSA</b> (gebruikte satellieten en DOP, één per constellatie), <b>GSV</b> (satellieten in zicht met elevatie, azimut en SNR in dB-Hz, één set per constellatie, NMEA { "4.10" }-signaal-ID), <b>VTG</b> (koers en snelheid over de grond), <b>ZDA</b> (tijd en datum), <b>HDT</b> (gyrokoers) en <b>VBW</b> (snelheid door het water en over de grond van het log). De talker is <c1/> bij meerdere constellaties, anders die van de constellatie zelf. Regels eindigen op CRLF en hebben een geldige checksum.

seg-942803ad8c49 = HDT en VBW vertegenwoordigen onafhankelijke sensoren (een gyrokompas en een Doppler-log). <b>Geen enkele gebeurtenis raakt ze</b>, wat opzettelijk is: het verschil tussen wat GNSS meldt en wat de gyro en het log zeggen is een aanwijzing voor de nabespreking.

seg-2d9a9ea38dde = Wanneer de positiebepaling verloren gaat, is de GGA-kwaliteit { "0" }, is de RMC-status <c1/>, zijn de positievelden leeg en lopen de tijdvelden door (de klok van de ontvanger blijft lopen), zoals bij echte ontvangers.

seg-c1c51ff381e7 = Het vaartuig

seg-ada150c912eb = <c1/> en <c2/> geven een startpositie, snelheid en de punten waar doorheen wordt gestuurd. Het vaartuig wordt gestuurd naar het volgende waypoint onder een <b>limiet op de draaisnelheid</b> (<c3/>, standaard { "30" }), een limiet op hoe snel de draaisnelheid zich opbouwt (<c4/>) en een <b>limiet op snelheidsverandering</b> (<c5/>). De snelheid van een etappe is de <c6/> van het waypoint. <c7/> voegt een stroming toe, zodat de snelheid over de grond verschilt van de snelheid door het water en de koers verschilt van de koers over de grond, en een magnetische variatie. <c8/> brengt het vaartuig tot stilstand bij het laatste waypoint.

seg-4fc2cb8a1388 = Satellietgeometrie

seg-b97bd86ed3a4 = Satellieten komen uit de eigen nominale constellaties van de engine (GPS-slottabel, Walker-patronen voor Galileo en BeiDou MEO, GLONASS ICD), gepropageerd door <c1/> (tweelichamenprobleem plus seculiere J2, aardrotatie) en gezien vanaf het vaartuig met de WGS-84-kijkhoeken van de engine. Het zichtbare aantal, de elevaties en de azimuts in GSV zijn aannemelijk voor de plaats en het tijdstip van de dag. <b>Dit is een nominale hemel, geen efemeride voor de datum van de stroom</b>: PRN's worden in slotvolgorde toegewezen en elke constellatie behoudt haar gepubliceerde slotindeling, continu gepropageerd vanaf de epoch van de GPS-slottabel (2016-12-31) onder J2, dus de indeling is intact maar haar oriëntatie is niet die van de echte hemel op de datum van de stroom. C/N0 volgt de elevatie (een nominaal zenitniveau, ingesteld in <c2/>), met een vaste offset per satelliet, langzame fading en ruis. Een satelliet onder <c3/> heeft een leeg SNR-veld; een satelliet onder <c4/> wordt gevolgd maar niet gebruikt. Tot <c5/> (standaard { "12" }, het NMEA GGA-maximum) bruikbare satellieten worden gebruikt, gekozen op geometrie (eerst de hoogste satelliet in elke azimutsector van { "30" } graden). Minder dan vier bruikbare satellieten verliest de positiebepaling, en die keert terug na <c6/> bruikbaar signaal.

seg-f2be7442bdf2 = Gebeurtenissen

seg-db86ed4b40a9 = Elke <c1/> heeft een <c2/>, een aanvang <c3/>, een <c4/> (aanvang tot het begin van het loslaten), een aanloophelling <c5/> en een loslaathelling <c6/>. De sterkte stijgt lineair over <c7/>, blijft constant en daalt dan over <c8/>; <c9/> is een stap. Alle effecten schalen met die sterkte. Parameters die niet bij de soort horen, worden geweigerd.

seg-3255e99c7265 = soort

seg-9285a9d699c0 = parameters

seg-e83c9db4f9c7 = effect

seg-e96ef358529d = <c1/>, <c2/> (standaard { "6" })

seg-cd6030834371 = de C/N0 van elke satelliet daalt met maximaal <c1/> (spreiding per satelliet), satellieten vallen weg beginnend bij de laagste, de positiebepaling gaat verloren wanneer minder dan vier bruikbaar zijn, en herstelt na het loslaten en <c2/>

seg-e5a66c9c3627 = <c1/>, één van <c2/> (waar) of <c3/> (ten opzichte van de koers <b>bij aanvang</b>, daarna vastgehouden), optioneel <c4/>, <c5/>

seg-d7d967a60275 = de ontvanger behoudt een <b>geldige positiebepaling</b> waarvan de positie van de werkelijkheid wegloopt; SOG en COG bevatten de drag. De drag volgt smoothstep op de hellingen, zodat het valse spoor zonder snelheidssprong begint en stopt; de pieken zijn <c1/> m/s en <c2/> m/s kwadraat voor een helling van <c3/> s over <c4/> m (beide gelogd), en een scenario dat <c5/> zou overschrijden wordt geweigerd. Een stap (<c6/>) verplaatst de positie zonder de snelheid aan te raken

seg-7da039c3262e = De tijd van RMC, GGA, GNS en ZDA wordt verschoven ten opzichte van de ware UTC; de positie blijft waar

seg-ead3ce0162fb = <c1/>, <c2/> (standaard true), <c3/>

seg-a1bdb89334df = positie, snelheid (en tijd) zijn die van het vaartuig <c1/> geleden, waarbij de vertraging smoothstep volgt op haar hellingen en de gemelde snelheid wordt geschaald met <c2/> terwijl ze verandert: een vereenvoudigde abstractie in de stijl van meaconing, geen propagatiemodel

seg-6f435224f7fb = <c1/>: zolang een drag-off, tijdspoof of replay-vertraging actief is, toont elke gevolgde satelliet dat ene verhoogde niveau, een klassiek teken. Laat het weg voor een subtiele gebeurtenis waarin het echte C/N0-patroon behouden blijft. Zolang een namaakgebeurtenis actief is, volgt de ontvanger het namaaksignaal, zodat jamming hem niet laat wegvallen; een door eerdere jamming verloren positiebepaling keert na <c2/> terug op het namaaksignaal (zie <c3/>). Een tijdwijziging waardoor de gemelde tijd zou stilstaan of terugloopt (een snelheid van { "1" } s per seconde of meer) wordt geweigerd tenzij het een stap is (<c4/>).

seg-894aceb32c5c = Gebeurtenissen kunnen overlappen; hun effecten tellen op (offsets, tijdwijzigingen, vertragingen) of nemen de sterkste (jamming). De <c1/> van de tijdlijn is de eerste epoch waarop de gebeurtenis effect heeft, één epoch na de gescripte <c2/> wanneer de gebeurtenis geleidelijk aanloopt.

seg-09e311ade9e6 = Het instructeurslogboek

seg-80933b9bdf0d = Naast de stroom geven <c1/> en <c2/>:

seg-51930977a6fe = de gebeurtenissen zoals geïnjecteerd, in gewone taal met elke parameter, en hun UTC-aanvang;

seg-4eab197c487b = een tijdlijn: aanvang, volledig effect, begin van herstel, hersteld, en de eigen <c1/> en <c2/> van de ontvanger;

seg-af2eb88f14d0 = het ware spoor tegenover het gemelde bij een interval van <c1/>: ware en gemelde positie, snelheid en koers, positiefout in meters, tijdoffset, gebruikte en gevolgde satellieten, gemiddelde C/N0, en welke gebeurtenissen actief waren;

seg-303f5fbe0351 = de piekversnelling en piekssnelheid van het ware en van het gemelde spoor;

seg-593a4a1ef296 = de <c1/> van het scenario.

seg-8c4aebcd0eff = Toon het logboek pas bij de nabespreking.

seg-dd1780910af7 = JSON-velden (schema <c1/>)

seg-60b5b11cdc0b = type, eenheid

seg-f4963d090155 = de verklaring dat het alleen voor training is

seg-7ad14e03d9e4 = uit het scenario

seg-fac0fb50b31b = gebruikte seed

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = begin van de run

seg-f0d8bb5aafef = duur van de run

seg-0989e14f1e51 = knopen

seg-b657b979a455 = hoogste ware en gemelde snelheid over de grond

seg-24e947df31ae = m/s kwadraat

seg-a1ca3847c8d8 = grootste snelheidsverandering per seconde, waar en tussen opeenvolgende gemelde positiebepalingen

seg-e1daadeb7d48 = één per gescripte gebeurtenis

seg-3aaa0108ac1e = telt vanaf 1; gebruikt door <c1/> en <c2/>

seg-6bbb9db14f7b = beschrijving in gewone taal met de parameters

seg-2f3eac27a997 = gescripte aanvang

seg-4255c67f3db5 = de gebeurtenis precies zoals geschreven (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, en de eigen parameters van de soort; ontbrekende worden weggelaten)

seg-88db26711d77 = graden waar of null

seg-2f30c3d8b17b = drag-off: de toegepaste richting (een relatieve peiling wordt bij aanvang omgezet)

seg-55d6dd667365 = m/s, m/s kwadraat of null

seg-021df000164f = drag-off: de pieken die de drag aan het valse spoor toevoegt

seg-d3a2c65ebcd4 = momenten voor de nabespreking, in tijdsvolgorde

seg-b2b72301c1c9 = s sinds de start, ISO { "8601" } UTC

seg-34e24e21ac7e = wanneer (ware tijd)

seg-cf29ba5ed968 = geheel getal of null

seg-8dbc5e7239be = het gebeurtenis-id; null bij wijzigingen van de ontvangertoestand

seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (gebeurtenissen); <c5/>, <c6/> (ontvanger)

seg-cd7c4057601b = uitleg

seg-90e65cbe1a59 = één rij per <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = ware positie

seg-f23b251a0e33 = knopen, graden waar

seg-242c1f2ccbd3 = ware snelheid en koers over de grond, en gyrokoers

seg-696dd61f8bbb = boolean

seg-ea264ef0395c = de ontvanger meldde een positiebepaling

seg-b073b87a813e = graden, knopen, graden waar, of null

seg-b56345697092 = wat de ontvanger meldde; null zolang de positiebepaling verloren is

seg-c4a33c03d9da = m of null

seg-463f6fc42ae5 = horizontale afstand van ware tot gemelde positie

seg-b68dfce8d81d = gemelde UTC min ware UTC

seg-ec28faa1efcc = gehele getallen

seg-2bf397f77392 = in de positiebepaling gebruikte satellieten, en gevolgde

seg-96b87348e90e = dB-Hz of null

seg-40f30b4a88cf = gemiddelde C/N0 van de gevolgde satellieten

seg-3671c8aa3c1a = id's van gebeurtenissen met een effect op dit moment

seg-8401fa92aae1 = Een veld toevoegen wijzigt de schematag niet. Een veld hernoemen of verwijderen, of de betekenis of eenheid van een veld wijzigen, verhoogt het nummer (<c1/>).

seg-656ee92a3130 = De scenariobibliotheek

seg-82a888587138 = <c1/>, elk enkele minuten van een vaart met een opmerking voor de trainer in zijn TOML:

seg-665b9b46b49b = bestand

seg-11ed1f85d4be = wat het toont

seg-50ffa85a1128 = C/N0 daalt gelijktijdig, satellieten vallen weg, de positiebepaling gaat verloren en keert terug

seg-10bc30b9c57b = een geldige, gezond ogende positiebepaling schuift { "1.4" } km in de richting van de kust; uniform verhoogde C/N0

seg-f141692988e4 = positie juist, UTC loopt { "45" } s voor tijdens een langzame havenaanloop

seg-ce06a5ebdd42 = jamming, dan overname door namaak met drag-off en tijdoffset, dan een replay-vertraging

seg-3fbcfd1dd26a = een geblokkeerde hemel, geen interferentie: de wanden van een fjord (de REPRESENTATIVE-skylinevoorinstelling <c1/>) verbergen de satellieten in het oosten en westen, waarna het kanaal weer opent (gebeurtenis <c2/>, met een <c3/>-tabel)

seg-5462f6b21fae = Posities, data en sporen zijn verzonnen; de bibliotheek bevat geen echt vaartuig, geen echte exploitant en geen echte opname. Ze doet geen uitspraak over hoe enige ontvanger of enig systeem zou presteren onder interferentie.

seg-9831ab537b36 = Modelleringskeuzes

seg-76a0e0eb57b3 = De generator is een trainingshulpmiddel zonder externe onafhankelijke referentie, en zijn getallen zijn modelleringskeuzes, geen metingen van enige ontvanger. Ze zijn gekozen om op een gewoon ontvangerlog te lijken: de C/N0-helling van { "14" } dB van zenit tot horizon onder het zenitniveau (standaard { "47" } dB-Hz) en de offset per satelliet van +/-1.5 dB, langzame fading van { "0.8" } dB over { "97" } s en { "0.5" } dB over { "31" } s, { "0.3" } dB jitter; de drempels voor volgen ({ "20" } dB-Hz) en gebruik ({ "28" } dB-Hz); de positieruis ({ "1.5" } m bij HDOP { "1" }, gecorreleerd over { "30" } s, verticaal tweemaal zoveel); { "0.05" } graad gyroruis en { "0.03" } kn leeway-ruis; de stuurtijdconstante van { "20" } s en de aankomststralen van waypoints van het vaartuigmodel; en de satellietkeuze per azimutsector. De standaardwaarden staan in <c1/> en <c2/> en kunnen allemaal in het scenario worden gewijzigd.

seg-84913be532a0 = Terugwaarts inlezen

seg-fbf4002d25cd = <c1/> kan deze bestanden inlezen (<c2/>). De tests controleren elke zin van elk bibliotheekscenario aan zijn eigen regels voor veldaantal en checksum, en laten de bestanden door die lezer lopen, die GGA, RMC en GSV interpreteert en de andere typen passeert zonder er een over te slaan. Tests leggen per scenario een gouden fragment vast (<c3/>); regenereer met <c4/> na een bedoelde wijziging.

seg-b94fbc3b1dd3 = <s1>Vorige</s1>Maritiem vertrouwen

seg-ecdf748cb63d = <s1>Volgende</s1>Interferentiekaart en routeblootstelling

seg-24ad8471ff2a = JSON-velden (schema kshana-nmea-training/1)
