# docs--kind-lunar-differential-pnt: translations (fi)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-549a6103e711 = bitti

seg-d0c9bec248b4 = Lähde: <c1/>

seg-d226df2bb634 = <c1/> (skenaariotyyppi)

seg-8ac5ac006ae7 = Mallinnettu Kuun DIFFERENTIAALI-PNT (Kuun DGNSS/SBAS-vastine): NovaMoon-luokan vertailuasema TUNNETUSSA selenografisessa paikassa laskee satelliittikohtaiset differentiaalikorjaukset ILLUSTRATIVE (havainnollistavasta), julkisiin lähteisiin perustuvasta Moonlight/LCNS-luokan tähdistöstä (NovaMoon mainitaan vain järjestelmän LUOKKANA, ei yhteydessä ESA:an), ja käyttäjä, joka on siirretty arvolla baseline_km, soveltaa niitä niin, että YHTEISMOODIN rata- ja kellovirheet kumoutuvat. Kellotermi kumoutuu TÄSMÄLLEEN (algebrallinen identiteetti); ratatermistä jää vain näköyhteyserotuksen projektio, joka → { "0" }, kun baseline → { "0" } (spatiaalisen dekorrelaation lattia) ja kasvaa ≈ lineaarisesti baseline-arvon mukana. Raportoi käyttäjän 3D-paikkavirheen korjauksilla VS ILMAN korjauksia, pienenemiskertoimen, virhe–baseline-käyrän sekä käyttäjän suojaustason, joka KÄYTTÄÄ UUDELLEEN DO-229E SBAS -koneistoa (crate::sbas) differentiaalijäännöksen σ:lla. MODELLED — täsmällinen kumoutumisidentiteetti + ensimmäisen kertaluvun dekorrelaatiomalli; ei validoitu oikealla datalla; ei TRL:ää/lentoperintöä/virastosuositusta. Deterministinen, jos siemenluku annetaan.

seg-4b7355b174a3 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-differential-pnt | { "8" } satelliittia (havainnollistava LCNS-luokka, ei yhteydessä) | baseline { "50" } km | käyttäjän virhe { "24.46" } m → { "0.0077" } m ({ "3186" }× pieneneminen) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-8e67df89448a = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-differential-pnt.toml, tyyppi lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> NovaMoon-luokan differentiaalinen vertailuasema: yhteismoodin kumoutuminen + baselinen mukana kasvava jäännös + DGNSS-suojaustasot. Oraakkeli (InternalConsistency): Differentiaalisen virheen kumoutumisidentiteetti + DO-229E SBAS -suojaustasokoneiston uudelleenkäyttö; yksittäisdifferenssi + WLS-ratkaisu tarkistetaan lisäksi ristiin RTKLIB:n lsq()/matinv()-funktioita vastaan (Takasu, BSD-2-Clause, käännetty C) — riippumaton ratkaisijakoodi, mutta sama ensimmäisen kertaluvun näköyhteyserotuksen algebra, joten edelleen InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> Kolme termiä, jotka differentiaalikorjaus kerää hetken, jolla se lasketaan, ja hetken, jolla sitä käytetään, välillä, kukin aiemmin jätetty mallintamattomaksi varakapasiteetiksi:. Oraakkeli (InternalConsistency): Suljetun muodon identiteetit ja sisäinen johdonmukaisuus: tasaisen kvantisoijan askel²/12-varianssi, tarkka (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹-kovarianssin eteneminen, joka supistuu muotoon σ·PDOP yhtäsuurille σ:ille, mittaustermin { "1" }:{ "1" }-siirtyminen seurauksena ehdosta û_user ≈ û_ref, sekä kytkennän pois päältä oleva neliöllinen sulkeutuminen. PDOP-ristiintarkistus orbit::dop-moduulia vastaan jakaa normaalimatriisin [−û, { "1" }], joten se on johdonmukaisuustarkistus ja merkitty sellaiseksi eikä in

seg-f1e7283d2e15 = MODELLED — täsmällinen kumoutumisidentiteetti + ensimmäisen kertaluvun dekorrelaatiomalli; ei validoitu oikealla datalla; ei TRL:ää/lentoperintöä/virastosuositusta. (tyyppiluettelo (<c1/>))

seg-9d54d8c07ca3 = REHELLISYYS: MODELLED. Yhteismoodin kumoutuminen on TÄSMÄLLINEN algebrallinen identiteetti; spatiaalisen dekorrelaation jäännös on ENSIMMÄISEN KERTALUVUN geometrinen malli (lisätyn ratavirheen näköyhteyserotuksen projektio), ei oikeasta Kuun seurannasta sovitettu dekorrelaatiomalli. Käyttäjän suojaustaso KÄYTTÄÄ UUDELLEEN DO-229E SBAS -suojaustasokoneistoa (crate::sbas) differentiaalijäännöksen sigmalla satelliittikohtaisena virheenä (skenaariotiedoston kommentti, rivit { "23" }–{ "28" })

seg-4156a7515574 = ── KORJAUSLINKKI ────────────────────────────────────────────────────────────── Yllä oleva identiteetti olettaa TÄYDELLISEN korjauksen: sen laskee asema, joka tietää täsmälleen, missä se on, toimitettuna välittömästi, äärettömällä resoluutiolla. Mikään näistä kolmesta ei päde, ja alla olevat kolme syötettä mallintavat, mitä kukin maksaa. Ne syöttävät VAIN tuloksen lohkoa <c1/> -- kun kaikki kolme ovat arvoissa, jotka on kirjoitettu h (skenaariotiedoston kommentti, rivit { "57" }–{ "62" })

seg-e7f016777e09 = MITTAUSVIRHE ASEMAN PAIKASSA. Asema muodostaa korjauksensa koordinaattia vastaan, jonka se USKOO oikeaksi. Siinä oleva virhe kulkee mukana jokaisessa sen lähettämässä korjauksessa ja saavuttaa käyttäjän muodossa -delta . u_ref -- joka ei sisällä lainkaan käyttäjän geometriaa, joten ratatermistä poiketen se ei katoa nollabaselinella eikä kasva baselinen mukana, ja se siirtyy noin yksi yhteen käyttäjän paikkaan. Oletus { "0.30" } m on paketin oma Kuun vertailu (skenaariotiedoston kommentti, rivit { "64" }–{ "70" })

seg-e0648d9b52b4 = KORJAUKSEN VANHENEMINEN. Hetkellä t laskettu ja hetkellä t+tau sovellettu korjaus on vanhentunut kahdella tavalla. Rata: satelliitti on SIIRTYNYT, joten jäädytetty ratavirhevektori projisoituu nyt kierrettyyn näköyhteyteen; kierto tulee tämän paketin omasta propagaattorista, joten ratavirheen muutosnopeutta ei oleteta missään. Kello: satelliittikello on ajautunut määrällä c*sigma_y(tau)*tau täyden RAFS-potenssilain mukaan tiedostossa crate::clock_specs, kalibroitu (skenaariotiedoston kommentti, rivit { "73" }–{ "79" })

seg-7171b2e3f29d = Kuun differentiaalinen PNT on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Kuun differentiaalinen PNT — korjauslinkin jäännösbudjetti on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Aihesivu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Edellinen</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Seuraava</s1>lunar-frame-campaign
