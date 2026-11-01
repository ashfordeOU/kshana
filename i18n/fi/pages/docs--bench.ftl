# docs--bench: translations (fi)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Lähde: <c1/>

seg-d3c3517e3bb2 = Avoin joukko tehtäviä, jakoja ja mittareita GNSS-häiriön havaitsemiseen ja ajoituksen holdover-tilanteisiin. Määrittely on <a1><c1/></a1> (versio { "2.0.0" }; tekstin ja manifestien lisenssi: CC-BY-4.0 / CC0 ehdotettu, omistajan päätös odottaa). Aineiston lisenssitarkastus on <a2><c2/></a2>. Lähtötasojen kynnykset vahvistettiin ennen ensimmäistä pisteytettyä ajoa asiakirjassa <a3><c3/></a3> ja versiolle { "2.0.0" } asiakirjassa <a4><c4/></a4>, ja niiden tulokset ovat asiakirjassa <a5><c5/></a5>.

seg-6c455061baac = Siellä kirjatut tuomiot: pisteyttäjän kynnykset, C1–C3 ja D2 täyttyvät; <b>A2 on NOT MET</b> (<c1/> AUC { "0.766" }, kun vaatimus on vähintään { "0.80" } testijaolla), <b>D1 on NOT MET</b> (suurin ero { "0.0301" }) ja <b>tehtävä (b) R1 on NOT MET</b> (siirretty, ei ajettu uudelleen). Mitään kynnystä ei ole löysennetty.

seg-ebe1c987bc7c = Mitä se on: tapa vertailla menetelmiä samalla datalla samalla mittarikoodilla. Mitä se ei ole: tuotteiden paremmuusjärjestys, hyväksyntä tai todiste siitä, että menetelmä toimii kentällä. Jokainen pistemäärä on MODELLED, ja pistemäärä kuvaa lokia tai aineistoa, ei koskaan tuotetta. Kshana-tulokset ovat ohjeellisia.

seg-874effe5ee80 = Tehtävän D (optimismiero) kshana-bench-työkalun sisäänrakennetut lähtötasot testijaolla, moottorin v{ $version } todellisesta ajosta (`kshana bench baseline`). Jokainen palkkipari on ROC-käyrän alla oleva ala jakaumaan kuuluvilla tapauksilla ja siirtyneillä tapauksilla; niiden välinen ero on optimismiero, toleranssina { "0.05" }. fused-max-z: { "0.998" } ja { "0.983" } (ero { "0.015" }); sqm-imbalance: { "0.882" } ja { "0.882" } (ero { "0.001" }); agc-excess: { "0.848" } ja { "0.819" } (ero { "0.030" }); raim-parity: { "0.682" } ja { "0.672" } (ero { "0.010" }); energy-cn0-drop: { "0.595" } ja { "0.565" } (ero { "0.030" }). Nimiöt ovat synteettisen aineiston generatiivisen mallin nimiöitä, eivät koskaan kenttädataa: MODELLED. Ohjeellinen: mallinnettu tai mitattu mainittuihin viitteisiin nähden, ei hyväksyntä, sertifiointi eikä vaatimustenmukaisuuslausunto. Pistemäärä kuvaa lokia tai aineistoa, ei koskaan tuotetta.

seg-6ce7bd4525d6 = Tehtävät

seg-09907c94f04d = Tehtävä

seg-1c6199627b90 = Data

seg-9cdfe78e3b22 = Ensisijainen mittari

seg-5093217f24a1 = (a) havaitseminen vastaanottimen lokeista

seg-809068c95ddf = yksi epookki lokista JammerTest { "2024" }

seg-f87dda92fbd2 = haetaan skriptillä <c1/> (GPL-3.0+, ei koskaan sisällytetä repositorioon)

seg-9493bfc5bd64 = (b) havaitseminen IQ-datasta

seg-8d012e25aa62 = yksi pisteytetty ikkuna kohtauksesta

seg-69f020ed20da = Kshana-synteettisen kohtauksen resepti; TEXBAT vain viitteenä

seg-499ae444224e = AUC hälytyslajia kohden

seg-73028caefeb0 = (c) ajoituksen holdover-ennuste

seg-0d0b071690cf = (satelliitti, alkuhetki)

seg-6cf42152f523 = IGS-kellot, näytteenottoväli { "300" } s (sitoutettu ote, lukittu tiiviste)

seg-74bd23dfebf5 = RMSE kohdassa { "3600" } s

seg-3cc3545250e5 = (d) jakauman ulkopuolinen optimismiero

seg-ab343a29b019 = yksi synteettinen tapaus

seg-b25d781ff536 = Aineisto <c1/>, jakauman sisällä ja ulkopuolella

seg-e32f49d34f7b = Tuloksena AUC ja ero

seg-1ad563733f12 = Komennot

seg-c9d00ff2e1d0 = Lähetys on tiedosto (<c1/>): <c2/> (yksi luku tapaustunnusta kohden; suurempi tarkoittaa todennäköisemmin heikentynyttä) tehtäville a, b ja d, tai <c3/> (vaiheen muutos yksikössä ns kullakin horisontilla) tehtävälle c. Tulostiedosto (<c4/>) nimeää määrittelyversion, jaon, totuuden ja ennusteiden SHA-256-tiivisteen sekä mittarit. Eri pääversioiden tuloksia ei koskaan panna samaan taulukkoon.

seg-bdc715c52ab5 = Rehelliset rajat

seg-f26f0e79f2ed = Todellisen datan holdout-aineistot (a ja c) ovat julkisia, koska kuka tahansa voi ladata datan. Ne suojaavat sitä vastaan, että jako valitaan pisteet nähtyään, eivät sitä vastaan, että viritetään näissä kansioissa. Tehtävän (d) holdout (sinetöity aineisto) on sitouma ja paljastus (commit and reveal): omistaja sitoutuu vain tiivisteeseen tiedostossa <c1/> ja pitää siemenluvun itsellään (yhtään ei ole vielä sinetöity).

seg-81c3f961230b = Tehtävän (a) totuus on tapahtumalokien ajoitetut hyökkäysvälit yhden minuutin erottelulla, joten havaitsemistodennäköisyys on alaraja; tapahtumatason mittarit (viive, havaitsematta jääneet hälytykset, väärät hälytykset) tulevat Jammertest-pisteyttäjän (<c1/>) mukana.

seg-47df52b5c5e6 = Tehtävän (b) IQ-lähtötaso on siirretty asiakirjasta <c1/>, ei ajettu uudelleen versiota v1 varten.

seg-d54342791763 = Tehtävän (d) aineisto on erotettavuus- ja putkistotarkistus; sen AUC on AUC mallista johdettujen nimiöiden yli.

seg-3d8bfdeead6c = <s1>Edellinen</s1>Häiriöobservatorio: tulokset

seg-07f5b51844d1 = <s1>Seuraava</s1>Vastaanottimen ajaminen skenaariota vastaan
