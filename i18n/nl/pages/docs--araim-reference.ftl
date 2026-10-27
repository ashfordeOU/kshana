# docs--araim-reference: translations (nl)

seg-c316596d7ec8 = Bron: <c1/>

seg-4768b19aaed7 = ARAIM-naslag — advanced RAIM-beschermingsniveaus in { -brand }

seg-93c83a737a43 = Deze notitie documenteert de open implementatie van <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> door { -brand }: het algoritme, elke aanname, het integriteitsondersteuningsbericht dat het verwerkt en de validatiestatus. De implementatie staat in <a1><c1/></a1>; dit document is de proza-tegenhanger die een auditor (of een inkoopbeoordelaar) naast de code kan lezen.

seg-f5a7abecc2df = ARAIM is de dual-constellation-opvolger met meerdere frequenties van klassieke RAIM, die de GPS (Global Positioning System)–Galileo Working Group C (WG-C) heeft gedefinieerd om horizontale en verticale geleiding tot LPV-200 te ondersteunen (LPV: localizer performance with vertical guidance). Het beantwoordt voor elke epoch één enkele vraag:

seg-252dac107a2a = Hoe groot moet de grens voor de positiefout (het <em>beschermingsniveau</em>) zijn, opdat de restkans op <em>gevaarlijk misleidende informatie</em> — een fout groter dan de grens terwijl de grens nog binnen de alarmlimiet valt — onder het integriteitsrisicobudget <c1/> blijft?

seg-04299e9742b7 = { "1" }. Het integriteitsondersteuningsbericht (ISM)

seg-717bea7d6bc8 = Het ISM is de parameterset per constellatie die de gebruiker toepast. Het wordt expliciet gemodelleerd door <a1><c1/></a1>:

seg-fffbeccd4266 = Symbool

seg-2247a2344710 = Betekenis

seg-d7e49778bed2 = σ_URE / SISE (signal-in-space error)

seg-b1b5bca63e21 = RMS van de afstandsfout (root mean square), gebruikt voor <b>nauwkeurigheid en continuïteit</b>

seg-8ff2973d7f5b = σ_URA / SISA (signal-in-space accuracy)

seg-f993962a5c9b = grens voor de afstandsfout, gebruikt voor <b>integriteit</b> (≥ σ_URE)

seg-727c7fbe1b01 = maximale nominale afstandsbias, eenzijdig in de integriteitsgrens opgenomen (<c1/>); zie §{ "3" }

seg-a79e42c29c46 = a-priorikans op een niet-gedetecteerde fout in één satelliet

seg-78c45312d2ff = a-priorikans op een fout in de hele constellatie

seg-19cc5ff2e541 = <c1/> geeft de gepubliceerde referentiewaarden van WG-C terug: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> over het blootstellingsinterval. Dit zijn de waarden waarmee in de referentieliteratuur de ARAIM-beschikbaarheid wordt gedimensioneerd; het operationele ISM wordt uitgezonden of op de grond samengesteld en is per constellatie configureerbaar. Het onderscheid tussen σ_URA (integriteit) en σ_URE (nauwkeurigheid) is bewust gemaakt en is het bepalende kenmerk van het ISM-concept.

seg-0c1687628e67 = <c1/> en <c2/> geven deze rechtstreeks door aan de twee engines.

seg-8c516e53f595 = { "2" }. Foutenhypothesen

seg-b6353366ebf0 = ARAIM is een <em>multiple hypothesis solution separation</em>-methode (MHSS). Voor elke foutenhypothese <c1/> vormt het de all-in-view-oplossing en de deeloplossing die de verstoorde verzameling uitsluit, en begrenst het de positiefout onder die hypothese:

seg-3b340e082b84 = <c1/> (prior <c2/>): de volledige all-in-view-positiebepaling met kleinste kwadraten.

seg-03332e433edc = Fouten in één satelliet

seg-add4792e4e40 = <c1/> (prior <c2/> elk): elke deeloplossing met uitsluiting van één satelliet. Dit is de klassieke ARAIM-basislijn voor één fout, <a1><c3/></a1>.

seg-7e20f419e670 = Fouten in de hele constellatie

seg-920bd35833ff = <c1/> (prior <c2/> elk): de deeloplossing die <em>alle</em> satellieten van één constellatie tegelijk verwijdert, de uitbreiding van de EU (Europese Unie) ARAIM TN (technische nota) / DO-316 die in <a1><c3/></a1> is geïmplementeerd. Met <c4/> reduceert dit <b>bit voor bit</b> tot <c5/>.

seg-323dd205d238 = { "3" }. Beschermingsniveaus

seg-9ab2676d2554 = Voor elke as (verticaal, horizontaal) en elke hypothese bouwt de engine een modus <c1/> waarbij de drempel de detectielimiet van de solution separation is bij de vals-alarmvermenigvuldiger <c2/> (een Bonferroni-verdeling van het continuïteitsbudget over de <c3/> hypothesen). Het beschermingsniveau is de kleinste grens <c4/> waarvan het opgetelde integriteitsrisico

seg-05c0d8fc855c = Implementatienotitie.

seg-248092fe9b94 = <c1/> is de eenzijdige projectie van de nominale bias op de as — de worstcasesom van de grootten van de versterkingen per satelliet (<a1><c2/>/<c3/></a1>) — afkomstig uit de <c4/> van het ISM. Het WG-C-referentie-ISM gebruikt <c5/>; met <c6/> reduceert de grens tot de MHSS-vorm zonder nominale bias. Het uitvoerbare scenario <c7/> maakt <c8/> beschikbaar (de integriteitsgrens die voor het beschermingsniveau wordt gebruikt, afgekapt tot ≥ <c9/> en daar standaard aan gelijk) en <c10/> (standaard { "0" }), zodat het beschermingsniveau altijd wordt gedimensioneerd met de integriteitsgrens σ_URA, nooit met de kleinere nauwkeurigheid σ_URE. Dit blijft een <b>gemodelleerde, niet-gecertificeerde</b> ARAIM-implementatie — zie <a2><c11/></a2>.

seg-f6bccff61ff5 = voldoet aan het toegewezen budget ([<c1/>] / <a1><c2/></a1>). VPL (vertical protection level) en HPL (horizontal protection level) zijn het verticale en het horizontale antwoord. Het resultaat rapporteert ook het daadwerkelijk bereikte integriteitsrisico (<c3/> de toewijzing) en of een deeloplossing verder dan haar drempel afweek.

seg-b1a868221848 = Dit is het expliciete ARAIM-contract — „hoe groot moet de grens zijn?” — in plaats van het impliciete, van geometrie afhankelijke risico van een klassieke RAIM met vaste vermenigvuldiger.

seg-c90cf313dea8 = { "4" }. Stanford-diagram

seg-b51e44c3deda = <a1><c1/></a1> verzamelt <c2/> per epoch tegen een vaste alarmlimiet (AL) en <a2><c3/></a2> deelt elke in als <em>beschikbaar</em>, <em>systeem niet beschikbaar</em> (PL > AL, conservatief), <em>misleidende informatie</em> (PL < fout ≤ AL) of <em>gevaarlijk misleidende informatie</em> (fout > AL en > PL). <a3><c4/></a3> tekent de klassieke puntenwolk — de integriteitsgrens <c5/>, de hulplijnen van de alarmlimiet en één kleurgecodeerde markering per epoch — als een op zichzelf staande SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Het voordeel van twee constellaties

seg-96e114a6981c = Twee effecten worden aangetoond in <c1/>:

seg-06c7d8d62b44 = <b>Geometrie / redundantie</b> — het samenvoegen van de satellieten van een tweede constellatie verkleint de HPL voor één fout: meer metingen en een grotere verzameling deeloplossingen met één SV (SV: space vehicle, dat is een satelliet) geven een strikt kleinere grens.

seg-f788c9e07547 = <b>Tolerantie voor constellatiefouten</b> — met <c1/> actief blijft de gebruiker met twee constellaties beschikbaar wanneer een hele constellatie kan uitvallen (satellieten van de <em>andere</em> constellatie blijven over), terwijl een gebruiker met één constellatie aantoonbaar niet kan worden beschermd tegen de fout van zijn eigen constellatie (<c2/> geeft <c3/> terug).

seg-f52a937bad94 = Een subtiliteit die eerlijk vermeld moet worden: omdat de hypothese van een constellatiefout vereist dat het verlies van een <em>hele</em> constellatie wordt overleefd, wordt het <em>momentopname</em>-beschermingsniveau met twee constellaties van onderen begrensd door de resterende geometrie van één constellatie — het is niet automatisch op elk moment kleiner dan de PL met alleen GPS. Het hoofdresultaat van de EU ARAIM TN dat GPS+Galileo een <b>{ "15" }–{ "25" } % kleinere HPL</b> geeft, is een <b>beschikbaarheids</b>resultaat dat over realistische constellaties en gebruikerslocaties is opgebouwd, geen garantie per momentopname.

seg-b4289b877902 = { "6" }. Validatiestatus

seg-e553de2eee63 = <b>In de repository, geautomatiseerd:</b> de MHSS-algebra (<c1/> ⇒ bit voor bit één fout; een constellatiefout verbreedt de PL; het budget wordt nooit overschreden), de bovenstaande voordelen voor geometrie en constellatiefouten, en toepassing op <b>echte precieze-baangeometrie van IGS (International GNSS Service; GNSS = global navigation satellite system) (SP3, Standard Product { "3" })</b> (<c2/>), niet alleen op synthetische constellaties.

seg-633bf11af170 = <b>Externe onafhankelijke referentie — het gepubliceerde uitgewerkte voorbeeld van WG-C:</b> de beschermingsniveaus worden gecontroleerd tegen het eigen numerieke voorbeeld van de ARAIM Technical Subgroup, in <a1><c1/></a1>, <c2/> en het vastgelegde fixture <c3/> (elke vector draagt zijn ophaal-URL (webadres), ophaaldatum, SHA-256 van het bronbestand (SHA: Secure Hash Algorithm) en pagina). De acceptatietolerantie is de eigen <c4/> van de referentie. Tegen het Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Appendix D: <b>VPL { "18.2926" } m tegenover { "18.3" } m gepubliceerd (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m tegenover { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effective monitor threshold) { "7.2997" } m tegenover { "7.2998" } m, σ_v,acc { "1.3694" } m tegenover { "1.3694" } m, en alle zes gepubliceerde tussenwaarden voor constellatiefouten (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) binnen een halve eenheid in hun laatste afgedrukte decimaal. Het Milestone { "3" } Report van { "2016" } vermeldt hetzelfde voorbeeld maar bevat twee interne gebreken — een tekentypfout in rij { "3" } van <c5/>, en een <c6/> die voor { "57" } foutmodi is geëvalueerd terwijl het document <c7/> ({ "12" } modi) vermeldt — dus de tussenwaarden voor geometrie worden exact gereproduceerd, terwijl de beschermingsniveaus ervan zijn vastgelegd als gemeten afwijkingen (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) en buiten het acceptatiecijfer zijn gehouden. De controle is bereikbaar als de scenariosoort <c8/>.

seg-6d79f9836abd = <b>Eerlijk restpunt (extern / in afwachting van beoordeling):</b> het beschikbaarheidscijfer van { "15" }–{ "25" } % tegen een <b>op versie vastgezette momentopname van echte Celestrak-TLE's (two-line element set)</b>, en het deponeren van de ARAIM-testfixtures als een citeerbaar <b>Zenodo</b>-record. De bovenstaande referentiecontrole dekt alleen <c1/> (foutmodi voor één satelliet en één constellatie); gelijktijdige deelverzamelingen van fouten met meerdere gebeurtenissen, foutuitsluiting, de χ²-consistentiecontrole en de herallocatiestap tegen dubbeltelling van het referentie-algoritme zijn niet geïmplementeerd, en een geval waarvoor de priors die nodig zouden hebben, wordt geweigerd in plaats van afgekapt.

seg-b57b889dc536 = <b>Bereik via scenariobestand:</b> de scenariosoort <c1/> voert <c2/> uit bij elke epoch wanneer zijn TOML-bestand (Tom's Obvious Minimal Language) <c3/> instelt (optioneel <c4/>); het meegeleverde <a1><c5/></a1> doet dat over een samengevoegde GPS + Galileo-geometrie, en <c6/> voert dezelfde engine uit op echte Celestrak-TLE's van GPS en Galileo die naar één gemeenschappelijke epoch zijn gepropageerd. Zonder de vlag gebruikt de runner klassieke solution-separation-RAIM.

seg-6cb7a787ac67 = Referenties

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } februari { "2016" } — Annex A (referentiegebruikersalgoritme) en §A.IX (numeriek voorbeeld). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } juni { "2019" } — Appendix D (numeriek voorbeeld voor LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (Verenigde Staten) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (voorheen de Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimum operational performance standards); materiaal van DO-316 ARAIM MASPS (minimum aviation system performance standards).

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (methodologie van het Stanford-diagram).

seg-d4f50d307775 = <s1>Vorige</s1>Spectrum en waterfall

seg-f05ca316fe8e = <s1>Volgende</s1>DO-316 / DO-229E-koppeling
