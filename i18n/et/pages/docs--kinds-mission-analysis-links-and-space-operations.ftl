# docs--kinds-mission-analysis-links-and-space-operations: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
seg-cb9447893c7f = Üks satelliit ühe jaama kohal: iga läbilennu kaldkaugus, kõrgusnurk ja Es/N0 piki läbilendu, igal sammul valitud DVB-S2 MODCOD (ETSI EN { "302" } 307-1 tabeli { "13" } läved pluss realisatsioonivaru) ja andmemaht, mida ACM liigutab võrreldes konstantse kodeerimise lähtetasemega, mis sulgub maskil. MODELLED.

# attr:alt
seg-046f69293874 = Diagramm, mille mootor kirjutab stsenaariumi scenarios/acm-link.toml jaoks, liik acm-link

# text
seg-7eff466eb018 = Kosmoseaparaadi asendijuhtimine: jäiga korpuse inertsiaalsuunatud pööre kolme või enama tasakaalustatud reaktsiooniratta abil MRP-tagasisides (L = -K sigma - P omega), minimaalse normiga ratta pöördemomendid, piiratud iga mootori piirini, RK4 nulljärgu hoidega; soovi korral suletud multiplikatiivsel EKF-il simuleeritud güroskoobist (nurga ja kiiruse juhuslik ekslemine) ja tähejälgijast. Annab settimisaja, lõpliku ja tippsuunamisvea, ratta tippkiiruse ja -pöördemomendi, küllastunud osakaalu, nurkmomendi triivi ning hindajaga selle asendivea ja NEES-i. Tegeliku oleku ahel on VALIDATED Basilisk { "2.9.1" } vastu; hindaja on MODELLED.

# attr:alt
seg-08c624d5324d = Diagramm, mille mootor kirjutab failile scenarios/aocs-slew.toml, liik aocs

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Apertuuri töötsükkel: navigatsiooni ja side ajajaotus, mida kontaktiplaan eeldab juhitavate apertuuride kogumi jaoks. Võtab kontaktiplaani (<c1/> aos_s/los_s akende loend, millest igaüks küsib navigatsiooni või sidet — sama aos_s/los_s sõnavara, mida annab <c2/>-ennustaja), apertuuride arvu ja ARBITREERIMISPOLIITIKA (vaikimisi navigatsiooniprioriteet, või sideprioriteet, või mitte-eelistav first-come-first-served) ning annab navigatsiooni töötsükli, side töötsükli, jõudeoleku töötsükli ja seansi kohta katkestuse — kontaktiaja, mida seanss küsis ja ükski apertuur ei teenindanud. Täpne intervallipühkimine üle akende piiride, nii et kokkupuutuvad aknad ei konkureeri kunagi ja ühtegi apertuurisekundit ei loeta kaks korda; navigatsiooni, side ja jõudeoleku apertuurisekundid akumuleeritakse sõltumatult ja sulguvad suhtes apertures*horizon_s. Aruanne esitab lahendatud poliitika, selle täieliku määratluse ning töötsükli ja katkestuse määratlused, sest ilma arbitreerimispoliitikata esitatud töötsükli arv ei ole reprodutseeritav. MODELLED ajastusaritmeetika: apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega, otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist ning kontaktiaknad on sisendid — nende geomeetria on see, mis neid tootis. Mitte maajaama ajastustoode.

# attr:alt
seg-a8b38ed8e029 = Diagramm, mille mootor kirjutab failile scenarios/aperture-duty-cycle.toml, liik aperture-duty-cycle

# text
seg-34d041d6bd9f = Mitmeastmelise kanderaketi tasapinnaline gravitatsioonipööre mitte pöörleva sfäärilise Maa kohal läbi USA standardatmosfääri { "1976" } (vertikaalne tõus, tõusunurga lööve, tõukejõud piki kiirust), integreerides gravitatsiooni-, takistus-, juhtimis- ja vasturõhukaod ning kontrollides ideaalse dv miinus kaod põlemise lõppkiiruse vastu; max-Q, tippkiirendus ja põlemise lõppolek. MODELLED.

# attr:alt
seg-ccf2185b0b5e = Diagramm, mille mootor kirjutab failile scenarios/ascent-losses.toml, liik ascent-losses

# text
seg-62c0dda9fc56 = 3-DOF asendi ja suunamisvea eelarve: halvima juhu gravitatsioonigradiendi häiringumoment ((3/2)(μ/R³)ΔI) ja nimetatud 1σ panustajate (sensorimüra, reaktsiooniratta värin, termiline, joondus) ruutsumma-ruutjuur suunamisvea eelarve koos domineeriva liikmega orbiidi kõrguse + keha inertsihälbe jaoks. MODELLED skalaarne AOCS-i eelarve — riistvaraeelne täiendus Basilisk/42-le, mitte juhtimisahela / 6-DoF / paindemoodi simulatsioon.

# attr:alt
seg-ad0e72e3b688 = Diagramm, mille mootor kirjutab failile scenarios/attitude-budget.toml, liik attitude-budget

# text
seg-be4e928a5865 = Maajaamakontaktide planeerimine mitme satelliidi jaoks üle mitme jaama: näivad ligipääsuaknad (SGP4, IAU 2006/2000A Maaga seotud süsteem, ITU-R P.834 murdumine, valguse levimisaeg), iga pääsu DVB-S2 ACM andmemaht (ETSI EN { "302" } 307-1 tabeli { "13" } lävendid) ja konfliktivaba ajakava (üks satelliit antenni kohta ümberpööramisajaga, üks jaam satelliidi kohta, prioriteediga kaalutud edastus, piiratud iga mahajäämusega) piirväärtuse ahne meetodiga, esimesena-tulnu baasjoone ja täpse hargne-ja-piira meetodiga väikestel hulkadel, koos ahne meetodi optimaalsuse lõhega. MODELLED.

# attr:alt
seg-e26b549579e2 = Diagramm, mille mootor kirjutab failile scenarios/contact-schedule.toml, liik contact-schedule

# text
seg-b843e2e0a4ee = 3-DoF punktmassi atmosfääri sisenemine üle pöörleva sfäärilise Maa või Marsi (ballistiline või tõstejõuga konstantse kreeniga), RK4, läbi US76, eksponentsiaalse või Marsi atmosfääri, Sutton-Gravesi stagnatsioonipunkti konvektiivse kuumenemisega (NASA TR R-376): tippviivitus, soojusvoog ja dünaamiline rõhk, soojuskoormus, horisontaalkaugus, pöörleva süsteemi energiakontroll ja Allen-Eggersi suletud kuju selle kõrval. Tippviivitust kontrollitakse avaldatud Stardusti nominaali vastu; kuumenemine on MODELLED.

# attr:alt
seg-dbb618cd6357 = Diagramm, mille mootor kirjutab failile scenarios/entry-heating-stardust.toml, liik entry-heating

# text
seg-47b4aea6ed01 = Maavaatluse kasulikkoormuse jalajälje ja katvuse geomeetria (SMAD kosmosekolmnurk): Maa nurkraadius, haardelaius, nadiiri maapinna diskreetimissamm, maksimaalne nadiirist eemal ligipääs, ringperiood, J2 sõlmeperiood ja ekvatoriaalne maapinnatrajektooride vahe koos pideva katvuse lipuga, orbiidi kõrguse, kalde (vaikimisi päikesesünkroonne) ja sensori FOV/IFOV jaoks. MODELLED sfäärilise Maa geomeetria (radiomeetriat/MTF-i/atmosfääri/värinat/peegeldust ei ole); sõlmevahe R_e·(ω − Ω̇)·T_nodal esimest järku J2 sekulaarsete kiirustega.

# attr:alt
seg-c2a8332f2ee2 = Diagramm, mille mootor kirjutab failile scenarios/eo-coverage.toml, liik eo-coverage

# text
seg-816bd5a5808a = Nadiirpildistaja radiomeetria ja pildikvaliteet: Lambertiaanse stseeni apertuurikiirgus, kaamera võrrand, signaal ning footonimüra/pimevoolu-/lugemis-/kvantimismüra ja SNR; süsteemi MTF Nyquisti sagedusel (difraktsioon x detektor x määrdumine x värin), sellest suhteline servavastus, Q = lambda F/p ja GIQE versiooni { "4" } NIIRS ilma MTF-kompensatsioonita. MODELLED.

# attr:alt
seg-bf7b52f7a01e = Diagramm, mille mootor kirjutab failile scenarios/eo-radiometry.toml, liik eo-radiometry

# text
seg-7a4e6215a488 = Kahe keha starti ja tõusu geomeetria: stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg-tasandimuutuse Δv, kui sihtkaldenurk on stardikoha laiuskraadist väiksem, ja päevaste stardivõimaluste arv. MODELLED sfäärilise Maa geomeetria (ilma pöörleva Maa kiiruskolmnurga parandita, ilma tõusu- ja takistuskao mudelita).

# attr:alt
seg-9696283a95ae = Mootori joonistatud diagramm failile scenarios/launch-window.toml, liik launch-window

# text
seg-953188c11165 = Ühesuunaline lingieelarve CCSDS { "401" } / DSN 810-005 lingivõrrandi alusel: vabaruumi levikadu, C/N₀, Eb/N₀, varu ja sulgumine edastuse EIRP, vastuvõtu G/T, vahemaa, andmekiiruse ja sagedusala (s|x|ka) jaoks nõutava Eb/N₀ suhtes. Deterministlik inseneriarvutus antud sisenditest (mitte kalibreeritud terminali andmeleht).

# attr:alt
seg-bd375631bc7e = Mootori joonistatud diagramm failile scenarios/link-budget.toml, liik link-budget

# text
seg-dbffff25b57f = CCSDS OEM koostalitlussild: impordib välise lennudünaamika tööriista (GMAT/Orekit/STK väljastavad kõik OEM-i) loodud orbiidi efemeriidisõnumi (Orbit Ephemeris Message) ning annab aru selle segmentidest/objektidest/tugisüsteemidest/epohhivahemikust ja kiiruse kooskõla kontrollist; sisendita teeb see läbi loodud etalonorbiidi edasi-tagasi ringi ning annab aru impordi↔ekspordi täpsusest. MODELLED struktuurne/füüsikaline sisendikontroll, MITTE lähteandmete orbiiditäpsuse valideerimine.

# attr:alt
seg-5db5a7c812ca = Diagramm, mille mootor kirjutab failile scenarios/oem-interop.toml, liik oem-interop

# text
seg-039f77066d97 = Allen-Eggersi ballistilise atmosfääri sisenemise koridor: maksimaalne aeglustus (ballistilisest koefitsiendist sõltumatu, V_e^{ "2" } sin|γ|/(2eH)), kiirus ja kõrgus maksimaalse g juures ning maksimaalse kuumenemise kiirus sisenemiskiiruse/lennutrajektoori nurga/ballistilise koefitsiendi korral eksponentsiaalse atmosfääri kaudu, pluss sama ballistilise sisenemise tasapinnaline punktmassi integreerimine raskusjõu, Maa kõveruse ja USA standardatmosfääriga { "1976" } (maksimaalne aeglustus, kiirus, kõrgus ja aeg maksimumil). MODELLED ballistiline (tõstejõuta) sisenemine; kuumenemise väljund on maksimaalse kuumenemise KIIRUS, mitte soojusvoog (aerotermilist/TPS-i mudelit ei ole).

# attr:alt
seg-b0109481e8ff = Diagramm, mille mootor kirjutab failile scenarios/reentry.toml, liik reentry

# text
seg-de2448d74c2b = CCSDS 133.0-B kosmosepaketi protokolli raamistamine: sünteetilise TM/TC paketivoo kodeerimine (6-oktetine primaarpäis + andmeväli) ning paketipõhise päise dekodeerimise, oktettide koguarvu ja täpse kodeerimine↔dekodeerimine edasi-tagasi läbimise aruandlus. Deterministlik täpne bitipaigutusega raamistamine — agentuuride paketivormingu koostalitluskiht; MITTE standardi järgimise sertifitseerimine (lippudest kaugemale ulatuvat sekundaarpäise/CRC/segmenteerimise loogikat ei ole).

# attr:alt
seg-af1cf9aa9938 = Diagramm, mille mootor kirjutab failile scenarios/space-packet.toml, liik space-packet

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }
