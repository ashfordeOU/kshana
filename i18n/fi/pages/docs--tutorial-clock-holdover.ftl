# docs--tutorial-clock-holdover: translations (fi)

seg-b59f529012a6 = Lähde: <c1/>

seg-e66a5042182e = Opastus { "2" } — Kellon holdover: kuinka kauan voit liukua

seg-889112bc4c09 = <c1/> · <b>Skenaario:</b> <c2/> (opetuskopio: <a1><c3/></a1>) · <b>Vaikeustaso:</b> aloittelija · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Lopuksi olet ajanut kellon holdoverin GNSS-signaalit (maailmanlaajuinen satelliittinavigointijärjestelmä) estettyinä, lukenut ajoituksen laatumittarin ja ymmärtänyt ajautumislain √(q_wf·T), joka selittää, <em>miksi</em> optinen kello kestää pidempään kuin sirukokoinen, lain lähteenä NIST (Yhdysvaltain kansallinen standardi- ja teknologiainstituutti), ei keksittynä.

seg-51ae9468b92a = Mikä tämä skenaario on

seg-87334505b228 = Kun GNSS-signaalit katoavat, järjestelmä pitää aikaa omalla sisäisellä kellollaan. Kellon vaihe ajautuu hitaasti, ja kun ajautuma ylittää operatiivisen ajoitusmäärittelyn, olet pois palvelusta. <b>Holdover</b> kertoo, kuinka kauan pysyt määrittelyn sisällä GNSS:n menetyksen jälkeen — keskeinen autonomian laatumittari.

seg-798ac031b5c6 = Skenaario ajaa { "2" } h aikajanan: { "10" } min GNSS-synkronointia, sitten { "6600" } s ({ "1.83" } h) estettynä, { "20" } ns:n ajoitusmäärittelyä vastaan, näytteistettynä { "10" } s:n välein. Se vertaa kahta kelloa samalla koodilla niiden <em>omilla</em> julkaistuilla kohinoilla:

seg-3d53622dbe12 = <b>Kvantti</b>: strontiumhilakello, avaruustavoite σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), maaperän demonstraattoritavoite, ei lennetty. σ_y(τ) on Allanin poikkeama, kellon taajuusvakauden vakiomitta keskiarvoistusajalla τ.

seg-e25af6d0752f = <b>Klassinen</b>: Microchip SA.45s -sirukokoinen atomikello (CSAC), σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datalehti) — käytössä oleva kaupallinen osa.

seg-08f3fdc9252a = Lue yhden rivin yhteenveto

seg-baa0cc808987 = Kun siemenluku = { "42" }, määrittely { "20" } ns ja katko { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — optinen kello kestää koko { "6600" } s:n katkon rikkomatta { "20" } ns:ää. Sen 95. persentiilin vaihevirhe on { "1.20e-4" } ns, noin kymmenestuhannesosa nanosekunnista: se tuskin liikkuu.

seg-0ba48fccffae = <b><c1/></b> — CSAC rikkoo { "20" } ns:n määrittelyn kohdassa ~{ "2610" } s, alle puolessa katkosta. Sen p95-vaihevirhe ({ "19.7" } ns) on aivan määrittelyviivalla.

seg-b745d05e2bf1 = <b><c1/></b> — tämä skenaario ei määritä hyökkäystä, joten mitään ei ole havaittavaa eikä yhteenveto tulosta lukua. JSON sisältää silti kunkin kellon analyyttisen harhautuksen havaittavuusrajan kentässä <c2/> ({ "0.997" } optiselle kellolle; { "0.000" } CSAC:lle, jonka oma liukukohina ikkunan yli ylittää jo { "20" } ns), merkittynä <c3/> lohkossa <c4/>. Havaitsemisen pisteytys todellista hyökkäystä vastaan on <a1>opastuksen { "3" }</a1> aihe.

seg-510e1cd8ed40 = <b><c1/></b> — tässä tämä on <em>suotimen itsejohdonmukaisuus</em> (osuus katkon näytteistä Kalman-suotimen oman k-sigma-rajan sisällä), <b>ei</b> ilmailun vaaka- tai pystysuojaustaso (HPL/VPL). Katso <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Ei-kehämäinen oraakkeli: miksi { "2610" } s CSAC:lle?

seg-2958401e00ca = Valkoisen taajuusmodulaation (white-FM) kellolle 1-σ-vaihevirhe kasvaa muodossa <b>σ_x(T) ≈ √(q_wf · T)</b>, missä <c1/> on yksikössä s². Tämä suhde on julkaisusta <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — σ_y(τ)↔vaihe-suhteet — <em>sama</em> SP-1065-suhde, jota vastaan <c2/> validoi moottorin Allanin poikkeaman noin { "2" } %:n tarkkuuteen.

seg-d6c8f68b42b9 = CSAC:lle <c1/>. Ratkaise aika, jolloin 1-σ-vaihe saavuttaa { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = Moottorin { "2610" } s ei ole tuo 1-σ-aika, eikä sen pidäkään olla. <c1/> on ensimmäinen { "10" } s:n ruudukkopiste (<c2/>), jossa <em>tämän siemennetyn realisaation</em> absoluuttinen vaihevirhe ylittää { "20" } ns (<c3/>). Satunnaiskulun ensimmäinen tason ylitys tulee usein selvästi ennen aikaa, jolloin sen 1-σ-verhokäyrä saavuttaa tason, ja realisaatio kantaa myös jäännöstaajuusvirhettä, joka suotimelle jää { "600" } s:n synkronoinnin jälkeen. Laki siis kiinnittää mittakaavan, muutama tuhat sekuntia { "3" }×{ "10" }⁻¹⁰ kellolle { "20" } ns:ää vastaan, ei tarkkaa arvoa. Testi väittää sen ympärille <b>{ "2000" }-{ "3200" } s:n kaistan</b>, ei lukua.

seg-2e7cbdefa9b7 = Datalehtiankkurit itse ovat ulkoisia, mainittuina skenaarion merkkijonoissa <c1/>: optinen Sr-hilatavoite { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datalehti). Ja viety <c2/> vastaa datalehden σ_y(τ):ia noin { "2" } %:n tarkkuudella (<c3/>, NIST SP { "1065" }). Piirrä se log-log-kaaviona ”Kellon vakaus (ADEV, Allanin poikkeama)” leikkikentässä.

seg-def5271a207d = Mitä testi lukitsee

seg-ebddc1f5ffe2 = <c1/> (optisen kellon on pysyttävä vähintään yhtä pitkään),

seg-8e570268f107 = <c1/> (kestää koko katkon),

seg-d60483c1af2e = <c1/> — toleranssiväli SP-1065:n valkoisen FM:n skaalan ympärillä, <em>ei</em> taikaluku. Oraakkeli on laki, ei arvo.

seg-e5f926d1055b = Sudenkuopat ja yksiköt

seg-0f57e35ed833 = <b>Ajoitusluvut ovat nanosekunteina</b>, ei koskaan metreinä. (Paikan holdover on <em>eri</em> paketti — katso inertiaosio opetusohjelmassa { "3" }.)

seg-2e476b213141 = <b>Suureen <c1/> yksikkö on s², ja se on yhtä suuri kuin σ_y({ "1" } s)².</b> Se on silta datalehden Allanin poikkeaman luvusta malliin.

seg-75951a150b44 = <b>Holdover on ruudukkoon kvantisoitu alaraja</b> (<c1/>). Älä tulkitse tarkkaa arvoa liikaa; lue <em>väliä</em>.

seg-959eb86066f1 = <c1/> tarkoittaa tässä suodattimen itsejohdonmukaisuutta, ei ilmailun eheyttä.

seg-cb457294fc53 = Mihin seuraavaksi

seg-aa3e50f2c699 = <b>Taso { "2" }:</b> kiristä arvoa <c1/> luvusta { "20" } lukuun { "10" } ja seuraa, kuinka CSAC:n holdover <em>laskee</em> ({ "2610" } s → { "1300" } s, mitattu komennolla <c2/>), tai käytä tyyppiä <c3/> taulukoimaan holdover CSAC:n kohinatasoa <c4/> vasten (<c5/>: { "25" } pistettä, { "10" }⁻²⁴ – { "10" }⁻¹⁸ s², klassinen holdover { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Taso { "3" }:</b> lisää <c1/>, niin tästä tulee Monte Carlo -joukko, ja lue [p05–p95]-holdover-väli (<c2/> tulostaa <c3/>).

seg-9cb56e10f0fd = Sitten päätösosa: <a1>Opetusohjelma { "3" } — Kvantti vs. klassinen kestävyys</a1>.

seg-7dc19a98c7ee = <s1>Edellinen</s1>{ "1" } · Ensimmäinen kiertoratasi

seg-c274e92fdcb5 = <s1>Seuraava</s1>{ "3" } · Kvantti vastaan klassinen
