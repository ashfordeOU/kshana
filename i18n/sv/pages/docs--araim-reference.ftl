# docs--araim-reference: translations (sv)

seg-c316596d7ec8 = Källa: <c1/>

seg-4768b19aaed7 = ARAIM-referens — protektionsnivåer för avancerad RAIM i Kshana

seg-93c83a737a43 = Den här anteckningen dokumenterar Kshanas öppna implementation av <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: algoritmen, varje antagande, integritetsstödmeddelandet den använder och valideringsstatusen. Implementationen finns i <a1><c1/></a1>; det här dokumentet är den löpande texten som en granskare (eller en upphandlingsgranskare) kan läsa vid sidan av koden.

seg-f5a7abecc2df = ARAIM är den tvåkonstellations- och multifrekvensbaserade efterföljaren till klassisk RAIM som arbetsgruppen GPS (Global Positioning System)–Galileo Working Group C (WG-C) definierade för att stödja horisontell och vertikal vägledning ner till LPV-200 (LPV: localizer performance with vertical guidance). Den besvarar en enda fråga för varje epok:

seg-252dac107a2a = Hur stor måste positionsfelsgränsen (<em>protektionsnivån</em>) vara för att den kvarstående sannolikheten för <em>farligt vilseledande information</em> — ett fel större än gränsen medan gränsen fortfarande ligger inom larmgränsen — ska ligga under integritetsriskbudgeten <c1/>?

seg-04299e9742b7 = { "1" }. Integritetsstödmeddelandet (ISM)

seg-717bea7d6bc8 = ISM är den parameteruppsättning per konstellation som användaren tillämpar. Den modelleras uttryckligen av <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydelse

seg-d7e49778bed2 = σ_URE / SISE (signal-in-space error)

seg-b1b5bca63e21 = RMS (root mean square) för avståndsfel som används för <b>noggrannhet och kontinuitet</b>

seg-8ff2973d7f5b = σ_URA / SISA (signal-in-space accuracy)

seg-f993962a5c9b = gräns för avståndsfel som används för <b>integritet</b> (≥ σ_URE)

seg-727c7fbe1b01 = största nominella avståndsbias som viks in ensidigt i integritetsgränsen (<c1/>); se §{ "3" }

seg-a79e42c29c46 = a priori-sannolikhet för ett oupptäckt fel hos en enskild satellit

seg-78c45312d2ff = a priori-sannolikhet för ett fel som omfattar hela konstellationen

seg-19cc5ff2e541 = <c1/> returnerar de publicerade referensvärdena från WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> över exponeringsintervallet. Det är de värden som används för att dimensionera ARAIM-tillgänglighet i referenslitteraturen; den operativa ISM sänds ut eller sammanställs på marken och kan konfigureras per konstellation. Skillnaden mellan σ_URA (integritet) och σ_URE (noggrannhet) är avsiktlig och är ISM-begreppets utmärkande drag.

seg-0c1687628e67 = <c1/> och <c2/> lämnar över dessa direkt till de två motorerna.

seg-8c516e53f595 = { "2" }. Felhypoteser

seg-b6353366ebf0 = ARAIM är en metod med <em>solution separation för flera hypoteser</em> (MHSS). För varje felhypotes <c1/> bildar den lösningen med alla satelliter i sikte och delllösningen som utesluter den felande mängden, och begränsar positionsfelet under den hypotesen:

seg-3b340e082b84 = <c1/> (a priori <c2/>): den fullständiga minstakvadratbaserade positionsbestämningen med alla satelliter i sikte.

seg-03332e433edc = Fel hos enskilda satelliter

seg-add4792e4e40 = <c1/> (a priori <c2/> vardera): varje delllösning där en satellit utesluts. Detta är den klassiska ARAIM-baslinjen för enkelfel, <a1><c3/></a1>.

seg-7e20f419e670 = Fel som omfattar hela konstellationen

seg-920bd35833ff = <c1/> (a priori <c2/> vardera): delllösningen som tar bort <em>alla</em> satelliter i en konstellation på en gång, den EU-baserade utvidgningen enligt ARAIM TN (teknisk anmärkning) / DO-316 som är implementerad i <a1><c3/></a1>. Med <c4/> reduceras detta <b>bit för bit</b> till <c5/>.

seg-323dd205d238 = { "3" }. Protektionsnivåer

seg-9ab2676d2554 = För varje axel (vertikal, horisontell) och varje hypotes bygger motorn ett läge <c1/> där tröskeln är detektionsgränsen för solution separation vid multiplikatorn för falsklarm <c2/> (en Bonferroni-uppdelning av kontinuitetsbudgeten över de <c3/> hypoteserna). Protektionsnivån är den minsta gräns <c4/> vars summerade integritetsrisk

seg-05c0d8fc855c = Implementationsanmärkning.

seg-248092fe9b94 = <c1/> är den ensidiga projektionen av nominell bias på axeln — summan i värsta fall av storlekarna på förstärkningen per satellit (<a1><c2/>/<c3/></a1>) — hämtad från ISM:s <c4/>. Referens-ISM från WG-C använder <c5/>; med <c6/> reduceras gränsen till MHSS-formen utan nominell bias. Det körbara scenariot <c7/> exponerar <c8/> (den integritetsgräns som används för protektionsnivån, begränsad till ≥ <c9/> och med den som standard) och <c10/> (standard { "0" }), så protektionsnivån dimensioneras alltid med integritetsgränsen σ_URA, aldrig den mindre noggrannhetsgränsen σ_URE. Detta förblir en <b>modellerad, icke-certifierad</b> ARAIM-implementation — se <a2><c11/></a2>.

seg-f6bccff61ff5 = ryms inom den tilldelade budgeten ([<c1/>] / <a1><c2/></a1>). VPL (vertikal protektionsnivå) och HPL (horisontell protektionsnivå) är de vertikala och horisontella svaren. Resultatet rapporterar också den integritetsrisk som faktiskt uppnåtts (<c3/> tilldelningen) och om en delllösning separerade bortom sin tröskel.

seg-b1a868221848 = Detta är det uttryckliga ARAIM-kontraktet — "hur stor måste gränsen vara?" — snarare än den implicita, geometriberoende risken hos en klassisk RAIM med fast multiplikator.

seg-c90cf313dea8 = { "4" }. Stanford-diagram

seg-b51e44c3deda = <a1><c1/></a1> samlar <c2/> per epok mot en fast larmgräns (AL) och <a2><c3/></a2> sorterar var och en som <em>tillgänglig</em>, <em>systemet otillgängligt</em> (PL > AL, konservativt), <em>vilseledande information</em> (PL < fel ≤ AL) eller <em>farligt vilseledande information</em> (fel > AL och > PL). <a3><c4/></a3> renderar det klassiska spridningsdiagrammet — integritetsgränsen <c5/>, larmgränsens hjälplinjer och en färgkodad markör per epok — som en fristående SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Fördelen med två konstellationer

seg-96e114a6981c = Två effekter demonstreras i <c1/>:

seg-06c7d8d62b44 = <b>Geometri / redundans</b> — att slå ihop en andra konstellations satelliter skärper HPL för enkelfel: fler mätningar och en större mängd delllösningar för enskilda SV (SV: space vehicle, det vill säga en satellit) ger en strikt mindre gräns.

seg-f788c9e07547 = <b>Tolerans mot konstellationsfel</b> — med <c1/> aktiv förblir användaren med två konstellationer tillgänglig när en hel konstellation kan falla bort (satelliterna i den <em>andra</em> konstellationen överlever), medan en användare med en enda konstellation bevisligen inte kan skyddas mot felet i sin egen konstellation (<c2/> returnerar <c3/>).

seg-f52a937bad94 = En finess som är värd att ange ärligt: eftersom hypotesen om konstellationsfel kräver att man överlever förlusten av en <em>hel</em> konstellation begränsas protektionsnivån i <em>ögonblicksbilden</em> för två konstellationer nedåt av den kvarvarande geometrin för en enda konstellation — den är inte automatiskt mindre än PL med enbart GPS i varje ögonblick. Huvudresultatet i EU:s ARAIM TN att GPS+Galileo ger en <b>{ "15" }–{ "25" } % mindre HPL</b> är ett <b>tillgänglighets</b>resultat ackumulerat över realistiska konstellationer och användarplatser, inte en garanti per ögonblicksbild.

seg-b4289b877902 = { "6" }. Valideringsstatus

seg-e553de2eee63 = <b>I förrådet, automatiserat:</b> MHSS-algebran (<c1/> ⇒ bit för bit enkelfel; konstellationsfel vidgar PL; budgeten överskrids aldrig), fördelarna med geometri och konstellationsfel ovan, samt övning på <b>verklig geometri från precisa IGS-banor (International GNSS Service; GNSS = global navigation satellite system) (SP3, Standard Product { "3" })</b> (<c2/>), inte bara syntetiska konstellationer.

seg-633bf11af170 = <b>Extern oberoende referens — det publicerade genomgångna exemplet från WG-C:</b> protektionsnivåerna kontrolleras mot ARAIM Technical Subgroups eget numeriska exempel, i <a1><c1/></a1>, <c2/> och den incheckade fixturen <c3/> (varje vektor bär sin hämtnings-URL (webbadress), hämtningsdatum, källfilens SHA-256 (SHA: Secure Hash Algorithm) och sida). Godtagbar tolerans är referensens egen <c4/>. Mot Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Appendix D: <b>VPL { "18.2926" } m mot { "18.3" } m publicerat (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m mot { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effective monitor threshold) { "7.2997" } m mot { "7.2998" } m, σ_v,acc { "1.3694" } m mot { "1.3694" } m, och alla sex publicerade mellanresultat för konstellationsfel (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) inom en halv enhet i sista tryckta decimalen. Milestone { "3" } Report från { "2016" } anger samma exempel men har två interna fel — ett teckenfel i rad { "3" } av <c5/>, och ett <c6/> utvärderat vid { "57" } felmoder medan dokumentet anger <c7/> ({ "12" } moder) — så dess geometriska mellanresultat återges exakt medan dess protektionsnivåer redovisas som uppmätta avvikelser (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) och undantas från acceptanssiffran. Kontrollen kan nås som scenariotypen <c8/>.

seg-6d79f9836abd = <b>Ärlig kvarstående del (extern / väntar på granskning):</b> tillgänglighetssiffran på { "15" }–{ "25" } % mot en <b>versionslåst verklig ögonblicksbild av Celestrak TLE (tvåradig elementsats)</b>, och att deponera ARAIM-testfixturerna som en citerbar post i <b>Zenodo</b>. Referenskontrollen ovan täcker endast <c1/> (felmoder för en enskild satellit och en enskild konstellation); samtidiga delmängder av flera händelsefel, felexkludering, konsistenskontrollen med χ² och omfördelningssteget för dubbelräkning i referensalgoritmen är inte implementerade, och ett fall vars a priori-sannolikheter skulle kräva dem avvisas i stället för att trunkeras.

seg-b57b889dc536 = <b>Räckvidd i scenariofiler:</b> scenariotypen <c1/> kör <c2/> vid varje epok när dess TOML-fil (Tom's Obvious Minimal Language) sätter <c3/> (valfritt <c4/>); det medföljande <a1><c5/></a1> gör det över en sammanslagen geometri för GPS + Galileo, och <c6/> kör samma motor på verkliga Celestrak-TLE:er för GPS och Galileo propagerade till en gemensam epok. Utan flaggan använder körningen klassisk RAIM med solution separation.

seg-6cb7a787ac67 = Referenser

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } February { "2016" } — Annex A (reference user algorithm) and §A.IX (numerical example). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } June { "2019" } — Appendix D (numerical example for LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (United States) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (tidigare Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimum operational performance standards); material om DO-316 ARAIM MASPS (minimum aviation system performance standards).

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (metodik för Stanford-diagram).

seg-d4f50d307775 = <s1>Föregående</s1>Spektrum och vattenfall

seg-f05ca316fe8e = <s1>Nästa</s1>DO-316 / DO-229E-karta
