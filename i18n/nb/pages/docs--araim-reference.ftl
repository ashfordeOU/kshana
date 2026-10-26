# docs--araim-reference: translations (nb)

seg-c316596d7ec8 = Kilde: <c1/>

seg-4768b19aaed7 = ARAIM-referanse — avanserte RAIM-beskyttelsesnivåer i Kshana

seg-93c83a737a43 = Dette notatet dokumenterer Kshanas åpne implementasjon av <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: algoritmen, hver forutsetning, integritetsstøttemeldingen den bruker og valideringsstatusen. Implementasjonen ligger i <a1><c1/></a1>; dette dokumentet er prosafølgesvennen som en revisor (eller en innkjøpsgjennomgang) kan lese ved siden av koden.

seg-f5a7abecc2df = ARAIM er den etterfølgeren til klassisk RAIM som bruker to konstellasjoner og flere frekvenser, definert av arbeidsgruppe C (WG-C) for GPS (Global Positioning System)–Galileo for å støtte horisontal og vertikal veiledning ned til LPV-200 (LPV: localizer performance with vertical guidance). Den svarer på ett enkelt spørsmål for hver epoke:

seg-252dac107a2a = Hvor stor må grensen for posisjonsfeil (<em>beskyttelsesnivået</em>) være for at restsannsynligheten for <em>farlig misvisende informasjon</em> — en feil som er større enn grensen mens grensen fortsatt ligger innenfor alarmgrensen — holder seg under integritetsrisikobudsjettet <c1/>?

seg-04299e9742b7 = { "1" }. Integritetsstøttemeldingen (ISM)

seg-717bea7d6bc8 = ISM er parametersettet per konstellasjon som brukeren anvender. Den er modellert eksplisitt av <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydning

seg-d7e49778bed2 = σ_URE / SISE (signal-in-space error)

seg-b1b5bca63e21 = RMS (root mean square) for avstandsfeil brukt for <b>nøyaktighet og kontinuitet</b>

seg-8ff2973d7f5b = σ_URA / SISA (signal-in-space accuracy)

seg-f993962a5c9b = grense for avstandsfeil brukt for <b>integritet</b> (≥ σ_URE)

seg-727c7fbe1b01 = maksimal nominell avstandsbias foldet ensidig inn i integritetsgrensen (<c1/>); se §{ "3" }

seg-a79e42c29c46 = apriori sannsynlighet for en uoppdaget feil i én enkelt satellitt

seg-78c45312d2ff = apriori sannsynlighet for en feil i hele konstellasjonen

seg-19cc5ff2e541 = <c1/> returnerer de publiserte referanseverdiene fra WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> over eksponeringsintervallet. Dette er verdiene som brukes for å dimensjonere ARAIM-tilgjengelighet i referanselitteraturen; den operative ISM-en kringkastes/settes sammen på bakken og kan konfigureres per konstellasjon. Skillet mellom σ_URA (integritet) og σ_URE (nøyaktighet) er bevisst og er det definerende trekket ved ISM-konseptet.

seg-0c1687628e67 = <c1/> og <c2/> gir disse rett videre til de to motorene.

seg-8c516e53f595 = { "2" }. Feilhypoteser

seg-b6353366ebf0 = ARAIM er en <em>løsningsseparasjonsmetode med flere hypoteser</em> (MHSS). For hver feilhypotese <c1/> danner den løsningen med alle satellitter i sikte og delløsningen som utelater det feilbehengte settet, og avgrenser posisjonsfeilen under den hypotesen:

seg-3b340e082b84 = <c1/> (apriori <c2/>): den fulle minste-kvadraters posisjonsbestemmelsen med alle satellitter i sikte.

seg-03332e433edc = Feil i enkeltsatellitter

seg-add4792e4e40 = <c1/> (apriori <c2/> hver): hver delløsning som utelater én satellitt. Dette er den klassiske ARAIM-grunnlinjen for enkeltfeil, <a1><c3/></a1>.

seg-7e20f419e670 = Feil i hele konstellasjoner

seg-920bd35833ff = <c1/> (apriori <c2/> hver): delløsningen som fjerner <em>alle</em> satellitter i én konstellasjon samtidig, EU-utvidelsen (European Union) fra ARAIM TN (teknisk notat) / DO-316 som er implementert i <a1><c3/></a1>. Med <c4/> reduseres dette <b>bit for bit</b> til <c5/>.

seg-323dd205d238 = { "3" }. Beskyttelsesnivåer

seg-9ab2676d2554 = For hver akse (vertikal, horisontal) og hver hypotese bygger motoren en modus <c1/> der terskelen er deteksjonsgrensen for løsningsseparasjon ved multiplikatoren for falsk alarm <c2/> (en Bonferroni-fordeling av kontinuitetsbudsjettet over de <c3/> hypotesene). Beskyttelsesnivået er den minste grensen <c4/> hvis summerte integritetsrisiko

seg-05c0d8fc855c = Implementasjonsnotat.

seg-248092fe9b94 = <c1/> er den ensidige projeksjonen av nominell bias på aksen — den verste summen av størrelsene på forsterkningen per satellitt (<a1><c2/>/<c3/></a1>) — hentet fra ISM-ens <c4/>. WG-C-referanse-ISM-en bruker <c5/>; med <c6/> reduseres grensen til MHSS-formen uten nominell bias. Det kjørbare scenarioet <c7/> eksponerer <c8/> (integritetsgrensen som brukes for beskyttelsesnivået, begrenset til ≥ <c9/> og med den som standard) og <c10/> (standard { "0" }), slik at beskyttelsesnivået alltid dimensjoneres med integritetsgrensen σ_URA, aldri den mindre nøyaktighets-σ_URE. Dette er fortsatt en <b>modellert, ikke-sertifisert</b> ARAIM-implementasjon — se <a2><c11/></a2>.

seg-f6bccff61ff5 = holder seg innenfor det tildelte budsjettet ([<c1/>] / <a1><c2/></a1>). VPL (vertikalt beskyttelsesnivå) og HPL (horisontalt beskyttelsesnivå) er de vertikale og horisontale svarene. Resultatet rapporterer også integritetsrisikoen som faktisk ble oppnådd (<c3/> tildelingen) og om en delløsning skilte seg ut utover sin terskel.

seg-b1a868221848 = Dette er den eksplisitte ARAIM-kontrakten — «hvor stor må grensen være?» — i stedet for den implisitte, geometriavhengige risikoen ved en klassisk RAIM med fast multiplikator.

seg-c90cf313dea8 = { "4" }. Stanford-diagram

seg-b51e44c3deda = <a1><c1/></a1> samler <c2/> per epoke mot en fast alarmgrense (AL), og <a2><c3/></a2> sorterer hver inn som <em>tilgjengelig</em>, <em>systemet utilgjengelig</em> (PL > AL, konservativt), <em>misvisende informasjon</em> (PL < feil ≤ AL) eller <em>farlig misvisende informasjon</em> (feil > AL og > PL). <a3><c4/></a3> gjengir det klassiske spredningsplottet — integritetsgrensen <c5/>, hjelpelinjene for alarmgrensen og én fargekodet markør per epoke — som en selvstendig SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Fordelen med to konstellasjoner

seg-96e114a6981c = To effekter vises i <c1/>:

seg-06c7d8d62b44 = <b>Geometri / redundans</b> — å slå sammen satellittene fra en andre konstellasjon strammer inn HPL for enkeltfeil: flere målinger og et større sett av delløsninger for enkelt-SV (SV: space vehicle, altså en satellitt) gir en strengt mindre grense.

seg-f788c9e07547 = <b>Toleranse for konstellasjonsfeil</b> — med <c1/> aktiv forblir brukeren med to konstellasjoner tilgjengelig når en hel konstellasjon kan svikte (satellittene i den <em>andre</em> konstellasjonen overlever), mens en bruker med én konstellasjon bevisst ikke kan beskyttes mot feil i sin egen konstellasjon (<c2/> returnerer <c3/>).

seg-f52a937bad94 = En finesse det er verdt å si ærlig: fordi hypotesen om konstellasjonsfeil krever å overleve tapet av en <em>hel</em> konstellasjon, er beskyttelsesnivået i et <em>øyeblikksbilde</em> med to konstellasjoner begrenset nedover av den gjenværende geometrien med én konstellasjon — det er ikke automatisk mindre enn PL for bare GPS i hvert øyeblikk. Hovedresultatet i EU ARAIM TN, at GPS+Galileo gir en <b>{ "15" }–{ "25" } % mindre HPL</b>, er et <b>tilgjengelighets</b>resultat samlet over realistiske konstellasjoner og brukerposisjoner, ikke en garanti per øyeblikksbilde.

seg-b4289b877902 = { "6" }. Valideringsstatus

seg-e553de2eee63 = <b>I depotet, automatisert:</b> MHSS-algebraen (<c1/> ⇒ bit for bit enkeltfeil; konstellasjonsfeil utvider PL; budsjettet overskrides aldri), fordelene med geometri og konstellasjonsfeil ovenfor, og kjøring på <b>ekte geometri fra presise IGS-baner (International GNSS Service; GNSS = global navigation satellite system) (SP3, Standard Product { "3" })</b> (<c2/>), ikke bare syntetiske konstellasjoner.

seg-633bf11af170 = <b>Ekstern uavhengig referanse — det publiserte regneeksempelet fra WG-C:</b> beskyttelsesnivåene er kontrollert mot ARAIM Technical Subgroups eget numeriske eksempel, i <a1><c1/></a1>, <c2/> og de innsjekkede testdataene <c3/> (hver vektor bærer sin hentings-URL (webadresse), hentedato, SHA-256 for kildefilen (SHA: Secure Hash Algorithm) og side). Akseptgrensen er referansens egen <c4/>. Mot Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Appendix D: <b>VPL { "18.2926" } m mot { "18.3" } m publisert (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m mot { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effective monitor threshold) { "7.2997" } m mot { "7.2998" } m, σ_v,acc { "1.3694" } m mot { "1.3694" } m, og alle seks publiserte mellomresultater for konstellasjonsfeil (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) innenfor en halv enhet i siste trykte desimal. Milestone { "3" } Report fra { "2016" } oppgir det samme eksempelet, men har to interne feil — en fortegnsfeil i rad { "3" } av <c5/>, og en <c6/> som er evaluert ved { "57" } feilmodi mens dokumentet oppgir <c7/> ({ "12" } modi) — så geometriens mellomresultater gjengis nøyaktig, mens beskyttelsesnivåene er registrert som målte avvik (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) og utelatt fra akseptgrensen. Kontrollen kan nås som scenariotypen <c8/>.

seg-6d79f9836abd = <b>Ærlig restpost (ekstern / venter på gjennomgang):</b> tallet på { "15" }–{ "25" } % for tilgjengelighet mot et <b>versjonslåst, ekte øyeblikksbilde av Celestrak TLE (two-line element-sett)</b>, og deponering av ARAIM-testdataene som en siterbar <b>Zenodo</b>-oppføring. Referansekontrollen ovenfor dekker bare <c1/> (feilmodi for enkeltsatellitt og enkeltkonstellasjon); samtidige delmengder av feil med flere hendelser, feilutelukkelse, χ²-konsistenskontrollen og omfordelingssteget for dobbelttelling i referansealgoritmen er ikke implementert, og et tilfelle der aprioriene ville trenge dem, avvises i stedet for å avkortes.

seg-b57b889dc536 = <b>Rekkevidde i scenariofiler:</b> scenariotypen <c1/> kjører <c2/> i hver epoke når TOML-filen (Tom's Obvious Minimal Language) setter <c3/> (valgfritt <c4/>); den medfølgende <a1><c5/></a1> gjør det over en sammenslått GPS- + Galileo-geometri, og <c6/> kjører den samme motoren på ekte Celestrak GPS- og Galileo-TLE-er propagert til én felles epoke. Uten flagget bruker kjøreren klassisk RAIM med løsningsseparasjon.

seg-6cb7a787ac67 = Referanser

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } February { "2016" } — Annex A (reference user algorithm) and §A.IX (numerical example). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } June { "2019" } — Appendix D (numerical example for LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (United States) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (tidligere Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimum operational performance standards); DO-316 ARAIM MASPS (minimum aviation system performance standards)-materiale.

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (Stanford-diagrammetodikk).

seg-d4f50d307775 = <s1>Forrige</s1>Spektrum og waterfall

seg-f05ca316fe8e = <s1>Neste</s1>DO-316 / DO-229E-kart
