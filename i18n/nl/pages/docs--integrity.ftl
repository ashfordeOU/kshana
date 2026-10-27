# docs--integrity: translations (nl)

seg-668241606715 = Bron: <c1/>

seg-9a8c218ce054 = Integriteit en beveiliging: wat Kshana modelleert en wat niet

seg-52038c93765d = Kshana rapporteert twee kwaliteitsmaten (FoM's) — <b>Integriteit</b> en <b>Beveiliging</b> — die gemakkelijk worden verward met de gelijknamige grootheden uit de luchtvaart. Deze pagina zet nuchter uiteen wat ze nu zijn, wat ze <em>niet</em> zijn en wat de roadmap toevoegt. Beoordeelt u Kshana voor een toepassing waarin mensenlevens op het spel staan of voor certificering, lees dit dan eerst.

seg-fb6e93a107e7 = Vandaag ({ "v0.37.0" })

seg-ecd20ae1a05d = Integriteits-FoM — zelfconsistentie van het filter

seg-153391e55508 = De integriteits-FoM is het aandeel van de uitvalsamples waarvan de werkelijke tijdsfout binnen de eigen k-sigma-beveiligingsgrens van het Kalman-filter blijft:

seg-ac2413a97a7b = Dit meet of de <em>zelf gerapporteerde</em> onzekerheid van het filter eerlijk is over zijn <em>eigen</em> fout tijdens een uitval van GNSS (global navigation satellite system). Het is een nuttige interne consistentiecontrole.

seg-c9f80760ea53 = Het is <b>niet</b>:

seg-8899525ad177 = een <b>horizontaal/verticaal beveiligingsniveau (HPL/VPL)</b> — er is helemaal geen beveiligingsniveau in het positiedomein (de klokpakketten liggen in het tijdsynchronisatiedomein);

seg-dd9a3e58e10b = een <b>integriteitsrisico of kans op gevaarlijk misleidende informatie (P_HMI)</b>;

seg-31fa92b3271d = een vergelijking met een <b>alarmgrens</b>;

seg-ee998b974e6f = in overeenstemming met <b>RTCA DO-229E / DO-316</b> of <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) of enige andere certificeringsnorm.

seg-f84a56b6fe10 = Beveiligings-FoM — analytische grens voor spoof-detecteerbaarheid

seg-e532288ed262 = De beveiligings-FoM is een <b>op klokstabiliteit gebaseerde grens voor spoof-detecteerbaarheid</b>: gegeven de ruis van een klok (PSD's (power spectral densities) van witte frequentieruis en random walk) en een bewakingsvenster is het de analytische detectiemarge van een consistentiemonitor met één klok tegen een langzaam oplopende spoofing met valse tijd. Een rustigere klok (bijvoorbeeld een optische klok) detecteert een kleinere, tragere spoof dan een ruisigere (bijvoorbeeld een CSAC (chip-scale atomic clock)) — dat contrast is de kern van de demonstrator.

seg-fc718a805b28 = Het is <b>niet</b> een RAIM-detector (receiver autonomous integrity monitoring) met meerdere satellieten. Er zijn geen pseudorange-residuen over satellieten heen, geen beveiligingsniveau en geen P_HMI. De innovatie-ten-opzichte-van-sigma-test heeft dezelfde wiskundige vorm als klassieke RAIM-foutdetectie (Brown), maar het getal is een analytische grens voor een gegeven klok, geen RAIM-implementatie, en het is alleen zinvol in de context van een geconfigureerd spoofingscenario (zie het scenariotype <c1/>, dat een werkelijke oplopende aanval injecteert).

seg-ae770e25031e = De uitvoer zegt dat ook. De typen <c1/>, <c2/>, <c3/> en <c4/> configureren geen aanval, dus hun samenvatting van één regel toont <c5/> in plaats van een getal, en hun resultaatdocument markeert <c6/> als <c7/>, met de reden, in het blok <c8/>. De waarde zelf blijft in het document voor wie de grens wil hebben.

seg-960bd91a2b3a = Echte snapshot-, oplossingsscheidings- en ARAIM-RAIM (<c1/>)

seg-3d31ec251ac0 = Een echte RAIM in het positiedomein is geïmplementeerd in <c1/>, los van de zelfconsistentie-FoM hierboven:

seg-0e8240812c16 = <b>Residubewaking met meerdere satellieten</b> — ze bouwt de geometriematrix van de zichtlijnen naar de zichtbare satellieten op, vormt de kleinste-kwadratenoplossing voor positie en klok en toetst de som van de gekwadrateerde residuen.

seg-69f1535596e0 = <b>χ²-foutdetectie</b> — <c1/> (SSE: som van de gekwadrateerde residuen) is χ²(n−{ "4" }) onder de hypothese zonder fout; boven <c2/> wordt een fout vastgesteld. De χ²-drempels komen uit een afhankelijkheidsvrije evaluatie van de geregulariseerde onvolledige gammafunctie (exact, geen tabellen).

seg-6721779048f5 = <b>HPL / VPL op basis van de helling</b> — <c1/>, waarbij <c2/> de positiefoutgevoeligheid per satelliet uit de hoedmatrix is en <c3/> de niet-centrale-χ²-bias die voldoet aan de geconfigureerde kans op gemiste detectie <c4/>.

seg-8dd60e98088d = <b>RAIM met oplossingsscheiding (MHSS: multiple-hypothesis solution separation)</b> — voor de oplossing met alle satellieten in zicht en elke deeloplossing met één uitgesloten satelliet <b>detecteert en identificeert</b> de geneste schattersscheiding <c1/> de defecte satelliet en voedt ze de grens van het beveiligingsniveau.

seg-719e27fdd2c1 = <b>Budget voor integriteitsrisico (P_HMI) van ARAIM (advanced receiver autonomous integrity monitoring)</b> — <c1/> lost het kleinste HPL/VPL op waarvan de som van de kansen op gevaarlijk misleidende informatie <c2/> (Blanch et al., <em>Baseline ARAIM</em>) voldoet aan een expliciete toewijzing van integriteitsrisico, en rapporteert het risico dat de niveaus bereiken — zodat integriteit rechtstreeks kan worden afgewogen tegen de alarmgrens, in plaats van impliciet te blijven in een vaste <c3/>-vermenigvuldiger.

seg-2f99acf45203 = <b>Stanford–ESA-integriteitsdiagram</b> (ESA: European Space Agency) — een accumulator per epoch deelt <c1/> in gebieden in: beschikbaar / systeem niet beschikbaar / misleidend / gevaarlijk misleidend, voor een beschikbaarheidssamenvatting.

seg-33d01969fb0f = <b>Van begin tot eind bereikbaar</b> — het scenariotype <c1/> voert het bovenstaande uit over een SGP4-constellatie (Simplified General Perturbations { "4" }) of een Kepler-constellatie, of een constellatie die uit echte TLE's (two-line element sets) of een RINEX-navigatiebestand (Receiver Independent Exchange Format) is gelezen, en levert een HPL/VPL-beschikbaarheidskaart per epoch op tegen de geconfigureerde alarmgrenzen (<c2/>). Dezelfde run <b>exporteert een verticaal Stanford-diagram</b>: op elk beschermd epoch wordt een gezaaide, reproduceerbare foutloze afstandsfoutentrekking via de geometrie omgezet in een werkelijke verticale fout en ingedeeld tegen de VPL en de verticale alarmgrens, zodat het JSON-resultaat (JavaScript Object Notation) en de CLI-samenvatting (command-line interface) de aantallen per gebied bevatten (integriteitsgebeurtenissen, en HMI: hazardously misleading information) — en niet alleen een beschikbaarheidsfractie. Op de meegeleverde <c3/> meldt de run { "344" } van { "361" } epochs beschikbaar ({ "95.3" } %) bij een horizontale alarmgrens van { "40" } m en een verticale van { "50" } m, met { "0" } integriteitsgebeurtenissen en { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM met twee constellaties en een integriteitsondersteuningsbericht</b> — <c1/> voegt de <b>foutmodus voor een hele constellatie</b> toe: naast de hypothesen zonder fout en met één satelliet draagt elke constellatie één hypothese bij die al haar satellieten verwijdert, met a-priorikans <c2/>, aan dezelfde MHSS-integriteitsrisicosom. Het <c3/> (ISM) bevat de nauwkeurigheid van de afstand voor integriteit (<c4/>), de kwadratisch gemiddelde nauwkeurigheid (<c5/>), de maximale nominale bias <c6/>, eenzijdig in elke modus opgenomen, en de a-priorikansen <c7/> en <c8/>; de referentieset van WG-C (Working Group C van de samenwerking tussen de Europese Unie en de Verenigde Staten op het gebied van satellietnavigatie, wier technische subgroep voor ARAIM de referentie publiceert) is σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } en P_const = { "1e-4" }. <c9/> reproduceert het <c10/>-resultaat met één fout bit voor bit. Het type <c11/> neemt dit pad met <c12/> (<c13/>: GPS + Galileo, { "48" } satellieten, { "145" } van { "145" } epochs beschikbaar bij dezelfde alarmgrenzen).

seg-1f06bc1976bd = <b>Beveiligingsniveaus tegen gepubliceerde referentievectoren</b> — het type <c1/> voert de <c2/> en <c3/> van de engine uit op de eigen uitgewerkte voorbeelden van de ARAIM-subgroep van WG-C (de Reference Airborne Algorithm Description Document v3.1, { "2019" }, Appendix D, en het Milestone { "3" } Report, { "2016" }, Annex A). Het grootste verschil in verticaal/horizontaal beveiligingsniveau op de acceptatievector is { "0.0437" } m tegen de eigen tolerantie van de documenten van { "0.05" } m. Deze rij is VALIDATED in <a1><c4/></a1>: ze controleert de vergelijking voor het beveiligingsniveau, geen operationeel ISM en geen ontvanger.

seg-1dda7b318c5f = De resterende lacune (roadmap)

seg-e27215296e1a = Wat <c1/> nog <b>niet</b> doet:

seg-964c0634eae0 = het is <b>niet opgenomen in de FoM van het klok-/holdover-scenario</b> — die pakketten rapporteren nog steeds de zelfconsistentiecijfers van het filter voor integriteit hierboven, geen HPL/VPL;

seg-eecf2f9f181e = de foutenhypothesen zijn het geval zonder fout, <b>afzonderlijke satellieten</b> en <b>hele constellaties</b> — gelijktijdige fouten op <b>deelverzamelingen van twee of meer satellieten (SV: space vehicle, dat is een satelliet)</b> worden niet gemodelleerd;

seg-fd0f9fb2de83 = het ISM is een configureerbare parameterset (met de referentiewaarden van WG-C), geen uitgezonden operationeel bericht en geen getoetst bedreigingsmodel;

seg-88f5242b0809 = <b>foutdetectie en -uitsluiting (FDE)</b> is alleen voor één satelliet en alleen voor een snapshot: oplossingsscheiding wijst de defecte satelliet aan, en <c1/> lost elke uitsluiting van één satelliet opnieuw op en geeft de uitgesloten satelliet terug met de chikwadraattest en de beveiligingsniveaus van de resterende deelverzameling, maar er wordt geen tegen uitsluiting beschermde positie gerapporteerd, en het scenariotype <c2/> voert de uitsluitingsstap niet uit.

seg-c85aa5dedc86 = De kernen voor snapshot, oplossingsscheiding en ARAIM worden beproefd op <b>echte geometrie van nauwkeurige IGS-banen (International GNSS Service) (SP3: Standard Product { "3" })</b>, en niet alleen op synthetische constellaties: <c1/> vormt de zichtlijngeometrie uit het eerste epoch van een echt IGS-SP3-product op een echt grondstation en controleert dat de beveiligingsniveaus eindig zijn en binnen de APV-I-alarmgrenzen (approach with vertical guidance) van { "40" } m horizontaal en { "50" } m verticaal liggen, dat een pseudorange-bias van { "60" } m de χ²-monitor activeert, dat oplossingsscheiding de defecte satelliet <b>identificeert</b> en dat de niveaus van ARAIM voldoen aan de toegewezen <c2/>. <c3/> voert het pad met twee constellaties uit op de echte Celestrak-catalogi van GPS en Galileo van 2026-06-07, gepropageerd naar één gemeenschappelijk epoch (zie <a1><c4/></a1> §{ "3" }). Een diepere kruiscontrole — het epoch voor epoch vergelijken van beveiligingsniveaus met gLAB (de GNSS-Lab Tool, een door ESA verspreide software voor GNSS-gegevensverwerking) over een volledige RINEX-waarnemingsboog — zou pariteit in het ontvangerdomein toevoegen. Die is niet gedaan: het type <c5/> berekent een enkelvoudige codepositie uit echte RINEX-waarnemingen, maar geen enkel beveiligingsniveau uit die oplossing is met gLAB vergeleken.

seg-f5fac2e836a6 = <c1/> is dus een echte kern voor beveiligingsniveau en integriteitsrisico, bereikbaar vanuit de scenariotypen <c2/> en <c3/>, beproefd op geometrie van echte referentiebanen en gecontroleerd tegen de referentievectoren van WG-C. Fouten in deelverzamelingen van meerdere satellieten, pariteit met gLAB in het ontvangerdomein en integratie met de klok-FoM blijven roadmap-onderwerpen, en niets hiervan is bewijs voor certificering.

seg-487f24ed92d8 = <a1><c1/></a1> — definities van één regel van elke FoM en afkorting.

seg-7d3c12cf802e = <a1><c1/></a1> — de ISM-parameters en de referentievectoren van WG-C.

seg-04532ba5288f = <a1><c1/></a1> — het beveiligingsniveau voor tijdsynchronisatie (TPL) van een uitlopende klok, dat afhankelijk is van detectie.

seg-43cea496da93 = <a1><c1/></a1> — welke grootheden aan een referentie zijn getoetst en welke zelfconsistentiecontroles zijn.

seg-3037dde8135f = <c1/> — de afleiding van de grens voor spoof-detecteerbaarheid.

seg-04d63778ca7f = RAIM naast de kwaliteitsmaten voor klok-holdover ({ "0.36" }, opt-in)

seg-744e95749978 = Een klokscenario kan een sectie <c1/> bevatten (<c2/>): een locatie (<c3/>, <c4/>, <c5/>), constellatievoorinstellingen (<c6/>, standaard <c7/>), een masker, een sigma van het afstandsresidu, de kansen op valse alarmen en gemiste detectie, de horizontale en verticale alarmgrenzen, een epoch-interval en een optionele opgegeven bias op één satelliet. De run rapporteert dan een afzonderlijk blok <c8/>: per epoch de satellieten in zicht, de snapshot-RAIM-beveiligingsniveaus en een oordeel (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), en de aantallen en de beschikbaarheid over de run. Zolang de tijdlijn aangeeft dat GNSS wordt geweigerd, is RAIM niet beschikbaar en wordt niets geëxtrapoleerd; een gedegradeerd venster wordt als nominaal beoordeeld. De kwaliteitsmaten voor holdover blijven ongewijzigd en zonder de sectie is de uitvoer byte-identiek. MODELLED: een representatieve voorinstelling van de hemel, synthetische residuen en opgegeven grenzen. Het vereist <c14/>.

seg-139639263c90 = De reproductie van de maximale URA uit Milestone { "3" } van de ARAIM-werkgroep WG-C van EU en VS (CAP-05c)

seg-97906754d4c8 = Een eerder plan beloofde een vergelijking met "Table A-3" van een technische notitie over EU-ARAIM. Voor die tabel kon geen openbare bron worden gevonden (de openbare rapporten Milestone { "1" } tot en met { "3" } van de ARAIM Technical Subgroup van de EU-US Working Group C bevatten geen Table A-3), dus die vergelijking is <b>ingetrokken</b> en onder die naam wordt niets beloofd.

seg-b61607c477f2 = Wat in plaats daarvan wordt geprobeerd, is het rapport dat openbaar is: het <b>Milestone { "3" } Report</b> ({ "25" } februari { "2016" }, kopie van GPS.gov, SHA-256 <c1/>), Tables { "5" }, { "6" } en { "7" }, die voor elke constellatieconfiguratie en voor zowel RNP { "0.1" } als RNP { "0.3" } de grootste <c2/> afdrukken waarvoor { "90" } % van de gebruikers { "99.5" } % beschikbaarheid heeft. Twaalf afgedrukte items (de rijen Depleted en Baseline van de dualefrequentietabellen) worden gecontroleerd, volgens drempels die vóór elke beoordeelde run zijn vastgelegd in <a1><c3/></a1>, met de afwijkingen die niet kunnen worden weggenomen daar vermeld: geen almanakbestanden, Walker-schillen in plaats van de echte slots, een grovere rasterafstand en stap, en het horizontale ADD v4.2-pad van de engine in plaats van de eigen tekst van het rapport. Tables { "8" } tot en met { "13" } (enkele frequentie) en de rijen Optimistic worden niet geprobeerd, met de daar genoemde redenen. <b>Resultaat: { "8" } van de { "12" } items gereproduceerd, { "4" } NOT MET (vastgepind):</b> de items met twee constellaties en alle items met alleen Galileo komen overeen (inclusief de N/A-rijen), het item met twee constellaties Depleted RNP { "0.1" } bereikt dekking { "0.847" } bij { "9" } m tegen de afgedrukte { "9" } m (vereist { "0.90" }), en drie items met alleen GPS missen ruim (dekking { "0.70" } bij { "4" } m, { "0.58" } bij { "6" } m, { "0.65" } bij { "10" } m tegen afgedrukt { "4" } m, { "6" } m en ">{ "10" } m"). De missers bij alleen GPS kunnen komen doordat de uniforme Walker-schil in de plaats komt van de echte GPS-slots (D1); dat is een hypothese, geen bevinding. Het resultaat blijft MODELLED, wat het ook is. De studie is <c4/>; de gemeten dekkingen staan in <c5/> en worden beoordeeld door <c6/>. Het rapport zelf wordt geciteerd, niet meegeleverd.

seg-0e98826cedcc = <s1>Vorige</s1>Hardwareveiligheid

seg-e6f1e38977b7 = <s1>Volgende</s1>Spectrum en waterfall

seg-38ab3bb65327 = Echte snapshot-, oplossingsscheidings- en ARAIM-RAIM (src/raim.rs)
