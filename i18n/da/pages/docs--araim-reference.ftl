# docs--araim-reference: translations (da)

seg-c316596d7ec8 = Kilde: <c1/>

seg-4768b19aaed7 = ARAIM-reference — beskyttelsesniveauer i advanced RAIM i Kshana

seg-93c83a737a43 = Denne note dokumenterer Kshanas åbne implementering af <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: algoritmen, hver antagelse, den integritetsstøttebesked, den bruger, og valideringsstatus. Implementeringen findes i <a1><c1/></a1>; dette dokument er den løbende tekst, som en auditor (eller en indkøbsgennemgang) kan læse ved siden af koden.

seg-f5a7abecc2df = ARAIM er den dobbeltkonstellations-, multifrekvente efterfølger til klassisk RAIM, som GPS (Global Positioning System)–Galileo Working Group C (WG-C) definerede til at understøtte horisontal og vertikal vejledning ned til LPV-200 (LPV: localizer performance with vertical guidance). Den besvarer ét enkelt spørgsmål for hver epoke:

seg-252dac107a2a = Hvor stor skal positionsfejlens grænse (<em>beskyttelsesniveauet</em>) være, for at den resterende sandsynlighed for <em>farligt vildledende information</em> — en fejl større end grænsen, mens grænsen stadig ligger inden for alarmgrænsen — holder sig under integritetsrisikobudgettet <c1/>?

seg-04299e9742b7 = { "1" }. Integritetsstøttebeskeden (ISM)

seg-717bea7d6bc8 = ISM er det parametersæt pr. konstellation, som brugeren anvender. Den modelleres eksplicit af <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydning

seg-d7e49778bed2 = σ_URE / SISE (signal-in-space error)

seg-b1b5bca63e21 = RMS af afstandsfejl (root mean square) brugt til <b>nøjagtighed og kontinuitet</b>

seg-8ff2973d7f5b = σ_URA / SISA (signal-in-space accuracy)

seg-f993962a5c9b = grænse for afstandsfejl brugt til <b>integritet</b> (≥ σ_URE)

seg-727c7fbe1b01 = maksimal nominel afstandsbias, foldet ensidigt ind i integritetsgrænsen (<c1/>); se §{ "3" }

seg-a79e42c29c46 = a priori-sandsynlighed for en uopdaget fejl i én satellit

seg-78c45312d2ff = a priori-sandsynlighed for en fejl i hele konstellationen

seg-19cc5ff2e541 = <c1/> returnerer de offentliggjorte referenceværdier fra WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> over eksponeringsintervallet. Det er de værdier, der bruges til at dimensionere ARAIM-tilgængelighed i referencelitteraturen; den operationelle ISM udsendes/samles på jorden og kan konfigureres pr. konstellation. Forskellen mellem σ_URA (integritet) og σ_URE (nøjagtighed) er bevidst og er det definerende kendetegn ved ISM-konceptet.

seg-0c1687628e67 = <c1/> og <c2/> giver dem direkte videre til de to motorer.

seg-8c516e53f595 = { "2" }. Fejlhypoteser

seg-b6353366ebf0 = ARAIM er en <em>multiple hypothesis solution separation</em>-metode (MHSS). For hver fejlhypotese <c1/> danner den løsningen med alle satellitter i sigte og delløsningen, der udelukker den fejlramte mængde, og afgrænser positionsfejlen under den hypotese:

seg-3b340e082b84 = <c1/> (a priori <c2/>): den fulde mindste kvadraters positionsbestemmelse med alle satellitter i sigte.

seg-03332e433edc = Fejl i enkelte satellitter

seg-add4792e4e40 = <c1/> (a priori <c2/> hver): hver delløsning, der udelukker én satellit. Det er den klassiske ARAIM-baseline for enkeltfejl, <a1><c3/></a1>.

seg-7e20f419e670 = Fejl i hele konstellationer

seg-920bd35833ff = <c1/> (a priori <c2/> hver): delløsningen, der fjerner <em>alle</em> satellitter i én konstellation på én gang, den udvidelse af EU's (Den Europæiske Union) ARAIM TN (teknisk note) / DO-316, der er implementeret i <a1><c3/></a1>. Med <c4/> reduceres den <b>bit for bit</b> til <c5/>.

seg-323dd205d238 = { "3" }. Beskyttelsesniveauer

seg-9ab2676d2554 = For hver akse (lodret, vandret) og hver hypotese opbygger motoren en tilstand <c1/>, hvor tærsklen er detektionsgrænsen for solution separation ved multiplikatoren for falsk alarm <c2/> (en Bonferroni-fordeling af kontinuitetsbudgettet over de <c3/> hypoteser). Beskyttelsesniveauet er den mindste grænse <c4/>, hvis summerede integritetsrisiko

seg-05c0d8fc855c = Bemærkning om implementeringen.

seg-248092fe9b94 = <c1/> er den ensidede projektion af den nominelle bias på aksen — den værst tænkelige sum af satellitternes forstærkningsstørrelser (<a1><c2/>/<c3/></a1>) — hentet fra ISM'ens <c4/>. WG-C-reference-ISM'en bruger <c5/>; med <c6/> reduceres grænsen til MHSS-formen uden nominel bias. Det kørbare <c7/>-scenarie udstiller <c8/> (den integritetsgrænse, der bruges til beskyttelsesniveauet, begrænset til ≥ <c9/> og med den som standard) og <c10/> (standard { "0" }), så beskyttelsesniveauet altid dimensioneres med integritetsgrænsen σ_URA, aldrig den mindre nøjagtighedsværdi σ_URE. Dette er fortsat en <b>modelleret, ikke-certificeret</b> ARAIM-implementering — se <a2><c11/></a2>.

seg-f6bccff61ff5 = ligger inden for det tildelte budget ([<c1/>] / <a1><c2/></a1>). VPL (lodret beskyttelsesniveau) og HPL (vandret beskyttelsesniveau) er svarene for den lodrette og den vandrette retning. Resultatet rapporterer også den integritetsrisiko, der faktisk blev opnået (<c3/> tildelingen), og om en delløsning adskilte sig ud over sin tærskel.

seg-b1a868221848 = Det er den eksplicitte ARAIM-kontrakt — "hvor stor skal grænsen være?" — frem for den implicitte, geometriafhængige risiko ved en klassisk RAIM med fast multiplikator.

seg-c90cf313dea8 = { "4" }. Stanford-diagram

seg-b51e44c3deda = <a1><c1/></a1> samler <c2/> pr. epoke mod en fast alarmgrænse (AL), og <a2><c3/></a2> sorterer hver epoke i <em>tilgængelig</em>, <em>systemet utilgængeligt</em> (PL > AL, konservativt), <em>vildledende information</em> (PL < fejl ≤ AL) eller <em>farligt vildledende information</em> (fejl > AL og > PL). <a3><c4/></a3> tegner det klassiske punktdiagram — integritetsgrænsen <c5/>, hjælpelinjerne for alarmgrænsen og én farvekodet markør pr. epoke — som en selvstændig SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Fordelen ved to konstellationer

seg-96e114a6981c = To effekter vises i <c1/>:

seg-06c7d8d62b44 = <b>Geometri / redundans</b> — at samle en anden konstellations satellitter strammer HPL for enkeltfejl: flere målinger og en større mængde delløsninger med én SV (SV: space vehicle, altså en satellit) giver en strengt mindre grænse.

seg-f788c9e07547 = <b>Tolerance over for konstellationsfejl</b> — med <c1/> aktiv forbliver brugeren med to konstellationer tilgængelig, når en hel konstellation kan svigte (satellitter i den <em>anden</em> konstellation overlever), mens en bruger med kun én konstellation beviseligt ikke kan beskyttes mod fejl i sin egen konstellation (<c2/> returnerer <c3/>).

seg-f52a937bad94 = En finesse, der fortjener at blive nævnt ærligt: fordi hypotesen om konstellationsfejl kræver, at man overlever tabet af en <em>hel</em> konstellation, er <em>øjebliksbilledet</em> af beskyttelsesniveauet med to konstellationer nedadtil begrænset af den resterende geometri i én konstellation — det er ikke automatisk mindre end PL med kun GPS på hvert tidspunkt. Hovedresultatet i EU's ARAIM TN, at GPS+Galileo giver en <b>{ "15" }–{ "25" } % mindre HPL</b>, er et resultat om <b>tilgængelighed</b>, opsamlet over realistiske konstellationer og brugerpositioner, ikke en garanti for hvert øjebliksbillede.

seg-b4289b877902 = { "6" }. Valideringsstatus

seg-e553de2eee63 = <b>I repositoriet, automatiseret:</b> MHSS-algebraen (<c1/> ⇒ enkeltfejl bit for bit; konstellationsfejl udvider PL; budgettet overskrides aldrig), fordelene ved geometri og konstellationsfejl ovenfor og afprøvning på <b>reel IGS-geometri (International GNSS Service; GNSS = global navigation satellite system) med præcis bane (SP3, Standard Product { "3" })</b> (<c2/>), ikke kun syntetiske konstellationer.

seg-633bf11af170 = <b>Ekstern uafhængig reference — det offentliggjorte WG-C-arbejdseksempel:</b> beskyttelsesniveauerne kontrolleres mod ARAIM Technical Subgroups eget talmæssige eksempel i <a1><c1/></a1>, <c2/> og den indcheckede fixture <c3/> (hver vektor bærer sin hentnings-URL (webadresse), hentedato, kildefilens SHA-256 (SHA: Secure Hash Algorithm) og side). Accepttolerancen er referencens egen <c4/>. Mod Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Appendix D: <b>VPL { "18.2926" } m mod { "18.3" } m offentliggjort (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m mod { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effective monitor threshold) { "7.2997" } m mod { "7.2998" } m, σ_v,acc { "1.3694" } m mod { "1.3694" } m og alle seks offentliggjorte mellemresultater for konstellationsfejl (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) inden for en halv enhed i deres sidste trykte decimal. Milestone { "3" } Report fra { "2016" } angiver det samme eksempel, men har to interne fejl — en fortegnsfejl i række { "3" } af <c5/> og en <c6/> evalueret ved { "57" } fejltilstande, mens dokumentet angiver <c7/> ({ "12" } tilstande) — så dens geometri-mellemresultater gengives nøjagtigt, mens dens beskyttelsesniveauer registreres som målte afvigelser (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) og udelades af acceptværdien. Kontrollen kan nås som scenarietypen <c8/>.

seg-6d79f9836abd = <b>Ærlig rest (ekstern / afventer gennemgang):</b> tilgængelighedstallet på { "15" }–{ "25" } % mod et <b>versionslåst reelt Celestrak TLE-snapshot (two-line element-sæt)</b> og deponering af ARAIM-testfixtures som en citerbar <b>Zenodo</b>-post. Referencekontrollen ovenfor dækker kun <c1/> (fejltilstande for én satellit og én konstellation); samtidige delmængder af fejl fra flere hændelser, fejludelukkelse, χ²-konsistenskontrollen og trinnet med omfordeling ved dobbelttælling i referencealgoritmen er ikke implementeret, og et tilfælde, hvis a priori-værdier ville kræve dem, afvises frem for at blive afkortet.

seg-b57b889dc536 = <b>Rækkevidde i scenariefilen:</b> scenarietypen <c1/> kører <c2/> ved hver epoke, når dens TOML-fil (Tom's Obvious Minimal Language) sætter <c3/> (valgfri <c4/>); den medfølgende <a1><c5/></a1> gør det over en samlet GPS + Galileo-geometri, og <c6/> kører den samme motor på reelle Celestrak GPS- og Galileo-TLE'er propageret til ét fælles tidspunkt. Uden flaget bruger kørslen klassisk RAIM med solution separation.

seg-6cb7a787ac67 = Referencer

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } February { "2016" } — Annex A (reference user algorithm) and §A.IX (numerical example). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } June { "2019" } — Appendix D (numerical example for LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (USA) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (tidligere Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimum operational performance standards); materiale om DO-316 ARAIM MASPS (minimum aviation system performance standards).

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (Stanford-diagram-metodik).

seg-d4f50d307775 = <s1>Forrige</s1>Spektrum og vandfald

seg-f05ca316fe8e = <s1>Næste</s1>DO-316 / DO-229E-kort
