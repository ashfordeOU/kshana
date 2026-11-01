# docs--kind-moonlight-service-volume: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-8f8871ac8a0f = Aihesivu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Aihesivu: <a1>integrations.md</a1>

seg-eb9f9a422d38 = Lähde: <c1/>

seg-f8988314faf2 = <c1/> (skenaariotyyppi)

seg-28c6a5644152 = Mallinnettu kuun navigointipalvelun peittoalueen analyysi ILLUSTRATIVE-tyyppisestä, julkisista lähteistä kootusta Moonlight/LCNS-luokan kuun kiertoradan satelliittitähdistöstä (ei yhteyttä ESA:an): pyyhkäisee selenografisen leveys-/pituusasteruudukon aikahorisontin yli ja raportoi DOP:n, kattavuuden ja saatavuuden (≥{ "4" } satelliittia JA PDOP < kynnys) sekä yleistetyn kuun ARAIM-suojaustason (HPL/VPL) verhokäyrän peittoalueen yli. DOP-geometria KÄYTTÄÄ UUDELLEEN gnss_lib_py-VALIDATED-ydintä (crate::orbit::dop); suojaustaso KÄYTTÄÄ UUDELLEEN LunaNet LNIS -kuun ARAIM-koneistoa (crate::lunar, σ_URE≈{ "30" } m) ja supistuu olemassa olevaksi etelänavan PL:ksi erikoistapauksena. MODELLED-yhdistelmä: ympyrä-/ellipsi-Kepler-relejoukko (ei todellinen differentiaalikorjattu LCNS/NRHO-efemeridi), keskimääräisesti pyörivä Kuu (ei libraatiota eikä prekessoivaa napaa). Deterministinen (puhdas geometria). Ei TRL-, perintö- eikä virastohyväksyntää.

seg-8516d1ded5dd = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: moonlight-service-volume | { "8" } satelliittia (havainnollistava LCNS-luokka, ei yhteyttä) | { "24" } pistettä × { "12" } epookkia | kattavuus { "37.8" }% (PDOP<{ "6.0" }) | satelliitteja { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL-saatavuus { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Esimerkki <c1/> asettaa muun muassa:

seg-edb738273a3a = Moottorin kirjoittama kaavio skenaariolle scenarios/moonlight-service-volume.toml, tyyppi moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> Moonlight-luokan kuun DOP / kattavuus / saatavuus + yleistetyt kuun ARAIM-suojaustasot peittoalueen yli. Oraakkeli (ExternalDataset): Riippumaton kolmannen osapuolen auktoriteetti ANISE { "0.10.2" } astro::Orbit -Kepler-propagaattori (Nyx Space, MPL-2.0) — ekvinoktiaalinen kahden kappaleen koodipolku, joka eroaa kshanan Newton–Raphson-Keplerista; satelliittikohtainen MCI-paikka täsmää tarkkuuteen <{ "1e-3" } m ja johdettu näkyvien satelliittien lukumäärä/joukko täsmää täsmälleen jokaisessa ruudukkopisteessä. DOP-ydin on gnss_lib_py-validoitu; eheys käyttää julkaistuja LunaNet/LCNS-parametreja

seg-47f496c1d603 = <b>VALIDATED</b> Satelliittikohtaiset toposentriset katselukulmat (atsimuutti myötäpäivään pohjoisesta, korkeuskulma) ja vinoetäisyys nimetyllä selenografisella paikalla, kun satelliitti on paikan. Oraakkeli (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, ajettuna työkaluna hakemistosta xval/anise-service-geometry, binääri lunar-look-angles-xval, joka ei kutsu Kshana-koodia): ANISEn oma atsimuutti-, korkeuskulma- ja etäisyysrutiini (azimuth_elevation_range_sez) paikoista, jotka on rakennettu sen leveys-pituus-korkeus-konstruktorilla pck00011-Kuulle (pallo { "1737.4" } km), satelliitit kierrettyinä koordinaatistoon MOON_PA_DE440 tiedoston moon_pa_de440_200625.bpc kautta. { "768" } näytettä

seg-1f12671176ad = MODELLED-yhdistelmä: ympyrä-/ellipsi-Kepler-relejoukko (ei todellinen differentiaalikorjattu LCNS/NRHO-efemeridi), keskimääräisesti pyörivä Kuu (ei libraatiota eikä prekessoivaa napaa). (tyyppiluettelo (<c1/>))

seg-2ff91fe31123 = REHELLISYYS: MODELLED-yhdistelmä. DOP-geometria on validoitu validoidun ytimen UUDELLEENKÄYTÖLLÄ; kattavuus-/saatavuus-/eheysyhdistelmä on MODELLED — ympyrä-/ellipsi-Kepler-relejoukko (ei differentiaalikorjattu LCNS / { "9" }:{ "2" } NRHO-efemeridi), keskimääräisesti pyörivä Kuu (ei fysikaalista libraatiota / prekessoivaa napaa) ja julkaistut LunaNet LNIS -eheysparametrit. Tämä havainnollistaa kuun palvelun peittoalueen M (skenaariotiedoston kommentti, rivit { "27" } - { "32" })

seg-f3279128de3b = <s1>Edellinen</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Seuraava</s1>ntn-positioning

seg-e66e2ca31e54 = Aihesivu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> Laji ja vaihe <c1/>: releiden saatavuus ja PDOP, Maan ja Auringon näkyvyys sekä kuriin saatettu pinnan kello kullekin kohteelle ja vuodenajalle, lajin <c2/> maastotaivaanrantaviivalla; yhden kohteen ajo on bitilleen sama kuin sen lajin

seg-6730fa1b9820 = <s1>Edellinen</s1>mission-thread
