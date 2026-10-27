# docs--hardware-safety: translations (et)

# text
seg-fdbb9db68f1d = puudub

# text
# c1: docs/HARDWARE-SAFETY.md
seg-2015f437e669 = Allikas: <c1/>

# text
seg-10c7eaab58c5 = Riistvara ohutus: mida Kshana riistvaraga teeb ja mida ta kunagi ei tee

# text
seg-fe4873962140 = <b>Seis: omaniku õigusülevaatus ootel.</b> Allpool toodud õiguslikud märkused on hoidjate arusaam avalikest allikatest, kirjutatud nii, et kasutaja teaks, kus piirid asuvad. Need ei ole õigusnõu, neid ei ole jurist üle vaadanud ja seadused erinevad riigiti. Neid tuleks käsitleda põhjusena juristilt küsida, mitte loana.

# text
seg-bd2fbb355834 = Kshana on nõuandev tarkvara uurimiseks, simulatsiooniks ja katsetamiseks. See ei ole tüübikinnitust omav seade ning ei hinda ega kiida heaks vastuvõtjat, kella ega laboratooriumi. Vt README-s olevat nõuandvat avaldust.

# text
seg-f27c286787b1 = Reegel

# text
seg-88638e41faab = Toode on vastuvõtt. Edastamine ei kuulu kunagi avatud mootorisse.

# text
seg-614d381dd0d0 = Kshanas ei ole koodi, mis juhiks saatjat. SDR-i saatmisteed ei ole (ühtegi UHD, HackRF, bladeRF või Soapy saatmiskutset), ning ühtegi segamis- ega spuufimislainekuju ei kirjutata taasesituseks mõeldud faili.

# text
# c1: .sdrx
# c2: kshana iq scene
# c3: .sdrx
seg-2e370a1c6c4c = Failid, mida Kshana kirjutab (IQ-stseenid, SigMF-i ja ION-i <c1/> salvestised, NMEA ja bench-eksport), kirjeldavad <b>simuleeritud, seaduslikke</b> signaale või liikumist ning stseeni jaoks kirjutatud metaandmed ütlevad, et selle kirjutas <c2/> (ION-i <c3/> kommentaar ütleb, et tegemist on simuleeritud stseeniga, mitte salvestisega).

# text
seg-8ce652bc1af6 = Kui katse vajab RF-i laboripingil (bench), tekitab selle <b>operaatori enda seadmestik</b> operaatori enda kestas ja operaatori enda loa alusel. Kshana salvestab selle, mida operaator ütleb tehtuks, ega järeldata seda kunagi.

# text
seg-c74fc5d82071 = Etapid

# text
seg-01e7633921dc = Iga etapp nimetab, mida Kshana teeb, millist riistvara kasutatakse, kes RF-i kiirgab (kui keegi), ja värava, mis peab kehtima enne, kui Kshana käsitleb tulemust tõendina.

# text
seg-324e16b11186 = Etapp

# text
seg-bb269645d988 = Kshana roll

# text
seg-76c0861cbe83 = Riistvara

# text
seg-92ab27525ed1 = RF-kiirgus

# text
seg-c822f981cfcf = Värav

# text
seg-00727bb577f9 = Seis versioonis { "0.38" }

# text
seg-1c566ec98a03 = Failid: taasesituslogid, IQ, bench-eksport, otse-NMEA või UBX stdin-i, TCP või UDP kaudu

# text
seg-0435986aa760 = tarnitud

# text
# c1: iq monitor --follow
seg-56b9a4399108 = Passiivne vastuvõtt: vastuvõtjad ainult lugemiseks; ajastuslogid (linuxptp, chrony, TICC); IMU CSV; <c1/> kasvaval SigMF-failil

# text
seg-608fc0a99107 = kasutaja vastuvõtjad, suurmeister (grandmaster), SDR vastuvõtus

# text
# c1: --configure
seg-786d9e5ccf93 = iga vastuvõtjasse tehtav konfiguratsioonikirjutus nõuab selgesõnalist <c1/>; vaikimisi on ainult lugemine

# text
# c1: holdover-test
# c2: iq monitor --follow
seg-ab8874046283 = osaliselt tarnitud: ajastuslogi vormingud, <c1/>, <c2/>; jadavastuvõtja sisend on kavandatud

# text
seg-6b0a194d3f64 = Laboriorkestreerimine ilma Kshana RF-ita: katsetingimuste spetsifikatsioon, operaatori sammud (antenni eemaldamine, simulaatori käivitamine) küsitud ja ajatembeldatud, ringteekonna hindamine ja tõendid

# text
seg-8e2847bce9ac = labori enda simulaatorid, varjestatud kastid

# text
seg-121fe22c92ec = ainult <b>labori</b> simulaatorist, juhtmega

# text
# c1: lab-attestation
seg-0a704c5443c5 = allkirjastatud <c1/> (allpool) salvestatakse tõendipaketti; Kshana keeldub ilma selleta laborikäivitust hindamast

# text
seg-9e94d44cd197 = kirje on tõendipakettides realiseeritud; keeldumist ilma selleta hindamast veel ei ole (laborikäivituse käsku ei ole)

# text
seg-ee5333e346ad = <b>Seaduslike</b> GNSS-i IQ-stseenide juhtmega taasesitus: Kshana kirjutab stseenifaili ja kasutaja esitab selle oma tööriistaga uuesti kaabli kaudu, millel on sumbistid ja testitav seade RF-kestas

# text
seg-fa5b0f1b41f7 = kasutaja SDR, sumbistid, kest

# text
seg-9049203a2a6e = ainult juhtmega, kasutaja vastutus

# text
seg-b4392e583cb8 = avatud mootoris ei ole saatekoodi; häire- ja spuufimislainekujud jäävad ulatusest välja; ekspordikontrolli läbivaatus; jurist

# text
seg-ced2afbf108f = ei kuulu avatud mootorisse; kommertsväljaande ülesanne, mida tuleb teha juristiga

# text
seg-0f8a0fce4d20 = Reaalajas suletud ahelaga RF-riistvara silmuses (hardware-in-the-loop)

# text
seg-d109f8e36ce8 = partneri seadmestik

# text
seg-fb26b352f56e = partner

# text
seg-38c768d5faa7 = integreerida selle asemel etapi { "2" } spetsifikatsiooni kaudu

# text
seg-458f37b807ba = ei ole kavas

# text
seg-2e59d363e31b = „Tarnitud“ tähendab, et kood on selles väljalaskes olemas. Midagi selles tabelis ei väida, et ühtegi etappi oleks kasutatud ühegi partneri, labori või ametiasutusega; ühtegi ei ole.

# text
seg-1524fb5b0aba = Põhimõtted

# text
seg-82b8ed15bbe6 = Toode on vastuvõtt ning edastamine ei kuulu kunagi avatud koodi.

# text
seg-63c000eccfc2 = Iga riistvaraseanss annab tõendipaketi, milles on sisendite, tingimuste ja kasutatud lävendite räsid.

# text
seg-63cc5d9513ff = Juhtmega või varjestatud seadistuse atesteering salvestatakse, seda ei järeldata kunagi.

# text
seg-da1e4f5da956 = Riistvarast pärit arvud jäävad <b>MODELLED</b>, kuni sõltumatu väline sõltumatu etalon nõustub (näiteks labori tõeline trajektoor või etalonkell). Eelregistreeritud lävi ei lõdvendata pärast käivitust.

# text
seg-d8e445427d02 = Kontrollitud suunadiagrammiga antenne, inertsiaalseadmeid ja kiibimõõtmelisi aatomkellasid käsitletakse andmeallikatena (suunadiagrammid, logid, avaldatud stabiilsuskõverad), mitte seadmetena, mida Kshana juhib.

# text
seg-7a22a9591fa3 = Sõnastus: tulemus on „mõõdetud maski suhtes“ või „toetab tõendeid (supports evidence for)“ nõude kohta. Kshana ei väida, et seade täidab standardi nõudeid, ning keegi ei ole seda hinnanud ega heaks kiitnud.

# text
seg-913509e5d6b2 = Õiguslikud märkused (omaniku õigusülevaatus ootel)

# text
seg-c18b68936406 = GNSS-i signaalide vastuvõtmine on seaduslik peaaegu kõikjal. GNSS-i sagedusaladel edastamine ei ole.

# text
seg-070d8a8d5494 = <b>Ameerika Ühendriigid.</b> Tahtlik raadiosidehäirimine on keelatud seaduse { "47" } U.S.C. §{ "333" } alusel ning FCC võtab segajate vastu jõustamismeetmeid (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Laboripingilt (bench) edastus võib ulatuda pingist kaugemale.

# text
seg-336b48c6f5f2 = <b>Mujal.</b> Hoidjad ei ole teiste riikide õigust läbi vaadanud. gps-sdr-sim-i ümber olev kogukond väidab, et selle väljundi edastamine on enamikus riikides seadusega keelatud; seda tuleks pidada tööeelduseks kõikjal, kus jurist ei ole öelnud teisiti.

# text
seg-8d31cbd38718 = <b>Varjestatud või juhtmega seadistus on kaitsemeede, mitte litsents.</b> Allolev atesteering salvestab kaitsemeetme, mis operaatori sõnul oli rakendatud. See ei muuda kiirgust seaduslikuks.

# text
# c1: iq monitor --follow
seg-7373bfd21035 = <b>Salvestamine.</b> Raadiosignaalide salvestamine võib mõnes kohas tekitada privaatsus- ja seaduslikkuseküsimusi. <c1/> ja iga püüdmisretsept on ainult vastuvõtvad ning operaator vastutab selle eest, kus ja mida ta salvestab.

# text
seg-2edf9b14e62c = <b>Ekspordikontroll.</b> Riistvara silmuses (hardware-in-the-loop) tarkvara, mis juhib signaaligeneraatoreid, võib kuuluda ekspordikontrolli reeglite alla. Seepärast jääb etapp { "3" } avatud mootorist välja.

# text
seg-bcd59f201022 = <b>Siin ei ole midagi toetuskiitust ega kokkulepet.</b> Ühegi reguleerija, katsepolügooni, labori ega tarnijaga ei ole selle dokumendi kohta konsulteeritud ning ükski neist ei ole millegagi siin nõustunud.

# text
# c1: lab-attestation
seg-81091020e648 = Väli <c1/>

# text
# c1: lab-attestation
seg-64918fd6895d = Etapi { "2" } ja kõrgema puhul kannab laboriseadmeid hõlmanud käivitus objekti <c1/>, mis salvestatakse tõendipaketti sisendite räside kõrvale. See on nimetatud operaatori väide, mitte mõõtmine, ning Kshana seda ei kontrolli.

# text
seg-3bf153c63fa3 = Mis on realiseeritud versioonis { "0.38" }:

# text
# c1: kshana receiver-trust evidence ... --lab-attestation <file.toml>
# c2: manifest.json
# c3: lab_attestation
# c4: evidence_create
# c5: lab_attestation_toml
# c6: create_evidence_pack
seg-bf212e141046 = <c1/> valideerib faili ja salvestab atesteeringu paketi failis <c2/>. Manifesti katab paketi Ed25519 allkiri, mistõttu kirjet ei saa muuta kontrollimist katkestamata. Sama on saadaval Pythoni <c4/> argumendina <c3/> ja MCP tööriista <c6/> argumendina <c5/> (brauseriversioon pakette ei loo).

# text
seg-431036f13a37 = Pakett, mis tehakse ilma atesteeringuta, on bait-baidilt selline, nagu see oli varem.

# text
# c1: kshana evidence verify
seg-4360b8fbdafb = <c1/> teatab atesteeringust ja ütleb, et see on „attested by the named operator; not verified by Kshana“.

# text
# c1: setup
# c2: conducted
# c3: shielded
seg-438bbe788314 = Atesteering, mis on mittetäielik või mille <c1/> ei ole ei <c2/> ega <c3/> (õhu kaudu tehtav seadistus ei ole laborikäivitusena aktsepteeritav), lükatakse tagasi ja paketti ei tehta.

# text
seg-c8c40ed88dde = Mis <b>ei</b> ole veel realiseeritud: etapi { "2" } reegel, mille kohaselt Kshana keeldub <em>hindamast</em> laborikäivitust, millel puudub atesteering. Ükski käsk ei võta versioonis { "0.38" } laborikäivituse lippu, seega ei ole millestki keelduda; reegel lisandub koos laboriorkestreerimise käskudega. Atesteering salvestab operaatori väite kaitsemeetme kohta. See ei muuda ühtegi kiirgust seaduslikuks ega muuda tulemuse märgist: hinnatud laborikäivitus on MODELLED, kui just väline sõltumatu etalon ei nõustu.

# text
seg-b0db377bce58 = Mida see tähendab kaastöötajale

# text
seg-c2e215edd86c = Avatud mootorisse ei tohi lisada saatmisteed, saatmissõltuvust ega saatmisnäidet.

# text
seg-452b44a9ca8a = Ei tohi lisada lainekujugeneraatorit, mille väljund on taasesituseks mõeldud segamis- või spuufimissignaal.

# text
seg-4df4d15a5f1c = Uued riistvarasisendid on vaikimisi ainult lugemiseks; kirjutamine nõuab selgesõnalist lippu ja rida selles failis.

# text
# c1: SURFACES.md
seg-ee5f1fa9b822 = Uus käsk, mis riistvaraga kokku puutub, lisatakse igale pinnale või märgitakse põhjendusega N/A failis <a1><c1/></a1> ning märgib siin oma etapi.

# text
seg-7d65c3565acd = <s1>Eelmine</s1>Kellalogi vormingud

# text
seg-82eb53d4efbd = <s1>Järgmine</s1>Terviklikkus ja turvalisus

# text
seg-8a78e520fc9e = Laboriatesteeringu väli
