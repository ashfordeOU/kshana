# docs--claims-vs-reality: translations (fi)

seg-a47934361f43 = Miehistön koulutuksen NMEA-virrat

seg-ee2e250497f9 = Test-bench-vienti

seg-2bd2101ce454 = Pinta

seg-ad856ad710eb = Tila

seg-98d0bc6b40ce = Julkisten viitekehysten compliance-kartoitus

seg-80f3f0aae42c = Häiriökartta

seg-28b1885c4ca7 = Lähde: <c1/>

seg-bf5c2811ce29 = Väitteet ja todellisuus — ylilupausten kirjanpito

seg-592e007bc3cf = Riippumaton auditointi Kshanan aiemmasta versiosta luetteloi neljätoista <b>ylilupausta</b> (<c1/>…<c2/>): kohtaa, joissa julkinen pinta (README, leikkikenttä, FoM-nimiöt (FoM: laatumittari), skenaariopaketit) kuvasi ominaisuuden vahvemmin kuin koodi toteutti. Tämä sivu on sulkemiskirjanpito: jokainen rivi kertoo alkuperäisen ylilupauksen, miten se ratkaistiin ja todisteet. Ratkaisuja on kahta lajia:

seg-39250970dbbf = <b>Väite poistettu</b> — sanamuoto korjattiin vastaamaan koodia (rehellinen uudelleenkehystys, ei ominaisuusmuutosta). ”Ei koodia = ei väitettä.”

seg-fb7da0f79ead = <b>Korvattu toteutuksella</b> — todellinen ominaisuus rakennettiin ja testattiin myöhemmin, joten vahva väite muuttui <em>todeksi</em>.

seg-5292f7162e2b = Regressiosuoja (<c1/>) skannaa julkiset pinnat (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> sekä crates.io-, PyPI- (Python Package Index) ja npm-etusivut <c8/>, <c9/>, <c10/>) jokaisella CI-ajolla (jatkuva integrointi) ja epäonnistuu, jos jokin poistetuista paljaista ylilupauslauseista ilmestyy uudelleen ilman varaumaa — joten rivi ei voi huomaamatta taantua tilasta GREEN.

seg-dafc6f322f34 = Kaikki neljätoista riviä ovat <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (ylilupaus)

seg-0e01d4053d7f = Alkuperäinen ylilupaus

seg-36bf87638923 = Ratkaisu

seg-70a952c4150b = ”yhteinen Kalman-fuusioestimaattori” antoi ymmärtää yhden ristikovarianssisuodattimen; koodi ajoi kaksi riippumatonta estimaattoria

seg-d5682a7fdb11 = <b>Korvattu toteutuksella</b> — rakennettiin todellinen ristikovarianssilla kytketty kello+paikka-Kalman-suodatin

seg-1008020cd9e4 = <c1/> ({ "7" } testiä, mukaan lukien 100 kokeen kytketty-vs-erillinen-ensemble, joka vaatii kytketyn paikan RMS-arvon (neliöllinen keskiarvo) olevan alle { "0.6" }× erillisen arvosta ja kytketyn suodattimen voittavan vähintään { "90" } kokeessa, kun kokeita on { "100" }); CAPABILITY ”Sensor fusion” → full

seg-334fc345d501 = ”kellotuettu harhautuksen havaitseva RAIM (vastaanottimen autonominen eheyden valvonta)” antoi ymmärtää usean satelliitin RAIM-ilmaisimen

seg-cf0795c2ee02 = <b>Väite poistettu → Korvattu toteutuksella</b> — kehystetty uudelleen kellon vakauteen perustuvaksi harhautuksen havaittavuusrajaksi; todellinen RAIM/ARAIM (HPL/VPL (HPL: vaakasuuntainen suojaustaso; VPL: pystysuuntainen suojaustaso)) toteutettiin sen jälkeen

seg-f46432acbfa0 = <c1/> ({ "30" } testiä — hetkellinen ja ratkaisuerotteluun perustuva ARAIM, HPL/VPL, FDE (vian havaitseminen ja poissulkeminen), Stanford-diagrammit); <c2/>

seg-8b47f69dbb76 = ”häirintädemonstraattori”, jonka takana ei ollut häirintäkoodia

seg-bfff34d5a250 = <b>Korvattu toteutuksella</b> — rakennettiin linkkibudjettiin perustuva häirintämalli J/S → tehollinen C/N₀ → lukituksen menetys

seg-5f75628b8201 = <c1/> ({ "10" } testiä); README:n ”Resilience”-rivi

seg-bae512770cd6 = ”Täysi IMU:n (inertiamittausyksikkö) Allanin varianssin kohinamalli IMU-kolmikolle” — malli oli yksiakselinen

seg-50c0b5855cb9 = <b>Väite poistettu → Korvattu toteutuksella</b> — kehystetty uudelleen 1-DOF-virhebudjetiksi (DOF: vapausaste); kolmiakselinen strapdown-INS (inertianavigointijärjestelmä) toimitettiin sen jälkeen

seg-501bf7d8fff0 = <c1/> kolmiakselinen strapdown (kvaternioasenne, NED- (pohjoinen-itä-alas) mekanisaatio, coning/sculling); ROADMAP ”Inertial”

seg-ad250a99b05f = ”Hybrid PNT (paikannus, navigointi ja ajanmääritys) -integraatio” antoi ymmärtää kytketyn GNSS/INS-suodattimen (GNSS: maailmanlaajuinen satelliittinavigointijärjestelmä); se oli dead-reckoning-virhebudjetti

seg-85fb58d37a5d = <b>Väite poistettu → Korvattu toteutuksella</b> — kehystetty uudelleen dead-reckoning-laskennaksi, jossa on säädettävä uudelleenlukitus; todellinen tiukasti kytketty GNSS/INS-fuusio toimitettiin sen jälkeen

seg-9e6b092d5656 = <c1/> (17-tilainen UKF (hajuton Kalman-suodatin) ja kvantti-CAI:n (CAI: kylmäatomi-interferometri) dead-reckoning); CAPABILITY ”Sensor fusion” → full

seg-46a637f8e967 = ”validoitu ~{ "2" }%” antoi ymmärtää tiukan pakotetun portin

seg-5e98d7664558 = <b>Väite poistettu</b> — <c1/> kertoo <em>pakotetun</em> portin ({ "20" }–{ "25" }% siemenluvuilla keskiarvoistettuna); ”~{ "2" }%” oli tyypillinen havainto, ei portti

seg-84f4fcdc7e50 = <c1/>, otsikko ”On tolerances”

seg-85ec2fe9c7f7 = ”alustojen välillä deterministinen” ilman tallennettua näyttöä

seg-6e516f04db89 = <b>Väite poistettu</b> — työkaluketju lukittu tarkkaan julkaisuun; skenaariokohtaiset golden-tiivisteet tallennettu toistettavuusportin kanssa. (Bittitarkka tulos <em>käyttöjärjestelmien ja arkkitehtuurien</em> välillä (OS/arch (OS: käyttöjärjestelmä)) on yhä avoin kohta, ja se todetaan rehellisesti.)

seg-9db327be56c3 = <c1/> (kanava <c2/>); <c3/> (numeeriset arvot tarkkuudella { "1e-6" }); <c4/> (jokaisen tuloksen syötteen sormenjäljen ja muodon tiiviste, ajettu Linux-, macOS- ja Windows-CI-matriisissa); <c5/>

seg-2708139388ed = ”hybridi kvantti-klassinen PNT-simulaattori” antoi ymmärtää ensiperiaatteista johdetun kvanttifysiikan

seg-717167714e83 = <b>Väite poistettu → Korvattu toteutuksella</b> — kehystetty uudelleen PNT-kestävyyssimulaattoriksi, joka käyttää kvanttisensorien suorituskykymalleja; ensiperiaatteista johdettu Mach–Zehnder-CAI-fysiikka toteutettiin sen jälkeen

seg-c67fb22add4b = <c1/> ({ "26" } testiä — Mach–Zehnder-vaihe, projektiokohina <c2/>, tärinän siirtofunktio, Coriolis + AC-Stark (AC: vaihtovirta) -systematiikat); <c3/>

seg-5c6b7d4f2029 = ”Eheyssuorituskyky”-FoM antoi ymmärtää ilmailun HPL/VPL/RAIM-eheyden

seg-ee5487da890c = <b>Väite poistettu + Korvattu toteutuksella (kerroksittain)</b> — ajokohtainen skenaarion FoM on rehellisesti nimetty <em>suodattimen sisäiseksi johdonmukaisuudeksi</em> (<b>ei</b> ilmailun eheydeksi); todellinen ARAIM HPL/VPL esitetään <em>erikseen</em>, jotta näitä kahta ei koskaan sekoiteta

seg-31aacdf17b02 = <c1/> (<c2/>: sisäinen johdonmukaisuus, varauksin); <c3/> + <c4/> (todellinen ARAIM)

seg-0686fa147c96 = Turvallisuus-FoM esitettiin aina merkityksellisenä, vaikka hyökkäystä ei olisi

seg-d6d9296422fc = <b>Väite poistettu</b> — Turvallisuus-FoM (<c1/>) on kehystetty harhautuksen ilmaisimen yhteyteen, ja se on merkityksellinen vain, kun hyökkäysskenaario on määritetty

seg-8f7b211b5a0c = README:n ”Resilience”-rivi; Turvallisuus-FoM on määritelty toiminnallisesti haitallisessa spesifikaatiopisteessä

seg-d66421174e94 = ”Paikannussuorituskyky”-FoM antoi ymmärtää täyden paikka-alueen tarkkuuden

seg-9eeb13a16350 = <b>Väite poistettu</b> — nimetty 1-DOF-suureeksi <c1/> inertia- ja hybridipaketeille, nimenomaisesti <b>ei</b> 2D-CEP/2DRMS (CEP: ympyrän todennäköinen virhe) tai DOP-painotetuksi (DOP: tarkkuuden heikkenemiskerroin) tarkkuudeksi

seg-e8115df73c10 = README:n laatumittaritaulukko (rivi ”Paikannussuorituskyky”)

seg-5c73759a2454 = inertian FoM-luvut luettiin ensemble-tilastoina yksittäisistä siemenluvuista

seg-3db3a41ce848 = <b>Väite poistettu</b> — yksittäinen ajo merkitään <c1/>; <c2/> raportoi keskiarvon, hajonnan ja bootstrap-luottamusvälin (CI, { "95" }%)

seg-bf737455e6f2 = README:n FoM-taulukko; skenaarioiden kattavuusverhokokeet

seg-aa362992b5da = ”SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System) -satelliittitähdistö” -skenaario käytti synteettisiä paikanvaraaja-TLE:itä (kaksirivisiä elementtijoukkoja)

seg-ebae20813a52 = <b>Korvattu toteutuksella</b> — skenaario sisältää nyt aidon, päivämäärällä leimatun Celestrakin tilannekuvan (<c1/>) tiukoin tarkistussummin

seg-2d49f6101571 = <c1/> (aito <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = README:n versiomerkkijono ajautui eroon tiedostosta <c1/>

seg-8e66b9485565 = <b>Väite poistettu</b> — CI-portti varmistaa, että README:n tilamerkki vastaa tiedostoa <c1/>

seg-347fd8c1f334 = { "0.35" }: väitteet pidetty suppeina, ja yksi korjaus

seg-946ff389cec5 = Version { "0.35" } ominaisuudet kirjoitettiin siten, että niiden rajat on kerrottu väitteen vieressä, ja samat suojat (<c1/> sekä sanamuotosuoja tiedostossa <c2/>) skannaavat niitä kuvaavat sivut. Tämä taulukko ei kuulu yllä olevaan neljäntoista rivin kirjanpitoon; se kirjaa uusille pinnoille, mitä väitetään ja mitä ei.

seg-6ac3f9b26aad = Mitä väitetään

seg-6f558815da86 = Mitä ei väitetä

seg-d0964d2f9bbc = Aluksen luottamuspistemäärä (<c1/>, <c2/>, portti, Signal K, OpenCPN)

seg-ee4d75006bfc = 0-100 pistemäärä ja syyt vastaanottimen omasta NMEA:sta, MODELLED

seg-59ff27c84fe4 = ohjeellinen, ei tyyppihyväksytty navigointilaite; yhden lokin pistemäärä ei kerro mitään muista vastaanottimista; se ei tee paikkaratkaisusta tarkempaa

seg-8869e6a5c10b = synteettinen komentosillan NMEA, jossa on käsikirjoitetut tapahtumat, ja ohjaajan loki

seg-bc4ba77bc569 = vain tekstiä, ei radiotaajuista lähtöä; ei koskaan aluksen reaaliaikaisiin navigointijärjestelmiin; ohjeellinen, ei tyyppihyväksytty navigointilaite

seg-9482ecbb2748 = allekirjoitettu tekninen tallenne, joka voidaan varmentaa offline-tilassa

seg-20ae6dd2b780 = ei oikeudellinen lausunto; ei kerro tapahtuman syytä, vastuullista eikä sitä, että loki näyttää sen, mitä vastaanotin todella vastaanotti

seg-4132fc36f1d3 = aggregoidut heikentyneen navigoinnin solut avoimesti lisensoiduista raporteista

seg-c64960abf9fb = ei ennuste; reitin altistus on solujen osuus, ei riski

seg-ed6d268e0291 = skenaarion ajoneuvon liike ja tapahtumat tiedostoina, joita laboratoriosimulaattori voi lukea

seg-85c8ad22ef03 = signaalia ei kirjoiteta; simulaattorin tai vastaanottimen suorituskykyä ei väitetä

seg-1bba9a883650 = mille riveille ajojoukko tukee todisteita, ja jokaisella rivillä on aukko

seg-f2a836780831 = ei koskaan sitä, että viitekehys täyttyy tai tuote on hyväksytty; pelkkä lajinimiö ei ole todiste

seg-31c7009c9914 = <b>Korjaus kirjattu versiossa { "0.35" }.</b> Tiedoston <c1/> ja kestävyysmoduulin kommenttien aiempi versio kuvasi seitsemän ”tekniikkakategoriaa” DHS:n Resilient PNT Conformance Frameworkista. Kyseisen viitekehyksen versio { "2.0" } määrittelee ydintoiminnot (Prevent, Respond, Recover), tasot { "0" }–{ "4" } ja kahdeksan numeroitua vaatimusta, mutta ei seitsemän kategorian luetteloa. Pisteytysmoottorin tuottamat seitsemän alipistemäärän nimeä ovat Kshanan omia, ja ristiinviittaus (crosswalk) sanoo sen nyt.

seg-f70787ecb194 = Miten rivi pysyy tilassa GREEN

seg-f2c599e8882a = Vahvat väitteet (OC-0/2/7/8 sekä OC-1/3/4/12:n korvatut puoliskot) ovat GREEN, koska ominaisuus on <b>toimitettu ja testattu</b> — ei siksi, että sanamuotoa olisi pehmennetty. Väite poistettu -rivit ovat GREEN, koska voimassa oleva sanamuoto vastaa koodia. Suojatesti tekee jälkimmäisestä luokasta valvottavan: jos poistettu ylilupauslause palaa julkiselle pinnalle, CI muuttuu punaiseksi. Katso <c1/>.

seg-39e475441b60 = <s1>Edellinen</s1>Miksi rivit pysyvät mallinnettuina

seg-07ef8e1e862e = <s1>Seuraava</s1>Alkuperä
