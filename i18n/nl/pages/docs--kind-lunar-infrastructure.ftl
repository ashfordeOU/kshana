# docs--kind-lunar-infrastructure: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-d1beb62cf742 = { "6" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-e821670a8b55 = Bron: <c1/>

seg-56953faa67ae = <c1/> (scenariosoort)

seg-d0fb90f506c9 = MODELLED onderzoeken naar de baan en het oppervlak van de maan als navigatie- en geodetische infrastructuur, vijf onderzoeken achter één soort, gekozen door <c1/>: od-consistency (baanbepaling aan boord met Earth-GNSS in een NRHO of ELFO tegenover onafhankelijke radiometrische baanbepaling vanaf de grond, beoordeeld aan hun eigen covarianties over een geseede Monte Carlo), carrier-phase (gezamenlijke dubbelverschil-draaggolffase tussen oppervlak en orbiter en oplossing van de geheeltallige ambiguïteit met LAMBDA), frame-coestimation (een oppervlaktestation en orbiters toegevoegd aan afstandsmetingen van aardstations voor het zevenparameter-datum van het maanstelsel), space-tie (GNSS, VLBI en laser ranging op één ruimtevaartuig, precisie van de stelselkoppeling tegenover de fout van de lokale koppeling) en geodesy-sensitivity (Fisher-informatie van de Love-getallen h2, k2, l2 van de maan en de fysieke libratie uit laser ranging, orbitertracking, een gravimeter op het oppervlak en een klok op het oppervlak). Een beperkt driebolenmodel met vermelde vereenvoudigingen; de numerieke methoden worden gecontroleerd aan onafhankelijke programma's en niets wordt vergeleken met een meting van een maangrootheid.

seg-5753b7552559 = Eén run van <c1/> vat zich samen als: lunar-infrastructure space-tie: { "4" } sweeppunten op { "1" } bogen; laser-vs-GNSS x translatiesigma { "1.0363" } m bij de geregistreerde lokale koppeling

seg-f2594b18e718 = Verplichte velden: <c1/>

seg-4875c29c517c = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Het voorbeeld <c1/> stelt onder meer in:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Resultaatlabel (dat van de engine): MODELLED — een beperkt driebolenmodel (aarde en maan als puntmassa's, geen zon, geen harmonischen van het maanzwaartekrachtveld) met vermelde vereenvoudigingen en ILLUSTRATIVE invoer, gelabeld met hun openbare bronnen. De numerieke methoden worden gecontroleerd aan onafhankelijke programma's; niets wordt vergeleken met een meting van een maan

seg-f3b4a80a739b = geen plot: het voorbeeld schrijft geen grafiek

seg-35a4a7a25561 = <b>MODELLED</b> Baanbepaling in een bijna-rechtlijnige halobaan (of een elliptische bevroren baan) uit twee onafhankelijke datasoorten: Earth-GNSS-pseudoafstanden ontvangen aan boord . Onafhankelijke referentie (ReferenceImpl): Een onafhankelijk scipy/numpy-programma integreert dezelfde variatievergelijkingen (drempel O1). Niets wordt vergeleken met een meting van een maanbaan. De onafhankelijke referentie controleert de numerieke methoden van vermelde formules, niet de fysica, dus de rij blijft MODELLED. Beperkt driebolenmodel: geen zon, geen maanharmonischen, de aardrotatieas langs de baannormaal, ILLUSTRATIVE ontvanger- en stationsinvoer.

seg-32455bf5f804 = <b>MODELLED</b> Enkelvoudig verschil tussen ontvangers van Earth-GNSS-draaggolffase en code bij een station op het maanoppervlak en een orbiter, met het klokverschil per epoch weggeprofileerd. Onafhankelijke referentie (ReferenceImpl): Een onafhankelijke numpy-oplossing van dezelfde normaalvergelijkingen uit de geëxporteerde rijen (Q3) en een brute-force opsomming van gehele getallen (Q4). Er wordt geen GNSS- of maandraaggolffasemeting mee vergeleken. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Fisher-informatie van het zevenparameter-datum van het maanstelsel uit laser ranging vanaf aardstations naar alleen de vijf reflectoren en met afstandsmetingen van orbiter naar oppervlaktestation. Onafhankelijke referentie (ReferenceImpl): Een onafhankelijk eindig verschil in numpy van het voorwaartse model (F2). Niets wordt vergeleken met echte oplossingen voor het maanstelsel. De factor is voorwaardelijk aan de aangenomen bekende baan en de afstandssigma van { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao-precisie van de translatie-, schaal- en rotatieverschuivingen tussen technieken in de stelsels van GNSS, VLBI en laser ranging wanneer één ruimtevaartuig alles draagt. Onafhankelijke referentie (ReferenceImpl): Een onafhankelijk gestapeld numpy-stelsel waarin de positieonbekenden met expliciete Schur-complementen zijn geëlimineerd (T3). Er worden geen gegevens van GRASP, Genesis of enige andere missie mee vergeleken. MODELLED.

seg-743d78806f6a = MODELLED — een beperkt driebolenmodel (aarde en maan als puntmassa's, geen zon, geen harmonischen van het maanzwaartekrachtveld) met vermelde vereenvoudigingen en ILLUSTRATIVE invoer, gelabeld met hun openbare bronnen. De numerieke methoden worden gecontroleerd aan onafhankelijke programma's; niets wordt vergeleken met een meting van een maangrootheid, en niets hier is een uitspraak over enige missie of enig systeem. Niet gelieerd aan of onderschreven door enige organisatie. Adviso (resultaat <c1/>)

seg-da35c5298311 = MODELLED onderzoeken naar de baan en het oppervlak van de maan als navigatie- en geodetische infrastructuur, vijf onderzoeken achter één soort, gekozen door <c1/>: od-consistency (baanbepaling aan boord met Earth-GNSS in een NRHO of ELFO tegenover onafhankelijke radiometrische baanbepaling vanaf de grond, beoordeeld aan hun eigen covarianties over een geseede Monte Carlo), carrier-phase (gezamenlijke dubbelverschil-draaggolffase tussen oppervlak en orbiter en geheeltallige am (soortencatalogus (<c2/>))

seg-4658f67623b5 = Kshana-scenario lunar-infrastructure: space-tie. MODELLED; het ontwerp, de invoer en de drempels liggen vast in xval/lunar-infra/PREREGISTRATION.md (vastgelegd vóór enige run). ILLUSTRATIVE invoer is daar gelabeld met zijn openbare bronnen. (commentaar in het scenariobestand, regels { "1" } tot { "3" })

seg-f7257c25f137 = Baanbepaling bij de maan: Earth-GNSS tegenover radiometrie vanaf de grond is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Oplossing van de draaggolffase-ambiguïteit bij de maan: oppervlak en orbiter is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Gezamenlijke schatting van het maanstelsel: oppervlaktestations en orbiters is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Precisie van de stelselkoppeling via space-tie: gelijk geplaatste GNSS, VLBI en laser ranging is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Onderwerppagina: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Vorige</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Volgende</s1>lunar-integrity
