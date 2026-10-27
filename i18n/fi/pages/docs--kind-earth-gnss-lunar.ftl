# docs--kind-earth-gnss-lunar: translations (fi)

seg-37d29d8303fe = km

seg-b054c73f22e5 = ei arvoa

seg-59afd80736c5 = <b>PARTNER</b> Ei tarjota — Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-9a399fed06c4 = Lähde: <c1/>

seg-886b3796afaa = <c1/> (skenaariotyyppi)

seg-c8a8be4b8894 = Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka konfliktinkestävyyspaperi nimeää ja jolle moottorilla ei ollut mallia. GNSS-satelliitti suuntaa antenninsa Maahan; Kuun lähellä oleva vastaanotin on noin viisitoista kertaa kiertoradan säteen päässä, joten kolme asiaa vaikuttaa yhtä aikaa. Maa PEITTÄÄ ANTENNIN AKSELIN: etäisyydeltä { "26,560" } km se kattaa { "13.9" } asteen puolikulman, joten jokaisen Kuuhun suuntautuvan säteen on lähdettävä lähettimestä vähintään näin kaukana nadirista, mikä poistaa keilan huipun ennen kuin mitään tehoa on laskettu. Jäljelle jää PÄÄKEILAN REUNA JA SIVUKEILAT, se alue, jolla LuGRE-hyötykuorma todella toimi vuonna { "2025" }. Ja vapaan tilan vaimennus on noin { "208" } dB L1-taajuudella, noin { "25" } dB enemmän kuin maanpäällinen käyttäjä maksaa. Raportti antaa yhden rivin satelliittia kohti (akselipoikkeama, Maan peitto, etäisyys, reittivaimennus, lähetinvahvistus kyseisessä kulmassa, vastaanotettu teho, kantoaalto-kohinatiheys-suhde) ja kokoaa yhteen vain seurantakynnyksen ylittävät linkit. SE RAPORTOI MYÖS EHDOLLISUUDEN, koska se määrittää tämän kerroksen: jokainen näkyvä satelliitti on Kuusta nähtynä muutaman asteen levyisen kartion sisällä, joten näkölinjat ovat lähes yhdensuuntaiset, tarkkuuden heikkenemiskerroin on valtava, ja Maan GNSS:n paikannus Kuun etäisyydellä on paljon enemmän AJOITUSluokan havainto kuin paikkaluokan. MODELLED, ja syynä on lähetyskuvio: vahvistus kulman funktiona on tasaisesti valaistu pyöreä apertuuri (Airy), kun taas todellinen GPS L1 -antenni on kaksitoistaelementtinen kierukkaryhmä, jolla on muotoiltu pääkeila ja ei-Airy-sivukeilat. Mitattuja kuvioita on olemassa, eikä niitä ole sisällytetty tähän, joten järjestykset ja suuruusluokat ovat merkityksellisiä mutta yksittäisen satelliitin dB-arvo ei. Tarkoituksella PUUTTUVAT, kukin tekee budjetista optimistisen: ei ionosfääri- tai troposfäärivaimennusta Maan reunaa hipoville säteille, ei polarisaatio-, osoitus- tai toteutushäviötä ja pallomainen Maa ilman refraktiivista laajennusta. Kuun paikka on SYÖTE (etäisyys sekä inertiasuunta) efemeridihaun sijaan, koska testattava suure on linkki ja keilageometria. Rivin nostaminen validoiduksi vaatii mitatun lähetyskuvion ja LuGRE:n normaalipisteet; kumpaakaan ei ole repositoriossa eikä kumpaakaan ole keksitty tässä.

seg-75b6814c0091 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: Earth-GNSS at lunar distance — { "24" } satellites, receiver at { "384400" } km Earth limb from the constellation: { "13.90" } deg off nadir — any lunar-bound ray must exceed this { "22" } of { "24" } not occulted; { "0" } clear the { "25.0" } dB-Hz tracking threshold no link reaches the threshold fewer than two trackable links; no angular spread to report fewer than four trackable links, or a singular geometry: no DOP SWEEP over { "64" } epochs / { "43082" } s: signal availability { "0.375" }, FIX availability { "0.000" } trackable links mean { "0.75" }, max { "2" }; best C/N0 { "30.93" } dB-Hz; best PDOP none Take the FIX availability as this layer's prior, not the signal availability: one link is a clock observation, four are a position. MODELLED: the transmit gain is a uniform-aperture (Airy) stand-in, not a measured GPS beam, and no atmospheric, polarisation or implementation loss is applied — so the budget here is optimistic. Orders of magnitude and orderings are meaningful; an individual satellite's dB is not.

seg-6c0897da2efa = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/earth-gnss-lunar.toml, skenaariotyyppi earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka P7 taulukko { "1" } nimeää ja jolle moottorilla ei ollut mallia.

seg-9531f6b14fc8 = <b>MODELLED</b> Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka P7 taulukko { "1" } nimeää ja jolle moottorilla ei ollut mallia. Satelliittia ja epookkia kohti se laskee akselipoikkeaman. Oraakkeli (InternalConsistency): Suljetun muodon identiteetit ja sisäinen johdonmukaisuus; ULKOISTA oraakkelia EI väitetä. Reunan puolikulma tarkistetaan lauseketta asin(R_earth/r_orbit) vasten ja geometria sitä vasten; vapaan tilan vaimennus, DOP-ydin ja SGP4-propagointi, jotka tämä koostaa, on kukin validoitu ulkoisesti omilla riveillään, eikä tämä rivi lainaa niiden tasoa. MIKSI MODELLED, ja syynä on lähetyskuvio: vahvistus kulman funktiona on tasaisesti valaistu

seg-6dfc5503f58f = MODELLED, ja syynä on lähetyskuvio: vahvistus kulman funktiona on tasaisesti valaistu pyöreä apertuuri (Airy), kun taas todellinen GPS L1 -antenni on kaksitoistaelementtinen kierukkaryhmä, jolla on muotoiltu pääkeila ja ei-Airy-sivukeilat. (tyyppiluettelo (<c1/>))

seg-c40d3fd8c12e = MIKÄ ON MODELLED JA MIKSI SE EI OLE VALIDATED Vahvistus kulman funktiona on tasaisesti valaistu pyöreä apertuuri — Airy-kuvio. Todellinen GPS L1 -antenni on kaksitoistaelementtinen kierukkaryhmä, jonka mitatussa kuviossa on muotoiltu pääkeila, tarkoituksella akselin ulkopuolelle huipattu tehon tasaamiseksi Maan kiekolla, ja sivukeilat, jotka eivät ole lainkaan Airy-muotoisia. Mitattuja kuvioita on julkaistu; niitä ei ole sisällytetty tähän re (skenaariotiedoston kommentti, rivit { "29" }–{ "35" })

seg-01fa469abd95 = Maan GNSS Kuun etäisyydellä on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Edellinen</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Seuraava</s1>entry-heating
