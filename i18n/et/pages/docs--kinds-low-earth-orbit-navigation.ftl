# docs--kinds-low-earth-orbit-navigation: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
seg-867f3e41b5ab = LEO navigatsioonisõnum: madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja satelliidi edastatav efemeriid ja kell, mis tahes orbiidi, kandja ja mudeli jaoks, valikuliste nimetatud eelseadetega (Xona Pulsar, Iridium, Starlink, CentiSpace, esindussüsteem C-sagedusalas, ATOMIC nullkella mudel, Celeste IOD). SISU: lisaandmed (SVID, andmeväljaanne, sagedusala, signaali tervis), sünkroniseerimine (nädal, nädala aeg, teise järgu kellapolünoom af0-af2 ümber toc), efemeriid ühes neljast mudelist -- Galileo OS SIS ICD 16 parameetriga Kepleri komplekt; see komplekt pluss piki-, risti- ja radiaalsuunalised parandpolünoomid; Liu et al. { "2025" } 22 parameetriga mudel; ECEF-polünoom ilma kellaliikmeteta (ATOMIC nullkell) -- ja muud teenused (Klobucharu edastuskomplekt, NeQuick-G ai0-ai2 efektiivse ionisatsioonitasemega ning süsteemiaja ja UTC parameetrid ICD liigsekundi loogikaga). SOBITI: tõeorbiit, mis on integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning algväärtusega (seed) vaba või juhitud kell; Kepleri komplekti Levenbergi-Marquardti sobitus mitteosutavatel elementidel, seejärel lineaarne vähimruutude parandpolünoomid; kell sobitatud kasutaja lisatud relativistlikku liiget arvestamata. ANALÜÜSID: fit-interval-trade (signaal-ruumis vahemaaviga, SISRE, globaalselt keskmistatud kaaludega orbiidi kõrguse jaoks, sõltuvalt sobitusintervallist ja uuendusperioodist, ainult orbiit ja koos kellaga), model-comparison (neli mudelit, parameetrite arv, kodeeritud bittide arv ja Kshana sobitus Liu et al. kõrgustel avaldatud arvude kõrval), midpass-update (kasutaja kohal kõrgeim läbilend, iga sõnumivahetuse asukoha, kella ja kasutajavahemaa hüpe, halvima geomeetria hüpe, PASS/FAIL pidevuse läve suhtes), encode-decode (Kshana enda dokumenteeritud kahendkaader CRC-24Q-ga, väljapõhine poolsammu kvantimiseelarve, rikutud kaadri kontroll, RINEX-4-laadse kirje eksport ja import, mida nimetatakse Kshana laiendiks, ja CSV-tabel). VALIDATED: SISRE kaalud avaldatud MEO/GEO tabeli vastu (Montenbruck et al. { "2018" }); Galileo kasutajaalgoritm RTKLIB vastu tegelikel Galileo edastatud efemeriididel; CRC-24Q oma kataloogi kontrollväärtuse ja RTCM { "1005" } näitekaadri vastu. MODELLED: iga sobituse ja SISRE arv on esitusviga Kshana integreeritud tõe suhtes (ilma orbiidi määramise või ennustamise veata); Liu et al. võrdlus kasutab teisi orbiite; kodeeringu- ja tekstivormingud on Kshana omad.

# attr:alt
seg-35e92abc6a23 = Mootori joonistatud diagramm failile scenarios/leo-navmsg-celeste-iod.toml, liik leo-navmsg

# text
seg-c3861f7d717c = LEO läbilend ja lingieelarve sagedusala kaupa LEO-PNT jaoks (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt), süsteemist sõltumatu: kasutaja (maapealne, mere-, õhu- või siseruumides, paiksel või liikuv) ja üks või mitu LEO satelliiti, mis pärinevad DESIGNED PASS (projekteeritud läbilend: ringorbiit, mis on paigutatud nii, et kasutaja näeb ühte valitud maksimaalse elevatsiooniga läbilendu valitud ajal, soovi korral päikesesünkroonne), selgetest ELEMENTS (elementidest), TLE-st (kaherealine elemendikomplekt) mootori SGP4 kaudu või WALKER konstellatsioonist, mis on ehitatud konstellatsiooni kavandamise koodiga (kõrgeimad läbilennud esitatakse). Sagedusalad tulevad nimetatud eelseadest (üldine mitmesagedusala UHF/L/S/C, üldine C-sagedusala, Xona Pulsar X1/X5, Iridium STL, Starlink ainult Doppleri võimaluse signaalina, CentiSpace ja valikuline Celeste IOD eelseade, mis on märgitud WORKSHOP) või kirjutatakse stsenaariumisse; iga eelseade ütleb, kas selle arvud on PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP. Satelliidi, sagedusala ja epohhi kohta: elevatsioon, asimuut, vahemaa, vahemaa muutumiskiirus ja vahemaa kiirendus; vabaruumi levikadu; EIRP ja satelliidi mustri võimendus (isovoog, Gaussi kiir või lame); kasutaja antenni võimendus elevatsiooni suhtes (plaaster-, poolkera- või isotroopne); gaasiline sumbumine (ITU-R P.676-10 Annex { "2" }), vihmasumbumine (ITU-R P.838-3 koefitsiendid ja P.618-14 protseduur, vihmakiirusest ja vihma kõrgusest), troposfääri sähvimine (ITU-R P.618-14 section { "2.4.1" }), hoonesse sisenemise kadu siseruumi kasutajale (ITU-R P.2109-2), polarisatsiooni mittesobivus, süsteemi müratemperatuur ja C/N0 (kandja ja mürategiheduse suhe); Doppler ja Doppleri kiirus suletud kujul vahemaa muutumiskiirusest ja vahemaa kiirendusest, mõlemad kontrollitud tsentraalsete vahedega; esimest järku ionosfääriline viivitus { "40.3" } STEC/f^{ "2" } Klobucharist või vertikaalse TEC kaldsest TEC-ist, skaleeritud satelliidi alla jääva ionosfääri osale. Sagedusalade paaridele antakse ionosfäärivabad koefitsiendid, müra võimendus ja koodimüra läbilennu tipul. MEO GNSS satelliite (Galileo või GPS eelseaded) hinnatakse sama antenni ja müramudeliga nende liidesedokumentide vastuvõetud võimsustest, nii et LEO kellukujuline läbilend ja lamedad GNSS kandjad jagavad ühte graafikut. Valikuline [iot] sektsioon annab aja esimese fikseeringuni, fikseeringu energia ja aku eluea töötsükli suhtes kindlaksmääratud vastuvõtja võimsuseelarve korral (MODELLED). Iga sagedusalade paar annab ka kaldse TEC, mille selle geomeetriavaba kombinatsioon tipus taastab, ja selle hinnangu koodimüra sigma (ionosfääri sondeerimine). Valikuline [spoofer] sektsioon võltsib väidetava asukoha signaale, mis hüppab või lükatakse tegelikust algusmomendi järel, ja käitab kahte monitori kindlaksmääratud valehäire ja tuvastamata jäänud sündmuse tõenäosustega: Doppleri ja läbilennu geomeetria kooskõla (mõõdetud vahemaa muutumiskiirused võrrelduna orbiitidest ning sõltumatust eelnevast asukohast ja kiirusest ennustatutega, üldistatud vähimruutude hii-ruut test akna üle, GNSS, LEO ja kõigil kanalitel) ja sagedusalade vaheline kooskõla (iga LEO sagedusalade paari mudelkorrigeeritud geomeetriavaba kombinatsiooni epohhist epohhi samm), esitades epohhipõhised statistikud ja selle, millal iga monitor tuvastab (MODELLED). VALIDATED komponendid: vabaruumi kadu, P.838-3 koefitsiendid selle Table { "5" } vastu, P.618-14 vihma ja sähvimise protseduurid ning P.2109 hoonesse sisenemise kadu ITU-R Study Group { "3" } valideerimisnäidete vastu, IS-GPS-200 L1/L2 rühmaviivituse suhe ning ringorbiidi paikse kasutaja maksimaalne Doppler arXiv { "2509.19551" } Table { "1" } vastu. MODELLED: EIRP-d, mustrid, TEC-i Chapmani osa satelliidi all ja kogu läbilend.

# attr:alt
seg-02ae51cfada6 = Mootori joonistatud diagramm failile scenarios/leo-pass-iridium.toml, liik leo-pass

# text
seg-81d1604171a5 = Üks LEO-PNT (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt) süsteem otsast lõpuni, mis tahes konstellatsiooni ja signaali jaoks: signal_design nimetatud leo-signal kavand (avalik eelseade või sisemine [signal] kavand) määrab [pass] sagedusala keskme, ribalaiuse, kiibisageduse ja EIRP jaotuse, leo-pass lingieelarve annab jälgitud C/N0 ja ribapiiratud koodi värina üle läbilennu, sin(elevatsioon) järgi C/N0 sirge ja [navmsg] sõnumi edastatud SISRE (sobitatud läbilennu satelliidi kõrgusel) toidavad iga LEO süsteemi [fusion] leo-pvt ühisfikseeringus ja valikuliselt [ppp] leo-ppp juhtumeid; iga üleandmine on loetletud oma väärtuse ja ühikuga. MODELLED.

# attr:alt
seg-abe0599498c9 = Mootori joonistatud diagramm failile scenarios/leo-pnt-end-to-end.toml, liik leo-pnt-chain

# text
seg-32a570f1a4fa = Täpse punktpositsioneerimise (PPP) koondumine ainult GNSS-iga ja LEO täiendusega: ujuv laiendatud Kalmani filter ionosfäärivabal koodil ja kandelaine faasil koos paiksete jaamakoordinaatidega, valge vastuvõtjakell, üks süsteemidevaheline nihe iga lisasüsteemi kohta, juhusliku kõnnaku seniidi märgviivitus, mis on kujutatud teguriga 1/sin(elevatsioon), ja ujuv mitmetähenduslikkus satelliidikaare kohta; täpne orbiidi ja kella viga on valge ning satelliidi koodile ja faasile ühine, nii et iga satelliit on üks korreleeritud kaherealine uuendus Josephi stabiliseeritud kujul. Mõõtmised simuleeritakse samast mudelist algväärtusega (seed) müraga mitme jaama ja algväärtuse (seed) korral ning iga juhtum (esimesena ainult GNSS, seejärel iga LEO süsteemide [[case]], mis tahes konstellatsioon või eelseade) esitab koondumisaja mediaani (esimene epohh, mille järel horisontaalne ja vertikaalne viga jäävad allapoole lävesid, vaikimisi { "10" } cm), koondunute osa, vea mediaankõverad ja filtri kooskõla (käivituste keskmine asukoha NEES kahepoolse { "95" }% hii-ruut riba suhtes). Valikuliselt avaldatud Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) keskmiste laiuskraadide arvude kõrval: { "9.6" } min multi-GNSS-i puhul lüheneb väärtuseni { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min vastavalt { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga. MODELLED: trendi kooskõlavõrdlus, mitte selle uuringu konstellatsioonide, müra või jaamade reprodutseerimine; ei ole täisarvuliste mitmetähenduslikkuste lahendamist, tsüklihüppeid, faasi mähkumist, looteid ega ajas korreleeritud tooteveasid.

# attr:alt
seg-225ef04c64af = Mootori joonistatud diagramm failile scenarios/leo-ppp-convergence.toml, liik leo-ppp

# text
seg-093aac4b5ff1 = Ühendatud keskmise Maa orbiidi (MEO) ja madala Maa orbiidi (LEO) positsioneerimine, navigatsioon ja aeg (PNT) MIS TAHES konstellatsioonide üle: iga [[system]] on liigi constellation-design GNSS eelseade, LEO eelseade (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, atomic-zero-clock efemeriidimudel või mõni muu eelseadefail, igaüks oma failis, allikad märgitud PUBLIC, WORKSHOP või DERIVED), Walkeri kihid või selged elemendikomplektid, koos kandja, kiibisageduse, kandja ja mürategiheduse (C/N0) ümbrisega elevatsioonimaskist seniidini, signaal-ruumis vahemaaveaga (SISRE), Doppleri sigma ja kellamudeliga (oma vastuvõtjakell, nii et süsteemidevaheline nihe hinnatakse, või teada edastatud nihe). Neli režiimi. DOPPLER: kobar-Gaussi-Newtoni positsioneerimine vahemaa muutumiskiirusest analüütiliste osatuletistega, kellatriivi ja valikuliste kiiruse olekute ning valikulise kõrguspiiranguga, ühe- või mitme satelliidiga, viga akna pikkuse suhtes, iga LEO süsteemi Doppleri, Doppleri kiiruse ja tõmbe ümbris ning ühe läbilennu piki- ja ristisuunaline täpsus ristisuunalise nihke suhtes (ristisuunaline viga kasvab piiramatult, kui läbilend läheb pea kohale; ühel läbilennul on ka peeglilahendus üle maapinna jälje). Siin käitub ainult Doppleril põhinev võimaluse signaal (starlink-sop). JOINT: epohhipõhised kaalutud vähimruutude pseudovahemaa fikseeringud ainult GNSS-ist, ainult LEO-st ja mõlemast, mõõtmispõhised sigmad viivitussilmuse soojusmüra mudelist C/N0 juures pluss SISRE (või fikseeritud sigma, nii et signaalimudel saab neid toita), hinnatud süsteemidevahelised nihked ning PDOP/HDOP/VDOP lisatud LEO satelliitide arvu suhtes. POLAR: nähtavad satelliidid ja DOP laiuskraadi suhtes GNSS-i, LEO ja mõlema jaoks. TIMING: aja edastamine koordineeritud ülemaailmsele ajale (UTC) LEO satelliitidelt teadaoleval asukohal kahe olekuga kellafiltriga, mille protsessimüra tuleb mootori ostsillaatoriklassidest, C/N0 ja ostsillaatori suhtes, ning IS-GPS-200 süsteemiaja ja UTC avaldis; koos [timing] trace = true esitab iga rida ka oma ajavea ja ennustatud sigma igal epohhil. VALIDATED: pea kohalt horisondini läbilennu suurim Doppler avaldatud Iridiumi (kuni { "36" } kHz) ja Xona Pulsar X1 ({ "32" } kuni { "34" } kHz) arvude vastu. MODELLED: kõik muu; DOP-i kontrollitakse käsitsi tuletatud juhtumi vastu, fikseeringuid nende kovariatsiooni vastu ja Doppleri mudelit vahemaa kiirenduse samasuse vastu.

# attr:alt
seg-90361a6f4e3c = Mootori joonistatud diagramm failile scenarios/leo-pvt-fjord-skyline.toml, liik leo-pvt

# text
seg-97b8d07150d4 = LEO-PNT signaalikavandid: parameetriseeritud madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalid mis tahes süsteemi, sagedusala ja struktuuri jaoks. SIGNAAL on sagedusala (keskmine sagedus, edastusribalaius, ITU jaotus RNSS/RDSS/MSS/EESS/non-RNSS/other) ja komponendid (omandamine, andmed, piloot; mis tahes alamhulk), igaühel modulatsioon (BPSK(n) murdarvulise n-ga, BOC(m,n), MBOC({ "6,1" },p) või lame OFDM-laadne riba), võimsuse osa, valikulised FDMA alamkandja nihked, koodipikkus ja andmekiirus. Signaalid tulevad kompileeritud avalikest eelseadefailidest (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; igaühel oma allika URL ja iga avaldamata väärtus märgitud REPRESENTATIVE) või kirjutatakse sisemiselt. SIGNAALI KOHTA: ribapiiratud võimsusspektri tihedus ja iga komponendi võimsuse osa, mille edastusriba läbi laseb (BPSK suletud kuju numbrilise väärtuse kõrval), RMS (Gabor) ribalaius, viivitussilmuse koodijälgimise soojusmüra värin C/N0 ja varajase-hilise vahe suhtes ribapiiratud koherentsest (või mittekoherentsest) varajase-hilise valemist Betz & Kolodziejski { "2009" } koos selle piiramata riba õpikuvormi ja kaduva vahega Gabori piiriga, ulatuse täpsus meetrites, omandamise otsinguruum (Doppleri korvid orbiidi maksimaalsest Dopplerist pluss ostsillaatori ja kasutaja liikmed, korrutatud koodikorvidega), ruutseaduse tuvastamise tõenäosus ning keskmine järjestikune ja koodiparalleelne omandamisaeg, signaali spektraalse eraldatuse koefitsient GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja E5 AltBOC suhtes ning kõigi nende signaali suhtes koos C/N0 halvenemisega, ja CW, lairiba ja sobitatud J/S, mida jälgitav komponent talub, spektri liigi enda SSC masinavärgist. SAGEDUSALA KOMPROMISS: esimest järku ionosfääriline viivitus ({ "40.3" } TEC/f^{ "2" }), vabaruumi kadu, ulatuse täpsus võrdsel C/N0 korral ja võrdsel EIRP korral ning segaja taluvus. Valikulised KUJUKONTROLLID võrdlevad kavandi spektrit kirjeldatud mõõtmisega (MODELLED kooskõla). VALIDATED: BPSK võimsus ribas ({ "90.3" } % peasagaras) ja Gabori ribalaiuse suletud kujud, ribapiiratud värin, mis taandub õpikupõhisele koherentsele varajase-hilise kujule ja selle Gabori piirile, nihutatud BPSK spektraalse eraldatuse koefitsient selle Parsevali suletud kuju vastu, AltBOC spektri ühikpindala ja maksimaalne LEO Doppler avaldatud Xona Pulsari (32-34 kHz) ja Iridiumi ({ "36" } kHz) arvude vastu. MODELLED: iga kavand, võimsusjaotus, C/N0 ja segaja tase; EFQPSK, CSK ja OFDM spektrid on ligikaudsed.

# attr:alt
seg-8bf45b6989d1 = Mootori joonistatud diagramm failile scenarios/leo-band-trade.toml, liik leo-signal

# text
seg-4f0edb786a35 = Positsioneerimine 5G mittemaapealse võrgu (NTN) allalingi põhjal mobiilsatelliitteenuse (MSS) S-sagedusalas (3GPP riba n256, allalink { "2170" } kuni { "2200" } MHz; vaikimisi kandesagedus { "2172.5" } MHz): Cramér-Rao piir (CRB) saabumisajale, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), kus beta on lameda OFDM-spektri ruutkeskmine (Gabori) ribalaius (B/sqrt({ "12" })), ning kompleksse toonvõnke Dopplerile, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), iga signaali jaoks (vaikimisi { "5" } MHz New Radio kanal, millest { "4.5" } MHz on hõivatud, ja { "200" } kHz kitsasribakanal, millest { "180" } kHz on hõivatud); seejärel mis tahes LEO konstellatsiooni kohta allalingi saabumisaja määrangud tundmatu vastuvõtja kellaga (algväärtustatud, sigmana piir pluss võrgu sünkroniseerimisviga), nende PDOP ja formaalne 3D sigma ning ühe satelliidi Doppleri määrang pikima läbimise kohta, kõrgus fikseeritud. MODELLED: ribalaiuselt piirile üleminek on õpikuline kinnine kuju, kontrollitud lameda ja ribapiiratud BPSK spektri arvulise integreerimisega (sisemine kooskõla, avaldatud läbitöötatud väärtust kinnitatud ei ole), ja positsioneerimistäpsus on piir mitmeteeleviveaba kanalil nimetatud sünkroniseerimisveaga, mitte saavutatud tulemus.

# attr:alt
seg-c200240dd65e = Diagramm, mille mootor kirjutab failile scenarios/ntn-5g-positioning.toml, liik ntn-positioning

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-6800289a282d = { "7" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Source: <c1/>

# text
seg-561a783e9516 = Madala Maa orbiidi navigatsioon (stsenaariumi liikide perekond)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Teemalehed: <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. Käivita üks: <c1/>. Kõik perekonnad: <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Madala Maa orbiidi navigatsioon liikide jaoks

# text
seg-1e724b481e67 = LEO-PNT signaalikavandid: parameetritega madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalid mis tahes süsteemi, riba ja struktuuri jaoks.

# text
seg-82ad7da67939 = LEO läbimine ja lingieelarve riba kaupa, LEO-PNT jaoks (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt), süsteemist sõltumatu: kasutaja (maapealne, mere-, õhu- või siseruumides, paigalolev või liikuv) ja üks või mitu

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = LEO navigatsioonisõnum: madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja satelliidi ringhäälestatud efemeriid ja kell, mis tahes orbiidi, kandesageduse ja mudeli jaoks, valikuliste nimetatud eelseadetega (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Sulatatud keskmise Maa orbiidi (MEO) ja madala Maa orbiidi (LEO) positsioneerimine, navigatsioon ja aeg (PNT) MIS TAHES konstellatsioonide kohal: iga [[system]] on liigi constellation-design GNSS-i eelseade, LEO eelseade

# text
seg-d9e5f4726bbb = Täpse ühepunktpositsioneerimise (PPP) koondumine ainult GNSS-iga ja LEO täiendusega: ujuv laiendatud Kalmani filter ionosfäärivabal koodil ja kandelaine faasil staatiliste jaamakoordinaatidega, valge

# text
seg-44f4148f4a5f = Positsioneerimine 5G mittemaapealse võrgu (NTN) allalingi põhjal mobiilsatelliitteenuse (MSS) S-sagedusalas (3GPP riba n256, allalink { "2170" } kuni { "2200" } MHz; vaikimisi kandesagedus { "2172.5" } MHz): Cramér-Rao piir

# text
seg-1ee838a551ef = Üks LEO-PNT (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt) süsteem otsast lõpuni, mis tahes konstellatsiooni ja signaali jaoks: signal_design nimetatud leo-signal kavand (avalik eelseade või sisseehitatud [s

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-70d1ac6ddc95 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-472d9e86ee20 = <b>Register (ledger):</b> MODELLED { "2" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>leo-signal</a1>.

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-17d1c06ba5c5 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-9a7671c30d7e = <b>Register (ledger):</b> MODELLED { "7" } · VALIDATED { "5" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>leo-pass</a1>.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-cba2c7f7050a = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-7ba3e667487d = <b>Register (ledger):</b> MODELLED { "5" } · VALIDATED { "6" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>leo-navmsg</a1>.

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-8ca53a87d092 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-389c67090de1 = <b>Register (ledger):</b> MODELLED { "3" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>leo-pvt</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-e004092d6056 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e485df9372e6 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>leo-ppp</a1>.

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-089266c42199 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e0a3133f468f = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>ntn-positioning</a1>.

# text
# c1: signal_design
# c2: pass
# c3: fusion
# c4: name
# c5: description
# c6: seed
# c7: signal
# c8: navmsg
# c9: od_sisre_m
# c10: ppp
seg-ea759d0040db = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>. Valikulised: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.
