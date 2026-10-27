# docs--araim-reference: translations (fi)

seg-c316596d7ec8 = Lähde: <c1/>

seg-4768b19aaed7 = ARAIM-viite — edistyneen RAIMin suojaustasot Kshanassa

seg-93c83a737a43 = Tämä muistio dokumentoi Kshanan avoimen toteutuksen <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> -menetelmästä: algoritmi, jokainen oletus, sen käyttämä eheystukiviesti ja validoinnin tila. Toteutus sijaitsee tiedostossa <a1><c1/></a1>; tämä asiakirja on proosaseuralainen, jota auditoija (tai hankinnan arvioija) voi lukea koodin rinnalla.

seg-f5a7abecc2df = ARAIM on kaksoistähdistöinen, monitaajuinen perinteisen RAIMin seuraaja, jonka GPS (Global Positioning System)–Galileo Working Group C (WG-C) määritteli tukemaan vaaka- ja pystyopastusta aina LPV-200:aan asti (LPV: localizer performance with vertical guidance). Se vastaa jokaisella epookilla yhteen kysymykseen:

seg-252dac107a2a = Kuinka suuri sijaintivirheen rajan (<em>suojaustaso</em>) täytyy olla, jotta <em>vaarallisen harhaanjohtavan tiedon</em> jäännöstodennäköisyys — virhe, joka on suurempi kuin raja, kun raja on yhä hälytysrajan sisällä — pysyy eheysriskibudjetin <c1/> alla?

seg-04299e9742b7 = { "1" }. Eheystukiviesti (ISM)

seg-717bea7d6bc8 = ISM on tähdistökohtainen parametrijoukko, jota käyttäjä soveltaa. Se on mallinnettu eksplisiittisesti tyypillä <a1><c1/></a1>:

seg-fffbeccd4266 = Symboli

seg-2247a2344710 = Merkitys

seg-d7e49778bed2 = σ_URE / SISE (avaruussignaalin virhe)

seg-b1b5bca63e21 = etäisyysvirheen RMS (neliöllinen keskiarvo), jota käytetään <b>tarkkuudelle ja jatkuvuudelle</b>

seg-8ff2973d7f5b = σ_URA / SISA (avaruussignaalin tarkkuus)

seg-f993962a5c9b = etäisyysvirheen raja, jota käytetään <b>eheydelle</b> (≥ σ_URE)

seg-727c7fbe1b01 = suurin nimellinen etäisyysharha, joka sisällytetään yksipuolisesti eheysrajaan (<c1/>); katso §{ "3" }

seg-a79e42c29c46 = havaitsemattoman yhden satelliitin vian ennakkotodennäköisyys

seg-78c45312d2ff = tähdistön laajuisen vian ennakkotodennäköisyys

seg-19cc5ff2e541 = <c1/> palauttaa julkaistut WG-C-viitearvot: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> altistusvälillä. Näitä arvoja käytetään ARAIMin saatavuuden mitoitukseen viitekirjallisuudessa; operatiivinen ISM lähetetään tai kootaan maalla ja on säädettävissä tähdistökohtaisesti. Ero σ_URA:n (eheys) ja σ_URE:n (tarkkuus) välillä on tarkoituksellinen ja ISM-käsitteen määrittävä piirre.

seg-0c1687628e67 = <c1/> ja <c2/> antavat nämä suoraan kahdelle moottorille.

seg-8c516e53f595 = { "2" }. Vikahypoteesit

seg-b6353366ebf0 = ARAIM on <em>monihypoteesinen ratkaisuerotus</em>-menetelmä (MHSS). Kullekin vikahypoteesille <c1/> se muodostaa kaikki näkyvissä olevat satelliitit sisältävän ratkaisun ja aliratkaisun, joka sulkee pois viallisen joukon, ja rajaa sijaintivirheen tämän hypoteesin alla:

seg-3b340e082b84 = <c1/> (ennakko <c2/>): koko kaikki näkyvissä olevat sisältävä pienimmän neliösumman ratkaisu.

seg-03332e433edc = Yhden satelliitin viat

seg-add4792e4e40 = <c1/> (ennakko <c2/> kutakin): jokainen yhden satelliitin poissulkeva aliratkaisu. Tämä on perinteinen yhden vian ARAIM-lähtötaso, <a1><c3/></a1>.

seg-7e20f419e670 = Tähdistön laajuiset viat

seg-920bd35833ff = <c1/> (ennakko <c2/> kutakin): aliratkaisu, joka poistaa <em>kaikki</em> yhden tähdistön satelliitit kerralla, EU:n (European Union) ARAIM TN (tekninen muistio) / DO-316-laajennus, joka on toteutettu funktiona <a1><c3/></a1>. Kun <c4/>, tämä palautuu <b>bitti bitiltä</b> muotoon <c5/>.

seg-323dd205d238 = { "3" }. Suojaustasot

seg-9ab2676d2554 = Kullekin akselille (pysty, vaaka) ja kullekin hypoteesille moottori rakentaa tilan <c1/>, jossa kynnys on ratkaisuerotuksen havaitsemisraja väärän hälytyksen kertoimella <c2/> (jatkuvuusbudjetin Bonferroni-jako <c3/> hypoteesin kesken). Suojaustaso on pienin raja <c4/>, jonka summattu eheysriski

seg-05c0d8fc855c = Toteutushuomautus.

seg-248092fe9b94 = <c1/> on yksipuolinen nimellisharhan projektio akselille — satelliittikohtaisten vahvistusten itseisarvojen pahimman tapauksen summa (<a1><c2/>/<c3/></a1>) — peräisin ISM:n arvosta <c4/>. WG-C-viite-ISM käyttää arvoa <c5/>; kun <c6/>, raja palautuu nollan nimellisharhan MHSS-muotoon. Ajettava skenaario <c7/> tarjoaa <c8/> (suojaustason mitoituksessa käytetty eheysraja, rajattu arvoon ≥ <c9/> ja oletuksena sen mukainen) ja <c10/> (oletuksena { "0" }), joten suojaustaso mitoitetaan aina eheysrajalla σ_URA, ei koskaan pienemmällä tarkkuuden σ_URE:llä. Tämä on edelleen <b>mallinnettu, sertifioimaton</b> ARAIM-toteutus — katso <a2><c11/></a2>.

seg-f6bccff61ff5 = täyttää varatun budjetin ([<c1/>] / <a1><c2/></a1>). VPL (pystysuojaustaso) ja HPL (vaakasuojaustaso) ovat pysty- ja vaakavastaukset. Tulos raportoi myös todellisuudessa saavutetun eheysriskin (<c3/> varaus) ja sen, erottuiko jokin aliratkaisu yli kynnyksensä.

seg-b1a868221848 = Tämä on eksplisiittinen ARAIM-sopimus — ”kuinka suuri rajan täytyy olla?” — eikä kiinteäkertoimisen perinteisen RAIMin implisiittinen, geometriasta riippuva riski.

seg-c90cf313dea8 = { "4" }. Stanford-diagrammi

seg-b51e44c3deda = <a1><c1/></a1> kerää <c2/> epookkia kohden kiinteää hälytysrajaa (AL) vasten, ja <a2><c3/></a2> lajittelee kunkin luokkaan <em>saatavilla</em>, <em>järjestelmä ei saatavilla</em> (PL > AL, konservatiivinen), <em>harhaanjohtava tieto</em> (PL < virhe ≤ AL) tai <em>vaarallisen harhaanjohtava tieto</em> (virhe > AL ja > PL). <a3><c4/></a3> renderöi klassisen sirontakuvan — eheysrajan <c5/>, hälytysrajaoppaat ja yksi värikoodattu merkki epookkia kohden — itsenäisenä SVG:nä (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Kaksoistähdistön hyöty

seg-96e114a6981c = Kaksi vaikutusta osoitetaan testissä <c1/>:

seg-06c7d8d62b44 = <b>Geometria / redundanssi</b> — toisen tähdistön satelliittien yhdistäminen kiristää yhden vian HPL:ää: enemmän mittauksia ja suurempi yhden SV:n (SV: space vehicle eli satelliitti) aliratkaisujoukko antavat tiukasti pienemmän rajan.

seg-f788c9e07547 = <b>Tähdistön vikasietoisuus</b> — kun <c1/> on aktiivinen, kaksoistähdistön käyttäjä pysyy saatavilla, kun kokonainen tähdistö voi vikaantua (<em>toisen</em> tähdistön satelliitit säilyvät), kun taas yhden tähdistön käyttäjää ei voida todistettavasti suojata oman tähdistönsä vikaa vastaan (<c2/> palauttaa <c3/>).

seg-f52a937bad94 = Rehellisesti mainittava hienous: koska tähdistövikahypoteesi edellyttää <em>koko</em> tähdistön menetyksestä selviämistä, kaksoistähdistön <em>tilannekuva</em>-suojaustaso on alhaalta rajattu jäännöksenä jäävällä yhden tähdistön geometrialla — se ei ole automaattisesti pienempi kuin pelkän GPS:n PL jokaisella hetkellä. EU:n ARAIM TN:n pääväite, että GPS+Galileo antaa <b>{ "15" }–{ "25" } % pienemmän HPL:n</b>, on <b>saatavuustulos</b>, joka on kertynyt realistisilla tähdistöillä ja käyttäjäsijainneilla, ei tilannekohtainen takuu.

seg-b4289b877902 = { "6" }. Validoinnin tila

seg-e553de2eee63 = <b>Repositoriossa, automatisoitu:</b> MHSS-algebra (<c1/> ⇒ bitti bitiltä yhden vian; tähdistövika laajentaa PL:ää; budjettia ei koskaan ylitetä), yllä olevat geometria- ja tähdistövikaedut sekä harjoitus <b>todellisella IGS (International GNSS Service; GNSS = maailmanlaajuinen satelliittinavigointijärjestelmä) -tarkan radan (SP3, Standard Product { "3" }) geometrialla</b> (<c2/>), ei vain synteettisillä tähdistöillä.

seg-633bf11af170 = <b>Ulkoinen oraakkeli — julkaistu WG-C-laskuesimerkki:</b> suojaustasot tarkistetaan ARAIM Technical Subgroupin omaa numeerista esimerkkiä vasten tiedostossa <a1><c1/></a1>, <c2/> ja committoidussa fixturessa <c3/> (jokaisella vektorilla on noutoosoite (verkko-osoite), noutopäivä, lähdetiedoston SHA-256 (SHA: Secure Hash Algorithm) ja sivu). Hyväksymistoleranssi on viitteen oma <c4/>. Vasten asiakirjaa Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), liite D: <b>VPL { "18.2926" } m vs { "18.3" } m julkaistu (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m vs { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (efektiivinen monitorikynnys) { "7.2997" } m vs { "7.2998" } m, σ_v,acc { "1.3694" } m vs { "1.3694" } m, ja kaikki kuusi julkaistua tähdistövikavälitulosta (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) puolen yksikön tarkkuudella viimeisessä painetussa desimaalissa. Vuoden { "2016" } Milestone { "3" } Report esittää saman esimerkin mutta sisältää kaksi sisäistä virhettä — merkkivirheen matriisin <c5/> rivillä { "3" } ja arvon <c6/>, joka on laskettu { "57" } vikamoodilla, vaikka asiakirja ilmoittaa <c7/> ({ "12" } moodia) — joten sen geometrian välitulokset toistuvat täsmälleen, mutta sen suojaustasot kirjataan mitattuina poikkeamina (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) ja jätetään hyväksymisluvun ulkopuolelle. Tarkistus on käytettävissä skenaariotyyppinä <c8/>.

seg-6d79f9836abd = <b>Rehellinen jäännös (ulkoinen / odottaa tarkistusta):</b> { "15" }–{ "25" } %:n saatavuusluku <b>versiolukittua todellista Celestrak TLE (kaksirivinen elementtijoukko) -tilannekuvaa</b> vasten, ja ARAIM-testifixturien tallettaminen lainattavana <b>Zenodo</b>-tietueena. Yllä oleva viitetarkistus kattaa vain tapauksen <c1/> (yhden satelliitin ja yhden tähdistön vikamoodit); samanaikaisia usean tapahtuman vika-osajoukkoja, vian poissulkemista, χ²-johdonmukaisuustarkistusta ja viitealgoritmin kaksoislaskennan uudelleenallokointivaihetta ei ole toteutettu, ja tapaus, jonka ennakot vaatisivat niitä, hylätään eikä typistetä.

seg-b57b889dc536 = <b>Skenaariotiedoston ulottuvuus:</b> skenaariotyyppi <c1/> ajaa <c2/> jokaisella epookilla, kun sen TOML (Tom's Obvious Minimal Language) -tiedosto asettaa <c3/> (valinnainen <c4/>); mukana toimitettu <a1><c5/></a1> tekee niin yhdistetyllä GPS + Galileo -geometrialla, ja <c6/> ajaa saman moottorin todellisilla Celestrak GPS- ja Galileo-TLE-tiedoilla, jotka on propagoitu yhteiseen epookkiin. Ilman lippua ajuri käyttää perinteistä ratkaisuerotus-RAIMia.

seg-6cb7a787ac67 = Lähteet

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" }. helmikuuta { "2016" } — Annex A (viitekäyttäjäalgoritmi) ja §A.IX (numeerinen esimerkki). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" }. kesäkuuta { "2019" } — Appendix D (numeerinen esimerkki LPV-200:lle). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (Yhdysvallat) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (aiemmin Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (vähimmäissuorituskykystandardit); DO-316 ARAIM MASPS (ilmailujärjestelmän vähimmäissuorituskykystandardit) -aineisto.

seg-d5ed1c3cfb1f = Blanch ym., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (Stanford-diagrammin menetelmä).

seg-d4f50d307775 = <s1>Edellinen</s1>Spektri ja vesiputous

seg-f05ca316fe8e = <s1>Seuraava</s1>DO-316 / DO-229E -kartta
