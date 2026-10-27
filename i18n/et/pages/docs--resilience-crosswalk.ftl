# docs--resilience-crosswalk: translations (et)

# text
seg-88372b30ed79 = Piir

# text
seg-aab745a65e76 = Moodul

# text
seg-ad856ad710eb = Staatus

# text
seg-b03d56f501c3 = Liik

# text
seg-4dbf41c0ec3b = Funktsioon

# text
seg-f472e43c1100 = Mida see näitab

# text
seg-fa4468d4cb80 = Kättesaadavus

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-fe4d868448ef = Allikas: <c1/>

# text
seg-d745715d5332 = PNT-vastupidavuse raamistike ristviide

# text
# c1: VALIDATED
# c2: MODELLED
# c3: resilience::diversity
# c4: resilience::stats
seg-aa1c24d63df5 = <b>Joondatud, mitte hinnatud ega heaks kiidetud.</b> See kaardistab Kshana simuleeritud võimekused avaldatud PNT-vastupidavuse (PNT: positsioneerimine, navigatsioon ja aeg) raamistikega. See on <em>simulatsioonist tuletatud eneseanalüüs, mis on joondatud</em> DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0, RethinkPNT/Firesmithi Resist-Detect-Respond-Recover (RDRR) mudeli ja Yang Yuanxi vastupidava PNT kriteeriumidega. See <b>ei ole</b> hinnang, heakskiit, akrediteering ega compliance-avaldus ning see ei kanna DHS-i, IEEE (Institute of Electrical and Electronics Engineers) ega ühegi asutuse toetust. Iga rida on sildistatud oma ausa kontrolliseisundiga (<c1/> välise oraakli (sõltumatu etalon) vastu või <c2/> esimestest printsiipidest koos testidega); vastupidavuse skoorimiskiht ise on <b>MODELLED</b>. Kaks selle tuuma kannavad oma VALIDATED ridu kontrollimaatriksis, pöördSimpsoni mitmekesisuse tuum (<c3/>) ja järjestusstatistika tuum (<c4/>); see valideerib aritmeetikat, mitte sellele ehitatud skoore.

# text
# c1: src/resilience/
# c2: src/verification.rs
seg-652fcf3ec12d = Skoorimismootor (<c1/>) tarbib neid võimekusi ja väljastab mõõtmepõhised alamskoorid, mitte kunagi ühte fantoomarvu. Masinkontrollitud olekuinvariantide kohta vt <c2/>.

# text
seg-7a71de89a9fd = DHS RPCF v2.0: mida raamistik defineerib ja Kshana enda alamskoori kategooriad

# text
seg-1985dbfe351d = Avaldatud raamistik (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } aprill { "2022" }, DHS Science and Technology Directorate koos CISA-ga) defineerib kolm <b>põhifunktsiooni</b> (jaotis { "5.2" }: Prevent, Respond, Recover), <b>vastupidavuse taset { "0" } kuni { "4" }</b> (jaotis { "5.3" }) ja <b>kaheksa nummerdatud miinimumnõuet</b>, mis jaotuvad tasemetele { "1" } kuni { "4" } (jaotis { "5.3" }, korratud jaotises { "5.5" }), pluss hindamislähenemise (jaotis { "8" }). See <b>ei</b> defineeri seitsme tehnikakategooria loendit. Selle lehe varasem versioon ja vastupidavusmooduli kommentaarid kirjeldasid seitset „RPCF technique categories“; sõnad Obfuscate ja Diversify ei esine versioonis v2.0. Selle dokumendi teksti loeti uuesti 2026-10-09 ja sellist loendit ei leitud.

# text
seg-178d1e119dce = Seitse alamskoori nime, mida skoorimismootor väljastab (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; „OLVIDMR“ on meie mnemoonika), on seega <b>Kshana enda skoorimiskategooriad</b>, mida hoitakse väljundi stabiilsuse nimel. Need ei ole DHS-i terminid ja allolevad read ei ütle, et DHS neid nõuab. Kui kategooria langeb kokku raamistiku nõudega, ütleb seda viimane veerg; kui mitte, ütleb see „none“.

# text
seg-5a9eb11bb965 = Kshana alamskoori kategooria

# text
seg-e117e6f71845 = Kshana võimekus, mida kasutatakse juhina

# text
seg-7677dafa7016 = Lähim RPCF v2.0 viide

# text
seg-27e0f6b39605 = Obfuscate

# text
seg-7327b9cbc106 = Deklareeritud tehnika × allika kvaliteet (otsest käitumuslikku juhti ei ole)

# text
seg-b63e61fa5fa2 = none (ennetustehnika; jaotis { "5.2" }, Prevent)

# text
seg-7ed4f2e21189 = Deklareeritud tehnika × allika kvaliteet

# text
seg-8579207ae2e5 = Verify

# text
seg-30b8cb030965 = Häirete detektori AUC (kõvera alune pindala) stsenaariumi all (spuufimise/segamise/meaconi monitorid)

# text
seg-3d358c029f50 = Tase { "2" } nõue { "4" }; tase { "3" } nõue { "7" }

# text
seg-fcb8cb7d4c97 = Isolate

# text
seg-b3cd355743da = Tase { "3" } nõue { "6" }

# text
seg-ffa87d149a20 = Diversify

# text
seg-1282685a888b = Sõltumatute rühmade arv → pöördSimpsoni efektiivne mitmekesisus

# text
seg-f0dd4c4ef1c5 = Tase { "4" } nõue { "8" }; jaotis { "5.5" } (ühisrežiim)

# text
seg-2d91b12a9e56 = Mitigate

# text
seg-d183b552df76 = Kättesaadavus keelamise all

# text
seg-c337df73e231 = jaotis { "5.2" }, Respond

# text
seg-2da4df22d35d = Recover

# text
seg-85d7e3292549 = Holdover-i libisemine × piiratud halvenemise värav

# text
seg-3aec9f076902 = Tase { "2" } nõue { "5" }; jaotis { "5.2" }, Recover

# text
seg-36958650abc0 = Nõuete kaupa vastavus tegelikule raamistikule, koos sellega, mille kohta Kshana väljund toetab tõendeid (supports evidence for), ja sellega, mis jääb üle, on failis <a1>compliance/dhs-rpcf.md</a1>.

# text
seg-a085dd81c769 = RethinkPNT / Firesmithi RDRR funktsioonid

# text
seg-1b972717180b = Juht

# text
seg-6eaf161f8871 = Resist

# text
seg-6046a8914dc7 = Alamskooride Obfuscate/Limit/Isolate/Diversify keskmine

# text
seg-242e2c01ebc2 = Detect

# text
seg-45c8da13581f = Verify alamskoor (detektori AUC)

# text
seg-d29232baaaa6 = Respond

# text
seg-36ab7ce187e6 = Mitigate alamskoor (kättesaadavus)

# text
seg-f98dc190541c = Holdover × piiratud värav; vastupidavuse ajajoone võtmetulemusnäitajad (KPI-d: tuvastamine/reageerimine/taastumine/kadu)

# text
seg-e7190928bed6 = Yang Yuanxi kriteeriumid (alamhulk, millest ajastuse/tuvastamise headusarvud räägivad)

# text
seg-52836e247425 = Kriteerium

# text
seg-cbbe4c0baf3f = Töökindlus

# text
seg-32d64f865b21 = Filtri terviklikkuse osakaal

# text
seg-214372f29bd1 = Pidevus

# text
seg-ad5e76a596b8 = Holdover × piiratud värav

# text
seg-d92fb15e6dfa = Täpsus

# text
# c1: fom::positioning_performance
seg-0de1f9119e0f = Ajastuse/kvaliteedi asendusnäitaja — <b>asukohamääramise täpsus ei kuulu skoori</b>. <c1/> teisendab antud asukoha kovariatsiooni ja HPL-i (horisontaalne kaitsetase) CEP/SEP/2DRMS-iks (ringvea tõenäosus, sfäärilise vea tõenäosus, kahekordne ruutkeskmine kaugus), kuid ükski stsenaarium ei anna seda vastupidavuse skoorile

# text
seg-0aa925a09499 = MODELLED (ainult ajastuse valdkond)

# text
seg-6b661e6e4399 = Mida see ristviide ei väida

# text
seg-51a48d0c718d = Ühtegi omistatud RPCF taset ei ole. Määratud tase on <em>esialgne, simulatsioonist tuletatud</em> lugemine selge piiratud halvenemise väravaga, mitte omistatud küpsus.

# text
# c1: pvt
# c2: gnss-ins
# c3: leo-pvt
# c4: integrity
seg-df73b7c76ae5 = Skoris ei ole asukohamääramise täpsust. Vastupidavuse alamskoorid on ehitatud ajastuse ja tuvastamise mõõdikutest. Mootor arvutab positsioone mujal (liigid <c1/>, <c2/> ja <c3/>) ja kaitsetasemeid (liik <c4/>), kuid skoorimiskiht neid ei tarbi.

# text
# c1: resilience::panel
seg-30a1b1a4dfea = Välivalideerimist ei ole. Etalonpaneel ja ohuansambel on sünteetilised, parameetritega põhjendatud taandamised (<c1/>), esitatud esmaklassilise piiranguna.

# text
# c1: resilience::study
seg-83c465cd78b0 = Kaasuuring (<c1/>) on olemas just selleks, et näidata, et nende mõõtmete kokkupressimine üheks liitskooriks või üheks tasemeks annab hinnangu, mille arhitektuuride järjestus on põhjendatavate kaalude ja ohuvalikute korral ebastabiilne — seega on see ristviide mõõtmiskiht, mida tuleb lugeda mõõtme kaupa, mitte üks hinne, mille vastu toodet hinnata.

# text
seg-32bd45dc031d = Vastupidavuse ja vertikaalsed stsenaariumid, mis neid kihte rakendavad

# text
seg-4e36adba1c55 = Allolevad kaasasolevad stsenaariumid käitavad ohu- ja taastumismehhanismi, millele ristviite read osutavad. Igaüks on nimetatud liigi tegelik jooks; iga üks on <b>MODELLED</b> (väliandmeid ei ole).

# text
# c1: scenarios/
seg-44664e49d449 = Stsenaarium (<c1/>)

# text
seg-44b8d7435bfd = Kihiline PNT ühise segamise/spuufimise ohu all: kihi keelamise algväärtustatud Monte Carlo, ellujäänute pöördhajuvuse liitmine, ühe kihi ja kihilise täieliku kao suhe ning kuidas korreleeritud keelamine selle suhte kokku varisetab. Selle Monte Carlo ja kinnise kuju ning liitmise identiteete kontrollitakse kasti-sisestes testides; liigil ei ole kontrollimaatriksi rida, seega hinnatakse seda siin MODELLED.

# text
seg-1734506ad287 = GNSS (ülemaailmne satelliitnavigatsioonisüsteem) segatud, madala Maa orbiidi (LEO) PNT kiht kannab kasutajat, terviklikkus säilitatud (kolm faasi ühel ajajoonel).

# text
seg-ff8cc090bdce = Üks segaja nelja ribaga vastuvõtja vastu; milline spuufimise monitor näeb millist spuuferit.

# text
seg-0a93502a4a19 = Segaja-signaali (J/S) varu vastuvõetud võimsusest.

# text
seg-f2230253bdff = Spuufimise tuvastamine Doppleri ja läbilennu geomeetria kooskõla abil.

# text
seg-d8ca900a8c14 = Tugijaamade ja kriitilise taristu ajastus holdover-is, LEO ajaga.

# text
seg-2a61d07bf177 = Maantee-, raudtee-, mere-, polaar- ja asjade interneti (IoT) kasutajad LEO kihiga.

# text
seg-8723073167ad = GNSS/INS (inertsiaalne navigatsioonisüsteem) surnud lugemine linnakanjonis ja segamise all väikesel pilootideta õhusõidukil.

# text
seg-6ee1ef707b20 = Kui kaua INS hoiab laeva või rongi oma piirides, kui GNSS on keelatud.

# text
seg-7ca913e1729b = Mereline segaja; spuuferi tuvastamine, mis lohistab laeva teatatud asukohta.

# text
seg-c49548e8393b = <s1>Eelmine</s1>DO-316 / DO-229E kaart

# text
seg-dedf3b53d31f = <s1>Järgmine</s1>Vastuvõtja usaldus
