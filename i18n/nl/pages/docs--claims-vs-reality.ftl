# docs--claims-vs-reality: translations (nl)

seg-2bd2101ce454 = Onderdeel

seg-a47934361f43 = NMEA-streams voor bemanningstraining

seg-ee2e250497f9 = Export voor testbench

seg-ad856ad710eb = Status

seg-98d0bc6b40ce = Koppeling aan openbare kaders voor compliance

seg-80f3f0aae42c = Interferentiekaart

seg-28b1885c4ca7 = Bron: <c1/>

seg-bf5c2811ce29 = Beweringen versus werkelijkheid: register van overclaims

seg-592e007bc3cf = Een onafhankelijke audit van een eerdere versie van Kshana inventariseerde veertien <b>overclaims</b> (<c1/>…<c2/>): plaatsen waar een publiek zichtbaar oppervlak (README, playground, labels van FoM (kwaliteitsmaat), scenariopakketten) een mogelijkheid sterker beschreef dan de code leverde. Deze pagina is het afsluitingsregister: elke rij vermeldt de oorspronkelijke overclaim, hoe die is opgelost en het bewijs. Er komen twee soorten oplossing voor:

seg-39250970dbbf = <b>Claim teruggenomen</b>: de formulering is gecorrigeerd zodat ze bij de code past (eerlijke herformulering, geen wijziging van mogelijkheden). "Geen code = geen claim."

seg-fb7da0f79ead = <b>Ingehaald</b>: de echte mogelijkheid is daarna gebouwd en getest, zodat de sterke claim <em>juist</em> werd.

seg-5292f7162e2b = Een regressiebewaker (<c1/>) scant bij elke CI-run (continue integratie) de actuele publieke oppervlakken (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> en de voorpagina's van crates.io, PyPI (Python Package Index) en npm: <c8/>, <c9/>, <c10/>) en faalt als een van de ingetrokken kale overclaimzinnen zonder voorbehoud terugkeert, zodat een rij niet ongemerkt kan terugvallen van GREEN.

seg-dafc6f322f34 = Alle veertien rijen zijn <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (overclaim)

seg-0e01d4053d7f = Oorspronkelijke overclaim

seg-36bf87638923 = Oplossing

seg-70a952c4150b = "gezamenlijke Kalman-fusieschatter" suggereerde één filter met kruiscovariantie; de code draaide twee onafhankelijke schatters

seg-d5682a7fdb11 = <b>Ingehaald</b>: er is een echt Kalman-filter voor klok+positie met gekoppelde kruiscovariantie gebouwd

seg-1008020cd9e4 = <c1/> ({ "7" } tests, waaronder een ensemble van 100 proeven gekoppeld-versus-ontkoppeld dat eist dat de gekoppelde positie-RMS (root mean square) onder { "0.6" }× die van het ontkoppelde filter ligt en dat het gekoppelde filter ten minste { "90" } van de { "100" } proeven wint); CAPABILITY "Sensor fusion" → full

seg-334fc345d501 = "kloksteunende spoofdetectie-RAIM (receiver autonomous integrity monitoring)" suggereerde een RAIM-detector met meerdere satellieten

seg-cf0795c2ee02 = <b>Claim teruggenomen → Ingehaald</b>: herformuleerd als een grens voor de detecteerbaarheid van spoofing op basis van klokstabiliteit; de echte RAIM/ARAIM (HPL/VPL (HPL: horizontaal beschermingsniveau; VPL: verticaal beschermingsniveau)) volgde daarna

seg-f46432acbfa0 = <c1/> ({ "30" } tests: snapshot + ARAIM met oplossingsscheiding, HPL/VPL, FDE (foutdetectie en -uitsluiting), Stanford-diagrammen); <c2/>

seg-8b47f69dbb76 = "jamming-demonstrator" zonder enige jamming-code erachter

seg-bfff34d5a250 = <b>Ingehaald</b>: er is een jamming-model op basis van een linkbudget gebouwd: J/S → effectieve C/N₀ → lock-verlies

seg-5f75628b8201 = <c1/> ({ "10" } tests); README-rij "Resilience"

seg-bae512770cd6 = "Volledig IMU-ruismodel (inertial measurement unit) met Allan-variantie op een IMU-drietal": het model had één as

seg-50c0b5855cb9 = <b>Claim teruggenomen → Ingehaald</b>: herformuleerd als een foutbudget met 1 DOF (DOF: vrijheidsgraad); daarna kwam een driedimensionaal strapdown-INS (inertial navigation system)

seg-501bf7d8fff0 = <c1/> driedimensionaal strapdown (quaternionattitude, NED-mechanisatie (north-east-down), coning/sculling); ROADMAP "Inertial"

seg-ad250a99b05f = "Hybride PNT-integratie (positiebepaling, navigatie en tijdsynchronisatie)" suggereerde een gekoppeld GNSS/INS-filter (GNSS: global navigation satellite system); het was een foutbudget voor dode rekening

seg-85fb58d37a5d = <b>Claim teruggenomen → Ingehaald</b>: herformuleerd als dode rekening met een instelbare herborging; daarna kwam echte strak gekoppelde GNSS/INS-fusie

seg-9e6b092d5656 = <c1/> (UKF met 17 statussen (unscented Kalman filter) met dode rekening via kwantum-CAI (CAI: koude-atoominterferometer)); CAPABILITY "Sensor fusion" → full

seg-46a637f8e967 = "getoetst ~{ "2" }%" suggereerde een strakke afgedwongen drempel

seg-5e98d7664558 = <b>Claim teruggenomen</b>: <c1/> vermeldt de <em>afgedwongen</em> drempel ({ "20" }–{ "25" }%, gemiddeld over seeds); "~{ "2" }%" duidde een typische waarneming aan, niet de drempel

seg-84f4fcdc7e50 = <c1/> kop "On tolerances"

seg-85ec2fe9c7f7 = "platformoverschrijdend deterministisch" zonder vastgelegd bewijs

seg-6e516f04db89 = <b>Claim teruggenomen</b>: toolchain vastgezet op een exacte release; golden-hashes per scenario vastgelegd met een reproduceerbaarheidspoort. (Bit-identiek <em>over</em> OS/architectuur (OS: besturingssysteem) heen blijft een openstaand punt, eerlijk vermeld.)

seg-9db327be56c3 = <c1/> (kanaal <c2/>); <c3/> (numerieke waarden tot { "1e-6" }); <c4/> (hash van de invoervingerafdruk en vorm van elk resultaat, uitgevoerd op de CI-matrix voor Linux, macOS en Windows); <c5/>

seg-2708139388ed = "hybride kwantum-klassieke PNT-simulator" suggereerde kwantumfysica vanuit eerste principes

seg-717167714e83 = <b>Claim teruggenomen → Ingehaald</b>: herformuleerd als een simulator voor PNT-veerkracht met prestatiemodellen van kwantumsensoren; daarna kwam CAI-fysica van Mach–Zehnder vanuit eerste principes

seg-c67fb22add4b = <c1/> ({ "26" } tests: Mach–Zehnder-fase, projectieruis <c2/>, trillingsoverdrachtsfunctie, systematische effecten van Coriolis + AC-Stark (AC: wisselstroom)); <c3/>

seg-5c6b7d4f2029 = de kwaliteitsmaat "Integrity Performance" suggereerde luchtvaartintegriteit met HPL/VPL/RAIM

seg-ee5487da890c = <b>Claim teruggenomen + Ingehaald (gelaagd)</b>: de kwaliteitsmaat van het scenario per run is eerlijk benoemd als <em>interne consistentie van het filter</em> (<b>niet</b> luchtvaartintegriteit); de echte ARAIM HPL/VPL wordt <em>apart</em> getoond zodat de twee nooit door elkaar worden gehaald

seg-31aacdf17b02 = <c1/> (<c2/>: interne consistentie, met voorbehoud); <c3/> + <c4/> (echte ARAIM)

seg-0686fa147c96 = kwaliteitsmaat Security gepresenteerd als altijd betekenisvol, ook zonder aanval

seg-d6d9296422fc = <b>Claim teruggenomen</b>: de kwaliteitsmaat Security (<c1/>) wordt geplaatst in de context van de spoofdetector en is alleen betekenisvol als er een aanvalsscenario is ingesteld

seg-8f7b211b5a0c = README-rij "Resilience"; de kwaliteitsmaat Security is gedefinieerd op het operationeel schadelijke specificatiepunt

seg-d66421174e94 = de kwaliteitsmaat "Positioning Performance" suggereerde volledige nauwkeurigheid in het positiedomein

seg-9eeb13a16350 = <b>Claim teruggenomen</b>: benoemd als een 1-DOF-<c1/> voor de inertiale/hybride pakketten, uitdrukkelijk <b>niet</b> een 2D-CEP/2DRMS (CEP: circular error probable) of DOP-gewogen (DOP: verdunning van precisie) nauwkeurigheid

seg-e8115df73c10 = README-tabel met kwaliteitsmaten (rij "Positioning Performance")

seg-5c73759a2454 = FoM-getallen voor inertiaal werden gelezen als ensemblestatistieken uit enkele seeds

seg-3db3a41ce848 = <b>Claim teruggenomen</b>: een enkele run wordt gemarkeerd met <c1/>; <c2/> geeft gemiddelde/spreiding/bootstrap-BI van { "95" }%

seg-bf737455e6f2 = README-tabel met kwaliteitsmaten; omhullendetests voor scenariodekking

seg-aa362992b5da = het scenario "SGP4 (Simplified General Perturbations { "4" }) GPS-constellatie (Global Positioning System)" gebruikte synthetische tijdelijke TLE's (two-line element sets)

seg-ebae20813a52 = <b>Ingehaald</b>: het scenario bevat nu een echte, van een datum voorziene momentopname van Celestrak <c1/> met strikte checksums

seg-2d49f6101571 = <c1/> (echte <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = versiestring in de README week af van <c1/>

seg-8e66b9485565 = <b>Claim teruggenomen</b>: een CI-poort toetst dat de statusbadge in de README overeenkomt met <c1/>

seg-347fd8c1f334 = { "0.35" }: beweringen bewust smal gehouden en één correctie

seg-946ff389cec5 = De functies van { "0.35" } zijn geschreven met hun grenzen naast de bewering, en dezelfde bewakers (<c1/> en de formuleringsbewaker in <c2/>) scannen de pagina's die ze beschrijven. Deze tabel maakt geen deel uit van het register met veertien rijen hierboven; ze legt voor de nieuwe oppervlakken vast wat wordt beweerd en wat niet.

seg-6ac3f9b26aad = Wat wordt beweerd

seg-6f558815da86 = Wat niet

seg-d0964d2f9bbc = Vertrouwensscore voor vaartuigen (<c1/>, <c2/>, gate, Signal K, OpenCPN)

seg-ee4d75006bfc = een score van 0-100 met redenen, uit de eigen NMEA van een ontvanger, MODELLED

seg-59ff27c84fe4 = adviserend, geen typegoedgekeurde navigatieapparatuur; een score voor één log zegt niets over andere ontvangers; hij maakt een positiebepaling niet nauwkeuriger

seg-8869e6a5c10b = synthetische brug-NMEA met gescripte gebeurtenissen en een instructeurslogboek

seg-bc4ba77bc569 = alleen tekst, geen radiofrequentie-uitvoer; nooit voor de actieve navigatiesystemen van een vaartuig; adviserend, geen typegoedgekeurde navigatieapparatuur

seg-9482ecbb2748 = een ondertekend technisch dossier dat offline kan worden gecontroleerd

seg-20ae6dd2b780 = geen juridisch oordeel; zegt niet wat een gebeurtenis heeft veroorzaakt, wie verantwoordelijk was, of dat het logboek toont wat de ontvanger werkelijk heeft ontvangen

seg-4132fc36f1d3 = geaggregeerde cellen met verslechterde navigatie uit rapporten met een open licentie

seg-c64960abf9fb = geen voorspelling; de blootstelling van een route is een aandeel van cellen, geen risico

seg-ed6d268e0291 = de voertuigbeweging en gebeurtenissen van een scenario in bestanden die een laboratoriumsimulator kan lezen

seg-85c8ad22ef03 = er wordt geen signaal geschreven; er worden geen prestaties van een simulator of ontvanger beweerd

seg-1bba9a883650 = voor welke rijen een set runs bewijs levert, met een hiaat op elke rij

seg-f2a836780831 = nooit dat een kader is gehaald of een product is goedgekeurd; een soortlabel alleen is geen bewijs

seg-31c7009c9914 = <b>Correctie vastgelegd in { "0.35" }.</b> Een eerdere versie van <c1/> en van de commentaren van de resilience-module beschreef zeven "technieken-categorieën" van het DHS Resilient PNT Conformance Framework. Versie { "2.0" } van dat kader definieert kernfuncties (Prevent, Respond, Recover), niveaus { "0" } tot { "4" } en acht genummerde eisen, en geen lijst van zeven categorieën. De zeven namen van deelscores die de scoreengine uitvoert zijn eigen indelingen van Kshana, en de crosswalk zegt dat nu ook.

seg-f70787ecb194 = Hoe een rij GREEN blijft

seg-f2c599e8882a = De sterke claims (OC-0/2/7/8 en de ingehaalde helften van OC-1/3/4/12) zijn GREEN omdat de mogelijkheid <b>is opgeleverd en getest</b>, niet omdat de formulering is afgezwakt. De teruggenomen rijen zijn GREEN omdat de actuele formulering bij de code past. De bewakingstest maakt de tweede categorie afdwingbaar: als een ingetrokken overclaimzin terugkeert op een publiek oppervlak, wordt CI rood. Zie <c1/>.

seg-39e475441b60 = <s1>Vorige</s1>Waarom rijen gemodelleerd blijven

seg-07ef8e1e862e = <s1>Volgende</s1>Herkomst
