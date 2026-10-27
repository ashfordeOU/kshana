# docs--python-api: translations (nl)

seg-5ad814c7ef9e = Notities

seg-2bd2101ce454 = Onderdeel

seg-fffbeccd4266 = Symbool

seg-a129b9e613d0 = Type

seg-ce0b6a889a87 = Bron: <c1/>

seg-aea4d3625c20 = Kshana levert een volwaardige Python-programmeerinterface (API), gebouwd met <a1>PyO3</a1> en <a2>maturin</a2>. De <c1/>-wheels zijn gebouwd tegen de stabiele binaire interface van Python (ABI), zodat één wheel per platform werkt met CPython ≥ { "3.9" }; de wheels dekken Linux, macOS en Windows, elk op x86-64 en 64-bits ARM (zie <a3>WHEEL_TAGS.md</a3>). Een meegeleverde typestub (<c2/> + <c3/>) geeft editors en <c4/>/<c5/> volledige typeinformatie.

seg-8b0ad6639bd5 = Snelstart

seg-28e092a5a781 = Voer deze fragmenten uit vanuit de root van een checkout van de repository: ze lezen scenariobestanden onder <c1/>. De NumPy-regel vereist <c2/>.

seg-8c83544270b5 = Signatuur

seg-fa90b5cd182b = Retourneert

seg-6f62744a47df = getypeerd resultaat (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = resultaatdocument als JSON-string (JavaScript Object Notation)

seg-8246b2be7aaf = beschikbare scenariotypen + metadata (geparsed)

seg-b5ad97d3ec18 = dezelfde metadata als ÉÉN JSON-arraystring, geen lijst (behouden voor bestaande aanroepers; gebruik <c1/> voor de geparsede lijst)

seg-8ce669f8e1d0 = foutmeldingen (leeg als geldig)

seg-6017d21f52dd = tag voor de foutcategorie (<c1/>, <c2/>, <c3/> of <c4/>), of <c5/> bij succes

seg-c62c5ab99132 = engineversie

seg-fdaaf33250d1 = een echt ontvangerlogboek beoordelen dat wordt beschreven door een scenario <c1/>: resultaatdocument, vertrouwens-CSV per epoche, grafiek en samenvatting; een tabel <c2/> voegt de maritieme monitors toe en de vertrouwensscore van 0-100 met redenen (adviserend)

seg-0fb76af3d043 = een begrensd NMEA-fragment gescoord zoals de live-modus het scoort: toestand per epoche, score van 0-100 en redenen, een samenvatting (geen socket, geen gate; adviserend)

seg-6ecd9bb3a1cd = het NMEA-logboek van een vaartuig als batchrun: het scoremodel en de score van elke epoche met haar aftrekposten (adviserend)

seg-7cd62f15bc3c = de gepubliceerde Jammertest-catalogus en het plan als events met geplande referentie (<c1/>, <c2/>); geplande slots, geen opgenomen tijden in de ether

seg-1e2faf2894e3 = een ontvangerlogboek gescoord tegen dat schema: latentie, gemist, hersteltijd en valse alarmen per test (MODELLED; een ondertekend pakket vereist de opdrachtregel)

seg-f94eaef45f04 = een ondertekend bewijspakket voor een venster van het logboek, in het geheugen: <c1/>, <c2/>, <c3/> (houd dit privé); een technische registratie, geen juridisch advies

seg-ebd10aea2f6f = een pakket verifiëren: hashes, keten, handtekening, optioneel de vertrouwde ondertekenaar, het volledige logboek en een tijdstempel; <c1/> is <c2/>, <c3/> (geen publieke sleutel opgegeven: intact, ondertekenaar niet vastgesteld) of <c4/>

seg-bf13e70f1d5c = de artefacten <c1/> van de CLI als tekst

seg-1e5eb44bec6f = welke interoperabiliteitsformaten van toepassing zijn op een scenario, zonder het uit te voeren

seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> of <c5/> in het geheugen: <c6/>, elk bestand <c7/> (<c8/>-tekst of <c9/>)

seg-bef8250e8453 = een GeoJSON-route geschreven in een waypoint-trackscenario (<c1/>)

seg-e25bcb6342db = de tijdreeks van de run als geanimeerde SVG, een HTML-speler of maximaal { "120" } SVG-frames: <c1/>

seg-9b24b9cf0510 = de meegeleverde referentiescenario's en hun TOML

seg-f62c11fe1e7d = een RFC { "3161" }-token (bytes of base64) in het geheugen aan een pakket koppelen: <c1/>; het pakket moet nog steeds verifiëren; de handtekening van de autoriteit wordt niet gecontroleerd

seg-95fe54b500a7 = een nieuwe ondertekeningssleutel in het geheugen: <c1/> (PRIVÉ), <c2/>, <c3/>, <c4/>; alleen Python

seg-646e6aba13db = één opname afspelen over lusontwerpen (<c1/>): per ontwerp en PRN de jitter in stabiele toestand, lockfracties en C/N0; één acquisitie per PRN, elk kanaal op dezelfde samples

seg-08d46de5e7cd = één opname beschrijven, of elke opname in een map (leest bestanden; <c1/> leest ze volledig)

seg-7d9cc8394e65 = de voertuigbeweging en events van een scenario voor een GNSS-laboratoriumsimulator, in het geheugen: <c1/>; typen <c2/>, <c3/>, <c4/>; er wordt geen signaal geschreven, bewaar <c5/> bij de bestanden

seg-e215c7242eb2 = de koppeling met openbare kaders ingevuld uit resultaatteksten: <c1/> is een lijst met dicts <c2/> (tekst, maximaal { "64" }); retourneert <c3/>; de <c4/> van elke rij zegt dat de runs bewijs leveren voor haar mogelijkheden, niet dat een kader is gehaald; draag <c5/> mee bij elke weergave

seg-18d57e4920dd = de statische koppelingstabellen (of de brondocumenten) als Markdown, met de verklaring voorop

seg-8284e10dce6a = de standaardpakketten (id, titel, kader, aantallen tests) en een mededeling; een pakket meet gemodelleerde scenario's af aan drempels die vóór de run zijn vastgelegd

seg-ce6b819604a9 = één pakketrun: elke test <c1/>, <c2/> of <c3/> met gemeten en verwachte waarden, plus het rapport als Markdown onder <c4/>; geeft <c5/> bij een onbekend id

seg-0f701bc523c6 = de LunaNet-AFS-implementatie gecontroleerd aan de afgedrukte tabellen en uitgewerkte voorbeelden van LSIS-AFS V1.0 (drempels B1 tot en met B10; B4 meldt één vastgelegde misser)

seg-82aecf261c46 = een AFS-symboolstroom (tekst van { "0" } en { "1" }) gecontroleerd op synchronisatiepatroon, SB1-decodering, FID, TOI-continuïteit en -afstand; LDPC en CRC-24Q van subframes { "2" } tot en met { "4" } worden niet geverifieerd

seg-f72ab45ae10b = een teststroom van symbolen met plaatshouder-subframes (geen golfvorm)

seg-1da34527bb64 = het ondertekende round-trip-pakket uit het laboratorium dat scenario, testomstandigheden (<c1/>), ontvangerlogboek en score via hash aan elkaar koppelt; als <c2/>

seg-dd3726fec672 = een resultaatbestand van kshana-bench (JSON-tekst) uit een referentiebestand en een voorspellingenbestand; MODELLED

seg-b82a110c324c = resultaatbestanden van kshana-bench weergegeven als de statische ranglijstpagina (HTML)

seg-58b8aa919eaf = Galileo-OSNMA-authenticatie van I/NAV-pagina's of een UBX-stroom in het geheugen: de dict die <c1/> afdrukt, met het advies in het veld <c2/>; alleen adviserend, geen dienst voor navigatie-integriteit

seg-15e4601cd88c = de satellieten die een locatie ziet onder een azimutafhankelijke skyline: per satelliet <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, de oost-noord-omhoog-cofactor en -covariantie en de horizontale foutellipsen; <c3/> is JSON- of TOML-tekst of een dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); de zichtbaarheidsbeslissing en de ellips worden gecontroleerd aan onafhankelijke bibliotheken, de rest is MODELLED, en het resultaat draagt het advies (<c14/>, <c15/> zeggen of de hemel representatief is of uit elementensets komt)

seg-51ac7cd68154 = <c1/> ({ "1" } tot en met { "5000" }) kleinstekwadratenfouten met seed op de zichtbare set van <c2/>, met hun empirische covariantie, RMS en het aandeel binnen de ellips van { "95" } %

seg-8bba3099379a = de skyline-voorinstellingen (<c1/>, <c2/>, <c3/>, <c4/>) met hun label REPRESENTATIVE, herkomst en de afsnijding voor elke graad azimut; representatieve geometrieën, geen opmetingen

seg-f900de61f6e9 = een skylinesectie (tabel, straatkloof, sectoren, terrein) teruggebracht tot de genormaliseerde tabel van 360 items die de engine gebruikt

seg-824f3c5951fa = de skyplot van <c1/> als statische SVG-tekst

seg-0ffb65c8f5f3 = een vertrouwensstroom (<c1/>) of een resultaat van <c2/> als Prometheus-tekst, CEF- of LEEF-syslogregels of een OTLP-JSON-payload, met de encoders van <c3/>; er wordt niets verzonden en er wordt geen klok gelezen (syslogregels bevatten geen tijdstempel)

seg-c1ab3dbbe2f2 = een GNSS-interferentiekaart uit ADS-B- of AIS-CSV-tekst: één dict per UTC-dag met <c1/>-GeoJSON (alleen geaggregeerd; een gedegradeerde cel noemt interferentie niet als oorzaak)

seg-ff4bc7fdbce7 = aandeel van een route door gedegradeerde cellen van die kaarten, als JSON-tekst (geen voorspelling; niet-waargenomen cellen zijn geen bewijs van een vrije route)

seg-d70bccba0e03 = synthetische brug-NMEA voor bemanningstraining plus het instructeurslogboek (<c1/>, <c2/>, <c3/>); alleen tekst, nooit voor de live navigatiesystemen van een vaartuig

seg-3fe13851ac82 = de namen van GNSS-IQ-signalen die <c1/>, <c2/> en <c3/> accepteren (<c4/>, <c5/>, <c6/>, ...)

seg-50bf4ad4e23a = een GNSS-IQ-scène met meerdere satellieten in het geheugen: <c1/> / <c2/> en <c3/> per epoche

seg-b3199839a37c = hetzelfde, met elke GPS-satelliet in de geometrie van de uitgezonden efemeride uit een RINEX-navigatiebericht (Receiver Independent Exchange Format)

seg-8f0f9efea46b = FFT-acquisitie (fast Fourier transform) van elke PRN (pseudorandom noise code): Doppler, codefase, statistiek, drempel

seg-3bf994f3f1bf = het volledige acquisitieoppervlak van één PRN (<c1/>): correlatievermogen <c2/>, de piek en twee fijne Doppler-verfijningen (<c3/>, <c4/>)

seg-393572e31421 = acquireren en vervolgens elke PRN volgen: Doppler, codefase, lock-indicatoren, C/N0 en prompt-correlator per epoche

seg-bc39efdb015a = de front-endketen van de ontvanger (banddoorlaat, notch, blanking, excisie, AGC (automatic gain control), kwantisator) over complexe samples

seg-ead1b81c712f = het lock-verliesmodel van de volglus fitten aan een vertrouwenstijdlijn van een ontvanger (een scenario <c1/>)

seg-0ab8531d0465 = een bestand <c1/> (een pad of TOML-tekst) parsen tot zijn opgeloste ontwerpen, elk met zijn <c2/> en <c3/>; <c4/> bij een ongeldig bestand

seg-9c3467d4451e = een binair tracking-epochbestand lezen (<c1/>, zoals <c2/> het schrijft): de <c3/> en één dict per epoche in <c4/>

seg-469303e33d2a = de IQ-detectiemonitors over een opname in één streamingpas (<c1/>): <c2/>, <c3/>, <c4/> en <c5/>; leest een bestand

seg-bb5c5008f1a8 = een bestand met laboratoriumtestcondities valideren (<c1/>, TOML of JSON, een pad of tekst) en het opgelost teruggeven, met zijn <c2/>

seg-d2441bf762b4 = een laboratorium-replaycampagne (<c1/>) uitvoeren naar <c2/> zoals <c3/> dat doet; voltooide cellen worden overgeslagen; geeft de celaantallen, de fouten en de <c4/> terug zodra elke cel klaar is

seg-7b6d264d9c7f = de scorekaarten, het HTML-rapport en de digest van een campagne opnieuw opbouwen uit haar cellen: de cel- en rijaantallen, de rijen die een drempel niet halen en de <c1/>

seg-e3956268cf1c = Signaturen van GNSS-IQ en ontvangervertrouwen

seg-817bd0898d46 = De volledige signaturen, zoals <c1/> ze vermeldt (elk trefwoord na de verplichte argumenten heeft een standaardwaarde; de docstrings in de stub geven de betekenis van elk). Verpak de lijsten <c2/> / <c3/> en de invoer <c4/> / <c5/> met <c6/> voor arrays.

seg-2dd9323829ce = Een laboratorium-replaycampagne vanuit Python, daarna haar rapport (het campagnebestand en de opnamen zijn van u; een voltooide cel wordt bij de volgende aanroep overgeslagen; <c1/> leest een tracking-epochbestand dat een run van <c2/> heeft geschreven):

seg-5f48b88438df = De parameter <c2/> van <c1/> bepaalt hoeveel codeperioden de overdrachtsacquisitie coherent integreert. Vanaf { "0.33.0" } is de standaardwaarde <c3/>, wat automatisch betekent: ongeveer { "4" } ms ({ "4" } perioden voor een code van { "1" } ms zoals GPS L1 C/A, { "1" } voor een code van { "4" } ms of langer), zodat het kanaal dicht genoeg begint om de frequentielus te laten invangen; <c4/> behoudt de zoekactie met één periode uit { "0.32" }.

seg-012a83181bd3 = Typen

seg-0b4f4c6c6014 = <c1/> typeert de gesloten vocabulaires voor controleprogramma's (mypy, pyright): <c2/> (elke typenaam, een <c3/>), <c4/> (de vier tags die <c5/> teruggeeft), <c6/>, en de <c7/>s <c8/> (waarvan <c9/> een lijst teruggeeft) en <c10/> (een item van het blok <c11/> van een resultaat, dat de basis <c12/> met verplichte sleutels uitbreidt). Ze bestaan alleen voor typecontrole en zijn tijdens runtime niet te importeren; <c13/> houdt ze gelijk aan de lijsten van de engine.

seg-b5ad0d8e1456 = Lid

seg-2698ab8436e6 = volledig resultaatdocument (JSON)

seg-7eccc8361120 = zelfstandige grafiek-SVG (Scalable Vector Graphics)

seg-38c8d20ca07a = samenvatting van één regel voor mensen

seg-e21e82ad3fe8 = de reproduceerbaarheidstabel, voor de typen die er een uitgeven (zie hieronder)

seg-aadcc1cc4c79 = het resultaat geparsed tot een Python-dict (zie de opmerking over de vorm hieronder)

seg-409504363c4c = de numerieke lijst op <c1/> (met punten, <c2/>, of een JSON Pointer, <c3/>): 1D voor getallen, 2D voor numerieke lijsten van gelijke lengte

seg-b6d5d7e5271a = de lijst met records op <c1/> (een tijdreeks), één array per veld dat in elk record een getal is

seg-adb2d15f9f74 = elke lijst met records met een numeriek veld, gesleuteld op pad met punten, elk als <c1/>

seg-7f053ad96880 = die tabel naar <c1/> schrijven; geeft de geschreven bytes terug, of { "0" } (en schrijft niets) wanneer het type geen tabel uitgeeft

seg-276104139e73 = De reproduceerbaarheidstabel

seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> en <c5/> publiceren altijd een tabel; <c6/> publiceert er een wanneer een exportlocatie (<c7/> + <c8/>) is geconfigureerd. Elk ander type geeft <c9/> terug. De tekst bestaat uit dezelfde bytes die de CLI (command-line interface) als <c10/> schrijft, zodat een beoordelaar die een gepubliceerde tabel uit de wheel reproduceert nooit naar de opdrachtregel hoeft af te dalen:

seg-3ad2987110ee = Vorm van het resultaat

seg-57c7066d3522 = De kwaliteitsmaten en de tijdreeksen staan <b>per kant van de run</b>, niet op het hoogste niveau. Voor een klokrun is het document:

seg-cb19f961de2b = dus de kwaliteitsmaten zijn <c1/>, nooit <c2/>. Andere typen geven hun eigen pakketten uit; de volledige referentie per veld, met eenheden en een bronverwijzing, is <a1><c3/></a1> en de gids voor de lezer is <a2><c4/></a2>.

seg-bfd984e0407b = <c1/> en <c2/> <b>voeren</b> het scenario uit, zodat ze parse-, configuratie- <em>en</em> runtimefouten naar boven brengen. Ze geven nooit een exception.

seg-0ca0a1da8356 = <c1/> / <c2/> geven <c3/> bij een ongeldig scenario.

seg-901c2ede0cd0 = Resultaten zijn reproduceerbaar: een scenario draagt zijn <c1/> en de engine legt een <c2/> vast, zodat dezelfde invoer op hetzelfde platform byte-identieke uitvoer oplevert (zie <a1><c3/></a1>).

seg-8c0c32fcba2b = <c1/>, <c2/> en <c3/> geven precies <c4/> van dezelfde waarden die <c5/> geeft (hetzelfde dtype, bit-identiek; <c6/>). Ze importeren NumPy wanneer ze worden aangeroepen en geven <c7/> zonder NumPy; NumPy blijft buiten de runtimevereisten van het pakket. <c8/> betekent dat het pad ontbreekt, <c9/> dat de waarde daar geen numerieke array is (of geen lijst met records). Uitvoerbare notebooks staan in <a1><c10/></a1>.

seg-00a3cf088cde = Niet in Python: langlopende processen

seg-3780dd4973f0 = <c1/> (een stroomproces met een gate en een optionele TCP-server <c2/>) en de telemetrie-exporters (Prometheus, OTLP, syslog; <c3/>) en het streamen van <c4/> zijn alleen via de opdrachtregel beschikbaar: een binding keert terug wanneer de aanroep terugkeert en houdt geen socket open. Python dekt de batchvorm van elk: <c5/> voor een logboek, <c6/> voor een stroomfragment (scores en toestanden; de gate wordt niet toegepast), <c7/> voor de gegenereerde tekst.

seg-82379c29d438 = <s1>Vorige</s1>Koude-atoominterferometer

seg-4a457afc63fb = <s1>Volgende</s1>npm en WebAssembly

seg-dbbce10a12d2 = RunOutput
