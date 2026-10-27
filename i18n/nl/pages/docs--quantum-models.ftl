# docs--quantum-models: translations (nl)

seg-638b8d451550 = Sensor

seg-c35a20fa2529 = Rijpheid

seg-2f51722ab9d4 = Bron: <c1/>

seg-39ab7752d86d = Modellen van quantumsensoren: wat Kshana modelleert, en wat niet

seg-daf0e0c0b16f = Kshana is een <b>simulator voor de veerkracht van PNT (PNT: positiebepaling, navigatie en tijdsynchronisatie) met prestatiemodellen van quantumsensoren</b>. Het is <em>geen</em> quantumfysicasimulator op basis van eerste principes. Deze pagina zegt precies wat dat betekent, zodat het kader "quantum" niet voor meer kan worden aangezien dan het is.

seg-6e504d97c41e = Wat WEL wordt gemodelleerd

seg-7884c9a7d883 = Elke quantumsensor (en klassieke sensor) is een <b>foutmodel</b> dat wordt aangedreven door gepubliceerde ruisbudgetparameters:

seg-cad22f39d579 = <b>Klokken</b> — PSD's (power spectral densities) voor witte frequentie en random-walk-frequentie, een flicker-Allanvloer (1/f) en lineaire drift, afkomstig uit datasheets en artikelen: de CSAC (chip-scale atomic clock) Microchip SA.45s; de strontium-optische roosterklok van Origlia et al. (arXiv:{ "1503.08457" }), een op de ruimte gericht doel; en de zes standaardwaarden van <c1/> (CSAC; USO, ultra-stable oscillator; DSAC, Deep Space Atomic Clock; TCXO, temperature-compensated crystal oscillator; OCXO, oven-controlled crystal oscillator; RAFS, rubidium atomic frequency standard), elk met één bron. De Allan-deviatie die deze opleveren is getoetst aan de standaardhellingen van de ruistypen (zie <a1><c2/></a1>). Eén optische-klokcurve is echt: de gemeten Allan-deviatie van de ⁸⁸Sr-tweezerklok van Norcia et al. (<em>Science</em> { "2019" }) wordt door de ruisfit gereproduceerd, een VALIDATED-rij in <a2><c3/></a2>; de holdovercijfers die op de optische klasse zijn gebouwd blijven MODELLED.

seg-13c3340e773b = <b>Traagheidssensoren</b> — in <c1/> en de hybride pakketten een foutbudget voor een versnellingsmeter/gyroscoop met één as (1-DOF, één vrijheidsgraad): velocity random walk, angular random walk, acceleration random walk en een Allan-biasinstabiliteitsvloer. De typen <c2/> en <c3/> draaien in plaats daarvan de strapdown-mechanisatie met drie assen in <c4/> (quaternionattitude, navigatievergelijkingen in north-east-down, een deterministisch IMU-foutmodel).

seg-f361d586b348 = De quantumscenariotypen — <c1/>, <c2/>, <c3/>, <c4/> en <c5/> — zijn uit deze foutmodellen opgebouwd en zijn MODELLED; <c6/>, <c7/> en <c8/> rapporteren bovendien een representativiteitsrecord met de hiaten tot vluchtgereedheid.

seg-05bbaddd4df6 = De engine is <b>neutraal</b>: "quantum" en "klassiek" zijn hetzelfde codepad met andere coëfficiënten. Het contrast in de kwaliteitsmaten komt volledig voort uit de invoerruisparameters, elk herleidbaar tot een aangehaalde bron.

seg-a1a067588520 = Wat NIET wordt gemodelleerd

seg-49a656243210 = Voor de klok- en tijdoverdrachtsensoren wordt niets van de onderliggende quantumfysica gesimuleerd — alleen de netto Allan-bijdrage, aangeleverd als coëfficiënt. Voor de <b>koude-atoomversnellingsmeter</b> bestaat nu een laag op basis van eerste principes (zie hieronder); de overige systematische effecten zijn nog op coëfficiëntniveau of niet gemodelleerd:

seg-844e65d52572 = de <b>Mach–Zehnder-fase</b> van de atoominterferometer (<c1/>), <b>quantumprojectie- / shotruis</b> (<c2/>), het verval van het <b>contrast</b> van de interferometer, de <b>cyclustijd</b> en de <b>overdrachtsfunctie voor trillingskoppeling</b> (<c3/>, variantie van de witte PSD <c4/>) <em>worden nu uit eerste principes gemodelleerd</em> voor de CAI-versnellingsmeter (cold-atom interferometer) (<c5/>), waarbij de PSD van witte versnelling <c6/> wordt afgeleid die het klassieke model verbruikt, samen met het <b>dynamisch bereik van de franjeambiguïteit</b> (<c7/>) — zie <a1><c8/></a1>;

seg-71a782041b89 = het <b>Coriolis</b>-systematische effect (<c1/> / <c2/>, de <c3/>-kruiskoppeling) en het <b>AC-Stark- (AC: wisselstroom) / lichtverschuivingseffect</b> (<c4/>, dat zich opheft bij een symmetrische tweefotonverstemming) <em>worden nu gemodelleerd en getest met unittests</em> in <c5/>;

seg-00c510117abc = drie verdere CAI-foutbijdragen <em>worden nu gemodelleerd</em> als bibliotheekfuncties in <c1/> ({ "0.36" }; MODELLED; nog niet bereikbaar vanuit een scenariotype):

seg-fcaf6ff00974 = <b>Ruis in de laserfase van Raman</b>: de weging met de gevoeligheidsfunctie van Cheinet et al. ({ "2008" }), vgl. { "8" }, met de gesloten vorm voor witte fase <c1/> (vgl. { "18" } bij één cyclus) en een numerieke route voor elk faseruisspectrum, plus de laserfrequentieruis die de vertraging van de retroreflectie <c2/> niet opheft (Le Gouët et al. { "2007" }, vgl. { "9" } tot en met { "11" });

seg-6e2236c81db8 = <b>golffrontkromming</b> (alleen zuivere defocus): de bias <c1/> van een thermische wolk op een bundel met kromtestraal <c2/>, en de afname ervan wanneer alleen atomen binnen een detectiestraal worden geteld (naar Louchet-Chauvet et al. { "2011" } en Schkolnik et al. { "2015" }); hogere-orde-aberraties worden niet gemodelleerd;

seg-92295ad17228 = <b>oplossing van de franjeambiguïteit</b>: de kans op een verkeerde franje-index, <c1/>, voor ondersteuning door een klassieke versnellingsmeter (Lautier et al. { "2014" }) en voor twee ondervragingstijden (naar Bonnin et al. { "2018" }), met de inverse die de grootste klassieke ruis geeft voor een opgegeven faalkans.

seg-f383678fb806 = Elke gesloten vorm wordt gecontroleerd aan een onafhankelijke numerieke route (kwadratuur in het frequentiedomein, of een Monte Carlo over atomen of shots) en aan haar grensgevallen. Het ene gepubliceerde getal dat wordt gereproduceerd is het niveau van witte faseruis van Cheinet et al.: −{ "111" } dB·rad²/Hz bij <c1/> = { "20" } µs geeft ongeveer { "1" } mrad per shot ({ "0.99" } mrad; het artikel leidt dat niveau af met zijn vgl. { "17" }, flicker plus wit). Niets hiervan is een meting van enig instrument;

seg-150f8b9dfea4 = nog steeds <b>niet</b> gemodelleerd: hogere-orde-golffrontaberraties, de faseruis van een specifiek lasersysteem en eerste-principesfysica aan de kant van de klok;

seg-643109601eba = het pakket <c1/> voor quantum versus klassiek heeft één as; het strapdown-pad met drie assen draait alleen in <c2/> en <c3/> (zie de opmerking over de IMU, de traagheidsmeeteenheid, in de README en <a1><c4/></a1>).

seg-1ff01ab9f92d = Het voltooien van de quantumfysicalaag (de CAI-foutbijdragen bereikbaar maken vanuit een scenariotype, hogere-orde-golffrontaberraties en eerste-principesfysica aan de kant van de klok) is het resterende P2-werk in <c1/>.

seg-f09a31b33faa = Cijfers uit het grondlaboratorium versus vluchtgekwalificeerde cijfers

seg-dcef4579d2a9 = Parametertabellen mengen rijpheidsniveaus; behandel ze dienovereenkomstig:

seg-4f25895df32f = Bronwaarde

seg-cef61e912cd0 = CSAC (bijv. SA.45s)

seg-4a016be9bca9 = datasheet σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>ingezet</b> commercieel onderdeel (stralingsbestendige ruimtevarianten bestaan)

seg-d38d20629ed6 = Strontium-optische roosterklok

seg-1f0d3ec00922 = doel σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>grondlaboratorium</b> — Kshana kent geen gepubliceerde prestaties in een baan voor een dergelijke klok

seg-ce1d7994188b = Koude-atoomversnellingsmeter

seg-b07fa6b8cebc = gepubliceerde Allan-cijfers uit het laboratorium

seg-60864f168701 = grondlaboratorium / sondeerraket

seg-84a68aeb467d = Cijfers voor optische klokken in Kshana zijn <em>ruimtedoelen op grondhardware</em>. Er bestaat geen gevlogen optische klok; de README en de herkomst van het resultaat zeggen dat uitdrukkelijk.

seg-a204c1b854fa = Benchmark: ACES/PHARAO op het ISS (operationeel sinds april { "2025" })

seg-fb88de1257bd = De ESA-payload (European Space Agency) <b>ACES/PHARAO</b> (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — een met lasers gekoelde cesiumklok plus een actieve waterstofmaser, die sinds april { "2025" } op het ISS (International Space Station) werkt — is de huidige operationele benchmark voor klokstabiliteit in een baan (beoogde fractionele stabiliteit van de orde { "1e-16" } na enkele dagen integratie). Het optische-klokmodel van Kshana vertegenwoordigt een <em>agressiever</em> doel voor het grondlaboratorium dan de gevlogen cesium-/maserprestaties van ACES; wanneer men de optische cijfers van Kshana vergelijkt met "wat daadwerkelijk heeft gevlogen", is ACES/PHARAO het eerlijke referentiepunt, en het is een microgolf-/masersysteem, geen optische roosterklok.

seg-9d2e850cb986 = De exacte prestatiecijfers van ACES in een baan moeten worden aangehaald uit de gepubliceerde resultaten van ESA zodra die verschijnen; het gaat hier om de <em>rijpheidskloof</em>, niet om een specifiek getal — de optische cijfers van Kshana zijn doelen, geen gevlogen prestaties.

seg-4b373686adf8 = <a1><c1/></a1> — labels <c2/> / <c3/> per parameter.

seg-3f0c1048aea9 = <a1><c1/></a1> — definities van kwaliteitsmaten (FoM) en elke afkorting.

seg-a360cd4997e2 = <a1><c1/></a1> — wat de FoM's voor integriteit en beveiliging wel en niet zijn.

seg-0ac025397b23 = <a1><c1/></a1> — de koude-atoomversnellingsmeter op basis van eerste principes.

seg-41ba2c8f70fe = <s1>Vorige</s1>Constellatieontwerp

seg-136fa589fed5 = <s1>Volgende</s1>Koude-atoominterferometer
