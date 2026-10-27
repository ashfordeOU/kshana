# docs--tutorial-clock-holdover: translations (nl)

seg-b59f529012a6 = Bron: <c1/>

seg-e66a5042182e = Tutorial { "2" } — Klok-holdover: hoelang kunt u doorlopen zonder GNSS

seg-889112bc4c09 = <c1/> · <b>Scenario:</b> <c2/> (leerversie: <a1><c3/></a1>) · <b>Moeilijkheid:</b> beginner · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Aan het einde hebt u een klok-holdover uitgevoerd met GNSS-signalen (Global Navigation Satellite System) uitgeschakeld, de kwaliteitsmaat voor tijdsynchronisatie gelezen en de driftwet √(q_wf·T) begrepen die verklaart <em>waarom</em> de optische klok het langer volhoudt dan de klok op chipschaal, waarbij de wet afkomstig is van NIST (het Amerikaanse National Institute of Standards and Technology) en niet is verzonnen.

seg-51ae9468b92a = Wat dit scenario is

seg-87334505b228 = Wanneer GNSS-signalen wegvallen, houdt een systeem de tijd bij op zijn eigen klok aan boord. De fase van die klok drijft langzaam af, en zodra de drift de operationele tijdsynchronisatiespecificatie overschrijdt, bent u buiten dienst. <b>Holdover</b> is hoelang u binnen de specificatie blijft na verlies van GNSS: de belangrijkste kwaliteitsmaat voor autonomie.

seg-798ac031b5c6 = Het scenario draait een tijdlijn van { "2" } h: { "10" } min GNSS-synchronisatie, daarna { "6600" } s ({ "1.83" } h) zonder GNSS, tegen een tijdsynchronisatiespecificatie van { "20" } ns, elke { "10" } s bemonsterd. Het vergelijkt twee klokken met identieke code en hun <em>eigen</em> gepubliceerde ruis:

seg-3d53622dbe12 = <b>Quantum</b>: een strontium-optische roosterklok, ruimtedoel σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), een doel voor een demonstrator op de grond, niet gevlogen. σ_y(τ) is de Allan-deviatie, de standaardmaat voor de frequentiestabiliteit van een klok bij middelingstijd τ.

seg-e25af6d0752f = <b>Classical</b>: een Microchip SA.45s atoomklok op chipschaal (CSAC), σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datasheet) — een commercieel onderdeel dat in gebruik is.

seg-08f3fdc9252a = Lees de samenvatting van één regel

seg-baa0cc808987 = Met seed = { "42" }, de specificatie van { "20" } ns en de uitval van { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — de optische klok houdt de hele uitval van { "6600" } s vol zonder { "20" } ns te overschrijden. De fasefout in het 95e percentiel is { "1.20e-4" } ns, ongeveer een tienduizendste van een nanoseconde: hij beweegt nauwelijks.

seg-0ba48fccffae = <b><c1/></b> — de CSAC overschrijdt de specificatie van { "20" } ns bij ~{ "2610" } s, minder dan de helft van de uitval. De p95-fasefout ({ "19.7" } ns) zit vlak op de specificatielijn.

seg-b745d05e2bf1 = <b><c1/></b> — dit scenario configureert geen aanval, dus er valt niets te detecteren en de samenvatting drukt geen getal af. De JSON bevat nog wel de analytische detecteerbaarheidsgrens voor spoofing van elke klok in <c2/> ({ "0.997" } voor de optische klok; { "0.000" } voor de CSAC, wier eigen doorloopruis over het venster al meer dan { "20" } ns bedraagt), gemarkeerd met <c3/> in het blok <c4/>. Detectie scoren tegen een echte aanval is het verhaal van <a1>Tutorial { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — hier is dit <em>zelfconsistentie van het filter</em> (het deel van de uitvalsamples binnen de eigen k-sigma-grens van het Kalman-filter), <b>niet</b> een horizontaal of verticaal beschermingsniveau (HPL/VPL) uit de luchtvaart. Zie <a1><c2/></a1>.

seg-7cc0ba5e5d13 = De niet-circulaire onafhankelijke referentie: waarom { "2610" } s voor de CSAC?

seg-2958401e00ca = Voor een klok met witte frequentiemodulatie (white-FM) groeit de 1-σ-fasefout als <b>σ_x(T) ≈ √(q_wf · T)</b>, waarbij <c1/> de eenheid s² heeft. Deze relatie komt uit <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — de relaties tussen σ_y(τ) en fase — de <em>zelfde</em> SP-1065-relatie waartegen <c2/> de Allan-deviatie van de engine controleert tot op ~{ "2" } %.

seg-d6c8f68b42b9 = Voor de CSAC is <c1/>. Los op naar de tijd waarop de 1-σ-fase { "20" } ns = { "2" }×{ "10" }⁻⁸ s bereikt:

seg-0f28d1a1163f = De { "2610" } s van de engine is niet die 1-σ-tijd, en hoort dat ook niet te zijn. <c1/> is het eerste rasterpunt van { "10" } s (<c2/>) waarop de absolute fasefout van <em>deze geseede realisatie</em> { "20" } ns overschrijdt (<c3/>). De eerste doorgang van een random walk door een niveau komt vaak ruim vóór de tijd waarop zijn 1-σ-envelop dat niveau bereikt, en de realisatie draagt ook de restfrequentiefout mee waarmee het filter blijft zitten na de synchronisatie van { "600" } s. De wet legt dus de schaal vast, enkele duizenden seconden voor een klok van { "3" }×{ "10" }⁻¹⁰ tegen { "20" } ns, niet de exacte waarde. De test eist een <b>band van { "2000" }–{ "3200" } s</b> eromheen, niet het getal.

seg-2e7cbdefa9b7 = De datasheet-ankers zelf zijn extern, aangehaald in de <c1/>-teksten van het scenario: optisch Sr-roosterdoel { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datasheet). En de geëxporteerde <c2/> komt overeen met de σ_y(τ) uit de datasheet tot op ~{ "2" } % (<c3/>, NIST SP { "1065" }). Teken hem in de playground als een log-log-grafiek "Klokstabiliteit (ADEV, Allan-deviatie)".

seg-def5271a207d = Wat de test vastlegt

seg-ebddc1f5ffe2 = <c1/> (de optische klok moet minstens even lang volhouden),

seg-8e570268f107 = <c1/> (houdt de volledige uitval vol),

seg-d60483c1af2e = <c1/> — een tolerantieband rond de SP-1065-schaal voor white-FM, <em>niet</em> een magisch getal. De onafhankelijke referentie is de wet, niet de waarde.

seg-e5f926d1055b = Valkuilen en eenheden

seg-0f57e35ed833 = <b>Tijdsynchronisatiecijfers zijn in nanoseconden</b>, nooit in meters. (Positie-holdover is een <em>ander</em> pakket — zie het inertiële deel van Tutorial { "3" }.)

seg-2e476b213141 = <b><c1/> heeft de eenheid s² en is gelijk aan σ_y({ "1" } s)².</b> Dat is de brug van een Allan-getal uit een datasheet naar het model.

seg-75951a150b44 = <b>Holdover is een op het raster gekwantiseerde ondergrens</b> (<c1/>). Lees de exacte waarde niet te letterlijk; lees de <em>band</em>.

seg-959eb86066f1 = <c1/> is hier zelfconsistentie van het filter, geen integriteit in de zin van de luchtvaart.

seg-cb457294fc53 = Hoe nu verder

seg-aa3e50f2c699 = <b>Tier { "2" }:</b> scherp <c1/> aan van { "20" } naar { "10" } en zie de holdover van de CSAC <em>dalen</em> ({ "2610" } s → { "1300" } s, gemeten met <c2/>), of gebruik <c3/> om de holdover uit te zetten tegen het ruisniveau <c4/> van de CSAC (<c5/>: { "25" } punten van { "10" }⁻²⁴ tot { "10" }⁻¹⁸ s², holdover van de klassieke klok { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Tier { "3" }:</b> voeg <c1/> toe om hier een Monte-Carlo-ensemble van te maken en lees de holdoverband [p05–p95] (<c2/> drukt <c3/> af).

seg-9cb56e10f0fd = Daarna het sluitstuk: <a1>Tutorial { "3" } — Quantum tegenover klassieke veerkracht</a1>.

seg-7dc19a98c7ee = <s1>Vorige</s1>{ "1" } · Uw eerste baan

seg-c274e92fdcb5 = <s1>Volgende</s1>{ "3" } · Quantum tegenover klassiek
