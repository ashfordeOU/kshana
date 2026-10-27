# docs--optical-atmosphere: translations (et)

# text
seg-6cb7a787ac67 = Viited

# text
seg-1c6199627b90 = Andmed

# text
seg-ad856ad710eb = Staatus

# text
seg-53a7343c076e = Väide

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Allikas: <c1/>

# text
seg-333a1114746a = Optiline PNT läbi atmosfääri

# text
# c1: optical-atmosphere
seg-47118f54f060 = Stsenaariumi liik <c1/> vastab küsimusele, kui sageli optiline side maapinnaga töötab, miks see ebaõnnestub, milline varu või tehnika aitaks ning mida kell teeb, kui side on maas.

# text
seg-06db0ea8f428 = Kshana on ainult analüüsipool. See ei käita optilise maajaama katset ega nimeta ühtki mõõtmispartnerit. Liik on <b>MODELLED</b>: selle arvutusi kontrollitakse sõltumatu programmi vastu, kuid ühtki mõõdetud kättesaadavuse kirjet ei ole võrreldud ning iga ilma-, tehnika- ja kella sisend on eeldus. See on nõuandev analüüs, mitte sertifitseeritud kättesaadavuse, terviklikkuse ega navigatsiooni toode.

# text
seg-83c16fd89005 = Mõlemad kaasatud stsenaariumid kannavad ILLUSTRATIVE pilvekliimasid. Need on sisendid, mitte mõõtmised ega ühegi andmekogumi väärtused.

# attr:alt
seg-e9dbbd9cfa32 = Üks algväärtustatud (seeded) realisatsioon asukoha „northern“ sidelingi varust { "336" } h jooksul, mootori v{ $version } tegelikust käitusest stsenaariumil scenarios/optical-atmosphere-network.toml (algväärtus { "37" }, samm { "600" } s). Varu langeb pilveepisoodide ajal alla nulli; selles valimis on side üleval { "40.5" } % ajast, { "27" } katkestusega ja pikima katkestusega { "30.7" } h. Sisendid on illustratiivsed, rida on üks valim mudelist, mitte kliima, ja see erineb statistilisest kättesaadavusest ({ "37.8" } %) valimi valimiveaga. Ainult nõuandev analüüs: mitte sertifitseeritud kättesaadavuse, terviklikkuse ega navigatsiooni toode ning mitte ennustus ühegi tegeliku asukoha kohta, kui selle kliimasisendid ei pärine nimetatud andmekogumist.

# text
seg-13a52dfbd8d1 = Mida arvutatakse

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Selge õhu kadu</b> lainepikkusel ja kõrgusnurgal: aerosooli ekstinktsioon Kimi, McArthuri ja Korevaari nähtavusseadusest, kõrgusega eksponentsiaalne, pluss Rayleigh' hajumine ja märgitud gaasineeldumise sisend. See asendab mooduli <c2/> ühe koondatud <c1/>, kui atmosfäär on antud. Ilma selleta on sidelingi eelarve bitthaaval identne versiooniga { "0.36" } (eelregistreeritud lävi A5).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulents.</b> Hufnageli–Valley <c1/> profiil (vaikimisi HV 5/7), integreeritud mööda kaldteed, annab tasa- või sfäärilise laine Rytovi dispersiooni, ülesühenduse või allaühenduse jaoks. Sellest tulevad Andrewsi–Phillipsi sähvatusindeks, gamma-gamma parameetrid, nõrga turbulentsi apertuurikeskmistamise tegur (Churnside) ning gamma-gamma lainetuse tõenäosus ja lainetuse varu. Apertuurikeskmistamist rakendatakse momentide sobitamisega: sähvatusindeks skaleeritakse keskmistamistegurile ja mõlemad logaritmdispersioonid skaleeritakse ümber nii, et see tuleb täpselt välja.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Pilv.</b> Asukoha pilvekliima on ITU-R P.840 kuju: pilve tõenäosus ja pilve korral logaritmnormaalne vedela vee sammas. P.840 annab pilve hulga. Sumbumine on geomeetrilise optika optiline paksus <c1/>, sest P.840 enda sumbumisseadus on mikrolaineseadus ja ei kehti lainepikkustel { "0.85" } kuni { "1.55" } µm, kus piisad on lainepikkusest palju suuremad.

# text
# c1: null
seg-18311430b2a3 = Asukoha <b>kättesaadavus</b>: side on üleval, kuni pilve ja turbulentsi lainetus kokku jääb varu piiresse, mis on jäänud pärast selge õhu kadu. Pilve ja turbulentsi võetakse sõltumatutena. Aruanne annab kättesaadavuse, selge taeva kättesaadavuse, <b>lae</b>, mida ükski varu ei saa tõsta (optiline side ei läbi paksu pilve), ning iga sihtkättesaadavuse jaoks vajaliku lisavaru või <c1/>, kui siht on laest kõrgemal.

# text
seg-885e06050a9a = <b>Katkestused.</b> Kestused on logaritmnormaalsed märgitud keskmise ja hajuvusega. Aruanne annab katkestuste arvu aastas, kestuse mediaani, 90. ja 99. protsentiili juures ning katkestusaja tõenäosuse ja osa, mis ületab { "1" }, { "6" }, { "24" } ja { "72" } tundi.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Asukohtade mitmekesisus.</b> Parimad <c1/> asukohta, kombineeritud sõltumatu ilmaga (<c2/>) ja vahemaaga korreleeritud ilmaga: paari korrelatsioon <c3/>, kombineeritud ühefaktorilises Gaussi kopulas. Väärtusel <c4/> on see sõltumatu ühend ja täieliku korrelatsiooni korral parim üksik asukoht.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Tehnikad.</b> Iga <c1/> on mis-kui-stsenaarium: uus lainepikkus (selge taeva eelarve, selge õhu kadu ja apertuurikeskmistamine hinnatakse uuesti), uus vastuvõtuapertuur, märgitud murdosaline sähvatuse vähendamine (adaptiivoptika) ja lisavaru. Tulemus on kättesaadavuse kasv lähtetasemega võrreldes samas asukohas. Kshana ei modelleeri adaptiivoptika tsüklit, seega kasvud on sisendid.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Ajastus ja kaugusmõõtmine läbi katkestuse.</b> Iga katkestuse kestus teisendatakse kella holdover-mudeli suletud kujuga väljajooksu dispersiooni kaudu failis <c1/> loetletud kellade jaoks. Aruanne annab ajastuse ja kaugusmõõtmise vea märgitud katkestuskestuste juures, holdover-i ajastuse läveni, katkestuste osa selle sees ja ajastuse kättesaadavuse <c2/>. Klassi astmeseaduse põrandad on holdover-mooduli sünteesitud põrandad, seega tihedat lävendit juhib see eeldatud põrand, nagu <c3/> ütleb.

# text
seg-59774a9e8685 = Sidelingi varu ajas ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Tabel <c1/> (<c2/> kuni { "8760" }, <c3/>, <c4/>) lisab igale asukohale ühe ülaltoodud mudeli <b>algväärtustatud realisatsiooni</b>: vaatejoon vaheldub selgete perioodide (eksponentsiaalsed, keskmine seatud nii, et pilves oleva aja osa on märgitud <c5/>) ja pilvekatkestuste (logaritmnormaalsed, märgitud keskmine ja hajuvus) vahel; iga katkestus tõmbab ühe vedela vee samba märgitud kliimast ja hoiab seda; iga samm tõmbab ühe gamma-gamma sähvatusvalimi (sammust sammuni sõltumatu, märgitud lihtsustus) ja terminal on sihil märgitud suunamiskättesaadavusega. Sammu varu on lainetuse eelarve miinus pilve ja sähvatuse lainetused ning side on üleval, kui varu ei ole negatiivne ja terminal on sihil, mis on tingimus, mida kättesaadavuse integraal kasutab.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = See on valim, mitte kliima: selle kättesaadavus erineb statistilisest valimi valimiveaga ja esimene episood tõmmatakse tervikuna. Tulemus kannab sammu kohta <c1/>, <c2/>, <c3/> ja <c4/> ning <c5/> plokki (kättesaadavus, pilveosa, katkestuste arv, pikim katkestus). <b>MODELLED</b>; kontrollid (<c6/>, läved fikseeritud failis <c7/> enne esimest käitust) on determinism ja kooskõla märgitud arvudega, mitte väline sõltumatu etalon. Ilma tabelita ei kirjutata midagi ja tulemus on { "0.37" } dokument.

# text
seg-4a9b065bdb28 = Stsenaariumi väljad

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
seg-4ba70196355d = Kõik ülemise taseme väljad on valikulised. Paljas <c1/> käitab kolm illustratiivset asukohta. Iga võtme kohta vt kahte kaasatud faili: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = Kontrollistaatus

# text
seg-6598ced4218b = Rytovi dispersioon, sähvatusindeks, gamma-gamma lainetuse tõenäosus, apertuurikeskmistamise tegur, pilve ja selge õhu optiline paksus arvutatakse nii, nagu märgitud valemid ütlevad

# text
seg-2442f7529fbb = MODELLED rida; arvutusi kontrollitud sõltumatu mpmath programmi vastu

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = läved A1 kuni A3, kõik täidetud (<c1/>)

# text
seg-b91d83aea0e8 = Sidelingi eelarve ja olemasolev kättesaadavus on ilma atmosfäärita muutumatud

# text
seg-2192262e26c1 = täidetud

# text
seg-a71527a271df = lävi A5, bitthaaval identne { "1,000" } parameetrikomplekti üle

# text
seg-0db8cf4c2ee0 = Mitmekesisuse piirid ja monotoonsus; holdover-i sidestus bitthaaval täpne

# text
seg-2a5c5967540c = täidetud (samasused)

# text
seg-4b0e5e3ac558 = läved A4, A6

# text
seg-f842c688e29a = Tegeliku asukoha kättesaadavus, tegelik sähvatus, tegelik pilvestatistika

# text
seg-9a0ead7b1670 = ei väideta

# text
seg-9cc220190772 = ühtki välist sõltumatut etaloni ei võrreldud

# text
seg-7c5050135e2b = Sõltumatu etalon kontrollib märgitud valemite teostust, mitte atmosfääri, seega ühtki rida ei ole VALIDATED. ITU-R valideerimisväärtusi ei kasutata ja need hoitakse repositooriumist väljas.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Ühtki ilmaandmekogumit ei ole kaasatud. Tegeliku asukoha pilvekliima sisendid pärinevad avalikust andmekogumist (Copernicus ERA5, NASA MODIS või ISCCP); iga andmekogumi litsents tuleb enne kasutamist läbi lugeda ja salvestada ning testi ajal tuuakse toorandmed fikseeritud SHA-256-ga. Ainus repositooriumis juba olev klimatoloogia on Cavazzani jt selge öö tabel, mida kasutab <c1/>.

# text
seg-44d197f3209c = Andrews ja Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. trükk (Rytovi dispersioon, sähvatusindeks, gamma-gamma parameetrid).

# text
seg-9e9a33d44013 = Kim, McArthur ja Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (nähtavusseadus).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (apertuurikeskmistamise tegur).

# text
seg-309c70f2f4f8 = ITU-R P.840 (pilve vedela vee statistika), P.1814 ja P.1817 (vabaruumioptika meetodid).

# text
seg-83b30e1ca261 = <s1>Eelmine</s1>Tõendipaketid

# text
seg-1474b58fb35a = <s1>Järgmine</s1>Ajapesa ajastus
