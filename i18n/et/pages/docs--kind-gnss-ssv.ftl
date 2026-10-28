# docs--kind-gnss-ssv: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/gnss-ssv.md
seg-1b94e5a24a2d = Allikas: <c1/>

# text
# c1: gnss-ssv
seg-ee3ecc6e0330 = <c1/> (stsenaariumi liik)

# text
seg-d07af7221334 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kosmosekasutaja navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-d6d7bca305dc = MODELLED GNSS-i kättesaadavus ja lingi tugevus Space Service Volume'is ja kaugemal: kasutaja jaoks sfääril (ICG brošüüri globaalne kest) või Kepleri trajektooril (LEO-st Kuu üleminekuni) loeb see iga konstellatsiooni (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) kohta ja kõigi kokku C/N0 läve ületavad kasutatavad signaalid - vähemalt ühe ja nelja signaali kättesaadavus, maksimaalne katkestuse kestus, vastuvõetud C/N0, täpsuse halvenemise tegur, pealoobi ja külgloobi lingid - brošüüri, parameetrilise või kasutaja antud saatemustriga, valikuliste limbi kiire ionosfääri, plasmasfääri ja atmosfääri mõjudega ning valikulise nõrga signaali vastuvõtja kujundusega; samuti pardal GNSS-i laiendatud Kalmani filter HEO ja Kuu-ülemineku aparaatidele (orbitaaldünaamika, päikesekiirguse rõhk, kolmandad kehad, kell) ja mitmest aparaadist koosneva formatsiooni suhteline navigatsioon ühekordselt diferentseeritud pseudovahemaade abil. Kontrollitud ICG SSV brošüüri tabelite vastu eelregistreerimise all (xval/gnss-ssv)

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-d739ae994bf0 = Ühe <c1/> jooksu kokkuvõte: gnss-ssv trajektoor { "497" } kuni { "58622" } km kõrgus: l1 kombineeritud { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (maks katkestus { "0" } min); l5 kombineeritud { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (maks katkestus { "0" } min)

# text
# c1: shell|trajectory|navigation
seg-79d2e350ed73 = Kohustuslikud väljad: <c1/>

# text
# c1: name
# c2: constellations
# c3: transmit
# c4: receiver
# c5: atmosphere
# c6: formation
seg-7fc75803140d = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-cebc76420d69 = Näide <c1/> määrab muu hulgas:

# text
seg-ce3b64e8c1f4 = [l1, l5]

# text
seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

# text
seg-b02a3ef32d54 = HEO, suure võimendusega nadiiri- ja plaaster-zeniidiantennid, parameetriline s

# text
seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

# text
seg-3421a66993bd = heo

# text
seg-8974ff39f695 = parametric

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-8ac8f00f6c77 = 1/m^{ "3" }

# text
seg-15ca016a7a4f = Tulemuse silt (mootori oma): MODELLED: geomeetriline ja lingibilansi pühkimine. Brošüüri muster on konstantse võimsusega pealoop, parameetriline muster esinduslik asendaja ja limbi kiire keskkond lihtne väljaöeldud mudel; siin pole midagi, mis oleks signaali mõõtmine kosmoses. Kättesaadavuse ja katkestuse arvud järgivad meetodit

# attr:alt
seg-7dae5e291c8b = Diagramm, mille mootor kirjutab failile scenarios/gnss-ssv-heo.toml, liik gnss-ssv

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Liigi <c1/> kättesaadavuse pühkimised: iga konstellatsiooni (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) kohta ja kombineeritult (kasutaja, epohh) paaride osakaal vähemalt ühe ja vähemalt nelja signaaliga ning pikim katkestus, kasutaja jaoks sfääril

# text
# c1: gnss-ssv
# c2: [navigation]
seg-07c94d5ad15c = <b>MODELLED</b> Liigi <c1/> režiim <c2/>: üheksa oleku laiendatud Kalmani filter (positsioon, kiirus, vastuvõtja kella nihe ja triiv, päikesekiirguse rõhu skaala) pseudovahemaadel, mille kättesaadavus, müra ja C/N0 tulevad samast lingist

# text
# c1: gnss-ssv
# c2: [formation]
seg-41bfe74c6f6f = <b>MODELLED</b> Liigi <c1/> režiim <c2/>: juhtaparaat ja abiaparaadid jooksutavad igaüks absoluutfiltrit; abiaparaadi positsiooni juhtaparaadi suhtes hinnatakse absoluuthinnangute lahutamise teel ja suhtelise filtriga ühekordselt diferentseeritud pseud

# text
# c1: gnss-ssv
seg-de9a2a5b5f04 = <b>MODELLED</b> Liigi <c1/> kättesaadavuse pühkimised: iga konstellatsiooni (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) kohta ja kombineeritult (kasutaja, epohh) paaride osakaal vähemalt ühe signaali ja vähe. Sõltumatu etalon (ExternalDataset): ICG Space Service Volume'i brošüür (UN OOSA ST/SPACE/75, { "2018" }), ise simulatsioon, võrreldud eelregistreerimise all, mis on kinnitatud enne jooksu (xval/gnss-ssv/PREREGISTRATION.md; tulemused failis xval/gnss-ssv/RESULTS.md, fikseeritud testiga tests/ssv_booklet_results.rs, möödalaskmised kaasa arvatud). Jooks { "1" } eelregistreeritud lugemisel: minimaalse kiirgusvõimsuse konstandid ja Kuu lävi ühtivad (S0, S6 täidetud); ülemine ja alumine SSV, RF-lävi

# text
seg-f0b778c4922a = <b>MODELLED</b> Chapmani ionosfäär, Gallagheri tüüpi plasmasfäär ja neutraalne atmosfäär (murdumisnäitaja painutus, hapnikuneeldumine, defokuseerimine) integreeritud piki sirget. Sõltumatu etalon (InternalConsistency): Suletud kujud ja avaldatud suurusjärgud testides (Chapmani kihi tipp ja pinnalimbi painutus, paar TECU plasmasfääri GPS-ist GEO-ni kiirel); vastuvõtja kujundus taaskasutab hõive ja jälgimissilmuse mudeleid ja nende teste. Sellega ei võrrelda mõõdetud limbi sondeerimise ega nõrga signaali vastuvõtu andmeid

# text
# c1: gnss-ssv
# c2: [navigation]
seg-77cef183420e = <b>MODELLED</b> Liigi <c1/> režiim <c2/>: üheksa oleku laiendatud Kalmani filter (positsioon, kiirus, vastuvõtja kella nihe ja triiv, päikesekiirguse rõhu sk. Sõltumatu etalon (InternalConsistency): Simuleeritud tõde filtri enda hinnangu vastu (kooskõlalise filtri keskmine normaliseeritud hindamisvea ruut on positsiooni jaoks umbes { "3" }) ja determinism fikseeritud algväärtuse (seed) korral. Lennu- ega salvestatud kõrgorbiidi GNSS-i andmeid ei ole võrreldud; Päike ja Kuu on madala täpsusega ringikujulised asendajad

# text
# c1: gnss-ssv
# c2: [formation]
seg-429e154cd691 = <b>MODELLED</b> Liigi <c1/> režiim <c2/>: juhtaparaat ja abiaparaadid jooksutavad igaüks absoluutfiltrit; abiaparaadi positsiooni juhtaparaadi suhtes hinnatakse lahutamise tea. Sõltumatu etalon (InternalConsistency): Sama simuleeritud tõde, mis absoluutfiltril: suhtelise filtri viga tõelise suhtelise oleku suhtes ja kontroll, et see on vähemalt sama hea kui kahe sõltumatu absoluutlahendi lahutamine. Lennuformatsiooni andmeid ei ole võrreldud

# text
# c1: label
seg-1dd1beb01075 = MODELLED: geomeetriline ja lingibilansi pühkimine. Brošüüri muster on konstantse võimsusega pealoop, parameetriline muster esinduslik asendaja ja limbi kiire keskkond lihtne väljaöeldud mudel; siin pole midagi, mis oleks signaali mõõtmine kosmoses. Kättesaadavuse ja katkestuse arvud järgivad ICG Space Service Volume'i brošüüri (UN ST/SPACE/75) meetodit ning neid kontrollitakse selle tabelite vastu kaustas xval/gnss-ssv/. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-e9c2dedbc971 = MODELLED GNSS-i kättesaadavus ja lingi tugevus Space Service Volume'is ja kaugemal: kasutaja jaoks sfääril (ICG brošüüri globaalne kest) või Kepleri trajektooril (LEO-st Kuu üleminekuni) loeb see iga konstellatsiooni (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) kohta ja kõigi kokku C/N0 läve ületavad kasutatavad signaalid - vähemalt ühe ja nelja signaali kättesaadavus, maksimaalne katkestuse kestus, vastuvõetud C/N0, (liikide kataloog (<c1/>))

# text
seg-3add0e744c54 = MODELLED: muster on esinduslik, mitte mõõdetud; keskkond on väljaöeldud lihtne mudel (docs/SSV.md). (stsenaariumifaili kommentaar, rida { "14" })

# text
seg-6b4655dd5270 = GNSS-i signaali kättesaadavus Space Service Volume'is ja kaugemal, võrreldes ICG SSV brošüüriga, on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
# c1: gnss-ssv
seg-a9e1798308df = Limbi kiire ionosfääri, plasmasfääri ja atmosfääri mõjud riivavatele GNSS-i signaalidele ning nõrga signaali vastuvõtja kujundus liigis <c1/> on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-132be2813c10 = Pardal GNSS-i navigatsioonifilter kõrgorbiidi ja Kuu-ülemineku kosmoseaparaatidele on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f9405de9adb8 = Mitme kosmoseaparaadi formatsiooni suhteline navigatsioon tugevalt elliptilisel orbiidil GNSS-ist on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-4881f925ea7f = Perekonna leht: <a1>Kosmosekasutaja navigatsioon</a1>

# text
seg-4b72df59b3f9 = Teemaleht: <a1>SSV.md</a1>

# text
seg-c9ac9a99bcbb = <s1>Eelmine</s1>gnss-sim

# text
seg-9df48482a140 = <s1>Järgmine</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> Faas <c1/>: keskmine olek mootori Cowelli levitajaga (Maa punktmass ja J2, Päike ja Kuu kolmandate kehadena, Kuu lõimest DE440 kernelist seal, kus see lõiku katab, ja Päike analüütilisest serie

seg-6a26b9ab59fe = Teemaleht: <a1>MISSION-THREAD.md</a1>
