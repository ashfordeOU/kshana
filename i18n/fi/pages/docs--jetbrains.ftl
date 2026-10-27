# docs--jetbrains: translations (fi)

seg-f8a0fe9968c4 = Lähde: <c1/>

seg-c55e49fd2a72 = Kshana JetBrains-IDE-ympäristöille

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> JetBrains Marketplacessa</a1> — tai missä tahansa JetBrains-IDE:ssä <em>Settings → Plugins → Marketplace → search "Kshana"</em>.

seg-959ab829762c = Natiivi liitännäinen, joka ajaa <b>Kshana</b>-PNT-kestävyyssimulaattoria minkä tahansa JetBrains-IDE:n (IntelliJ IDEA, CLion, RustRover, PyCharm, …) sisältä. Napsauta skenaariota <c1/> hiiren kakkospainikkeella → <b>Run Kshana Scenario</b>; laatumittarit ja tulos-JSON virtaavat <b>Kshana</b>-työkaluikkunaan.

seg-594199d2ce06 = Täydentää <a1>MCP-palvelinta</a1> (joka antaa JetBrains <em>AI Assistantille</em> pääsyn Kshanaan): tämä liitännäinen on <em>ihmisen</em> osoita ja napsauta -reitti.

seg-a356f2c30afb = Toiminto <b>Run Kshana Scenario</b> millä tahansa kohteella <c1/> (editorin ja projektinäkymän kontekstivalikot) — ajaa komennon <c2/> ja näyttää tulosteen Kshana-työkaluikkunassa.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> skenaariolla <c1/> <c2/> (<c3/>): luottamusaikajana, jossa on 0–100 pistemäärä ja syyt aluksesta. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> kohteella <c1/> <c2/> (<c3/>): synteettinen siltaympäristön NMEA ja ohjaajan loki kirjoitettuna skenaarion viereen. Vain tekstiä; harjoitukseen, ei koskaan aluksen todellisiin navigointijärjestelmiin.

seg-99510426a384 = <b>Build Interference Map</b> ADS-B- tai AIS-tiedostolla <c1/> (projektinäkymä; kysyy, mikä hyväksytty aineisto se on) ja <b>Route Exposure</b> reittitiedostolla (kysyy karttojen kansion). Heikentynyt solu ei tunnista häiriötä syyksi; ei ole ennuste.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> skenaariolla <c1/> (<c2/>): ajoneuvon liike, NMEA ja nimetyt tapahtumat laboratorion GNSS-simulaattoria varten, kirjoitettuna skenaarion viereen. Se ei kirjoita signaalia; aja simulaattoria vain siellä, missä se on sallittu.

seg-79c553c303c5 = <b>Build Compliance Report</b> ajotuloksella <c1/> (<c2/>) ja <b>Tools → Show Compliance Mapping</b> (<c3/>): julkisen viitekehyksen vastaavuuskuvaus, näytettynä moottorin oman lausuman kanssa sanasta sanaan.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> todistepaketin kansiolla (projektinäkymä; <c1/>): kysyy allekirjoittajan julkisen avaimen ({ "64" } heksadesimaalinumeroa tai tiedosto <c2/>; aina kiinnitetty, liitännäinen ei koskaan hyväksy kiinnittämätöntä allekirjoittajaa) ja valinnaisesti koko istuntolokin. Vain varmennettu tulos luetaan varmennetuksi; ehjä paketti kiinnittämättömällä allekirjoittajalla luetaan ”NOT VERIFIED”.

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> tuloksella <c1/> <c2/> (<c3/>): Prometheus-teksti, CEF/LEEF-syslog-tapahtumat tai Home Assistant MQTT -rivit tulostettuna Kshana-ikkunaan. Mitään ei lähetetä eikä tarjoilla; käynnissä olevat viejät pysyvät komentorivillä.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> paikallaan olevalla IMU-tiedostolla <c1/> (<c2/>): skenaarioiden <c3/> ja <c4/> kiihtyvyysmittarin ja gyron parametrit sovitettuna Allanin poikkeamalla, tulostettuna Kshana-ikkunaan taulukkona <c5/>. Mitään ei kirjoiteta; sovitus on MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (Tools-valikko; <c2/>) ja <b>Assess Receiver Stream</b> (alusistunto <c3/> sekä valitsemasi tallennettu NMEA-loki; <c4/>, pisteytetty kerran ilman pistoketta ja ilman porttia).

seg-38037d36639c = <b>Insert Example Scenario</b> (projektinäkymän kansio tai Tools-valikko; <c1/>): valitse mukana toimitettu skenaario, ja se kirjoitetaan uutena tiedostona <c2/> (ei koskaan tiedoston päälle). <b>Export Scenario</b> tiedostolla <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; vain simuloitu tuloste), <b>Animate Scenario</b> (HTML tai SVG, avataan selaimessa) ja <b>Import Route</b> reittitiedostolla <c4/> (kysyy, mikä skenaario).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> vastaanottimen luottamuksen istunnolla <c1/> (<c2/>): kysyy ikkunan, jo olemassa olevan allekirjoitusavaintiedoston ja tulostekansion. Liitännäinen ei koskaan luo, lue eikä tallenna avainta (<c3/> pysyy komentorivillä). <b>Attach Timestamp</b> pakettikansiolla (<c4/>): Kshana ei tarkista aikaleimapalvelun allekirjoitusta; aja <c5/> itse.

seg-f4f6605d3db9 = Edelleen vain komentorivillä: IQ-komennot, <c1/> ja <c2/>.

seg-63efd04104f1 = Alareunan <b>Kshana</b>-työkaluikkuna, joka isännöi ajokonsolia.

seg-decda07aa7eb = Ei liitännäisessä: <c1/> (pitkään käynnissä oleva virtaprosessi, jossa on portti ja valinnainen TCP-kuuntelija) ja <c2/> pysyvät komentorivillä, koska IDE-toiminto ajaa komennon loppuun ja näyttää sen tulosteen; katso <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> osoittamaan binäärin <c1/> (tyhjä → ratkaistaan muuttujasta <c2/>; asenna komennolla <c3/>).

seg-44dfdd65bd0a = Liitännäinen on puhtaasti alustapohjainen (ei kielikohtaisia riippuvuuksia), joten se latautuu jokaiseen JetBrains-IDE:hen, jonka koonti on { "243" } ({ "2024.3" }) tai uudempi.

seg-453bd42c23fa = Rakenna ja aja

seg-b5328f8c7a8a = Vaatii JDK { "17" }+ (koonti kiinnittää JDK-version { "21" }) ja mukana toimitetun Gradle-wrapperin.

seg-758124ceb1c7 = <c1/> tarkistaa oletuksena since-buildin { "2024.3" }. Muiden linjojen tarkistamiseksi luettele ne muodossa <c2/> (jokainen IDE on noin { "1" } GB:n lataus):

seg-15d175aaeb59 = Liitännäinen ei käytä yhdelläkään näistä vanhentunutta eikä poistettavaksi merkittyä alustan rajapintaa; pidä se sellaisena (valintaikkuna kulkee kohteen <c1/> kautta, ei kohteen <c2/>).

seg-39cfd740d9b3 = Asenna rakennettu zip valinnalla <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Rakenne

seg-73b3f55b7208 = Eristys

seg-a14db8de576a = Kuten <c1/> ja <c2/>, tämä on erillinen Gradle-projekti, joka on jätetty pois julkaistusta crate-paketista <c3/> (<c4/> paketin kohdassa <c5/>); sen koontituloste on git ohittaa sen (gitignore).

seg-b38914a430b9 = Lisenssi: AGPL-3.0-only (tai kaupallinen lisenssi Ashforde OÜ:ltä — katso repositorion <c1/>).

seg-bb286e3ce9c9 = <s1>Edellinen</s1>Mistä kukin ominaisuus on tavoitettavissa

seg-e62586b5f58c = <s1>Seuraava</s1>Missä Kshana toimii
