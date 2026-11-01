# docs--quantum-physics: translations (nl)

seg-5ad814c7ef9e = Notities

seg-ad856ad710eb = Status

seg-f2f359447cd9 = Bron: <c1/>

seg-5df810623ef1 = Fysica van quantum-traagheidssensoren (koude-atoominterferometer)

seg-b2915c3652a1 = Het grootste deel van Kshana stuurt zijn quantumsensoren aan met <b>gepubliceerde Allan-/ruiscoëfficiënten</b> — opzoekingen in datasheets (zie <a1><c1/></a1> en <a2><c2/></a2>). Dit document behandelt de ene plek waar de engine de prestaties van de sensor in plaats daarvan <b>uit eerste principes</b> berekent: het model van de koude-atoomversnellingsmeter (CAI) in <a3><c3/></a3>.

seg-9ae4b2dc84ba = Het is bewust een <em>minimale, eerlijke</em> fysicalaag — de ondergrens van quantumprojectieruis en de schaalfactor van de interferometer — geen volledige instrumentsimulator. De onderstaande secties zeggen precies wat wel en niet wordt gemodelleerd.

seg-64509c048541 = Wat wordt gemodelleerd

seg-9fa6211c962e = Een Mach–Zehnder-atoominterferometer met drie pulsen (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), de standaardgeometrie voor koude-atoomversnellingsmeters:

seg-3c513ef2fd3b = Grootheid

seg-c0a13eeb346d = Formule

seg-f838cd800e16 = Effectieve golfvector

seg-79e00267b79f = Tweefoton-Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

seg-5c0a84157352 = Interferometerfase

seg-31f4f718d896 = Uniforme specifieke kracht <c1/> langs <c2/>, pulsafstand <c3/>. De schaling met <c4/> is de dominante gevoeligheidshefboom (microzwaartekracht levert lange <c5/> op).

seg-f5b8b6c35dce = Quantumprojectieruis

seg-8902ae6f313c = Per shot, franjecontrast <c1/>, aantal atomen <c2/> — de shotruisgrens van een populatie-uitlezing met twee poorten.

seg-b95d4d1e45f0 = Versnellingsgevoeligheid per shot

seg-c97f2fd35d48 = Faseruis herleid tot versnelling.

seg-cda09ac79409 = Door shotruis begrensde ASD (amplitude spectral density)

seg-4d84800a3adb = Bemonstering elke cyclustijd <c1/>; eenheden (m/s²)/√Hz.

seg-707ee648d1d5 = PSD (power spectral density) van velocity random walk

seg-be0ac61054db = <b>De coëfficiënt die het klassieke <c1/> verbruikt</b> — nu <em>afgeleid</em>, niet aangeleverd.

seg-939e12a62637 = Contrastverval

seg-05b0e7130b78 = Decoherentie tijdens de ondervraging.

seg-e64f748b35ab = Overdrachtsfunctie voor trillingen

seg-1754ac375452 = Respons van versnelling naar fase van de ideale geometrie met drie pulsen (Cheinet et al. { "2008" }); DC-limiet (nulfrequentie) <c1/>.

seg-a710cfe4f533 = Door trillingen begrensde fase

seg-f5d2223218c8 = Vlakke versnellings-PSD <c1/> langs de Raman-as; <c2/>.

seg-13109dcfc52b = Door trillingen begrensde versnelling

seg-812990a8f058 = Per shot; merk op dat <c1/> wegvalt — uitsluitend bepaald door de PSD van het platform en de ondervragingstijd.

seg-1c2764469718 = Franjeambiguïteit

seg-e9cf2dcc0274 = <c1/>, bereik in cellen <c2/>

seg-817e06834263 = De franjefase wordt modulo 2π gelezen, dus één enkele meting is alleen binnen ±<c1/> ondubbelzinnig en vertoont aliasing elke <c2/> daarbuiten; het aantal cellen hangt niet af van <c3/> of <c4/>.

seg-14bbedf1cd0d = Asprojectie

seg-1ac2d4904b8a = Koppeling van de eerste orde is rang 1: alleen de component langs de bundel komt in de fase terecht.

seg-7200f91fa19a = Coriolis- / rotatiefase

seg-f8b407b3b2fb = Rotatiesysteemeffect voor een bewegend voertuig (Lan et al. { "2012" }); equivalente bias <c1/> = de klassieke Coriolis-term.

seg-9eaff8d90a83 = AC-Stark-fase (lichtverschuiving) (AC: wisselstroom)

seg-62630dc178e6 = Eenfoton-lichtverschuiving; een <em>constante</em> verschuiving heft zich op door de symmetrie π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

seg-bcb9cb9c6219 = Het sluiten van de lus is waar het om gaat: <c1/> levert precies de PSD van witte versnelling die de rest van de traagheidsstack al integreert tot een snelheids-/positiefout — zodat de ruis van een quantumsensor kan worden herleid tot zijn aantal atomen, ondervragingstijd en contrast in plaats van tot een regel in een datasheet.

seg-e2363d639ccc = Een uitgewerkt cijfer (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) per shot, en een shotruisvloer <c8/>. Met een bescheiden trillings-PSD van het platform <c9/> is de <b>door trillingen begrensde</b> vloer per shot <c10/> (≈ { "5.9" } µg) — ongeveer { "46" }× de shotruisvloer, wat laat zien waarom echte apparaten door trillingen en niet door projectie worden begrensd. Dezelfde interferometer leest specifieke kracht alleen ondubbelzinnig binnen <c11/> (≈ { "199" } µg), ongeveer { "1 571" } resolutiecellen: <c12/> is duizenden franjes, dus een enkele meting van { "1" } g vertoont aliasing.

seg-c209b86f41d8 = Wat NIET wordt gemodelleerd (en waarom de ondergrens optimistisch is)

seg-964c5f546c2a = De shotruisvloer hierboven is een <b>fundamentele ondergrens</b>. Echte CAI-instrumenten zitten erboven: een statische laboratoriumgravimeter (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) ongeveer { "60" }× boven de vloer die voor zijn parameters is berekend, en een in het veld gebruikte versnellingsmeter-triade veel verder (het Exail-apparaat dat in <c1/> wordt aangehaald, noemt { "22" } µg/√Hz). De dominante term — <b>trillingskoppeling</b> — en de twee voornaamste deterministische systematische effecten — <b>Coriolis/rotatie</b> en de <b>AC-Stark-lichtverschuiving</b> — worden gemodelleerd (de rijen voor overdrachtsfunctie, Coriolis en lichtverschuiving hierboven), en dat geldt ook voor het <b>dynamisch bereik van de franjeambiguïteit</b> (<c2/>, <c3/>, <c4/>, <c5/>). Het resterende verschil is wat deze laag nog steeds niet omvat:

seg-c56d85817bc6 = <b>Golffrontaberratie</b> en systematische effecten van hogere orde in de bundelrichting — <b>niet gemodelleerd</b>.

seg-525c382e813b = <b>Oplossing van de franjeambiguïteit</b> — het model geeft het ondubbelzinnige bereik en retourneert de gewikkelde fase; het ontwikkelt een meting buiten ±<c1/> niet (bijvoorbeeld met een klassieke versnellingsmeter of meerdere ondervragingstijden), en het begrenst het bereik voor een ideale franje met drie pulsen, zonder golffront- of contrastverliestermen.

seg-7555132ef2c6 = Koppeling aan de literatuur: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (quantumtechnologie; GNSS: global navigation satellite system); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) voor de gevoeligheid en overdrachtsfunctie van de interferometer (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) voor het foutbudget van de mobiele gravimeter; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) voor het parameterregime van de versnellingsmeter in de ruimte.

seg-c50f3befe165 = Dit is het item <b>P2 quantumfysicalaag</b> uit <c1/>: de Mach–Zehnder-fase, projectieruis, schaalfactor, afgeleide <c2/>, contrastverval, <b>en de overdrachtsfunctie voor trillingskoppeling / variantie van de witte PSD</b> zijn geïmplementeerd en met unittests getoetst aan handberekeningen (inclusief een numerieke bandintegraal-kruiscontrole van de overdrachtsfunctie aan haar analytische <c3/>-resultaat).

seg-42e8dc204be9 = Het model is ook <b>aangesloten op uitvoerbare scenario's</b>: een versnellingsmeter wordt <c1/> wanneer hij een tabel <c2/> draagt — <c3/> of <c4/> in een scenario <c5/>, <c6/> in een scenario <c7/> (<c8/> levert er een mee, en de meegeleverde voorinstelling <c9/> zet een CAI met fysisch gespecificeerde parameters tegenover een kwartsversnellingsmeter van navigatiekwaliteit tijdens een GNSS-uitval) — met de velden <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) en een optionele <c19/> van het platform. De PSD van velocity random walk <c20/> wordt dan <b>afgeleid</b> uit de fysica van de interferometer — de shotruisvloer plus, wanneer een trillings-PSD is opgegeven, de door trillingen begrensde bijdrage kwadratisch opgeteld — in plaats van aangeleverd als datasheetcoëfficiënt. Scenario's zonder een blok <c21/> zijn klassiek en byte voor byte ongewijzigd.

seg-51da20726ade = De systematische effecten van Coriolis (<c1/> / <c2/>) en van de AC-Stark-lichtverschuiving (<c3/>) zijn geïmplementeerd en met unittests getoetst (de equivalente Coriolis-bias wordt gecontroleerd aan de klassieke <c4/>; de AC-Stark-fase aan haar symmetrische opheffing). Een sweep van de cyclustijddrift (<c5/>) rapporteert de positiedrift bij dode rekening van de quantum-CAI ten opzichte van de cyclustijd — de rekenkundige kern van een vergelijking tussen quantum en klassiek. Het type <c6/> hergebruikt dezelfde versnellingsmeter via <c7/>, en <c8/> bevat een parameterblad met bandbreedte (best, nominaal, conservatief) met een bronvermelding per cijfer.

seg-e2acbef44395 = Wat de externe controles laten zien.

seg-353a2b2e1434 = <c1/> controleert de overdrachtsfunctie aan een numerieke integraal in het tijdsdomein van de gevoeligheidsfunctie van Cheinet, <c2/> aan gepubliceerde golflengten van lijnen, en de Coriolis-bias aan <c3/> — exacte overeenkomsten met de gepubliceerde vormen. De shotruisvloer is een eenzijdige afbakening: voor de gepubliceerde parameters van de cesiumgravimeter van Peters et al. { "2001" } en de GAIN-rubidiumgravimeter van Freier et al. { "2016" } (arXiv:{ "1512.05660" }) ligt de gemodelleerde vloer op of onder de behaalde ruis van elk apparaat en binnen drie ordes van grootte daarvan (voor GAIN is de vloer { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz tegenover de behaalde { "9.6" }×{ "10" }⁻⁸, een factor van ongeveer { "63" }). Dat is consistent met echte apparaten die door trillingen of technisch zijn begrensd, maar het is een afbakening, geen validatie van een ruismodel van een instrument, dus de matrixrij blijft MODELLED.

seg-82dffa95c0e8 = De resterende vervolgstappen zijn systematische effecten van golffront en bundelrichting, oplossing van de franjeambiguïteit, een numeriek exacte reproductie van de Monte Carlo van CARIOQA-PMP en de vliegtestbudgetten voor GPS-denied (GPS: Global Positioning System) van Boeing/AOSense (waarvoor de gepubliceerde platform-PSD's en de SNR per shot nodig zijn, de signaal-ruisverhouding), en een voorinstelling voor een vergelijking tussen quantum en klassiek in de browserplayground bovenop <c1/>.

seg-2452f58aedf0 = <s1>Vorige</s1>Modellen van quantumsensoren

seg-206d5a9704f0 = <s1>Volgende</s1>Python-API
