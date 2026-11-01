# docs--kinds-optical-pnt: translations (fi)

seg-b03d56f501c3 = Tyyppi

seg-e6839b50b560 = MODELLED heterogeeninen optinen + RF PNT -yhteinen laatumittari (P5): koostaa { "1550" } nm:n kaksisuuntaisen optisen linkkibudjetin (fotonirajoitettu kaksisuuntainen etäisyysmittauksen CRLB σ_τ/√N ja diffraktiojalanjälki λ/D·etäisyys), modaliteettien välisen ratkaisuerotus-RAIM-suojaustason (paikka JA ajoitus), joka yhdistää löyhän RF- ja tiukan optisen ratkaisun erilaisilla kovariansseilla, N aseman optisen selkeän taivaan saatavuuden (riippumaton yhdiste { "1" }−Π({ "1" }−a_i) ja spatiaalisesti korreloitu variantti), optinen↔RF-tila/kovarianssi-luovutuksen TODISTETUSTI bittitarkasti jatkuvalla (ei hyppyä) keskiarvolla ja NEES χ² -johdonmukaisuusportilla sekä yhteisen P(saatavilla JA toistotarkkuusluokka JA eheys varmistettu) -pisteen korrelaation käsittelyllä. VALIDATED suljettu muoto: etäisyysmittauksen CRLB, diffraktiojalanjälki, χ²-suojaustason kvantiili, yhdistekombinatoriikka, luovutuksen keskiarvon jatkuvuus + NEES-portti sekä yhteinen riippumaton tulo. MODELLED: optiset häviöallokaatiot, RF/optisten σ-suuruudet, pilviklimatologiasyötteet, korrelaatiot ja P_HMI-budjetti. Ei sertifioitu saatavuus-/eheystuote.

seg-5cea5229815e = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-optical-rf.toml, skenaariotyyppi hybrid-optical-rf

seg-a878d9be65b7 = MODELLED optinen PNT ilmakehän läpi: optiselle linkille ja joukolle maa-asemia, joilla on ilmoitetut pilviklimaatit, se raportoi aallonpituudesta ja korkeuskulmasta riippuvan kirkkaan ilman vaimennuksen (Kimin näkyvyyslaki plus Rayleigh), Hufnagel–Valley-turbulenssitilan (Rytov-varianssi, tuikeindeksi, gamma-gamma-parametrit, apertuurikeskiarvoistus), säästä riippuvan saatavuuden linkkimarginaalia vasten (pilven optinen paksuus log-normaalista nestevesiklimaatista, geometrisen optiikan ekstinktio, riippumaton turbulenssivaimennus), tavoitesaatavuuksiin tarvittavan linkkimarginaalin, katkon keston jakauman, ajoituksen ja etäisyydenmittauksen virheen kasvun katkoa kohti kellon holdover-mallin kautta, etäisyyskorreloidun paikkadiversiteettisaatavuuden sekä parannustekniikoiden mitä-jos-hyödyt (aallonpituus, vastaanottoapertuuri, adaptiivisen optiikan tuikevähennys, lisämarginaali). VALIDATED toteutuksena ilmoitetuista kaavoista riippumatonta mpmath-oraakkelia vasten: Rytov-varianssi, tuikeindeksi, gamma-gamma-vaimennustodennäköisyys, apertuurikeskiarvoistuskerroin, pilven ja kirkkaan ilman optinen paksuus. MODELLED: jokainen sää-, tekniikka- ja kellosyöte sekä riippumattomuus- ja kopulaoletukset; mitattua saatavuustietuetta ei ole verrattu. Ohjeellinen analyysi, ei sertifioitu saatavuus- eikä navigointituote.

seg-4e2b759aff17 = Moottorin kirjoittama kaavio skenaariolle scenarios/optical-atmosphere-network.toml, tyyppi optical-atmosphere

# text
seg-4e31c8daf798 = Kirjanpito

seg-963749981a7c = Lähde: <c1/>

seg-079c8b284c44 = Optinen PNT (skenaariolajien perhe)

seg-6dea687b727b = Moottorin v{ $version } skenaariolajeja on { "2" }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin antama; laji on MODELLED, ellei matriisi muuta sano (miten merkintä ansaitaan: README:n Evidence-osio).

seg-d019c8511f48 = Aihesivut: <a1>OPTICAL-ATMOSPHERE</a1>. Aja yksi: <c1/>. Kaikki perheet: <a2>KINDS.md</a2>.

seg-b8f937411028 = Yleiskuva kaavioista, jotka moottori kirjoittaa perheen Optinen PNT lajeille

seg-76131e6805e5 = MODELLED optinen PNT ilmakehän läpi: optiselle linkille ja joukolle maa-asemia, joiden pilviklimaatit on ilmoitettu, se raportoi aallonpituudesta ja korkeuskulmasta riippuvan kirkkaan ilman vaimennuksen (Kimin näkyvyys

seg-55725043f48e = MODELLED heterogeeninen optisen ja RF-PNT:n yhteinen hyvyysluku (P5): kokoaa kaksisuuntaisen optisen linkkibudjetin aallonpituudella { "1550" } nm (fotonirajoitteinen kaksisuuntainen etäisyysmittaus, CRLB σ_τ/√N, ja diffraktiojalanjälki λ/D·etäisyys), ja

seg-5e658f01d9f4 = HETEROGENEOUS (tuloksen merkintä)

seg-750466e3188c = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Kirjanpito (ledger):</b> mikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Edellinen</s1>Tehtäväanalyysin yhteydet ja avaruusoperaatiot

seg-48792381ba0b = <s1>Seuraava</s1>Avaruuskäyttäjän navigointi

seg-22449071fb11 = <s1>Edellinen</s1>Tehtäväketjut
