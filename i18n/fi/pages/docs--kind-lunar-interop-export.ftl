# docs--kind-lunar-interop-export: translations (fi)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Lähde: <c1/>

seg-fdf560e675f4 = <c1/> (skenaariotyyppi)

seg-5a4dcb93a643 = Mallinnettu Kuun yhteentoimivuusvienti: tuottaa Kuun koordinaatiston, Kuun aika-asteikon ja Kuun efemeridin LunaNet/IOAG-linjatuissa, CCSDS-pohjaisissa vaihtomuodoissa edestakaisella kierrolla / kenttien yhdenmukaisuudella. KÄYTTÄÄ UUDELLEEN paketin CCSDS OEM { "2.0" } -lähettäjää ja jäsennintä (crate::oem) Kuun kontekstiin uudelleenmerkittynä — OEM REF_FRAME kantaa IAU { "2015" } WGCCRE Kuun kappalekoordinaatiston (MOON_ME / MOON_PA), TIME_SYSTEM Kuun aika-asteikon (LTC / TCL / UTC), CENTER_NAME = MOON — havainnollistavan LCNS-luokan esimerkkiefemeridin yli (paikat crate::lunar_service:stä, nopeus äärellisellä differenssillä). Tuottaa myös LunaNet/IOAG-linjatun Kuun ajan kuvaajan (asteikon tunnus, sekulaarinen nopeus µs/päivä crate::lunar_time:stä, julkaistu kaista, vertailupinta), joka kiertää edestakaisin serde_json:in kautta, ja käärii artefaktit olemassa olevaan KIF-kirjekuoreen (crate::interchange) MODELLED-rehellisyysnimikkeellä. Raportoi tuotetut artefaktit, OEM-rivien lukumäärän, kenttien yhdenmukaisuuden läpäisyn + läsnä olevien/puuttuvien kenttien luettelon, OEM:n edestakaisen kierron onnistumisen, aikametatietojen edestakaisen kierron onnistumisen ja KIF:n tavukoon. MODELLED — deterministinen edestakainen kierto + kenttänimien yhdenmukaisuus julkaistua CCSDS OEM:iä + LunaNet/IOAG-kenttäsemantiikkaa vastaan on oraakkeli; EI ole sertifioitu yhteentoimivuuden yhdenmukaisuustesti; havainnollistava julkisiin lähteisiin perustuva efemeridi, ei yhteydessä ESA:an; ei TRL:ää/lentoperintöä/virastosuositusta.

seg-1726861e444f = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } tilaa, OEM { "23" } riviä | yhteensopivuus PASS ({ "9" } läsnä / { "0" } puuttuu) | OEM-edestakaismuunnos ok | aikametatiedon edestakaismuunnos ok | KIF { "1640" } tavua | MODELLED

seg-f8353e15aabd = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Esimerkki <c1/> asettaa muun muassa:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = oktetti

seg-0e86ff364c17 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-interop-export.toml, tyyppi lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> LunaNet/IOAG-linjainen kuun koordinaatiston, ajan ja efemeridin vienti (CCSDS OEM + KIF) edestakaisella yhteensopivuustarkistuksella. Oraakkeli (InternalConsistency): kshanan kuun OEM-vienti jäsennetään uudelleen riippumattomalla kolmannen osapuolen kirjastolla <c1/> (R. J. Anderson): koordinaatiston ja ajan tunnisteet sekä kunkin epookin tila täsmäävät kirjoitustarkkuuteen asti ({ "1" } mm / { "1e-9" } km/s), ja vienti, josta TIME_SYSTEM on jätetty pois, hylätään; tämä on rakenteellinen tiedonvaihdon edestakaistesti. Kuun koordinaatiston ja ajan fysikaalinen sisältö on validoitu omilla riveillään, joten tämä pysyy tasolla MODELLED. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): se

seg-c9a1d76625d6 = MODELLED (tulos <c1/>)

seg-633bcd62ce93 = Tuottaa myös LunaNet/IOAG-linjaisen kuun aikakuvaajan (aika-asteikon tunniste, maallinen nopeus µs/vrk crate::lunar_time-moduulista, julkaistu vaihteluväli, vertailupinta), joka kulkee edestakaisin serde_json-kirjaston kautta, ja käärii artefaktit olemassa olevaan KIF-kehykseen (crate::interchange) rehellisyysmerkinnällä MODELLED. (tyyppiluettelo (<c1/>))

seg-0e91697e3036 = MODELLED: determinististen edestakaismuunnosten ja kenttänimien yhteensopivuus julkaistuihin CCSDS OEM- ja LunaNet/IOAG-kenttämerkityksiin nähden on oraakkeli; EI ole sertifioitu yhteentoimivuuden yhteensopivuustesti; havainnollistava julkisista lähteistä koottu efemeridi, ei yhteyttä ESA:an; ei TRL-, perintö- eikä virastohyväksyntää. (tyyppiluettelo (<c1/>))

seg-11d0ccba5ee7 = MITÄ src/lunar_interop.rs tekee: * export_lunar_oem — KÄYTTÄÄ UUDELLEEN crate-kirjaston CCSDS OEM { "2.0" } -tuottajaa (crate::oem), uudelleenmerkittynä kuun yhteyteen: REF_FRAME = IAU { "2015" } WGCCRE -kuukappaleen koordinaatisto (MOON_ME / MOON_PA), TIME_SYSTEM = kuun aika-asteikko (LTC / TCL / UTC), CENTER_NAME = MOON, näyte-ILLUSTRATIVE LCNS-luokan efemeridin päällä (paikat crate::lunar_service-moduulista, nopeus keskeisellä differenssillä). * export_ (skenaariotiedoston kommentti, rivit { "6" } - { "19" })

seg-f730e8f789cf = REHELLISYYS: MODELLED. Kenttien NIMET ja yksiköt on linjattu PUBLIC-standardien kanssa (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } -kuukoordinaatistot, LunaNet Interoperability Specification / IOAG:n kuuarkkitehtuuri). Deterministinen edestakaismuunnos ja kenttänimien yhteensopivuus ovat oraakkeli. Tämä EI ole sertifioitu yhteentoimivuuden yhteensopivuustesti. Efemeridi on havainnollistava, julkisista lähteistä koottu, EI yhteyttä ESA:an, eikä se tarkoita mitään TRL-tasoa (skenaariotiedoston kommentti, rivit { "21" } - { "26" })

seg-254d48fe58a5 = Kuun yhteentoimivuusvienti on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Edellinen</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Seuraava</s1>lunar-jamming
