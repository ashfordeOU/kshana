# docs--test-bench: translations (nl)

seg-245fe1f87b08 = Bestand

seg-e305279d5b11 = Inhoud

seg-292871e5747d = Bron: <c1/>

seg-d18a29239225 = Een ontvanger draaien tegen een geëxporteerd scenario

seg-aa3498c7cb16 = Een ontvangerfabrikant met een GNSS-simulator in het laboratorium kan de voertuigbeweging van een Kshana-scenario erdoorheen afspelen, vastleggen wat de te testen ontvanger doet, en die log met <c1/> scoren tegen gebeurtenissen die vóór de run zijn vastgelegd. Kshana levert de beweging, de gebeurtenistijden en de scoring. Het schrijft <b>geen signaal</b>: niets wat hier wordt geëxporteerd synthetiseert, modelleert of zendt een radiofrequente of basisbandgolfvorm uit, en een geëxporteerde gebeurtenis is een benoemd tijdsinterval, geen recept om interferentie te produceren. De simulator en zijn operator leveren de signalen, en de operator is ervoor verantwoordelijk ze alleen te draaien waar dat is toegestaan (geleid of afgeschermd, volgens de eigen veiligheidsinstructies van de simulator).

seg-414c7774d133 = Deze pagina is een methode. Ze publiceert geen resultaten.

seg-a0ad7b35922f = { "1" }. Exporteren

seg-798d75d3b65c = Geldt voor de soort <c1/> (een rijprofiel met oriëntatie; de uitval van de navigatietoestand zijn de gebeurtenissen), en voor <c2/> en <c3/> (een stilstaande ontvanger voor de duur van het scenario; de jammer van een scenario <c4/> is één gebeurtenis over de run). Andere soorten zeggen waarom ze geen voertuigtraject hebben. <c5/> is het UTC-tijdstip van bewegingstijd nul (standaard 2024-01-01T00:{ "00" }:00Z); de scenario's hebben geen eigen kalenderdatum voor voertuigbeweging. Het moet een echt UTC-tijdstip zijn, <c6/> (een afsluitende <c7/> wordt geaccepteerd) met het jaar in { "2000" } tot en met { "2099" } en elk veld binnen bereik; al het andere wordt geweigerd. De uitvoer is byte-identiek voor hetzelfde scenario en dezelfde epoche.

seg-c153d8ef8735 = één rij per sample: <c1/>, aardvaste <c2/>, <c3/>, geodetische <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = de epoche, stelsels, eenheden, kolommen en rondreistoleranties van die CSV

seg-8c74ca211e3a = NMEA { "0183" }-zinnen <c1/> en <c2/> per sample, met controlesommen

seg-2b0fd541f1dc = een regel <c1/> en dan rijen <c2/> (alleen geschreven wanneer elk sampleinterval hetzelfde gehele aantal milliseconden is; als het wordt weggelaten, zegt het commando waarom op de standaardfoutuitvoer)

seg-d09d2dab9a17 = dezelfde gebeurtenissen als blokken <c1/> voor een scenario <c2/>

seg-866a3c4870af = de run als een document <a1><c1/></a1> voor een opname <c2/>: de gebeurtenissen als vermelde referentie, met <c3/>, <c4/>, <c5/>, het <c6/> van elke gebeurtenis en het vermogen, die het laboratorium zelf moet invullen

seg-9ea6a94d4586 = Stelsels en conventies

seg-8d3b7d2ef815 = <b>Positie:</b> WGS { "84" }, aardvast (ECEF: <c1/> door de evenaar bij de nulmeridiaan, <c2/> door de pool); <c3/>, <c4/>, <c5/> geven dezelfde positie geodetisch, <c6/> boven de ellipsoïde.

seg-93a2975d2a19 = <b>Snelheid:</b> aardvaste assen, ten opzichte van de aarde.

seg-be05c2278e98 = <c1/> kloksgewijs vanaf ware noord in [{ "0" }, { "360" }), <c2/> neus omhoog positief, <c3/> rechtervleugel omlaag positief; yaw-pitch-roll (3-2-1) van het lokale noord-oost-omlaag-stelsel naar lichaamsassen x vooruit, y rechts, z omlaag. Een stilstaande bron schrijft nullen. NMEA en de waypointtekst bevatten geen oriëntatie.

seg-3c3ad1295628 = <b>De heading is de yaw van het lichaam, niet de rijrichting.</b> In het rijprofiel <c1/> maakt het lichaam yaw in blokgolven terwijl de snelheid volgt, dus heading en koers over de grond kunnen tientallen graden verschillen (tot ongeveer { "77" } graden in het meegeleverde scenario <c2/>). De NMEA-koers <c3/> is de koers over de grond, de richting van de snelheidsvector, dus een simulator die de heading uit het bewegingsbestand leest en een die de koers uit het NMEA-bestand leest, zien verschillende hoeken. De koers over de grond uit de CSV is <c4/> van zijn naar noord-oost-omlaag geroteerde snelheid.

seg-224b53995157 = <b>De hoogte volgt het scenario.</b> Voor <c1/> is <c2/> de eigen raakvlakstapping van de soort van zijn referentie en wordt niet constant gehouden (ongeveer { "7" } m over de { "180" } s van <c3/>); het is de beweging van het scenario, geschreven zoals ze is.

seg-f78a354f96ee = <b>Plaatshouders in NMEA <c1/>.</b> De fixkwaliteit ({ "1" }), het aantal gebruikte satellieten ({ "12" }) en HDOP ({ "1.0" }) worden alleen geschreven om de zin goedgevormd te maken. Ze zeggen niets over de geometrie van het scenario of enige toestand van de ontvanger.

seg-f5cd510aac0c = <c1/> na de epoche, UTC, schrikkelseconden niet gemodelleerd.

seg-d2a2f655760d = <b>NMEA-hoogten zijn ellipsoïdaal.</b> De hoogte in <c1/> bevat de ellipsoïdale hoogte en de geoïdescheiding wordt geschreven als { "0.0" }. Een simulator die de hoogte behandelt als hoogte boven gemiddeld zeeniveau, plaatst het voertuig ernaast met de lokale geoïdeondulatie.

seg-ee3a9a3ec84d = <b>Rondreistoleranties</b> (getest door elk bestand terug te lezen): CSV-positie { "0.1" } mm, breedte- en lengtegraad { "1e-9" } graad, snelheid { "0.1" } mm/s, hoeken { "1e-6" } graad; NMEA horizontale positie { "5" } mm, hoogte { "1" } mm, snelheid { "0.001" } knoop, koers { "0.001" } graad.

seg-a554992d2694 = De bestanden in een simulator laden

seg-757382614413 = Laboratoriumsimulators verschillen, en deze repository reproduceert de handleiding van geen enkele simulator. Controleer welke van de bovenstaande formaten de uwe leest, en zijn vermelde eisen:

seg-cc49ceccea20 = Veel beweging-importers verwachten een vaste verversingssnelheid, gewoonlijk { "10" } Hz. Het scenario <c1/> stapt met { "0.1" } s; stel voor een stilstaand scenario <c2/> in op de snelheid die uw simulator wil.

seg-e98bf4bf6c6e = Sommige importers slaan samples over die tussen hele seconden vallen, of negeren de tijdkolom en gebruiken de rijvolgorde. Begin de beweging op een hele seconde en houd het raster regelmatig.

seg-3c470262eb15 = Een CSV-importer waarmee u kolommen kunt toewijzen kan <c1/> rechtstreeks lezen: kies de aardvaste of geodetische kolommen en stel hun eenheden in op basis van <c2/>. Het afkappen van decimalen veroorzaakt valse versnelling, dus behoud de geschreven precisie.

seg-41a2bfe45b37 = Het bestand bevat alleen beweging. Configureer de constellatie, de interferentie en de front-end van de ontvanger in de simulator, en stem ze af op de gebeurtenissen in <c1/>.

seg-024ab011a2e3 = Kshana schrijft geen scriptinterface van een leverancier.

seg-6d67d4e2cdf0 = Gecontroleerd met de lezers van één opensourcesimulator

seg-e4ce0597a644 = De bewegingslezers van gps-sdr-sim (MIT, commit 28ca29a6) kregen de exports van acht meegeleverde scenario's. Elke lezer gaf het geëxporteerde traject terug (<c1/>, vooraf vastgelegd in <c2/>):

seg-3caed3fc2e47 = Optie van gps-sdr-sim

seg-ad9e78555851 = Geef het

seg-4f9be75880d3 = Grootste verschil met de CSV

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> zoals geschreven

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (tijd, breedtegraad, lengtegraad, hoogte)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (tijd, x, y, z)

seg-ff26559a85e8 = exact

seg-f4c13a327904 = Geef <c1/> niet de volledige beweging-CSV. Zijn lezer bevat { "100" } tekens per regel, en een CSV-rij is ongeveer { "160" } tekens, dus elke rij wordt als twee samples gelezen. De kopregel wordt gelezen als nog een sample zonder getallen erin.

seg-43cc6f9c50b2 = gps-sdr-sim bevat hoogstens { "3000" } samples, { "300" } s bij zijn vaste { "10" } Hz, en negeert de tijdkolom. De exports van <c1/> stappen met precies { "0.1" } s. Langere scenario's, zoals de <c2/> van 20 minuten, worden alleen tot hun eerste { "300" } s gelezen.

seg-500243b6e402 = Dit controleert dat de bestanden worden gelezen zoals geschreven. Het controleert niet de fysica van het scenario of iets wat de simulator uitzendt.

seg-a4c4514276e9 = { "2" }. Leg vast wat u gaat scoren vóór de run

seg-3a3e2be36c65 = Het gebeurtenissenbestand geeft de intervallen die het scenario definieert. Kopieer <c1/> naar een scenario <c2/>, voeg elke voorspelling toe die u gecontroleerd wilt hebben, en leg de drempels en toleranties van de monitors vast <b>voordat</b> de ontvanger draait. Pas ze niet aan na het zien van de log; het scenario, de drempels en de SHA-256 van de log zitten allemaal in de hash van het resultaat.

seg-d07b9ad8cfa9 = De geëxporteerde gebeurtenissen dragen de eigen soort van het scenario: de jammer van een scenario <c1/> is <c2/>; een uitval van de navigatietoestand is <c3/>, omdat het scenario stelt dat GNSS niet beschikbaar was, niet hoe. Wijzig het veld <c4/> zodat het overeenkomt met wat u de simulator laat doen.

seg-faa87b3ba315 = { "3" }. Draai de ontvanger

seg-0a3b63cf5615 = Start de ontvanger en zijn logger, start het simulatorscenario met het bewegingsbestand, en laat de run het kalibratie-interval, elke gebeurtenis en een marge na de laatste beslaan. Bewaar de eigen log van de ontvanger (UBX, RINEX { "3" }-waarnemingen, een CSV van een Android-logger, of NMEA met zinnen voor satellietstatus). Een log zonder signaalsterkte per satelliet kan nog wel op de eigen positie van de ontvanger worden gescoord, maar de carrier-to-noise-monitors hebben die nodig.

seg-fbbc12dfeb3f = { "4" }. Breng de klokken op één lijn

seg-5828311af3d4 = <c1/> telt gebeurtenistijden vanaf de eerste epoche van de log van de ontvanger; het bewegingsbestand telt vanaf zijn eerste sample. Als de log <c2/> seconden vóór het eerste sample van de beweging begint, tel dan <c3/> op bij elke <c4/> en <c5/>. Leg de offset vast en hoe u hem hebt gemeten, en vermeld hem in de <c6/> van het scenario of in een commentaar, want een verkeerde offset verschuift elke score. Gebeurtenistijden alleen kunnen u de offset niet vertellen; gebruik de startmarkering van het scenario van de simulator of de eigen tijdstempels van de ontvanger.

seg-22f7b68c445b = { "5" }. Scoren

seg-e024186a2874 = schrijft <c1/>, <c2/> en <c3/>. Voor elke gebeurtenis geeft het resultaat de valse alarmen vóór het begin, het eerste alarm en zijn monitors, de latentie en de uitkomst (<c4/>, <c5/>, <c6/>, <c7/>), plus een voorspelde en waargenomen daling van de carrier-to-noise waar u een voorspelling hebt vastgelegd. Een afwijking wordt gerapporteerd, nooit weggeregeld. Zie <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = Om te zien voor welke rijen van openbare kaders de sessie bewijs levert:

seg-abc6aaf44c95 = Zie <a1>compliance/README.md</a1>. Dat rapport beschrijft het bewijs in de runs die u het geeft; het doet geen vaststelling over de ontvanger of enig kader.

seg-69fa39640c2d = { "6" }. Koppel de rondreis in één ondertekend pakket

seg-f24e2dd64c47 = Na het scoren verbindt <c1/> de vier records: het scenario dat u hebt geëxporteerd, de <a1>testomstandigheden</a1> van het laboratorium, de ontvangerlog en de score. Vul <c2/> in (het pad en de SHA-256 van de log, de te testen ontvanger, het type en het vermelde vermogen van elke gebeurtenis), en dan:

seg-78bed55de550 = <c1/> bevat een blok <c2/> (<c3/>) met <c4/>, <c5/>, <c6/> en de score (gedetecteerde gebeurtenissen van de evalueerbare, eerste alarm), gedekt door de hashes van het manifest en de handtekening. Het commando weigert een pakket waarvan de omstandigheden en scoringsgebeurtenissen niet overeenkomen, of waarvan de vermelde loghash niet die van de log is. Zoals elk bewijspakket is het een technisch record, geen juridisch oordeel.

seg-5fe6548911da = Uitgewerkt voorbeeld: gps-sdr-sim schrijft een bestand

seg-eeccc823e109 = Dit voorbeeld gebruikt de opensourcesimulator gps-sdr-sim alleen om uit de geëxporteerde beweging <b>een basisbandbestand te schrijven</b>. Kshana zendt niet uit, en niets op deze pagina automatiseert het afspelen van dat bestand via een radio. Als uw laboratorium zo'n bestand in een ontvanger afspeelt, is dat de verantwoordelijkheid van uw operator, alleen uitgevoerd waar dat is toegestaan (via kabel of afgeschermd, volgens de eigen veiligheidsinstructies van de simulator en de radio), en Kshana documenteert of omwikkelt het niet.

seg-db81fdadfd19 = Wat het laboratorium daarna ook met <c1/> doet, gebeurt buiten Kshana. De eigen log van de ontvanger, hoe verkregen ook, is wat stap { "5" } scoort en stap { "6" } koppelt. De bestanden en de controles die Kshana op zijn eigen exports doet, zijn alleen op synthetische gegevens getest (<c2/>); hier wordt geen laboratoriumrun beweerd.

seg-dffcbdb8e6c3 = Wat deze methode niet doet

seg-d0b62c238953 = Ze produceert geen signaal, en ze zegt niet welke interferentie een simulator moet genereren. De gebeurtenissen zeggen wanneer, niet wat.

seg-3aa11bed60c8 = Eén sessie is één gegevenspunt. Het resultaat beschrijft die log onder die configuratie, en zegt niets over andere ontvangers, firmware, antennes of echte interferentie.

seg-b156403456e4 = Hoogten, snelheden en tijduitlijning moet de operator aan de simulator toetsen; de export vermeldt zijn eigen conventies en toleranties en niet meer.

seg-337ff53bc890 = <s1>Vorige</s1>kshana-bench

seg-87be81f5e600 = <s1>Volgende</s1>Compliance-koppeling
