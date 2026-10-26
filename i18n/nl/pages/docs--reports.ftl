# docs--reports: translations (nl)

seg-3ea93ae372ca = Wat het bevat

seg-245adc6e6766 = <s1>Vorige</s1>Campagnes

seg-aa5482ac34ff = Beperkingen, duidelijk vermeld

seg-b0dcf3142564 = Bron: <c1/>

seg-4c412bb0ce63 = Elke run van de opdrachtregelinterface (CLI) schrijft naast zijn resultaat een rapport: een afdrukbare HyperText Markup Language (HTML)-pagina, <c1/>, en een machineleesbaar JavaScript Object Notation (JSON)-document, <c2/>, met dezelfde inhoud. Het rapport werkt voor elk scenariotype en voor campagnes.

seg-e26b1a83a86d = Het resultaatdocument beantwoordt <em>wat de engine heeft berekend</em>. Het rapport voegt toe wat een lezer nodig heeft voordat hij erop handelt: wat erin ging, waarop de getallen berusten, wat is weggelaten en hoe dezelfde bytes opnieuw te verkrijgen zijn. Het verzint daarvan niets. Elke sectie wordt gelezen uit een bron die de engine al bijhoudt, en noemt de bron naast wat zij citeert.

seg-bf0456f18e4f = De builder is <c1/> (<c2/>). Het is een zuivere functie van de runuitvoer, de bytes van het scenariobestand en de opdrachtregel: hij leest geen klok, geen bestand en geen netwerk, en hij bouwt voor WebAssembly.

seg-bed0af192da5 = Secties

seg-fca842769048 = Sectie

seg-2654051d8292 = Gelezen uit

seg-5790851a4a5f = Managementsamenvatting

seg-3d34b2ef5988 = wat het soort doet, de samenvatting van de run in één regel, kerncijfers, het label voor eerlijkheid op runniveau, het aantal gebruikte capabilities VALIDATED / MODELLED / PARTNER

seg-923111083001 = de catalogus van soorten (<c1/>), het <c2/> van het resultaat, zijn <c3/>-blok of blok met kwaliteitsmaten, de percentielen van een Monte Carlo-campagne

seg-e1ce0e8d5c61 = elk veld dat het scenariobestand instelt, afgevlakt tot zijn pad, met zijn eenheid en waar de eenheid vandaan komt

seg-fbd2e96c92c7 = het scenariobestand; eenheden uit het blok <c1/> van het resultaat (het eenhedenschema voor velden, <c2/>), anders het achtervoegsel van de veldnaam (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); een eenheid die geen van beide vermeldt, wordt afgedrukt als <b>niet opgegeven</b>

seg-88ccaef6fc49 = de grafiek van de run, elke scalar van het resultaatdocument met zijn eenheid, en een samenvatting met aantal / minimum / maximum / eerste / laatste van elke numerieke kolom

seg-42a82485f8c8 = het resultaatdocument en zijn <c1/>-blok

seg-f554fbcdd85c = Aggregatie (campagnes en sweeps)

seg-7c0466805f54 = de knooptabel van een sweep; het gemiddelde, de standaardafwijking, het 5e / 50e / 95e percentiel en het { "95" }%-betrouwbaarheidsinterval op het gemiddelde van een Monte Carlo-run, met een histogram per maat; de fasetabel van een keten; de gedeelde voorwaarden, leden en gecombineerde samenvatting van een samenstelling

seg-7b5f5b635905 = de sectie <c1/>, <c2/>, <c3/> of <c4/> van het campagneresultaat; het raster van een resultaat van <c5/> of <c6/>

seg-3bf44008fc65 = Animatie en exports

seg-64d1073dfadc = de geanimeerde tekening van de run (de uitvoer van <c1/>), ingebed als inerte afbeelding, of waarom die er niet is; verwijzingen naar de animatie- en interoperabiliteitsbestanden die dezelfde opdracht naast het rapport schreef; elk exportformaat, met of het op het scenario van toepassing is, waarom niet, en zijn specificatie

seg-ad7792e04197 = de animatie-exporter (<c1/>), <c2/> en de bestanden die de opdrachtregel schreef (<c3/>, <c4/>)

seg-3d3781a3691b = Gebeurtenistijdlijn

seg-f29f1b90edbd = getimede vensters en puntgebeurtenissen, getekend en in een tabel gezet op de tijdas van de run

seg-4271c092fa45 = scenariotabellen met <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> of een begintijd; de runduur <c7/>; elke <c8/>-array in het resultaat; de fasen en overdrachten van een campagne

seg-00bee96167aa = Verificatielabels

seg-6dea392111a6 = elke rij van de verificatiematrix die de soorten van de run gebruiken, met haar label, onafhankelijke referentie en testbewijs, en de niveaus per kengetal die het resultaat vermeldt

seg-ca56309b9693 = de verificatiematrix (<c1/>, <c2/>), via de kruisverwijzing van soort naar rij <c3/>

seg-c19ae28a2355 = Niet gemodelleerd, en aannames

seg-aff7a016c7e2 = elke beperking, geciteerd

seg-9be853632d3a = de blokken <c1/>, <c2/> en <c3/> van het resultaat; de MODELLED-clausules van de soortencatalogus; scenario-opmerkingen en invoertekst die "not modelled" zeggen; de reden in de matrix waarom elke MODELLED-rij een model blijft (<c4/>)

seg-a3ee5ba71183 = Reproduceerbaarheidsverslag

seg-a9746c2f1881 = engineversie, bron-commit, Secure Hash Algorithm 256-bit (SHA-256)-digests van het scenariobestand en van het resultaatdocument, seed, platform, de exacte opdracht, de regel voor de werkmap, de digest van elk verder invoerbestand

seg-ec1f62f6bbd1 = de build, de bestanden, de opdrachtregel

seg-ea460048debd = Een sectie zonder iets om op te sommen zegt in één zin waarom (bijvoorbeeld: "No timed event: the scenario scripts no window or onset time and the result reports no event"). Geen enkele sectie is ooit leeg en zwijgzaam.

seg-b99234469953 = Wat een label in het rapport betekent

seg-f9060b1e8077 = Een verificatielabel beoordeelt de <b>capability</b> die in een matrixrij wordt genoemd, zoals de matrix die vastlegt. Het beoordeelt niet de configuratie van het scenario, en een rij VALIDATED maakt de invoer van een run niet tot gemeten invoer. Een rij PARTNER is een discipline waarop de run steunt en die Kshana niet levert (antennehardware voor de radiofrequente soorten, de quantumpayload voor de quantumsoorten, de ruimtevaartuigbus voor het standhoudingsbudget); het rapport toont haar als <em>waarop wordt gesteund, niet geleverd</em>.

seg-da422ae044d2 = De kruisverwijzing van soort naar rijen is een tabel met <c1/>-strings van de matrix. Het label, de onafhankelijke referentie en het bewijs worden uit de matrix teruggelezen wanneer het rapport wordt gebouwd, dus wie een rij tussen VALIDATED en MODELLED verplaatst, verplaatst elk rapport mee. Een campagne draagt de rij voor haar modus (keten, sweep of Monte Carlo, samenstelling) plus elke rij van elke ledensoort die zij heeft uitgevoerd; <c2/> draagt de rijen van de soort die zij heeft gesweept. Elke run draagt ook de rij "Reproducibility & software assurance", waarop het reproduceerbaarheidsverslag berust.

seg-f38434695c28 = Een rij die slechts één invoerpad van een soort beoordeelt, wordt alleen vermeld wanneer de run dat pad nam (<c1/>): <c2/> en <c3/> dragen de rij "Orbit propagation & determination" alleen met een <c4/> (het pad Simplified General Perturbations { "4" } (SGP4); een analytische baan is een tweelichamenpropagatie), en <c5/> draagt de rij met het gemeten record alleen met een <c6/>. Dezelfde tabel bepaalt ook de rij voor meerdere banden van <c7/> naar gelang de run <c8/> tekent, en de rijen van de soorten voor lage aardbanen (LEO) naar het pad dat elke run nam: een rij voor regen, gebouwpenetratie, laag vermogen of spoofer bij <c9/> of <c10/> alleen wanneer het scenario die term instelt, de scintillatierij tenzij het scenario die uitschakelt, een rij voor <c11/>, <c12/> of precise point positioning in een keten alleen voor de analyse of modus die het resultaat draagt, en de rij voor het LEO-systeemvoorinstelling alleen wanneer een benoemde voorinstelling wordt gebruikt. De rij voor de Shuttle Radar Topography Mission (SRTM)-lezer wordt door geen enkele soort gedragen: <c13/> en <c14/> draaien op een synthetisch digitaal hoogtemodel (DEM), en geen enkel scenarioveld leest een SRTM-tegel. Een rij VALIDATED die de run nooit raakte, zou anders bewijs claimen dat de run niet heeft.

seg-29efeadac5c7 = Een run reproduceren uit zijn rapport

seg-e859939f0f42 = <c1/> → <c2/> bevat alles wat nodig is:

seg-d65ad1b942e3 = Controleer het scenariobestand aan <c1/>, en elk bestand in <c2/> (een Earth-orientation-bestand van <c3/>) aan zijn digest.

seg-5b3c59266451 = Voer <c1/> uit vanuit de map waarin de oorspronkelijke run is gestart. Het scenariopad, en elk relatief gegevenspad in het scenario, wordt daaraan gerelateerd.

seg-9f38218af0f0 = Het nieuwe <c1/> heeft de SHA-256 uit <c2/>, en het nieuwe <c3/> en <c4/> zijn byte-identiek aan de oude.

seg-a04db3e1c7f5 = <c1/> doet precies dit voor een klokscenario, een gekoppelde campagne, een sweepcampagne en een baanrun met een <c2/>-bestand: de test leest de opdracht uit het rapport, voert die uit in een verse map met alleen de vastgelegde invoer, en vergelijkt bytes.

seg-1e2e9158544d = <c1/> is de digest van de exacte bytes van het bestand. De eigen <c2/> van het resultaat is iets anders, de vingerafdruk van het scenario door de soort (vaak van een canonieke vorm), en het rapport drukt beide af, met label.

seg-3d72d2059a6c = <b>Seed.</b> De seed is de <c1/> van het scenario, anders die welke het resultaat vermeldt. Voor een soort die geen seed neemt, zegt het rapport dat, en dat het scenariobestand en de enginebuild alleen het resultaat vastleggen.

seg-50457327734e = <b>Bron-commit.</b> De engine legt de commit alleen vast als hij is gebouwd met de omgevingsvariabele <c1/> ingesteld, gelezen tijdens het compileren:

seg-3c7ed74729d3 = Een build zonder die variabele meldt de commit als niet vastgelegd, en de engineversie identificeert de release. Er wordt niets geraden.

seg-86ff67531a0e = <b>Platform.</b> Besturingssysteem, architectuur en familie van de build. Resultaten zijn byte-identiek op één platform; tussen platforms kunnen resultaten met drijvende komma in de laatste cijfers verschillen (zie <a1>REPRODUCIBILITY.md</a1>).

seg-eeb07da80914 = Determinisme en de ene tijdstempel

seg-995ad516f5ae = Dezelfde scenariobytes, seed en enginebuild geven een byte-identiek <c1/> en <c2/>. Het rapport draagt geen tijdstempel. De enige klokaflezing in de hele crate is die welke <c3/> maakt en die <c4/> in het resultaatdocument stempelt; het rapport toont die stempel en zegt dat het het ene veld is dat een reproductie niet zal evenaren. Voer de run uit zonder <c5/> om dit te vermijden. <c6/> bouwt tweemaal het rapport van elk scenariobestand onder <c7/> (het suitemanifest daargelaten), en voert zes scenario's opnieuw uit (onder andere één campagne van elk van de modi keten, sweep en samenstelling) om dit van begin tot eind te controleren.

seg-8a3fc60a5b54 = Afdrukken naar PDF

seg-201bcec2caa3 = De engine schrijft geen Portable Document Format (PDF)-bestanden. Een PDF-schrijver die de grafieken rendert zou een nieuwe, zware afhankelijkheid betekenen, dus er is geen optie <c1/>. In plaats daarvan bevat <c2/> een afdrukstijlblad: open het in een browser, druk af en kies "Opslaan als PDF".

seg-13f1f294ede1 = Het stijlblad is geschreven voor zowel A4 als US Letter. Het stelt geen papierformaat in (de keuze van het afdrukdialoogvenster geldt), houdt marges van { "15" } mm / { "14" } mm aan die op beide vellen passen, schakelt over op zwart op wit, herhaalt tabelkoppen op elke pagina, voorkomt dat tabelrijen, figuren en kaarten over pagina's worden gesplitst, houdt koppen bij de tekst die volgt, en laat de secties met invoer, resultaten, verificatielabels en reproduceerbaarheid op een nieuwe pagina beginnen. De navigatiebalk is verborgen bij het afdrukken.

seg-a25bb320665d = Het JSON-document

seg-9d9af39942a7 = <c1/> heeft <c2/> en <c3/>, dan <c4/> en <c5/> en één sleutel per sectie: <c6/>, <c7/>, <c8/>, <c9/> (alleen campagnes en sweeps), <c10/>, <c11/>, <c12/>, <c13/> (sectie 3b: <c14/>, <c15/> en <c16/>) en <c17/>. Een lijstsectie heeft <c18/>, <c19/> (de rijen die de paginalimiet wegliet; het resultaatdocument bevat elke waarde) en, wanneer <c20/> leeg is, een <c21/> die zegt waarom. Een waarde behoudt haar ruwe JSON-vorm in <c22/> en de tekst die de pagina toont in <c23/>; een ontbrekende waarde is <c24/> in <c25/> en "no value" in <c26/>.

seg-06cc70ca3601 = <b>Eenheden.</b> Waar noch het eenhedenschema voor velden noch de veldnaam een eenheid geeft, zegt het rapport "not stated" in plaats van te raden. Invoer binnen de ledenscenario's van een campagne wordt alleen opgelost aan het eigen eenhedenblok van de campagne en het achtervoegsel van de veldnaam, zodat meer ervan "not stated" tonen dan in een op zichzelf staande run.

seg-023d5a1fbffc = <b>Oordeel over de kruisverwijzing.</b> Welke matrixrijen een soort gebruikt is een samengestelde tabel, die een test controleert op precies één bestaande rij per item en op dekking van elke ingebouwde soort. Of elke toewijzing de juiste is, is een menselijk oordeel, zoals de keuze van de onafhankelijke referentie in de matrix zelf.

seg-0a7465f4c29a = <b>Limieten.</b> De pagina vermeldt hoogstens { "400" } invoeren, { "150" } scalaire resultaten, { "60" } numerieke kolommen en { "200" } gebeurtenissen; <c1/> telt de rest. Een tabel van meer dan { "24" } rijen in een scenario (een ingelezen reeks) wordt per kolom samengevat.

seg-1fa26ed86bb8 = <c1/> houdt zijn eigen <c2/> en <c3/>; het schrijft dit rapport niet.

seg-1ccdffd389fb = <b>Bindings.</b> De Python- en WebAssembly-bindings houden <c1/> aan, de scorekaart van één pagina; het downloadbare rapport van de playground is zijn eigen pagina (<c2/>). Dit rapport wordt door de CLI geschreven, en Rust-aanroepers kunnen het bouwen met <c3/>. De Model Context Protocol (MCP)-server geeft het terug vanuit zijn tool <c4/>, als JSON of als HTML-pagina; de bestandsnaam van het scenario in zijn reproductieopdracht is die welke de aanroeper doorgeeft (standaard <c5/>), en hij vermeldt geen begeleidend bestand, omdat de server er geen schrijft.

seg-c8ab7b4605cf = <s1>Volgende</s1>Animatie-export
