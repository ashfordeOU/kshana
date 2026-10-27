# docs--compliance: translations (fi)

seg-f65b1f2b4182 = Tila

seg-e19db3d5273b = Lähde: <c1/>

seg-045b24defdbb = DO-316 / DO-229E eheyden compliance-kartta

seg-9100800daa1c = Tämä asiakirja kartoittaa RTCA:n (aiemmin Radio Technical Commission for Aeronautics) standardien <b>DO-229E</b> (SBAS (satelliittipohjainen täydennysjärjestelmä) MOPS (vähimmäissuorituskykystandardit)) ja <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System) -ilma-aluslaitteet) suojaustaso- ja eheydenvalvontavaatimukset niitä toteuttaviin Kshana-toimintoihin. Se on <b>tekninen jäljitettävyysapuväline</b>, ei toteamus siitä, että mikään vaatimus täyttyy — Kshana toteuttaa julkaistut algoritmit; se ei ole hyväksytty avioniikka.

seg-0e6ec5617eb5 = Koneluettava muoto on <a1><c1/></a1>; tämä proosa on sen kumppani (vastaa tiedostoa <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Painotetun pienimmän neliösumman suojaustasot (DO-229E Appendix J)

seg-0dc19f403f5e = Jokaiselle satelliitille <em>i</em>, jonka korkeuskulma on <c1/> ja atsimuutti <c2/> käyttäjällä, paikallisen tason (ENU (itä-pohjoinen-ylös) + kello) havaintorivi on

seg-6415f7f28e7e = painolla <c1/>, <c2/> (UDRE (käyttäjän differentiaalinen etäisyysvirhe) / GIVE (ruudukon ionosfäärin pystysuuntainen virhe) / ilma-alus / troposfääri -budjetti). Paikkakovarianssi on <c3/>; sen ENU-lohko antaa vaaka- ja pystysuuntaiset suojaustasot (HPL, VPL):

seg-ea574448bda4 = Kshana laskee <c1/> kääntämällä { "4" }×{ "4" } normaalimatriisin samalla rutiinilla, jota RAIM-pino (vastaanottimen autonominen eheyden valvonta) käyttää (<c2/>), ja validoi tuloksen kahdella tavalla (kovarianssireitin <c3/> ja projektioreitin <c4/> on oltava samat) sekä riippumatonta numpy-vertailugeometriaa <c5/> vastaan.

seg-f63dd3d7aad4 = Lähde

seg-268ae5b25684 = En-route → NPA (ei-tarkkuuslähestyminen; vain vaakasuuntainen)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Tarkkuuslähestyminen

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Rehellisyyshuomautus: MOPS käyttää pyöristettyä vaakasuuntaista vakiota <c1/>; tarkka kaksipuolinen normaalikvantiili <c2/> on <c3/>. Kshana käyttää koodissa julkaistua arvoa { "6.0" } ja johtaa arvon <c4/> samasta funktiosta <c5/>, jota RAIM-pino käyttää, ei-kehämäisenä ristiintarkistuksena (arvo pyöristyy MOPS:n arvoon { "5.33" }).

seg-ef191c1d3db1 = L1/L5-kaksitaajuinen ionosfäärivapaa yhdistelmä (IS-GPS-705)

seg-b69825ef05d3 = Arvoilla <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Ensimmäisen kertaluvun ionosfäärinen viive (<c1/>) kumoutuu täsmälleen — varmennettu moottorin riippumatonta fysiikkaa <c2/> vastaan usealle TEC-arvolle (elektronien kokonaissisältö). Kohinan vahvistus yhtä suurille varianssisyötteille on <c3/>.

seg-e111fb05a7c6 = <b>Repossa, automatisoitu</b> (jokainen commit): K-kertoimet niiden jakaumamäärittelyjä vastaan, <c1/> ja ionosfäärivapaat (IF) kertoimet IS-GPS-705 (IS: Interface Specification) -taajuuksia vastaan, ensimmäisen kertaluvun ionosfäärin kumoutuminen riippumatonta viivefysiikkaa vastaan sekä painotetun pienimmän neliösumman (WLS) suojaustasot numpy-vertailugeometriaa <c2/> vastaan (<c3/>).

seg-f30d84abe275 = <b>Ulkoinen oraakkeli, automatisoitu</b> (<c1/>): kunkin satelliitin korkeuskulman, atsimuutin ja kokonais-1-σ:n perusteella <c2/> toistaa riippumattoman toteutuksen HPL:n, <c3/> RTKLIB:n (avoimen lähdekoodin reaaliaikainen kinemaattinen paikannuskirjasto) SBAS-suojaustasohaarukassa <c4/> (Siki & Takács { "2017" }), kuudella epookilla, jotka tämä työkalu laski <b>todellisista EGNOS-lähetysviesteistä (European Geostationary Navigation Overlay Service)</b> (geostationaarinen PRN (pseudosatunnaiskoodin numero) { "120" }) ja todellisista RINEX (Receiver Independent Exchange Format) -havainnoista BUTE-asemalta Budapestista (2017-02-19), tarkkuudella <b>< { "2e-3" } m</b>. Oraakkeli pyöristää K_V:n arvoon { "5.33" }, joten pystysuuntaa verrataan K-kertoimettomana vertaamalla arvoa <c5/> arvoon VPL / { "5.33" }. ESA:n (European Space Agency) gLAB { "v6.0.0" } (<c6/>) käyttää samaa kaavaa.

seg-389e8a57e3e8 = <b>Ei tehty</b>: satelliittikohtainen σ on oraakkelin oma; σ:n mallintaminen raaoista UDRE/GIVE-viesteistä on soveltamisalan ulkopuolella, eikä yhtään virallista julkaistua suojaustasotuotetta, WAAS (Wide Area Augmentation System) tai EGNOS, ole toistettu päästä päähän. DO-229E/DO-316 itse ovat RTCA:n maksumuurin takana; avoin johtolähde on ESA Navipedian ICAO/EGNOS (ICAO: International Civil Aviation Organization) SBAS-sivut.

seg-7686fb3d3e0c = <s1>Edellinen</s1>ARAIM-viite

seg-0457ef382fb0 = <s1>Seuraava</s1>Kestävyyden ristiinviittaus
