# docs--lunar-reference-station: translations (nl)

seg-f37311ad7ef0 = Uitvoer

seg-f63dd3d7aad4 = Bron

seg-9872e31ebd72 = Bronnen

seg-38afa54b0306 = Bron: <c1/>

seg-e8ee3794bac6 = <b>MODELLED.</b> Onder de vermelde aannames (de constellatie, haar signal-in-space-fout, de inmeetnauwkeurigheid van het station, de correctielatentie en de kwantisatie van de link, elk een invoer met een label van de openbare bron of als ILLUSTRATIVE) geeft het model de onderstaande cijfers. Zij zijn <b>geen</b> uitspraak over de prestaties van enig echt systeem. { -brand } is <b>niet</b> verbonden aan of onderschreven door enig agentschap en doet geen uitspraak over TRL of heritage. Alleen adviserend.

seg-22eb5bd00092 = Doel

seg-25678ae41147 = Openbaar materiaal beschrijft een referentiestation bij de zuidpool van de maan dat een navigatiedienst voor de maan bewaakt, lokale differentiële correcties berekent, een maantijdreferentie op een atoomklok houdt en een laserretroreflector en een VLBI-zender draagt voor het referentiestelsel van de maan (de klasse die openbaar is beschreven voor het NovaMoon-concept van ESA; bronnen hieronder). { -brand } modelleert elk onderdeel al afzonderlijk. Deze studie voegt ze samen tot één reproduceerbare, open analyse van wat zo'n station onder openbare aannames zou kunnen doen, en registreert haar vooraf, zodat zij kan worden gescoord tegen gepubliceerde resultaten en uiteindelijk tegen vluchtresultaten.

seg-6ac04119fc30 = of <c1/> vanuit Python, WebAssembly of <c2/> van de MCP-server met <c3/>.

seg-671e68d341fd = Dekkings- en nauwkeurigheidskaart (<c1/>)

seg-f034e2642dab = Voor een differentieel referentiestation op een bekende locatie bij de zuidpool: in elk gebruikerspunt op een ringraster van { "80" }° Z tot de pool en over het gebied, over een dag aan epochs en Monte Carlo-trials, de percentielen van de gecorrigeerde en ongecorrigeerde positiefout (3D, horizontaal, verticaal), beschikbaarheid met een reden voor elke onbeschikbare epoch, dekking tegen een drempel die vóór de run is vastgelegd, DO-229E-beschermingsniveaus, de dekkingsstraal per azimutsector en het budget van de correctielink bij het station en in het slechtste punt. Geen nieuwe natuurkunde: het doorloopt de geteste functies van <c1/> en reduceert exact tot die soort bij één punt, één epoch en één trial.

seg-94058315dfe4 = Invoer

seg-7670cf4ceda3 = Standaard

seg-98b42925ad5c = Constellatie (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) of <c6/>

seg-bfdd053b2611 = de meegeleverde set van LCNS-klasse

seg-389db26524b4 = ILLUSTRATIVE in de meegeleverde standaard; het voorbeeld met openbare bronnen stelt vier satellieten en de periode van { "24" } uur uit S2 en S4 in, waarbij de elementenset ILLUSTRATIVE blijft (geen bron vermeldt haar)

seg-91231bdcc599 = ILLUSTRATIVE

seg-6b9d48431e4b = Station (<c1/>, <c2/>, <c3/>)

seg-fcdb2f3ac330 = { "89" }° Z, { "0" }°, { "0" } m

seg-f32dcb376b51 = { "0.30" } m

seg-93d78578585f = ILLUSTRATIVE (de meegeleverde toewijzing voor frame-realisatie, zelf MODELLED)

seg-59286c0377ce = <c1/>, <c2/>, of <c3/> met <c4/>

seg-fe90a6f490f9 = { "100" } m, { "30" } m (zichtlijn-SISE { "65" } m)

seg-9a432ef35cac = ILLUSTRATIVE in de meegeleverde standaard; het voorbeeld met openbare bronnen stelt <c1/> = { "10" } / { "1.96" } m in uit S4 p8

seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bits

seg-311a924e2133 = Raster (<c1/>, <c2/>) of <c3/>

seg-49a2022b83c0 = { "80" }° Z, { "1" }° ({ "346" } punten)

seg-e945f5407b12 = het studiegebied

seg-fed48a6c31be = Tijd (<c1/>, <c2/>, <c3/>), <c4/>

seg-0fec404c8c7c = { "0" } s, één dag, { "600" } s, { "200" }

seg-d35d88b0753b = { "20" } m bij p95 in de meegeleverde standaard ({ "1" } m in het voorbeeld met openbare bronnen)

seg-fa7858b14f89 = vóór de run vastgelegd; { "20" } m is ILLUSTRATIVE, afgestemd op de illustratieve fouten van de standaard

seg-a6ee5e2a8b61 = { "10" } m

seg-329ad585cd9b = ILLUSTRATIVE: er bestaat geen openbare waarde

seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

seg-c530b459b0ef = Elk numeriek veld draagt een eenheid en een herkomstklasse in het blok <c1/> van het resultaat (gecontroleerd door <c2/>). Het gebiedsblok: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> per azimutsector van { "30" }°; <c15/> per punt; en <c16/>.

seg-4aa380258574 = Wat de controles wel en niet kunnen zeggen

seg-112cb6bffc03 = <c1/>: de reductie tot <c2/>, de ondergrenzen voor nulbasislijn en inmeting, monotoniciteit, redenen van onbeschikbaarheid, determinisme en de werkbewaking. Zij tonen aan dat de sweep het model is dat zij zegt te doorlopen.

seg-695ed4f23f3c = <c1/>: een onafhankelijke numpy-herberekening van de rekenkunde op geëxporteerde gevallen, vooraf geregistreerd voordat zij draaide. Posities en percentielen haalden hun drempels; de stationscorrecties misten de hunne door afrondingen in dubbele precisie (vastgelegd, met de getallen, in <c2/>).

seg-be6ecf79d22c = Geen van beide controleert het model. Het foutenmodel, de eerste-orde-decorrelatie, de modellen voor inmeting, veroudering en kwantisatie en elke drempelwaarde zijn van dit project zelf of ILLUSTRATIVE.

seg-d6f194e28401 = Horizonmaskers van het terrein

seg-9ad9b163a3a0 = MODELLED. Een optionele sectie <c1/> (<c2/>) geeft het station en elk gebruikerspunt een eigen, van het azimut afhankelijke horizon, in het skyline-tabelformaat van { "0.36" } (rijen <c3/>, lineair in azimut met omslag bij { "360" }°). Een satelliet telt op een locatie mee als hij zowel <c4/> als de horizon op zijn azimut vrijmaakt; een epoch waarin de horizon in een punt minder dan vier satellieten overlaat, terwijl het vlakke masker er vier geeft, wordt gemeld als <c5/> (<c6/> behoudt zijn vlakke betekenis). Twee bronnen, gecombineerd als hun puntsgewijs maximum wanneer beide zijn opgegeven:

seg-4d55808bc002 = een opgegeven profiel, <c1/> of <c2/> (toegepast op elk gebruikerspunt), elk met een verplicht label <c3/>;

seg-d6fda9939caa = een horizon die met ray-marching over een DEM van het poolgebied is bepaald (<c1/>): grote cirkels van de maanbol met exacte kromming, vanaf een opgegeven masthoogte (standaard { "2" } m), elke <c2/> (standaard { "1" }°), tot <c3/> (standaard { "150" } km) of de rand van het raster. De repository bevat een uitsnede van het publiekdomeinproduct LRO LOLA <c4/> voor de poolgebieden, { "5" } × { "5" } blokgemiddelde herbemonsterd naar { "1200" } m en ongeveer ±{ "420" } km vanaf de pool (<c5/>: bron-URL, SHA-256, licentie, stappen voor uitsnede en herbemonstering);

seg-292c49f3739a = of, in plaats van <c1/>, een DEM-tegel in breedte/lengte (<c2/>) in het tekstformaat <c3/> (een kop <c4/>, dan de hoogten in meters boven de gemiddelde bol, rij voor rij), op dezelfde manier met ray-marching verwerkt, waarbij de breedtestap de standaardstap bepaalt. Het rapport geeft het pad, de SHA-256 en de uitgestrektheid van de tegel terug (<c5/>). Een tegel die uit de meegeleverde uitsnede is herbemonsterd, geeft het station de eigen horizon van de uitsnede tot op { "0.22" }° (<c6/>). Er wordt geen tegel meegeleverd.

seg-34ed85bb9ac0 = Dezelfde maskers gelden voor het raster van <c1/> (<c2/>, <c3/> en <c4/>; een rasterpunt buiten de DEM behoudt het vlakke masker en wordt geteld). Zonder de sectie is elk document byte-identiek aan een run zonder haar.

seg-8d07f0227ab8 = Controles: de ray march reproduceert horizons in gesloten vorm (de dip van een kale bol, een krater in een plateau vanuit het midden en daarbuiten, een gerasterde kegel tegen de analytische kegel); de meegeleverde uitsnede is georiënteerd als de bron (de bodems van Shackleton en Haworth laag, het Malapert-massief hoog); een onafhankelijke numpy-raycast op de uitsnede, vooraf geregistreerd (<c1/>), komt tot op { "5.5e-10" } graad overeen op vijf locaties, wat de rekenkunde controleert, niet het terrein. Er is geen gepubliceerd cijfer voor een poolhorizon of belichting gereproduceerd, dus de rij blijft MODELLED (registerrij "Lunar terrain horizon masks from a stated profile or a polar DEM").

seg-10a1d62ab5cc = <c1/> voert de meegeleverde invoer uit op een raster van { "2" }° met { "100" } trials en de DEM-horizon op elke locatie. De stationslocatie ({ "89" }° Z, { "0" }° O) heeft een hoogste horizon van ongeveer { "4.0" }°, onder het masker van { "5" }°, dus bij het station is het terrein niet bindend; in de gebruikerspunten is het oppervlaktegewogen gemiddelde van de hoogste horizon van elk punt { "9.7" }° en de grootste { "26.3" }°. Vergeleken met dezelfde invoer met het vlakke masker stijgt de gecorrigeerde p95 3D-fout van het gebied van { "16.3" } m naar { "18.6" } m en de grootste HPL van { "480" } m naar { "62" } km. De beschikbaarheid van het gebied stijgt van { "91.9" } % naar { "93.0" } %: een epoch is onbeschikbaar wanneer een punt een satelliet gebruikt die het station niet ziet, en een horizon die die satelliet voor het punt verbergt, kan de epoch beschikbaar maken.

seg-6d18d8a8dc78 = <b>Terrein en horizonmaskering: aangepakt in { "0.36" }, met beperkingen.</b> Horizonmaskers per locatie uit een opgegeven profiel of de meegeleverde uitsnede van de LOLA-DEM worden gemodelleerd (hierboven). Wat overblijft: de meegeleverde uitsnede heeft { "1200" } m per pixel, dus reliëf onder ongeveer een kilometer wordt weggevlakt en blokgemiddelden verlagen scherpe pieken; een straal die de uitsnede verlaat (ongeveer { "420" } km van de pool) eindigt daar; er is geen diffractie, geen multipad door terrein en geen gedeeltelijke obstructie; locatieposities voor afstandsmeting blijven op de gemiddelde bol op de opgegeven hoogtes (de DEM bepaalt alleen de horizon); de horizon is niet getoetst aan een extern cijfer. De exportlocatie per satelliet van <c1/> wordt gemaskeerd als een rasterpunt: met een sectie <c2/> draagt elke exportrij <c3/> en het rapport de horizon van de locatie (<c4/>); de tellingen van antenne-in-bundel tellen nog steeds elke link die het vlakke masker vrijmaakt.

seg-b58b3ff1ef20 = <b>Multipad en ontvangerhardware: aangepakt in { "0.36" } als opt-in, met beperkingen.</b> Een sectie <c1/> (<c2/>) voegt van de elevatie afhankelijk multipad <c3/> toe bij de gebruiker en het station (de functionele vorm van DO-229; op de Maan is elke waarde ILLUSTRATIVE), met het multipad van het station optioneel eerste-orde-Gauss-Markov over epochs, vroeg-min-laat-DLL-codeluis uit C/N0 en biases tussen kanalen per kanaal. Wat overblijft: variatie van faseprofiel en groepsvertraging van de antenne wordt niet gemodelleerd; geen maanmeting legt de multipadwaarden vast; het budgetblok van de correctielink bevat de ontvangertermen niet.

seg-677252c2d3e5 = Groei van de efemeridefout over de latentie: aangepakt in { "0.36" } als opt-in, met beperkingen.

seg-3af08edab1cc = <c1/> voegt een lineaire groei van de uitgezonden baanfout met de leeftijd toe (afstand 1-sigma <c2/>), bovenop de herprojectie van de bevroren fout; lineaire groei is de eerste-orde-term van een gepropageerde toestandsfout (gecontroleerd tot { "1" } % bij { "600" } s tegen de meegeleverde tweelichamenpropagatie). Wat overblijft: geen openbare bron geeft een groeisnelheid voor de maan (ILLUSTRATIVE); geen structuur in langs-het-spoor-/radiale richting; het budgetblok van de correctielink gebruikt het bevroren model. Het K5-addendum (<c3/>, alleen vooraf geregistreerd) voert K5 uit bij { "0.001" }, { "0.01" } en { "0.1" } m/s: het faalt in elk geval ({ "369.8" } m, { "2315" } m, { "22797" } m tegen een drempel van { "1.5" } m), zoals vóór de run is vermeld.

seg-5bba9be34cad = <b>Oplossingsstijl (filter, hoogtebeperking, drie satellieten): een opt-in in { "0.36" }, met beperkingen.</b> Een sectie <c1/> (<c2/>) voegt een hoogte-pseudometing toe, daarmee een minimum van drie satellieten, en een gewogen kleinste-kwadratenvenster voor een statische gebruiker over epochs (een gedeelde positie, een klok per epoch), dat in de plaats van een filter komt. Wat overblijft: het behandelt de fouten van de epochs als onafhankelijk, dus het middelt sneller weg dan in de tijd gecorreleerde fouten zouden doen; het is alleen voor een statische gebruiker; er is geen dynamisch filter, draaggolffase of ambiguïteitsoplossing; de casetrace (<c3/>) toont de momentopnamerekenkunde. Het addendum met gepubliceerde beweringen bij deze modus is <c4/> (alleen vooraf geregistreerd). Met een hoogtebeperking van { "1" } m, drie satellieten en een venster van 6 epochs (ILLUSTRATIVE instellingen) daalt de gecorrigeerde p95 3D-fout van R300 van { "280.6" } m naar { "2.11" } m (horizontaal { "0.90" } m, niet gescoord); K1 tot K5 falen nog steeds en K6 slaagt, { "1" } van { "6" } zoals in de vastgelegde run. De onafhankelijkheidsaanname van het venster begunstigt het.

seg-4f8274f839a7 = Vergelijking met gepubliceerde beweringen

seg-82391b00e1bc = MODELLED. Een vergelijking van dit model, uitgevoerd onder de openbare aannames, met de beweringen die de bronnen doen. Het is geen uitspraak over de prestaties van enig echt systeem.

seg-fc27b4012f02 = Bronnen S1 tot S5 (titel, URL, ophaaldatum, SHA-256, licentie): <c1/>.

seg-d866653008e1 = Elke numerieke bewering, geciteerd met haar pagina en vermelde aannames en ingedeeld als vergelijkbaar, gedeeltelijk vergelijkbaar of niet vergelijkbaar: <c1/>. Geen bewering is volledig vergelijkbaar, omdat geen bron een percentiel of de baanelementen van de satellieten vermeldt.

seg-50535c58d3cf = Drempels, gevallen en invoer, alleen vastgelegd vóór de run (revisie { "2" }, 05bf9a19), en de vastgelegde run: <c1/>. De bevinding is vastgepind in <c2/>.

seg-069a652c402e = drempel

seg-d6120708c062 = bewering (bronnen)

seg-5b480535b54b = dit model

seg-6231a005ccc9 = oordeel

seg-45dc6ff5d546 = één station geeft submeternauwkeurigheid over de hele cirkel van { "300" } km rond de zuidpool (S1, S2, S3)

seg-4da98cf6180b = dekking { "0.00" }

seg-70a79ec95bf4 = mislukt

seg-cd0e9021aaa3 = hetzelfde, cirkel van { "600" } km (S2 p10, S3 p23)

seg-ef9f2ee31c52 = submeter met codecorrecties (S1, S2)

seg-9f4e2b6991e8 = gecorrigeerde p95 3D { "280.6" } m

seg-ac3c99ec0d15 = <= { "1.5" } m

seg-1b720f1677cc = "decimeter level" uit pseudorange-correcties (S3 p22, S5 p5)

seg-ffa1c831a14f = { "280.6" } m

seg-70368d910820 = <= { "0.15" } m

seg-786f940b345e = mislukt (kon niet slagen bij de codeluis van { "0.30" } m van de bronnen)

seg-da761dde1cae = submeter behouden bij { "600" } s latentie (S2 p16)

seg-2a9db96bd87f = { "293.0" } m

seg-021336eb5623 = dezelfde nauwkeurigheid van { "10" } km tot { "500" } km basislijn (S2 p17)

seg-62190343777c = verhouding { "1.39" }

seg-7a33a168b020 = geslaagd

seg-e666f1eb7a59 = { "1" } van { "6" } drempels wordt gehaald. De oorzaak is de geometrie. Geen bron publiceert de baanelementen van de constellatie. Met de ILLUSTRATIVE meegeleverde elementen delen een gebruiker en het station maar in { "8" } % ({ "300" } km) en { "6" } % ({ "600" } km) van de epochs vier satellieten boven { "5" } graden, bij bijna singuliere geometrie: de ongecorrigeerde p95 is { "3.8" } km, waar de bronnen < { "10" } m noemen. De eigen simulaties van de bronnen gebruikten een filter, een hoogtebeperking en drie satellieten in gemeenschappelijk zicht, wat dit momentopnamemodel niet heeft. De run reproduceert de beweringen daarom niet op die elementen, en zij is geen bewijs dat de beweringen onjuist zijn. Dat K6 slaagt is een verhouding van twee door geometrie gedomineerde cijfers en zegt niets over decorrelatie. Een gepubliceerde set van de elementen van de constellatie zou onder dezelfde drempels worden gescoord als een tweede, gedateerde run.

seg-1da5fcf7bbf5 = Vooraf geregistreerde voorspelling

seg-4ea806a57380 = Een vooraf geregistreerde voorspelling, bevroren op commit <c1/> met de invoer uit openbare bronnen, met haar scoringsprotocol: <a1><c2/></a1>. Het is een voorspelling, geen validatie, en elk cijfer erin wordt gedomineerd door de niet-gepubliceerde elementenset van de constellatie van vier satellieten (de gebruikte elementen zijn ILLUSTRATIVE): over het gebied van { "80" } graden Z, beschikbaarheid { "8.2" } %, gecorrigeerde p95 3D { "280" } m, ongecorrigeerd { "3.8" } km. MODELLED; <c3/> faalt als een bevroren byte verschuift.

seg-e6aef34d5023 = Tijdlaboratorium van het station

seg-4ef12bffa7c4 = Of de miniRAFS van het station, bijgestuurd naar LTC en daarna vrijlopend of opnieuw bijgestuurd, binnen { "1" }, { "10" } en { "100" } ns blijft: het optionele blok <c1/> van <c2/> (<c3/>). De miniRAFS bereikt { "1" } ns na { "2.8" } s, { "10" } ns na { "377" } s en { "100" } ns na { "10.5" } uur; het doel op nanosecondeniveau van de bron wordt geciteerd, niet overgenomen. MODELLED. Model, uitvoer, de tabel met tijd tot drempel voor vier klokklassen en de vergelijking met de bronnen: <a1><c4/></a1>.

seg-69ddf7ea8fcb = Geodesie van het station

seg-717a5c91387b = Hoeveel één retroreflector en één VLBI-baken op de stationslocatie het maandatum van het referentiestelsel aanscherpen ten opzichte van de vijf gearchiveerde retroreflectorarrays: de optionele invoer <c1/> en <c2/> van <c3/> (<c4/> en <c5/>). Cramér-Rao-grenzen voor een gereduceerde parameterset op een ILLUSTRATIVE schema en locatie: de 1-sigma van de translatienorm daalt van { "0.0185" } m naar { "0.0102" } m (verhouding { "0.551" }), de schaal van { "0.00178" } naar { "0.00063" } ppm. MODELLED. Methode, kanttekeningen (een locatie bij de zuidpool ziet de Aarde laag of helemaal niet) en de volledige Helmert-tabel: <a1><c6/></a1>.

seg-8a873848459b = Elke bron met titel, identificatie en uitgever, met ophaaldatum en licentie. URL's, SHA-256-hashes en opmerkingen over waar de bronnen van elkaar afwijken staan in het register, <a1><c1/></a1>. Geen bronbestand wordt herdistribueerd. Persoonsnamen zijn opzettelijk weggelaten.

seg-b1f1e1efa042 = id

seg-02071a726f21 = titel

seg-0634af374469 = identificatie

seg-fd875b5fb817 = uitgever

seg-a6f8ef268fcc = opgehaald

seg-d04709ddc97d = licentie

seg-1d4174e911c1 = white paper over een referentiestation op de maan voor positiebepaling, tijdsynchronisatie en wetenschap, versie { "3" }

seg-e09e1cc11921 = arXiv (white paper van de auteurs)

seg-c91720d34bd3 = arXiv non-exclusive licence to distribute { "1.0" } (verleent alleen aan arXiv)

seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } dia's)

seg-03f689a0ba49 = ioag.org/meetings/cislunar, sectie { "6" }, item { "07" }

seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, februari { "2025" }; dia's van de European Space Agency

seg-58579c3faf2f = niet vermeld; gemarkeerd als vrijgegeven voor het publiek vanaf dia { "3" }

seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } dia's)

seg-7e18a15e0d16 = unoosa.org, <c1/>

seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, juni { "2024" }; dia's van de European Space Agency

seg-f4e53e44f0b5 = niet vermeld; gemarkeerd als vrijgegeven voor het publiek

seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } dia's)

seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, februari { "2026" }; dia's van de European Space Agency en Telespazio

seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } dia's)

seg-6229db9cb23d = Workshop on Cislunar PNT, februari { "2026" }; dia's van de European Space Agency

seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, en de meegeleverde <c1/>

seg-4e07c500e353 = zoals vastgelegd met <c1/>

seg-28f8d886c4e5 = al aanwezig in de tree

seg-2006c194fef6 = zoals daar vastgelegd

seg-68db6a17b4e7 = <s1>Vorige</s1>Zonnestelsel en andere hemellichamen

seg-79d53edd2374 = <s1>Volgende</s1>Navigatie voor ruimtegebruikers (gnss-ssv)

seg-9c59637f0666 = Dekkings- en nauwkeurigheidskaart (lunar-station-coverage)
