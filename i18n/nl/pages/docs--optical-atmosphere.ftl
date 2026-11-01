# docs--optical-atmosphere: translations (nl)

seg-6cb7a787ac67 = Referenties

seg-1c6199627b90 = Gegevens

seg-ad856ad710eb = Status

seg-53a7343c076e = Bewering

seg-508588352e96 = Bron: <c1/>

seg-333a1114746a = Optische PNT door de atmosfeer

seg-47118f54f060 = De scenariosoort <c1/> beantwoordt hoe vaak een optische link naar de grond werkt, waarom hij faalt, welke marge of techniek zou helpen, en wat een klok doet terwijl hij uitvalt.

seg-06db0ea8f428 = Kshana is alleen de analysekant. Het voert geen experiment met een optisch grondstation uit en noemt geen meetpartner. De soort is <b>MODELLED</b>: de numerieke berekeningen zijn gecontroleerd aan een onafhankelijk programma, maar er is geen gemeten beschikbaarheidsregistratie vergeleken, en elke invoer voor weer, techniek en klok is een aanname. Het is een adviserende analyse, geen gecertificeerd product voor beschikbaarheid, integriteit of navigatie.

seg-83c16fd89005 = Beide meegeleverde scenario's bevatten ILLUSTRATIVE wolkenklimaten. Het zijn invoer, geen metingen en niet de waarden van enige dataset.

seg-e9dbbd9cfa32 = Eén geseede realisatie van de linkmarge van de locatie 'northern' over { "336" } uur, uit een echte run van engine v{ $version } op scenarios/optical-atmosphere-network.toml (seed { "37" }, een stap van { "600" } s). De marge daalt onder nul tijdens wolkenperioden; in deze trekking is de link { "40.5" } % van de tijd beschikbaar, met { "27" } uitvalperioden en een langste uitval van { "30.7" } uur. De invoer is illustratief, de reeks is één trekking uit het model en niet het klimaat, en wijkt van de statistische beschikbaarheid ({ "37.8" } %) af met de steekproeffout van de trekking. Alleen adviserende analyse: geen gecertificeerd product voor beschikbaarheid, integriteit of navigatie, en geen voorspelling voor enige echte locatie tenzij de klimaatinvoer uit een vermelde dataset komt.

seg-13a52dfbd8d1 = Wat wordt berekend

seg-46fbaf0c6a12 = <b>Verlies in heldere lucht</b> bij de golflengte en elevatie: aerosolextinctie uit de zichtbaarheidswet van Kim, McArthur en Korevaar, exponentieel in de hoogte, plus Rayleigh-verstrooiing en een opgegeven invoer voor gasabsorptie. Dit vervangt de enkele samengebalde <c1/> van <c2/> wanneer een atmosfeer wordt opgegeven. Zonder atmosfeer is het linkbudget bitgelijk aan { "0.36" } (vooraf vastgelegde drempel A5).

seg-929c80326b41 = <b>Turbulentie.</b> Een Hufnagel–Valley-<c1/>-profiel (standaard HV 5/7) geïntegreerd langs het schuine pad geeft de Rytov-variantie voor een vlakke of bolvormige golf, uplink of downlink. Daaruit volgen de scintillatie-index van Andrews–Phillips, de gamma-gamma-parameters, de apertuurmiddelingsfactor voor zwakke turbulentie (Churnside) en de gamma-gamma-fadekans en fademarge. Apertuurmiddeling wordt toegepast door momentmatching: de scintillatie-index wordt geschaald met de middelingsfactor en beide logvarianties worden herschaald om hem exact te geven.

seg-3fb7be7ef95d = <b>Wolken.</b> Het wolkenklimaat van een locatie heeft de vorm van ITU-R P.840: een kans op bewolking en, gegeven bewolking, een lognormale vloeibaarwaterkolom. P.840 levert de hoeveelheid wolken. De demping is de optische diepte volgens geometrische optica <c1/>, omdat de eigen dempingswet van P.840 een microgolfwet is en niet geldt bij { "0.85" } tot { "1.55" } µm, waar druppels veel groter zijn dan de golflengte.

seg-18311430b2a3 = <b>Beschikbaarheid</b> van een locatie: de link is beschikbaar zolang de fades door wolken en turbulentie samen binnen de marge blijven die na het verlies in heldere lucht overblijft. Wolken en turbulentie worden als onafhankelijk beschouwd. Het rapport geeft de beschikbaarheid, de beschikbaarheid bij heldere hemel, het <b>plafond</b> dat geen marge kan opheffen (een optische link kan geen dikke bewolking passeren), en de extra marge die voor elke beschikbaarheidsdoelstelling nodig is, of <c1/> als de doelstelling boven het plafond ligt.

seg-885e06050a9a = <b>Uitval.</b> Duren zijn lognormaal met een opgegeven gemiddelde en spreiding. Het rapport geeft de uitval per jaar, de duur bij de mediaan, het 90e en het 99e percentiel, en de kans en het aandeel van de uitvaltijd voorbij { "1" }, { "6" }, { "24" } en { "72" } uur.

seg-4b9b6fefad6b = <b>Locatiediversiteit.</b> De beste <c1/> locaties gecombineerd met onafhankelijk weer (<c2/>) en met weer dat met de afstand correleert: paarcorrelatie <c3/>, gecombineerd in een eenfactor-Gaussische copula. Bij <c4/> is het de onafhankelijke unie, en bij volledige correlatie de beste enkele locatie.

seg-b85681b9fd93 = <b>Technieken.</b> Elke <c1/> is een wat-als: een nieuwe golflengte (het budget bij heldere hemel, het verlies in heldere lucht en de apertuurmiddeling worden opnieuw geëvalueerd), een nieuwe ontvangstapertuur, een opgegeven fractionele scintillatievermindering (adaptieve optica) en extra marge. Het resultaat is de winst in beschikbaarheid ten opzichte van de basislijn op dezelfde locatie. Kshana modelleert geen adaptieve-opticalus, dus de winsten zijn invoer.

seg-a59d07280524 = <b>Tijdsynchronisatie en afstandsmeting door een uitval.</b> Elke uitvalduur wordt afgebeeld via de gesloten-vormvariantie van het uitlopen van het holdovermodel van de klok, voor de klokken die in <c1/> staan. Het rapport geeft de fout in tijdsynchronisatie en afstandsmeting bij opgegeven uitvalduren, de holdover tot de drempel voor tijdsynchronisatie, het aandeel uitvalperioden daarbinnen, en de beschikbaarheid van tijdsynchronisatie <c2/>. De machtswetondergrenzen per klasse zijn de gesynthetiseerde van de holdovermodule, dus een krappe drempel wordt bepaald door die aangenomen ondergrens, zoals <c3/> vermeldt.

seg-59774a9e8685 = Linkmarge tegenover tijd ({ "0.38" })

seg-fcfdd2e9e0ad = Een <c1/>-tabel (<c2/> tot { "8760" }, <c3/>, <c4/>) voegt aan elke locatie één <b>geseede realisatie</b> van het bovenstaande model toe: de zichtlijn wisselt tussen heldere perioden (exponentieel, gemiddelde zo gekozen dat het aandeel tijd in wolken de opgegeven <c5/> is) en wolkenuitval (lognormaal, het opgegeven gemiddelde en de opgegeven spreiding); elke uitval trekt één vloeibaarwaterkolom uit het opgegeven klimaat en houdt die vast; elke stap trekt één gamma-gamma-scintillatiesample (onafhankelijk van stap tot stap, een opgegeven vereenvoudiging) en de terminal staat op het doel met de opgegeven richtbeschikbaarheid. De marge van de stap is het fadebudget min de fades door wolken en scintillatie, en de link is beschikbaar wanneer de marge niet negatief is en de terminal op het doel staat, de voorwaarde die de beschikbaarheidsintegraal gebruikt.

seg-ad2c4ff087a8 = Het is een trekking, niet het klimaat: haar beschikbaarheid wijkt van de statistische af met de steekproeffout van de trekking, en de eerste episode wordt in zijn geheel getrokken. Het resultaat bevat <c1/>, <c2/>, <c3/> en <c4/> per stap en een <c5/>-blok (beschikbaarheid, wolkenfractie, aantal uitvalperioden, langste uitval). <b>MODELLED</b>; de controles (<c6/>, drempels vastgelegd in <c7/> vóór de eerste run) zijn determinisme en consistentie met de opgegeven cijfers, geen externe onafhankelijke referentie. Zonder de tabel wordt niets geschreven en is het resultaat het document van { "0.37" }.

seg-4a9b065bdb28 = Scenariovelden

seg-4ba70196355d = Alle velden op het hoogste niveau zijn optioneel. Een kale <c1/> voert drie illustratieve locaties uit. Zie de twee meegeleverde bestanden voor elke sleutel: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Verificatiestatus

seg-6598ced4218b = Rytov-variantie, scintillatie-index, gamma-gamma-fadekans, apertuurmiddelingsfactor, wolken en optische diepte in heldere lucht worden berekend zoals de opgegeven formules zeggen

seg-2442f7529fbb = MODELLED rij; numerieke berekeningen gecontroleerd aan een onafhankelijk mpmath-programma

seg-19854ea8437a = drempels A1 tot en met A3, alle gehaald (<c1/>)

seg-b91d83aea0e8 = Linkbudget en bestaande beschikbaarheid ongewijzigd zonder atmosfeer

seg-2192262e26c1 = gehaald

seg-a71527a271df = drempel A5, bitgelijk over { "1,000" } parametersets

seg-0db8cf4c2ee0 = Diversiteitsgrenzen en monotonie; holdoverkoppeling bitexact

seg-2a5c5967540c = gehaald (identiteiten)

seg-4b0e5e3ac558 = drempels A4, A6

seg-f842c688e29a = Beschikbaarheid van een echte locatie, echte scintillatie, echte wolkenstatistiek

seg-9a0ead7b1670 = niet geclaimd

seg-9cc220190772 = geen externe onafhankelijke referentie is vergeleken

seg-7c5050135e2b = De referentie controleert de implementatie van de opgegeven formules, niet de atmosfeer, dus geen rij is VALIDATED. Valideringswaarden van ITU-R worden niet gebruikt en worden buiten de repository gehouden.

seg-73dcf0f31fe9 = Er wordt geen weerdataset meegeleverd. Invoer voor het wolkenklimaat van een echte locatie zou uit een openbare dataset komen (Copernicus ERA5, NASA MODIS of ISCCP); de licentie van elke dataset moet vóór gebruik worden gelezen en vastgelegd, en ruwe data worden tijdens de test opgehaald met een vastgepinde SHA-256. De ene klimatologie die al in de repository staat, is de tabel van Cavazzani et al. voor heldere nachten die <c1/> gebruikt.

seg-44d197f3209c = Andrews en Phillips, <em>Laser Beam Propagation through Random Media</em>, 2nd ed. (Rytov-variantie, scintillatie-index, gamma-gamma-parameters).

seg-9e9a33d44013 = Kim, McArthur en Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (zichtbaarheidswet).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (apertuurmiddelingsfactor).

seg-309c70f2f4f8 = ITU-R P.840 (statistiek van vloeibaar wolkenwater), P.1814 en P.1817 (methoden voor free-space optics).

seg-83b30e1ca261 = <s1>Vorige</s1>Bewijspakketten

seg-1474b58fb35a = <s1>Volgende</s1>Slottijdsynchronisatie

seg-50f25bceca3c = <s1>Vorige</s1>Datapartners en bevorderende rijen
