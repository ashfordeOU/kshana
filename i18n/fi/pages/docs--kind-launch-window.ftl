# docs--kind-launch-window: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-b054c73f22e5 = ei arvoa

seg-8e62cc4af6ea = Aihesivu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Lähde: <c1/>

seg-e0990c5f14da = <c1/> (skenaariotyyppi)

seg-7a4e6215a488 = Kaksirunkoinen laukaisu- ja nousugeometria: laukaisuazimutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräratanopeus, Maan pyörimisen itään suuntautuva hyöty, dogleg-tasonmuutoksen Δv kun tavoiteinklinaatio on alle laukaisupaikan leveysasteen, sekä päivittäisten laukaisumahdollisuuksien lukumäärä. MODELLED pallomaisen Maan geometria (ei pyörivän Maan nopeuskolmion korjausta, ei nousu- tai vastushäviömallia).

seg-e24b0ae723c7 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Maan pyörimisen hyöty, { "2" } mahdollisuutta/vrk (MODELLED)

seg-6f955816b5c6 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-58d26f083b8f = Tuloksen nimike (moottorin oma): MODELLED — kaksirunkoinen pallomaisen Maan laukaisugeometria; azimut on geometrinen relaatio sin(Az)=cos(i)/cos(lat) (ei pyörivän Maan nopeuskolmion korjausta, ei nousu- tai vastushäviömallia)

seg-9696283a95ae = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/launch-window.toml, tyyppi launch-window

seg-38175030f689 = <b>MODELLED</b> Kaksirunkoiset laukaisuazimutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräratanopeus, Maan pyörimisen itään suuntautuva hyöty, dogleg-tasonmuutoksen Δv ja päivittäiset mahdollisuudet sekä, kun annetaan epookki ja IERS finals2000A -rivit, paikka

seg-53bc589c7ed6 = <b>MODELLED</b> Kaksirunkoiset laukaisuazimutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräratanopeus, Maan pyörimisen itään suuntautuva hyöty, dogleg-tasonmuutoksen Δv a. Oraakkeli (InternalConsistency): Suljetun muodon pallotrigonometrinen laukaisugeometria verrattuna julkaistuihin työstettyihin esimerkkeihin (Vallado, Fundamentals of Astrodynamics 4. painos, Algorithm { "37" } laukaisuazimutti + luku 6 tasonmuutos; tests/launch_window_ascent_geometry_reference.rs). Nämä käyttävät uudelleen samaa suljettua muotoa, jonka kshana toteuttaa (julkaistun arvon pariteetti- ja jäljennöstarkistus, InternalConsistency); MODELLED kaksirunkoinen, ei pyörivän Maan nopeuskolmiota / nousua / vastu

seg-12396619d3e5 = MODELLED — kaksirunkoinen pallomaisen Maan laukaisugeometria; azimut on geometrinen relaatio sin(Az)=cos(i)/cos(lat) (ei pyörivän Maan nopeuskolmion korjausta, ei nousu- tai vastushäviömallia) (tulos <c1/>)

seg-715f1856bd37 = MODELLED pallomaisen Maan geometria (ei pyörivän Maan nopeuskolmion korjausta, ei nousu- tai vastushäviömallia). (tyyppiluettelo (<c1/>))

seg-4e9a215e3918 = REHELLINEN RAJAUS: MODELLED. Vain geometrinen azimutti -- ei pyörivän Maan nopeuskolmion korjausta (hyöty raportoidaan erikseen sisällytettäväksi), ei nousuradan / vastushäviön / ohjausmallia. Pre-Phase-A-geometria. Aja: kshana scenarios/launch-window.toml (skenaariotiedoston kommentti, rivit { "8" }–{ "11" })

seg-12332d181de4 = Laukaisuikkunan ja nousugeometrian (tehtäväanalyysi) taso on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Edellinen</s1>jamming

seg-78411b85f301 = <s1>Seuraava</s1>leo-navmsg
