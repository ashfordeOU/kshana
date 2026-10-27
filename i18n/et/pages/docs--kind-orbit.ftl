# docs--kind-orbit: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-be831b52a339 = ja veel { "4" } maatriksis.

# text
seg-a8d92406e428 = Strontsiumi optiline võrekell, kosmosele suunatud eesmärk sigma_y

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Alani / modifitseeritud / Hadamardi hälve + astmeseaduse müra tuvastus χ² usaldusvahemikega. Sõltumatu etalon (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 etalonhälbed NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Suletud kujul libisemisvea kasv + holdover läveni; kvantkellade klassid. Sõltumatu etalon (ReferenceImpl): Mitmeastmeline clock_state kovariatsioonirekursioon (sama koodibaasi ristkontroll); aluseks olev libisemisdispersiooni ja holdover-i inversiooni tuum on väliselt valideeritud scipy vastu (vt „Clock-holdover coast-variance & threshold inversion“). Klassipõhised punase müra põranda holdover-i arvud jäävad MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud. Sõltumatu etalon (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F funktsiooniga scipy.linalg.expm ja Q Van-Loani { "1978" } plokkmaatriksiga — sõltumatu etalonteostus, mis reprodutseerib kshana täieliku filtri trajektoori. Teostustevaheline kooskõla: kella füüsikat / Alani kalibreerimist ei ole väliselt valideeritud, seega jääb see MODELLED. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): IGS-i lõplikel { "30" } s kelladel { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> Kellaga toetatud χ², RAIM, AGC, SQM ühendatud epohhikaupa turvalisuse FoM. Sõltumatu etalon (ExternalDataset): TEXBAT-i stsenaariumi parameetrid (Humphreys { "2012" }) — iseloomustus, mitte fikseeritud vektorid. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): JammerTest { "2024" } (Bleik; GPL-3.0 andmed) ei tõstnud vaatlustaseme monitorid (kellaga toetatud hii-ruut, RAIM, lahenduse ebaõnnestumine) alarmi { "10" } s jooksul ühegi { "8" } hinnatava avaldatud spuufimise alguse suhtes (kus alguseelne aken oli puhas, tuli esimene alarm { "10.2" } kuni { "39" } s pärast pu

# text
seg-e12f672ae71d = GNSS-ita kella holdover on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Pardakella oleku hindamine on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spuufimise tuvastamine on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-d291f20074f0 = <b>VALIDATED</b> Maa pöörlemine kaheosalisest UT1 Juliuse kuupäevast orbiidi rajal, nii et Maaga seotud positsioon säilitab mikrosekundi, mille ühe f64 kuupäev kaotab (umbes { "3e-9" } rad ümber aasta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME konventsioon, kahel osal), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP vaatejoone geomeetriast kaudu Q=(HᵀH)⁻¹ kohaliku ENU lahutusega. Sõltumatu etalon (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — sõltumatu teek, ühtib { "1e-6" } suhtelise täpsusega

# text
seg-53a78e98af12 = Teemaleht: <a1>SKYLINE.md</a1>

# text
seg-ae15d15bf151 = Teemaleht: <a1>LEO-PASS.md</a1>

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } kaasasolevat stsenaariumi kasutavad seda liiki; ülejäänud on kataloogis <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/orbit.md
seg-0e3518dc3ddb = Allikas: <c1/>

# text
# c1: orbit
seg-1428025a91e1 = <c1/> (stsenaariumi liik)

# text
seg-cb4262b66b8f = GNSS-i kättesaadavus + DOP orbitaalsest konstellatsioonist (Walker / TLE / RINEX).

# text
# c1: scenarios/orbit-rinex.toml
seg-97680b4587c8 = Ühe <c1/> käivituse kokkuvõte: scenario bffc887db977 | 77/361 valimit GNSS-nominaalne | parim PDOP { "2.53" } pos 2.53m | kvant holdover 0s p95 6.49e-5ns terviklikkus { "1.000" } turvalisus n/a (rünnakut pole) | klassikaline holdover 0s p95 25.0ns terviklikkus { "1.000" } turvalisus n/a (rünnakut pole)

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
seg-b3a080b98bd9 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: sigma_uere_m
# c2: constellations
# c3: epoch
# c4: export_sp3
# c5: export_omm
# c6: export_oem
# c7: skyline
seg-c818cc4f87da = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/orbit-rinex.toml
seg-364139ff447d = Näide <c1/> määrab muu hulgas:

# text
seg-d5063dda3971 = Microchip SA.45s / SA65 kiibimõõtmeline aatomkell, sigma_y(1s)

# text
seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

# attr:alt
seg-3b652c0da6de = Diagramm, mille mootor kirjutab failile scenarios/orbit-rinex.toml, liik orbit

# text
seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP nähtavusjoone geomeetriast valemiga Q=(HᵀH)⁻¹ koos kohaliku ENU lahutusega Testid: <a1>dop_reference.rs</a1>.

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry ja check: mootori enda iteratiivse vähimruutude määrangu (pvt::solve_spp, ühikkaalud, lahendatud tegelikust asukohast) algväärtustatud Monte Carlo (N = { "20,000" } epohhi geomeetria kohta, sigma = { "1.5" } m, ChaCha8 algväärtus { "36" } + i) Testid: <a1>uere_dop_monte_carlo.rs</a1>.

# text
seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: satelliidi geodeetiline (WGS-84) asimuut ja tõusunurk maapealsest jaamast, asimuudis lineaarselt interpoleeritud asimuudi/tõusunurga maskitabel murdega { "360" } kraadi juures, nähtavate hulk el Testid: <a1>skyline_orekit_oracle.rs</a1>.

# text
seg-d86884be3f98 = <s1>Eelmine</s1>optical-atmosphere

# text
seg-da202333ae8d = <s1>Järgmine</s1>passes
