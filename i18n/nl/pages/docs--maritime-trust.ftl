# docs--maritime-trust: translations (nl)

seg-2247a2344710 = Betekenis

seg-6940543aa3c0 = tekenreeks

seg-abec93a4a488 = tekenreeks of null

seg-f5e7215e6835 = object

seg-b993ef559bd0 = Vanuit code

seg-c353e7bec219 = Sleutel

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> of <c4/>

seg-2896f449bffb = Bron: <c1/>

seg-342f34403ac5 = Maritiem vertrouwen: kan de brug deze positiebepaling vertrouwen?

seg-49b609a9655c = <c1/> kan voor een <b>varend vaartuig</b> een live vertrouwenscijfer van 0 tot 100 geven voor elke positiebepaling, uit wat elke ontvanger al op de bus zet (eerst NMEA { "0183" }), en zeggen welke controles het hebben verlaagd. Het is een softwarelaag naast een ontvanger. Het is geen ontvanger, het vervangt er geen, en het maakt een positiebepaling niet nauwkeuriger.

seg-3c66739c9250 = <b>Adviserende software.</b> { -brand } is geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }) en is niet getoetst aan enige prestatienorm. De score en de gate zijn hulpmiddelen bij het oordeel van de navigator. De exploitant blijft verantwoordelijk voor de veilige navigatie van het vaartuig en voor elke beslissing om op een positiebepaling te vertrouwen of daarmee te stoppen.

seg-a9899ca66661 = Deze pagina zegt waar de controles naar kijken, wat elk ervan wel en niet kan vangen, hoe u het live uitvoert en wat de gate doet. De scoreafbeelding en elke standaardwaarde staan in <a1><c1/></a1>.

seg-05e79b6c5a58 = Wat het leest

seg-e784fdbe26e6 = Een vaartuig wordt in het sessiebestand opgegeven, met zijn grenzen vastgelegd vóór de run:

seg-e8e9ee2965cf = Zin

seg-e127f2f26824 = Gelezen

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = positie, kwaliteit van de positiebepaling ({ "0" } = geen positiebepaling), hoogte boven gemiddeld zeeniveau, geoïdescheiding, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> geldig, <c2/> niet), snelheid en koers over de grond, datum, modus

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = snelheid en koers over de grond, waar RMC er geen heeft

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = koers (THS alleen wanneer zijn modus niet <c1/> is)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = snelheid door het water (VBW alleen wanneer zijn status <c1/> is)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = tijd

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = signaalsterkte per satelliet (dB-Hz), elevatie en azimut (voor de geometrie)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = dilution of precision en gebruikte satellieten (voor de geometrie, waar GSV geen hemel geeft; en de opgegeven HDOP die de bewaking vergelijkt)

seg-305f423d3ead = een OSNMA-status die een ontvanger meldde, door de adapter die de ontvanger leest vertaald naar deze zin: <c1/> geauthenticeerd, <c2/> mislukt, <c3/> geen resultaat

seg-7ce1d69e710e = Epochs waarvan de ontvanger zelf zegt dat het geen satellietpositiebepaling is (GGA-kwaliteit { "0" }, of { "6" } tot { "8" }: geschat, handmatig, simulator; RMC-status <c1/>, of modus <c2/>, <c3/>, <c4/>, <c5/>) worden niet gebruikt voor de positiecontroles en dragen geen bewijs in welke richting dan ook: de ontvanger heeft het al gezegd.

seg-a0ae80781c6e = De eerste <c1/> seconden vormen de basislijn en worden nooit gescoord. Elke monitor kijkt alleen naar de huidige en eerdere epochs, zodat een beslissing op een epoch niet verandert wanneer later gegevens binnenkomen, en een live stream dezelfde score geeft als dezelfde tekst als bestand gelezen.

seg-068593ad0a52 = Wat elke controle vangt, en wat niet

seg-094b90f0c701 = Richtingen tussen positiebepalingen (de koerspeiling die de bochtsnelheidscontrole gebruikt, de koers die door twee posities wordt geïmpliceerd) zijn de richting van het koorde ertussen, wat het <b>gemiddelde azimut</b> van de geodeet tussen de positiebepalingen is, niet het voorwaartse azimut bij de eerste positiebepaling; de twee verschillen ongeveer de helft van de meridiaanconvergentie tussen de positiebepalingen ({ "0.001" } graad bij een basislijn van { "260" } m op { "59.5" } graden breedte).

seg-ed3cdfcfbff5 = Een vervalste positie moet overeenstemmen met de natuurkunde van een schip en met de andere sensoren van het schip. Elke controle vergelijkt de positiebepaling met een daarvan. Een controle is slechts zo onafhankelijk als haar andere bron: een koers van een GNSS-kompas, of een "snelheid door het water" die uit GNSS is afgeleid, is niet onafhankelijk van de ontvanger die wordt getest en voegt niets toe.

seg-9480aabf136e = Controle

seg-20e4f746c7e1 = Vangt

seg-e7b2ebe5eabc = Kan niet

seg-21ad9895f606 = een positiesprong; een track waarvan de beweging niet door de gemelde snelheid en koers wordt verklaard; een impliciete snelheid, versnelling of bochtsnelheid boven de opgegeven grenzen van het vaartuig

seg-dcbc6d4cd17f = een drag waarvan de gemelde snelheid en koers de vervalste track volgen en binnen de grenzen blijven (de ontvanger leidt ze af uit zijn eigen oplossing, dus ze komen met elkaar overeen); een te hoog opgegeven snelheidsgrens

seg-3542f83a7988 = een track die meer dan de opgegeven krabhoek afwijkt van waar het schip heen wijst

seg-75f4d659f716 = een drag langs de koers (de koers verandert niet); een koers van dezelfde ontvanger of een GNSS-kompas; een dwarsstroom boven de tolerantie (vals alarm); snelheden onder <c1/>

seg-09dde82be447 = een drag die de snelheid over de grond verandert ten opzichte van de snelheid door het water

seg-6ac740e5f51c = een log dat uit GNSS is afgeleid; een stroom boven de marge (vals alarm); een drag die langzamer is dan de marge

seg-e85d5f0933b7 = een hoogte die niet is waar het zeeoppervlak en de opgegeven antennehoogte haar zouden plaatsen

seg-3806e1d46332 = een spoofer die de hoogte aannemelijk houdt; de tolerantie is ruim omdat de verticale fout van een zelfstandige ontvanger groot is; de geoïdescheiding wordt vastgelegd maar niet gecontroleerd, omdat de engine geen geoïdemodel heeft

seg-5b70bd80640e = de signatuur van één zender: C/N0 over de satellieten die samen instort of samen stijgt, ten opzichte van de kalibratiebasislijn

seg-e6874a8047b1 = een spoofer die het vermogen per satelliet vormgeeft; alles zolang de basislijn zelf wordt gespooft; een GSV-cadans die te traag is om te volgen

seg-371b17ce936a = de tijd van de ontvanger die onregelmatig stapt of achteruit loopt; ten opzichte van de klok van deze computer, de tijd van de ontvanger die ervan wegdrijft (alleen realtimestreams)

seg-026479cb7966 = een vervalste tijd die consistent en gestaag is; een klok die vanaf het begin onjuist is

seg-906ab911b73d = een gemelde OSNMA-authenticatiefout

seg-a04757b7ae57 = de status wordt gelezen, niet geverifieerd; een spoofer die de melding onderdrukt wordt niet gezien

seg-c36c24a337b8 = vermogensontzegging en verlies van satellieten, zoals in het statische geval

seg-940b39a3988a = zij zeggen dat de omgeving vijandig is, niet dat de positiebepaling onjuist is

seg-9d751e1f5938 = <b>Wat monitors die alleen op NMEA werken niet kunnen.</b> Een spoofer die de hele constellatie nabootst met een zelfconsistente positie, snelheid, met de koers verenigbare koers, aannemelijk vermogen per satelliet en een overeenkomende klok is onzichtbaar voor elke controle hierboven: niets in de zinnen onderscheidt zijn positiebepaling van een echte. Een replay van opgenomen echte signalen evenmin. Authenticatie (OSNMA, of een ontvanger met eigen bescherming tegen spoofing) en onafhankelijke navigatiesensoren dichten die kloof; deze laag kan alleen hun gemelde status gebruiken. Een stream die al wordt gespooft terwijl de basislijn wordt gevormd, heeft geen schone basislijn. Het uitblijven van een alarm is geen bewijs van een goede positiebepaling.

seg-e3e09e2412fb = Vertrouwensscore

seg-a1c05079de2f = Elke epoch na de kalibratie krijgt een score van { "0" } tot { "100" } en de redenen waarom die niet { "100" } is: welke controles aftrokken, hun statistiek tegen de drempel en hun punten. Banden (randen vermeld in de sessie): <c1/> bij { "90" } of hoger, <c2/> bij { "55" } of hoger, <c3/> daaronder. De afbeelding, elk gewicht en zijn reden staan in <a1><c4/></a1>; zij is deterministisch en vastgelegd voordat een log wordt gescoord, zonder leren en zonder iets dat aan gebeurtenissen is gefit.

seg-d56822e82e3d = Elke uitvoer van een vaartuig draagt de adviesverklaring: de sleutel <c1/> van de resultaat-JSON en van elke live regel, een eerste commentaarregel <c2/> van de CSV (lezers slaan hem over met hun commentaaroptie), de <c3/> en een voettekst van de SVG. Uitvoer van een batchrun: <c4/> (met het scoremodel en de aftrekposten van elke epoch), <c5/> (met de kolommen <c6/> en <c7/>) en <c8/>, die voor een vaartuig de door de ontvanger gemelde track is, gekleurd naar vertrouwensband, boven de score over de tijd.

seg-918516588036 = Een synthetische demo

seg-e6717d346ca6 = <c1/> bevat een verzonnen NMEA-log van een veerboot op de route Tallinn-Helsinki (een uittreksel van 50 minuten, ongeveer { "17" } kn, { "1" } Hz: GGA, RMC, VTG, een gyrokoers, een snelheidslog, GSV met een aannemelijke hemel) waarin een positie-drag-off vanaf { "1500" } s de <em>gemelde</em> positie van de werkelijke positie van het vaartuig wegtrekt. De ontvanger blijft de hele tijd een <b>geldige</b> positiebepaling melden; de vertrouwensscore is wat daalt, door de band degraded naar de band untrusted. <c2/> legt elke drempel, de grenzen van het vaartuig en elk scoregewicht vast vóór de run.

seg-b2f24e5091d0 = Het log is <b>tekst die naar een bestand is geschreven</b> door <c1/>: het modelleert geen radiosignaal en zendt niets uit. Het is geen meting en de route is illustratief, geen zeekaart. <c2/> pint het log en de verwachte uitvoer vast als regressiebewaking op de synthetische gegevens; zij zeggen niets over hoe enige monitor het doet bij echte interferentie.

seg-26ab8544afba = Vertrouwensscore over één synthetische overtocht, uit een echte run van engine v{ $version } op examples/maritime-trust (een verzonnen NMEA-log van een veerboot op de route Tallinn-Helsinki, { "3001" } epochs bij { "1" } Hz). Drie banen delen één tijdas. Boven: de afstand tussen de positie die de ontvanger meldt en de werkelijke positie van het vaartuig, die tot ongeveer { "1576" } s binnen enkele meters blijft, wanneer de gescripte positie-drag-off van het log haar wegtrekt, terwijl de ontvanger een geldige positiebepaling blijft melden. Midden: de vertrouwensscore van { "0" } tot { "100" }, niet berekend tijdens de eerste { "300" } s kalibratie, in de band nominal (ten minste { "90" }) tot aan de drag-off, daarna dalend door de band degraded (ten minste { "55" }) naar de band untrusted. Onder: de band van elke epoch als een gekleurd lint met zijn naam. De score is adviserend. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. Het log is verzonnen om het formaat en de monitors te tonen; het is geen meting en zegt niets over hoe enige ontvanger zou presteren.

seg-ed183c325c7e = De figuur is getekend door <c1/> uit een echte run van deze demo (<c2/>); de score is adviserend, en het log is verzonnen.

seg-8badaf0d8586 = Specificatie van de Studio-weergave

seg-588092535a89 = Voor wie de Studio-weergave van een vaartuigrun bouwt. Niets in dit gedeelte is al in de Studio geïmplementeerd; de kant van de engine (de gegevens hieronder) wel.

seg-5c34f31acf1d = <b>Invoer.</b> Een van beide:

seg-57ca6d9000b1 = de resultaat-JSON van een batchrun (<c1/>, of hetzelfde via <c2/> in het WebAssembly-pakket met het log inline): <c3/> (bandranden, ramp, bewijsvasthouding, elk gewicht), <c4/>, <c5/> en <c6/>, elk met <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, en vanaf { "0.36" } <c12/> en de <c13/> van elke aftrekpost, met <c14/> en <c15/> op het hoogste niveau; of

seg-bfab64386b6c = de live JSON-regels (schema hierboven), één object per epoch, toegevoegd terwijl de stream loopt. Elke regel draagt de door de ontvanger gemelde <c1/> (schema { "1.1" }).

seg-f7c7462d315e = De demoset is <c1/>: <c2/>, <c3/> (het log) en <c4/> (<c5/>: waar het vaartuig werkelijk was, wat geen echt log heeft). Een weergave moet de sessie uitvoeren en het waarheidsbestand ernaast lezen.

seg-c015c26cf30a = Wat te tekenen.

seg-92f452bdbed6 = <em>Track</em>, noord boven, één schaal op beide assen: de door de ontvanger gemelde posities als een lijn gekleurd naar de band van de epoch (grijs calibrating, groen nominal, oranje degraded, rood untrusted), begin en einde gemarkeerd, een schaalbalk. Voor de demo de ware track als dunne neutrale lijn eronder, zodat de drag-off zichtbaar wordt als het uiteengaan van de twee; een schakelaar voor de ware track en een uitlezing van de afwijking in meters op het tijdstip van de cursor.

seg-3ba328e2188c = <em>Scoretijdlijn</em>: de score van { "0" } tot { "100" } tegen de tijd, de bandranden (<c1/>, <c2/> uit <c3/>) als streeplijnen, de band als strook eronder, en het begin van elke vermelde gebeurtenis als markering. De tijdas wordt gedeeld met de track.

seg-33447da1d56d = <em>Redenen</em>: voor de epoch onder de cursor de aftrekposten (monitor, verhouding tegen drempel, punten) als horizontale balken, grootste eerst, met het gewicht dat elke monitor uit <c1/> draagt; monitors die liepen en niets kostten vaag weergegeven, monitors die niet liepen (niet in <c2/>) vermeld als "not run", nooit als geslaagd. De monitor <c3/> heeft geen item in <c4/>: haar plafond is <c5/>.

seg-d0379b68ea67 = <em>Monitorstroken</em>: één dunne strook per monitor in <c1/> die zijn verhouding over de tijd toont (alarm bij { "1" }), zodat een lezer ziet welke controle het eerst bewoog.

seg-83d881ce6ab0 = <em>Gatestatus</em>: in een liveweergave de <c1/> van elke epoch (<c2/>, <c3/>, <c4/>) als strook onder de bandstrook, en de laatste <c5/>. In een batchweergave zijn de epochs die een gate zou hebben tegengehouden degene waarvan de band untrusted is, met de vrijgavevasthouding toegepast.

seg-b96652af3a03 = <em>Geometriebaan</em> ({ "0.36" }): een strook onder de bandstrook gekleurd naar <c1/> (groen good, oranje degraded, grijs gearceerd unknown), in een kleurfamilie die verschilt van die van de inconsistentie- en omgevingsbanen, met de legenda "geometry: the sky, not the signal". Aftrekposten gekleurd naar <c2/> (geometry, environment, inconsistency) in het redenenpaneel en de monitorstroken, en de tellingen van epochs per klasse uit <c3/> naast de bandtellingen. Voor de epoch onder de cursor: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/>, en een vlag wanneer <c8/> is gezet (de geometrie-aftrekpost is dan een inconsistentie). <c9/> wordt getoond als "geometry unknown: no GSV or GSA in the log", nooit als goed. De drempels van <c10/> en hun herkomst uit <c11/> staan naast de scoreinstellingen. De adviesopmerking blijft.

seg-c48906d03f90 = <em>Door de ontvanger gemelde positiebepaling</em>: de ontvanger van de demo meldt de hele tijd een geldige positiebepaling (GGA-kwaliteit { "1" }, RMC-status A); zeg dat in de legenda, want dat is het punt van de weergave.

seg-869c8a92e2cf = <b>Interacties.</b> Eén tijdcursor gedeeld door elk paneel (slepen, pijltjestoetsen en een afspeelknop die op 1x tot 60x afspeelt); boven de track of een strook zweven verplaatst hem. Klikken op een aftrekpost markeert de epochs waarin die monitor boven zijn begindrempel lag. Een bandfilter (toon alleen degraded en untrusted epochs) en een sprong naar de eerste aftrekpost en naar de eerste untrusted epoch. Hovertekst bij elke monitornaam met de omschrijving van één regel van deze pagina. De drempels en gewichten van de sessie worden alleen-lezen naast de grafiek getoond, zodat op het scherm staat wat de score heeft gebruikt.

seg-1f97fe8ea2f1 = <b>Te behouden formulering.</b> De pagina moet zeggen dat het adviserende software is en geen typegoedgekeurde navigatieapparatuur, dat de demo synthetische tekst is met een verzonnen drag-off, en dat een positiebepaling zonder alarm daarmee nog geen goede positiebepaling is (zie de beperkingen hierboven). Geen cijfer op de pagina mag lezen als een maat voor hoe de controles het doen bij echte interferentie.

seg-079ce44fd53e = Voor aanroepers die de sessie en de bytes in het geheugen houden (geen bestanden, geen klok, geen sockets; veilig voor WebAssembly) heeft <c1/>:

seg-e8c3172d72b8 = <c1/>: een heel log, gescoord als een batchrun; hetzelfde resultaat als <c2/>, dat serialiseert naar de resultaat-JSON (<c3/>, <c4/>, <c5/> met scores en aftrekposten).

seg-0302b7c35fd3 = <c1/>: een begrensd stuk van een stream (ten hoogste { "2" } MiB en { "20,000" } epochs, en lang genoeg om het kalibratievenster te bevatten), gescoord zoals de livemodus scoort en teruggegeven in het live JSON-regelschema (<c2/>, de laatste <c3/>, een samenvatting van bandtellingen, laagste en laatste score, eerste untrusted tijd). De tijd van de ontvanger wordt niet met een hostklok vergeleken. De langlopende livemodus (sockets, een bestand dat wordt aangevuld, de gate) is van de binary.

seg-d971dae93784 = Beide hebben een sessie nodig met <c1/>; de tabel <c2/> ervan is optioneel.

seg-870fece8026e = Live uitvoeren

seg-c132d449414f = De sessie is dezelfde <c1/> als bij een batchrun, met een tabel <c2/> die <c3/> declareert; de tabel <c4/> is niet nodig. Seriële poorten worden nog niet rechtstreeks geopend: lees de poort met het hulpmiddel dat u al gebruikt (<c5/> en <c6/>, een terminalserver, een multiplexer) en geef haar door via een pipe of door te sturen. Directe seriële invoer kan later komen.

seg-13a043c1ce60 = Elke voltooide epoch schrijft één JSON-regel naar stdout:

seg-b1f0c563c94d = <c1/> is <c2/>, <c3/>, <c4/> of <c5/> (de band van de score, met de randen in de tabel <c6/> van de sessie); <c7/> ontbreekt tijdens de kalibratie; <c8/> geven aan welke controles punten hebben afgetrokken en hoeveel, grootste eerst.

seg-9b21238a7dc1 = JSON-regelschema (versie { "1.1" })

seg-79306ff2d878 = Eén JSON-object per voltooide epoch, sleutels in deze volgorde:

seg-a129b9e613d0 = Type

seg-bbcdd898d24d = geheel getal

seg-96958263575f = aantal gemelde epochs, vanaf { "1" }

seg-16022703e1c0 = getal

seg-95dde7698840 = seconden sinds de eerste epoch van de stream

seg-dee4f7b91079 = de tijd van de epoch zoals de stream hem vermeldt (ISO-8601 UTC met een datum zodra een RMC is gezien, anders <c1/>)

seg-0361f40a8e59 = getal of null

seg-c2418289d966 = { "0" } tot { "100" }, één decimaal; null tijdens de kalibratie of wanneer <c1/> zegt waarom er geen kon worden geproduceerd

seg-00575e5df2e1 = array

seg-54c1f879643b = <c1/>, grootste punten eerst; <c2/> is statistiek over drempel (alarm bij { "1" } of meer); alleen monitors die punten kosten worden vermeld; <c3/> <em>(toegevoegd in { "1.3" })</em> is <c4/>, <c5/> of <c6/>

seg-24d178dfb34f = array van string

seg-30948e769405 = monitors op of boven hun drempel

seg-fb08af60656f = <c1/>, <c2/> of <c3/>

seg-495aa49df7e2 = waarom er geen score is geproduceerd (bijvoorbeeld een gedeclareerde koerssensor die ontbreekt)

seg-3dabfd59cf4b = object of null

seg-9395d2543ac0 = <em>(toegevoegd in { "1.1" })</em> de positie die de ontvanger op deze epoch meldde, <c1/> (hoogte ellipsoïdaal waar de zin de geoïdescheiding geeft, anders boven gemiddeld zeeniveau); null wanneer de ontvanger er geen gaf, ook bij kalibratie-epochs zonder positiebepaling

seg-3af4806d7d74 = <em>(toegevoegd in { "1.2" })</em> wat deze software is en niet is: adviserend, geen typegoedgekeurde navigatieapparatuur, de exploitant blijft verantwoordelijk

seg-79adcc5ee873 = <em>(toegevoegd in { "1.3" })</em> de satellietgeometrie: <c1/> (<c2/>, <c3/>, <c4/> wanneer de stream geen GSV-elevaties en -azimuts en geen GSA heeft), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satellieten in zicht maar niet getrackt terwijl de DOP in zicht goed is: de geometrie-aftrekpost is dan <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: altijd gemeld, nooit gescoord; de score trekt alleen af voor <c32/>) (zie <a1><c33/></a1>)

seg-fc212411bf3c = Monitornamen (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, en vanaf { "1.3" } <c17/>. In latere versies kunnen nieuwe namen worden toegevoegd; consumenten moeten een onbekende monitornaam als een monitor behandelen. De indeling van <c18/> hieronder draagt een formaatversie in zijn eerste veld; dit JSON-schema is versie { "1.3" }: { "1.1" } voegde <c19/> toe, { "1.2" } <c20/>, { "1.3" } <c21/> aan het eind en <c22/> in elke aftrekpost, en het verandert alleen door sleutels aan het eind toe te voegen.

seg-0019bf7fbfcd = Authenticatie-invoer

seg-39b3dfbd97cc = De monitor <c1/> neemt de authenticatiestatus per satelliet van een authenticatiebron via <c2/> (een lijst van <c3/>, status <c4/>, <c5/> of <c6/>), naast de algemene <c7/>. Aan de NMEA-kant wordt hetzelfde gedragen door <c8/>, bijvoorbeeld <c9/>. Elke fout, algemeen of op één satelliet, laat de monitor alarm slaan en kost zijn volledige gewicht (hij krijgt de verhouding { "1.5" }); succes is geen bewijs. { -brand } verifieert hier niets: de bron die dat wel doet, is verantwoordelijk voor de status die zij meldt.

seg-8ffc94901796 = Een epoch is voltooid wanneer de volgende getimede zin binnenkomt; zinnen van tragere of niet-gesynchroniseerde instrumenten (een gyro enkele tienden van een seconde achter de ontvanger) die daarvoor binnenkomen, horen erbij. Als de stream stilvalt gedurende <c1/> (standaard { "1.5" } s, stel het hoger in dan de langste pauze tussen de getimede zinnen van uw ontvanger) wordt de epoch voltooid zoals hij is. De eerste <c2/> seconden van de stream vormen de basislijn en worden nooit gescoord, dus <b>een stream die al wordt gespooft wanneer hij voor het eerst wordt aangesloten, heeft geen schone basislijn</b>: start de laag vóór de reis, of terwijl bekend is dat de positiebepaling goed is. Het kalibratievenster sluit één keer, op volgorde van binnenkomst: een epoch waarvan de tijd eerder is dan een reeds geziene tijd (een terugspoeling, een replay van het begin van de stream) is nooit kalibratie, wat zijn tijd ook zegt; hij wordt gescoord met een volledige aftrekpost van <c3/>, die untrusted is. De live engine scoort elke epoch over de kalibratie-epochs en de laatste minuut of zo van de stream, dus zijn kosten per epoch groeien met <c4/> maal de epochfrequentie; houd het venster kort bij een snelle ontvanger. Zijn buffers zijn begrensd (een stortvloed aan regels zonder getimede zin wordt om de { "5,000" } regels voltooid, kalibratie en historie zijn begrensd op { "20,000" } epochs).

seg-2ef5aad7c750 = De tijd van de ontvanger wordt ook vergeleken met de monotone klok van deze computer, wat alleen iets betekent voor een stream die in realtime binnenkomt. Een opgeslagen log dat op volle snelheid via stdin, TCP of UDP wordt ingevoerd, activeert die controle per constructie: geef <c1/> mee. (<c2/> zonder <c3/> impliceert het al.) Een <c4/> wordt als replay gelezen totdat hij tot het einde is gelezen en de hostklok wordt vanaf dan ingeschakeld, zodat een achterstand niet als klokfout wordt gelezen; de controle vereist dan dat het kalibratievenster nog open is (anders heeft zij geen basislijn en draait zij niet).

seg-a06e58b2cfc8 = Einde van streams en fouten: stdin en een bestand dat tot het einde is gelezen, eindigen normaal (exit { "0" }). Een TCP-verbinding die door de peer wordt gesloten, is geen normaal einde voor een stream die door zou moeten gaan: de laag eindigt met een niet-nulcode nadat zij alles heeft gescoord en geschreven wat zij had ontvangen en maakt niet opnieuw verbinding, dus voer haar uit onder een supervisor die haar herstart. UDP-datagrammen die een zin splitsen, worden samengevoegd; de lezers van stdin, een bestand en TCP worden gedragen door een begrensde wachtrij die de zender terugduwt (er gaat niets verloren), terwijl UDP, dat niet kan terugduwen, datagrammen laat vallen die de engine niet kan aannemen en dat op stderr meldt. <c1/> bindt het loopback-adres; geef <c2/> om elders te luisteren (er wordt een waarschuwing afgedrukt).

seg-0a0ed5e74ea4 = <c1/>: de eigen zin

seg-71ccf4a80c99 = Elke epoch produceert ook één NMEA { "0183" }-zin, met een geldige controlesom, die <c1/> naar een bestand of stdout schrijft en die de gate in de doorgestuurde stream invoegt:

seg-df9382f4b055 = <c1/>: de formaatversie

seg-6986879f86fb = UTC-tijd van de epoch, <c1/>; leeg als de stream er geen gaf

seg-34418696f9d2 = vertrouwensscore { "0" } tot { "100" }, één decimaal; leeg tijdens de kalibratie of wanneer er geen kon worden geproduceerd

seg-0b249ba73868 = band: <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

seg-281aba68405a = gate: <c1/> off, <c2/> passed, <c3/> withheld (de positiebepaling is in de doorgestuurde cyclus ongeldig gemarkeerd)

seg-f306c3f54a48 = maximaal twee redenen, <c1/> verbonden door <c2/>; leeg wanneer er niets is afgetrokken

seg-4bee29dfe578 = Het adres is <c1/> + het fabrikantmnemoniek <c2/> + <c3/>. Apparatuur die een eigen zin niet kent, negeert haar. { -brand } negeert zijn eigen <c4/> bij invoer.

seg-d75c9da94f37 = Gate-modus

seg-30c1f4a5706c = <c1/> plaatst { -brand } tussen de ontvanger en de apparatuur die zijn positiebepaling gebruikt (een kaartsysteem, een trackbesturingssysteem). De NMEA-stream gaat erin, komt op stdout eruit, en wordt:

seg-aa0692146620 = <b>ongewijzigd doorgegeven</b> zolang de epoch niet untrusted is (en tijdens de kalibratie), met een <c1/> na elke cyclus van zinnen; en

seg-bbdd68edbb17 = <b>ongeldig gemarkeerd</b> zolang hij untrusted is: GGA-kwaliteit <c1/>; RMC-status <c2/> (en zijn modusindicator <c3/> en navigatiestatus <c4/> waar aanwezig); GNS-modus <c5/> in elke positie; GLL-status <c6/> en modus <c7/>; VTG-modus <c8/> waar zij er een heeft. De positievelden blijven zoals ze waren: het punt is dat de apparatuur de ontvanger zelf de positiebepaling ongeldig ziet verklaren en haar eigen alarm geeft. Van elke herschreven zin wordt de controlesom opnieuw berekend.

seg-23ee46747297 = Eenmaal tegengehouden wordt de positiebepaling pas vrijgegeven nadat de epochs gedurende <c1/> (standaard { "30" } s) buiten de band untrusted zijn geweest, zodat een score op de bandrand de positiebepaling niet kan laten flikkeren. De JSON-regels gaan alleen waar <c2/> het zegt (standaard nergens, omdat de stream stdout heeft).

seg-6b7b557a4909 = Om een kaartplotter rechtstreeks te laten verbinden, biedt u de gegate stream aan via TCP in plaats van stdout:

seg-96ff51df9abe = <c1/> luistert op het loopback-adres; <c2/> luistert elders (er wordt een waarschuwing afgedrukt, omdat iedereen die het adres kan bereiken de stream kan lezen). Een willekeurig aantal clients mag verbinden; elk krijgt dezelfde stream vanaf het moment dat het verbindt, en clients lezen alleen. Elke client heeft zijn eigen begrensde wachtrij en schrijver, dus een client die het niet bijhoudt wordt verwijderd (zijn verbinding gesloten, een regel op stderr) en vertraagt nooit de andere of de invoer. <c3/> vereist <c4/>; stdout bevat dan niets van de stream, dus <c5/> is vrij.

seg-960e0abb0466 = Wat de gate niet doet, en wat u moet weten voordat u haar gebruikt:

seg-ee3f18efa84c = Zij is <b>opt-in</b>. Niets markeert een positiebepaling ongeldig tenzij <c1/> is opgegeven.

seg-9cd8243cb437 = Zij <b>voegt latentie toe</b>: een cyclus wordt vastgehouden totdat zijn epoch is gescoord, wat de tijd tot de volgende getimede zin is (ongeveer één cyclus: een seconde voor een ontvanger van { "1" } Hz), of <c1/> na de laatste wanneer de stream stilvalt. Apparatuur die binnen enkele tientallen milliseconden na de uitvoer van de ontvanger een zin nodig heeft, mag er niet achter zitten.

seg-ec63f8f3230b = Zij is <b>één enkel punt in de keten</b>: als zij stopt, stopt de stream. Voer haar onder supervisie uit en bepaal vooraf wat de apparatuur stroomafwaarts zonder stream doet.

seg-536e41a6a5e7 = Zij <b>faalt veilig bij haar eigen fouten</b>: als de monitors na de kalibratie geen score kunnen produceren (een gedeclareerde koerssensor die niets verstuurt, te weinig kalibratie-epochs), is de epoch untrusted, draagt een <c1/> en wordt tegengehouden; de vrijgavevasthouding wordt getimed op de klok van deze computer, niet op de tijd van de ontvanger, die een spoofer beheerst (bij een replay is er alleen de tijd van de ontvanger).
