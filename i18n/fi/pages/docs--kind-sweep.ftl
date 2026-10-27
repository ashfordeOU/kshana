# docs--kind-sweep: translations (fi)

seg-4636d450ef60 = <b>MODELLED</b> Yksi ajo ottaa yhteysaikataulun (luettelo aos_s/los_s-ikkunoista, joista kukin pyytää apertuuria navigointiin tai viestintään — sama ikkunasanasto, jonka <c1/> tuottaa, muunnettuna funktiolla <c2/>), apert

seg-fa3ad6babe54 = <b>MODELLED</b> Lajin <c1/> pyyhkäisy (yhdestä kolmeen pisteillä erotettua avainta mitä tahansa lajia, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti joukko jokaisessa solmussa) ja osio monte_carlo. Oraakkeli (InternalConsistency): Vaihesatunnaiskävelyn suljettu muoto valkoisessa taajuuskohinassa, varianssi q_wf tau (NIST Technical Note { "1337" }), tilastokoneistolle, ja tavutason yhtäläisyys erillisten ajojen kanssa siementämiselle. Se tarkistaa joukkolaskennan moottorin omalla kellomallilla, ei ulkoista aineistoa

seg-d1c11e493795 = Parametripyyhkäisyt ja siemenluvulla alustetut Monte Carlo -joukot minkä tahansa skenaariolajin yli ovat MODELLED, eivät validoituja: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-a8d92406e428 = Strontiumin optinen hilakello, avaruuteen suunnattu tavoite sigma_y

seg-5278ccdaf16f = <b>MODELLED</b> Suljetun muodon ajelehtimisvirheen kasvu + holdover kynnykseen; kvanttikelloluokat. Oraakkeli (ReferenceImpl): Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva ajelehtimisvarianssin ja holdover-inversion ydin on validoitu ulkoisesti scipy-kirjastoa vastaan (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punakohinalattian holdover-luvut pysyvät MODELLED

seg-e12f672ae71d = Kellon holdover GNSS:n ollessa estetty on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-ee7dd15019d0 = Aihesivu: <a1>CAMPAIGNS.md</a1>

seg-0aae0574c5e6 = <b>MODELLED</b> Tyypin <c1/> saatavuuspyyhkäisyt: tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja yhdistettynä (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi ja vähintään neljä signaalia, sekä pisin katko, pallolla olevalle käyttäjälle

seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep.md
seg-de72ae48731d = Lähde: <c1/>

# text
# c1: sweep
seg-81c2da4650c9 = <c1/> (skenaariolaji)

# text
seg-e7ab7b55c969 = 1-ulotteinen vaihtoehtovertailun pyyhkäisy kellopaketin parametrin yli.

# text
# c1: scenarios/sweep-clock-stability.toml
seg-0412c0dbfb75 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: sweep holdover_s over classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } pts, log scale) | quantum 6600.000->{ "6600.000" } | classical 2610.000->{ "250.000" }

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
seg-d2a441254bcd = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scale
seg-2b8d8159bdaf = Valinnaiset kentät: <c1/>

# text
# c1: scenarios/sweep-clock-stability.toml
seg-73c2e732b0c1 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-f8a627a78bdb = Datasheet (Microchip SA.45s CSAC) sigma_y(1s)={ "3e-10" }; q_wf on s

# attr:alt
seg-c784b8f22f12 = Moottorin kirjoittama kaavio skenaariolle scenarios/sweep-clock-stability.toml, laji sweep

# text
# c1: campaign
seg-cb00aca0268d = <b>MODELLED</b> Lajin <c1/> sweep-osio (yhdestä kolmeen pisteytettyä avainta mitä tahansa lajia, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti joukko jokaisessa solmussa) ja monte_carlo-osiot: realisaatio k ajetaan arvolla base_seed + k; jokainen metriikka raportoi keskiarvon, keskihajonnan d Testit: <a1>campaign_composition_reference.rs</a1>.

# text
seg-1750fbfc4a99 = <s1>Edellinen</s1>sweep-nd

# text
seg-de5468ac32fc = <s1>Seuraava</s1>telecom-timing
