# docs--kind-lunar-time-budget: translations (fi)

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-8f8871ac8a0f = Aihesivu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Aihesivu: <a1>integrations.md</a1>

seg-11f512367036 = Lähde: <c1/>

seg-f7cd4fcfc62d = <c1/> (skenaariotyyppi)

seg-cac3a0bcbfc6 = MODELLED päästä päähän ulottuva Coordinated Lunar Time (LTC) -aikavirhebudjetti: seitsemän LTC-virhetermiä koottuna aikavirhekäyriksi x_i(τ) koko keskiarvoistusaikojen ruudukon yli, neliöllisesti summattuna x_Σ(τ):ksi, sekä kellon ja koordinaatiston RISTEYSKOHTA τ, jossa kasvava kellotermi ylittää vakion reaaliaikaisen koordinaatiston toteutustermin (sen alapuolella budjettia rajoittaa koordinaatisto, yläpuolella kello) — rehellinen vastaus yhden τ:n artefaktiin. τ-kaltevuudet ovat suljetussa muodossa ja analyyttisesti tarkistettavissa (kello τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, lattiat τ^{ "0" }, mittaus τ^{ "{" }-1/2{ "}" }) ja kelloriveillä toistetaan julkaistut yhden päivän kellomäärittelyt (crate::clock_specs); RF/optisen linkin, koordinaatiston toteutuksen, relativistisen residuaalin ja efemeridin lattian SUURUUDET ovat mallinnettuja budjettiosuuksia (dokumentoidut oletukset, kutsujan ohitettavissa), eivät mittauksia. Kontribuutio on toistettava risteyskohta τ, ei sertifioitu termikohtainen luku; ei sertifioitu operatiiviseen ajanpitoon.

seg-8a5c9e451d4e = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-time-budget | kello passive-h-maser | 7 termin x_Σ(τ) { "57" } τ-pisteen yli ({ "1" }–{ "1e7" } s) | risteyskohta τ { "8.689e4" } s (x { "1.001e-9" } s) | koordinaatiston lattia { "1.001e-9" } s | kello x({ "1" } vrk) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Esimerkki <c1/> asettaa muun muassa:

seg-eebd3e40d0b9 = Tuloksen nimike (moottorin oma): MODELLED päästä päähän ulottuva LTC-aikavirhebudjetti. τ-kaltevuudet ovat suljetussa muodossa ja analyyttisesti tarkistettavissa (kello τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, lattiat τ^{ "0" }, mittaus τ^{ "{" }-1/2{ "}" }) ja kelloriveillä toistetaan julkaistut yhden päivän kellomäärittelyt; RF/optisen linkin, koordinaatiston toteutuksen, relativistisen residuaalin ja efemeridin lattian

seg-56fe184f2a12 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-time-budget.toml, tyyppi lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Yksi lunar-time-budget-ajo tuottaa kello–koordinaatisto-risteyskohtarivin kutakin kelloluokkaa kohti yhtä jaettua koordinaatistotermiä vasten, joten kello on vertailun ainoa muuttuja; jokainen rivi sisältää risteyskohdan, joka on saavutettu kahdella tavalla -- puolittamalla yleisestä

seg-fd52e493b6c2 = <b>MODELLED</b> Skenaarion lunar-time-budget valinnainen [time_lab]-lohko mallintaa kuun referenssiaseman kelloa (oletuksena miniRAFS-luokka tai mikä tahansa nimetty luokka tai vakausarvoihin sovitettu laitekortti), joka on ohjattu Coordinated Lunar Time -aikaan ja Testit: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Yksi lunar-time-budget-ajo tuottaa kello–koordinaatisto-risteyskohtarivin kutakin kelloluokkaa kohti yhtä jaettua koordinaatistotermiä vasten, joten kello on vertailun ainoa. Oraakkeli (InternalConsistency): Kaksi eri koodikannan sisäistä laskentaa samalle suureelle, ei yhtä uudelleen esitettyä: IEEE-1139-potenssilakikäyrän puolitus ei tiedä mitään kohinatyypistä, kun taas suljettu muoto kääntää vallitsevan tyypin algebrallisesti, joten väärin luokiteltu kohinatyyppi tai huono haarukka näkyy ei-pienenä suhteellisena erona. Neljä arvoa toistavat myös artikkelin julkaistun taulukon puoleen viimeisestä tulostetusta numerosta -- mutta tuo taulukko oli sen

seg-4c0d7da4f7f6 = <b>MODELLED</b> Skenaario lunar-time-budget julkaisee taulukkoarvoiset tulosteensa pitkän muodon (ruudukon indeksi, keskiarvoistusaika, termi) taulukkona raportin rinnalla, joten seitsemän per. Oraakkeli (InternalConsistency): Vain itsejohdonmukaisuus: julkaistu summa tarkistetaan saman tiedoston termien neliösummaa vasten, ja tuotettu käyrä toistaa julkaistun p3_time_budget_curve.csv-tiedoston kaikissa { "57" } pisteessä. Molemmat tarkistukset jakavat tämän moottorin omat termimääritelmät, joten kumpikaan ei ole riippumaton. Kellotermi nojaa julkaistuihin kellomäärittelyihin, mutta linkin, koordinaatiston, relativistisen ja efemeridilattian SUURUUDET on dokumentoitu

seg-8abdeb1a36e1 = MODELLED päästä päähän ulottuva LTC-aikavirhebudjetti. τ-kaltevuudet ovat suljetussa muodossa ja analyyttisesti tarkistettavissa (kello τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, lattiat τ^{ "0" }, mittaus τ^{ "{" }-1/2{ "}" }) ja kelloriveillä toistetaan julkaistut yhden päivän kellomäärittelyt; RF/optisen linkin, koordinaatiston toteutuksen, relativistisen residuaalin ja efemeridin lattian SUURUUDET ovat mallinnettuja budjettiosuuksia (dokumentoidut oletukset, kutsujan ohitettavissa), eivät mittauksia. Kontribuutio (tulos <c1/>)

seg-66a794432751 = MODELLED päästä päähän ulottuva Coordinated Lunar Time (LTC) -aikavirhebudjetti: seitsemän LTC-virhetermiä koottuna aikavirhekäyriksi x_i(τ) koko keskiarvoistusaikojen ruudukon yli, neliöllisesti summattuna x_Σ(τ):ksi, sekä kellon ja koordinaatiston RISTEYSKOHTA τ, jossa kasvava kellotermi ylittää vakion reaaliaikaisen koordinaatiston toteutustermin (sen alapuolella budjettia rajoittaa koordinaatisto, yläpuolella kello) — rehellinen vastaus yhden τ:n artefak (tyyppiluettelo (<c1/>))

seg-ca1763d4a416 = Rehellisyys: MODELLED. Tau-kaltevuudet ovat suljetussa muodossa ja analyyttisesti tarkistettavissa (kello tau^{ "{" }+1/2{ "}" } tai tau^{ "{" }+{ "1" }{ "}" }, lattiat tau^{ "0" }, mittaus tau^{ "{" }-1/2{ "}" }) ja kelloriveillä toistetaan julkaistut yhden päivän kellomäärittelyt; mutta RF/optisen linkin, koordinaatiston toteutuksen, relativistisen residuaalin ja efemeridin lattian SUURUUDET ovat mallinnettuja budjettiosuuksia (dokumentoidut oletukset, kutsujan ohitettavissa), eivät mittauksia. Kontribuutio on (skenaariotiedoston kommentti, rivit { "13" } - { "18" })

seg-8f884949bdf1 = Kelloluokkakohtainen kuun ajan risteyskohtataulukko on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Kuun aikavirhebudjetin toistettavuus on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Edellinen</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Seuraava</s1>lunar-time-offset

seg-b851d30fe736 = <s1>Edellinen</s1>lunar-surface
