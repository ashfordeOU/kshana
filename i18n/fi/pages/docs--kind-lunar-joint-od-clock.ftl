# docs--kind-lunar-joint-od-clock: translations (fi)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-593938ee5995 = Lähde: <c1/>

seg-d54a85227f43 = <c1/> (skenaariotyyppi)

seg-200e58e189c2 = Mallinnettu usean tekniikan yhteinen kuun radanmääritys ja kellojen eräestimaattori SIMULOIDUSSA verkossa: Gauss-Newton-hetkikuvasovitus, joka yhdistää Maa-peruslinjan geodeettiset VLBI-viiveet, kuun paikalliset aseman↔satelliitin etäisyydet ja satelliittien väliset etäisyydet ja palauttaa yhdessä kuun pinta-aseman 3D-paikan, pienen tähdistön paikat ja jokaisen laitteen kellon poikkeaman syötetystä todellisesta tilasta. Keskeinen rehellinen tulos — VLBI tekee aseman täyden 3D-paikan havaittavaksi, kun taas pelkkä kuun paikallinen etäisyydenmittaus jättää heikosti havaittavan suunnan — raportoidaan aseman virheen vertailuna VLBI:n kanssa ja ilman sitä. MODELLED simuloitu suljetun silmukan palautus (tosi tila jakaa havaintomallin), deterministinen (siemenluku), EI validoitu todellisella datalla; ei voimamallin etenemistä ratkaisijan sisällä; ei TRL-, perintö- eikä virastohyväksyntää.

seg-6419390eeae4 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-joint-od-clock | { "3" } satelliittia, { "6" } Maa-asemaa | aseman 3D-virhe VLBI:n kanssa { "3.54" } m vs. pelkät etäisyydet { "2184.02" } m ({ "617.5" }× terävämpi) | satelliitin paikan RMS { "2.20" } m | aseman kellovirhe { "2.87e-10" } s | havaintoja 40 / 16 parametria

seg-be3bcad756cc = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Esimerkki <c1/> asettaa muun muassa:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-joint-od-clock.toml, tyyppi lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> VLBI:n, kuun paikallisen etäisyyden ja satelliittien välisen etäisyyden eräyhdistäminen aseman ja tähdistön paikkojen ja kellojen palauttamiseksi. Oraakkeli (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq LAPACK gelsd:llä, numpy.linalg.inv; BSD-3) laskee uudelleen jokaisen Gauss-Newton-askelen, suppenneen painotetun pienimmän neliösumman ratkaisun, muodolliset sigmat ja aseman virheen kuuden simuloidun verkon sidotuilla jakobiaaneilla ja havainnoilla, ennakkorekisteröitynä (5094bc31) suhteellisella toleranssilla max({ "1e-8" }, { "100" } kappa eps). Ensimmäinen ajo epäonnistui verkossa ilman VLBI:tä ({ "6.1e-7" } vs. { "1e-8" }, normaaliyhtälö

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisherin informaatio M=HᵀWH, Cramér–Rao-alaraja, havaittavuuden aste / datumvirheen nolla-avaruus (Moore–Penrosen pseudoinverssi) sekä D/A/E/T-optimaalinen koesuunnittelu. Oraakkeli (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-pohjainen) — riippumaton kolmannen osapuolen auktoriteetti, joka laskee samat yksikäsitteisesti määritellyt ominaisarvot, σ²(XᵀX)⁻¹ Cramér–Rao-kovarianssin ja GNSS:n DOP-kertoimet eri algoritmilla (LAPACK jaa-ja-hallitse + LU) kuin Kshanan syklinen Jacobi-pyyhkäisy ja spektraalinen pseudoinverssi; täsmäävät tarkkuuteen { "1e-9" }. Sama ulkoisen kirjaston luokka validoi jo D

seg-af12da412a10 = <b>MODELLED</b> Kuun yhteisratkaisun havaittavuus Fisherin informaatiolla: ilman Maa-peruslinjoja absoluuttisen koordinaatiston datum on matriisin HᵀWH nolla-avaruudessa (aseman paikka havaitsematon. Oraakkeli (InternalConsistency): Analyyttinen datumvirheen rakenne — havaitsematon absoluuttisen koordinaatiston moodi on Fisherin informaation nolla-avaruudessa (suljettu muoto), asteen kynnys vastaa julkaistua 3 aseman suunnittelun perustetta, ja estimaattori saavuttaa tuloksena olevan CRLB:n Monte Carlossa. Kuun geometria itsessään on edustava verkko (ei lennetty efemeridi), joten rivi pysyy tasolla MODELLED; taustalla oleva FIM/CRLB-moottori on tarkistettu

seg-865ba2668582 = MODELLED simuloitu suljetun silmukan palautus (tosi tila jakaa havaintomallin), deterministinen (siemenluku), EI validoitu todellisella datalla; ei voimamallin etenemistä ratkaisijan sisällä; ei TRL-, perintö- eikä virastohyväksyntää. (tyyppiluettelo (<c1/>))

seg-a0d4350a1c66 = Rehellisyys: MODELLED simuloitu suljetun silmukan palautus. Syötetty tosi tila kuvataan synteettisiksi havaintosuureiksi SAMALLA geometriamallilla, jonka ratkaisija kääntää, siemenluvulla tuotettu Gaussin kohina lisätään, ja estimaattori palauttaa syötetyn todellisen tilan kohinan rajoissa. Oraakkeli on sisäinen johdonmukaisuus (todellisen tilan palautus + NEES-kovarianssin realistisuus), EI validointi todellisella datalla. Ratkaisijan sisällä ei ole voimamallin etenemistä — satel (skenaariotiedoston kommentti, rivit { "24" } - { "29" })

seg-1465694e7e4f = Kuun absoluuttisen aseman havaittavuus (datumvirhe) on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Edellinen</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Seuraava</s1>lunar-llr-datum
