# docs--kinds-lunar-and-cislunar: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
# c1: independence
seg-f994c81583bf = MODELLED sõltumatu hindaja test tsislunaarse kaare pikkuse jälgitavuse läve jaoks. See lävi on jälgitavusmaatriksi RANGI lugemine, mis on kokku pandud ANALÜÜTILISTEST vahemaa Jacobi ridadest ja ANALÜÜTILISEST variatsioonilisest olekuüleminekumaatriksist, ning selle ruutjuur-infofiltri ristkontroll voldib kokku needsamad read — kooskõlakontroll kahe numbrilise masina vahel, mitte kinnitus. See liik annab puuduva vahekohtuniku: pakettlahendi vähimruutude hindaja, mis tegelikult TAASTAB juhtsatelliidi algoleku simuleeritud mõõtmistest, kusjuures mõõtmise osatuletised võetakse liidetud otsemudeli KESKMISTE LÕPLIKE VAHEDENA. See ei kutsu ühtegi analüütilist Jacobi rida, ühtegi variatsioonilist olekuüleminekumaatriksit, ühtegi singulaarväärtuse ega omaväärtuse lahutust, ühtegi astaku tolerantsi ega ruutjuur-infofiltrit — allikatekstikaitse failis tests/cislunar_arc_recovery_reference.rs muudab selle jõustatavaks — samal ajal kui dünaamika (sama RK4 CR3BP voog), algtingimused (sama diferentsiaalselt korrigeeritud konstellatsioon), skalaarne vaadeldav suurus ja epohhiruudustik on tahtlikult jagatud ning nimetatud väljastatud <c1/> plokis, sest ühe füüsikalise probleemi kaks analüüsi peavad olema füüsikas kooskõlas, et olla võrreldavad. Kaks kriteeriumi, kumbki pühitud üle viie dekaadi oma piirist: MÜRATA TAASTAMINE (iga algväärtusega (seed) katse lõplik olekuviga on kuni recovery_factor korda selle a priori nihe — astaku analoog, ilma singulaarväärtuse tolerantsita) ja MONTE CARLO HINNATAVUS (mõõdetud RMS positsioonivea üle algväärtusega (seed) müraansambli alla väljaöeldud piiri — hinnatavuse analoog, mõõdetud, mitte ennustatud). Toetab tasapinnalist nelja oleku ja ruumilist kuue oleku, DRO / L2 halo / L2 NRHO perekondi, vahemaa ja vahemaakiiruse vaadeldavaid suurusi ning Kuu-keskset polaarparametrisatsiooni, kus teisendus rakendatakse OLEKULE ja otsemudel diferentseeritakse seal uuesti. MEASURED avaldatud tasapinnalisel DRO ruudustikul: hindaja taastab neljaoleku alates { "0.782609" } h, astakukriteeriumi { "2.086957" } h vastu tolerantsi rel_tol { "1e-6" } juures (suhe { "0.375" }) — astakulävi EI ole kinnitust leidnud taastatavuse piirina — samal ajal kui mõõdetud hinnatavuse piir langeb samasse ruudustiku lahtrisse nagu formaalne, { "5.739130" } h, ning mõõdetud veakõver reprodutseerib formaalse 1-sigma üle { "21" } kaare pikkuse geomeetrilise keskmise suhtega { "0.98" }. MODELLED: konstellatsiooni kujundus, epohhiruudustik, ainus jälgitav link, nihke suurus, mõõtmise sigma ja kaks väljaöeldud piiri. Mitte sertifitseeritud navigatsioonitulemuslikkuse toode.

# attr:alt
seg-2fe411ae2153 = Diagramm, mille mootor kirjutab failile scenarios/cislunar-arc-recovery.toml, liik cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6): jälgib nelja kosmoseaparaadi diferentsiaalselt korrigeeritud tasapinnalist DRO konstellatsiooni satelliitidevahelise vahemõõtmisega ja annab teada, kui suure osa kosmoseaparaadi neljaolekust [x,y,ẋ,ẏ] kaar jälgitavaks teeb. Väljastab ({ "1" }) astak-kaare pikkuse tabeli ühe ainult-vahemaa lingi jaoks — hetkeliselt astak 1, kasvades täieliku neljaolekuni kaare pikenedes (P6 tabel { "1" }); ({ "2" }) jälgitavuse Gramiani omaspektri + tingimusarvu üle kaare; ({ "3" }) ainult-vahemaa ja vahemaa+vahemaakiiruse hetkelise astaku võrdluse (Doppleri kujunduse hoob) pluss ainult-vahemaa-singulaarse / vahemaa+kiiruse-defineeritud GDOP-i aruandluse; ning ({ "4" }) sõltumatu SRIF-i ristvalideerimise, mille posteriori kovariatsioon muutub lõplikuks / hästi tingituks täpselt kaarel, kus jälgitav astak jõuab neljani. VALIDATED tuum: jälgitav astak on astakut paljastav singulaarväärtuse lävi, mida on risttõendatud Gramiani omaastakuga; omaspekter järgib spektraalseid invariante (jälg=Σλ, det=Πλ, Frobenius²=Σλ²); variatsiooniline STM on lõplike vahedega valideeritud CR3BP STM; vahemaa/vahemaakiiruse Jacobi read on lõplike vahedega valideeritud analüütilised osatuletised (risttõendatud paketi 3-D vahemaakiiruse vaadeldava suurusega); neli algtingimust on diferentsiaalselt korrigeeritud tasapinnalised DRO-d, mis sulguvad tiheda perioodilisuse jäägini ja on retrograadsed; astaku üleminek on ristvalideeritud paketi ruutjuur-infofiltriga (posteriori kovariatsioon lõplik täpselt täisastakul, cond(P)=cond(OᵀO)); astakupuudulik hetktõmmis märgitakse GDOP-määramata (fim condition=inf), mitte kunagi võlts lõplik väärtus — sama singulaargeomeetria kaitse, mida rakendab pvt::solve_spp. MODELLED: konstellatsiooni kujundus (DRO perilune amplituudid ja faasid) ja sellest tulenev konkreetne astaku areng. Mitte sertifitseeritud navigatsioonitulemuslikkuse toode.

# attr:alt
seg-f15bbf30b0dd = Diagramm, mille mootor kirjutab failile scenarios/cislunar-observability.toml, liik cislunar-observability

# text
seg-c8a8be4b8894 = Maa-GNSS-i vastuvõtt Kuu kaugusel, nõrga signaali kiht, mida nimetab konfliktivastupidavuse artikkel ja mille jaoks mootoril mudelit ei olnud. GNSS-i satelliit suunab oma antenni Maa poole; Kuu lähedal olev vastuvõtja asub umbes viisteist korda orbiidi raadiuse kaugusel, nii et kolm asja mõjuvad korraga. Maa PIMENDAB PEATELJE: kaugusel { "26,560" } km katab see { "13.9" } kraadi poolnurga, nii et iga Kuu poole suunduv kiir peab lahkuma saatjast vähemalt selle võrra nadiirist eemal, mis eemaldab kiirgusdiagrammi tipu enne mis tahes võimsuse arvutamist. Järele jääb PEALOOPE SERV JA KÜLGLOOBID, režiim, milles LuGRE kasulikkoormus { "2025" } tegelikult töötas. Ja vabaruumi sumbuvus on L1 juures umbes { "208" } dB, umbes { "25" } dB rohkem kui maapealne kasutaja maksab. Aruanne väljastab ühe rea satelliidi kohta (telje-väline nurk, Maa varjutus, vahemaa, teekadu, saatevõimendus selle nurga all, vastuvõetud võimsus, kandja ja müra tihedus) ja koondab ainult lingid, mis ületavad jälgimislävi. SEE ANNAB TEADA KA TINGITUSE, sest just see määratleb selle kihi: iga nähtav satelliit asub Kuult vaadatuna paarikraadise laiusega koonuse sees, nii et vaatejooned on peaaegu paralleelsed, täpsuse halvenemise tegur on tohutu ning Maa-GNSS-i lahend Kuu kaugusel on palju rohkem AJASTUSE-klassi kui positsiooniklassi vaatlus. MODELLED, ja põhjus on saatemuster: võimendus nurga all on ühtlane ümmargune apertuur (Airy), samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv kujundatud peaga ja mitte-Airy külglooblitega. Mõõdetud mustrid on olemas ja neid siin kaasatud ei ole, seega järjestused ja suurusjärgud on tähenduslikud, kuid ühegi üksiku satelliidi dB mitte. Tahtlikult PUUDUVAD, igaüks teeb bilansi optimistlikuks: ionosfääri- ega troposfäärikadu piki limbust riivavaid kiiri ei ole, polarisatsiooni-, suunamis- ega teostuskadu ei ole ning sfääriline Maa ilma murdumislaiendita. Kuu asukoht on SISEND (vahemaa pluss inertsiaalsuund), mitte efemeriidi otsing, sest testitav suurus on link ja kiire geomeetria. Selle rea tõstmiseks valideeritud tasemele on vaja mõõdetud saatemustrit ja LuGRE normaalpunkte; kumbagi ei ole hoidlas ja kumbagi ei ole siin välja mõeldud.

# attr:alt
seg-cf1dce5fc824 = Diagramm, mille mootor kirjutab failile scenarios/earth-gnss-lunar.toml, liik earth-gnss-lunar

# text
seg-004c56ded47f = Kuu pinnanavigatsiooni signaaliturbe ründepind (P1): ühendab avatud signaaliturbe analüüsid üheks kahendfailist ligipääsetavaks käivituseks. Esitab ({ "1" }) AFS vastuvõetud võimsuse ja selle võimsuse ÜLEJÄÄGI maapealse GPS etaloni suhtes, pluss 12-18 dB tundlikkusriba tõelise mitmetelgse pühkimisena üle lingisisendite (etalontase x EIRP x kaldvahemaa) koos 25x-ümardatud / 28x-ümardamata lineaarteguri ühildamisega. PARANDATUD (reegel R4): see esitas { "15.6" } dB võimsuse PUUDUJÄÄGI ja teguri 32x/36x, kuni GPS etalon parandati väärtustelt -125 / -128.5 (mis on dBm arvud) väärtustele -155 / -158.5 dBW, ICD-GPS-200 väärtused, mida segamismoodul on alati kandnud. Märk pöördub: modelleeritud Kuu AFS signaal on { "14.4" } dB TUGEVAM kui maapealne GPS L1 C/A, mitte nõrgem. Vastuvõetud võimsus ise ei nihkunud bittigi ja lineaartegur on vana jagatud täpselt { "1000" }-ga, mis on täpselt { "30" } dB dBm-st dBW-sse nihe; ({ "2" }) nõutav ründaja edastusvõimsus võltsimiseks (J/S = { "3" } dB) ja keelamiseks (J/S = { "30" } dB) igal eemalseisul, J/S lingi pöördväärtus; ({ "3" }) orbitaalne haaramisjalajälg päris ühtlase ava antenni mustri all (Airy [{ "2" } J1(x)/x]^{ "2" }), kõrgusega piiratud alampoolkerakujuline kübar, mille serv EI OLE haaratud; ({ "4" }) arvutatud jälgimissilmuse võltsimise haaramise sissetõmbe tulemus (kas sobitatud koodiga võltsija antud võimsuseeelise ja koodinihkega tõesti tõmbab DLL/PLL kaasa), mitte väidetud { "3" } dB lävi; ({ "5" }) õhuta keha geomeetriline horisondi ulatus tõstetud pinnasaatjal; ja ({ "6" }) OSNMA/TESLA autentimise eelarve ({ "20" } bit/s lisakulu = ~{ "40" } % { "50" } bit/s AFS navigatsioonisõnumist, võtme avalikustamise viivitus, { "2" }^-40 võltsimine). Tühi sisu reprodutseerib P1 lähtetaseme; iga sisend on vaikimisi antud ja tühistatav. VALIDATED alamtulemused kannavad oma lähtemooduli sõltumatut etaloni (suletud kujul dB radiomeetria; pöördvõrdelise J/S ringkäik; Airy muster vs A&S Besseli ja sfäärilise kübara geomeetria; DLL/PLL sissetõmme vs Kaplan & Hegarty; sfäärilise puutuja horisondi samasus vs eo_payload; OSNMA SIS-ICD väljade mõõtmine). MODELLED: esinduslikud geomeetria/võimsuse suurusjärgud ja haaramiskaardi konkreetsed lahtriväärtused. Mitte sertifitseeritud turbetoode.

# attr:alt
seg-de295af20c55 = Mootori joonistatud diagramm failile scenarios/lunar-attack-surface.toml, liik lunar-attack-surface

# text
seg-142ad48fe422 = Pinnamajakate täiendus Kuu orbitaalsele navigatsiooniteenusele, käivitatava enne/pärast tabelina. Lõunapooluse kasutaja näeb hõredat orbitaalset komplekti kitsal taevalaigul, seega on ulatuse mõõtmise geomeetria halvasti tingitud; mõned MÕÕDISTATUD PINNAMAJAKAD annavad madala elevatsiooni ja laia asimuudiga otsenähtavuse read, mida täielikult pea kohal olev komplekt ei oma, ning horisontaalne täpsuse halvenemise tegur kukub kokku. Stsenaarium esitab kolm konfiguratsiooni ühel epohhil — ainult satelliidid, satelliidid pluss nähtavad majakad ja suurem konstellatsioon alternatiivse teena samale geomeetriale — igaühel oma nähtavate allikate arv, täielik DOP ja realiseeritud 1-sigma täpsus MEETRITES, saadud korrutades läbi majaka kohta kasutajaekvivalentse ulatuse veaga, mis on kokku pandud kella sünkroniseerimise, mitmeteelevi ja mõõdistuse liikmete ruutude summa ruutjuurena. Majaka nähtavus on õhuta Kuu kahe kõrguse geomeetriline horisont (atmosfääri ei ole, nii et piir on täpne) ja DOP-i koostamine on sama tuum, mis on ristkontrollitud gnss_lib_py vastu failis tests/dop_reference.rs. MIKS SEE LIIK OLEMAS ON: selle taga olev moodul on olnud mootoris ja kontrollitud sõltumatu DOP-i tee vastu alates L08/L09, kuid see ei olnud käivitusest kättesaadav — ei liiki, ei hargnemisharu, ei kaasasolevat faili. README reklaamis võimekust ja kontrollimaatriksil EI OLNUD selle jaoks üldse rida, nii et seda väideti samaaegselt proosas ja ei väidetud registris (ledger), olles samal ajal mootoris kättesaamatu. Vaikeväärtused on geomeetria, mis kannab juba kinnitatud kuldset etaloni (kasutaja asukohas -80 kraadi { "2" } m antenniga, kolm majakat asukohtades -80/0, -79/+{ "60" } ja -79/-60 kõrgusel { "2" } km, kuue satelliidiga illustratiivne LCNS hetktõmmis hetkel t={ "0" }, { "5" } kraadi mask), nii et paljas käivitus reprodutseerib tabeli, mida sõltumatu etalon juba katab, mitte ei leiuta uusi arve. MODELLED: konstellatsiooni kavand, majakate paigutus ja iga veaeelarve suurusjärk on illustratiivsed sisendid, mitte kasutusel olev mõõdistus ega mõõdetud link; ainult DOP-i aritmeetika, horisondi suletud kuju ja seos sigma = DOP x sigma_URE on väliselt ankurdatud. Mitte teenuse toimivuse kohustus.

# attr:alt
seg-a53e353706f6 = Mootori joonistatud diagramm failile scenarios/lunar-beacon.toml, liik lunar-beacon

# text
seg-8ac5ac006ae7 = Modelleeritud Kuu DIFERENTSIAAL-PNT (Kuu DGNSS/SBAS analoog): NovaMoon-klassi etaloonijaam TEADAOLEVAS selenograafilises asukohas arvutab satelliidipõhised diferentsiaalparandused ILLUSTRATIVE, avaliku allikaga Moonlight/LCNS-klassi konstellatsioonist (NovaMooni viidatakse ainult süsteemi KLASSINA, ESA-ga sidumata), ja kasutaja, kes on nihkes baseline_km võrra, rakendab neid nii, et ÜHISREŽIIMI orbiidi + kella vead tühistuvad. Kellaliige tühistub TÄPSELT (algebraline samasus); orbiidiliige jätab alles ainult vaatejoonte erinevuse projektsiooni, mis → { "0" }, kui baseline → { "0" } (ruumilise dekorrelatsiooni põhi) ja kasvab ≈ lineaarselt baseline-iga. Esitab kasutaja 3-D asukohavea parandustega VS ILMA parandusteta, vähenemise teguri, vea ja baseline-i kõvera ning kasutaja kaitsetaseme, mis KASUTAB UUESTI DO-229E SBAS masinavärki (crate::sbas) diferentsiaaljäägi σ-ga. MODELLED — täpse tühistumise samasus + esimest järku dekorrelatsiooni mudel; ei ole päris andmetega valideeritud; ei ole TRL/pärandi/agentuuri heakskiitu. Deterministlik, kui algväärtus (seed) on antud.

# attr:alt
seg-8e67df89448a = Mootori joonistatud diagramm failile scenarios/lunar-differential-pnt.toml, liik lunar-differential-pnt

# text
seg-55679aff66db = Seitsmeparameetriline Helmerti (sarnasus-) tugisüsteemi datum, mida juhib SIMULEERITUD VAATLUSKAMPAANIA, mitte süstitud teisendus. Maajaamade võrk vaatleb Kuu pinna majakate kataloogi selgesõnalise ajakava järgi; Kuu-VLBI viivituse osatuletised koondatakse selle ajakava üle majakakoordinaatide Fisheri informatsioonimaatriksiks täpselt nagu lunar-vlbi-fim; ja see informatsioon levitatakse läbi Helmerti kavandi A = [I3 | [p]_x | p] kataloogipunktides datumi kovariatsiooniks H = A^T M_b A, mida diagnoosib crate::fim::crlb. ÜHTEGI teisendust ei süstita ja midagi ei taastata istutatud vastusest, nii et esitatud datumi täpsus tuleneb vaatlusprogrammist: viivituse sigma poolitamine poolitab selle täpselt ja kaare pikendamine parandab seda, sest libratsioon, mida aruanne MÕÕDAB (sub_earth_direction_sweep_deg), on see, mis eraldab vaatejoone suunalise majakakoordinaadi taevatasandi omadest. Auaste, datumi defekt, tingimuslikkuse arv, täielik spekter, mittevaadeldavad suunad SEITSMEPARAMEETRILISES BAASIS, nõrgim suund isegi täisastmel ja iga parameetri osa sellest väljastatakse igal käivitusel; parameeter, mida kampaania ei piira, avaldatakse väärtusega NULL ja olekuga, mitte kunagi ei loeta seda peaaegu singulaarsest pöördmaatriksist. Majakavigade korrelatsioon on mõõdetud, mitte eeldatud: kui jaamad on fikseeritud, ei puuduta ükski vaatlus kahte majakat, nii et informatsioonimaatriks on täpselt plokkdiagonaalne (offblock_fraction { "0" }), ja kui jaamu hinnatakse, on Schuri marginaliseeritud plokk seotud, esilekutsutud korrelatsioon trükitakse ja kogu levitamine käivitatakse uuesti selle kõrvaldamisega, nii et sõltumatuse eelduse hind on arv. Sama levitamine isotroopse koordinaadipõhise sigma all ja taastamisviga, mida aruandleb stsenaarium lunar-frame-realisation, käivitatakse mõlemad siin ja trükitakse kampaania väärtuse kõrvale koos nende suhetega. MODELLED: majakate kataloog on allikaga, kuid KAMPAANIA on simuleeritud — jaamavõrk ja viivituse sigma on illustratiivsed sisendid, üksikuid viivitusvaatlusi käsitletakse sõltumatutena ning Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD, nii et datumi kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks. Mitte geodeetiline toode.

# attr:alt
seg-883d94b321b4 = Mootori joonistatud diagramm failile scenarios/lunar-frame-campaign.toml, liik lunar-frame-campaign

# text
seg-0c4c119abfca = Modelleeritud Kuu tugisüsteemi realiseerimine: 7-parameetriline Helmerti (sarnasus-) datumi sobitus — { "3" } translatsiooni, { "3" } väikese nurga pööret, { "1" } skaala — mis seob hinnatud selenograafilisest tuletatud MCMF punktikoordinaatide komplekti datumiga kaalutud vähimruutudega (crate::batch_ls::gauss_newton), pluss lihtne orientatsiooniside, mis väljendab realiseeritud väikest pööret ICRF telgede ümber suhtes IAU { "2015" } WGCCRE keha orientatsiooniga. Stsenaarium süstib teadaoleva väikese teisenduse (translatsioon ~kümned m, pööre ~µrad, skaala ~{ "1e-7" }) hästi hajutatud sünteetilisse punktivõrku, lisab algväärtusega (seed) Gaussi müra, taastab datumi ning esitab taastatud teisenduse, parameetripõhise taastamisvea süstitud tõe suhtes ja sobitusjärgse RMS jäägi. MODELLED enesekooskõla — taastab süstitud sarnasusteisenduse (müravabalt ~masinatäpsuseni), MITTE realiseerimist päris jälgimis-/VLBI andmete vastu; deterministlik (algväärtusega (seed)); ei ole TRL/pärandi/agentuuri heakskiitu.

# attr:alt
seg-f3a6d69d0225 = Mootori joonistatud diagramm failile scenarios/lunar-frame-realisation.toml, liik lunar-frame-realisation

# text
# c1: study
seg-d0fb90f506c9 = MODELLED uuringud Kuu orbiidist ja pinnast kui navigatsiooni- ja geodeetilisest infrastruktuurist, viis uuringut ühe liigi taga, mida valib <c1/>: od-consistency (pardal Maa-GNSS orbiidi määramine NRHO-s või ELFO-s sõltumatu maapealse radiomeetrilise orbiidi määramise vastu, hinnatud nende endi kovariatsioonide alusel algväärtusega (seed) Monte Carlo üle), carrier-phase (ühine pinna-orbiitri kahekordselt diferentseeritud kandelaine faas ja täisarvuliste mitmetähenduslikkuste lahendamine LAMBDA-ga), frame-coestimation (pinnajaam ja orbiitrid lisatud Maa jaamade ulatuse mõõtmisele seitsmeparameetrilise Kuu tugisüsteemi datumi jaoks), space-tie (GNSS, VLBI ja laserulatus ühel kosmoseaparaadil, tugisüsteemi seose täpsus kohaliku seose vea suhtes) ja geodesy-sensitivity (Kuu Love'i arvude h2, k2, l2 ja füüsikalise libratsiooni Fisheri informatsioon laserulatuse, orbiitri jälgimise, pinnagravimeetri ja pinnakella põhjal). Piiratud kolme keha mudel kindlaksmääratud lihtsustustega; numbrilisi lahendusi kontrollitakse sõltumatute programmide vastu ja midagi ei võrrelda Kuu suuruse mõõtmisega.

# text
seg-f3b4a80a739b = graafikut ei ole: näide ei kirjuta diagrammi

# text
seg-4b6daea39f5c = Kuu lõunapooluse ARAIM kaitsetaseme läbilend vs esinduslik LunaNet releekomplekt. sigma_ure_m avab signaal-ruumis ulatuse täpsuse (kaitsetasemed skaleeruvad sellega lineaarselt, seega selle pühkimine vastab küsimusele, millist ulatuse täpsust häirepiir nõuab). Vaikimisi ajalooline LNIS-klassi lõunapooluse juhtum.

# attr:alt
seg-610fa190a393 = Mootori joonistatud diagramm failile scenarios/lunanet-araim.toml, liik lunar-integrity

# text
seg-5a4dcb93a643 = Modelleeritud Kuu koostalitlusvõime eksport: väljastab Kuu tugisüsteemi, Kuu ajaskaala ja Kuu efemeriidi LunaNet/IOAG-ga joondatud, CCSDS-põhistes vahetusvormingutes koos edasi-tagasi / väljade standardi järgimisega. KASUTAB UUESTI crate CCSDS OEM { "2.0" } väljastajat + parserit (crate::oem), mis on Kuu konteksti jaoks ümber märgitud — OEM REF_FRAME kannab IAU { "2015" } WGCCRE Kuu keha tugisüsteemi (MOON_ME / MOON_PA), TIME_SYSTEM Kuu ajaskaalat (LTC / TCL / UTC), CENTER_NAME = MOON — näidis-illustratiivse LCNS-klassi efemeriidi üle (asukohad failist crate::lunar_service, kiirus lõpliku erinevusega). Väljastab ka LunaNet/IOAG-ga joondatud Kuu aja kirjeldaja (skaala id, sekulaarne kiirus µs/päevas failist crate::lunar_time, avaldatud riba, etalonpind), mis teeb serde_json kaudu edasi-tagasi ringi, ja pakendab artefaktid olemasolevasse KIF ümbrisesse (crate::interchange) MODELLED ausameelsuse sildiga. Esitab väljastatud artefaktid, OEM ridade arvu, väljade standardi järgimise läbimise + olemasolevate/puuduvate väljade loendi, OEM edasi-tagasi ringi korras, aja metaandmete edasi-tagasi ringi korras ja KIF baidisuuruse. MODELLED — deterministlik edasi-tagasi ring + väljanimede standardi järgimine avaldatud CCSDS OEM + LunaNet/IOAG väljasemantika vastu on sõltumatu etalon; MITTE sertifitseeritud koostalitlusvõime standardi järgimise test; illustratiivne avaliku allikaga efemeriid, ESA-ga sidumata; ei ole TRL/pärandi/agentuuri heakskiitu.

# attr:alt
seg-0e86ff364c17 = Mootori joonistatud diagramm failile scenarios/lunar-interop-export.toml, liik lunar-interop-export

# text
# c1: jamming
seg-a91a9ad5d8d1 = Kuupõhine RF segamine: satelliidipõhine segaja ja signaali suhe, efektiivne C/N₀ ja haakumise kadu selenograafilise pinnakasutaja jaoks Kuu pinna (või kõrgendatud) segaja all, illustratiivse avaliku allikaga Moonlight/LCNS-klassi Kuu orbiidi konstellatsiooni üle. Ühendab olemasoleva avatud segamisfüüsika (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) olemasoleva Kuu taevageomeetriaga (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geomeetriat ega radiomeetriat ei tuletata uuesti. Erinevalt Maa liigist <c1/> EI OLE signaaliosa fikseeritud vastuvõetud võimsus: iga satelliidi isotroopne vastuvõetud võimsus on selle enda lingieelarve EIRP − FSPL(kaldvahemaa), seega J/S varieerub satelliiditi Kuu vahemaa ja elevatsiooniga. Esitab ÜKS RIDA IGA NÄHTAVA (epohh, satelliit) LINGI KOHTA — asimuut, elevatsioon, kaldvahemaa, mõlemad vastuvõetud võimsused, mille vahe J/S on, J/S, nominaalne ja efektiivne C/N₀ ning haakumise olek — pluss koondnäitajad selle tabeli kõrval (mitte selle asemel) ja sama tabel CSV artefaktina. Iga väljastatav arvväli kannab ühikut ja päritoluklassi. VALIDATED alamtulemused kannavad oma lähtemooduli sõltumatut etaloni (Kaplan & Hegarty §{ "9.4" } segamisvastane võrrand ja J/S link, väliselt viidatud failis tests/gnss_denied_jamming_resilience_reference.rs; modulis lunar_service Kuu geomeetria). Koostet ennast ristkontrollitakse sõltumatu kahe lingieelarve tee vastu (linkbudget::received_signal_power_dbw, teistsugune vabaruumi kao avaldis) täpsuseni { "1e-9" } dB. MODELLED: illustratiivne konstellatsioon, esinduslik EIRP / segaja võimsus / antenni võimendused / müratemperatuur ning maastikuvarjutuse, mitmeteelevi, AGC dünaamika ja adaptiivse nullimise puudumine. Mitte sertifitseeritud teenusetõkestamise toode. Kui segaja on seadistatud, kannab aruanne ka KEELUKONTUURI KOOS MÄÄRAMATUSE VÖÖNDIGA, mitte ühest skalaarist välja loetud kontuuri: kogu mõõdetud soovitud signaali C/N₀ jaotus satelliidipõhise tabeli üle (n, min, p05, p25, mediaan, p75, p95, max, keskmine, valimi standardhälve ja valimi enda asümmeetria) ning kontuur hinnatuna igal neist järjestusstatistikutest MÕLEMA mootori tunnustatava keelukriteeriumi all — senine võimsussuhte oma (J/S = { "30" } dB, nagu attack-surface ja tracking-loop puhul) ja haakumise kao oma (efektiivne C/N₀ langeb väärtuseni tracking_threshold_dbhz, kriteerium, mida selle aruande enda olekuveerg kasutab) — keelamistasandi mõlemal teljel (nõutav segaja EIRP stsenaariumi eemalseisul, keelamise eemalseis stsenaariumi EIRP-l). Vööndi servad ON contour(p05) ja contour(p95), sama suletud kujuga kujutis rakendatud valimi enda kvantiilidele: mitte valimisse sobitatud sigma ega mediaan ± k·stdev, kusjuures stdev väljastatakse järjepidevuse huvides ja seda ei kasuta miski. Kvantiilil, mis on juba jälgimisläve juures või allpool, ei ole lõplikku keelavat J/S ja selle haakumise kao veerud on null koos loetud põhjusega, mitte kunagi piiratud raadius.

# attr:alt
seg-6fe8b3c6c584 = Mootori joonistatud diagramm failile scenarios/lunar-jamming.toml, liik lunar-jamming

# text
seg-200e58e189c2 = Modelleeritud ühine mitmetehnikaline Kuu OD + kella kobarhindaja SIMULEERITUD võrgul: Gaussi-Newtoni hetktõmmise sobitus, mis ühendab Maa baseline-i geodeetilised VLBI viivitused, Kuu-kohalikud jaama↔satelliidi ulatused ja satelliitidevahelised ulatused, et taastada koos Kuu pinnajaama 3-D asukoht, väikese konstellatsiooni asukohad ja iga vahendi kellanihe süstitud tõest. Peamine aus tulemus — VLBI teeb jaama täieliku 3-D asukoha vaadeldavaks seal, kus ainult Kuu-kohalik ulatuse mõõtmine jätab nõrgalt vaadeldava suuna — esitatakse jaamavea kontrastina VLBI-ga vs ilma. MODELLED simuleeritud suletud ahelaga taastamine (tõde jagab vaatlusmudelit), deterministlik (algväärtusega (seed)), MITTE päris andmetega valideeritud; lahendajas ei ole jõumudeli levitamist; ei ole TRL/pärandi/agentuuri heakskiitu.

# attr:alt
seg-cfa051b87e59 = Mootori joonistatud diagramm failile scenarios/lunar-joint-od-clock.toml, liik lunar-joint-od-clock

# text
seg-25455a33523c = Seitsmeparameetriline Helmerti Kuu tugisüsteemi datum, mida juhib PÄRIS, ARHIVEERITUD vaatluskampaania, mitte simuleeritud. Kus lunar-frame-campaign eemaldas süstitud teisenduse, kuid esitas siiski oma jaamavõrgu, ajakava ja vaatluspõhise sigma ILLUSTRATIVE sisenditena, võtab see liik kõik kolm mõõtmisest: epohhid on arhiveeritud ILRS Consolidated Laser Ranging Data normaalpunktide maapealse edastuse ajad, vaatlused on laserulatused, mis tegelikult lasti Kuu viiele retroreflektorimassiivile, ja iga vaatluse kaal on selle normaalpunkti enda arhiveeritud täpsus bin_rms/sqrt(n_raw), failist välja loetud. Jaamakoordinaadid tulevad IERS ITRF2020 SLR lahendusest (epohhile levitatud nende avaldatud kiirustega) ja reflektorikoordinaadid JPL DE430 Table { "7" } keskmise Maa/keskmise pöörlemise tugisüsteemis, mille IAU { "2015" } WGCCRE mudel realiseerib. Ulatuse osatuletised koondatakse ühiseks reflektorikoordinaatide Fisheri informatsioonimaatriksiks ja levitatakse sama Helmerti kavandi kaudu datumi kovariatsiooniks, mida diagnoosib crate::fim::crlb. Auaste, defekt, tingimuslikkus, spekter, mittevaadeldavad suunad seitsmeparameetrilises baasis, nõrgim suund täisastmel ja iga parameetri osa sellest väljastatakse igal käivitusel ning piiramata parameeter avaldatakse väärtusega NULL ja olekuga. Massiividevaheline korrelatsioon on MEASURED täpselt nullina, mitte eeldatud, sest laserulatus puudutab ühte massiivi. Kirje, mida kataloogid ei suuda paigutada — jaam, millel ei ole avaldatud ITRF asukohta — JÄETAKSE VÄLJA JA LOETAKSE KOKKU, mitte kunagi ei anta talle asendatud koordinaati. MILLISED LINGID ON MEASURED JA MILLISED MODELLED, SEE ON ARUANNE, MITTE ALLMÄRKUS: Kuu keskpunkti efemeriid ja IAU keha orientatsioon jäävad modelleerituks ning nende koondsuurus väljastatakse vaadeldud-miinus-arvutatud ühesuunalise ulatuse jäägina üle iga kasutatud punkti; troposfäär, tahke keha looded, jaama ekstsentrilisus, poolusliikumine, UT1-UTC, relativistlik viivitus ja jaamakellad puuduvad ja asuvad selle jäägi sees. Kuna efemeriidi viga jõuab kovariatsiooni ainult iga vaatejoone suuna kaudu, lahendab iga käivitus kogu datumi uuesti kõigi osatuletistega, mis on kallutatud sensitivity_tilt_deg võrra (märk vaheldub), ja väljastab suhte, nii et kovariatsiooni tundetus modelleeritud efemeriidi suhtes on arv, mitte argument. Simuleeritud kampaania enda arvud KÄIVITATAKSE ja trükitakse mõõdetute kõrvale, mitte ei kanta üle. MODELLED: seitsmeparameetrilised arvud on Cramer-Rao piir vähendatud parameetrikomplekti jaoks päris ajakaval — mitte lahendatud datum, mitte LLR analüüs ja mitte geodeetiline toode. Kinnitatud päris andmete lõik tuleb hoidlaga kaasa, kuid mitte avaldatud crate'iga; suunake data_dir selle koopiale.

# attr:alt
seg-e4da113cbe18 = Mootori joonistatud diagramm failile scenarios/lunar-llr-datum.toml, liik lunar-llr-datum

# text
seg-f7ea776e70c9 = Modelleeritud Kuu etaloonijaama katvus: Kuu diferentsiaal-PNT mudeli Monte Carlo pühkimine üle lõunapooluse kasutajaruudustiku ja ühe päeva epohhide. Diferentsiaaletaloonijaam teadaoleval lõunapooluse asukohal parandab kindlaksmääratud konstellatsiooni (illustratiivne Kepleri või tabuleeritud efemeriid) kindlaksmääratud signaal-ruumis vea, mõõdistusvea, parandusviivituse ja lingi kvantimisega; punkti kaupa ja üle piirkonna esitab see parandatud ja parandamata asukohavea protsentiili (3-D, horisontaalne, vertikaalne), kättesaadavuse, katvuse kindlaksmääratud läve suhtes, DO-229E kaitsetasemed, katvusraadiuse asimuudi kohta ja paranduslingi eelarve jaamas ja halvimas punktis. Mitte väide ühegi päris süsteemi toimivuse kohta; ei ole seotud ühegi agentuuriga ega ühegi agentuuri heaks kiidetud. MODELLED.

# attr:alt
seg-922b8656fcae = Mootori joonistatud diagramm failile scenarios/lunar-station-coverage.toml, liik lunar-station-coverage

# text
seg-cac3a0bcbfc6 = MODELLED otsast lõpuni koordineeritud Kuu aja (LTC) ajavea eelarve: seitse LTC vealiiget, mis on kokku pandud ajavea kõveratena x_i(τ) üle kogu keskmistamisaja ruudustiku, ruutsummana kokku x_Σ(τ)-ks, ja kella-vs-tugisüsteemi RISTUMISE-τ, mille juures kasvav kellaliige ületab konstantse reaalajalise tugisüsteemi realiseerimise liikme (allpool seda on eelarve tugisüsteemiga piiratud, ülalpool kellaga piiratud) — aus vastus ühe-τ artefaktile. τ-kalded on suletud kujul ja analüütiliselt kontrollitavad (kell τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, põhjad τ^{ "0" }, mõõtmine τ^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid (crate::clock_specs); RF/optilise lingi, tugisüsteemi realiseerimise, relativistliku jäägi ja efemeriidi põhja SUURUSJÄRGUD on modelleeritud eelarve eraldised (dokumenteeritud vaikeväärtused, kutsuja poolt tühistatavad), mitte mõõtmised. Panus on reprodutseeritav ristumise-τ, mitte sertifitseeritud liikmepõhine arv; ei ole sertifitseeritud operatiivseks ajahoidmiseks.

# attr:alt
seg-56fe184f2a12 = Mootori joonistatud diagramm failile scenarios/lunar-time-budget.toml, liik lunar-time-budget

# text
seg-7f3e13712f10 = Modelleeritud relativistlik Maa–Kuu kellakiirus (Kuu koordinaataeg, LTC/TCL): sekulaarne LTC−TT kiirus omapotentsiaali erinevusest ja Kuu kineetilisest liikmest, esitatud avaldatud { "56" }–{ "59" } µs/päevas vööndiga, pluss kogunenud nihe üle horisondi.

# attr:alt
seg-e9deb6ed41c1 = Mootori joonistatud diagramm failile scenarios/lunar-time-offset.toml, liik lunar-time-offset

# text
seg-1bc37634ba9f = Kuu-VLBI jaamakoordinaatide kovariatsioon: lunar-vlbi vaadeldava viivituse osatuletised, mis on koondatud selgesõnalise AJAKAVA (baseline-id x epohhid) üle Fisheri informatsioonimaatriksiks, pööratud ja esitatud jaamakoordinaatide kovariatsioonina ning koordinaadipõhise jaamasigmana — arvutatud mootori väljund, mitte skalaarne viivituse täpsus, mis on surutud läbi eeldatud isotroopse g = { "3" } võrdjaotustegurist. Olek kannab Maaga FIKSEERITUD (ITRS) jaamakoordinaate, nii et Jacobi maatriks on inertsiaalne osatuletis, mida on pööratud iga epohhi GCRS->ITRS maatriksiga: Maa pöörlemine on see, mis teeb need koordinaadid vaadeldavaks, ja aruanne MÕÕDAB Maaga fikseeritud vaatejoone pühkimist ja majaka deklinatsiooni, mitte ei eelda neid. Üks vaatlus on üks (baseline, epohh) paar, kus MÕLEMAD jaamad on elevatsioonimaskist kõrgemal, kaalutud 1/delay_sigma_s^{ "2" }. Esitab auastme, datumi defekti, tingimuslikkuse arvu, täieliku informatsioonispektri, kovariatsioonimaatriksi, jaamapõhised telgede kaupa ja 3-D sigmad ning vaba võrgu nullruumi igal käivitusel; auastmepuuduse korral avaldatakse peamine sigma väärtusega NULL ja olekuga, mitte kunagi ei loeta seda peaaegu singulaarsest pöördmaatriksist. Võrdjaotusväärtus c<em>delay_sigma_s</em>sqrt(g/N) SAMA ajakava jaoks väljastatakse arvutatud väärtuse kõrval suhtega, koos isotroopse jäljepiiriga sqrt(p/trace(M)), mille AM-HM teeb kõvaks põhjaks — nii et suhe on anisotroopia, mille eeldus kõrvale jättis. Viivituse sulgumine tau_ik = tau_ij + tau_jk teeb geomeetriliselt sõltumatuks ainult n-1 baseline-i n(n-1)/2-st; aruanne esitab mõlemad arvud. MODELLED: Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD ja vaatlusi käsitletakse sõltumatutena, nii et kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks, mitte ennustatud seansi tulemus; viivituse sigma, jaamakoordinaadid ja ajakava on sisendid. Osatuletis, mille geomeetrilise viivituse Jacobi maatriks välja jätab (diferentseeritud Shapiro liige), mõõdetakse lõpliku erinevusega ja väljastatakse. Mitte geodeetiline toode.

# attr:alt
seg-19c383444296 = Mootori joonistatud diagramm failile scenarios/lunar-vlbi-fim.toml, liik lunar-vlbi-fim

# text
seg-e01f77d493a0 = Modelleeritud Kuu geodeetiline VLBI viivituse vaadeldav: Maa baseline (kaks maajaama, GCRS) vaatleb ühesuunalist signaali NovaMoon-klassi Kuu pinnamajakalt. Väljastab lähivälja kahe vahemaa erinevuse viivituse, selle kiiruse ja lainefrondi kõveruse lähivälja parandi üle läbilennu — ristkontrollitud sama koodibaasi tasalaine Δ-DOR vaadeldava vastu kaugvälja piiris, lõplike erinevustega kontrollitud osatuletistega. Vaikimisi analüütiline tee on MODELLED ja kannab tugisüsteemi kooskõla, xp=yp={ "0" } poolusliikumise ning tasalaine-vs-lähiväli hoiatusi. Seadistades planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path, käivitub selle asemel tuumatee (DE440, MOON_PA_DE440, ITRF93; koondunud barütsentrilised valgusajad; lisab epohhi majaka ja jaama osatuletised), mille Newtoni viivitus ja osatuletised ühtivad NAIF SPICE koondunud valgusaegadega täpsusega { "0.06" } ps ja { "7.4e-9" }. Ei ole valideeritud päris VLBI andmete vastu.

# attr:alt
seg-07d97fc1abac = Mootori joonistatud diagramm failile scenarios/lunar-vlbi.toml, liik lunar-vlbi

# text
seg-28c6a5644152 = Modelleeritud tsislunaarse navigatsiooniteenuse teeninduspiirkonna analüüs ILLUSTRATIVE, avalikest allikatest pärit Moonlight/LCNS-klassi Kuu orbiidi satelliidikonstellatsioonist (ESAga seotud ei ole): käib läbi selenograafilise laius- ja pikkuskraadi ruudustiku ajahorisondi jooksul ning annab DOP-i / katvuse / kättesaadavuse (≥{ "4" } satelliiti JA PDOP < lävi) ning üldistatud Kuu ARAIM-i kaitsetaseme (HPL/VPL) ümbriku üle piirkonna. DOP-i geomeetria KASUTAB UUESTI gnss_lib_py abil VALIDATED tuuma (crate::orbit::dop); kaitsetase KASUTAB UUESTI LunaNet LNIS-i Kuu ARAIM-i masinavärki (crate::lunar, σ_URE≈{ "30" } m) ja taandub erijuhuna olemasolevaks lõunapooluse kaitsetasemeks. MODELLED koostis: ringikujuline või elliptiline Kepleri releekomplekt (mitte tegelik diferentsiaalselt korrigeeritud LCNS/NRHO efemeriid), keskmise pöörlemisega Kuu (ilma libratsiooni ja pretsesseeruva poolusteta). Deterministlik (puhas geomeetria). TRL-i, kogemuspärandit ega agentuuri heakskiitu ei väideta.

# attr:alt
seg-edb738273a3a = Diagramm, mille mootor kirjutab failile scenarios/moonlight-service-volume.toml, liik moonlight-service-volume

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-efd15cff3d32 = MODELLED (tulemuse silt)

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/lunar-and-cislunar.md
seg-a240ef37dc6d = Source: <c1/>

# text
seg-befef5f2f8dd = Kuu ja tsislunaarne ruum (stsenaariumi liikide perekond)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Teemalehed: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Käivita üks: <c1/>. Kõik perekonnad: <a4>KINDS.md</a4>.

# attr:alt
seg-15b8e26dc24b = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Kuu ja tsislunaarne ruum liikide jaoks

# text
seg-fd2a12be04c2 = Kuu lõunapooluse ARAIM-i kaitsetaseme läbimine võrreldes esindusliku LunaNeti releekomplektiga.

# text
seg-240eb5858113 = Modelleeritud relativistlik Maa–Kuu kella käik (Kuu koordinaataeg, LTC/TCL): sekulaarne LTC−TT käik omapotentsiaalide vahest ja Kuu kineetilisest liikmest, esitatud avaldatud { "56" }–{ "59" }

# text
seg-177bff8d753e = MODELLED otsast lõpuni Kuu koordineeritud aja (LTC) ajaveaeelarve: seitse LTC veaterminit koondatud ajavea kõverateks x_i(τ) kogu keskmistamisaja ruudustikul, ruutsummana liidetud x_Σ(τ)-ks, ning c

# text
seg-df0437ef8324 = Modelleeritud Kuu geodeetilise VLBI viivituse vaadeldav: Maa baasjoon (kaks maajaama, GCRS) vaatleb ühesuunalist signaali NovaMoon-klassi Kuu pinna majakalt.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Lunar-VLBI jaamakoordinaatide kovariatsioon: lunar-vlbi vaadeldava viivituse osatuletised, mis on kogutud selgesõnalise AJAKAVA (baasjooned x epohhid) kohta Fisheri infomaatriksiks, pööratud, ja esi

# text
seg-23706714da99 = Modelleeritud ühine mitmetehnikaline Kuu OD + kella paketthinnang SIMULEERITUD võrgul: Gauss–Newtoni hetktõmmise sobitus, mis liidab Maa baasjoone geodeetilised VLBI viivitused, Kuu-kohalikud jaama↔satelliidi kaugused

# text
seg-2359450b3967 = Modelleeritud Kuu tugisüsteemi realiseerimine: 7-parameetriline Helmerti (sarnasus)datumi sobitus — { "3" } nihe, { "3" } väikese nurga pööre, { "1" } mõõtkava — mis seob hinnatud selenograafiliselt tuletatud MCMF punkti k

# text
seg-2a5af9961e99 = Seitsmeparameetriline Helmerti (sarnasus)tugisüsteemi datum, mida juhib SIMULEERITUD VAATLUSKAMPAANIA, mitte sisestatud teisendus.

# text
seg-3615bea1ea75 = Seitsmeparameetriline Helmerti Kuu tugisüsteemi datum, mida juhib REAALNE ARHIVEERITUD vaatluskampaania, mitte simuleeritud.

# text
seg-5413116b8b42 = Modelleeritud Kuu navigatsiooniteenuse teenindusmahu analüüs ILLUSTRATIVE avaliku allika Moonlight/LCNS-klassi Kuu orbiidi konstellatsioonist (ESA-ga sidumata): pühib selenograafilist laius-/pikkusruudustikku üle

# text
seg-a0e202b3566c = Modelleeritud Kuu DIFERENTSIAAL-PNT (Kuu DGNSS/SBAS-i analoog): NovaMoon-klassi tugijaam TEATUD selenograafilises asukohas arvutab satelliidipõhised diferentsiaalparandused ILLUSTRATIVE

# text
seg-ed4ec8b6378c = Modelleeritud Kuu tugijaama katvus: Monte Carlo pühe Kuu diferentsiaal-PNT mudelist üle lõunapooluse kasutajaruudustiku ja ühe päeva epohhide.

# text
seg-aeec32be6092 = Kuu orbitaalse navigatsiooniteenuse pinnamajakatega täiendamine käivitatava enne/pärast tabelina.

# text
seg-b28693368acd = Modelleeritud Kuu koostalitlusvõime eksport: väljastab Kuu tugisüsteemi, Kuu ajaskaala ja Kuu efemeriidi LunaNet/IOAG-iga joondatud, CCSDS-põhistes vahetusvormides koos edasi-tagasi / väljade standardi järgimisega

# text
seg-d88605893c05 = MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6): jälgib nelja kosmoseaparaadi diferentsiaalselt korrigeeritud tasapinnalist DRO konstellatsiooni satelliitidevahelise kaugusmõõtmisega ja annab aru, kui palju kosmoseaparaadi

# text
seg-8eaec90d1df5 = MODELLED sõltumatu hindaja test tsislunaarse kaare pikkuse jälgitavuse läve kohta.

# text
seg-9619b3d699c6 = Kuu pinnanavigatsiooni signaaliturbe ründepind (P1): komponeerib avatud signaaliturbe analüüsid üheks binaarselt kättesaadavaks jooksuks.

# text
seg-64c78e211181 = Kuu-natiivne RF-segamine: satelliidipõhine segaja ja signaali suhe, efektiivne C/N₀ ja lukustuse kadu selenograafilisele pinnakasutajale Kuu pinna (või tõstetud) segaja all, üle illustratiivse avaliku

# text
seg-df68720ee7a5 = Maa GNSS-i vastuvõtt Kuu kaugusel: nõrkade signaalide kiht, mida konfliktikindluse töö nimetab ja mille jaoks mootoril mudelit ei olnud.

# text
# c1: study
seg-e6475fe9f443 = MODELLED uuringud Kuu orbiidist ja pinnast navigatsiooni- ja geodeesiataristuna, viis uuringut ühe liigi taga, mida valib <c1/>: od-consistency (pardal toimuv Maa GNSS-i orbiidi määramine

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-da20b48985b9 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-integrity</a1>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-0f0b2d0ca0b4 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-time-offset</a1>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-time-budget</a1>.

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-79140f2544ea = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

# text
seg-de468e4d4b46 = <b>Register (ledger):</b> MODELLED { "3" } · VALIDATED { "3" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-vlbi</a1>.

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-7da3c3ff2386 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-3119d4005897 = <b>Register (ledger):</b> MODELLED { "3" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-vlbi-fim</a1>.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-6f59a33a35b3 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-142f2253e4d6 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-joint-od-clock</a1>.

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-32c31af24e1b = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-73c0415efd2f = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-frame-realisation</a1>.

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-96efcb8d55d1 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-ce2f0f85dda4 = <b>Register (ledger):</b> MODELLED { "2" } · VALIDATED { "3" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-frame-campaign</a1>.

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-d9e24a9a8c0c = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-4f05fad4b146 = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-llr-datum</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-8d9e0277303e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-6fe67fa619d0 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-c83350735643 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-differential-pnt</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-facc442295f1 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

# text
seg-8a2f6f535c4a = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-station-coverage</a1>.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-a790c54ac1aa = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-4efffcd615df = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-019ca0f1051e = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-interop-export</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-28695dd2ecc3 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-af5d871bc69e = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>cislunar-observability</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-f646e9fd7553 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-5e7bd8bb1adf = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>cislunar-arc-recovery</a1>.

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-3c514f3acc78 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

# text
seg-00b06a4fc0e0 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-attack-surface</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-079d2bb805f1 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-63d4157e2294 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-jamming</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-7bb977529f30 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-287f89e6bf6b = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>earth-gnss-lunar</a1>.

# text
# c1: study
# c2: seed
# c3: orbit
# c4: gnss
# c5: ground
# c6: monte_carlo
# c7: surface
# c8: llr
# c9: orbiter
# c10: gravimeter
# c11: clock
# c12: techniques
# c13: nominal
seg-f7ed8b60e7d1 = Kohustuslikud väljad: <c1/>. Valikulised: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-41e50e49da99 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Eelmine</s1>Madala Maa orbiidi navigatsioon

# text
seg-74c6bf83988e = <s1>Järgmine</s1>Missioonianalüüs, sidelingid ja kosmoseoperatsioonid
