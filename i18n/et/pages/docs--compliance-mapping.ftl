# docs--compliance-mapping: translations (et)

# attr:aria-label, text
seg-6555ff9a6d8e = Väljund

# text
seg-2247a2344710 = Tähendus

# text
seg-d6476863f862 = Võimekus

# text
seg-ad856ad710eb = Staatus

# text
seg-8d216d42c776 = Vastuvõtja logi usaldushinnang

# text
seg-ff808ce8ec48 = Alternatiivsed ja mitmekesised PNT allikad

# text
seg-3621a68a508c = Reprodutseeritav käituse päritolu

# text
seg-50fe2a3ff712 = Terviklikkuse seire ja kaitsetasemed

# text
# c1: docs/compliance/README.md
seg-554a16dc7965 = Allikas: <c1/>

# text
# c1: kshana compliance-report
seg-76db63e8d2de = Ostjad ja vastuvõtjate tootjad vastutavad avalike vastupidavusraamistike ees. See kaust seob selle, mida Kshana arvutab ja salvestab, nende raamistikega rida realt ning <c1/> täidab kaardistuse olemasolevatest käitustest.

# text
seg-e22a3aca9550 = <b>Sõnastus.</b> Kshana väljundid <em>toetavad tõendeid (supports evidence for)</em> nõude kohta. Need ei ole ühegi toote hinnang ega heakskiit ja ükski neist failidest ei ole hindamisasutuse avaldus; Kshana ei ole selline asutus. Nõude tekst on parafraseeritud, mitte kunagi reprodutseeritud.

# text
seg-2602c3f5aff6 = Raamistik

# text
seg-245fe1f87b08 = Fail

# text
seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

# text
seg-0f7279ffb619 = IMO juhis GNSS-i häirete kohta laevadel

# text
seg-f318176b86de = EASA juhis GNSS-i häirete kohta lennunduses

# text
seg-7939ac1eea3b = EL NIS2 direktiiv, artikkel { "21" }

# text
seg-f2eccc9b815f = EN { "16803" } (tasuline standard; ainult osade ja kataloogis nähtavate punktide numbrite kaupa)

# text
seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (jaanuar { "2023" })

# text
# c1: kshana standards-pack list
seg-499fc17fb83a = <b>Standardipaketid</b> ({ "0.38" }) muudavad raamistiku hinnatud stsenaariumideks: igal paketil on stsenaariumid, enne käitust määratud läved ja read, mille kohta see toetab tõendeid (supports evidence for). <c1/> näitab neid.

# text
seg-9c0eb89a2fbe = Pakett

# text
seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testiprofiilid tasemetele { "1" } kuni { "4" }

# text
seg-13e63b993f26 = IMO MSC.1/Circ.1575, laevapealne PNT andmetöötlus: täpsustasemed ja terviklikkus

# text
seg-aa77ffe0acbf = ICAO Doc { "9849" } lisa F, GNSS-i häirete seire, hindamine ja leevendamine

# text
seg-b9387be0e4f1 = Iga fail loetleb oma allikdokumendid koos versiooni, URL-i, lugemise kuupäeva ning sellega, mida kontrolliti ja mida mitte. Allikaid loeti 2026-10-09 (NIST-i profiili 2026-10-18; EASA bülletääni ja EN { "16803" } kataloogilehti kontrolliti uuesti 2026-10-10). Kui allikat sai lugeda ainult peegli või kataloogilehe kaudu, ütleb fail seda.

# attr:alt
seg-e98e25897176 = Kõik kolme hinnatud standardipaketi testid, mootori v{ $version } tegelikest käitustest (`kshana standards-pack run`): dhs-rpcf: { "6" } täidetud, { "1" } täitmata, { "2" } vajavad sisendit; imo-circ-1575: { "1" } täidetud, { "4" } täitmata, { "2" } vajavad sisendit; icao-doc9849-appf: { "6" } täidetud, { "0" } täitmata, { "2" } vajavad sisendit. Kokku { "13" } täidetud, { "5" } täitmata ja { "6" } vajavad sisendit, mida mootoril ei ole (vastuvõtja logi või seadmete dokumentatsioon). Iga lävi määrati enne käitust; möödalask jääb möödalaskuks. Täidetud lävi ütleb, et modelleeritud stsenaarium täitis määratud läve, mitte midagi toote kohta. Paketid toetavad tõendeid (supports evidence for) ridade kohta, mida need viitavad; need ei ole hindamine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus; seda ei tohi kasutada ainsa alusena ühegi navigatsiooni- ega ohutusotsuse tegemisel.

# text
seg-092dd691ca17 = Aruanne

# text
# c1: compliance-report.compliance.md
# c2: compliance-report.compliance.json
# c3: --out <base>
# c4: <name>.result.json
# c5: <name>.toml
# c6: kshana receiver-trust
# c7: kind
# c8: kind
# c9: scenario_hash
seg-10fac3e641e0 = kirjutab <c1/> ja <c2/> (<c3/> muudab nime). Sisendid on varasemate käituste tulemusfailid: stsenaariumi käitus kirjutab <c4/> faili <c5/> kõrvale ja <c6/> kirjutab oma. Iga käituse stsenaariumi liik loetakse tulemuse kõrval olevast stsenaariumifailist, receiver-trust tulemuse sisust või ülataseme stsenaariumi <c7/>-idst ning see peab olema mootorile tuntud stsenaariumi liik. Tulemus loetletakse kasutamata jäetuna koos põhjusega ja see ei loe mitte midagi, kui selle stsenaariumi liiki ei leita, see ei ole tuntud stsenaariumi liik või kõrvalolev stsenaarium ja tulemuse enda stsenaariumi <c8/>-id lähevad lahku. (Tulemuse <c9/> ja stsenaariumifaili räsi ei võrrelda: mootor arvutab esimese oma parsitud stsenaariumi põhjal ja faili räsi on teksti põhjal, seega on need erinevad suurused.)

# text
# c1: jamming
# c2: integrity
# c3: src/compliance/mapping.rs
# c4: KIND_FIELDS
seg-464351dcdcc3 = <b>Pelgalt stsenaariumi liigi silt ei ole tõend.</b> Käitus loeb võimekuse kasuks ainult siis, kui selle tulemus kannab ka välju, mida see stsenaariumi liik kirjutab (näiteks <c1/> tulemus vajab oma kvaliteedinäitajaid ja epohhipõhiseid ridu; <c2/> tulemus vajab oma valimite arvu). Väljad on loetletud failis <c3/> (<c4/>) ja tulemust, millel üks puudub, ei loeta. Räsi, mis ei ole kuueteistkümnendsüsteemis, ei esitata räsina. Receiver-trust tulemus, mille arvud ei ole täisarvud või mille tuvastatud või kokkulangevate arv ületab hinnatavate arvu, jäetakse välja ja loetletakse kasutamata jäetuna.

# text
seg-5a316d97f37b = Iga rea kohta annab aruanne ühe järgmistest:

# text
seg-2243532bd26b = iga võimekuse kohta, mida rida nimetab, on komplektis vähemalt üks käitus

# text
seg-e905ae20cec1 = mõne kohta on

# text
seg-e23d6dfc4a00 = ühegi kohta ei ole

# text
seg-cf223ce076ce = ükski Kshana väljund ei käsitle seda rida

# text
# c1: --mapping
# c2: --sources
seg-ec76997fb4d4 = Lünga veerg prinditakse igale reale, sealhulgas tõendatutele: käitus, mis toetab võimekuse kohta tõendeid (supports evidence for), jätab siiski suurema osa nõudest muu tõendi hooleks. Aruanne kordab oma alguses sõnastusreeglit. <c1/> prindib staatilised tabelid ja <c2/> allikate loendi.

# text
seg-f1c508a908ad = Receiver-trust käitused annavad ka arvud, mida need esitavad (tuvastatud sündmused hinnatavatest, kokku langevad ennustused hinnatavatest). Need kirjeldavad seda logi, hinnatuna enne käitust määratud sündmuste ja tolerantside vastu, ning neid esitatakse nii, nagu käitus neid esitab.

# text
seg-662b717575e0 = Käituste liigid

# text
seg-4377e24c36f5 = päris vastuvõtja enda logi epohhipõhine usaldusolek, häireajad ja kooskõla enne käitust määratud sündmustega

# text
seg-766182e85848 = Segamise lingieelarve mõjud

# text
seg-6bee09017be6 = kandja ja müra tihedus ning haardeolek satelliidi kaupa määratud segaja geomeetria korral

# text
seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

# text
seg-48fb757a45fc = Spuufimise ja meaconing’u tuvastamine

# text
seg-2e4a3355a936 = detektori otsused ja detektori eristusvõime määratud spuufimisrünnaku korral

# text
seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

# text
seg-e9a55e5a015b = kaitsetasemed, kättesaadavus häireläviede suhtes ja vea tuvastamise tulemused

# text
seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

# text
seg-6344bf03463c = Holdover ja libisemine

# text
seg-a643345646c3 = asukoha- või ajavea kasv, kui GNSS on keelatud, määratud läve suhtes

# text
seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

# text
seg-97e06c8a9b7f = navigatsiooni- või ajastustoimivus allikatest, mis on esmasest GNSS-i sagedusribast sõltumatud

# text
seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

# text
seg-25291db2798d = Vastupidavuse hindamine ohuansamblite üle

# text
seg-9eef8dd0d9b9 = ellujäämise ja vastupidavuse suhted ohuvektori kaupa määratud ansambli üle, eeldused öeldud

# text
seg-bdaa039247bd = conflict-resilience, campaign

# text
seg-e4be26a0cc63 = stsenaariumi räsi, mootori versioon ja algväärtus, mida kannab iga tulemus, et käitust saaks korrata

# text
# c1: scenario_hash
seg-89edc36c3560 = iga käitus, mille tulemus kannab välja <c1/>

# text
seg-488aeabdc552 = <s1>Eelmine</s1>Vastuvõtja käitamine stsenaariumi vastu

# text
seg-53a872636d5a = <s1>Järgmine</s1>US DHS vastupidava PNT raamistik
