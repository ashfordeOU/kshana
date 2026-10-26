# docs--tutorial-first-orbit: translations (nl)

seg-51ae9468b92a = Wat dit scenario is

seg-08f3fdc9252a = Lees de samenvatting van één regel

seg-def5271a207d = Wat de test vastlegt

seg-e5f926d1055b = Valkuilen en eenheden

seg-cb457294fc53 = Hoe nu verder

seg-dcb2d0b170c1 = Bron: <c1/>

seg-f57d8b38bf08 = Tutorial { "1" } — Mijn eerste baan: waar zijn de GPS-satellieten

seg-1b9e1178555d = <c1/> · <b>Scenario:</b> <c2/> (leerversie: <a1><c3/></a1>) · <b>Moeilijkheid:</b> beginner · <b>~{ "15" } min</b>

seg-d065731294a1 = Aan het einde hebt u de <em>echte</em> operationele GPS-constellatie gepropageerd, de beschikbaarheid en geometrie ervan gelezen en een tabel geëxporteerd met waar elke satelliet werkelijk in de ruimte is — en u weet dat die tabel is getoetst aan een externe referentie en niet aan zichzelf.

seg-b07bb365235d = GPS-satellieten (Global Positioning System) vertellen een gebruiker <em>waar hij is</em> en <em>hoe laat het is</em>. Daarvoor moet u eerst weten <b>waar de satellieten zijn</b> en <b>hoeveel ervan een gebruiker kan zien</b>. Dat is geometrie, en geometrie bepaalt de ondergrens voor hoe nauwkeurig u gepositioneerd kunt worden (de dilution of precision, DOP). Deze tutorial:

seg-dec5079e7715 = neemt een echte momentopname van de GPS-constellatie uit Celestrak <c1/> (2021-07-28, { "30" } satellieten, echte two-line elements, TLE's),

seg-693859c435d8 = propageert elke satelliet met het getoetste SGP4/SDP4-model (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = bepaalt bij elke tijdstap welke satellieten een gebruiker in een lage baan om de aarde kan zien (zichtlijn, bedekking door de aarde en een elevatiemasker van { "5" }°),

seg-605c40b73e96 = zet die geometrie om in een <b>PDOP</b> (position dilution of precision) en een <b>positienauwkeurigheid</b>, en

seg-356e96d219b5 = exporteert de werkelijke aardgebonden (Earth-centred, Earth-fixed, ECEF) posities van de satellieten naar een SP3-bestand (Standard Product { "3" }, het formaat voor nauwkeurige banen van de International GNSS Service, IGS; GNSS is Global Navigation Satellite System).

seg-ff1666fe175e = De ruggengraat is: <b>TLE → SGP4-propagatie → ECEF per epoch → zichtbaarheid → aantal zichtbare satellieten → PDOP → positie-sigma = PDOP · σ_UERE</b>, waarbij σ_UERE de user equivalent range error is (de 1-σ-afstandsfout per satelliet).

seg-379da723ae57 = Of open de <a1>Studio in de browser</a1> en kies het baanscenario.

seg-441743833f1e = De deterministische run (seed = { "17" }) drukt af:

seg-918a30fea48a = Veld voor veld:

seg-375fad797dcf = <b><c1/></b> — de scenariohash van 12 tekens. Hij is een vingerafdruk van de exacte invoer (seed, drempels, modelparameters, het TLE-blok). Verander een invoer en dit verandert; houd ze gelijk en u reproduceert de run bit voor bit. Dezelfde hash staat in de voettekst van de grafiek en in het resultaatbestand in JSON (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> — van de { "361" } tijdstappen heeft de gebruiker bij { "345" } ervan een bruikbare positiebepaling ({ "95.6" } %). De run is een passage van { "12" } h ({ "43,200" } s) met een stap van { "120" } s.

seg-a500c0473784 = <b><c1/></b> — de beste (laagste) position dilution of precision over de passage. PDOP dicht bij { "1" } is uitstekende geometrie; hoe lager, hoe beter.

seg-98a24f0170d2 = <b><c1/></b> — de beste positienauwkeurigheid: <b>positie-sigma = PDOP · σ_UERE</b>. In dit scenario geldt <c2/>, dus de twee getallen zijn hier <em>numeriek gelijk</em> — maar de regel is PDOP × UERE, <b>niet</b> “positie = PDOP.” Met een UERE van { "3" } m zou het positie-sigma ~{ "3.2" } m zijn. (Zie de valkuil aan het einde.)

seg-410081c6dcab = De klokcijfers (<c1/>, <c2/>, <c3/>, <c4/>) komen er bij omdat het baanpakket ook een klok meeneemt door de passage; ze staan centraal in <a1>Tutorial { "2" }</a1>, niet in deze. (<c5/> geeft <c6/> omdat er geen aanval is geconfigureerd.)

seg-95ccef0d94ae = Het geometrieblok in de JSON bevat de onderliggende getallen:

seg-89cb7db9b9eb = Waar zijn de satellieten? (de uitkomst)

seg-81678afa0cee = De geometrie is goed <em>omdat</em> de satellieten werkelijk in de GPS-schil zitten. Bewijs het — exporteer hun aardgebonden posities:

seg-1452dfac9e06 = De eerste drie satellieten bij de eerste samplestap, ECEF in km (het SP3-bestand heeft een vierde kolom, voor de klok, geschreven als de markering “geen waarde” { "999999.999999" }):

seg-4fd0f95da0cf = Neem de geocentrische straal van PG01:

seg-cb02d7c01561 = De niet-circulaire onafhankelijke referentie: is dit echt een GPS-baan?

seg-a7c478360464 = Een tutorial die de engine tegen zichzelf controleert, bewijst niets. Hier is het externe, <em>niet-circulaire</em> anker voor elke bewering hierboven.

seg-eec62069a957 = <b>{ "1" }. De satellieten zitten op de echte GPS-schil in de middelhoge baan om de aarde (medium Earth orbit, MEO).</b> De nominale halve lange as van GPS is <b>a = { "26,560" } km</b>, hoogte ≈ { "20,180" } km boven de gemiddelde aardstraal van { "6,378" } km (IS-GPS-200, de GPS-interfacespecificatie; de GPS Standard Positioning Service (SPS) Performance Standard, Amerikaanse ministerie van Defensie (DoD); Misra & Enge, <em>Global Positioning System</em>, 2e druk). De momentane straal van PG01 van <b>{ "26,480.9" } km</b> ligt op enkele honderden km van <c1/> — precies wat de echte excentriciteit van GPS (~{ "0.005" }–{ "0.02" }) oplevert. De test <c2/> toetst <c3/> aan deze gepubliceerde <c4/>, die <b>extern is aan { -brand }</b>.

seg-a052774de08f = <b>{ "2" }. De passagelengte is één GPS-omloop.</b> De derde wet van Kepler geeft de periode <c1/> met <c2/> en <c3/> (World Geodetic System { "1984" }, WGS-84; technisch rapport NIMA TR8350.2 van de National Imagery and Mapping Agency): <c4/>, een halve siderische dag. De scenarioduur van { "43,200" } s (“~één GPS-omloop”) komt daarmee overeen op minder dan { "0.3" } % na, en het grondspoor van GPS herhaalt zich elke siderische dag (twee omlopen), volgens IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. De gepropageerde posities zijn getoetst aan een externe referentie, niet alleen intern consistent.</b> De SGP4/SDP4-propagator die deze ECEF-tabel produceerde, komt overeen met <b>alle { "666" } verificatievectoren van AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 met een slechtste geval van { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) en komt tot op sub-micron overeen met de onafhankelijke crate <c3/>. De tabel die u hebt geëxporteerd, is dus gecontroleerd aan een externe referentie-implementatie en niet aan de eigen rekenkunde van { -brand }.

seg-652ec3b3d3b8 = <b>Een opmerking over de SP3-datums.</b> De SP3-epochkop toont een plaatsvervangende kalenderdatum (2000-01-01); de propagatie loopt in werkelijkheid vanaf de eigen epoch van elke TLE ({ "2021" }). Lees de tabel als “ECEF-posities bij de eerste samplestap,” niet als “op { "1" } jan { "2000" }.”

seg-74dcb96a27a9 = <c1/> maakt van elk getal hierboven een CI-contract:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (omdat <c4/>), <c5/>, en de samenvatting bevat <c6/>.

seg-241d75b1502b = <c1/> — de straal van PG01 ligt in de band van de GPS-schil, gecontroleerd aan de gepubliceerde <c2/>.

seg-34328f4f148b = Als de engine ooit stopt met het produceren van een echte GPS-schil, wordt de build rood.

seg-3c23c11911cb = <b>Positie-sigma is PDOP × UERE, niet PDOP.</b> De twee zijn gelijk <em>alleen doordat</em> hier <c1/> geldt. Verander de UERE en ze gaan uiteen.

seg-6bb2f31c15dc = <b>De tijdsynchronisatiecijfers zijn in nanoseconden</b>, het positiecijfer in meters. Haal ze niet door elkaar.

seg-5bc68d0c144d = <b><c1/> is op het raster gekwantiseerd</b> (een ondergrens bij de stap van het tijdraster). In deze passage heeft de gebruiker vrijwel altijd een positiebepaling, dus de holdover is { "0" } s (geen uitval om doorheen te lopen) — dat is het <em>goede</em> geval.

seg-9c36a5c64af5 = Scherp het elevatiemasker (<c1/>) aan of verruim het en zie de beschikbaarheid veranderen — dat is een oefening van Tier-2.

seg-b0222934237e = Gebruik een verse TLE-momentopname met <c1/> (Tier-2 “gebruik verse gegevens”).

seg-e487166204f8 = Ga verder met <a1>Tutorial { "2" } — Klok-holdover</a1>, waar het GNSS-signaal <em>wordt weggenomen</em> en de klok aan boord moet doorlopen.

seg-795315608752 = <s1>Vorige</s1>Tutorials

seg-97ca5a3cc77e = <s1>Volgende</s1>{ "2" } · Klok-holdover
