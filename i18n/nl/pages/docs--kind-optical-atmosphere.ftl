# docs--kind-optical-atmosphere: translations (nl)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-72ad48275ebe = Scenariosoort van de engine v{ $version }, familie <a1>Optische PNT</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-a97755cb13eb = Familiepagina: <a1>Optische PNT</a1>

seg-d4e4da22fadb = Bron: <c1/>

seg-deb0a932a76f = <c1/> (scenariosoort)

seg-a878d9be65b7 = MODELLED optische PNT door de atmosfeer: voor een optische verbinding en een reeks grondstations met vermelde wolkenklimaten rapporteert zij het golflengte- en elevatieafhankelijke verlies in heldere lucht (zichtbaarheidswet van Kim plus Rayleigh), de Hufnagel-Valley-turbulentietoestand (Rytov-variantie, scintillatie-index, gamma-gamma-parameters, aperture-middeling), de door het weer bepaalde beschikbaarheid ten opzichte van de verbindingsmarge (optische wolkendiepte uit een lognormaal klimaat van vloeibaar water, extinctie volgens de geometrische optica, onafhankelijke turbulentiefading), de verbindingsmarge die nodig is voor doelbeschikbaarheden, de verdeling van de uitvalduur, de groei van de tijdsynchronisatie- en afstandsmetingsfout per uitval via het klok-holdovermodel, afstandsgecorreleerde beschikbaarheid met locatiediversiteit, en wat-als-winsten voor verbeteringstechnieken (golflengte, ontvangstapertuur, scintillatiereductie met adaptieve optiek, extra marge). VALIDATED als implementatie van de vermelde formules aan de hand van een onafhankelijk mpmath-orakel: Rytov-variantie, scintillatie-index, gamma-gamma-fadekans, aperture-middelingsfactor, optische diepte van wolken en heldere lucht. MODELLED: elke weer-, techniek- en klokinvoer en de aannamen van onafhankelijkheid en copula; er is geen gemeten beschikbaarheidsregistratie vergeleken. Adviserende analyse, geen gecertificeerd beschikbaarheids- of navigatieproduct.

seg-c443d8d3e4ce = Eén run van <c1/> vat samen als: optical-atmosphere: { "1550" } nm bij { "30" } graden elevatie, marge { "19.2" } dB vóór de atmosfeer; beste locatie zuid { "74.66" } %; netwerk van 3 locaties { "92.72" } % bij onafhankelijk / { "91.62" } % bij gecorreleerd weer (MODELLED, adviserend)

seg-e466ecbd4e6d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Het voorbeeld <c1/> stelt onder meer in:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Resultaatlabel (van de engine): MODELLED — optische PNT door de atmosfeer: extinctie in heldere lucht (zichtbaarheidswet van Kim + Rayleigh), optische wolkendiepte uit een vermeld klimaat van vloeibaar water (hoeveelheid volgens P.840, extinctie volgens de geometrische optica), Hufnagel-Valley-turbulentie met gamma-gamma-fading en aperture-middeling, beschikbaarheid ten opzichte van de

seg-4e2b759aff17 = De grafiek die de engine schrijft voor scenarios/optical-atmosphere-network.toml, soort optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley Cn2, geïntegreerd langs een schuin pad voor de Rytov-variantie van vlakke en bolvormige golven (uplink en downlink), de scintillatie-index van Andrews-Phillips en de gamma-gamma-parameters, de gamma-gamma-fadekans en fademarge, Tests: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Beschikbaarheid van een optische verbinding ten opzichte van een vermelde verbindingsmarge uit een lognormaal klimaat van vloeibaar wolkenwater (hoeveelheid volgens ITU-R P.840, extinctie volgens de geometrische optica) en de onafhankelijke gamma-gamma-turbulentiefading, de verbindingsmarge die nodig is voor doel Tests: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> De verdeling van de uitvalduur van een optische locatie, gekoppeld aan de variantie van het uitlopen in gesloten vorm van het klok-holdovermodel: fout in tijdsynchronisatie en afstandsmeting bij vermelde uitvalkwantielen, de holdover tot een drempel voor tijdsynchronisatie, het aandeel uitvallen en Tests: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> Een opt-in tabel <c1/> (duur, stap, seed) laat de soort <c2/> ook per locatie één gezaaide realisatie van het vermelde locatiemodel door de tijd schrijven: wolkenepisoden (heldere periodes exponentieel, wolkenuitvallen lognormaal Tests: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley Cn2, geïntegreerd langs een schuin pad voor de Rytov-variantie van vlakke en bolvormige golven (uplink en downlink), de scintillatie-index van Andrews-Phillips en de gamma-gamma-parameters, de scintillatie-ind. Onafhankelijke referentie (ExternalDataset): de numerieke resultaten zijn vergeleken met een onafhankelijk programma (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } met { "30" } cijfers, tanh-sinh-kwadratuur op de oorspronkelijke hoogtevariabele en Bessel-K-gamma-gammadichtheden) dat geen code met Kshana deelt, onder drempels die zijn vastgelegd voordat er enige implementatie bestond (xval/optical-atmosphere/PREREGISTRATION.md). WAAROM MODELLED: dat orakel evalueert dezelfde gepubliceerde formules en controleert dus de im

seg-4af9bc99ef29 = <b>MODELLED</b> Beschikbaarheid van een optische verbinding ten opzichte van een vermelde verbindingsmarge uit een lognormaal klimaat van vloeibaar wolkenwater (hoeveelheid volgens ITU-R P.840, extinctie volgens de geometrische optica) en . Onafhankelijke referentie (InternalConsistency): interne consistentie: gesloten-vormgrenzen en monotoniciteit van het diversiteitsmodel, de gesloten vorm van het wolkenplafond en de lognormale uitvalidentiteiten. GEEN externe referentie wordt geclaimd en er is er geen vergeleken: er is geen gemeten registratie van de beschikbaarheid van optische grondstations of van wolkenvrije zichtlijnen gebruikt. WAAROM MODELLED: het wolkenklimaat (kans op wolken, mediaan en spreiding van de vloeibaarwaterkolom, uitvalduur),

seg-b3abf6cbeba4 = <b>MODELLED</b> De verdeling van de uitvalduur van een optische locatie, gekoppeld aan de variantie van het uitlopen in gesloten vorm van het klok-holdovermodel: fout in tijdsynchronisatie en afstandsmeting bij vermelde uit. Onafhankelijke referentie (InternalConsistency): interne consistentie met de holdovermodule, bit voor bit; GEEN externe referentie wordt geclaimd. De PSD's van de klasse zijn de gesynthetiseerde vloeren voor lange tau die de holdovermodule al bevat, dus de cijfers erven haar vermelde voorbehoud dat holdover tot een strakke drempel wordt bepaald door de aangenomen rode-ruisvloer en niet door de aangehaalde Allan-deviatie. De uitvalduren zijn een lognormaal model met vermelde parameters, geen gemeten c

seg-c4772a9e1a26 = MODELLED — optische PNT door de atmosfeer: extinctie in heldere lucht (zichtbaarheidswet van Kim + Rayleigh), optische wolkendiepte uit een vermeld klimaat van vloeibaar water (hoeveelheid volgens P.840, extinctie volgens de geometrische optica), Hufnagel-Valley-turbulentie met gamma-gamma-fading en aperture-middeling, beschikbaarheid ten opzichte van de verbindingsmarge, uitvalduren gekoppeld aan klok-holdover en afstandsgecorreleerde locatiediversiteit. De numerieke resultaten worden gecontroleerd (resultaat <c1/>)

seg-32c6524b0baf = MODELLED optische PNT door de atmosfeer: voor een optische verbinding en een reeks grondstations met vermelde wolkenklimaten rapporteert zij het golflengte- en elevatieafhankelijke verlies in heldere lucht (zichtbaarheidswet van Kim plus Rayleigh), de Hufnagel-Valley-turbulentietoestand (Rytov-variantie, scintillatie-index, gamma-gamma-parameters, aperture-middeling), de door het weer bepaalde beschikbaarheid ten opzichte van de verbindingsmarge (optische wolkendiepte uit (soortencatalogus (<c1/>))

seg-2c7493ee5042 = MODELLED: elke weer-, techniek- en klokinvoer en de aannamen van onafhankelijkheid en copula; er is geen gemeten beschikbaarheidsregistratie vergeleken. (soortencatalogus (<c1/>))

seg-b4402211e3fe = Optische PNT door de atmosfeer: drie ILLUSTRATIVE grondstations (een bewolktere noordelijke locatie, een gemiddelde centrale locatie en een helderdere zuidelijke locatie) die een optische LEO-terminal zien op { "30" } graden elevatie bij { "1550" } nm. De wolkenklimaten zijn vermelde invoer, geen metingen en niet de waarden van een dataset, dus elke beschikbaarheid hieronder is MODELLED. De run rapporteert per locatie het verlies in heldere lucht, de Hufnagel-Valley-turbulentietoestand, t (opmerking in het scenariobestand, regels { "1" } tot { "8" })

seg-384f5c73cdf9 = Eén gezaaide realisatie van de verbinding van elke locatie door de tijd (MODELLED; een trekking uit het model hierboven, niet het klimaat). Als dit ontbreekt, wordt er geen reeks geschreven en is het resultaat het { "0.37" }-document. (opmerking in het scenariobestand, regels { "78" } tot { "79" })

seg-c75fa5787bd4 = Numeriek werk voor de optische atmosfeer langs een schuin pad: Rytov-variantie, scintillatie, gamma-gamma-fadekans, aperture-middeling, optische diepte van wolken en heldere lucht is MODELLED, niet getoetst: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Door het weer bepaalde beschikbaarheid van optische grondstations en afstandsgecorreleerde locatiediversiteit is MODELLED, niet getoetst: gecontroleerd aan de hand van de eigen gesloten-vormidentiteit of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Themapagina: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Vorige</s1>oem-interop

seg-ef0a779c300c = <s1>Volgende</s1>orbit

seg-9fd02351d844 = ms
