# docs--optical-atmosphere: translations (fi)

seg-6cb7a787ac67 = Lähteet

seg-1c6199627b90 = Data

seg-ad856ad710eb = Tila

seg-53a7343c076e = Väite

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Lähde: <c1/>

# text
seg-333a1114746a = Optinen PNT ilmakehän läpi

# text
# c1: optical-atmosphere
seg-47118f54f060 = Skenaariolaji <c1/> vastaa siihen, kuinka usein optinen yhteys maahan toimii, miksi se epäonnistuu, mikä marginaali tai tekniikka auttaisi ja mitä kello tekee sen ollessa poissa.

# text
seg-06db0ea8f428 = Kshana on vain analyysipuoli. Se ei aja optisen maa-aseman koetta eikä nimeä mittauskumppania. Laji on <b>MODELLED</b>: sen numeriikka on tarkistettu riippumatonta ohjelmaa vastaan, mutta mitattua saatavuustallennetta ei ole verrattu, ja jokainen sää-, tekniikka- ja kellosyöte on oletus. Se on ohjeellinen analyysi, ei sertifioitu saatavuus-, eheys- tai navigointituote.

# text
seg-83c16fd89005 = Kumpikin mukana toimitettu skenaario sisältää ILLUSTRATIVE-pilviklimaatit. Ne ovat syötteitä, eivät mittauksia eivätkä minkään aineiston arvoja.

# attr:alt
seg-e9dbbd9cfa32 = Yksi siemenlukuun sidottu realisaatio paikan 'northern' yhteysmarginaalista { "336" } h ajalta, moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/optical-atmosphere-network.toml (siemenluku { "37" }, askel { "600" } s). Marginaali putoaa alle nollan pilvijaksojen aikana; tässä otoksessa yhteys on pystyssä { "40.5" } % ajasta, katkoja on { "27" } ja pisin katko on { "30.7" } h. Syötteet ovat havainnollistavia, sarja on yksi otos mallista eikä ilmasto, ja se eroaa tilastollisesta saatavuudesta ({ "37.8" } %) otoksen otantavirheen verran. Vain ohjeellinen analyysi: ei sertifioitu saatavuus-, eheys- tai navigointituote eikä ennuste millekään todelliselle paikalle, ellei sen ilmastosyötteet tule ilmoitetusta aineistosta.

# text
seg-13a52dfbd8d1 = Mitä lasketaan

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Kirkkaan ilman häviö</b> aallonpituudella ja korkeuskulmassa: aerosolin ekstinktio Kimin, McArthurin ja Korevaarin näkyvyyslain mukaan, eksponentiaalinen korkeuden suhteen, sekä Rayleigh-sironta ja ilmoitettu kaasuabsorptiosyöte. Tämä korvaa funktion <c2/> yksittäisen niputetun arvon <c1/>, kun ilmakehä annetaan. Ilman ilmakehää yhteysbudjetti on bitti bitiltä identtinen versiolle { "0.36" } (ennakkorekisteröity kynnys A5).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulenssi.</b> Hufnagel–Valley-profiili <c1/> (oletuksena HV 5/7) integroituna viistopolkua pitkin antaa tasoaallon tai pallomaisen aallon Rytovin varianssin, ylälinkille tai alalinkille. Siitä saadaan Andrewsin–Phillipsin skintillaatioindeksi, gamma-gamma-parametrit, heikon turbulenssin apertuurin keskiarvoistuskerroin (Churnside) sekä gamma-gamma-häipymätodennäköisyys ja häipymämarginaali. Apertuurin keskiarvoistus otetaan huomioon momenttisovituksella: skintillaatioindeksi skaalataan keskiarvoistuskertoimella ja molemmat logaritmivarianssit skaalataan uudelleen niin, että se saadaan täsmälleen.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Pilvi.</b> Paikan pilviklimaatti on ITU-R P.840 -muotoa: pilven todennäköisyys ja pilven ollessa paikalla lognormaalinen nestevesipatsas. P.840 antaa pilven määrän. Vaimennus on geometrisen optiikan optinen syvyys <c1/>, koska P.840:n oma vaimennuslaki on mikroaaltolaki eikä päde alueella { "0.85" }–{ "1.55" } µm, jossa pisarat ovat paljon aallonpituutta suurempia.

# text
# c1: null
seg-18311430b2a3 = Paikan <b>saatavuus</b>: yhteys on pystyssä niin kauan kuin pilven ja turbulenssin häipymät yhdessä pysyvät kirkkaan ilman häviön jälkeen jäljelle jäävän marginaalin sisällä. Pilvi ja turbulenssi oletetaan riippumattomiksi. Raportti antaa saatavuuden, kirkkaan taivaan saatavuuden, <b>katon</b>, jota mikään marginaali ei voi nostaa (optinen yhteys ei läpäise paksua pilveä), ja lisämarginaalin, jota kukin tavoitesaatavuus vaatii, tai <c1/>, jos tavoite on katon yläpuolella.

# text
seg-885e06050a9a = <b>Katkot.</b> Kestot ovat lognormaalisia ilmoitetulla keskiarvolla ja hajonnalla. Raportti antaa katkot vuodessa, keston mediaanissa sekä 90. ja 99. persentiilissä, sekä todennäköisyyden ja katkoajan osuuden, joka ylittää { "1" }, { "6" }, { "24" } ja { "72" } tuntia.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Paikkadiversiteetti.</b> Parhaat <c1/> paikkaa yhdistettynä riippumattomalla säällä (<c2/>) ja etäisyyskorreloidulla säällä: parikorrelaatio <c3/>, yhdistettynä yksitekijäisellä gaussisella kopulalla. Arvolla <c4/> tulos on riippumaton unioni, ja täydellä korrelaatiolla paras yksittäinen paikka.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Tekniikat.</b> Jokainen <c1/> on mitä-jos-tarkastelu: uusi aallonpituus (kirkkaan taivaan budjetti, kirkkaan ilman häviö ja apertuurin keskiarvoistus arvioidaan uudelleen), uusi vastaanottoapertuuri, ilmoitettu osuuden mukainen skintillaation vähennys (adaptiivinen optiikka) ja lisämarginaali. Tulos on saatavuuden parannus lähtötasoon nähden samalla paikalla. Kshana ei mallinna adaptiivisen optiikan silmukkaa, joten parannukset ovat syötteitä.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Ajoitus ja etäisyydenmittaus katkon läpi.</b> Jokainen katkon kesto kuvataan kellon holdover-mallin suljetun muodon rannikkovarianssin läpi kelloille, jotka on lueteltu kohdassa <c1/>. Raportti antaa ajoitus- ja etäisyysvirheen ilmoitetuilla katkon kestoilla, holdoverin ajoituskynnykseen, katkojen osuuden sen sisällä sekä ajoituksen saatavuuden <c2/>. Luokan potenssilakilattiat ovat holdover-moduulin syntetisoimia, joten tiukkaa kynnystä hallitsee tämä oletettu lattia, kuten <c3/> toteaa.

# text
seg-59774a9e8685 = Yhteysmarginaali ajan funktiona ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Taulukko <c1/> (<c2/> enintään { "8760" }, <c3/>, <c4/>) lisää jokaiseen paikkaan yhden <b>siemenlukuun sidotun realisaation</b> yllä olevasta mallista: näköyhteys vuorottelee kirkkaiden jaksojen (eksponentiaaliset, keskiarvo asetettu niin, että pilvessä vietetty ajan osuus on ilmoitettu <c5/>) ja pilvikatkojen (lognormaaliset, ilmoitettu keskiarvo ja hajonta) välillä; jokainen katko arpoo yhden nestevesipatsaan ilmoitetusta ilmastosta ja pitää sen; jokainen askel arpoo yhden gamma-gamma-skintillaationäytteen (riippumattomasti askeleesta toiseen, ilmoitettu yksinkertaistus) ja pääte on kohteessa ilmoitetulla kohdistuksen saatavuudella. Askeleen marginaali on häipymäbudjetti miinus pilven ja skintillaation häipymät, ja yhteys on pystyssä, kun marginaali ei ole negatiivinen ja pääte on kohteessa, mikä on saatavuusintegraalin käyttämä ehto.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = Se on otos, ei ilmasto: sen saatavuus eroaa tilastollisesta otoksen otantavirheen verran, ja ensimmäinen jakso arvotaan kokonaisena. Tulos sisältää askelta kohden kentät <c1/>, <c2/>, <c3/> ja <c4/> sekä lohkon <c5/> (saatavuus, pilviosuus, katkojen määrä, pisin katko). <b>MODELLED</b>; tarkistukset (<c6/>, kynnykset kiinnitetty tiedostossa <c7/> ennen ensimmäistä ajoa) ovat determinismi ja johdonmukaisuus ilmoitettujen lukujen kanssa, eivät ulkoinen oraakkeli. Ilman taulukkoa mitään ei kirjoiteta ja tulos on version { "0.37" } asiakirja.

# text
seg-4a9b065bdb28 = Skenaariokentät

# text
# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Kaikki ylätason kentät ovat valinnaisia. Pelkkä <c1/> ajaa kolme havainnollistavaa paikkaa. Katso kaikki avaimet kahdesta mukana toimitetusta tiedostosta: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Varmennuksen tila

# text
seg-6598ced4218b = Rytovin varianssi, skintillaatioindeksi, gamma-gamma-häipymätodennäköisyys, apertuurin keskiarvoistuskerroin sekä pilven ja kirkkaan ilman optinen syvyys lasketaan ilmoitettujen kaavojen mukaan

# text
seg-2442f7529fbb = MODELLED-rivi; numeriikka tarkistettu riippumatonta mpmath-ohjelmaa vastaan

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = kynnykset A1–A3, kaikki täyttyivät (<c1/>)

# text
seg-b91d83aea0e8 = Yhteysbudjetti ja nykyinen saatavuus ennallaan ilman ilmakehää

# text
seg-2192262e26c1 = täyttyi

# text
seg-a71527a271df = kynnys A5, bitti bitiltä identtinen { "1,000" } parametrijoukossa

# text
seg-0db8cf4c2ee0 = Diversiteetin rajat ja monotonisuus; holdover-kytkentä bittitarkka

# text
seg-2a5c5967540c = täyttyi (identiteetit)

# text
seg-4b0e5e3ac558 = kynnykset A4, A6

# text
seg-f842c688e29a = Todellisen paikan saatavuus, todellinen skintillaatio, todelliset pilvitilastot

# text
seg-9a0ead7b1670 = ei väitetä

# text
seg-9cc220190772 = ulkoista oraakkelia ei verrattu

# text
seg-7c5050135e2b = Oraakkeli tarkistaa ilmoitettujen kaavojen toteutuksen, ei ilmakehää, joten mikään rivi ei ole VALIDATED. ITU-R:n validointiarvoja ei käytetä, ja ne pidetään poissa arkistosta.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Säädataa ei ole mukana. Todellisen paikan pilviklimaattisyötteet tulisivat julkisesta aineistosta (Copernicus ERA5, NASA MODIS tai ISCCP); kunkin aineiston lisenssi on luettava ja kirjattava ennen käyttöä, ja raakadata haetaan testiaikana kiinnitetyllä SHA-256:lla. Ainoa arkistossa jo oleva klimatologia on Cavazzanin ym. kirkkaiden öiden taulukko, jota käyttää <c1/>.

# text
seg-44d197f3209c = Andrews ja Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. painos (Rytovin varianssi, skintillaatioindeksi, gamma-gamma-parametrit).

# text
seg-9e9a33d44013 = Kim, McArthur ja Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (näkyvyyslaki).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (apertuurin keskiarvoistuskerroin).

# text
seg-309c70f2f4f8 = ITU-R P.840 (pilven nestevesitilastot), P.1814 ja P.1817 (vapaan tilan optiikan menetelmät).

# text
seg-83b30e1ca261 = <s1>Edellinen</s1>Todistepaketit

# text
seg-1474b58fb35a = <s1>Seuraava</s1>Aikavälin ajoitus

seg-50f25bceca3c = <s1>Edellinen</s1>Datakumppanit ja ylentävät rivit
