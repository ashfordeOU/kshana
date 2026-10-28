# docs--kinds-gps-denied-alternative-pnt: translations (nl)

seg-b03d56f501c3 = Type

seg-f496b7f4c63a = GPS-denied gecombineerde navigator op zwaartekracht + magnetisme + terrein: drie scalaire veldkanalen die per waypoint worden gefuseerd voor een scherpere positiebepaling van de drift (lagere CRLB) dan met één enkel veld.

seg-498b1aea3770 = De grafiek die de engine schrijft voor scenarios/combined-altpnt.toml, kind combined-altpnt

seg-c8f93431680a = MODELLED conflictveerkracht van gelaagde PNT (P7): een gebruiker in een betwiste omgeving zet meerdere PNT-lagen in (open-service-GNSS, breedband-GNSS, een geauthenticeerde constellatie, een augmentatierelay), elk met een basisbeschikbaarheid, een 1σ-nauwkeurigheid en een kwetsbaarheid voor uitval per vector voor de gedeelde jamming-/spoofingdreiging. Een op intensiteit gesweepte GESEEDE Monte-Carlo laat elke laag uitvallen met kans clamp(vulnerability·intensity·vector_weight,{ "0,1" }), fuseert de overlevenden volgens de gesloten-vorm-inverse-variantieregel σ_fused=(Σ 1/σ_i²)^(−1/2), en rapporteert de kans op totaal verlies (alle lagen uitgevallen), de mediane gefuseerde fout en statistieken per laag voor bruikbaarheid/uitval tegenover intensiteit. De kopveerkrachtverhouding (kans op totaal verlies bij één laag tegenover gelaagd) komt uit op ~7x onder de aanname van ONAFHANKELIJKHEID; een gaussiaanse-copula-sweep met één factor en gecorreleerde uitval toont daarna dat die ~7x naar { "1" } instort naarmate de uitvalcorrelatie toeneemt (correlatie ondermijnt gelaagdheid). Een blok met priorgevoeligheid laat de kopwaarde variëren over de BEGRONDE kwetsbaarheidspriors via de mcda-tornado + een Dirichlet-herverdeling van dreigingsinspanning + percentielbetrouwbaarheidsintervallen. VALIDATED kern: het totale verlies uit Monte-Carlo convergeert naar het gesloten-vorm-onafhankelijke product Π_i p_deny_i (binnen de Monte-Carlo-standaardfout bij vaste seed en grote N); de inverse-variantiefusie is een gesloten-vorm-identiteit; bij ρ={ "0" } reduceert de copula tot het onafhankelijke model en behoudt elke ρ de marginale uitvalfrequentie van elke laag. MODELLED: de groottes van kwetsbaarheid/beschikbaarheid/nauwkeurigheid per laag zijn begronde maar gemodelleerde invoer (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zie conflict_threat_params), en de specifieke grootte van ~7x en de vorm van de curve verhouding-versus-correlatie volgen uit die parametrisering. Een uitsplitsing van overleving per vector in § { "4.2" } splitst daarna de gedeelde RF-dreiging in de vier benoemde vectoren (jamming/spoofing/kinetisch/cyber) en rapporteert van elke vector de curve van geleidelijke achteruitgang van bruikbare PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: de geseede Monte-Carlo per laag convergeert naar die gesloten vorm; jamming is de scherpste vector voor de gecorreleerde RF-basislijn en de RF-immune inertiële laag is de beslissende overlever. Geen gecertificeerd product voor navigatiebeschikbaarheid.

seg-4dd2bcc206db = De grafiek die de engine schrijft voor scenarios/conflict-resilience.toml, kind conflict-resilience

seg-9a58a7b09423 = Navigatie met zwaartekrachtkaartmatching zonder GPS: een koudeatoomgravimeter herstelt een constante INS-drift uit de reeks zwaartekrachtanomalieën waar hij doorheen vliegt.

seg-c42d90057e9f = De grafiek die de engine schrijft voor scenarios/gravity-map-nav.toml, soort gravity-map

seg-0d7bf5a4f07e = GPS-ontzegde terreingebonden navigatie (TERCOM/SITAN): een radar-/barometrische hoogtemeter vergelijkt het hoogteprofiel van het terrein met een DEM in SRTM-stijl om de INS-drift te herstellen.

seg-c5e33c7122e2 = De grafiek die de engine schrijft voor scenarios/terrain-nav.toml, soort terrain-nav

seg-6bdc150ab25b = GPS-ontzegde sequentiële (recursieve) terreingebonden navigatie: een deeltjesfilter draait het terreinmatch-meetmodel epoch voor epoch (SITAN als lopend filter), zodat een in de tijd variërende INS-drift langs het spoor wordt gevolgd, waar de batch-soort terrain-nav slechts één constante offset herstelt.

seg-4aca87f022dc = De grafiek die de engine schrijft voor scenarios/terrain-slam.toml, soort terrain-slam

seg-4e31c8daf798 = Register

seg-efd15cff3d32 = MODELLED (resultaatlabel)

seg-9d9aeff4f2ee = Bron: <c1/>

seg-d9fdaf3208ca = Alternatieve PNT bij GPS-uitval (familie van scenariosoorten)

seg-9fde6af9e09f = { "5" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-0d3b170b9fbc = Themapagina's: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Voer er een uit: <c1/>. Alle families: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Alternatieve PNT bij GPS-uitval

seg-cff60d8c17d2 = Sequentiële (recursieve) terreingebaseerde navigatie bij GPS-uitval: een deeltjesfilter voert het terreinvergelijkingsmeetmodel epoch na epoch uit (SITAN als lopend filter) zodat een tijdvariërende INS-drift wordt tr

seg-9d8f69b51742 = MODELLED veerkracht van gelaagde PNT bij conflict (P7): een gebruiker in een betwiste omgeving beschikt over meerdere PNT-lagen (open-service-GNSS, breedband-GNSS, een geauthenticeerde constellatie, een augmentatierelais), elk met

seg-28486745bb43 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Optioneel: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Optioneel: <c13/>, <c14/>, <c15/>.

seg-3ec7b38184b7 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Optioneel: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>terrain-slam</a1>.

seg-c5124441822e = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Optioneel: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Vorige</s1>GNSS-metingen, positiebepaling en integriteit

seg-54b45b00a2f0 = <s1>Volgende</s1>Traagheids-, fusie- en kwantumsensoren
