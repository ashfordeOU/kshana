# docs--kind-leo-pass: translations (et)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Allikas: <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (stsenaariumi liik)

# text
seg-c3861f7d717c = LEO läbilend ja lingieelarve sagedusala kaupa LEO-PNT jaoks (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt), süsteemist sõltumatu: kasutaja (maapealne, mere-, õhu- või siseruumides, paiksel või liikuv) ja üks või mitu LEO satelliiti, mis pärinevad DESIGNED PASS (projekteeritud läbilend: ringorbiit, mis on paigutatud nii, et kasutaja näeb ühte valitud maksimaalse elevatsiooniga läbilendu valitud ajal, soovi korral päikesesünkroonne), selgetest ELEMENTS (elementidest), TLE-st (kaherealine elemendikomplekt) mootori SGP4 kaudu või WALKER konstellatsioonist, mis on ehitatud konstellatsiooni kavandamise koodiga (kõrgeimad läbilennud esitatakse). Sagedusalad tulevad nimetatud eelseadest (üldine mitmesagedusala UHF/L/S/C, üldine C-sagedusala, Xona Pulsar X1/X5, Iridium STL, Starlink ainult Doppleri võimaluse signaalina, CentiSpace ja valikuline Celeste IOD eelseade, mis on märgitud WORKSHOP) või kirjutatakse stsenaariumisse; iga eelseade ütleb, kas selle arvud on PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP. Satelliidi, sagedusala ja epohhi kohta: elevatsioon, asimuut, vahemaa, vahemaa muutumiskiirus ja vahemaa kiirendus; vabaruumi levikadu; EIRP ja satelliidi mustri võimendus (isovoog, Gaussi kiir või lame); kasutaja antenni võimendus elevatsiooni suhtes (plaaster-, poolkera- või isotroopne); gaasiline sumbumine (ITU-R P.676-10 Annex { "2" }), vihmasumbumine (ITU-R P.838-3 koefitsiendid ja P.618-14 protseduur, vihmakiirusest ja vihma kõrgusest), troposfääri sähvimine (ITU-R P.618-14 section { "2.4.1" }), hoonesse sisenemise kadu siseruumi kasutajale (ITU-R P.2109-2), polarisatsiooni mittesobivus, süsteemi müratemperatuur ja C/N0 (kandja ja mürategiheduse suhe); Doppler ja Doppleri kiirus suletud kujul vahemaa muutumiskiirusest ja vahemaa kiirendusest, mõlemad kontrollitud tsentraalsete vahedega; esimest järku ionosfääriline viivitus { "40.3" } STEC/f^{ "2" } Klobucharist või vertikaalse TEC kaldsest TEC-ist, skaleeritud satelliidi alla jääva ionosfääri osale. Sagedusalade paaridele antakse ionosfäärivabad koefitsiendid, müra võimendus ja koodimüra läbilennu tipul. MEO GNSS satelliite (Galileo või GPS eelseaded) hinnatakse sama antenni ja müramudeliga nende liidesedokumentide vastuvõetud võimsustest, nii et LEO kellukujuline läbilend ja lamedad GNSS kandjad jagavad ühte graafikut. Valikuline [iot] sektsioon annab aja esimese fikseeringuni, fikseeringu energia ja aku eluea töötsükli suhtes kindlaksmääratud vastuvõtja võimsuseelarve korral (MODELLED). Iga sagedusalade paar annab ka kaldse TEC, mille selle geomeetriavaba kombinatsioon tipus taastab, ja selle hinnangu koodimüra sigma (ionosfääri sondeerimine). Valikuline [spoofer] sektsioon võltsib väidetava asukoha signaale, mis hüppab või lükatakse tegelikust algusmomendi järel, ja käitab kahte monitori kindlaksmääratud valehäire ja tuvastamata jäänud sündmuse tõenäosustega: Doppleri ja läbilennu geomeetria kooskõla (mõõdetud vahemaa muutumiskiirused võrrelduna orbiitidest ning sõltumatust eelnevast asukohast ja kiirusest ennustatutega, üldistatud vähimruutude hii-ruut test akna üle, GNSS, LEO ja kõigil kanalitel) ja sagedusalade vaheline kooskõla (iga LEO sagedusalade paari mudelkorrigeeritud geomeetriavaba kombinatsiooni epohhist epohhi samm), esitades epohhipõhised statistikud ja selle, millal iga monitor tuvastab (MODELLED). VALIDATED komponendid: vabaruumi kadu, P.838-3 koefitsiendid selle Table { "5" } vastu, P.618-14 vihma ja sähvimise protseduurid ning P.2109 hoonesse sisenemise kadu ITU-R Study Group { "3" } valideerimisnäidete vastu, IS-GPS-200 L1/L2 rühmaviivituse suhe ning ringorbiidi paikse kasutaja maksimaalne Doppler arXiv { "2509.19551" } Table { "1" } vastu. MODELLED: EIRP-d, mustrid, TEC-i Chapmani osa satelliidi all ja kogu läbilend.

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Ühe <c1/> käivituse kokkuvõte: LEO läbilennu lingieelarve, õhusõiduki kasutaja asukohas { "50.00" }, -30.00; { "1" } LEO satelliit, { "900" } s aken Iridium-pass [iridium-stl PUBLIC]: { "781" } km, maksimaalne elevatsioon { "65.0" } kraadi hetkel { "444" } s, { "750" } s üle maski STL { "1621.000" } MHz: C/N0 tipp { "80.5" } dB-Hz mediaan { "71.3" } dB-Hz; |Doppler| maks { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } nähtaval, C/N0 { "38.2" } dB-Hz kuni { "51.1" } dB-Hz (mediaan { "46.2" } dB-Hz) LEO STL tipp { "80.5" } dB-Hz on { "34.3" } dB üle GNSS-i mediaani; üle tugevaima GNSS-i kandja { "750" } s jooksul

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
seg-e6f4e5c502d7 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pass-iridium.toml
seg-e12426a79a2f = Näide <c1/> määrab muu hulgas:

# text
seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

# text
seg-7cd17bf1ac74 = Iridium STL õhusõidukilt

# text
seg-f4d857403ae0 = laskuv

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } kaasasolevat stsenaariumi kasutavad seda liiki; ülejäänud on kataloogis <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Tulemuse silt (mootori oma): MODELLED: LEO läbilennu geomeetria ja sagedusalapõhine lingieelarve kindlaksmääratud EIRP-dest ja idealiseeritud antennimustritest ITU-R levitermidega; komponendimudelitel on kontrollimaatriksis oma sildid. Mitte ühegi satelliidi mõõtmine.

# attr:alt
seg-02ae51cfada6 = Mootori joonistatud diagramm failile scenarios/leo-pass-iridium.toml, liik leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-69ed19957592 = <b>VALIDATED</b> ITU-R (Rahvusvaheline Telekommunikatsiooniliit, raadiosideosakond) P.838-3 võrrandid ({ "1" }) kuni ({ "5" }): k_H, alpha_H, k_V, alpha_V tabelite { "1" } kuni { "4" } kõverasobitustest, tee- ja polarisatsioonisõltuv (k, alpha) ning erisumbuvus Testid: <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.2.1.1" } sammud { "2" } kuni { "10" } (kalle ja horisontaalne tee vihmakõrgusest allpool, horisontaalse vähenduse ja vertikaalse korrektsiooni tegurid, A0.01 ja selle skaleerimine { "0.001" } % kuni { "5" } % keskmisest aastast), vihmakõrgusega (P.839) a Testid: <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } sammud { "3" } kuni { "9" } (etalon-sigma suurusest N_wet, efektiivne teepikkus, antenni keskmistamistegur, signaalilanguse sügavus { "0.01" } % kuni { "50" } % ajast), kus N_wet on sisend või arvutatud temperatuurist, niiskusest ja rõhust t Testid: <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Annex { "1" } võrrandid ({ "1" }) kuni ({ "10" }) koos Table { "1" }: kadu, mida tõenäosusega P ei ületata, traditsiooniliste ja soojustõhusate hoonete jaoks tee elevatsioonil fassaadil, { "80" } MHz kuni { "100" } GHz; rakendatud sagedusala ja epohhi kaupa Testid: <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = ja veel { "8" } maatriksis.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } sammud { "3" } kuni { "9" } (etalon-sigma suurusest N_wet, efektiivne teepikkus, antenni keskmistamistegur, signaalilanguse sügavus { "0.01" } % kuni { "50" } % ajast. Oraakel (sõltumatu etalon) (ExternalDataset): ITU-R Study Group { "3" } valideerimisnäited (CG-3M3J-13-ValEx-Rev8.3.0) P.618-14 sähvimise jaoks, iga asukoha P.453-14 N_wet samadest näidetest; kinnitatud failis tests/fixtures/leo_link/p618_14_scintillation.csv koos URL-ide ja noppimiskuupäevaga. Märja murdumisnäitaja avaldis temperatuurist ja niiskusest ei ole selle rea poolt kaetud

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Rühmaviivitus { "40.3" } STEC/f^{ "2" } sagedusala kohta; ionosfäärivabad koefitsiendid f1^2/(f1^{ "2" } - f2^{ "2" }) ja -f2^2/(f1^{ "2" } - f2^{ "2" }) ning müra võimendus sqrt(a1^{ "2" } s1^{ "2" } + a2^. Oraakel (sõltumatu etalon) (ExternalDataset): IS-GPS-200 section { "20.3.3.3.3.2" }, mis esitab L1/L2 rühmaviivituse suhte gamma = (77/60)^{ "2" }, mis tuleneb esimest järku 1/f^{ "2" } skaleerimisest, ja Friisi edastusvalem (Proc. IRE, { "1946" }). Valideerib skaleerimisseadused, mitte kaldset TEC

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: otsing üle iga orbiidipositsiooni ja iga kasutaja satelliidi horisondil ringorbiidi puhul, Maaga. Oraakel (sõltumatu etalon) (ExternalDataset): Leclere, Marathe ja Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Table { "1" } (paiksel vastuvõtja { "6371" } km sfääril, Maa pöörlemine ainus muu mõju): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz sagedusalal L1. Hõlmab ringikujulisi kahe keha orbiite

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> Liik <c1/>: satelliidid projekteeritud läbilennust, elementidest, TLE-st SGP4 kaudu või Walkeri konstellatsioonist kavandist constellation-design; sagedusala ja epohhi kohta l. Oraakel (sõltumatu etalon) (InternalConsistency): Suletud kujud ja sisemine kooskõla: vahemaa muutumiskiiruse ja vahemaa kiirenduse samasused numbriliste tuletiste vastu, isovoo võimendus, mis tühistab vahemaa kasvu, õpikupõhised polarisatsioonikao piirid, kvalitatiivne LEO ja GNSS-i vaatlus (minuteid kestev kellukujuline läbilend, mille tipp on mitu dB üle lamedate 44-51 dB-Hz GNSS kandjate). EIRP-d ja mustrid on avaldatud vastuvõetud võimsused, mis on muudetud EIRP-ks või esindus

# text
# c1: label
seg-65a0444ca451 = MODELLED: LEO läbilennu geomeetria ja sagedusalapõhine lingieelarve kindlaksmääratud EIRP-dest ja idealiseeritud antennimustritest ITU-R levitermidega; komponendimudelitel on kontrollimaatriksis oma sildid. Mitte ühegi satelliidi mõõtmine. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Valikuline [iot] sektsioon annab aja esimese fikseeringuni, fikseeringu energia ja aku eluea töötsükli suhtes kindlaksmääratud vastuvõtja võimsuseelarve korral (MODELLED). (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Valikuline [spoofer] sektsioon võltsib väidetava asukoha signaale, mis hüppab või lükatakse tegelikust algusmomendi järel, ja käitab kahte monitori kindlaksmääratud valehäire ja tuvastamata jäänud sündmuse tõenäosustega: Doppleri ja läbilennu geomeetria kooskõla (mõõdetud vahemaa muutumiskiirused võrrelduna orbiitidest ning sõltumatust eelnevast asukohast ja kiirusest ennustatutega, üldistatud vähimruutude hii-ruut test akna (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED: EIRP-d, mustrid, TEC-i Chapmani osa satelliidi all ja kogu läbilend. (liikide kataloog (<c1/>))

# text
seg-e675c999f303 = MODELLED. Punktkiiri, purskegraafikut ja STL lainekuju ei modelleerita. (stsenaariumifaili kommentaar, rida { "14" })

# text
seg-c3665ac09bf6 = LEO-PNT läbilend ja selle sagedusalapõhine lingieelarve nähtavate MEO GNSS satelliitide suhtes on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = Nimetatud LEO-PNT süsteemide eelseaded kindlaksmääratud allikatega ja süsteemist sõltumatu mootor on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Teemaleht: <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Eelmine</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Järgmine</s1>leo-pnt-chain
