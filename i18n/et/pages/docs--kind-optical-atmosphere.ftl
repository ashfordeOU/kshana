# docs--kind-optical-atmosphere: translations (et)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-72ad48275ebe = Mootori v{ $version } stsenaariumi liik, perekond <a1>Optiline PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a97755cb13eb = Perekonna leht: <a1>Optiline PNT</a1>

# text
seg-9fd02351d844 = ms

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Allikas: <c1/>

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (stsenaariumi liik)

# text
seg-a878d9be65b7 = MODELLED optiline PNT läbi atmosfääri: optilise lingi ja nimetatud pilveklimaatidega maapealsete jaamade komplekti kohta annab see aru lainepikkusest ja tõusunurgast sõltuva selge õhu summutuse (Kimi nähtavusseadus pluss Rayleigh), Hufnagel-Valley turbulentsiseisundi (Rytovi dispersioon, sintillatsiooniindeks, gamma-gamma parameetrid, apertuuri keskmistamine), ilmast sõltuva kättesaadavuse lingi varu suhtes (pilve optiline paksus log-normaalsest vedela vee kliimast, geomeetrilise optika summutus, sõltumatu turbulentsihääbumine), lingi varu, mis on vajalik sihtkättesaadavuste jaoks, katkestuste kestuse jaotuse, ajastus- ja kaugusmõõtmisvea kasvu katkestuse kohta kella holdover-i mudeli kaudu, vahemaast sõltuva jaamade mitmekesisuse kättesaadavuse ning parendustehnikate mis-juhtuks-kui võidud (lainepikkus, vastuvõtuapertuur, adaptiivoptikaga sintillatsiooni vähendamine, lisavaru). VALIDATED kui nimetatud valemite teostus sõltumatu mpmath-sõltumatu etaloni vastu: Rytovi dispersioon, sintillatsiooniindeks, gamma-gamma hääbumistõenäosus, apertuuri keskmistamise tegur, pilve ja selge õhu optiline paksus. MODELLED: iga ilma-, tehnika- ja kellasisend ning sõltumatuse ja kopula eeldused; mõõdetud kättesaadavuse andmestikuga ei ole võrreldud. Nõuandev analüüs, mitte sertifitseeritud kättesaadavuse ega navigatsiooni toode.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Ühe <c1/> käivituse kokkuvõte: optical-atmosphere: { "1550" } nm { "30" } kraadi tõusunurgal, varu { "19.2" } dB enne atmosfääri; parim jaam southern { "74.66" } %; 3 jaama võrgustik { "92.72" } % sõltumatu / { "91.62" } % korreleeritud ilm (MODELLED, nõuandev)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-e466ecbd4e6d = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-8adae3ea6e60 = Näide <c1/> määrab muu hulgas:

# text
seg-687f2930a40d = allalink

# text
seg-e794d481aed4 = tasapinnaline

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Tulemuse silt (mootori oma): MODELLED — optiline PNT läbi atmosfääri: selge õhu summutus (Kimi nähtavusseadus + Rayleigh), pilve optiline paksus nimetatud vedela vee kliimast (P.840 hulk, geomeetrilise optika summutus), Hufnagel-Valley turbulents gamma-gamma hääbumiste ja apertuuri keskmistamisega, kättesaadavus lingi varu suhtes

# attr:alt
seg-4e2b759aff17 = Diagramm, mille mootor kirjutab failile scenarios/optical-atmosphere-network.toml, liik optical-atmosphere

# text
seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley Cn2 integreerituna piki kaldteed tasa- ja sfäärilaine Rytovi dispersiooni (üles- ja allalink), Andrewsi-Phillipsi sintillatsiooniindeksi ja gamma-gamma parameetrite, gamma-gamma hääbumistõenäosuse ja hääbumisvaru jaoks, Testid: <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Optilise lingi kättesaadavus nimetatud lingi varu suhtes log-normaalsest pilve vedela vee kliimast (ITU-R P.840 hulk, geomeetrilise optika summutus) ja sõltumatust gamma-gamma turbulentsihääbumisest, sihtkättesaadavuste jaoks vajalik lingi varu Testid: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> Optilise jaama katkestuste kestuse jaotus, seotud kella holdover-i mudeli kinnise kuju libisemisdispersiooniga: ajastus- ja kaugusmõõtmisviga nimetatud katkestuste kvantiilidel, holdover ajastuslävendini, katkestuste osakaal ja Testid: <a1>optical_atmosphere_identities.rs</a1>.

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Valikuline <c1/> tabel (kestus, samm, algväärtus) paneb liigi <c2/> kirjutama ka iga jaama kohta ühe algväärtustatud realisatsiooni nimetatud jaamamudelist ajas: pilveepisoodid (selged perioodid eksponentsiaalsed, pilvekatkestused log-normaalsed Testid: <a1>optical_atmosphere_timeseries.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley Cn2 integreerituna piki kaldteed tasa- ja sfäärilaine Rytovi dispersiooni (üles- ja allalink), Andrewsi-Phillipsi sintillatsiooniindeksi ja . Sõltumatu etalon (sõltumatu etalon; ExternalDataset): arvutusi võrreldakse sõltumatu programmiga (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } { "30" } numbri täpsusega, tanh-sinh kvadratuur algsel kõrgusmuutujal ja Besseli-K gamma-gamma tihedused), mis ei jaga Kshanaga mingit koodi, lävede all, mis on fikseeritud enne mis tahes teostuse olemasolu (xval/optical-atmosphere/PREREGISTRATION.md). MIKS MODELLED: see sõltumatu etalon hindab samu avaldatud valemeid, seega kontrollib see im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Optilise lingi kättesaadavus nimetatud lingi varu suhtes log-normaalsest pilve vedela vee kliimast (ITU-R P.840 hulk, geomeetrilise optika summutus) ja . Sõltumatu etalon (sisemine kooskõla; InternalConsistency): sisemine kooskõla: jaamade mitmekesisuse mudeli kinnise kuju piirjuhud ja monotoonsus, pilvelae kinnine kuju ning log-normaalsed katkestuste samasused. Välist etaloni EI väideta ja sellega ei ole võrreldud: mõõdetud optilise maajaama kättesaadavuse ega pilvevaba vaatejoone andmestikku ei kasutata. MIKS MODELLED: pilveklimaat (pilve tõenäosus, vedela vee samba mediaan ja hajuvus, katkestuste kestused),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> Optilise jaama katkestuste kestuse jaotus, seotud kella holdover-i mudeli kinnise kuju libisemisdispersiooniga: ajastus- ja kaugusmõõtmisviga nimetatud katkestuste kvantiilidel, holdover ajastuslävendini, katkestuste osakaal ja . Sõltumatu etalon (sisemine kooskõla; InternalConsistency): sisemine kooskõla holdover-i mooduliga, bitt bitilt; välist etaloni EI väideta. Klasside PSD-d on sünteesitud pika tau põhjatasemed, mida holdover-i moodul juba sisaldab, mistõttu arvud pärivad selle nimetatud hoiatuse, et holdover range lävendini on määratud eeldatud punase müra põhjataseme, mitte viidatud Alani hälbe poolt. Katkestuste kestused on log-normaalne mudel nimetatud parameetritega, mitte mõõdetud c

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — optiline PNT läbi atmosfääri: selge õhu summutus (Kimi nähtavusseadus + Rayleigh), pilve optiline paksus nimetatud vedela vee kliimast (P.840 hulk, geomeetrilise optika summutus), Hufnagel-Valley turbulents gamma-gamma hääbumiste ja apertuuri keskmistamisega, kättesaadavus lingi varu suhtes, katkestuste kestused seotud kella holdover-iga ning vahemaast sõltuv jaamade mitmekesisus. Arvutusi on kontrollitud (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-32c6524b0baf = MODELLED optiline PNT läbi atmosfääri: optilise lingi ja nimetatud pilveklimaatidega maapealsete jaamade komplekti kohta annab see aru lainepikkusest ja tõusunurgast sõltuva selge õhu summutuse (Kimi nähtavusseadus pluss Rayleigh), Hufnagel-Valley turbulentsiseisundi (Rytovi dispersioon, sintillatsiooniindeks, gamma-gamma parameetrid, apertuuri keskmistamine), ilmast sõltuva kättesaadavuse lingi varu suhtes (pilve optiline paksus log-normaalsest vedela vee kliimast, geomeetrilise optika summutus, sõltumatu turbulentsihääbumine (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED: iga ilma-, tehnika- ja kellasisend ning sõltumatuse ja kopula eeldused; mõõdetud kättesaadavuse andmestikuga ei ole võrreldud. (liikide kataloog (<c1/>))

# text
seg-b4402211e3fe = Optiline PNT läbi atmosfääri: kolm ILLUSTRATIVE maapealset jaama (pilvisem põhjapoolne jaam, keskmine kesksel asuv jaam ja selgem lõunapoolne jaam), mis vaatavad LEO optilist terminali { "30" } kraadi tõusunurgal lainepikkusel { "1550" } nm. Pilveklimaatid on nimetatud sisendid, mitte mõõtmised ega ühegi andmestiku väärtused, seega on iga allolev kättesaadavus MODELLED. Käivitus annab jaama kohta aru selge õhu summutusest, Hufnagel-Valley turbulentsiseisundist, t (stsenaariumifaili kommentaar, read { "1" }–{ "8" })

# text
seg-384f5c73cdf9 = Iga jaama lingi üks algväärtustatud realisatsioon ajas (MODELLED; juhuslik valim ülaltoodud mudelist, mitte kliimast). Puudumisel aegrida ei kirjutata ja tulemuseks on { "0.37" } dokument. (stsenaariumifaili kommentaar, read { "78" }–{ "79" })

# text
seg-c75fa5787bd4 = Optilise kaldtee atmosfääri arvutused: Rytovi dispersioon, sintillatsioon, gamma-gamma hääbumistõenäosus, apertuuri keskmistamine, pilve ja selge õhu optiline paksus on MODELLED, mitte valideeritud: alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = Ilmast sõltuv optilise maajaama kättesaadavus ja vahemaast sõltuv jaamade mitmekesisus on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Teemaleht: <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Eelmine</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Järgmine</s1>orbit
