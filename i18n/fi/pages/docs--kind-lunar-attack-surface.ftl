# docs--kind-lunar-attack-surface: translations (fi)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrinen J/S-linkkibudjetti, häirinnänkestävä C/N₀, satelliittikohtainen lukituksen menetys. Oraakkeli (InternalConsistency): Häirinnänkestävän C/N₀:n linkkibudjettiyhtälö ristiintarkistettuna riippumatonta numpy-uudelleenjohtoa vastaan (jakaa saman suljetun muodon → InternalConsistency) sekä todellinen JammerTest-2024-C/N₀-heikkenemisen luonnehdinta. { "0.30" } kierros { "2" }, estetty (pysyy MODELLED): mitattua JammerTest { "2024" } C/N0-laskua ei ajettu linkkibudjettiennustetta vasten (ennakkorekisteröity 6a66994b, { "3" } dB:n sisällä), koska F8.1-antennin paikka ja suuntaus

seg-143f3f1cc521 = GNSS-estetyn ympäristön häirintäkestävyys (jamming) on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Lähde: <c1/>

seg-9c0b5e933472 = <c1/> (skenaariotyyppi)

seg-004c56ded47f = Kuun pinnan navigoinnin signaaliturvallisuuden hyökkäyspinta (P1): kokoaa avoimet signaaliturvallisuusanalyysit yhdeksi binäärillä tavoitettavaksi ajoksi. Raportoi ({ "1" }) AFS:n vastaanotetun tehon ja sen tehon YLIJÄÄMÄN maanpäällistä GPS-vertailua vastaan sekä 12-18 dB:n herkkyyskaistan aitona monen akselin pyyhkäisynä linkin syötteiden yli (vertailutaso x EIRP x vinoetäisyys) 25x-pyöristetyn / 28x-pyöristämättömän lineaarisen kertoimen täsmäytyksellä. KORJATTU (sääntö R4): tämä raportoi { "15.6" } dB:n tehon ALIJÄÄMÄN ja kertoimen 32x/36x, kunnes GPS-vertailu korjattiin arvoista -125 / -128.5 (jotka ovat dBm-lukuja) arvoihin -155 / -158.5 dBW, ICD-GPS-200-arvot, jotka häirintämoduuli on aina kantanut. Etumerkki kääntyy: mallinnettu Kuun AFS-signaali on { "14.4" } dB VAHVEMPI kuin maanpäällinen GPS L1 C/A, ei heikompi. Vastaanotettu teho itse ei liikahtanut bittiäkään, ja lineaarinen kerroin on vanha jaettuna täsmälleen luvulla { "1000" }, joka on täsmälleen { "30" } dB:n dBm–dBW-siirtymä; ({ "2" }) vaadittu hyökkääjän lähetysteho harhauttamiseen (J/S = { "3" } dB) ja kieltoon (J/S = { "30" } dB) kullakin etäisyydellä, J/S-linkin käänteisfunktio; ({ "3" }) kiertoradalta tapahtuvan kaappauksen jalanjälki todellisella tasaisen aukon antennikuviolla (Airy [{ "2" } J1(x)/x]^{ "2" }), korkeusrajoitettu puolipallon alapuolinen kalotti, jonka reunaa EI kaapata; ({ "4" }) laskettu seurantasilmukan harhautuksen kaappauksen sisäänvetotulos (vetääkö vastaavan koodin harhauttaja tietyllä tehoedulla ja koodisiirtymällä todella DLL/PLL:ää) väitetyn { "3" } dB:n kynnyksen sijaan; ({ "5" }) ilmattoman kappaleen geometrinen horisonttiulottuvuus korotetulle pintalähettimelle; ja ({ "6" }) OSNMA/TESLA-todennusbudjetti ({ "20" } bit/s lisäkuorma = ~{ "40" } % { "50" } bit/s AFS-navigointiviestistä, avaimen julkistamisen viive, { "2" }^-40 väärennös). Tyhjä runko toistaa P1-lähtötason; jokaisella syötteellä on oletus ja se voidaan ohittaa. VALIDATED osatulokset kantavat lähdemoduulinsa oraakkelin (suljetun muodon dB-radiometria; käänteinen J/S-kierros; Airy-kuvio vs A&S Bessel ja pallokalotin geometria; DLL/PLL-sisäänveto vs Kaplan & Hegarty; pallotangentin horisonttiidentiteetti vs eo_payload; OSNMA SIS-ICD -kenttien mitoitus). MODELLED: edustavat geometria- ja tehosuuruudet sekä kaappauskartan tietyt solujen arvot. Ei ole sertifioitu turvallisuustuote.

seg-e5edd5b9ef27 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-attack-surface | AFS -140.6 dBW, ylijäämä { "14.4" } dB (kaista -17.9–-12.0, { "25" }×/28× ylijäämä) | harhautus@{ "1000" } m { "0.000" } W | jalanjälki { "3" }% kalotti, reuna false | harhautuksen kaappaus true (lukitus { "0.00" } s) | mastoulottuvuus { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% arvosta { "50" } bit/s), { "30" } s viive | jalanjäljen pyyhkäisy 7x5 (kork 20-500 km x HPBW 1.83-29.20 deg), kaappaus 0.6-42.9% | reunaa EI tavoitettu tässä ruudukossa (paras -0.8 dB, { "3.8" } dB vajaa; tarvitsee { "19.8" } dBW vs { "16.0" } dBW)

seg-781a7094b955 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-6ea8f1132b57 = linear

seg-8b701f465117 = log

seg-de295af20c55 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-attack-surface.toml, tyyppi lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Kaksiakselinen pyyhkäisy kuviopainotetulle, korkeusrajoitetulle pinnan kaappauksen jalanjäljelle lähettimen korkeuden ja lautasen halkaisijan yli, yksi rivi toimintapistettä kohden. Oraakkeli (InternalConsistency): Joukkoon sisältyminen: häirintä–signaali-suhde tulee mukaan tasaisena desibelisiirtymänä, joten suuremman lähetystehon kaapattu joukko sisältää pienemmän tehon joukon ja osuus voi vain kasvaa -- ominaisuus, jota Airy-kuvio EI anna keilanleveyden tai korkeuden suhteen, jossa kaapattu alue hajoaa renkaiksi ja osuus on aidosti ei-monotoninen. Mikään julkaistu taulukko ei anna Kuun kiertoradalla olevan lähettimen kaapatun kiekon osuutta

seg-d11486381332 = MODELLED: edustavat geometria- ja tehosuuruudet sekä kaappauskartan tietyt solujen arvot. (tyyppiluettelo (<c1/>))

seg-95be70748647 = Kaappauksen jalanjälki korkeuden ja keilanleveyden funktiona on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Edellinen</s1>link-budget

seg-4b0efe4b9b85 = <s1>Seuraava</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Edellinen</s1>lunar-ascent
