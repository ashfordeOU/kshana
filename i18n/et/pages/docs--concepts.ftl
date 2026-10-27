# docs--concepts: translations (et)

# text
seg-501402fc366f = Kella holdover

# text
seg-9c0eb89a2fbe = Pakett

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Allikas: <c1/>

# text
seg-8ab3fd09812d = Mõisted — lihtkeelne sissejuhatus

# text
seg-0f86d0a815d2 = See leht selgitab, <em>mida Kshana teeb ja miks</em>, alustades nullist ja ehitades üles füüsikani. Esimese osa jaoks ei eeldata eelteadmisi; hilisemad jaotised lisavad spetsialistidele täpsed seosed. Sõna-sõnalt definitsioonide jaoks vt <a1>sõnastikku</a1>.

# text
seg-34f76bad58cb = { "1" }. Probleem ühes lõigus

# text
seg-45c0199e2224 = Peaaegu kõik, mis peab teadma, <em>kus see on</em> või <em>mis kell on</em> — telefonid, õhusõidukid, laevad, satelliidid, elektrivõrgud, finantssüsteemid — tugineb navigatsioonisatelliitide signaalidele (GPS (Global Positioning System) ja selle sugulased, ühiselt <b>GNSS</b> (ülemaailmne satelliitnavigatsioonisüsteem)). Need signaalid on nõrgad ja kergesti kaduvad: segatud, blokeeritud või lihtsalt kosmoses vaatevälja kaugusel. Kui see juhtub, peab süsteem <b>ise edasi toimima</b>, kasutades pardasensoreid — kella aja hoidmiseks ja inertsiaalsensoreid liikumise jälgimiseks. Küsimus, millele Kshana vastab, on lihtne sõnastada ja raske mõõta: <b>kui kaua ja kui hästi see suudab edasi toimida?</b>

# text
seg-ea1895772e76 = { "2" }. Miks „kvant“?

# text
seg-dd6871645f37 = Pardasensorid triivivad. Kell kaotab aeglaselt aega; inertsiaalsensor kaotab aeglaselt asukoha jälje. <b>Kvant</b>kellad ja -inertsiaalsensorid triivivad <em>palju aeglasemalt</em> kui tänapäeval kasutatavad klassikalised osad — nii et sõiduk võiks libiseda läbi palju pikema GNSS-i katkestuse, püsides oma täpsuspiirides. See eelis on kvant-PNT (positsioneerimine, navigatsioon ja aeg) kogu lubadus. Kuid „palju aeglasemalt“ tuleb muuta <b>arvudeks</b>: mitu lisaminutit holdover’it? mitu meetrit vähem triivi? Need arvud otsustavad, kas kvantkoormus on oma maksumuse, massi ja võimsuse väärt.

# text
seg-a5d9dc0fb159 = { "3" }. Mida Kshana tegelikult teeb

# text
seg-cb3a35ba696f = Kshana on <b>simulaator</b>, mitte riistvara ega riistvara disain. See:

# text
seg-cb7fdaf6738b = Võtab <b>stsenaariumi</b> — ajajoone koos GNSS-i katkestuse lõiguga ja sensori avaldatud toimivusnäitajatega.

# text
seg-701c8c6d0e55 = Juhib <b>sensori veamudelit</b> läbi selle ajajoone: kuni GNSS on kättesaadav, on mudel distsiplineeritud tõe külge; katkestuse ajal jookseb see vabalt, kogudes viga täpselt nii, nagu füüsika ütleb.

# text
seg-bc68e3d54e4c = <b>Hindab</b> tulemust töönäitajate kvaliteedinäitajate vastu (kui suureks viga kasvab, kui kaua see püsib nõuete piires, kui usaldusväärne hinnang on).

# text
seg-32d31a9beb71 = Sensoripakettide puhul teeb seda <b>kaks korda</b> — üks kord kvantsensorile, üks kord selle klassikalisele vastele — <em>samal</em> stsenaariumil, nii et võrdlus on õunad õuntega.

# text
seg-07d8c6eb84e9 = Olulisel kohal: mootor ei tea midagi „kvandist“ vs „klassikalisest“. Mõlemad on lihtsalt veamudelid erinevate (avaldatud, tsiteeritud) parameetritega. Väljundis nähtav erinevus on avaldatud füüsika erinevus — midagi ei ole käsitsi häälestatud ühe poole kasuks.

# text
seg-e20a7d3f32dc = { "4" }. Neli ehituskivi („paketti“)

# text
seg-638b8d451550 = Sensor

# text
seg-f891ee876b96 = Millele see vastab

# text
seg-d1b122c389d4 = aatomkell

# text
seg-768230c2eb02 = Kui kaua püsib <em>aeg</em> täpsena ilma GNSS-ita?

# text
seg-029de6b99be0 = Inertsiaalne dead-reckoning

# text
seg-f66f2d7b1d6d = kiirendusmõõtur (+ güroskoop)

# text
seg-e067a035f656 = Kui kiiresti triivib <em>asukoht</em> ilma GNSS-ita?

# text
seg-9ef8f99ca6e4 = Aja edastamine

# text
seg-1267f82791f9 = optiline / RF (raadiosagedus) link

# text
seg-6f240700790d = Kui täpselt saavad kaks aparaati aega jagada?

# text
seg-90be2a6a29b1 = Hübriidliitmine

# text
seg-780cf1f1127e = kõik ülaltoodud

# text
seg-6080a05ace19 = Kas <em>kombineeritud</em> PNT lahend peab vastu?

# text
seg-3f74a708a746 = Hübriidpakett on kokkuvõttev tipp: navigatsioonilahend vajab <em>nii</em> head aega <em>kui ka</em> head asukohta. See näitab, et optiline ajastuslink võib hoida lukus isegi tagasihoidlikku kella — mis tähendab, et <b>inertsiaal</b>sensorist saab nõrgim lüli ja just seal tasub kvantkiirendusmõõtur ennast ära.

# text
seg-5f55bb0fd7c5 = Lisaks neljale paketile

# text
# c1: kshana kinds
seg-60191a2cd150 = Sama mootor käitab palju rohkem stsenaariumi <em>liiki</em>; <c1/> loetleb need kõik. Need ulatuvad sensoritest kaugemale signaalideni ja geomeetriani, millest sensorid sõltuvad:

# text
seg-995ed414d83d = <b>Kus satelliidid asuvad</b> — orbiidi levitamine, konstellatsiooni kavandamine Maa, Kuu või mõne muu keha ümber ning Päikesesüsteemi kehade asukohad.

# text
seg-bc8abce2a748 = <b>Mida vastuvõtja näeb</b> — asimuudist sõltuv silmapiir (tänav, kai, fjord) kõrgusmaski kohal ja taevageomeetria, mille see jätab: nähtavad satelliidid, nende täpsuse halvenemise tegur ja veaellips.

# text
seg-b7a2c252c41c = <b>Mida vastuvõtja kuuleb</b> — L-riba spekter segaja korral, segamine ja spuufimine ning jälgimissilmuse haardekadu.

# text
seg-f354743045c4 = <b>Kas vastust saab usaldada</b> — terviklikkuse seire (RAIM, vastuvõtja autonoomne terviklikkuse seire, ja selle täiustatud vorm ARAIM) kaitsetasemetega.

# text
seg-69aa01a29a49 = <b>GNSS-i alternatiivid</b> — gravitatsiooni- ja maastikukaardi sobitamine ning positsioneerimine, navigatsioon ja aeg madala Maa orbiidi (LEO) satelliitidelt, signaali disainist läbi lingieelarve ja navigatsioonisõnumi asukohalahendini.

# text
seg-297c98214b5b = <b>Võrkude ajastus</b> — telekomi holdover rahvusvaheliste maskide vastu kontrollituna ja ajapesa ajastus ajaindekseeritud ajakavade jaoks.

# text
seg-7eba216a9bf2 = <b>Väljaspool Maad</b> — Kuu aeg ja tugisüsteemid, Kuu teenindusmahud ja Marsi releenavigatsioon.

# text
seg-b796f49570ed = <b>Palju käitusi korraga</b> — kampaaniad ahelavad liike ühel ajajoonel, pühivad parameetrit või käitavad Monte Carlo ansamblit.

# text
seg-ef7f4e025018 = { "5" }. Aus ülesehituse poolest

# text
seg-65fb8703baf9 = Simulaator on kasulik ainult siis, kui seda saab usaldada. Kshana on ehitatud nii, et saab:

# text
# c1: provenance
seg-de8fd160db6d = <b>Iga parameeter on tsiteeritud.</b> Iga sensori näitaja kannab stringi <c1/>, mis nimetab andmelehe või artikli, kust see pärineb. Anonüümseid konstante pole.

# text
seg-09d5cd11b127 = <b>Iga mudelit kontrollitakse õpikuseose vastu,</b> mitte ainult iseenda vastu — nt simuleeritud kella Alani hälve peab ühtima avaldatud stabiilsusnäitajaga ja inertsiaaltriiv peab ühtima standardse vea kasvu seadusega. Võimekust nimetatakse <em>valideeritud</em> ainult seal, kus sõltumatu väline oraakel (sõltumatu etalon) (tegelik andmestik, sõltumatu realisatsioon või avaldatud etalonvektorid) nõustub; ülejäänu on <em>modelleeritud</em>, ja <a1>kontrollimaatriks</a1> ütleb, mis on mis.

# text
seg-ccb5b2fe93c4 = Küpsus on sildistatud.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> märgib iga efekti kui <c1/>, <c2/> või <c3/> ning ütleb selgelt, et optiliste kellade näitajad on <em>laboratoorsed / kosmose eesmärgi</em> arvud — ükski strontsiumi optiline kell ei ole lennanud.

# text
seg-de463596fcdb = <b>Tulemused on reprodutseeritavad bitini:</b> sama stsenaarium, algväärtus ja versioon annavad samal platvormil alati identse vastuse; operatsioonisüsteemide vahel ühtivad näitajad suhtelise täpsusega { "1e-6" } (vt <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. Füüsika spetsialistidele

# text
seg-8fc6db9faf83 = Seosed, mida Kshana realiseerib ja testib (täielik üksikasi ja tolerantsid failis <a1>VALIDATION.md</a1>):

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Kella holdover.</b> Kaheolekuline faasi/sageduse mudel valge sageduse modulatsiooniga (valge FM, võimsusspektri tihedus <c1/>), juhusliku käimise FM (<c2/>), flicker-FM (logaritmiliselt jaotatud Ornstein–Uhlenbecki protsesside summa, kalibreeritud lameda Alani põhja järgi) ja deterministliku vananemisega. Valideeritud kattuva Alani hälbega avaldatud <c3/> vastu (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Inertsiaalne dead-reckoning.</b> Kiirendusmõõturi jääknihe → <c1/>; kiiruse juhuslik käimine → <c2/>; valikuline güroskoobi nihe ja nurga juhuslik käimine tekitavad kaldevea, mis seob gravitatsiooni (<c3/>) horisontaalse kiirendusega (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Aja edastamine.</b> Valge ajastusvärin → sünkroniseerimise korduvtäpsus → ühesuunaline kaugusmõõtmine (<c1/>, { "1" } ps ≈ { "0.3" } mm); valimi keskmine keskmistub kui <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Liitmine ja terviklikkus.</b> Kaheolekuline Kalmani filter, mille protsessimüra vastab tõe mudelile; libisemisel kasvab selle faasivea dispersioon täpselt väärtuseni <c1/> — analüütiline holdover’i seos — ning selle 1-σ piir toidab Terviklikkuse kvaliteedinäitajat.

# text
seg-80daa7cb8641 = <b>Geomeetria.</b> Kepleri kahe keha levitamine (valikuliselt sekulaarse J2-ga) või SGP4 (Simplified General Perturbations { "4" }) reaalsetest kahe rea elemendikomplektidest, Walkeri konstellatsioonid ja vaatejoone nähtavus (Maa varjutus + kõrgusmask) tuletavad GNSS-i kättesaadavuse orbitaalgeomeetriast käsitsi kirjutatud akende asemel.

# text
seg-4ce4c6b79b93 = { "7" }. Kuhu edasi

# text
seg-7c8344a26230 = Läbitöötamiseks: <a1>õpetused</a1> — kolm läbitöötatud näidet + astmelised harjutused.

# text
seg-277f1b435cf6 = Käivitamiseks: vt <a1>README</a1> kiirstart.

# text
seg-c349981bd4f1 = Struktuuri mõistmiseks: <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Mis on ja mis ei ole valideeritud: <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Mõiste otsimiseks: <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Eelmine</s1>Ülevaade

# text
seg-2f14e84bfc99 = <s1>Järgmine</s1>Sõnastik
