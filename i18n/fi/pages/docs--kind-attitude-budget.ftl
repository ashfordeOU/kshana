# docs--kind-attitude-budget: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-40ca4197150b = Lähde: <c1/>

seg-a271f371a3cf = <c1/> (skenaariolaji)

seg-62c0dda9fc56 = 3-DOF-asento- ja osoitusvirhebudjetti: pahimman tapauksen gravitaatiogradienttihäiriömomentti ((3/2)(μ/R³)ΔI) ja osoitusvirheen neliösumman juuren budjetti nimettyjen 1σ-osatekijöiden yli (anturikohina, reaktiopyörän jitter, lämpö, linjaus) hallitsevan termin kanssa, kiertoratakorkeudelle ja rungon hitausmomenttien hajonnalle. MODELLED skalaarinen AOCS-budjetti — laitteistoa edeltävä täydennys Basiliskille/42:lle, ei säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio.

seg-9fdc45a8aaa3 = Yksi ajo tiedostosta <c1/> tiivistyy näin: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG-momentti { "7.04e-5" } N·m; osoitus { "10.7" }" RSS (hallitseva: reaction_wheel_jitter) (MODELLED skalaaribudjetti)

seg-7cf112b1bcc3 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Esimerkki <c1/> asettaa muun muassa:

seg-c33e3cbba749 = kaarisekuntia

seg-36df1bc710ab = linjaus

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Tulosnimike (moottorin oma): MODELLED — skalaarinen 3-DOF-AOCS-virhebudjetti: gravitaatiogradientin pahimman tapauksen häiriömomentti + RSS-osoitusbudjetti; EI säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio (laitteistoa edeltävä täydennys Basiliskille/42:lle, ei korvaaja)

seg-ad0e72e3b688 = Moottorin kirjoittama kaavio skenaariolle scenarios/attitude-budget.toml, laji attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Gravitaatiogradientin pahimman tapauksen häiriömomentti ((3/2)(μ/R³)ΔI) huippuarvona asennon yli (validoitu väite) sekä RSS-osoitusvirhebudjetti nimettyjen 1σ-osatekijöiden yli hallitsevan termin kanssa (kutsujan antamien lukujen neliösumma Testit: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Gravitaatiogradientin pahimman tapauksen häiriömomentti ((3/2)(μ/R³)ΔI) huippuarvona asennon yli (validoitu väite) sekä RSS-osoitusvirhebudjetti nimettyjen 1σ . Oraakkeli (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), riippumaton C++-toteutus täyden tensorin gravitaatiogradienttimomentista: Kshanan huippu (3/2)(μ/R³)ΔI on yhtä suuri kuin Basiliskin momentti { "45" } deg:n asennossa { "1e-12" } suhteellisella tarkkuudella (pahin { "2.1e-15" }) { "5" } korkeudella ja { "8" } hitaustensorilla, ja rajaa Basiliskin momentin ylhäältä { "2000" } satunnaisella asennolla tapausta kohden; toleranssi kiinnitetty ennen vertailua. Validoitu väite: painovoima

seg-d2a6cf813e95 = <b>PARTNER</b> Ei tarjota — Kshana on navigoinnin suorituskykysimulaattori, ei satelliittialustatalo. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-3895121a5466 = MODELLED — skalaarinen 3-DOF-AOCS-virhebudjetti: gravitaatiogradientin pahimman tapauksen häiriömomentti + RSS-osoitusbudjetti; EI säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio (laitteistoa edeltävä täydennys Basiliskille/42:lle, ei korvaaja) (tulos <c1/>)

seg-f62458cae23b = MODELLED skalaarinen AOCS-budjetti — laitteistoa edeltävä täydennys Basiliskille/42:lle, ei säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio. (lajiluettelo (<c1/>))

seg-333fca11ac0c = REHELLINEN RAJAUS: MODELLED skalaarinen virhebudjetti -- laitteistoa edeltävä täydennys Basiliskille/42:lle, EI säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio. Gravitaatiogradienttitermi raportoidaan momenttina (sen muuttaminen osoitukseksi vaatii säätöjäykkyyden, jonka kutsuja omistaa); budjetti on annettujen 1-sigma-osatekijöiden neliösumma. Ajo: kshana scenarios/attitude-budget.toml (skenaariotiedoston kommentti, rivit { "8" }–{ "13" })

seg-0e27fcef1499 = <s1>Edellinen</s1>ascent-losses

seg-946c453cbf0f = <s1>Seuraava</s1>body-pnt

seg-a349aa76b0ed = PARTNER
