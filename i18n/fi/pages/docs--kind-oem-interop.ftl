# docs--kind-oem-interop: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-4abcbdaddcf8 = Lähde: <c1/>

seg-a92dcafd670e = <c1/> (skenaariotyyppi)

seg-dbffff25b57f = CCSDS OEM -yhteentoimivuussilta: tuo ulkoisen lentodynamiikkatyökalun tuottama Orbit Ephemeris Message (GMAT/Orekit/STK tuottavat kaikki OEM:n) ja raportoi sen segmentit/kohteet/koordinaatistot/epookkivälin sekä nopeuden johdonmukaisuustarkistuksen; ilman syötettä se kiertää generoidun viiteradan edestakaisin ja raportoi tuonnin↔viennin tarkkuuden. MODELLED rakenteellinen/fysikaalinen sisäänottotarkistus, EI lähteen radan tarkkuuden validointi.

seg-21eb1c9d7571 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: oem-interop: edestakaisin kierretty { "2" } segmenttiä, { "12" } tilaa; suurin edestakaisvirhe { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

seg-54c35d9fbfd9 = Valinnaiset kentät: <c1/>

seg-d4117f615cd8 = Esimerkki <c1/> asettaa muun muassa:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Tuloksen nimike (moottorin oma): MODELLED — CCSDS OEM -tuonti-/edestakaissilta (GMAT/Orekit/STK tuottavat OEM:n); rakenteellinen + fysikaalinen sisäänottotarkistus, EI lähteen radan tarkkuuden validointi

seg-5db5a7c812ca = Moottorin kirjoittama kaavio skenaariolle scenarios/oem-interop.toml, tyyppi oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM -tuoja (parse_oem), joka sietää COMMENT-rivit / ylimääräiset metatietoavainsanat / kovarianssilohkot ja on kirjoittajan täsmällinen käänteisfunktio; edestakaisuus + ulkoisen tiedoston sisäänotto nopeuden johdonmukaisuustarkistuksella. Testit: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM -tuoja (parse_oem), joka sietää COMMENT-rivit / ylimääräiset metatietoavainsanat / kovarianssilohkot ja on kirjoittajan täsmällinen käänteisfunktio; edestakaisuus + . Oraakkeli (ExternalDataset): Riippumaton kolmannen osapuolen CCSDS-502-jäsennin <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — erillinen koodikanta, joka dekoodaa kshanan tuottaman EME2000/UTC OEM:n tavu tavulta identtisesti ({ "24" } tilaa { "2" } testiaineistossa, paikka/nopeus Δ = { "0" }) ja jonka tiukka lukija vahvistaa metatietotunnisteet; kshanan jäsennin täsmää sen kanssa myös toimitetussa ulkoisessa OEM:ssä. Kaksi rehellistä yhteentoimivuushavaintoa (oem-kirjasto hylkää kshanan satelliittikohtaisen mu

seg-7ab6bb7a1b8a = MODELLED — CCSDS OEM -tuonti-/edestakaissilta (GMAT/Orekit/STK tuottavat OEM:n); rakenteellinen + fysikaalinen sisäänottotarkistus, EI lähteen radan tarkkuuden validointi (tulos <c1/>)

seg-343a56c07d02 = MODELLED rakenteellinen/fysikaalinen sisäänottotarkistus, EI lähteen radan tarkkuuden validointi. (tyyppiluettelo (<c1/>))

seg-44aba1ad1d37 = RAJAUS TOTUUDENMUKAISESTI: MODELLED rakenteellinen + fysikaalinen sisäänottotarkistus, EI lähdeefemeridin radan tarkkuuden validointi. Ajo: kshana scenarios/oem-interop.toml (skenaariotiedoston kommentti, rivit { "11" } - { "13" })

seg-833df8eedc34 = <s1>Edellinen</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Seuraava</s1>optical-atmosphere
