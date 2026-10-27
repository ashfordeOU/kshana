# docs--kind-telecom-timing: translations (fi)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: yksi jäsennyskerros, joka muuttaa RINEX-kellotiedoston (yhden nimetyn kellon AS/AR-tietueet, versiot { "2" } ja { "3.00" }–{ "3.04" }), TimeLab-tyylisen ASCII-vaihe- tai taajuuslokin tai TAPR TICC -aikaleima- tai -väliaikalokin yhtenäiseksi pha Testit: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> Suurin aikavälivirhe (MTIE) ja aikapoikkeama (TDEV), jotka skenaariotyyppi <c1/> raportoi telekommunikaatiomittakaavan holdover-tallenteella: O(n) monotoninen jonoliuk. Oraakkeli (ExternalDataset): allantools { "2024.06" } — riippumaton kolmannen osapuolen taajuusvakauskirjasto — mtie() ja tdev() tiedostolla tests/fixtures/telecom_timing/holdover_te_series.csv, sarja jäsennetty samasta 17 merkitsevän numeron tekstistä molemmilla puolilla; viite tallentaa sarjan SHA-256:n ja on uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validoi ESTIMAATTORIT tällä tallenteella, ei syn

seg-4cf0f94f96c9 = <b>MODELLED</b> ITU-T G.8272:n (07/2025) PRTC-A/B, G.8272.1:n ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukitun ja ePRTC-A-holdoverin (mukaan lukien taulukon { "3" } aikavirheen verho. Oraakkeli (InternalConsistency): Nimettyjen suositusten transkriptio (vapaasti ladattavissa osoitteesta itu.int), jokaisella rajalla on taulukkonsa tai kohtansa, lueteltuna jokaisen vahvistamattoman tai toteuttamattoman kohdan kanssa tiedostossa docs/TELECOM-TIMING.md; taulukoiden implikoimat katkoskohtien jatkuvuusidentiteetit tarkistetaan testeissä. Standardien transkriptio sisäisillä johdonmukaisuustarkistuksilla, ei yhdenmukaisuustesti eikä ulkoinen validointi. { "0.30" } kierros { "2" } (ennakkorekisteröity

seg-5547f1f662d3 = ja { "2" } muuta matriisissa.

# text
seg-8aee75a55007 = ocxo

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Lähde: <c1/>

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (skenaariolaji)

# text
seg-a448b24ded2b = Telekommunikaation ajoitus: GNSS-holdoverin aikavirhe, suurin aikavälivirhe (MTIE) ja aikapoikkeama (TDEV) tarkistettuna ITU-T-maskeja vastaan siten, että jokaiselle maskille annetaan PASS tai FAIL ja marginaali. Syöte on joko SYNTEETTINEN HOLDOVER (oskillaattoriesiasetus -- ocxo, rubidium, caesium tai csac, kukin nimetyn julkisen Microchipin tietolehden vakaus-, ikääntymis- ja lämpötilaluvuin -- sekä GNSS:n menetysaika, tallenteen pituus ja näytteenottoväli; vapaasti käyvä kello kantaa valkoista, flicker- ja, kun tietolehtisovitus sitä tarvitsee, satunnaiskävelytaajuuskohinaa, lineaarista ikääntymistä ja sinimuotoista lämpötilatermiä) tai SISÄÄNOTETTU SARJA [time_s, time_error_ns]-pareja rivinsisäisesti annettuna (ja vain natiivirakennelmissa CSV-tiedostona). Maskit: ITU-T G.8272 (07/2025) PRTC-A ja PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE taulukot 1-2, TDEV taulukot 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukittuna ({ "30" } ns, taulukot 1-2) ja ePRTC-A holdover (taulukon { "3" } aikavirheen verhokäyrä, joka nousee arvosta { "30" } ns arvoon { "100" } ns holdover-jakson H aikana, jonka lukitun keston määrää, MTIE taulukko { "4" }, TDEV taulukko { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-luokat A-C (max|TE|, vakioaikavirhe, alipäästösuodatettu MTIE ja TDEV) ja luokka D (max|TE_L| { "5" } ns, ainoa luokan D luku, jota ei ole jätetty jatkotutkimukseen); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) vertailupiste C (max|TE_L| { "1100" } / { "600" } / { "100" } ns MTIE-taulukoin 7-1–7-3 kanssa). Jokainen kohta, jonka Suositus merkitsee jatkotutkimukseen, puuttuu sen sijaan että se täytettäisiin, ja jokainen raportti luettelee, mitä ei ole toteutettu. Raportoi myös ajan, jossa kukin enimmäisaikavirhebudjetti ylittyy (oletukset: { "100" } ns ePRTC max|TE_HO|, { "400" } ns verkon holdover-varaus, { "1100" } ns piste C, { "1.5" } us luokka { "4" }), MTIE-/TDEV-käyrät CSV-taulukkona jokaisen maskin rajan kanssa sekä yksiköt ja alkuperä -merkinnän jokaiselle numeeriselle kentälle. VALIDATED: MTIE- ja TDEV-estimaattorit allantools-pakettia vastaan committoidulla holdover-sarjalla. MODELLED: maskitaulukot ovat transkriptioita, ja synteettinen holdover on tietolehden maksimeista rakennettu malli, ei minkään yksilön mittaus. Ei vaatimustenmukaisuustesti.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: telecom-timing: max|TE| { "488.2" } ns over { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-e7cab30ef039 = [] (ei alkioita)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Tuloksen tunniste (moottorin oma): MODELLED — aikavirhe, MTIE ja TDEV tarkistettuna transkriptoituja ITU-T-maskeja vastaan. Estimaattorit on validoitu allantoolsia vastaan; maskitaulukot ovat nimettyjen Suositusten transkriptioita; synteettinen holdover on julkisista tietolehtiluvuista rakennettu malli, ei minkään yksilön mittaus. Ei vaatimustenmukaisuustesti

# attr:alt
seg-ec7745a09d08 = Moottorin kirjoittama kaavio skenaariolle scenarios/telecom-synce-eec.toml, laji telecom-timing

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: tämän lajin nimeävät <a1>varmennusmatriisin</a1> rivit.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> Suurin aikavälivirhe ja aikapoikkeama, jotka skenaariolaji <c1/> raportoi telekommunikaatiomittakaavan holdover-tallenteella: O(n) monotoninen jonoliukuikkuna-MTIE (telecom_timing::mtie_sliding, tarpeen jotta yhden sekunnin näytteiden päivä Testit: <a1>telecom_timing_reference.rs</a1>.

# text
seg-75aa6f7234ae = <b>MODELLED</b> ITU-T G.8272 (07/2025) PRTC-A/B:n, G.8272.1:n ({ "2024" }) Amd. transkriptoidut rajat. Testit: <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Seitsemän vakiolämpötilan MTIE- ja TDEV-vaelluksen generointimaskia lajille <c1/>: G.811 (09/1997) PRC (autonominen), G.812 (06/2004) tyypit I, II ja III, G.8262 (10/2024) EEC-optiot { "1" } ja { "2" } sekä G.8262.1 (11/2025) eEEC (lukit

# text
seg-d4bd840708db = <b>MODELLED</b> Neljä esiasetusta — OCXO (Microchip OX-208), rubidium (Microchip 8040C), caesium (Microchip 5071A high-performance tube) ja CSAC (Microchip SA.45s) — kukin kantaa . Oraakkeli (InternalConsistency): Neljä nimettyä Microchipin tietolehteä (asiakirjanumerot ja URL:t jokaisessa esiasetuksessa ja tiedostossa docs/TELECOM-TIMING.md) syöteluvuille; suljetun muodon ikääntymisramppi ja sovituksen verhokäyräominaisuus sisäisinä tarkistuksina. Se, miten luvuista tulee kohinamalli — sovitus, lattiasääntö, 30 päivän kuukausi, lineaarinen lämpötilatulkinta — on mallinnusvalinta; mikään esiasetus ei ole yksilön mittaus. { "0.30" }-kierros { "2" }, yksipuoliset kynnykset vastaan

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = jokainen vaatimus, jonka Suositukset merkitsevät 'jatkotutkimukseen' (luokka D max|TE_L|:n ulkopuolella, ePRTC-B-holdover, T-BC/T-TSC-holdover kummankin syötteen menetettyä, TDEV-verkkorajat, ePRTC-A-holdoverin MTIE ja TDEV yli { "10 000" } s) (tulos <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = ylipäästösuodatettu dynaaminen aikavirhe (dTE_H, G.8273.2 taulukko 7-7 ja G.8271.1 kohdat 7.3.2-7.3.3) (tulos <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = G.8273.2:n taulukon 7-6 muuttuvalämpötilainen MTIE ja G.8273.2:n taulukon 7-10 fyysisen kerroksen avustama holdover-MTIE (tulos <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = suhteellinen aikavirhe (cTE_R, dTE_R,L) kahden ulostulon välillä (tulos <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = G.8272:n ja G.8272.1:n PTP-rajapinnoille määrittelemä liukuva keskiarvopakettisuodatin: sarjaa käsitellään yhden pulssin sekunnissa aikavälivirheenä (tulos <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — aikavirhe, MTIE ja TDEV tarkistettuna transkriptoituja ITU-T-maskeja vastaan. Estimaattorit on validoitu allantoolsia vastaan; maskitaulukot ovat nimettyjen Suositusten transkriptioita; synteettinen holdover on julkisista tietolehtiluvuista rakennettu malli, ei minkään yksilön mittaus. Ei vaatimustenmukaisuustesti. (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED: maskitaulukot ovat transkriptioita, ja synteettinen holdover on tietolehden maksimeista rakennettu malli, ei minkään yksilön mittaus. (lajiluettelo (<c1/>))

# text
seg-a0ddb65b00af = Kello: OCXO-esiasetus (Microchip OX-208 -tietolehti, Rev 12-1-2021), vapaasti käyvä ensimmäisestä näytteestä alkaen, valkoinen, flicker- ja (kun sovitus sitä tarvitsee) satunnaiskävelytaajuuskohina sovitettuna tietolehden Allanin poikkeaman maksimeihin, sekä sen lineaarinen ikääntyminen. Lämpötila pidetään vakiona (amplitudi { "0" } K), kuten maskit olettavat. (skenaariotiedoston kommentti, rivit { "12" }–{ "15" })

# text
seg-101dbde1c65b = Aihesivu: <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Edellinen</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Seuraava</s1>terrain-nav
