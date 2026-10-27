# docs--kinds-gnss-measurements-positioning-and-integrity: translations (fi)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Tyyppi

seg-06197409c717 = Julkaistut ARAIM-viitevektorit: moottorin ARAIM-vaaka- ja pystysuuntaiset suojaustasot ajettuna WG-C ARAIM Technical Subgroupin OMIA lasketuja esimerkkejä vastaan toleranssilla (TOL_PL = { "5e-2" } m), jonka nämä asiakirjat itse ilmoittavat. Kaksi vektoria on kiinnitetty testikiinnitteiksi, kukin mukanaan noutoosoite, noutopäivä, lähdetiedoston SHA-256 ja sivu: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — sisäisesti johdonmukainen ja hyväksymisvektori — sekä Milestone { "3" } Report ({ "2016" }) Annex A, osa A.IX, väite, johon tutkimusbibliografiat viittaavat. Jokainen julkaistu syöte (10 satelliitin 2 satelliittitähdistön geometriamatriisi, C_int- ja C_acc-varianssidiagonaalit, b_nom, P_sat, P_const ja LPV-200-vakiojoukko) ja jokainen julkaistu tulos (VPL, HPL, EMT, sigma_v_acc, K_fa_3 sekä kahden tähdistövikatilan sigma_3, sigma_ss_3 ja b_3) raportoidaan moottorin oman lukunsa vieressä ja niiden absoluuttisen eron kanssa. Suojaustasoyhtälöä EI ratkaista tässä uudelleen: viitteen tilalista annetaan moottorin olemassa oleville funktioille raim::araim_protection_level / araim_integrity_risk, joten testattavana oleva puolitus ja Gaussin hännän algebra ovat moottorin omia; vain geometria, aliratkaisut, havaitsemiskynnykset ja julkaistu budjettijako rakennetaan sitä varten. ULKOISESTI TARKISTETTU { "2019" } -vektoria vastaan: VPL { "18.2926" } m vs { "18.3" } m julkaistu, HPL { "13.4063" } m vs { "13.45" } m, EMT { "7.2997" } m vs { "7.2998" } m, sigma_v_acc { "1.3694" } m vs { "1.3694" } m, ja kaikki kuusi julkaistua välitulosta puolen yksikön tarkkuudella viimeisessä painetussa desimaalissa. Vektorissa { "2016" } on kaksi sisäistä virhettä, jotka raportti toteaa eikä piilota — etumerkkivirhe matriisin G rivillä { "3" } ja K_fa_3, joka on laskettu { "57" } vikatilalle, vaikka asiakirja ilmoittaa N_fault_max = { "1" } ({ "12" } tilaa) — joten sen geometrian välitulokset toistuvat täsmälleen, mutta sen suojaustasot raportoidaan mitattuina poikkeamina ja jätetään pois hyväksymisluvusta; toleranssia ei koskaan laajenneta niiden absorboimiseksi. Jokainen tuotettu numeerinen kenttä sisältää yksikön ja alkuperäluokan, ja jäljennetty luku nimetään <c1/>, jotta sitä ei koskaan voi sekoittaa lasketun kanssa. RAJAUS: vain N_fault_max = { "1" } (yhden satelliitin ja yhden satelliittitähdistön vikatilat) on toteutettu, ja tapaus, jonka priorit vaativat samanaikaisia monitapahtumavikajoukkoja, on REFUSED eikä sitä typistetä hiljaa; vian havaitseminen, poissulkeminen, khiin neliö -johdonmukaisuustarkistus ja viitealgoritmin kaksoislaskennan uudelleenjakovaihe ovat soveltamisalan ulkopuolella. Tämä toistaa julkaistun viitealgoritmin lasketun esimerkin — se ei ole sertifiointi, lentokelpoisuusasiakirja eikä hyväksyntä.

seg-693c823c85d1 = Moottorin kirjoittama kaavio skenaariolle scenarios/araim-reference-check.toml, laji araim-reference-check

seg-2ffccc9c1eff = Mittausalueen pseudoetäisyyssimulaatio (Klobuchar-ionosfääri, Saastamoinen/Niell-troposfääri) + RAIM.

seg-47ee40d4eb73 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/gnss-sim-raim.toml, skenaariotyyppi gnss-sim

seg-eb7e0c2feb2b = Snapshot-, ratkaisuerottelu- ja ARAIM-RAIM HPL/VPL-arvoilla ja Stanford-diagrammilla.

seg-ce7f6130ddee = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/integrity-raim.toml, tyyppi integrity

seg-b7b67e03f125 = Todellisen havainnon yksipistepaikannus: ratkaise vastaanottimen paikka RINEX { "3" } -havaintotiedostosta ja yleislähetetystä navigointitiedostosta (koodipseudoetäisyydet, yleislähetetty efemeridi, Klobuchar-ionosfääri, Saastamoinen/Niell-troposfääri), valinnaisesti validoituna mitattua koordinaattia vasten.

seg-d76d59644d84 = Moottorin kirjoittama kaavio skenaariolle scenarios/pvt-abmf.toml, tyyppi pvt

seg-edfcb546d9de = Reaaliaikaisen kuukoordinaatiston / Maan orientaation ennustebudjetti: P4 taulukko { "1" } (koordinaatistovirheen johdonmukaisuustarkistus — jälkikäsitelty ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaaliaikainen ~{ "15" } m ↔ ~{ "0.5" } ms, kukin koordinaatiston paikka ilmaistuna vastaavana UT1-virheenä L19-vipuvarren Δr = D_EM·ω⊕·ΔUT1 kautta) ja taulukko { "2" } (mitattu UT1-ennustevirhe vs. horisontti — L18-käyrä luettuna suoraan todellisesta IERS finals2000A -sarjasta: Bulletin A − Bulletin B -lopullinen lattia ja usean päivän pysyvyysennustimen virhe, kumpikin kuvattuna Kuun koordinaatiston paikaksi L19:llä), sekä L21 neliösummattu reaaliaikainen koordinaatistovirhebudjetti (EOP + efemeridi + toteutuslattia). VALIDATED suljettu muoto (L19-vipuvarsi, ω⊕ ristiintarkistettu CIO-Maan pyörimiskulmaa vasten) ja VALIDATED todellinen data (L18-käyrä todellisilta finals2000A-riveiltä); MODELLED ovat kuun releiden radanmäärityksen kovarianssien suuruudet ja koordinaatiston toteutuslattia (edustavat osuudet) sekä pysyvyysennustin (ei IERSin operatiivinen Bulletin A -algoritmi). Ei sertifioitu reaaliaikainen koordinaatistotuote.

seg-2721ed7727bb = Moottorin kirjoittama kaavio skenaariolle scenarios/realtime-frame-eop.toml, tyyppi realtime-frame-eop

# text
seg-5f25c5b71f0c = Avaruussään ympäristömalli: aurinko- (F10.7/F10.7a) ja geomagneettiset (Kp, määritelmällisellä Kp↔ap-taulukolla) aktiivisuusindeksit, niiden ohjaama Jacchia-1971-eksosfäärilämpötila (validoitu julkaistuja aurinkominimiä/keskiarvoa/maksimia vastaan) sekä Jacchia-1971-termosfäärin neutraalitiheys päivittäisessä keskimääräisessä eksosfäärilämpötilassa verrattuna aktiivisuudesta riippumattomaan staattiseen profiiliin usealla korkeudella — aurinkosyklin tiheysriippuvuus, jonka staattinen ilmakehä jättää pois. MODELLED: tiheys vastaa kiihtyvyysmittareista johdettuja tiheyksiä (TOLEOS CHAMP ja GRACE) kertoimen { "2" } sisällä aurinkomaksimissa, mutta on noin 1.7x liian tiheä vuoden { "2008" } aurinkominimissä.

# attr:alt
seg-c1c6f2f73fb5 = Moottorin kirjoittama kaavio skenaariolle scenarios/space-weather.toml, laji space-weather

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Lähde: <c1/>

# text
seg-569fac649b5d = GNSS-mittaukset, paikannus ja eheys (skenaariolajiperhe)

# text
seg-63c3a7483268 = { "6" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Aihesivut: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Aja yksi: <c1/>. Kaikki perheet: <a5>KINDS.md</a5>.

# attr:alt
seg-9c60c8803b6b = Kuvakooste moottorin kirjoittamista kaavioista perheen GNSS-mittaukset, paikannus ja eheys lajeille

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Oikeisiin havaintoihin perustuva yhden pisteen paikannus: ratkaise vastaanottimen paikka RINEX { "3" } -havaintotiedostosta ja broadcast-navigointitiedostosta (koodipseudoetäisyydet, broadcast-efemeridi, Klobuchar-ionosfääri, Saastamo

# text
seg-da89c260b1a3 = Julkaistut ARAIM-sertifiointivertailuvektorit: moottorin ARAIM-vaaka- ja pystysuojaustasot ajettuna WG-C ARAIM Technical Subgroupin OMIA laskettuja esimerkkejä vastaan, toleranssilla

# text
seg-7a750a89c9c4 = Avaruussään ympäristömalli: aurinko- (F10.7/F10.7a) ja geomagneettiset (Kp, määritelmällisellä Kp↔ap-taulukolla) aktiivisuusindeksit, niiden ohjaama Jacchia-1971-eksosfäärilämpötila (validoitu julkaistuja

# text
seg-d79d4d58275b = Reaaliaikainen kuun koordinaatisto / Maan orientaation ennusteen budjetti: P4 taulukko { "1" } (koordinaatistovirheen johdonmukaisuustarkistus — jälkikäsitelty ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaaliaikainen ~{ "15" } m ↔ ~{ "0.5" } ms, kukin koordinaatiston paikka ilmaistuna

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Valinnaiset: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Kirjanpito:</b> MODELLED { "6" } · VALIDATED { "4" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>. Valinnaiset: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Kirjanpito:</b> VALIDATED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Pakolliset kentät: <c1/>, <c2/>. Valinnaiset: <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>.

# text
seg-415f1fa78518 = <b>Kirjanpito:</b> VALIDATED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>space-weather</a1>.

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-64c512530ee6 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Kirjanpito:</b> MODELLED { "1" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Edellinen</s1>Satelliittitähdistöt, kattavuus ja geometria

# text
seg-2cdfd7f8bfb3 = <s1>Seuraava</s1>GPS-denied-vaihtoehtoinen PNT
