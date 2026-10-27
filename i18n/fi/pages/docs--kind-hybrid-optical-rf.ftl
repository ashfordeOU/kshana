# docs--kind-hybrid-optical-rf: translations (fi)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-0482fec5b0f6 = Lähde: <c1/>

seg-830c574e871b = <c1/> (skenaariotyyppi)

seg-72ad48275ebe = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Optinen PNT</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-e6839b50b560 = MODELLED heterogeeninen optinen + RF PNT -yhteinen laatumittari (P5): koostaa { "1550" } nm:n kaksisuuntaisen optisen linkkibudjetin (fotonirajoitettu kaksisuuntainen etäisyysmittauksen CRLB σ_τ/√N ja diffraktiojalanjälki λ/D·etäisyys), modaliteettien välisen ratkaisuerotus-RAIM-suojaustason (paikka JA ajoitus), joka yhdistää löyhän RF- ja tiukan optisen ratkaisun erilaisilla kovariansseilla, N aseman optisen selkeän taivaan saatavuuden (riippumaton yhdiste { "1" }−Π({ "1" }−a_i) ja spatiaalisesti korreloitu variantti), optinen↔RF-tila/kovarianssi-luovutuksen TODISTETUSTI bittitarkasti jatkuvalla (ei hyppyä) keskiarvolla ja NEES χ² -johdonmukaisuusportilla sekä yhteisen P(saatavilla JA toistotarkkuusluokka JA eheys varmistettu) -pisteen korrelaation käsittelyllä. VALIDATED suljettu muoto: etäisyysmittauksen CRLB, diffraktiojalanjälki, χ²-suojaustason kvantiili, yhdistekombinatoriikka, luovutuksen keskiarvon jatkuvuus + NEES-portti sekä yhteinen riippumaton tulo. MODELLED: optiset häviöallokaatiot, RF/optisten σ-suuruudet, pilviklimatologiasyötteet, korrelaatiot ja P_HMI-budjetti. Ei sertifioitu saatavuus-/eheystuote.

seg-30904e2367fc = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-7b9ce4689508 = Tulosmerkintä (moottorin oma): Heterogeeninen optinen + RF PNT -yhteinen saatavuuden / toistotarkkuuden / eheyden laatumittari (P5). VALIDATED suljettu muoto: fotonirajoitettu etäisyysmittauksen CRLB (σ_τ/√N) ja diffraktiojalanjälki (λ/D·etäisyys), χ²-modaliteettienvälinen suojaustason kvantiili, N aseman riippumaton yhdistesaatavuus ({ "1" } − Π(

seg-5cea5229815e = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-optical-rf.toml, skenaariotyyppi hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Hybrid-optical-rf-raportti ilmoittaa linkkikonfiguraation, jolla se todella ajettiin (kantoaallon aallonpituus, lähetys- ja vastaanottoapertuuri, etäisyys, pulssin leveys, integraatio. Oraakkeli (InternalConsistency): Ei ulkoista oraakkelia, eikä sellainen ole mahdollinen: tämä on itsekuvaus, ei mittaus. Se kirjataan, koska sen puuttuminen oli vika -- P5:n piti lainata kantoaallon aallonpituus ja lähetysapertuuri lähdekoodin oletuksista ja päätellä, että paljas <c1/> oli neliömetreinä sisäisestä johdonmukaisuustarkistuksesta. Päätelmä oli oikea, ja juuri siksi sillä oli väliä: mikään ei olisi havainnut sen olevan vää

seg-28abb5a84eaa = <b>MODELLED</b> Hybrid-optical-rf-raportti ilmoittaa RF-linkin saatavuuden, koostettuna suureista, jotka moottori jo laskee, eikä tuodusta klimatologiasta, ja . Oraakkeli (InternalConsistency): Ei ulkoista oraakkelia, ja ExternalDataset on hylätty. Kaksi syötettä ovat Eb/N0-marginaali ja C/N0-kynnyksen ylitys, molemmat MODELLED EIRP:n, laatumittarin ja yhteen niputetun häviöallokaation funktioita; Maa–Kuu-optisen/RF-hybridipalvelun mitattua saatavuustallennetta, jota vasten koostettua lukua voisi tarkistaa, ei ole. Olemassa olevat tarkistukset ovat sisäisiä ja ilmoitettu sellaisina: koostumus lasketaan uudelleen r

seg-888004543d37 = <b>MODELLED</b> Hybrid-optical-rf-raportti antaa optisen ja RF-etäisyysmittauksen suhteen siten, että YKSI konfiguraatio, jolla molemmat osuudet arvioitiin, kulkee samassa objektissa: sa. Oraakkeli (InternalConsistency): SUHTEELLE ei ole ulkoista oraakkelia, ja ExternalDataset on hylätty tarkoituksella. Taustalla olevalla RF-ketjulla sellainen on -- tests/validate_p5_rf_ranging_precision.rs tarkistaa linkbudget::link_budget ja navsignal::dll_code_jitter_chips riippumatonta Python/NumPy-fixturea vasten ja kovakoodattua Kaplan & Hegarty -työstettyä arvoa vasten ({ "2.814e-3" } chip / { "0.825" } m arvolla { "45" } dB-Hz) -- ja optisella CRLB:llä on oma suljetun muodon rivi

seg-db5ff373b50f = <b>MODELLED</b> Hybrid-optical-rf-raportti ilmoittaa, mitä modaliteettien välinen khiin neliö -monitori voi todella HAVAITA, ei vain sitä, että se läpäisee vikavapaan tapauksen: pienin havai. Oraakkeli (InternalConsistency): Kaksi sisäistä oraakkelia, ei ulkoista aineistoa. ({ "1" }) Suljetun muodon edestakainen laskenta: pienin havaittava harha tuotetaan kääntämällä epäkeskisen khiin neliön häntä epäkeskisyysparametrin suhteen (raim::pbias) ja se varmistetaan syöttämällä saatu epäkeskisyysparametri takaisin funktion raim::noncentral_chi2_cdf läpi monitorin omalla kynnyksellä, ja sen on palautettava P_md. ({ "2" }) Injektio vastaan analyysi: harha kirjoitetaan yhden akselin RF-estimaat

seg-24f31f6b353f = Heterogeeninen optinen + RF PNT -yhteinen saatavuuden / toistotarkkuuden / eheyden laatumittari (P5). VALIDATED suljettu muoto: fotonirajoitettu etäisyysmittauksen CRLB (σ_τ/√N) ja diffraktiojalanjälki (λ/D·etäisyys), χ²-modaliteettienvälinen suojaustason kvantiili, N aseman riippumaton yhdistesaatavuus ({ "1" } − Π({ "1" }−a_i)), optinen↔RF-luovutuksen keskiarvon jatkuvuus (bitti bitiltä ei hyppyä) -invariantti ja NEES χ² -portti sekä yhteisen laatumittarin riipp (tulos <c1/>)

seg-bec90783ad8b = MODELLED heterogeeninen optinen + RF PNT -yhteinen laatumittari (P5): koostaa { "1550" } nm:n kaksisuuntaisen optisen linkkibudjetin (fotonirajoitettu kaksisuuntainen etäisyysmittauksen CRLB σ_τ/√N ja diffraktiojalanjälki λ/D·etäisyys), modaliteettien välisen ratkaisuerotus-RAIM-suojaustason (paikka JA ajoitus), joka yhdistää löyhän RF- ja tiukan optisen ratkaisun erilaisilla kovariansseilla, N aseman optisen selkeän taivaan saatavuuden (riippumaton yhdiste (tyyppiluettelo (<c1/>))

seg-15abc895e477 = MODELLED: optiset häviöallokaatiot, RF/optisten σ-suuruudet, pilviklimatologiasyötteet, korrelaatiot ja P_HMI-budjetti. (tyyppiluettelo (<c1/>))

seg-9fafa5ffb521 = MODELLED. Validoidut suljetut muodot: etäisyysmittauksen CRLB (sigma_tau/sqrt(N)), diffraktiojalanjälki (lambda/D * etäisyys), khiin neliö -suojaustason kvantiili, yhdistekombinatoriikka, luovutuksen keskiarvon jatkuvuus + NEES-portti sekä yhteinen riippumaton tulo. Häviöallokaatiot, sigma-suuruudet, pilviklimatologiasyötteet, korrelaatiot ja P_HMI-budjetti ovat mallinnettuja edustavia syötteitä. Jokainen alla oleva kenttä on valinnainen ja näytetään sen (skenaariotiedoston kommentti, rivit { "10" }–{ "14" })

seg-e5f964e5d422 = --- G15 harha-/ramppivian injektio modaliteettien väliseen monitoriin --- Pienin havaittava harha ja havaitsemistehokäyrä ovat ANALYYTTISIÄ (epäkeskisen khiin neliön käänteisfunktio), joten ne eivät tarvitse omia syötteitä. Nämä kaksi asettavat vain ramppinopeuden, josta raportoitu havaitsemisaika on nopeusmuunnos. Molemmat MODELLED. (skenaariotiedoston kommentti, rivit { "56" }–{ "59" })

seg-70f50a62aa12 = --- G17 luovutuksen jälkeinen vapaa ajautuminen: prosessikohina ja hälytysrajan ylitys --- Satunnaiskävely olemassa olevassa 4-tilaisessa (itä, pohjoinen, ylös, kello) luovutussuodattimessa. Hälytysrajat ovat jo yllä ilmoitetut; vain prosessikohina ja kattavuuskerroin ovat uusia. Molemmat PSD:t ovat MODELLED edustavia syötteitä, ja ylitysajat skaalautuvat suoraan niiden mukana. (skenaariotiedoston kommentti, rivit { "63" }–{ "67" })

seg-9fb4240fb0ef = Hybridin optisen/RF-raportin itsekuvaus on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Perhesivu: <a1>Optinen PNT</a1>

seg-1586d90cdf1b = <s1>Edellinen</s1>holdover-test

seg-211275a00df0 = <s1>Seuraava</s1>hybrid-ukf
