# docs--sgp4-validation: translations (fi)

seg-3c513ef2fd3b = Suure

seg-09da3685124b = Lähde: <c1/>

seg-dd68e234a5cd = SGP4/SDP4-validointi yhteisön vertailua vasten

seg-d7567fa218fe = Kshana-ratapropagaattori on validoitu SGP4/SDP4:n <b>kanonista yhteisövertailua</b> vasten (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): Vallado ym. julkaisun <em>”Revisiting Spacetrack Report #3”</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753) mukana julkaistut varmennusvektorit, jaettuna tiedostoina <c1/> (testi-TLE:t (kaksirivisten elementtien joukot)) ja <c2/> (odotettu TEME (true equator, mean equinox) -tila kullakin ajanhetkellä). Tämä on sama vertailu, jota vasten julkiset C++/Python/MATLAB-toteutukset validoidaan, joten sopivuus tässä on sopivuutta de facto -standardin kanssa.

seg-b99fb640886c = Verratut vertailutilat

seg-b16a220a41b7 = (kaikki tiedoston <c1/> rivit, lukittu testissä)

seg-e7d45e243571 = Pahin paikkavirhe

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satelliitti { "23333" }; toleranssi: < <c1/> km)

seg-01da72026e56 = Pahin nopeusvirhe

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satelliitti { "23333" }; toleranssi: < <c1/> km/s)

seg-041cbc679ed7 = Katetut tapaukset

seg-283f3c571a7c = lähellä Maata oleva SGP4, syvän avaruuden SDP4 (kuu-aurinko + { "12" } h/24 h resonanssi) ja tarkoituksenmukaiset virhekooditapaukset

seg-75c2bd004348 = Syvän avaruuden ja resonanssitapaukset ovat tärkeitä nimenomaan tälle projektille: GNSS-satelliitit (maailmanlaajuinen satelliittinavigointijärjestelmä) ovat ~{ "12" } h radoilla, jotka ovat syvän avaruuden ja resonanttisia, mitä kahden kappaleen + J2-sekulaarinen malli ei voi toistaa — SGP4/SDP4 voi.

seg-613697670501 = Menetelmä

seg-d753e2f76b4a = Toteutus (<c1/>) on riippuvuudeton Rust-portti public domain -Vallado-algoritmista; epookin käsittely on päiviä vuodesta 1950, käytössä on tila <c2/> (ei <c3/>), ja WGS-72 (WGS: World Geodetic System) -painovoimavakiot sovelletaan, kuten vertailu määrää.

seg-ebc18c4cb8ad = Testi (<c1/>) jäsentää mukana toimitetut fikstuurit <c2/> ja <c3/> (<c4/>), propagoi jokaisen testisatelliitin jokaiseen vertailuhetkeen ja varmistaa, että TEME-paikka ja -nopeus täsmäävät yllä olevissa toleransseissa. Vertailtujen rivien lukumäärä on lukittu täsmälleen arvoon <c5/>, jotta fikstuurin tai ohituskäyttäytymisen regressio ei voi hiljaa vähentää kattavuutta.

seg-d0566d4db829 = Toista se

seg-ba3ed7f0aba7 = Testi tulostaa vertailtujen rivien lukumäärän sekä pahimman paikka- ja nopeusvirheen. Fikstuurit on tallennettu versionhallintaan, joten tarkistus on täysin offline-tilassa ja deterministinen.

seg-4f539e17926e = Riippumaton ristiintarkistus pakettia <c1/> vasten

seg-0c2d2752179f = Julkaistun vertailun täsmääminen todistaa oikeellisuuden <em>taulukkoa</em> vasten. Jotta oikeellisuus voidaan todistaa myös <em>riippumatonta toteutusta</em> vasten, <c1/> ajaa laajasti käytetyn riippumattoman Rust-SGP4-kirjaston, paketin (crate) <a1><c2/></a1> (neuromorphicsystems/sgp4, versio { "2.4" }), samoilla { "666" } AIAA-vektorilla ja vertaa kahta koodikantaa suoraan keskenään. Molempia ajetaan <b>WGS72</b>-painovoimamallilla (World Geodetic System { "1972" }), jossa vektorit on määritelty (paketin oletus <c3/> käyttää WGS84:ää (World Geodetic System { "1984" }), joka poikkeaa WGS72-vertailusta ~km:n verran — mallinnusvalinta, joka tuodaan rehellisesti esiin, ei virhe).

seg-da0e4e6c9e96 = Rata-alue

seg-a6eefd68c27c = kshana ↔ vertailu

seg-e725899898a3 = crate ↔ vertailu

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = lähellä Maata (LEO/MEO (LEO: matala Maan kiertorata; MEO: keskikorkea Maan kiertorata))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = syvä avaruus (ei-resonantti)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = syvän avaruuden resonanssi (½ vrk)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = syvän avaruuden resonanssi (1 vrk)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = Kaksi riippumatonta toteutusta täsmäävät <b>alle mikrometrin</b> tarkkuudella lähellä Maata olevilla ja resonanttisilla radoilla ja <b>{ "4.12" } mm pahimmillaan</b> kaikilla rata-alueilla — sama { "4.12" } mm, joka on Kshana-ohjelmiston oma poikkeama vertailusta, eli ero <em>on</em> se yksi syvän avaruuden tapaus, ja paketti (crate) sijoittuu Kshana-ohjelmiston ja taulukon väliin. Koko taulukko (rata-aluekohtaisine rivimäärineen ja neljine patologisine tapauksineen, jotka paketti hylkää rakennusvaiheessa) on tallennettu tiedostoon <a1><c1/></a1> ja generoidaan uudelleen komennolla <c2/>.

seg-3aae516df868 = Tämän tuloksen ”julkaisemisen” tila

seg-2dd4b77c49d1 = Ristiinvalidointi itsessään on valmis ja repositoriossa. Tuloksen lähettäminen ulkoisille foorumeille (yhteisön luettelo, lyhyt huomautus, DOI-arkistoitu (DOI: digital object identifier) tallenne) on ylläpitäjän toimi, jota seurataan erikseen tiekartalla; tämä asiakirja on repositorion sisäinen tallenne, johon nuo lähetykset viittaisivat.

seg-b36bbcc0a0c8 = <s1>Edellinen</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Seuraava</s1>Voimamallin validointi

seg-6539dbb48bca = Riippumaton ristiintarkistus sgp4-paketilla
