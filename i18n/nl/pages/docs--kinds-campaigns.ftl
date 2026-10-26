# docs--kinds-campaigns: translations (nl)

seg-b03d56f501c3 = Type

seg-a07990e776cb = Campaign: bestaande scenariokinds samengesteld tot één run, waarbij elk getal uit een echte run van het genoemde kind wordt gelezen. Vier secties, in willekeurige combinatie. PHASES: een geketende missie op één gedeelde tijdlijn -- elke fase draait één of meer scenario's (bijvoorbeeld jamming, dan spoofing, dan een klok in holdover met een traagheidsnavigatiesysteem dat ernaast doorvaart, dan een integriteitsalarm, dan herstel), hun uitvoer wordt via een voorinstelling per kind of via expliciete resultaatpaden in benoemde kanalen gelezen (klokfout tegenover zijn bewaakgrens, draaggolf-ruisdichtheidsverhouding tegenover de volgvloer, beschermingsniveau tegenover de alarmgrens, positiefout, volgende satellieten, alarmvlaggen) en met een zero-order hold herbemonsterd op een gemeenschappelijk raster, met fasegrenzen en gebeurtenissen; de toestand wordt doorgegeven door carry (een kanaal gaat door vanaf de eindwaarde van de vorige fase), handoff (een getal van een vorige fase wordt in het scenario van deze fase geschreven) en end_at (een fase eindigt op een tijdstip dat een run berekende, zoals de detectietijd van een spoofingmonitor). SWEEP: een raster over één tot drie gepunte scenariosleutels van elk kind (een geheeltallig segment indexeert een array van tabellen, zoals in system.2.sisre_m), met metrieken gelezen via resultaatpad en, bij meer dan één run, een geseede Monte-Carlo-ensemble bij elk knooppunt. MONTE_CARLO: realisatie k draait op base_seed + k; elke metriek rapporteert gemiddelde, standaardafwijking, nearest-rank-percentielen 5/50/95 en een bootstrap-betrouwbaarheidsinterval van { "95" }% op het gemiddelde met vaste seed. COMPOSE: meerdere scenario's onder gedeelde waarden (het vermogen en de positie van één jammer geschreven in een maritieme en een wegontvanger), met een gecombineerde beste/slechtste samenvatting. Het resultaat draagt een campagnehash, een digest over elk lidresultaat en een units-vermelding voor elk uitgegeven getal; de interoperabiliteitsexports schrijven elk lidscenario dat geometrie heeft als eigen bestandsset. Compositie-identiteiten worden getest: een campagne met één fase reproduceert de zelfstandige run bit voor bit, een ensemble met vaste seed is byte-stabiel, en bij een klok met witte frequentieruis valt het ensemblegemiddelde binnen het gerapporteerde interval met een spreiding die overeenkomt met sqrt(q_wf * tau). MODELLED: de additieve carry en de zero-order hold zijn modelleringskeuzes, en elke fase draagt het label van het kind dat haar draaide.

seg-b2c7cd1f9712 = De grafiek die de engine schrijft voor scenarios/campaign-sweep-jammer-power.toml, kind campaign

seg-ea93f81fa08b = Bron: <c1/>

seg-7f8e8af56bc0 = Campagnes (familie van scenariosoorten)

seg-c8012ee549ea = { "1" } scenariosoort van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-09ed7c4e175c = Themapagina's: <a1>CAMPAIGNS</a1>. Voer er een uit: <c1/>. Alle families: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Campagnes

seg-4e31c8daf798 = Register

seg-b2016159c9d0 = Campagne: bestaande scenariosoorten samengesteld tot één run, waarbij elk getal wordt gelezen uit een echte run van de genoemde soort.

seg-25148644a262 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Vorige</s1>Gedragscode

seg-cdf23ced49bd = <s1>Volgende</s1>Klokken, tijdsynchronisatie en holdover
