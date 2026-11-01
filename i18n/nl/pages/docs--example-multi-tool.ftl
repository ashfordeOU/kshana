# docs--example-multi-tool: translations (nl)

seg-077d900655af = Bron: <c1/>

seg-42e93cd44e94 = Uitgewerkt voorbeeld — { -brand } als verbindende laag voor missieanalyse met meerdere tools

seg-286cf0e7bb71 = Dit loopt één traject van begin tot eind door de op standaarden gebaseerde scenariosoorten voor interoperabiliteit en missieanalyse, en laat zien hoe { -brand } <em>tussen</em> de hoogwaardige tools zit die een programma al gebruikt in plaats van ermee te concurreren: GMAT (de General Mission Analysis Tool), Orekit en STK (Systems Tool Kit) voor trajectontwerp, en Basilisk of { "42" } voor de simulatie van het attitude and orbit control system (AOCS). Elke stap is een uitvoerbare scenariosoort, en elk resultaat bevat een <c1/> met zijn reikwijdte en bewijsniveau.

seg-7198d05bece6 = Eerlijkheidsnotitie: dit is een <em>geometrische/analytische</em> pijplijn op het niveau van pre-Phase-A en afwegingsstudies (vóór de eerste formele ontwerpfase van een missie). Het is geen certificering van vluchtdynamica; zie het veld <c1/> van elke soort.

seg-70c18138497b = Andere afkortingen die hieronder worden gebruikt: FDS (vluchtdynamicasysteem), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, de propagator voor two-line elements), TOML (het bestandsformaat van scenario's) en CLI (opdrachtregelinterface).

seg-7cc0d4d15c4a = De pijplijn

seg-09a321d36a10 = De stappen zijn aparte runs: elke stap haalt zijn invoer uit zijn eigen scenariobestand, dus u neemt een getal van de ene naar de volgende over (bijvoorbeeld een schuine afstand van <c1/> naar <c2/>) door het volgende bestand te bewerken. De soort <c3/> kan meerdere soorten in één run onder gedeelde omstandigheden bevatten; zie <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Elke onderstaande opdracht wordt vanuit de hoofdmap van de repository gedraaid, en de samenvatting eronder is de eerste regel die kshana { $version } afdrukt voor het meegeleverde scenario.

seg-7939b15235c8 = { "1" }. Het door een ontwerper geproduceerde traject inlezen (<c1/>)

seg-4b732dd54291 = GMAT, Orekit en STK <em>exporteren</em> allemaal CCSDS Orbit Ephemeris Messages. { -brand } importeert ze (de andere richting van de brug), zodat een { -brand }-analyse kan beginnen bij precies de baan die de trajectontwerper heeft vrijgegeven, niet bij een opnieuw afgeleide benadering:

seg-3136cfd5a40e = Het meldt de segmenten, objecten, referentiestelsels en epochspan en een snelheidsconsistentiecontrole, waarmee blijkt dat de efemeride getrouw is ingelezen (round-trip-fout onder { "1" }×{ "10" }⁻⁶ km). Bij een extern bestand in <c1/> meldt het in plaats daarvan wat het heeft geparseerd: gevoed met de OEM die <c2/> schrijft, drukt het <c3/> af. Het <c4/> is er expliciet over dat dit een structurele en fysische controle van het inlezen is, geen toetsing van de baannauwkeurigheid van de bron.

seg-e2c563fcb8cb = { "2" }. Wanneer is het zichtbaar vanaf een grondstation? (<c1/>)

seg-d66361888ede = Voorspelt de op- en ondergangspassages boven een station boven een elevatiemasker: acquisition of signal (AOS), tijdstip van dichtste nadering (TCA), loss of signal (LOS), maximale elevatie en duur, plus de totale toegangstijd. Dat is de planningsvraag voor het grondsegment. De baan is een SGP4-elementenset die op de IAU 2006/2000A-keten naar het aardvaste stelsel is gebracht, en de elevaties zijn schijnbaar: refractie volgens ITU-R P.834-9 en de lichttijd van de downlink, elk schakelbaar (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Komt het contact tot stand? (<c1/>)

seg-47bdb9d4700c = Zet voor een passage de schuine afstand en de terminalcijfers in de CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network) linkvergelijking:

seg-db12a99edcd2 = Meldt de verzwakking in vrije ruimte (FSPL), draaggolf-ruisdichtheid (C/N₀), energie per bit ten opzichte van de ruisdichtheid (Eb/N₀), marge en of de verbinding <b>sluit</b> ten opzichte van een vereiste Eb/N₀: de haalbaarheidscontrole van de communicatie die “het is zichtbaar” omzet in “we kunnen de gegevens echt downlinken.” De getallen volgen rechtstreeks uit de invoer in het bestand (hier een EIRP van { "55" } dBW, effective isotropic radiated power, in een ontvangst-G/T van { "53" } dB/K, de verhouding tussen versterking en ruistemperatuur); vul de cijfers van uw eigen terminal in voordat u de marge leest. Het is een deterministische berekening, geen gekalibreerd gegevensblad van een terminal.

seg-85ad46986461 = { "4" }. Hoe snel laat de omgeving het vervallen? (<c1/>)

seg-8977b12fd934 = Stuurt de neutrale dichtheid van de thermosfeer aan vanuit de zonne-activiteit (F10.7, de radioflux van { "10.7" } cm, en het gemiddelde over 81 dagen F10.7a) en de geomagnetische activiteit (Kp- en ap-indices) via de exosferische temperatuur van Jacchia-71. Daarmee wordt de ~{ "5" }–{ "10" }× dichtheidsschommeling over de zonnecyclus vastgelegd die een statische atmosfeer weglaat, zodat een schatting van de baanlevensduur of weerstand het ruimteweerregime weerspiegelt in plaats van een vaste atmosfeer. Sinds { "0.30" } is de dichtheid de thermosferische dichtheid van Jacchia { "1971" }, gekarakteriseerd ten opzichte van NRLMSISE-00 (Naval Research Laboratory massaspectrometer en incoherente verstrooiing) maar geen op gegevens getoetste NRLMSISE-00-atmosfeer.

seg-4b5bdadf3e7e = { "5" }. Het resultaat teruggeven (exports)

seg-f4a438636ea8 = Dezelfde CLI schrijft standaardbestanden voor de volgende tool. Op een scenario <c1/> schrijft <c2/> een CCSDS OEM { "2.0" }-efemeride met snelheid (het bestand dat GMAT, Orekit en STK lezen), <c3/> een precieze SP3-efemeride (Standard Product { "3" }) en <c4/> een catalogus met CCSDS Orbit Mean-Elements Messages. <c5/> dekt de viewers: CZML (Cesium Language), KML (Keyhole Markup Language, voor Google Earth), GeoJSON, STK-efemeridebestanden (<c6/>, één per satelliet plus de gebruiker) en SigMF-opnames (Signal Metadata Format) van de soort <c7/>. <c8/> zegt welke voor een scenario gelden. Voor de maan geeft de soort <c9/> het maanreferentiestelsel, de tijdschaal en de efemeride uit als CCSDS OEM met een formaatcontrole. Zie <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Waarom dit de verbindende laag is, geen concurrent

seg-cd78b0435abb = Elke stap is een klein, controleerbaar, reproduceerbaar scenario met een expliciet reikwijdtelabel. De hoogwaardige tools beheren trajectoptimalisatie, AOCS met zes vrijheidsgraden (6-DoF) en aerothermische entry, descent and landing (EDL); { -brand } beheert het <b>open, citeerbare, uitvoerbare bindweefsel</b>: de standaardformaten inlezen, de overkoepelende vragen over geometrie en haalbaarheid beantwoorden en het resultaat doorgeven, op een niveau dat elke partner zonder licentie kan draaien. Zie ook de aanvullende missieanalysesoorten <c1/>, <c2/>, <c3/>, <c4/> en <c5/>.

seg-af1ab3c55fe6 = <s1>Vorige</s1>{ "3" } · Kwantum tegenover klassiek

seg-b0765a28b4ce = <s1>Volgende</s1>Scenariosoorten

seg-dc88ec5ccc43 = { "1" }. Het door een ontwerper geproduceerde traject inlezen (oem-interop)

seg-cdff21ef6984 = { "2" }. Wanneer is het zichtbaar vanaf een grondstation? (passes)

seg-afa47b4283a3 = { "3" }. Komt het contact tot stand? (link-budget)

seg-e508e844bf2d = { "4" }. Hoe snel laat de omgeving het vervallen? (space-weather)
