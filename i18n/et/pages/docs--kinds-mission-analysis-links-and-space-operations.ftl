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

# text
# c1: docs/kinds/mission-analysis-links-and-space-operations.md
seg-69ee217ed8e0 = Source: <c1/>

# text
seg-f5091cbeecbf = Missioonianalüüs, sidelingid ja kosmoseoperatsioonid (stsenaariumi liikide perekond)

# text
seg-d0eea6d9d1ad = { "14" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/launch-window.toml
seg-6481dabc9458 = Teemalehed: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Käivita üks: <c1/>. Kõik perekonnad: <a4>KINDS.md</a4>.

# attr:alt
seg-d6c5a581ffaf = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Missioonianalüüs, sidelingid ja kosmoseoperatsioonid liikide jaoks

# text
seg-8d65a4a1948d = Kahekeha stardi- ja tõusugeomeetria: stardiazimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, kinkpöörde tasandimuutuse Δv, kui sihtm

# text
seg-dd47e755d262 = Mitmeastmelise kanderaketi tasapinnaline gravitatsioonipöörde tõus mittepöörleval sfäärilisel Maal läbi USA standardatmosfääri { "1976" } (vertikaalne tõus, kaldenurga nõks, tõukejõud piki kiirust), integreerides gravit

# text
seg-cc88f37328a3 = Allen-Eggersi ballistilise atmosfääri sisenemise koridor: maksimaalne aeglustus (ballistilisest koefitsiendist sõltumatu, V_e^{ "2" } sin/γ//(2eH)), kiirus ja kõrgus maksimaalse g-koormuse juures ning maksimaalse kuumenemise kiirus, sisenemiskiiruse jaoks

# text
seg-8ad7c34d8c25 = 3-DoF punktmassi atmosfääri sisenemine pöörleval sfäärilisel Maal või Marsil (ballistiline või tõstejõuga konstantse kaldenurgaga), RK4, läbi US76, eksponentsiaalse või Marsi atmosfääri, Sutton-Gravesi stagnatsiooni

# text
seg-efe896d3f43b = Maa vaatluse kasulikkoormuse jalajälje ja katvuse geomeetria (SMAD kosmosekolmnurk): Maa nurkraadius, haardelaius, nadiiri maapinna diskreetimissamm, maksimaalne nadiirist kõrvalekaldega ligipääs, ringperiood, J2 sõlmeperio

# text
seg-d3d9652fd8a0 = Nadiirkujutaja radiomeetria ja pildikvaliteet: Lambertilise stseeni apertuuri radiants, kaameravõrrand, signaal ning sähvatus-/tume-/lugemis-/kvantimismüra ja SNR; süsteemi MTF Nyquisti juures (difraktsioon

# text
seg-1940d5c75a98 = 3-DOF asendi ja sihtimisvea eelarve: halvima juhu gravitatsioonigradiendi häiriv pöördemoment ((3/2)(μ/R³)ΔI) ja ruutsummapõhine sihtimisvea eelarve nimetatud 1σ panuste kohta (andurimüra, reakts

# text
seg-e00d18fbb52b = Kosmoselaeva asendijuhtimine: jäiga keskosa inertsiaalsihtimisega pööre kolme või enama tasakaalustatud reaktsiooniratta abil MRP tagasisidega (L = -K sigma - P omega), minimaalse normiga ratta pöördemomendid, piiratud iga

# text
seg-496fa280de7b = Ühesuunaline sidelingi eelarve CCSDS { "401" } / DSN 810-005 sidelingi võrrandi järgi: vabaruumi levikadu, C/N₀, Eb/N₀, varu ja sulgumine etteantud saatja EIRP, vastuvõtja G/T, kauguse, andmekiiruse ja sagedusriba (s/x/ka) korral vastu

# text
seg-f0aca7ea1ffa = Üks satelliit ühe jaama kohal: iga läbilennu kaldekaugus, kõrgusnurk ja Es/N0 piki läbilendu, igal sammul valitud DVB-S2 MODCOD (ETSI EN { "302" } 307-1 tabeli { "13" } läved pluss teostusvaru)

# text
seg-44c4890ba07e = Maajaamaga kontaktide planeerimine mitme satelliidi jaoks mitme jaama kohal: näilised ligipääsuaknad (SGP4, IAU 2006/2000A Maaga seotud tugisüsteem, ITU-R P.834 refraktsioon, valgusaeg), DVB-S2 ACM andmemaht

# text
seg-19ab136e9f9b = Apertuuri töötsükkel: navigatsiooni ja side ajajaotus, mille kontaktiplaan määrab juhitavate apertuuride kogumile.

# text
seg-ee0c649ca8b2 = CCSDS 133.0-B Space Packet Protocol raamistus: kodeerib sünteetilise TM/TC pakettide voo (6-oktetine põhipäis + andmeväli) ning annab aru pakettide kaupa päise dekodeerimisest, oktettide koguarvust ja täpsest kodeerimine↔dekodeerimine

# text
seg-e561f3a749db = CCSDS OEM koostalitlussild: impordib välise lennudünaamika tööriista (GMAT/Orekit/STK kõik väljastavad OEM-i) loodud orbiidi efemeriidi sõnumi ja annab aru selle segmentidest/objektidest/tugisüsteemidest/epohhide ulatusest ning

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-1f074d7beccc = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-8f65824c39c5 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>launch-window</a1>.

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-2926bde689d3 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-66f6489411d0 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>ascent-losses</a1>.

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-481ce1d98bc7 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-fff98550eb48 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>reentry</a1>.

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-9cf8d4b6064f = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-84e1bddcbc95 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>entry-heating</a1>.

# text
# c1: altitude_km
# c2: half_fov_deg
# c3: ifov_microrad
# c4: max_off_nadir_deg
# c5: inclination_deg
seg-eab43348803e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-9c6ce756a89a = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>eo-coverage</a1>.

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-cd84a7bdbe57 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

# text
seg-320d724ac797 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>eo-radiometry</a1>.

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-905487bf50f1 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-14511e367361 = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>attitude-budget</a1>.

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
# c6: duration_s
# c7: dt_s
# c8: sample_s
# c9: omega0_rad_s
# c10: pointing_threshold_deg
# c11: estimator
seg-540fa1932dad = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valikulised: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-6d2e9b9ce87f = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>aocs</a1>.

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-3345731b5729 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-f8b896b81014 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>link-budget</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-e38e356f4b71 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-eed876ed5aab = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>acm-link</a1>.

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-5fddd2460fb0 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-58d00faa1eda = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>contact-schedule</a1>.

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-5d4f6861f301 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1e06e06d4325 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>aperture-duty-cycle</a1>.

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-9bb424e01c84 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-688071019c9e = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>space-packet</a1>.

# text
# c1: oem_text
seg-03c06f9fdc85 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>.

# text
seg-568c484ce9a0 = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>oem-interop</a1>.

# text
seg-41996765fcf1 = <s1>Eelmine</s1>Kuu ja tsislunaarne ruum

# text
seg-1951c46fe429 = <s1>Järgmine</s1>Optiline PNT

seg-e77c46e23e67 = <s1>Järgmine</s1>Missiooniahelad
