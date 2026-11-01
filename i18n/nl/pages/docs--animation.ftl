# docs--animation: translations (nl)

seg-8428c41646b0 = Bron: <c1/>

seg-a61d094894fd = <c1/> zet de tijdreeks van een run om in iets dat beweegt: een geanimeerd SVG-bestand (Scalable Vector Graphics), één op zichzelf staande HTML-speler (HyperText Markup Language) of een genummerde reeks SVG-frames voor een video-encoder. Een campagne wordt afgespeeld als zijn fasen (jamming, spoofing, holdover, integriteitsalarm) met de alarmen gemarkeerd; een spectrumrun speelt zijn waterfall rij voor rij af; een overpassing in een lage baan om de aarde (LEO) speelt zijn verbinding per band af en, met een spoofer, de monitorstatistieken epoch voor epoch.

seg-39d69331035d = Code: <c1/>. Tests: <c2/>.

seg-0b708f65d8d3 = Wat het is, en wat het niet is

seg-ad8c12a3b510 = De exporter leest het resultaatdocument dat de run al heeft geschreven. Hij voert de fysica niet opnieuw uit, hij resamplet, egaliseert of interpoleert niet tussen samples (afgezien van het ene rechte lijnsegment waarmee een trace bij de cursor eindigt) en voegt geen eigen getal toe. Een animatie is dus precies zo goed als de run erachter. Het niveau ervan is <b>MODELLED, interne consistentie</b>: het is een weergave, nooit bewijs, en het draagt geen eigen rij in de verificatiematrix.

seg-f37311ad7ef0 = Uitvoer

seg-0c21f772932e = Elk formaat wordt naast het scenario geschreven, naast de gebruikelijke <c1/>, <c2/> en <c3/>:

seg-f2ce7fc60cdf = Formaat

seg-51a8df15f356 = Geschreven als

seg-3ea93ae372ca = Wat het bevat

seg-3603593b9799 = Eén SVG geanimeerd met CSS-keyframes (Cascading Style Sheets) en zonder script: de traces tekenen zich achter een bewegende tijdcursor, gebeurtenissen verschijnen op hun tijdstip, waterfallrijen onthullen zich in tijdsvolgorde. Het loopt in een lus, met een pauze van { "1.5" } s op het voltooide beeld.

seg-6c91078b434e = Eén bestand met inline script en stijl en zonder extern bestand: afspelen en pauzeren, een scrubber, snelheid (0.25x tot 4x), elk paneel op één gesynchroniseerde cursor, een live waarde per trace, de fasebalk en een gebeurtenissenlijst die bij een klik naar de plek springt. Spatie speelt af of pauzeert, de pijltoetsen stappen, Home en End springen.

seg-df02d37cd729 = <c1/>, <c2/>, … en <c3/>.

seg-2e5ebd60cad0 = <c1/> is herhaalbaar en neemt een kommalijst (<c2/>) of <c3/>. <c4/> ({ "1" } tot { "60" }, standaard { "12" }) en <c5/> ({ "0.5" } s tot { "600" } s, standaard { "8" } s) bepalen het afspelen; de framereeks is begrensd op { "7,200" } frames.

seg-7e012ab53f45 = Wanneer <c1/> in dezelfde opdracht draait, vermeldt de HTML-speler de exportbestanden die ernaast zijn geschreven (CZML, KML, GeoJSON, STK, SigMF) als relatieve links naar die naastgelegen bestanden; een link wordt alleen geschreven voor een kale bestandsnaam, zodat er geen uit de map kan wijzen of het netwerk kan bereiken. Het geavanceerde rapport (<c2/>) bevat de geanimeerde tekening telkens wanneer het resultaat een tijdreeks heeft, ongeacht of <c3/> heeft gedraaid.

seg-9c1d2204edab = Wanneer <c1/> draait, krijgt <c2/> een blok <c3/>: de formaten, frames per seconde (fps), duur, aantal frames, de tijdspanne, de paneeltitels, de JSON-paden waaruit elke trace is gelezen (<c4/>) en elke reeks die is gevonden maar niet getekend (<c5/>). Zonder <c6/> is het resultaat byte-identiek aan een gewone run.

seg-fa8388ae976e = De framereeks

seg-db4b53abe7d6 = De reeks heeft precies <c1/> frames. Frame <em>i</em> toont de tijdlijn tot <c2/>, dus het eerste frame is het begin en het laatste is het voltooide beeld. <c3/> legt <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), de pixelgrootte, <c9/>, <c10/>, de missietijd van elk frame (<c11/>), de fasen, de gebeurtenissen en de bronnen vast. Een nieuwe export naar dezelfde map verwijdert eerst elke <c12/> die er al staat (en niets anders), zodat een kortere reeks nooit frames van een langere achterlaat die de encoder zou lezen.

seg-13b57b6d3c14 = De frames zijn SVG, geen Portable Network Graphics (PNG). Een <c1/> die met de bibliotheek <c2/> is gebouwd leest ze rechtstreeks, met de framesnelheid waarmee de reeks is geschreven ({ "24" } in het voorbeeld hierboven; de <c3/> van het manifest):

seg-b20beeb45fac = Een <c1/> zonder <c2/> stopt met „no decoder found for: svg”. Rasteriseer de frames eerst, bijvoorbeeld met <c3/>, en encodeer de PNG's:

seg-fc61f546f605 = Toegankelijkheid en thema

seg-7015f7ed77dc = <b>Kleurenschema.</b> De speler volgt <c1/> en tekent opnieuw wanneer die verandert; de geanimeerde SVG bevat onder dezelfde mediaquery een lichte variant van zijn palet. De frames gebruiken het donkere palet van de statische grafieken, omdat een video geen schema heeft.

seg-c3b1f19f191b = <b>Verminderde beweging.</b> Onder <c1/> schakelt de geanimeerde SVG elke animatie uit en toont het voltooide beeld (de basisstijlen zijn de eindtoestand, dus niets is verborgen), en de speler opent gepauzeerd op het voltooide beeld in plaats van af te spelen; de gebruiker kan nog steeds scrubben of op Play drukken.

seg-f8dd26194eec = De SVG heeft een <c1/> en <c2/>; de bediening van de speler bestaat uit gelabelde knoppen, een bereikinvoer met een uitgesproken tijdwaarde en een keuzelijst.

seg-f5356cbf3675 = Wat als tijdreeks telt

seg-ba43cf36ac20 = De resultaatdocumenten verschillen per soort, dus de exporter herkent de vormen die de engine uitgeeft in plaats van een lijst van soorten:

seg-952d09156712 = <b>Een array van records met een tijdveld</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, of <c6/> op een <c7/>-array) dat strikt toeneemt langs de array. Elk ander numeriek veld wordt een trace; hetzelfde veld onder twee wortels (<c8/> en <c9/>) deelt een paneel.

seg-2c3abce3f70a = <b>Een object met een strikt toenemende tijdarray</b> (<c1/>, <c2/>, <c3/>, …) naast arrays van dezelfde lengte: naastliggende numerieke arrays, een <c4/>-map van <c5/>-records (de <c6/>-tijdlijn), een array van records die zulke arrays bevatten (de <c7/>-banden, de satellietsporen van een constellatie) en een tweedimensionale array waarvan de rijen overeenkomen met de tijdas met een naastliggende frequentieas <c8/> (de <c9/>-waterfall).

seg-0edf8c38f9eb = Naast die tijdarray worden <c1/> (<c2/>, <c3/>, <c4/>) de fasebalk en <c5/> (<c6/>, <c7/>, <c8/>) de markeringen. De scalars <c9/> van een band (het eerste verlies van lock, de laagste draaggolf-ruisdichtheidsverhouding) worden ook gemarkeerd.

seg-608c4fed9e98 = Traces met een eenheid delen een paneel wanneer hun grootte binnen een factor { "100" } ligt, zodat een guard van { "50" } ns een fout van { "2" } ns niet afvlakt. Er worden hoogstens { "6" } panelen van { "6" } traces getekend; de rest staat onder <c1/>. Traces van meer dan { "2,400" } samples worden uitgedund met een gelijkmatige stap die de laatste sample behoudt, en een waterfall van meer dan { "96" } × { "120" } cellen wordt gemiddeld verkleind (in vermogen, voor decibelcellen, zodat een smalle jammer niet wordt verdund).

seg-c386389e4f1d = Onder de LEO-soorten animeert elk meegeleverd scenario <c1/>, <c2/> en <c3/>. <c4/> animeert in zijn modi Doppler, gezamenlijke positiebepaling en tijdsynchronisatie (een tijdsynchronisatierun heeft <c5/> nodig, waardoor elke rij bij elke epoch zijn tijdfout en voorspelde sigma rapporteert) en wordt geweigerd in zijn modus poolbedekking. <c6/> animeert zijn update halverwege de overpassing en wordt geweigerd voor de analyses van codering, fitinterval en modelvergelijking. Resultaten van <c7/> en <c8/> hebben geen tijdas en worden geweigerd.

seg-eb31ec7a07b7 = Determinisme

seg-82bcf8a5b042 = De uitvoer is een zuivere functie van het resultaatdocument en de opties: geen klok, geen willekeurig getal, geen iteratie over een hashmap, geen bestands- of netwerktoegang in de bibliotheek en nergens een tijdstempel, dus hetzelfde scenario, dezelfde seed en dezelfde opties geven byte-identieke bestanden. De module bouwt ongewijzigd voor WebAssembly; alleen de opdrachtregelinterface schrijft bestanden.

seg-77e1f459f3d3 = Gebruik als bibliotheek

seg-b3fa41e48ea5 = <c1/> animeert een resultaatdocument dat u al hebt, en <c2/> geeft terug wat er getekend zou worden zonder het te renderen.

seg-0857a94a948e = Beperkingen

seg-02f0f03af2fb = Het Python-wheel en de WebAssembly-module bieden de exporter nog niet aan; hij is bereikbaar via de opdrachtregel, de Rust-bibliotheek en het hulpmiddel <c1/> van de Model Context Protocol-server (MCP) (dat in één antwoord hoogstens { "120" } frames teruggeeft).

seg-cd3ec7b403ba = De assen zijn lineair. Een reeks die vele decaden overspant (de foutgroei van een klok van { "0.1" } ns tot een microseconde) oogt vlak tot laat in de run.

seg-ed21d370a73c = De geanimeerde SVG steunt op CSS-animatie van een knipvierkant; de huidige engines van Chromium, Firefox en Safari spelen hem af, terwijl een viewer zonder CSS-animatie het voltooide beeld toont.

seg-9dfb9596ecf3 = Sweep-, Monte Carlo- en compose-campagnes hebben geen tijdas en worden geweigerd; de samenvattende statistieken van een sweep of een ensemble zijn geen tijdreeks. Een geketende campagne animeert wel.

seg-be1f1afe7424 = <s1>Vorige</s1>Runrapporten

seg-6817433f69f6 = <s1>Volgende</s1>Interoperabiliteitsexports en -imports

seg-51cd8d5f527b = Een soort waarvan het resultaat geen van deze vormen bevat (een linkbudget, een geometrie voor één epoche, een Monte Carlo-samenvatting met alleen statistiek, of de telecom-holdover, waarvan het resultaat de hash van de opname publiceert maar niet de opname zelf) wordt geweigerd met <c1/>, en er wordt niets geschreven. Met kshana { $version } worden { "94" } van de { "193" } uitvoerbare scenariobestanden (elk bestand behalve een studiesuite) geanimeerd en worden { "99" } geweigerd. <c2/> drukt de telling af.
