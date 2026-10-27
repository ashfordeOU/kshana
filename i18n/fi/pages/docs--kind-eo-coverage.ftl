# docs--kind-eo-coverage: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-98151954f217 = false

seg-8e62cc4af6ea = Aihesivu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Lähde: <c1/>

seg-d72c017ca1fa = <c1/> (skenaariotyyppi)

seg-47b4aea6ed01 = Maanhavaintokuorman jalanjälki ja kattavuusgeometria (SMAD:n avaruuskolmio): Maan kulmasäde, kaistan leveys, nadirin maanäytteen etäisyys (GSD), suurin nadirista poikkeava saavutettavuus, ympyräradan jaksonaika, J2-solmujakso ja päiväntasaajan maanpintajäljen väli yhtenäisen kattavuuden lipulla, kiertoradan korkeudelle, kaltevuudelle (oletuksena aurinkosynkroninen) ja anturin FOV/IFOV:lle. MODELLED pallomaisen Maan geometria (ei radiometriaa/MTF:ää/ilmakehää/osoitusvärinää/auringonpaistetta (glint)); solmuväli R_e·(ω − Ω̇)·T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla.

seg-105bb8a3c33f = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

seg-609c5b7bc6f1 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-834408a40783 = min

seg-ade2ba71a96c = Tulosmerkintä (moottorin oma): MODELLED — pallomaisen Maan avaruuskolmiogeometria; kaista/GSD/saavutettavuus ovat geometrisia (ei radiometriaa/MTF:ää/ilmakehää/osoitusvärinää/glintiä), maanpintajäljen väli on R_e·(ω − Ω̇)·T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla

seg-c2a8332f2ee2 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/eo-coverage.toml, skenaariotyyppi eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD:n avaruuskolmiogeometria: Maan kulmasäde, kaistan leveys, nadir-GSD, suurin nadirista poikkeava saavutettavuus ja ympyräradan jaksonaika, sekä ensimmäisen kertaluvun J2-solmujakso (eo_payload::j2_nodal_period) ja päiväntasaajan maanpintajäljen väli R_e (omega_ Testit: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD:n avaruuskolmiogeometria: Maan kulmasäde, kaistan leveys, nadir-GSD, suurin nadirista poikkeava saavutettavuus ja ympyräradan jaksonaika, sekä ensimmäisen kertaluvun J2-solmujakso (. Oraakkeli (ExternalDataset): Orekit { "12.2" } (Apache-2.0) ja GeographicLib { "2.1" } (MIT), kumpikin ajettuna erillisinä ohjelmina, ennakkorekisteröity (766823f3) ennen moottorimuutosta ja ennen mitään oraakkeliajoa: pallosuureet { "1e-9" } suhteellisen virheen sisällä (pahin: kulmasäde { "5.4e-16" }, kaista { "7.0e-13" }, saavutettavuus { "1.9e-14" }), jaksonaika { "1e-12" } ({ "1.6e-16" }), nadir-GSD { "1e-7" } ({ "2.9e-10" }), J2-solmujakso ja solmuväli { "0.1" } prosentin sisällä Orekit-kirjaston numeerisesta J2-propagoinnista solmuilmaisimella ({ "1" }

seg-45625167e59f = MODELLED — pallomaisen Maan avaruuskolmiogeometria; kaista/GSD/saavutettavuus ovat geometrisia (ei radiometriaa/MTF:ää/ilmakehää/osoitusvärinää/glintiä), maanpintajäljen väli on R_e·(ω − Ω̇)·T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla (tulos <c1/>)

seg-cf22f13c78d3 = MODELLED pallomaisen Maan geometria (ei radiometriaa/MTF:ää/ilmakehää/osoitusvärinää/glintiä); solmuväli R_e·(ω − Ω̇)·T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla. (tyyppiluettelo (<c1/>))

seg-153325fb00d3 = RAJAUS, REHELLISESTI: vain MODELLED pallomaisen Maan geometria -- ei radiometria- / MTF- / ilmakehä- / osoitusvärinä- / auringonpaistemallia (sun-glint). Maanpintajäljen väli on R_e*(omega - dOmega/dt)*T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla; kaltevuuden oletus on korkeudelle sopiva aurinkosynkroninen. Aja: kshana scenarios/eo-coverage.toml (skenaariotiedoston kommentti, rivit { "7" }–{ "11" })

seg-5dc02c3d10f7 = <s1>Edellinen</s1>entry-heating

seg-33f408d48d13 = <s1>Seuraava</s1>eo-radiometry
