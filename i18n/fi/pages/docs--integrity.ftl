# docs--integrity: translations (fi)

seg-668241606715 = Lähde: <c1/>

seg-9a8c218ce054 = Eheys ja tietoturva: mitä Kshana mallintaa ja mitä ei

seg-52038c93765d = Kshana raportoi kaksi laatumittaria (FoM) — <b>Eheys</b> ja <b>Tietoturva</b> — jotka on helppo sekoittaa samannimisiin ilmailun tasoisiin suureisiin. Tämä sivu kertoo suoraan, mitä ne ovat nyt, mitä ne <em>eivät</em> ole ja mitä etenemissuunnitelma lisää. Jos arvioit Kshanaa ihmishengen turvaamiseen tai sertifiointiin liittyvässä käytössä, lue tämä ensin.

seg-fb6e93a107e7 = Nykytila ({ "v0.37.0" })

seg-ecd20ae1a05d = Eheys-FoM — suodattimen sisäinen johdonmukaisuus

seg-153391e55508 = Eheys-FoM on niiden katkon aikaisten näytteiden osuus, joissa todellinen ajoitusvirhe pysyy Kalman-suodattimen oman k-sigma-suojausrajan sisällä:

seg-ac2413a97a7b = Tämä mittaa, onko suodattimen <em>itse ilmoittama</em> epävarmuus rehellinen sen <em>oman</em> virheen suhteen GNSS-katkon (maailmanlaajuinen satelliittinavigointijärjestelmä) aikana. Se on hyödyllinen sisäinen johdonmukaisuustarkistus.

seg-c9f80760ea53 = Se <b>ei</b> ole:

seg-8899525ad177 = <b>vaaka- tai pystysuuntainen suojaustaso (HPL/VPL)</b> — paikka-alueen suojaustasoa ei ole lainkaan (kellopaketit ovat ajoitusalueella);

seg-dd9a3e58e10b = <b>eheysriski / vaarallisen harhaanjohtavan tiedon todennäköisyys (P_HMI)</b>;

seg-31fa92b3271d = <b>hälytysrajan</b> vertailu;

seg-ee998b974e6f = vaatimustenmukainen standardien <b>RTCA DO-229E / DO-316</b> tai <b>EUROCAE ED-259A</b> kanssa (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) eikä minkään muunkaan sertifiointistandardin kanssa.

seg-f84a56b6fe10 = Tietoturva-FoM — analyyttinen harhautuksen havaittavuusraja

seg-e532288ed262 = Tietoturva-FoM on <b>kellon vakauteen perustuva harhautuksen havaittavuusraja</b>: kellon kohinan (valkoisen taajuuden ja satunnaiskulun PSD:t (tehospektritiheydet)) ja valvontaikkunan perusteella se on yhden kellon johdonmukaisuusvalvojan analyyttinen havaitsemismarginaali hitaasti kasvavaa väärän ajan harhautusta vastaan. Hiljaisempi kello (esim. optinen kello) havaitsee pienemmän, hitaamman harhautuksen kuin kohinaisempi (esim. CSAC (sirumittakaavan atomikello)) — tämä kontrasti on demonstraattorin pointti.

seg-fc718a805b28 = Se <b>ei</b> ole usean satelliitin RAIM-ilmaisin (receiver autonomous integrity monitoring). Satelliittien välisiä pseudoetäisyysjäännöksiä ei ole, suojaustasoa ei ole eikä P_HMI:tä ole. Innovaatio-sigma-testillä on sama matemaattinen muoto kuin klassisella RAIM-vian havaitsemisella (Brown), mutta luku on tietyn kellon analyyttinen raja, ei RAIM-toteutus, ja se on mielekäs vain määritetyn harhautusskenaarion yhteydessä (katso skenaariotyyppi <c1/>, joka injektoi todellisen kasvavan hyökkäyksen).

seg-ae770e25031e = Tuloste sanoo tämän. Tyypit <c1/>, <c2/>, <c3/> ja <c4/> eivät määritä hyökkäystä, joten niiden yksirivinen yhteenveto tulostaa luvun sijaan <c5/>, ja niiden tulosasiakirja merkitsee kentän <c6/> arvoksi <c7/> syineen lohkossaan <c8/>. Itse arvo säilyy asiakirjassa kaikille, jotka haluavat rajan.

seg-960bd91a2b3a = Todellinen snapshot-, solution-separation- ja ARAIM-RAIM (<c1/>)

seg-3d31ec251ac0 = Todellinen paikka-alueen RAIM on toteutettu tiedostossa <c1/>, erillään yllä olevasta itsejohdonmukaisuus-FoM:sta:

seg-0e8240812c16 = <b>Usean satelliitin jäännösvalvonta</b> — se rakentaa näkölinjageometriamatriisin näkyviin satelliitteihin, muodostaa pienimmän neliösumman paikka- ja kelloratkaisun ja testaa jäännösten neliösumman.

seg-69f1535596e0 = <b>χ²-vian havaitseminen</b> — <c1/> (SSE: jäännösten neliösumma) on χ²(n−{ "4" }) ei-vikaoletuksen alla; vika julistetaan, kun arvo ylittää <c2/>. χ²-kynnykset saadaan riippuvuudettomasta regularisoidun epätäydellisen gammafunktion laskennasta (tarkka, ei taulukoita).

seg-6721779048f5 = <b>Kulmakertoimeen perustuva HPL / VPL</b> — <c1/>, missä <c2/> on satelliittikohtainen paikkavirheen herkkyys hattumatriisista ja <c3/> on epäkeskeisen χ²-jakauman harha, joka täyttää määritetyn havaitsematta jäämisen todennäköisyyden <c4/>.

seg-8dd60e98088d = <b>Solution-separation-RAIM (MHSS: multiple-hypothesis solution separation)</b> — kaikkien näkyvien satelliittien ratkaisulle ja jokaiselle yhden satelliitin poissulkevalle osaratkaisulle sisäkkäisten estimaattorien erotus <c1/> sekä <b>havaitsee että tunnistaa</b> viallisen satelliitin ja syöttää suojaustason rajan.

seg-719e27fdd2c1 = <b>ARAIM:n (advanced receiver autonomous integrity monitoring) eheysriskibudjetti (P_HMI)</b> — <c1/> ratkaisee pienimmän HPL/VPL:n, jonka vaarallisen harhaanjohtavan tiedon todennäköisyyksien summa <c2/> (Blanch ym., <em>Baseline ARAIM</em>) täyttää nimenomaisen eheysriskin allokaation, ja raportoi riskin, jonka tasot saavuttavat — joten eheyttä voi vaihtaa hälytysrajaan nähden suoraan sen sijaan, että se jäisi implisiittiseksi kiinteässä kertoimessa <c3/>.

seg-2f99acf45203 = <b>Stanford–ESA-eheyskaavio</b> (ESA: European Space Agency) — epookkikohtainen akkumulaattori luokittelee <c1/> Available-, System-Unavailable-, Misleading- ja Hazardously-Misleading-alueisiin saatavuusyhteenvetoa varten.

seg-33d01969fb0f = <b>Saavutettavissa päästä päähän</b> — skenaariotyyppi <c1/> ajaa yllä olevan SGP4- (Simplified General Perturbations { "4" }) tai Kepler-satelliittitähdistön, tai todellisista TLE-tiedoista (kaksirivisiä elementtijoukkoja) tai RINEX-navigointitiedostosta (Receiver Independent Exchange Format) luetun tähdistön yli ja tuottaa epookkikohtaisen HPL/VPL-saatavuuskartan määritettyjä hälytysrajoja vasten (<c2/>). Sama ajo <b>vie pystysuuntaisen Stanford-kaavion</b>: jokaisella suojatulla epookilla siemenluvulla toistettava virheetön etäisyysvirhearvonta kuvataan geometrian läpi todelliseksi pystysuuntaiseksi virheeksi ja luokitellaan VPL:ää ja pystysuuntaista hälytysrajaa vasten, joten JSON-tulos (JavaScript Object Notation) ja CLI-yhteenveto (komentorivikäyttöliittymä) sisältävät aluelaskennat (eheystapahtumat ja HMI: hazardously misleading information) — eivät vain saatavuusosuutta. Mukana toimitetulla tiedostolla <c3/> ajo raportoi, että { "361" } epookista { "344" } oli saatavilla ({ "95.3" } %) hälytysrajoilla vaaka { "40" } m ja pysty { "50" } m, ja eheystapahtumia oli { "0" } ja HMI-tapahtumia { "0" }.

seg-54e778eceef4 = <b>Kahden satelliittitähdistön ARAIM eheystukiviestillä</b> — <c1/> lisää <b>koko tähdistön vikatilan</b>: vapaan ja yksittäisen satelliitin hypoteesien lisäksi jokainen tähdistö tuo yhden hypoteesin, joka poistaa kaikki sen satelliitit, priorilla <c2/>, samaan MHSS-eheysriskin summaan. Viesti <c3/> (ISM) sisältää käyttäjän etäisyystarkkuuden eheyttä varten (<c4/>), tarkkuuden neliöllisen keskiarvon (<c5/>), suurimman nimellisen harhan <c6/>, joka taitetaan yksipuolisesti jokaiseen tilaan, sekä priorit <c7/> ja <c8/>; sen WG-C-viitejoukko (Euroopan unionin ja Yhdysvaltain satelliittinavigointiyhteistyön työryhmä C, jonka ARAIM-tekninen alaryhmä julkaisee viitteen) on σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } ja P_const = { "1e-4" }. Asetus <c9/> toistaa yksittäisen vian tuloksen <c10/> bitilleen. Skenaariotyyppi <c11/> käyttää tätä polkua asetuksella <c12/> (<c13/>: GPS + Galileo, { "48" } satelliittia, { "145" } epookista { "145" } saatavilla samoilla hälytysrajoilla).

seg-1f06bc1976bd = <b>Suojaustasot julkaistuja vertailuvektoreita vasten</b> — tyyppi <c1/> ajaa moottorin funktiot <c2/> ja <c3/> WG-C:n ARAIM-alaryhmän omilla läpikäydyillä esimerkeillä (Reference Airborne Algorithm Description Document v3.1, { "2019" }, liite D, ja raportti Milestone { "3" } Report ({ "2016" }), liite A). Pahin vaaka- ja pystysuuntaisen suojaustason ero hyväksymisvektorilla on { "0.0437" } m asiakirjojen oman { "0.05" } m toleranssin rajoissa. Tämä rivi on VALIDATED tiedostossa <a1><c4/></a1>: se tarkistaa suojaustason yhtälön, ei operatiivista ISM:ää eikä vastaanotinta.

seg-1dda7b318c5f = Jäljellä oleva aukko (etenemissuunnitelma)

seg-e27215296e1a = Mitä <c1/> <b>ei</b> vielä tee:

seg-964c0634eae0 = sitä <b>ei ole yhdistetty kello- ja holdover-skenaarion FoM:iin</b> — nuo paketit raportoivat edelleen yllä olevan suodattimen itsejohdonmukaisuus-Eheys-luvun, ei HPL/VPL:ää;

seg-eecf2f9f181e = vikahypoteesit ovat vapaa tapaus, <b>yksittäiset satelliitit</b> ja <b>kokonaiset tähdistöt</b> — samanaikaisia vikoja <b>kahden tai useamman satelliitin osajoukoissa (SV: space vehicle eli satelliitti)</b> ei mallinneta;

seg-fd0f9fb2de83 = ISM on konfiguroitava parametrijoukko (WG-C-viitearvoilla), ei lähetetty operatiivinen viesti eikä validoitu uhkamalli;

seg-88f5242b0809 = <b>vian havaitseminen ja poissulkeminen (FDE)</b> on vain yhden satelliitin ja snapshot-tyyppistä: solution separation nimeää viallisen satelliitin, ja <c1/> ratkaisee uudelleen jokaisen yhden satelliitin poissulkemisen ja palauttaa poissuljetun satelliitin sekä jäljelle jääneen osajoukon χ²-testin ja suojaustasot, mutta poissulkemisella suojattua paikkaa ei raportoida, eikä skenaariotyyppi <c2/> aja poissulkemisvaihetta.

seg-c85aa5dedc86 = Snapshot-, solution-separation- ja ARAIM-ytimiä harjoitetaan <b>todellisella IGS:n (International GNSS Service) tarkan radan (SP3: Standard Product { "3" }) geometrialla</b>, ei vain synteettisillä satelliittitähdistöillä: <c1/> muodostaa näkölinjageometrian aidon IGS SP3 -tuotteen ensimmäisestä epookista todellisella maa-asemalla ja tarkistaa, että suojaustasot ovat äärellisiä ja APV-I-hälytysrajojen (approach with vertical guidance) sisällä (vaaka { "40" } m ja pysty { "50" } m), että pseudoetäisyysharha { "60" } m lauettaa χ²-valvojan, että solution separation <b>tunnistaa</b> viallisen satelliitin ja että ARAIM:n tasot täyttävät allokoidun riskin <c2/>. <c3/> ajaa kahden tähdistön polun todellisilla 2026-06-07 Celestrakin GPS- ja Galileo-luetteloilla, propagoituna yhteiseen epookkiin (katso <a1><c4/></a1> §{ "3" }). Syvempi ristiintarkistus — suojaustasojen vertailu epookki epookilta gLABiin (GNSS-Lab Tool, ESA:n jakama GNSS-datan käsittelypaketti) koko RINEX-havaintokaaren yli — lisäisi vastaanotinalueen pariteetin. Sitä ei ole tehty: tyyppi <c5/> laskee koodin yhden pisteen paikan todellisista RINEX-havainnoista, mutta mitään tästä ratkaisusta johdettua suojaustasoa ei ole verrattu gLABiin.

seg-f5fac2e836a6 = Siis <c1/> on todellinen suojaustason ja eheysriskin ydin, joka on tavoitettavissa skenaariotyypeistä <c2/> ja <c3/>, jota on harjoitettu todellisella vertailuratageometrialla ja joka on tarkistettu WG-C-vertailuvektoreita vasten. Usean satelliitin osajoukon viat, vastaanotinalueen gLAB-pariteetti ja kello-FoM:n integrointi ovat edelleen etenemissuunnitelman kohteita, eikä mikään tästä ole sertifiointitodiste.

seg-487f24ed92d8 = <a1><c1/></a1> — jokaisen FoM:n ja lyhenteen yksirivinen määritelmä.

seg-7d3c12cf802e = <a1><c1/></a1> — ISM-parametrit ja WG-C-vertailuvektorit.

seg-04532ba5288f = <a1><c1/></a1> — vapaasti liukuvan kellon ajoituksen suojaustaso (TPL), joka on ehdollinen havaitsemiselle.

seg-43cea496da93 = <a1><c1/></a1> — mitkä suureet on validoitu viitettä vasten ja mitkä ovat itsejohdonmukaisuustarkistuksia.

seg-3037dde8135f = <c1/> — harhautuksen havaittavuusrajan johto.

seg-04d63778ca7f = RAIM kellon holdover-laatumittareiden rinnalla ({ "0.36" }, valinnainen)

seg-744e95749978 = Kelloskenaariossa voi olla osio <c1/> (<c2/>): sijainti (<c3/>, <c4/>, <c5/>), satelliittitähdistöesiasetukset (<c6/>, oletus <c7/>), maski, etäisyysjäännöksen sigma, väärän hälytyksen ja havaitsematta jäämisen todennäköisyydet, vaaka- ja pystysuuntaiset hälytysrajat, epookkiväli ja valinnainen ilmoitettu harha yhdellä satelliitilla. Ajo raportoi tällöin erillisen lohkon <c8/>: epookkikohtaisesti näkyvät satelliitit, snapshot-RAIM-suojaustasot ja tuomio (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>) sekä lukumäärät ja saatavuus ajon yli. Kun aikajana sanoo GNSS:n olevan estetty, RAIM ei ole käytettävissä eikä mitään ekstrapoloida; heikentynyt ikkuna arvioidaan nimellisenä. Holdover-laatumittarit eivät muutu, ja ilman osiota tuloste on tavu tavulta identtinen. MODELLED: edustava esiasetettu taivas, synteettiset jäännökset ja ilmoitetut rajat. Se vaatii <c14/>.

seg-139639263c90 = EU–USA WG-C ARAIM Milestone { "3" } -raportin suurimman URA:n toisto (CAP-05c)

seg-97906754d4c8 = Aiempi suunnitelma lupasi vertailun EU-ARAIM-teknisen muistion ”Table A-3” -taulukkoon. Tälle taulukolle ei löytynyt julkista lähdettä (EU–USA-työryhmä C:n ARAIM-teknisen alaryhmän julkisissa Milestone { "1" }–{ "3" } -raporteissa ei ole Table A-3:a), joten tuo vertailu on <b>peruttu</b>, eikä mitään luvata tuolla nimellä.

seg-b61607c477f2 = Sen sijaan yritetään julkista raporttia: <b>Milestone { "3" } Report</b> ({ "25" }. helmikuuta { "2016" }, GPS.gov-kopio, SHA-256 <c1/>), taulukot { "5" }, { "6" } ja { "7" }, jotka tulostavat jokaiselle satelliittitähdistökokoonpanolle ja kummallekin tasolle (RNP { "0.1" } ja RNP { "0.3" }) suurimman arvon <c2/>, jolla käyttäjistä { "90" } % saa saatavuuden { "99.5" } %. Kaksitoista tulostettua kohtaa (kaksitaajuustaulukoiden Depleted- ja Baseline-rivit) tarkistetaan kynnyksillä, jotka on ennakkorekisteröity tiedostossa <a1><c3/></a1> ennen mitään pisteytettyä ajoa, ja siellä on todettu poistamattomat poikkeamat: ei almanakkatiedostoja, Walker-kuoria todellisten paikkojen sijaan, karkeampi ruudukko ja askel sekä moottorin ADD v4.2:n vaakapolku raportin oman tekstin sijaan. Taulukot { "8" }–{ "13" } (yksitaajuus) ja Optimistic-rivit jätetään yrittämättä, syineen siellä. <b>Tulos: { "12" } kohdasta { "8" } toistettiin, { "4" } NOT MET (kiinnitetty):</b> kahden tähdistön kohdat ja kaikki pelkät Galileo-kohdat täsmäävät (N/A-rivit mukaan lukien), kahden tähdistön Depleted-RNP { "0.1" } -kohta saavuttaa kattavuuden { "0.847" } arvolla { "9" } m painettua arvoa { "9" } m vastaan (vaatisi { "0.90" }), ja kolme pelkkää GPS-kohtaa menee laajasti ohi (kattavuus { "0.70" } arvolla { "4" } m, { "0.58" } arvolla { "6" } m, { "0.65" } arvolla { "10" } m painettuja arvoja { "4" } m, { "6" } m ja ”>{ "10" } m” vastaan). Pelkkien GPS-kohtien ohiosumat voivat johtua siitä, että tasainen Walker-kuori korvaa todelliset GPS-paikat (D1); se on hypoteesi, ei löydös. Tulos pysyy MODELLED, olipa se mikä tahansa. Tutkimus on <c4/>; sen mitatut kattavuudet ovat tiedostossa <c5/> ja ne pisteyttää <c6/>. Itse raportti viitataan, sitä ei sisällytetä.

seg-0e98826cedcc = <s1>Edellinen</s1>Laitteistoturvallisuus

seg-e6f1e38977b7 = <s1>Seuraava</s1>Spektri ja vesiputouskaavio

seg-38ab3bb65327 = Todellinen snapshot-, solution-separation- ja ARAIM-RAIM (src/raim.rs)
