# docs--kind-realtime-frame-eop: translations (fi)

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-a2889fb2b42a = Aihesivu: <a1>integrations.md</a1>

seg-1ad013ffb9d1 = Lähde: <c1/>

seg-54620502f0dd = <c1/> (skenaariotyyppi)

seg-edfcb546d9de = Reaaliaikaisen kuukoordinaatiston / Maan orientaation ennustebudjetti: P4 taulukko { "1" } (koordinaatistovirheen johdonmukaisuustarkistus — jälkikäsitelty ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaaliaikainen ~{ "15" } m ↔ ~{ "0.5" } ms, kukin koordinaatiston paikka ilmaistuna vastaavana UT1-virheenä L19-vipuvarren Δr = D_EM·ω⊕·ΔUT1 kautta) ja taulukko { "2" } (mitattu UT1-ennustevirhe vs. horisontti — L18-käyrä luettuna suoraan todellisesta IERS finals2000A -sarjasta: Bulletin A − Bulletin B -lopullinen lattia ja usean päivän pysyvyysennustimen virhe, kumpikin kuvattuna Kuun koordinaatiston paikaksi L19:llä), sekä L21 neliösummattu reaaliaikainen koordinaatistovirhebudjetti (EOP + efemeridi + toteutuslattia). VALIDATED suljettu muoto (L19-vipuvarsi, ω⊕ ristiintarkistettu CIO-Maan pyörimiskulmaa vasten) ja VALIDATED todellinen data (L18-käyrä todellisilta finals2000A-riveiltä); MODELLED ovat kuun releiden radanmäärityksen kovarianssien suuruudet ja koordinaatiston toteutuslattia (edustavat osuudet) sekä pysyvyysennustin (ei IERSin operatiivinen Bulletin A -algoritmi). Ei sertifioitu reaaliaikainen koordinaatistotuote.

seg-488039e4240f = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: realtime-frame-eop | taulukko { "1" }: jälkikäsitelty { "0.27" } m ({ "0.0096" } ms UT1) ↔ reaaliaikainen { "14.4" } m ({ "0.514" } ms UT1) | taulukko { "2" }: lopullinen lattia { "0.0171" } ms → 3 vrk { "1.6644" } ms | budjetti yhteensä { "20.1" } m ({ "67.0" } ns) | L19-vipuvarsi + L18 todellinen data (validoitu), OD-kov. (mallinnettu)

seg-66264ec78a4c = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Esimerkki <c1/> asettaa muun muassa:

seg-c39a26aa1f1e = bundled fixture finals2000A_20260930

seg-9ef8a2b4c144 = Tuloksen nimike (moottorin oma): Reaaliaikaisen kuukoordinaatiston / Maan orientaation ennustebudjetti. VALIDATED suljettu muoto: L19-vipuvarsi ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ ristiintarkistettu CIO-Maan pyörimiskulmaa vasten. VALIDATED todellinen data: L18 UT1- ja napaliikkeen ennustevirhekäyrät luettuna suoraan todellisesta IERS finals200

seg-2721ed7727bb = Moottorin kirjoittama kaavio skenaariolle scenarios/realtime-frame-eop.toml, tyyppi realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Yksi taulukko raportoi UT1-ennustevirheen, napaliikkeen napavirheen ja niiden neliöllisen yhdistelmän Kuussa IDENTTISELLÄ epookkijoukolla horisonttia kohti ja tuottaa epookit, joissa kukin komponentti mitattiin. Testit: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Tyypin <c1/> ajonaikainen oletus on kirjaston oma sisäänrakennettu kopio sanatarkasta IERS finals2000A -otteesta (tools/finals2000A_20260930.txt: { "174" } peräkkäistä päivittäistä riviä, MJD 61224-61397, leikattu tiedostosta finals2000A.all päivältä 2026-09-30) kantaa Testit: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> Pienimmän neliösumman vakio-plus-kulmakerroin-sovitus loppupään ikkunan yli sekä pääasialliset jaksolliset termit — vuosittainen, puolivuosittainen ja kaksi pääasiallista tsonaalista vuorovettä UT1:lle; Chandler, vuosittainen ja puolivuosittainen navalle — ekstrapoloituna viimeisellä ikkunan sisäisellä Testit: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Yksi taulukko raportoi UT1-ennustevirheen, napaliikkeen napavirheen ja niiden neliöllisen yhdistelmän Kuussa IDENTTISELLÄ epookkijoukolla horisonttia kohti, tuottaen. Oraakkeli (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) lukien IERS finals2000A -tuotteen omalla Bulletin-B-muuten-A-säännöllään, ja pyerfa { "2.0.1.5" } (SOFA) täydet taivaalliset–maanpäälliset rotaatiot (c2i06a, sp00, pom00, c2tcio; Maan pyörimiskulma IERS { "2010" } yhtälön { "5.15" } mukaan tarkassa aritmetiikassa), ajettuina erillisinä ohjelmina jäädytetyn 2026-09-30 finals2000A.all -tiedoston sanatarkoilla riveillä; ennakkorekisteröity (455b8fb5) muutoksin A1 ja A2, jotka kiinnittävät vain

seg-020e5919c8fd = <b>VALIDATED</b> Tyypin <c1/> ajonaikainen oletus on kirjaston oma sisäänrakennettu kopio sanatarkasta IERS finals2000A -otteesta (tools/finals2000A_20260930.txt: { "174" } peräkkäi. Oraakkeli (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), lukien samat tavut omalla lukijallaan, ja IERS Bulletin A Vol. XXXIX No. { "039" } -taulukko, kopioituna luku luvulta; ennakkorekisteröity (6fdae01b) kuudella täsmällisellä kriteerillä ennen astropyn ajoa. Kaikki kuusi pätevät: { "30" } lopullista, { "54" } nopeaa ja { "90" } ennustettua riviä yhtäläisin MJD-listoin, jokaisella ennustetulla rivillä lippu P, oletusajon laskenta yhtäläinen ja ennusteet yhtä kuin Bullet

seg-530c87bbff78 = <b>MODELLED</b> Pienimmän neliösumman vakio-plus-kulmakerroin-sovitus loppupään ikkunan yli sekä pääasialliset jaksolliset termit — vuosittainen, puolivuosittainen ja kaksi pääasiallista tsonaalista vuorovettä UT1:lle; Cha. Oraakkeli (ReferenceImpl): Kolme riippumatonta reittiä, joista mikään ei ole julkaistu ennustetarkkuusluku. ({ "1" }) Analyyttinen signaali tunnetuin kertoimin — ainoa tapa harjoittaa jaksollista koneistoa, koska mikään sidottu sarja ei ole riittävän pitkä vuosittaisen termin sallimiseksi. ({ "2" }) Oppikirjan suljetun muodon pienimmän neliösumman ratkaisu, eri algebra kuin testattavan matriisiratkaisun, todellisilla riveillä. ({ "3" }) Aidot arkistoidut Bulletin A -ennusterivit, jotka

seg-a233df86be95 = Reaaliaikaisen kuukoordinaatiston / Maan orientaation ennustebudjetti. VALIDATED suljettu muoto: L19-vipuvarsi ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ ristiintarkistettu CIO-Maan pyörimiskulmaa vasten. VALIDATED todellinen data: L18 UT1- ja napaliikkeen ennustevirhekäyrät luettuna suoraan todellisesta IERS finals2000A -sarjasta (Bulletin A nopea vs. Bulletin B lopullinen, ja usean päivän pysyvyys todellisten päiväriveiden yli). JOHDETTU: koordinaatisto (tulos <c1/>)

seg-60e7ee7e6e3e = VALIDATED suljettu muoto (L19-vipuvarsi, ω⊕ ristiintarkistettu CIO-Maan pyörimiskulmaa vasten) ja VALIDATED todellinen data (L18-käyrä todellisilta finals2000A-riveiltä); MODELLED ovat kuun releiden radanmäärityksen kovarianssien suuruudet ja koordinaatiston toteutuslattia (edustavat osuudet) sekä pysyvyysennustin (ei IERSin operatiivinen Bulletin A -algoritmi). (tyyppiluettelo (<c1/>))

# text
seg-ddf4702f78e5 = Rehellisyys: VALIDATED suljettu muoto (L19-vipuvarsi, omega_earth ristiintarkistettuna CIO:n Maan pyörimiskulmaa vastaan) ja VALIDATED oikea data (L18:n UT1- ja napaliikekäyrät oikeilta finals2000A-riveiltä). JOHDETTU koordinaatiston realisaation lattia (Helmert-sovituksen jälkeinen residuaali). MODELLED ovat kuunreleen OD-kovarianssien suuruusluokat ({ "0.27" } m jälkikäsiteltynä, ~{ "14.4" } m reaaliaikaisena tunnin viiveellä — pyöristetty, ei takaisinlaskettu, kaikki (skenaariotiedoston kommentti, rivit { "27" }–{ "32" })

# text
seg-bc51b666d070 = Operatiivisen tyyppisen Maan orientaation ennusteen virhe, mitattuna ennuste vastaan lopullinen, on MODELLED, ei validoitu: tarkistettu erillistä toteutusta vastaan samassa koodikannassa, joka on riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Edellinen</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Seuraava</s1>reentry
