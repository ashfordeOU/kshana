# docs--concepts: translations (nl)

seg-501402fc366f = Klok-holdover

seg-9c0eb89a2fbe = Pakket

seg-41b3740e1db9 = Bron: <c1/>

seg-8ab3fd09812d = Concepten — een begrijpelijke inleiding

seg-0f86d0a815d2 = Deze pagina legt uit <em>wat { -brand } doet en waarom</em>, te beginnen bij nul en opbouwend naar de fysica. Voor het eerste deel is geen voorkennis nodig; de latere secties voegen de exacte relaties voor specialisten toe. Voor definities van afzonderlijke woorden zie de <a1>woordenlijst</a1>.

seg-34f76bad58cb = { "1" }. Het probleem in één alinea

seg-45c0199e2224 = Bijna alles wat moet weten <em>waar het is</em> of <em>hoe laat het is</em> — telefoons, vliegtuigen, schepen, satellieten, elektriciteitsnetten, financiële systemen — steunt op signalen van navigatiesatellieten (GPS (Global Positioning System) en zijn verwanten, samen <b>GNSS</b> (global navigation satellite system)). Die signalen zijn zwak en gaan makkelijk verloren: ze worden gejamd, geblokkeerd of zijn in de ruimte simpelweg buiten bereik. Wanneer dat gebeurt, moet een systeem <b>op eigen kracht doorgaan</b> met behulp van sensoren aan boord — een klok om de tijd vast te houden en inertiële sensoren om beweging te volgen. De vraag die { -brand } beantwoordt, is eenvoudig te stellen en moeilijk te meten: <b>hoe lang en hoe goed kan het doorgaan?</b>

seg-ea1895772e76 = { "2" }. Waarom "kwantum"?

seg-dd6871645f37 = Sensoren aan boord driften. Een klok loopt langzaam achter; een inertiële sensor raakt langzaam het spoor van de positie kwijt. <b>Kwantum</b>klokken en -inertiële sensoren driften <em>veel langzamer</em> dan de klassieke onderdelen die nu worden gebruikt — zodat een voertuig een veel langere GNSS-uitval kan overbruggen en binnen zijn nauwkeurigheidsgrenzen blijft. Dat voordeel is de hele belofte van kwantum-PNT (positiebepaling, navigatie en tijdsynchronisatie). Maar "veel langzamer" moet worden omgezet in <b>getallen</b>: hoeveel extra minuten holdover? hoeveel meter minder drift? Die getallen bepalen of een kwantumlading de kosten, massa en het vermogen waard is.

seg-a5d9dc0fb159 = { "3" }. Wat { -brand } feitelijk doet

seg-cb3a35ba696f = { -brand } is een <b>simulator</b>, geen hardware en geen hardwareontwerp. Het:

seg-cb7fdaf6738b = Neemt een <b>scenario</b> — een tijdlijn met een stuk GNSS-uitval en de gepubliceerde prestatiecijfers van een sensor.

seg-701c8c6d0e55 = Laat een <b>sensorfoutmodel</b> die tijdlijn doorlopen: zolang GNSS beschikbaar is, wordt het model gestuurd naar de referentie; tijdens de uitval loopt het vrij, en bouwt het fout op precies zoals de fysica dat voorschrijft.

seg-bc68e3d54e4c = <b>Scoort</b> het resultaat aan de hand van operationele kwaliteitsmaten (hoe groot de fout wordt, hoe lang die binnen de specificatie blijft, hoe betrouwbaar de schatting is).

seg-32d31a9beb71 = Doet dit voor de sensorpakketten <b>tweemaal</b> — één keer voor een kwantumsensor, één keer voor zijn klassieke tegenhanger — op <em>hetzelfde</em> scenario, zodat de vergelijking appels met appels vergelijkt.

seg-07d8c6eb84e9 = Belangrijk: de engine weet niets van "kwantum" tegenover "klassiek". Beide zijn slechts foutmodellen met andere (gepubliceerde, geciteerde) parameters. Het verschil dat u in de uitvoer ziet, is het verschil in de gepubliceerde fysica — niets is met de hand afgesteld ten gunste van de ene kant.

seg-e20a7d3f32dc = { "4" }. De vier bouwstenen ("pakketten")

seg-638b8d451550 = Sensor

seg-f891ee876b96 = Wat het beantwoordt

seg-d1b122c389d4 = atoomklok

seg-768230c2eb02 = Hoe lang blijft de <em>tijd</em> nauwkeurig zonder GNSS?

seg-029de6b99be0 = Inertiële koppelnavigatie

seg-f66f2d7b1d6d = versnellingsmeter (+ gyroscoop)

seg-e067a035f656 = Hoe snel driftt de <em>positie</em> zonder GNSS?

seg-9ef8f99ca6e4 = Tijdoverdracht

seg-1267f82791f9 = optische / RF-verbinding (radiofrequentie)

seg-6f240700790d = Hoe nauwkeurig kunnen twee vaartuigen tijd delen?

seg-90be2a6a29b1 = Hybride fusie

seg-780cf1f1127e = alles hierboven

seg-6080a05ace19 = Houdt de <em>gecombineerde</em> PNT-oplossing stand?

seg-3f74a708a746 = Het hybride pakket is de clou: een navigatieoplossing heeft <em>zowel</em> goede tijd <em>als</em> goede positie nodig. Het laat zien dat een optische tijdverbinding zelfs een bescheiden klok vergrendeld kan houden — waardoor de <b>inertiële</b> sensor de zwakste schakel wordt, en precies daar loont een kwantumversnellingsmeter.

seg-5f55bb0fd7c5 = Voorbij de vier pakketten

seg-60191a2cd150 = Dezelfde engine draait veel meer scenario<em>soorten</em>; <c1/> toont ze allemaal. Ze reiken voorbij de sensoren tot de signalen en de geometrie waarvan de sensoren afhangen:

seg-995ed414d83d = <b>Waar de satellieten zijn</b> — baanpropagatie, constellatieontwerp rond de aarde, de maan of een ander hemellichaam, en de posities van de lichamen van het zonnestelsel.

seg-bc8abce2a748 = <b>Wat de ontvanger kan zien</b> — een azimutafhankelijke skyline (een straat, een kade, een fjord) boven het elevatiemasker, en de hemelgeometrie die overblijft: de zichtbare satellieten, hun dilution of precision en de foutellips.

seg-b7a2c252c41c = <b>Wat de ontvanger hoort</b> — het L-bandspectrum onder een jammer, jamming en spoofing, en verlies van lock in de trackinglussen.

seg-f354743045c4 = <b>Of het antwoord te vertrouwen is</b> — integriteitsbewaking (RAIM, receiver autonomous integrity monitoring, en de geavanceerde vorm ARAIM) met beschermingsniveaus.

seg-69aa01a29a49 = <b>Alternatieven voor GNSS</b> — zwaartekracht- en terreinkaartmatching, en positiebepaling, navigatie en tijdsynchronisatie vanuit satellieten in een lage baan om de aarde (LEO), van het signaalontwerp via het linkbudget en het navigatiebericht tot de positiebepaling.

seg-297c98214b5b = <b>Tijdsynchronisatie voor netwerken</b> — telecom-holdover getoetst aan de internationale maskers, en slottiming voor schema's op basis van tijdindexen.

seg-7eba216a9bf2 = <b>Voorbij de aarde</b> — maantijd en referentiestelsels, servicevolumes op de maan en navigatie via Marsrelais.

seg-b796f49570ed = <b>Veel runs tegelijk</b> — campagnes koppelen soorten aan elkaar op één tijdlijn, doorlopen een parameter of draaien een Monte Carlo-ensemble.

seg-ef7f4e025018 = { "5" }. Eerlijkheid door opzet

seg-65fb8703baf9 = Een simulator is alleen nuttig als u hem kunt vertrouwen. { -brand } is zo gebouwd dat dat kan:

seg-de8fd160db6d = <b>Elke parameter wordt aangehaald.</b> Elk sensorcijfer heeft een <c1/>-tekenreeks die het gegevensblad of de publicatie noemt waaruit het komt. Geen anonieme constanten.

seg-09d5cd11b127 = <b>Elk model wordt getoetst aan een leerboekrelatie,</b> niet alleen aan zichzelf — de Allan-deviatie van de gesimuleerde klok moet bijvoorbeeld overeenkomen met het gepubliceerde stabiliteitscijfer, en de inertiële drift met de standaardwet voor foutgroei. Een mogelijkheid heet pas <em>getoetst aan een onafhankelijke externe referentie</em> wanneer een onafhankelijke externe referentie (een echte dataset, een onafhankelijke implementatie of gepubliceerde referentievectoren) het eens is; de rest is <em>berekend uit een model</em>, en de <a1>verificatiematrix</a1> zegt wat wat is.

seg-ccb5b2fe93c4 = Maturiteit is gelabeld.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> markeert elk effect als <c1/>, <c2/> of <c3/>, en stelt ronduit dat de cijfers van optische klokken <em>laboratorium- of ruimtedoelcijfers</em> zijn — er is nog nooit een optische strontiumklok gevlogen.

seg-de463596fcdb = <b>Resultaten zijn tot op de bit reproduceerbaar:</b> hetzelfde scenario, dezelfde seed en dezelfde versie geven op hetzelfde platform altijd het identieke antwoord; tussen besturingssystemen komen de cijfers tot { "1e-6" } relatief overeen (zie <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. De fysica, voor specialisten

seg-8fc6db9faf83 = De relaties die { -brand } implementeert en test (volledige details en toleranties in <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Klok-holdover.</b> Tweetoestandsmodel voor fase en frequentie met witte frequentiemodulatie (witte FM, spectrale vermogensdichtheid <c1/>), random-walk-FM (<c2/>), flicker-FM (een som van logaritmisch verdeelde Ornstein–Uhlenbeck-processen, gekalibreerd op een vlakke Allan-ondergrens) en deterministische veroudering. Getoetst aan een onafhankelijke externe referentie met de overlappende Allan-deviatie tegen de gepubliceerde <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Inertiële koppelnavigatie.</b> Resterende bias van de versnellingsmeter → <c1/>; random walk van de snelheid → <c2/>; optionele gyroscoopbias en angular random walk leveren een kantelfout op die zwaartekracht (<c3/>) in horizontale versnelling koppelt (Groves).

seg-d59595d00f0a = <b>Tijdoverdracht.</b> Witte timingjitter → synchronisatienauwkeurigheid → eenrichtingsafstandsmeting (<c1/>, { "1" } ps ≈ { "0.3" } mm); het steekproefgemiddelde middelt als <c2/>.

seg-0eb7a53fb4a6 = <b>Fusie en integriteit.</b> Een Kalman-filter met twee toestanden waarvan de procesruis overeenkomt met het referentiemodel; tijdens coasting groeit de fasefoutvariantie precies tot <c1/> — de analytische holdoverrelatie — en voedt de 1-σ-grens de kwaliteitsmaat Integriteit.

seg-80daa7cb8641 = <b>Geometrie.</b> Keplerse tweelichamenpropagatie (optioneel met seculiere J2) of SGP4 (Simplified General Perturbations { "4" }) uit echte two-line element sets, Walker-constellaties en zichtbaarheid in rechte lijn (aardbedekking + elevatiemasker) leiden de GNSS-beschikbaarheid af uit de baangeometrie in plaats van uit met de hand opgestelde vensters.

seg-4ce4c6b79b93 = { "7" }. Waar u daarna heen kunt

seg-7c8344a26230 = Werk het door: de <a1>tutorials</a1> — drie uitgewerkte voorbeelden + opdrachten met opklimmende moeilijkheid.

seg-277f1b435cf6 = Draai het: zie de snelstart in de <a1>README</a1>.

seg-c349981bd4f1 = Begrijp de structuur: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Controleer wat wel en niet is getoetst aan een onafhankelijke externe referentie: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Zoek een term op: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Vorige</s1>Overzicht

seg-2f14e84bfc99 = <s1>Volgende</s1>Woordenlijst
