# docs--araim-reference: translations (et)

# text
# c1: docs/ARAIM_REFERENCE.md
seg-c316596d7ec8 = Allikas: <c1/>

# text
seg-4768b19aaed7 = ARAIM-i viide — täiustatud RAIM-i kaitsetasemed Kshanas

# text
# c1: src/raim.rs
seg-93c83a737a43 = See märkus dokumenteerib Kshana avatud teostust <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: algoritm, iga eeldus, terviklikkuse tugisõnum, mida see tarbib, ja valideerimise olek. Teostus asub failis <a1><c1/></a1>; see dokument on proosakaaslane, mida audiitor (või hankeülevaataja) saab koodi kõrval lugeda.

# text
seg-f5a7abecc2df = ARAIM on kahe konstellatsiooniga, mitme sagedusega klassikalise RAIM-i järglane, mille GPS (Global Positioning System)–Galileo Working Group C (WG-C) defineeris toetama horisontaalset ja vertikaalset juhendamist kuni LPV-200-ni (LPV: lokaliseerija toimivus vertikaaljuhendamisega). See vastab igal epohhil ühele küsimusele:

# text
# c1: P_HMI
seg-252dac107a2a = Kui suur peab olema asukohavea piir (<em>kaitsetase</em>), et <em>ohtlikult eksitava teabe</em> jääktõenäosus — viga, mis on suurem kui piir, samal ajal kui piir on veel häiriläve sees — jääks terviklikkuse riskieelarve <c1/> alla?

# text
seg-04299e9742b7 = { "1" }. Terviklikkuse tugisõnum (ISM)

# text
# c1: IntegritySupportMessage
seg-717bea7d6bc8 = ISM on konstellatsioonipõhine parameetrikomplekt, mida kasutaja rakendab. Seda modelleerib selgesõnaliselt <a1><c1/></a1>:

# text
seg-fffbeccd4266 = Sümbol

# text
seg-2247a2344710 = Tähendus

# text
seg-d7e49778bed2 = σ_URE / SISE (signaali ruumis viga)

# text
seg-b1b5bca63e21 = vahemaaivea RMS (ruutkeskmine), mida kasutatakse <b>täpsuse ja pidevuse</b> jaoks

# text
seg-8ff2973d7f5b = σ_URA / SISA (signaali ruumis täpsus)

# text
seg-f993962a5c9b = vahemaaivea piir, mida kasutatakse <b>terviklikkuse</b> jaoks (≥ σ_URE)

# text
# c1: b_k = Σ_i |s_i|·b_nom
seg-727c7fbe1b01 = maksimaalne nominaalne vahemaanihe, mis on ühepoolselt terviklikkuse piiri sisse liidetud (<c1/>); vt §{ "3" }

# text
seg-a79e42c29c46 = tuvastamata üksiksatelliidi rikke eeltõenäosus

# text
seg-78c45312d2ff = kogu konstellatsiooni hõlmava rikke eeltõenäosus

# text
# c1: IntegritySupportMessage::gps_galileo_reference()
seg-19cc5ff2e541 = <c1/> tagastab avaldatud WG-C etalonväärtused: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> ekspositsiooniintervalli kohta. Neid väärtusi kasutatakse ARAIM-i kättesaadavuse mõõtmete määramiseks etalonkirjanduses; operatiivne ISM on edastatav/maapinnal koostatav ja seadistatav konstellatsiooni kaupa. Vahe σ_URA (terviklikkus) ja σ_URE (täpsus) vahel on tahtlik ja on ISM-kontseptsiooni määrav tunnus.

# text
# c1: .fault_priors()
# c2: .dual_fault_priors()
seg-0c1687628e67 = <c1/> ja <c2/> annavad need otse kahele mootorile.

# text
seg-8c516e53f595 = { "2" }. Rikkehüpoteesid

# text
# c1: H_k
seg-b6353366ebf0 = ARAIM on <em>mitme hüpoteesi lahenduse eraldamise</em> (MHSS) meetod. Iga rikkehüpoteesi <c1/> jaoks moodustab see kogu nähtavate satelliitide lahendi ja alamlahendi, mis jätab rikkis hulga välja, ning piirab asukohavea selle hüpoteesi all:

# text
# c1: H_0
# c2: ≈ 1
seg-3b340e082b84 = <c1/> (eeltõenäosus <c2/>): täielik kogu nähtavate satelliitide vähimruutude lahend.

# text
seg-03332e433edc = Üksiksatelliidi rikked

# text
# c1: H_i
# c2: P_sat
# c3: araim_raim
seg-add4792e4e40 = <c1/> (eeltõenäosus <c2/> igaühel): iga ühe satelliidi väljajätmise alamlahend. See on klassikaline üksikrikke ARAIM-i lähtetase, <a1><c3/></a1>.

# text
seg-7e20f419e670 = Kogu konstellatsiooni rikked

# text
# c1: H_c
# c2: P_const
# c3: araim_dual_raim
# c4: P_const = 0
# c5: araim_raim
seg-920bd35833ff = <c1/> (eeltõenäosus <c2/> igaühel): alamlahend, mis eemaldab korraga <em>kõik</em> ühe konstellatsiooni satelliidid, EL (Euroopa Liit) ARAIM TN (tehniline märkus) / DO-316 laiendus, mis on teostatud failis <a1><c3/></a1>. Tingimusel <c4/> taandub see <b>bait-baidilt</b> variandile <c5/>.

# text
seg-323dd205d238 = { "3" }. Kaitsetasemed

# text
# c1: (p_fault, threshold, σ)
# c2: K_fa = Φ⁻¹(1 − P_fa / 2N)
# c3: N
# c4: PL
seg-9ab2676d2554 = Iga telje (vertikaalne, horisontaalne) ja iga hüpoteesi jaoks ehitab mootor režiimi <c1/>, kus lävi on lahenduse eraldamise tuvastuspiir valehäire kordaja <c2/> juures (pidevuse eelarve Bonferroni jaotus <c3/> hüpoteesi vahel). Kaitsetase on väikseim piir <c4/>, mille summeeritud terviklikkuse risk

# text
seg-05c0d8fc855c = Teostusmärkus.

# text
# c1: b_k = Σ_i |s_{axis,i}|·b_nom
# c2: axis_bias_sum
# c3: horiz_bias_sum
# c4: b_nom_m
# c5: b_nom = 0.75 m
# c6: b_nom = 0
# c7: integrity
# c8: sigma_ura_m
# c9: sigma_uere_m
# c10: b_nom_m
# c11: INTEGRITY.md
seg-248092fe9b94 = <c1/> on ühepoolne nominaalnihke projektsioon teljele — satelliidipõhiste võimendusmoodulite halvima juhtumi summa (<a1><c2/>/<c3/></a1>) —, mille allikaks on ISM-i <c4/>. WG-C etalon-ISM kasutab <c5/>; tingimusel <c6/> taandub piir nullnominaalnihkega MHSS-vormile. Käivitatav <c7/> stsenaarium eksponeerib <c8/> (kaitsetaseme jaoks kasutatav terviklikkuse piir, piiratud tasemele ≥ <c9/> ja vaikimisi sellega võrdne) ja <c10/> (vaikimisi { "0" }), nii et kaitsetaset mõõdetakse alati terviklikkuse piiriga σ_URA, mitte kunagi väiksema täpsuse σ_URE-ga. See jääb <b>modelleeritud, sertifitseerimata</b> ARAIM-i teostuseks — vt <a2><c11/></a2>.

# text
# c1: araim_protection_level
# c2: araim_integrity_risk
# c3: ≤
seg-f6bccff61ff5 = vastab eraldatud eelarvele ([<c1/>] / <a1><c2/></a1>). VPL (vertikaalne kaitsetase) ja HPL (horisontaalne kaitsetase) on vertikaalne ja horisontaalne vastus. Tulemus teatab ka tegelikult saavutatud terviklikkuse riski (<c3/> eraldis) ja selle, kas mõni alamlahend eraldus üle oma läve.

# text
seg-b1a868221848 = See on selgesõnaline ARAIM-i leping — „kui suur peab piir olema?“ — mitte fikseeritud kordajaga klassikalise RAIM-i kaudne, geomeetriast sõltuv risk.

# text
seg-c90cf313dea8 = { "4" }. Stanfordi diagramm

# text
# c1: StanfordDiagram
# c2: (error, PL)
# c3: classify_stanford
# c4: stanford_svg
# c5: PL = error
seg-b51e44c3deda = <a1><c1/></a1> kogub epohhi kohta <c2/> fikseeritud häiriläve (AL) vastu ja <a2><c3/></a2> sorteerib iga <em>kättesaadavaks</em>, <em>süsteemi kättesaamatuks</em> (PL > AL, konservatiivne), <em>eksitavaks teabeks</em> (PL < error ≤ AL) või <em>ohtlikult eksitavaks teabeks</em> (error > AL ja > PL). <a3><c4/></a3> renderdab klassikalise hajuvusdiagrammi — terviklikkuse piiri <c5/>, häiriläve juhtjooned ja ühe värvikodeeritud markeri epohhi kohta — iseseisva SVG-na (Scalable Vector Graphics).

# text
seg-c902173f6acf = { "5" }. Kahe konstellatsiooni kasu

# text
# c1: raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault
seg-96e114a6981c = Kaks efekti on demonstreeritud testis <c1/>:

# text
seg-06c7d8d62b44 = <b>Geomeetria / liiasus</b> — teise konstellatsiooni satelliitide liitmine karmistab üksikrikke HPL-i: rohkem mõõtmisi ja suurem üksik-SV (SV: space vehicle ehk satelliit) alamlahendite hulk annavad rangelt väiksema piiri.

# text
# c1: P_const
# c2: araim_dual_raim
# c3: None
seg-f788c9e07547 = <b>Konstellatsioonirikke tolerants</b> — kui <c1/> on aktiivne, jääb kahe konstellatsiooni kasutaja kättesaadavaks, kui terve konstellatsioon võib rikki minna (<em>teise</em> konstellatsiooni satelliidid jäävad ellu), samas kui ühe konstellatsiooni kasutajat ei saa tõestatavalt kaitsta tema enda konstellatsiooni rikke vastu (<c2/> tagastab <c3/>).

# text
seg-f52a937bad94 = Nüanss, mida tasub ausalt väita: kuna konstellatsioonirikke hüpotees nõuab <em>terve</em> konstellatsiooni kaotuse üleelamist, on kahe konstellatsiooni <em>hetktõmmise</em> kaitsetase altpoolt piiratud ülejäänud ühe konstellatsiooni geomeetriaga — see ei ole automaatselt väiksem kui ainult GPS-i PL igal hetkel. Peamine EL ARAIM TN tulemus, et GPS+Galileo annab <b>{ "15" }–{ "25" } % väiksema HPL-i</b>, on <b>kättesaadavuse</b> tulemus, mis on kogutud realistlike konstellatsioonide ja kasutaja asukohtade peale, mitte hetktõmmisepõhine garantii.

# text
seg-b4289b877902 = { "6" }. Valideerimise olek

# text
# c1: P_const = 0
# c2: tests/igs_real_data.rs
seg-e553de2eee63 = <b>Hoidlas, automatiseeritud:</b> MHSS-i algebra (<c1/> ⇒ bait-baidilt üksikrike; konstellatsioonirike laiendab PL-i; eelarvet ei ületata kunagi), ülaltoodud geomeetria ja konstellatsioonirikke kasud ning harjutamine <b>päris IGS (International GNSS Service; GNSS = ülemaailmne satelliitnavigatsioonisüsteem) täppisorbiidi (SP3, Standard Product { "3" }) geomeetrial</b> (<c2/>), mitte ainult sünteetilistel konstellatsioonidel.

# text
# c1: src/araim_reference.rs
# c2: tests/araim_reference_vectors.rs
# c3: tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt
# c4: TOL_PL = 5 × 10⁻² m
# c5: G
# c6: K_fa,3
# c7: N_fault,max = 1
# c8: araim-reference-check
seg-633bf11af170 = <b>Väline oraakel (sõltumatu etalon) — avaldatud WG-C läbitöötatud näide:</b> kaitsetasemeid kontrollitakse ARAIM Technical Subgroup'i enda numbrilise näite vastu failides <a1><c1/></a1>, <c2/> ja sissekantud fikstuuris <c3/> (iga vektor kannab oma hankimise URL-i (veebiaadress), hankimise kuupäeva, lähtefaili SHA-256 (SHA: Secure Hash Algorithm) ja lehekülge). Vastuvõtutolerants on etaloni enda <c4/>. Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Lisa D vastu: <b>VPL { "18.2926" } m vs { "18.3" } m avaldatud (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m vs { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (efektiivne monitori lävi) { "7.2997" } m vs { "7.2998" } m, σ_v,acc { "1.3694" } m vs { "1.3694" } m ja kõik kuus avaldatud konstellatsioonirikke vahetulemust (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) poole ühiku täpsusega nende viimases trükitud kümnendkohas. { "2016" } Milestone { "3" } Report esitab sama näite, kuid kannab kahte sisemist viga — märgitrükiviga reas { "3" } väljal <c5/> ja <c6/>, mis on hinnatud { "57" } rikkerežiimil, kuigi dokument väidab <c7/> ({ "12" } režiimi) — seega selle geomeetria vahetulemused reprodutseeruvad täpselt, samas kui selle kaitsetasemed on registreeritud mõõdetud lahknevustena (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) ja vastuvõtunumbrist välja jäetud. Kontroll on kättesaadav stsenaariumi liigina <c8/>.

# text
# c1: N_fault,max = 1
seg-6d79f9836abd = <b>Aus jääk (väline / ülevaatuse ootel):</b> { "15" }–{ "25" } % kättesaadavuse arv <b>versioonilukustatud päris Celestraki TLE (kahereaelementide kogum) hetktõmmise</b> vastu ja ARAIM-i testfikstuuride deponeerimine viidatava <b>Zenodo</b> kirjena. Ülaltoodud etalonkontroll katab ainult <c1/> (üksiksatelliidi ja üksikkonstellatsiooni rikkerežiimid); samaaegsed mitme sündmuse rikkealamhulgad, rikke väljaarvamine, χ² kooskõlakontroll ja etalonalgoritmi topeltarvestuse ümberjaotamise samm ei ole teostatud ning juhtum, mille eeltõenäosused neid vajaksid, lükatakse tagasi, mitte ei kärbita.

# text
# c1: integrity
# c2: araim_dual_raim
# c3: araim_dual = true
# c4: p_hmi
# c5: scenarios/araim-gps-galileo.toml
# c6: tests/araim_dual_real_data.rs
seg-b57b889dc536 = <b>Stsenaariumifaili ulatus:</b> <c1/> stsenaariumi liik käivitab <c2/> igal epohhil, kui selle TOML (Tom's Obvious Minimal Language) fail seab <c3/> (valikuline <c4/>); kaasasolev <a1><c5/></a1> teeb seda ühendatud GPS + Galileo geomeetrial ja <c6/> käivitab sama mootori päris Celestraki GPS-i ja Galileo TLE-del, mis on propageeritud ühele ühisele epohhile. Ilma liputa kasutab käitaja klassikalist lahenduse eraldamise RAIM-i.

# text
seg-6cb7a787ac67 = Viited

# text
seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } February { "2016" } — Annex A (reference user algorithm) ja §A.IX (numerical example). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

# text
seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } June { "2019" } — Appendix D (numerical example for LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

# text
seg-8758a6e4f6eb = EL–USA (Ameerika Ühendriigid) koostöö satelliitnavigatsioonis, <em>ARAIM Technical Note</em>.

# text
seg-c4d2879b2ec4 = RTCA (varem Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimaalsed tööstandardid); DO-316 ARAIM MASPS (minimaalsed lennundussüsteemi toimivusstandardid) materjal.

# text
seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

# text
seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (Stanfordi diagrammi metoodika).

# text
seg-d4f50d307775 = <s1>Eelmine</s1>Spekter ja juga-diagramm

# text
seg-f05ca316fe8e = <s1>Järgmine</s1>DO-316 / DO-229E vastendus
