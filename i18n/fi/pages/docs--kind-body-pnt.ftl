# docs--kind-body-pnt: translations (fi)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-02b8d1f1b7df = Lähde: <c1/>

seg-e28ba749a2a1 = <c1/> (skenaariolaji)

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-e7dad1a1ecba = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä: kiertäjä tai pintalaskeutuja nimellä valitun keskuskappaleen (Mars, Kuu, Europa, Ganymede, Titan ja muu aurinkokunnan luettelo) ympärillä, joka navigoi yhdensuuntaisilla pseudoetäisyyksillä pienestä Walker-navigointisatelliittitähdistöstä kappaleen ympärillä (kaksikappaleradat kappaleen oman J2-sekulaariajautuman kanssa, tuntematon käyttäjän kello) ja valinnaisesti kellosta riippumattomalla syväavaruuden kaksisuuntaisella etäisyydellä Maasta, jonka suunta ja etäisyys tulevat analyyttisestä aurinkokunnan efemeridistä jokaisella epookilla. Näkölinjat estää kappaleen keskimääräinen pallo, ja pintakäyttäjä tarvitsee lisäksi korkeuskulmamaskin. Epookkia kohden: näkyvissä olevat releet, onko Maa horisontin yläpuolella, pelkän satelliittitähdistön GDOP ja PDOP (geometrinen ja paikan tarkkuuden heikkenemiskerroin), muodollinen yhden sigman paikkaepävarmuus Maa-rivin kanssa ja ilman sitä sekä siemenluvulla alustetun Gauss–Newton-pienimmän neliösumman ratkaisun virhe kummallakin tavalla; ajon yli: saatavuus, Maan näkyvyys, PDOP:n mediaani, RMS-virhe ja muodollisen sigman mediaani sekä Maa–kappale-valoaika, edestakainen matka, Shapiro-viive ja Auringon erotuskulma epookilla. MODELLED: releiden radat, kohinatasot ja hetkellinen mittausmalli ovat mallinnusvalintoja, joita ei ole validoitu tehtävän navigointidataa vastaan; kappaleen vakiot ovat tiedostossa body.rs siteeratut julkaistut arvot, ja Maan geometria perii aurinkokunnan efemeridin nimikkeet.

seg-c90c1a79f88b = Yksi ajo tiedostosta <c1/> tiivistyy näin: Paikannus Marsin ympärillä — kiertäjäkäyttäjä, { "12" } relettä { "10000" } km:ssä, { "296" } epookkia Maan valoaika { "338.3" } s yhteen suuntaan, { "676.6" } s edestakaisin; Aurinko–Maa–kappale-kulma { "175.4" } deg saatavuus: { "1.000" } pelkkä satelliittitähdistö, { "1.000" } Maa-etäisyyden kanssa (Maa näkyvissä { "0.811" }) PDOP:n mediaani { "1.375" } ; RMS-virhe { "1.883" } m pelkkä satelliittitähdistö, { "1.629" } m Maa-etäisyyden kanssa muodollisen sigman mediaani { "1.375" } m pelkkä satelliittitähdistö, { "1.304" } m Maa-etäisyyden kanssa

seg-31bacf177d9c = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Esimerkki <c1/> asettaa muun muassa:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Tulosnimike (moottorin oma): MODELLED: kaksikappalereleradat J2-sekulaariajautumalla, geometrinen näkyvyys, Gaussin etäisyyskohina ja hetkellinen mittausmalli kappaleen ympärillä julkaistuista vakioista; ei validoitu tehtävän navigointidataa vastaan. Maa–kappale-geometria perii aurinkokunnan efemeridin nimikkeen

seg-6f341acbe994 = Moottorin kirjoittama kaavio skenaariolle scenarios/mars-orbit-pnt.toml, laji body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Newtonilainen yhdensuuntainen valoaika mistä tahansa kappaleesta mihin tahansa toiseen, vastaanotettuna epookilla, ratkaistuna radiometrisellä kiintopistevaloaikaratkaisijalla (radiometric::light_time_solution, lähetin viivästetyssä paikassaan) funktion solar_system::link_o kautta Testit: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Laji <c1/>: kiertäjä tai pintalaskeutuja nimellä valitun kappaleen ympärillä navigoi yhdensuuntaisilla pseudoetäisyyksillä Walker-navigointisatelliittitähdistöstä kappaleen ympärillä (kaksikappaleradat kappaleen J2-sekulaariajautumalla, tuntematon käyttäjän k

seg-5c3f8ac041d3 = <b>MODELLED</b> Laji <c1/>: kiertäjä tai pintalaskeutuja nimellä valitun kappaleen ympärillä navigoi yhdensuuntaisilla pseudoetäisyyksillä Walker-navigointisatelliittitähdistöstä kappaleen ympä. Oraakkeli (InternalConsistency): Suljetut muodot ja sisäinen johdonmukaisuus: Keplerin kolmas laki releen jaksolle, kiertoratasäde ja pintasäde, jotka pysyvät vakioina ajon yli, mittauksen lisääminen ei koskaan kasvata muodollista epävarmuutta, ja siemenluvulla alustetut virheet täsmäävät kovarianssiin. Releradat jättävät huomiotta kolmannet kappaleet (Jupiterin vetoa Europan ympärillä olevaan releeseen ei mallinneta), kohina on Gaussin ilmoitetuilla tasoilla ja mittausmalli on hetkellinen

seg-64920deda9cd = MODELLED: kaksikappalereleradat J2-sekulaariajautumalla, geometrinen näkyvyys, Gaussin etäisyyskohina ja hetkellinen mittausmalli kappaleen ympärillä julkaistuista vakioista; ei validoitu tehtävän navigointidataa vastaan. Maa–kappale-geometria perii aurinkokunnan efemeridin nimikkeet. (tulos <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: releiden radat, kohinatasot ja hetkellinen mittausmalli ovat mallinnusvalintoja, joita ei ole validoitu tehtävän navigointidataa vastaan; kappaleen vakiot ovat tiedostossa body.rs siteeratut julkaistut arvot, ja Maan geometria perii aurinkokunnan efemeridin nimikkeet. (lajiluettelo (<c1/>))

seg-04cd882741e2 = MODELLED. Releradat, { "1" } m:n etäisyyskohina ja hetkellinen mittausmalli ovat mallinnusvalintoja; mitään tässä ei ole validoitu tehtävän navigointidataa vastaan. Marsin vakiot ovat tiedostossa src/body.rs siteeratut julkaistut arvot. (skenaariotiedoston kommentti, rivit { "20" }–{ "22" })

seg-df6bae4c422e = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä paikallisella satelliittitähdistöllä ja syväavaruuslinkillä Maasta on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-670191cf797f = Aihesivu: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Aihesivu: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Edellinen</s1>attitude-budget

seg-96170e5c8e3f = <s1>Seuraava</s1>campaign
