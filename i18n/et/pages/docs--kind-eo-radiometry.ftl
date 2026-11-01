# docs--kind-eo-radiometry: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (liikide kataloog (<c1/>))

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-8e62cc4af6ea = Teemaleht: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-radiometry.md
seg-841259b04897 = Allikas: <c1/>

# text
# c1: eo-radiometry
seg-1b0ba13fcef1 = <c1/> (stsenaariumi liik)

# text
seg-816bd5a5808a = Nadiirpildistaja radiomeetria ja pildikvaliteet: Lambertiaanse stseeni apertuurikiirgus, kaamera võrrand, signaal ning footonimüra/pimevoolu-/lugemis-/kvantimismüra ja SNR; süsteemi MTF Nyquisti sagedusel (difraktsioon x detektor x määrdumine x värin), sellest suhteline servavastus, Q = lambda F/p ja GIQE versiooni { "4" } NIIRS ilma MTF-kompensatsioonita. MODELLED.

# text
# c1: scenarios/eo-radiometry.toml
seg-7d786a7bfb86 = Ühe <c1/> jooksu kokkuvõte: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (kaev { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

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
seg-3378b7b0716f = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/eo-radiometry.toml
seg-d613181f3fe3 = Näide <c1/> määrab muu hulgas:

# text
seg-ffb002276b21 = um

# text
seg-1c15591babed = px

# text
seg-e94f9ad9e6c4 = Tulemuse silt (mootori oma): MODELLED — nadiirpildistaja radiomeetria (Lambertiaanne stseen, kaamera võrrand, footonimüra/pimevoolu-/lugemis-/kvantimismüra), süsteemi MTF Nyquisti sagedusel (difraktsioon x detektor x määrdumine x värin), suhteline servavastus, Q = lambda F/p ja GIQE { "4" } NIIRS ilma MTF-kompensatsioonita; NIIRS on empiiriline regressioon modelleeritud sisenditel

# attr:alt
seg-bf7b52f7a01e = Diagramm, mille mootor kirjutab failile scenarios/eo-radiometry.toml, liik eo-radiometry

# text
seg-562a7cf2859c = <b>MODELLED</b> Nadiirpildistaja signaali ja müra suhte eelarve (Lambertiaanne stseenikiirgus, kaamera võrrand, footonimüra, pimevoolu-, lugemis- ja kvantimismüra), süsteemi MTF Nyquisti sagedusel kui varjutamata apertuuri difraktsiooni, detektori apertuuri, lineaarse määrdumise ja Gaus korrutis

# text
seg-dadea618d757 = <b>MODELLED</b> Nadiirpildistaja signaali ja müra suhte eelarve (Lambertiaanne stseenikiirgus, kaamera võrrand, footonimüra, pimevoolu-, lugemis- ja kvantimismüra), süsteemi MTF Nyquisti sagedusel kui korrut. Sõltumatu etalon (InternalConsistency): Suletud kujud: difraktsiooni MTF poolpiirsagedusel, puhta detektori apertuuri ühe piksli rambiserv (RER { "1" }), Gaussi hägu normaal-CDF serv (RER = erf(0.5/(sigma sqrt { "2" }))), footonimüra skaleerumine ja GIQE { "4" } koefitsiendid, nagu avaldatud (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). MIS EI OLE: ühtegi välist pildistajat, mõõdetud MTF-i ega hinnatud pilti ei ole võrreldud; GIQE on empiiriline regressioon oma

# text
# c1: label
seg-5182b4b0f8d6 = MODELLED — nadiirpildistaja radiomeetria (Lambertiaanne stseen, kaamera võrrand, footonimüra/pimevoolu-/lugemis-/kvantimismüra), süsteemi MTF Nyquisti sagedusel (difraktsioon x detektor x määrdumine x värin), suhteline servavastus, Q = lambda F/p ja GIQE { "4" } NIIRS ilma MTF-kompensatsioonita; NIIRS on empiiriline regressioon modelleeritud sisenditel, mitte hinnatud pilt (tulemus <c1/>)

# text
seg-b2f1e6466c2c = Nadiirpildistaja radiomeetria ja pildikvaliteet ILLUSTRATIVE väikese maavaatluskaamera jaoks (mitte ühegi operaatori kujundus): { "0.40" } m apertuur, { "3.6" } m fookuskaugus (F/9), { "5.5" } um pikslid, kõrguselt { "500" } km. Jooks annab { "15" } % peegeldusteguriga stseeni signaali ja müra suhte eelarve, süsteemi MTF Nyquisti sagedusel, suhtelise servavastuse ja GIQE versiooni { "4" } NIIRS-i. MODELLED: NIIRS on empiiriline regressioon, mis on hinnatud modelleeritud sisenditel, m (stsenaariumifaili kommentaar, read { "1" } kuni { "5" })

# text
seg-aaf9ed3b0899 = Elektrooptilise pildistaja radiomeetria, MTF, suhteline servavastus ja GIQE { "4" } NIIRS on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-d6c92dc655ab = <s1>Eelmine</s1>eo-coverage

# text
seg-a0daef9a496e = <s1>Järgmine</s1>ephemeris
