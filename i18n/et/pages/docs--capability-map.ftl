# docs--capability-map: translations (et)

# text
seg-76b323512350 = Aegsüsteemid

# text
seg-ee2e250497f9 = Katsestendi eksport

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Allikas: <c1/>

# text
seg-891eb89a8801 = Võimekuse kaart — mida Kshana teeb, teeb osaliselt ja ei tee

# text
# c1: POSITIONING.md
seg-f9b372e8832b = Kshana on <b>PNT (positsioneerimine, navigatsioon ja aeg) toimivuse ja vastupidavuse tõendusmootor</b>, mitte täielik kosmosesüsteemide tööriistakomplekt. See tugineb ajastusele ja holdover-ile, oma parimini kontrollitud valdkonnale (vt <a1><c1/></a1>). See leht on aus ulatuse kaart: iga võimekuse valdkonna kohta, mida hankija või uurimisülevaataja võiks kontrollida, nimetab see staatuse, mis koodis tegelikult olemas on, mis puudub ja kus see teekaardil asub. Staatus on üks järgmistest:

# text
seg-1b3a49d09c7d = <b>täielik</b> — realiseeritud otsast otsani ja kontrollitud reas nimetatud tasemeni;

# text
seg-0da2570a5ca3 = <b>osaline</b> — päris, kuid piiratud mudel (ulatus on allpool selgelt piiratud);

# text
seg-6e02edaa8f54 = <b>puudub</b> — ei ole modelleeritud (täna ulatusest väljas).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Need kolm on ainsad väärtused, mida staatusveerg võtab. Need hindavad <em>võimekuse küpsust</em>, mis on teine telg kui VALIDATED / MODELLED / PARTNER hinne failis <a1><c1/></a1> — see hindab <em>tõendite päritolu</em>, rida realt, ja on masinaga kontrollitud failist <c2/>.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Siin pole midagi püüdluslikku: „osaline“ ei tähenda kunagi „peaaegu valmis“, see tähendab „nii palju ja mitte rohkem“. Vt ka <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> ja ülehinnangute sulgemise registrit <a4><c4/></a4> (iga ajalooline ülehinnang, kuidas see lahendati ja CI (pidev integratsioon) valvur, mis hoiab selle lahendatuna).

# text
seg-b55f7e5a69cc = Põhi-PNT (kus Kshana tegelikult mängib)

# text
seg-d6476863f862 = Võimekus

# text
seg-ad856ad710eb = Staatus

# text
seg-2ee4023e3a27 = Mis on olemas

# text
seg-25843dc03c73 = Mis puudub

# text
seg-331d2821d43f = Teekaart

# text
seg-724b1929b536 = Orbiidi määramine ja propageerimine

# text
seg-9aa33b4484ca = osaline

# text
# c1: ephemeris
# c2: src/ephemeris.rs
# c3: --export-oem
# c4: src/propagator.rs
# c5: forces::zonal_accel
# c6: J2..J6
# c7: integrate_dopri
# c8: propagate_dopri
# c9: solve_kepler_checked
# c10: Err
# c11: ForceModel::third_body
# c12: accel_at
# c13: src/ephem.rs
# c14: epoch_jd_tt + t/86400
# c15: third_body_accel
# c16: forces::srp_accel
# c17: ForceModel::solar_radiation
# c18: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c19: forces::conical_shadow
# c20: forces::drag_accel
# c21: ForceModel::drag
# c22: accel_rv
# c23: −½·ρ(h)·(C_D·A/m)·|v_rel|·v_rel
# c24: v_rel = v − ωₑ ẑ × r
# c25: ρ
# c26: forces::atmospheric_density
# c27: forces::relativistic_accel
# c28: ForceModel::relativity
# c29: β = γ = 1
# c30: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c31: 3μ²/(c²r³)·r̂
# c32: ≈1.9e-9
# c33: forces::lense_thirring_accel
# c34: ForceModel::lense_thirring
# c35: src/orbit_determination.rs
# c36: src/batch_ls.rs
# c37: [r, v]
seg-7f4957a488b7 = Sõltuvusteta <b>SGP4/SDP4</b> (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), kontrollitud täpsusega { "4.12" } mm kõigi { "666" } AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 vektori vastu (asukoht <b>ja</b> kiirus, viimane täpsusega { "1" } mm/s); analüütiline Kepleri + J2-sekulaarne; inertsiaalne kiirus on avatud ja toodud pinnale <b>otsast otsani</b> käivitatava <b>stsenaariumi <c1/></b> kaudu (<c2/>, ligipääsetav CLI-st/Pythonist/WASM-ist/MCP-st (CLI: command-line interface; WASM: WebAssembly; MCP: Model Context Protocol)) — iga sammu kohta annab see TEME (true equator, mean equinox) <b>ja</b> GCRS (Geocentric Celestial Reference System) oleku (asukoht + kiirus), ITRF/ECEF (ITRF: International Terrestrial Reference Frame; ECEF: Earth-centred, Earth-fixed) asukoha, WGS-84 (WGS: World Geodetic System) <b>satelliidialuse maapealse jälje</b> (lat/lon/alt) ning jaama asimuudi/kõrguse/vahemaa + <b>vahemaa muutumiskiiruse/Doppleri</b> (radiaalne vahemaa muutumiskiirus langeb kokku tõelise asukoha tuletisega JD-müravabalt (JD: Julian date) täpsusega { "6e-9" } m/s) — ja CCSDS (Consultative Committee for Space Data Systems) <b>OEM</b> (Orbit Ephemeris Message) kiirust kandva efemeriidi ekspordi kaudu (<c3/>). <b>Numbriline (Cowelli) propageerija</b> (<c4/>) integreerib seadistatava <b>tsonaalse gravitatsiooni</b> jõumudeli — <b>Maa täielik tsonaalne väli kuni astmeni { "6" }</b> (<c5/>, avaldatud EGM-96 (EGM: Earth Gravitational Model) <c6/>) — adaptiivse draiveri valikuga: RK4 (neljanda järgu Runge–Kutta) <b>sammu kahekordistamine</b> või <b>Dormand–Prince RK5({ "4" })</b> manustatud paar (<c7/> / <c8/>, odavam 7-hindamisega manustatud veahinnang, mis läbib sama Kepleri värava ja langeb RK4 teega kokku täpsusega <{ "1" } m J2..J6 orbiidil) — kinnitatud <b>analüütilise tõe vastu, mis on tugevam kui numbriline ristvahend</b>: häirimata orbiit reprodutseerib <b>täpse universaalmuutujate Kepleri lahenduse alla meetri täpsusega { "24" } h jooksul</b> (rangem värav kui verstaposti „võrdlus < { "10" } m“), energia + nurkmoment säilivad ~{ "1e-9" } suhtelise täpsusega, J2 sõlmede regressioon langeb kokku kinnise kujuga sekulaarse kiirusega esimese järgu teooria täpsusega, tsonaalne kiirendus on kontrollitud olema <b>oma potentsiaali täpne gradient</b> (ja taanduma 666 vektoriga kontrollitud J2 kinnisele kujule) ning <c9/> <b>tagastab <c10/> mitte vale vastuse</b>, kui Newton ei koondu (nt periapsise lähedal e = { "0.999" }). <b>Epohhijuhitud kolmanda keha (Päike ja Kuu)</b> gravitatsioon on <b>ühendatud ajas muutuva integraatoriga</b> (<c11/> / <c12/>, failiga <c13/> Montenbrucki ja Gilli madala täpsusega Päikese ja Kuu efemeriididega — DE/SPK (DE: Development Ephemeris; SPK: planetary ephemeris kernel) kerneleid pole vaja): iga RHS (parem pool) hindamine võtab häirijate asukohad edasi viidud epohhil <c14/>, nii et Päike/Kuu liiguvad integreerimise ajal mööda oma orbiite. Häiring on kontrollitud kui oma häiriva potentsiaali täpne gradient, see kaob geotsentris ja omab õpikulisi LEO (madal Maa orbiit) suurusjärke (~{ "5e-7" } m/s² Päike, ~{ "1.1e-6" } m/s² Kuu); Päikese efemeriid tabab käsitsi tuletatud J2000 ankruid (periheeli kaugus, ~−{ "23" }° pööripäeva deklinatsioon, ~{ "1" }°/päevas liikumine) ja Kuu efemeriid oma perigee/apogee ümbrist, ~{ "384 400" } km keskmist kaugust, ≤ { "5.3" }° kaldenurga piiri ja sidereaalkuu suuna naasmist; ning integreerimise ühendus on tõestatud <b>bitttäpselt</b> (RHS liige võrdub <c15/>-ga valimis asukohas hetkedel t = { "0" } ja t = { "1" } päev), kusjuures veerandaasta epohhinihe annab erineva trajektoori. <b>Päikesekiirguse rõhk</b> (SRP) sõidab sama epohhijuhitud RHS-iga (<c16/> / <c17/>): kahurikuuli mudel <c18/> koos <c19/> umbra+penumbra varjutusteguriga (sujuv ν ∈ [{ "0,1" }], kontrollitud ahenema läbi monotoonse penumbra, mis ulatub umbra silindrist kaugemale), kontrollitud õpikulise 1-AU (AU: astronoomiline ühik) rõhu (≈ { "4.54e-6" } N/m²), Päikesest eemale suunatud ~{ "1.36e-7" } m/s² LEO suurusjärgu, pöördruutsõltuvuse (Päikese kauguse kahekordistamine neljandikustab selle), umbra silindris <b>täpselt nullilise</b> kiirenduse ja propageeritud nihke vastu, mis skaleerub ~lineaarselt A/m-ga. <b>Atmosfääri takistus</b> on esimene kiirusest sõltuv liige (<c20/> / <c21/> + uus <c22/> / kiirust edastav RHS): ruuttakistus <c23/> kaaspöörleva atmosfääri <c24/> suhtes, kus <c25/> on Vallado tükiti eksponentsiaalne <c26/> — kontrollitud { "1.225" } kg/m³ merepinna ankru, rangelt monotoonse LEO languse füüsikalise ~{ "58" } km skaalakõrgusega, kiirust suhtelise kiiruse vastu suunatud ~{ "2e-6" } m/s² takistuse suurusjärgu ja <b>dissipatsioonisignatuuri</b> (orbiit kõrgusel { "300" } km kaotab erienergiat monotoonselt ja selle pooltelg väheneb piiratud ~km/päevas, samas kui vaakumorbiit säilitab energia) abil. <b>Postnewtonlik (Schwarzschildi) relativistlik parandus</b> on teine kiirusest sõltuv liige (<c27/> / <c28/>): IERS (International Earth Rotation and Reference Systems Service) <c29/> kuju <c30/>, relativistliku periapsise nihke juhtiv põhjus — kontrollitud oma kinnise kuju ringväärtuse <c31/> (radiaalne, väljapoole), selle õpikulise <c32/> LEO suhte kahe keha omaga, käsitsi lihtsustatud radiaalkiiruse kuju ja <b>konservatiivse signatuuri</b> vastu (see häirib orbiiti, kuid hoiab pooltelge alla meetri päevas, mis on struktuurselt takistuse vastand). <b>Lense–Thirringi</b> raamikaasaviimise liige (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) on gravitomagnetiline parandus väljaspool Schwarzschildi — valikuline, LEO juures ~{ "1" }–{ "2" } suurusjärku sellest allpool, kontrollitud kaduma ilma Maa pöörlemiseta ja asuma Schwarzschildi suurusjärgust allpool. <b>Orbiidi määramine</b> (OD, <c35/>) sulgeb ahela vaatlustest tagasi olekuni: <b>Gauss–Newtoni partii</b> korrektor (<c36/>) viib kandidaadi <c37/> kaare ulatuses propageeritud maajaama vahemaade parimale sobitusele (alla meetri / mm·s⁻¹ müravabadest vahemaadest; ~{ "2" } m järelsobituse jäägiga { "5" } m müra põrandal — järjepideva vähimruutude sobituse signatuur), koos <b>järjestikuse</b> rekursiivse variandiga unscented Kalmani filtril (UKF)

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = Vaikimisi Cowelli jõumudel kannab ainult tsonaalset välja: kõrgastmeline EGM2008 (Earth Gravitational Model { "2008" }) <b>tesseraalne</b> väli (<c1/>, aste/järk { "70" }, koos <c2/> laadijaga ICGEM (International Centre for Global Earth Models) failide jaoks) on komponeeritud ainult täppisefemeriidi sobitusmootorisse (<c3/>; vt <a1><c4/></a1>); pidurdustihedus on <b>staatiline</b> Vallado tükiti eksponentsiaalne (päikeseaktiivsusest sõltumatu), <b>mitte</b> NRLMSISE-00 (Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model; < { "5" } % termosfääritiheduse klausel); SRP on <b>kahurikuuli</b> mudel geomeetrilise <b>koonilise umbra+penumbra</b> varjuga (ilma päikese servapimenemiseta, ilma lapiku Maa varjuta, ilma satelliidi kuju/orientatsioonita); relatiivsus katab <b>Schwarzschildi ja Lense–Thirringi</b> (raamikaasaviimise) liikmed, mõlemad valikulised, kuid ilma PPN-parameetrite (PPN: parametrised post-Newtonian) häälestuseta; <b>kolmanda keha/SRP kasutavad madala täpsusega efemeriide (~{ "0.005" }° Päike, ~{ "0.3" }° Kuu), mitte DE/SPK-kerneli täpsust</b>. Konservatiivsed jõumudeli tasemed (kahe keha → J2–J6 → Päike/Kuu → SRP) on <b>VALIDATED Orekit { "12.2" } vastu</b> (halvim { "0.08" } m { "24" } h jooksul, <c5/>) ning partii-/järjestikune orbiidi määramine on <b>VALIDATED Orekit { "12.2" }</b> hindajate vastu (<c6/>); pidurdustase ning absoluutne efemeriidi/tiheduse sisendi täpsus jäävad MODELLED; GMAT (General Mission Analysis Tool) ristkontrolli pole

# text
seg-c66f25447fe9 = tesseraalne gravitatsioon vaikimisi Cowelli mudelis + NRLMSISE-00 pidurdus + päikese servapimenemine + DE-klassi efemeriid + GMAT ristvalideerimine + OD vahemaa muutumiskiiruse/nurga mõõtmised ja analüütiline STM (olekuüleminekumaatriks): P2+

# text
# c1: src/timescales.rs
# c2: eraEra00
# c3: gstime
# c4: ephemeris
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: finals2000A
# c9: eop_finals2000a
# c10: kshana --eop <file>
# c11: EopSeries
# c12: precise_od
seg-fffd275219ff = <c1/>: Juliuse kuupäeva API (tsiviil↔JD, MJD (modifitseeritud Juliuse kuupäev)), UTC↔TAI (UTC: Coordinated Universal Time; TAI: International Atomic Time) täieliku IERS-i liigsekundite tabeli kaudu ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT: Terrestrial Time), UT1 (Universal Time { "1" }, Maa pöörlemise aeg) DUT1 (Maa pöörlemise aeg miinus Coordinated Universal Time) kaudu ja IAU-2000 (IAU: International Astronomical Union) <b>Maa pöörlemisnurk</b> (ERA, kontrollitud bitthaaval SOFA (Standards of Fundamental Astronomy) <c2/> vektori vastu). SGP4 tee <b>DUT1≈{ "0" } lähendus on selgelt dokumenteeritud</b> kutsekohas <c3/> (≤ ~{ "13" }″ GMST (Greenwich mean sidereal time) viga, SGP4 enda mudelivea piires), ning stsenaarium <c4/> võtab selgesõnalised <c5/>/<c6/>/<c7/> nupud <b>või sisseehitatud päris IERS-i <c8/> rea</b> (<c9/> / <c10/>, interpoleeritud sama <c11/> kaudu, mida <c12/> kasutab), nii et maapealne jälg redutseeritakse päris IERS-i UT1 / poolusenihke kaudu, mitte ainult nominaalsete skalaaridega

# text
# c1: f64
# c2: timescales::TwoPartJd
# c3: src/jd2.rs
# c4: Jd2
# c5: Sgp4::propagate_at(Jd2)
# c6: tests/jd2_sofa_time_oracle.rs
# c7: jd2::gmst82
# c8: cio::gcrs_to_itrs_matrix_jd2
# c9: orbit::Propagator::position_in_frame_jd2
# c10: two_part_jd
# c11: tests/jd2_earth_rotation_erfa_oracle.rs
# c12: Jd2
# c13: TwoPartJd
# c14: f64
# c15: two_part_jd
# c16: f64
# c17: jd2
# c18: timescales::tai_minus_utc_on_date
# c19: tests/jd2_pre1972_sofa_oracle.rs
# c20: f64
# c21: timescales::tai_minus_utc
# c22: src/eop_ls_ar.rs
# c23: EopSeries::with_ls_ar_prediction
# c24: tests/eop_prediction_beyond_table.rs
seg-d488e9db94e9 = Maa orbiidi teed kasutavad endiselt ühe-<c1/> JD-d (~{ "50" } µs eraldusvõime ümber aasta { "2020" } — see, mitte algoritm, on lõplike vahede ristkontrolli põrand); kaheosaline JD on olemas (<c2/>, kasutavad radiomeetriline, CCSDS-TDM, maasegmendi simulaatori ja päikesesüsteemi teed ning <c3/> <c4/>) ning see on läbi viidud SGP4-st (<c5/>), läbimisprognoosist, geomeetriast ja Walkeri kavanditest (kontrollitud SOFA vastu, <c6/>) ja Maa pöörlemisest orbiiditeel (<c7/>, <c8/>, <c9/>, efemeriidistsenaariumi valikuline <c10/>; VALIDATED ERFA vastu, <c11/>), kadudeta teisendustega <c12/> ja <c13/> vahel; vaikimisi Maa orbiidi teed säilitavad ühe-<c14/> kuupäeva, kui <c15/> pole seatud, ning Cowelli jõumudeli epohh jääb sihilikult ühe-<c16/>-ks (selle analüütiline Päikese/Kuu viga ületab { "40" } µs ümardamise kordades); enne 1972. aastat kasutatud kummisekundi UTC ({ "1960" }–{ "1971" }) on kaheosalisel teel modelleeritud (<c17/>, <c18/>, VALIDATED ERFA vastu, <c19/>), kuid ühe-<c20/> <c21/> piirab endiselt väärtusega { "10" } s enne { "1972" }; vähimruutude + autoregressiivne Maa orientatsiooni ennustaja (<c22/>, võrreldud IERS-i Bulletin A-ga leiuna) saab nüüd EOP rida pikendada selle viimasest reast kaugemale (<c23/>, valikuline; <c24/>), nii et raami argumendid tabelist kaugemal järgivad prognoosi, mitte ei piirdu; vaikerida piirab endiselt ja ükski stsenaariumivõti ei lülita ennustust veel sisse

# text
seg-d59294cf367c = <b>tehtud</b> (alus); kaheosaline JD läbi Maa pöörlemise orbiiditeel: <b>tehtud</b> (valikuline efemeriidistsenaariumis) ; EOP ennustus tabelist kaugemale: <b>tehtud</b> (teek, valikuline); enne 1972. aastat kasutatud UTC kaheosalisel teel: <b>tehtud</b>

# text
seg-798b3b5db6d6 = Tugisüsteemid

# text
seg-69930da8bc5a = täielik

# text
# c1: src/frames.rs
# c2: src/precession.rs
# c3: (γ̄, φ̄, ψ̄, ε̄_A)
# c4: src/nutation.rs
# c5: nutation_iau2000a
# c6: nutation_matrix_2000a
# c7: nut00a
# c8: tools/gen_nut00a.py
# c9: iauNumat
# c10: teme_to_gcrs(r, v, jd_tt)
# c11: nut00a
# c12: nut00b
# c13: teme_to_itrf
# c14: polar_motion_matrix
# c15: iauPom00
# c16: x_p
# c17: y_p
# c18: src/cio.rs
# c19: X,Y
# c20: s
# c21: gcrs_to_cirs_matrix
# c22: gcrs_to_itrs_matrix
# c23: eraXys06a
# c24: eraC2ixys
# c25: eraEra00
# c26: tests/frame_reference_vectors.rs
# c27: ephemeris
seg-4b3fe53b3dcd = <c1/>: GMST-põhine TEME↔ECEF, WGS-84 geodeetiline↔ECEF (täpne + iteratiivne pöördteisendus, masinatäpsusega kõigil kõrgustel) ja geodeetiline maajaama vaatleja (asimuut/kõrgus/vahemaa); <b>IAU { "2006" } pretsessioon</b> (<c2/>: Fukushima–Williamsi nurgad <c3/> + GCRS↔keskmise-kuupäeva nihke-pretsessiooni maatriks); <b>IAU 2000A/2000B nutatsioon + täielik TEME→GCRS ahel</b> (<c4/>: <b>täielik IAU 2000A</b> rida — { "678" } Kuu-Päikese + { "687" } planeetide liiget, <c5/> / <c6/>, tabel masinaga genereeritud ERFA (Essential Routines for Fundamental Astronomy) <c7/> viitest skriptiga <c8/> — koos 77-liikmelise 2000B reaga, Delaunay argumentidega, SOFA <c9/> nutatsioonimaatriksiga, pööripäevade võrrandiga ja <c10/> kaudu TEME→TOD→MOD→GCRS (true of date, mean of date) — mõlemad read kontrollitud <b>bitthaaval</b> SOFA/ERFA <c11/>/<c12/> viitevektorite vastu, Δψ/Δε täpsusega { "1e-13" } rad); <b>IERS-i poolusenihe</b> PEF→ITRF (pseudo-Earth-fixed to terrestrial) (<c13/> / <c14/>, SOFA <c15/>, kutsuja antud <c16/>/<c17/> — kümnete meetrite mõju orbiidi raadiusel); <b>CIO-põhine (CIO: Celestial Intermediate Origin) IAU 2006/2000A redutseerimine</b> (<c18/>: pööripunktivaba GCRS↔CIRS↔ITRS (CIRS: Celestial Intermediate Reference System; ITRS: International Terrestrial Reference System) ahel — CIP (Celestial Intermediate Pole) <c19/> 2006/2000A NPB (nutatsioon-pretsessioon-nihe) maatriksist, 66-liikmeline CIO-lokaatori <c20/> rida, <c21/>, Maa pöörlemisnurk ja täielik <c22/> — kontrollitud <b>bitthaaval</b> SOFA <c23/>/<c24/>/<c25/> vektorite vastu). <b>Otsast otsani</b> teisendused on nüüd kinnitatud avaldatud autoriteetse läbitöötatud näite külge, mitte ainult enesekooskõla vastu: <b>Vallado</b> AIAA 2006-6753 oleku (2004-04-06, koos selle IERS EOP-iga (Earth orientation parameters); <c26/>) vastu langeb TEME→PEF kokku täpsusega <b>{ "0.1" } mm</b>, TEME→ITRF täpsusega <b>{ "0.6" } mm</b>, täielik CIO GCRS→ITRS täpsusega <b>{ "4" } mm</b> ning ECEF→geodeetiline reprodutseerib Vallado näite 3-3 lat/lon/alt kuni viimase avaldatud numbrini. Kogu ahel on <b>kasutajale ligipääsetav</b> stsenaariumi <c27/> kaudu (ITRF/ECEF asukoht + WGS-84 satelliidialune maapealne jälg sammu kohta)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = Vaikimisi TEME→GCRS ahel kasutab 2000B (~{ "1" } mas, selle enda kiiruseraami pöörde lihtsustusest allpool); < { "0.1" } mas täielik 2000A tee on saadaval kaudu <c1/> ja range <b>CIO (X, Y, s)</b> redutseerimine on saadaval kaudu <c2/>. Pärand-TEME tee kasutab IAU-1982 GMST-i (SGP4 konventsioon). Sõltumatu ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhas Rusti planeetide geomeetria tööriistakomplekt; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) numbriline ristkontroll on <b>tarnitud</b> (<c3/>: <c4/> vs ANISE GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) kaheksal epohhil { "2020" }–{ "2023" }, ≤ { "0.86" } m maapinnal, ≤ { "3.6" } m GNSS (ülemaailmne satelliitnavigatsioonisüsteem) orbiidil); see on iseseisev kast vaike-CI väravatest väljaspool. <c5/> ja <c6/> on samuti otse kontrollitud ERFA vastu { "40" } epohhil { "1950" }–{ "2100" } ja CIO ahel võtab IERS-i taevapooluse nihked dX, dY (<c7/>; <c8/>); vaiketeed jätavad dX, dY endiselt arvestamata. Kontrollimaatriks hindab seda rida <b>VALIDATED</b> (SOFA/ERFA vektorid + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + geodeetiline: <b>tehtud</b> (Vallado-kontrollitud); inertsiaalne TEME→GCRS: <b>tehtud</b> (2000B + täielik 2000A); poolusenihke ITRF: <b>tehtud</b> (Vallado-kontrollitud); CIO GCRS→ITRS: <b>tehtud</b> (Vallado-kontrollitud)

# text
seg-7e3e210ca43c = Ajastus ja sagedus

# text
# c1: src/filter_health.rs
# c2: filter_health
# c3: src/allan.rs
# c4: tests/allan_reference.rs
# c5: src/timetransfer.rs
# c6: src/holdover.rs
# c7: σ_x²(t) = q_wf·t + q_rw·t³/3 + q_drift·t⁵/20
# c8: clock_state
# c9: src/tpl.rs
# c10: cargo run --example tpl_jammertest
# c11: allantools
# c12: tests/mtie_reference.rs
# c13: tests/mdev_tdev_reference.rs
# c14: tests/gnss_denied_clock_holdover_reference.rs
# c15: telecom-timing
# c16: TELECOM-TIMING.md
seg-97de2d9d9ccf = Täpne van-Loan-Q kahe olekuga Kalmani kell (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) koos <b>Josephi-stabiliseeritud kovariatsiooni uuendusega</b> (positiivselt poolmääratud äärmuslike Q/R suhete korral, Choleskiga kontrollitud CI-s) ja <b>filtri järjepidevuse tervisemonitoriga</b> (<c1/>): Monte Carlo NIS/NEES (NIS: normaliseeritud innovatsiooni ruut; NEES: normaliseeritud hinnangu vea ruut) hinnang χ² usaldusribade vastu, mis esitatakse kui <c2/> tulemuse JSON-is (JavaScript Object Notation) ja rohelise/merevaigukollase kaardina mänguväljakul, koos Q/R-mittevastavuse pühkimistestiga, mis tõestab, et monitor muutub olekusse <em>ebajärjekindel</em>, kui häälestus on vale (Bar-Shalom §{ "5.4" }); kattuvad <b>ADEV (Alani hälve), MDEV (modifitseeritud Alani hälve), TDEV (ajahälve), HDEV</b> (Hadamardi hälve) hindajad + χ²-põhised usaldusvahemikud <b>müratüübispetsiifiliste efektiivsete vabadusastmetega</b> (NIST SP { "1065" } tabeli { "5" } kinnised kujud WPM/FPM/WFM/FFM/RWFM jaoks (WPM: valge faasimodulatsioon; FPM: flicker-faasimodulatsioon; WFM: valge sagedusmodulatsioon; FFM: flicker-sagedusmodulatsioon; RWFM: juhusliku käimise sagedusmodulatsioon), komplekt, mida Stable32 kasutab; eksporditud ADEV kõver tuvastab kirje astmeseaduse tüübi selle MDEV kallakust ja lisab iga τ kohta { "95" }% riba — <c3/>), <b>arvuliselt kontrollitud Stable32 viitehälvete vastu kanoonilisel NBS14 andmestikul täpsusega { "1e-4" }</b> (<c4/>) ja edf ristkontrollitud Monte Carlo valge-FM (FM: sagedusmodulatsioon) ansambliga; aus võrgupiiratud holdover-i kvaliteedinäitaja (figure of merit); kellaansamblid; <b>kahesuunaline aja edastamise mudel</b> vastastikuse viivituse tühistamisega + mittevastastikune juhusliku käimise FM diferentsiaalviivituse põrand (<c5/>, Alani signatuur esitatud); <b>GNSS-ita kella holdover-i kalkulaator</b> (<c6/>), mis avab kinnise van-Loani inertsist liikumise vea kasvu <c7/> kasutajale suunatud <em>holdover-i-lävendini</em> pöördarvutusena (kui kaua kell vabalt töötab, enne kui selle ajaviga ületab eelarve), esinduslike kvantkella klassidega (optilise võre/püütud ioon/elavhõbedaioon) — <b>modelleeritud, mitte väliselt kontrollitud</b>: ristkontrollitud mitmesammulise <c8/> kovariatsioonirekursiooniga ning ausalt öeldud, et väga stabiilse kella holdover tiheda läveni on <b>määratud <em>eeldatud</em> pika-tau punase müra põranda, mitte viidatud ADEV järgi</b> (kaitstava arvu jaoks kasuta mõõdetud põrandaid). <b>Tinglik ajakaitsetase</b> (<c9/>) tugineb samale holdover-i masinavärgile <em>spuufimise</em> juhtumi jaoks: <b>tuvastamata</b> ajavea piir sõltumatu ristkontrolli korral — k-σ monitori põrand pluss van-Loani inertsist liikumise dispersioon tuvastusviivituse jooksul pluss CUSUM (kumulatiivne summa) häireni jõudmise aeg — kalibreeritud <b>päris salvestatud spuufimise</b> peal (JammerTest { "2024" }, Zenodo { "15911589" }) ja reprodutseeritav käsuga <c10/>. <b>Modelleeritud</b> koostis, tuvastamisest tinglik: lõplikku <em>tingimusteta</em> piiri ei ole (piisavalt aeglane rampimine pääseb ühest kellaga abistatud monitorist mööda). <b>Maksimaalne ajaintervalli viga (MTIE)</b> ja <b>TDEV</b> on VALIDATED <c11/> vastu (<c12/>, <c13/>) ning holdover-i inertsist liikumise dispersiooni pöördarvutus on VALIDATED SciPy vastu (<c14/>); liik <c15/> rakendab neid ITU-T (International Telecommunication Union Telecommunication Standardization Sector) G.8272 / G.8272.1 / G.8273.2 / G.8271.1 maskidele — vt <a1><c16/></a1>

# text
seg-cf16b15c0a27 = täielik Greenhalli algoritmi edf (lihtsad kinnised kujud on nihkepiiratud, kuid jämedamad kui täpne BasicSum) ja mitme müra segu tuvastamine

# text
seg-d35d1a9e0ed3 = täpne edf + segamüra tuvastamine: P2

# text
seg-cdfb50bca79e = GNSS / PNT töötlus

# text
# c1: gnss-sim
# c2: src/gnss_sim.rs
# c3: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c4: gnss_measurements[]
# c5: Propagator
# c6: rinex
# c7: scenarios/orbit-rinex.toml
# c8: pvt
# c9: src/pvt.rs
# c10: −TGD
# c11: tests/pvt_abmf.rs
# c12: scenarios/pvt-abmf.toml
seg-733cf51a8c5e = <b>Mõõtmisdomeeni pseudovahemaa simulatsioon</b> (liik <c1/>, <c2/>): iga nähtava satelliidi kohta sünteesib see <c3/> ja L1 Doppleri, <b>Klobucharu ühesagedusliku ionosfääriga</b> (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.5.2.5" }) ja <b>Saastamoineni zeniidi troposfääriga</b> (Davis { "1985" }), mis on projitseeritud <b>Niell ({ "1996" }) kaardistusfunktsiooniga</b> — iga mudel on ühiktestitud käsitsi arvutusega — seejärel söödab jäägid <b>hetktõmmise RAIM-ile</b> (vastuvõtja autonoomne terviklikkuse monitooring) epohhi kaupa HPL/VPL jaoks (HPL: horisontaalne kaitsetase; VPL: vertikaalne kaitsetase) ning väljastab massiivi <c4/> (pseudovahemaa, Doppler, C/N₀, iono/tropo parandused SV kohta (space vehicle, see tähendab satelliit)). Lisaks DOP/kättesaadavus (DOP: täpsuse halvenemise tegur) ja lahenduse eraldamise RAIM orbiitidelt; <b>RINEX (Receiver Independent Exchange Format) { "3" } mitme-GNSS NAV sissevõtt</b> (GPS/Galileo/QZSS/BeiDou (QZSS: Japan's Quasi-Zenith Satellite System) IS-GPS-200 kaudu, GLONASS (Russia's Global Navigation Satellite System) olekuvektor) parsitud → SV ECEF asukoht ja kella nihe, kasutatav esmaklassilise <c5/> allikana JA lisatud konstellatsiooni <c6/> plokina (<c7/>); <b>RINEX { "3" } OBSERVATION sissevõtt</b> (oodatakse, et { "4.00" } vaatlusstruktuur parsib, kuid ühtegi { "4.00" } faili pole katsetatud; RINEX { "4" } NAVIGATION failid lükatakse nime järgi tagasi, mitte ei dekodeerita valesti); <b>ühepunkti-positsioneerimise lahendaja</b> (liik <c8/>, <c9/>), mis muudab päris RINEX koodi pseudovahemaad + saatesatelliidi efemeriidid <b>vastuvõtja asukohaks</b> iteratiivse kaalutud vähimruutude abil — Sagnaci/Maa pöörlemise parandus, saatesatelliidi kell koos <c10/>, <b>kahesageduslik L1/L2 ionosfäärivaba kombinatsioon</b> (või ühesageduslik Klobuchar), Saastamoineni/Nielli troposfäär, kõrgusekaalud, DOP ja hetktõmmise RAIM — <b>kontrollitud päris IGS (International GNSS Service) andmetel</b> (jaam ABMF, Guadeloupe, 2018-05-13) täpsusega <b>{ "5.7" } m 3-D RMS (root mean square) / { "1.1" } m horisontaalselt</b> jaama mõõdistatud koordinaadi vastu (<c11/>, <c12/>); ning SP3 (Standard Product { "3" }, täppisorbiidi formaat) täppisorbiidi lugemine/kirjutamine

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = <b>Koodil põhinev</b> positsioneerimismootor pluss, alates versioonist { "0.36" }, kandelaine faasi töötlus päris vaatlustel: lahendaja <c1/> arvutab päris koodimõõtmistest päris asukoha (ühepunktipositsioneerimine, meetritasemel, kahesagedusliku iono-vaba kombinatsiooniga); <c2/> teeb lühikese baasjoone RTK-d päris kahesageduslikul GPS koodil ja faasil (topeltdifferentsid, ujuv Kalmani filter, LAMBDA täisarvuliste mitmetähenduslikkuste fikseerimine suhtetestiga, <c3/>) ning staatiline ujuv PPP filter töötab päris koodil ja faasil IGS-i lõplike orbiitide ja kelladega. Mõlemad on VALIDATED IGS-jaamade avaldatud ITRF2020 koordinaatide vastu (WTZR/WTZZ, <c4/>, <c5/>, läved eelregistreeritud); puudu on endiselt PPP täisarvuliste mitmetähenduslikkuste lahendamine, kinemaatiline või võrgu-RTK ja reaalajas töö. Hatchi kandelaine silumine on kinnitatud MODELLED leid (selle eelregistreeritud läved jäid saavutamata). Liik <c6/> käivitab ujuva PPP filtri mõõtmistel, mida see ise simuleerib, koondumisuuringuteks; edasisuunaline pakett <c7/> jääb tõest lähtuvaks simulaatoriks; BeiDou-GEO (GEO: geostatsionaarne orbiit) on välja jäetud

# text
seg-61b43da61326 = PPP täisarvuliste mitmetähenduslikkuste fikseerimine, kinemaatiline või võrgu-RTK, reaalajas töö: kasuta RTKLIB/gLAB (RTKLIB: avatud lähtekoodiga reaalajas kinemaatilise positsioneerimise teek)

# text
seg-820a5f1f7e3b = Andurite liitmine / INS (inertsiaalnavigatsioonisüsteem) dead-reckoning

# text
# c1: src/inertial/{attitude,mechanization,imu_errors}.rs
# c2: src/fusion/pack.rs
# c3: kind = "gnss-ins"
# c4: src/fusion/{gnss_ins_ekf,closed_loop}.rs
# c5: inertial
# c6: update_tightly_coupled
# c7: fuse_tightly_coupled
# c8: src/fusion/tightly_coupled17.rs
# c9: q_va
# c10: src/fusion/hybrid_ukf.rs
# c11: kind = "hybrid-ukf"
# c12: q_va
# c13: clock_state::q_from_allan
# c14: q_wf
# c15: q_rw
# c16: gnss-ins
# c17: [imu_*.error_model]
seg-4181becfd059 = <b>3-teljeline strapdown-teek</b> (<c1/>): kvaternioon-orientatsioon coning/sculling kompensatsiooniga, täielik NED (north-east-down) mehhaniseerimine (Maa pöörlemiskiirus + transpordikiirus, WGS-84 Somigliana gravitatsioon) ja deterministlik IMU (inertsiaalmõõteseade) veamudel (<b>skaalategur, nihe joondusest, g-tundlikkus, kvantimine, kiiruse ramp</b> modelleeritud). Strapdown-navigaator on nüüd <b>ühendatud käivitatavasse lõdvalt seotud GNSS/INS paketti</b> kvaliteedinäitajaga (<c2/>, <c3/>): kolmeteljelist mehhaniseerimist distsiplineerib <b>15-olekuline veaoleku EKF</b> (laiendatud Kalmani filter) (<c4/>, asukoha/kiiruse/orientatsiooni/nihke tagasiside), kuni GNSS on üleval, seejärel liigub see inertsist läbi katkestuse — asendades tõe külge naelutamise lähtestuse tõelise liitmisega ja esitades liidetud horisontaalse vea vs avatud ahelaga vaba INS-i inertsist liikumise. Eraldi pärand-pakett <c5/> käitab endiselt <b>1-DOF (DOF: vabadusaste) skalaarset</b> eelarvet tõe külge naelutamise lähtestusega. Realiseeritud on ka <b>tihedalt seotud pseudovahemaa</b> uuendus (<c6/> / <c7/>): see moodustab innovatsiooni vahemaa domeenis (nägemisjoone Jacobiaan δp suhtes) ja jätkab parandamist <b>vähem kui nelja satelliidiga</b>, kus lõdvalt seotud PVT (asukoht, kiirus ja aeg) fiksi ei eksisteeri. <b>Täielik 17-olekuline tihedalt seotud GNSS/INS UKF</b> (unscented Kalmani filter) (<c8/>) kannab asukohta, kiirust, orientatsiooni viga, kiirendusmõõturi ja güroskoobi nihkeid ning vastuvõtja kella (nihe + triiv), koos <b>kvant-CAI (CAI: külmaatomi interferomeeter) dead-reckoning-iga</b> — kiiruse juhusliku käimise protsessimüra on külmaatomi kiirendusmõõturi tuletatud <c9/> — liikudes 120-sekundilise katkestuse läbi mõne sajandi meetri piires (vs navigatsiooniklassi vaba INS-i kilomeetrid). See 17-olekuline UKF on nüüd <b>toodud käivitatavaks stsenaariumiks</b> (<c10/>, <c11/>, ligipääsetav CLI-st/Pythonist/WASM-ist/MCP-st): <b>{ "15" } INS-i veaolekut</b> on täiendatud <b>CAI-st tuletatud kiirendusmõõturi nihke parandusega</b> (külmaatomi interferomeeter seab kiiruse juhusliku käimise põranda <c12/>) ning <b>2-olekulise faasi+sageduse kellaga</b>, mille protsessimüra pärineb <b>q-parameetri kellamootorist</b> (<c13/>, Alani profiil → <c14/>/<c15/>), mida juhib sulgudes CAI veamudel, nii et käivitus demonstreerib klassikalise IMU lühiajalise + kvantpika-aja hübridiseerimist. Selle kvaliteedinäitaja on <b>filtri enesekooskõla</b> — koondatud <b>NEES + innovatsiooni valgeus (NIS)</b> Monte Carlo ansambli üle nende { "95" }% χ² ribade vastu (sobitatud filter jääb ribade sisse; valesti häälestatud filter märgitakse, objektiivselt kontrollitav värav). <b>See on ENESEKOOSKÕLA väide modelleeritud müra all, MITTE tegeliku maailma täpsuse garantii</b> — CAI/kella sisendid on sulgudes/modelleeritud, CAI riistvara on partneri omanduses ja miski siin ei viita TRL (tehnoloogilise valmiduse taseme)>{ "3" }, lennupärandile ega välisele kontrollile. Deterministlik IMU veamudel on <b>seadistatav anduri kaupa <c16/> TOML</b> (Tom's Obvious Minimal Language) stsenaariumifailist (<c17/>: skaalategur, nihe joondusest, g-tundlikkus, kvantimine, kiiruse ramp), vaikimisi puhas konstantse nihke allikas, kui see on välja jäetud

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = Tihe sidumine on <b>ainult pseudovahemaaga</b> (kandelaine faas on teekaardil); stsenaarium <c1/> kasutab <b>ühte konstantse kiirusega horisontaalset trajektoori</b>, millel orientatsiooni ja IMU nihke veaolekud on vaid nõrgalt jälgitavad, mistõttu hinnatakse NEES kooskõla <b>hinnatava alamhulga</b> (asukoht, kiirus, kell = { "8" } olekut) üle — täielik 17 jälgitavus vajab manööverdavat trajektoori (teekaart); lõdvalt seotud kiirendusmõõturi nihke/kalde paar on nõrgalt eraldatav, mistõttu nihke kaupa kalibreerimist ei väideta; IMU veamudel jätab välja vibratsiooni rektifikatsiooni, temperatuurigradiendi triivi; 17-olekuline UKF ja tihedalt seotud teed on <b>ise-kontrollitud</b> (analüütiline konstantse kiirusega integreerimine, GNSS-abistamise koondumine, nihke taastamine, CAI-piiratud 120-s katkestuse piir ja NEES/NIS χ² kooskõla sõltumatu etalon) — strapdown-<b>mehhaniseerimine</b> ise on VALIDATED NaveGo v1.4 vastu (<c2/>: orientatsioon bitiidentne, kiirus/asukoht nimetatud analüütiliste piiride sees), kuid filtritaseme ristvalideerimist (NaveGo või KF-GINS sõidukiandmestik) pole tehtud

# text
seg-5d4529365f46 = kandelaine faasi tihe sidumine, manööverdava trajektoori täielik 17 jälgitavus, trajektooriteek, filtritaseme NaveGo/KF-GINS ristvalideerimine: <b>P2</b>

# text
seg-7d33171c5e26 = <b>Terviklikkus / RAIM / ARAIM</b> (täiustatud vastuvõtja autonoomne terviklikkuse monitooring)

# text
# c1: src/raim.rs
# c2: araim_raim
# c3: P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)
# c4: araim_dual_raim
# c5: P_const = 0
# c6: araim_raim
# c7: IntegritySupportMessage
# c8: integrity
# c9: stanford_svg
# c10: PL=error
# c11: ARAIM_REFERENCE.md
seg-fd0afb948d1f = <b>Päris hetktõmmise RAIM</b> failis <c1/>: vähimruutude lahendus + jäägi χ² rikete tuvastamine (täpne lävi sõltuvusteta mittetäieliku gamma χ²-ga) ja <b>kaldepõhine HPL/VPL</b> (pbias mittetsentraalsest χ²-st seadistatud P_fa/P_md jaoks); <b>lahenduse eraldamise (MHSS) RAIM</b> rikete tuvastamise/identifitseerimisega; <b>ARAIM terviklikkuse riski (P_HMI) eelarve</b> (<c2/>), mis lahendab väikseima HPL/VPL, mille summeeritud <c3/> vastab selgesõnalisele terviklikkuse riski jaotusele, <b>kahe-/mitmekonstellatsiooniline konstellatsiooniülene rikkerežiim</b> (<c4/>, EU (Euroopa Liit) ARAIM TN (tehniline märkus) / DO-316; <c5/> ⇒ bitthaaval <c6/>), selgesõnaline <b>terviklikkuse tugisõnum</b> (<c7/>: σ_URA/σ_URE/b_nom/P_sat/P_const, WG-C (WG: töörühm) GPS+Galileo viiteväärtustega) ja <b>Stanfordi(-ESA, Euroopa Kosmoseagentuur) terviklikkusdiagramm</b> (stsenaariumi liik <c8/> ning iseseisev <c9/> renderdaja nelja tsooni + <c10/> piiri jaoks). Dokumenteeritud otsast otsani failis <a1><c11/></a1>. Lisaks stsenaariumi kvaliteedinäitaja filtri enesekooskõla (k-σ piir)

# text
# c1: integrity
# c2: integrity_fom
# c3: [integrity]
# c4: raim::snapshot_raim_fde
# c5: raim_fde
# c6: tests/integrity_snapshot_raim_rtklib_oracle.rs
# c7: src/araim_reference.rs
# c8: tests/integrity_araim_stanford_oracle.rs
# c9: raim::araim_raim
# c10: araim_subset_raim
# c11: add_v42_protection_levels_to_order
# c12: araim_dual_raim
# c13: araim_dual
# c14: scenarios/araim-gps-galileo.toml
# c15: araim_dual_constellation_availability
# c16: tests/igs_real_data.rs
# c17: tests/araim_dual_real_data.rs
# c18: xval/araim-m3/
seg-f5fa7c20d28d = RAIM on ligipääsetav stsenaariumi liigi <c1/> kaudu ja ({ "0.36" }, valikuline) kella/holdover-i kvaliteedinäitaja kõrval eraldi plokina <c2/> (<c3/>: hetktõmmise RAIM eelseadistatud taevas nimetatud asukohast, kättesaamatu, kui GNSS on keelatud; MODELLED), mitte kunagi holdover-i kvaliteedinäitajasse sulatatud, mis endiselt esitab enesekooskõla; hetktõmmise RAIM kannab ühe satelliidi <b>FDE-d</b> (rikete tuvastamine ja välistamine, <c4/>, VALIDATED RTKLIB <c5/> vastu failis <c6/>); ARAIM ADD v4.2 mitme hüpoteesi lahenduse eraldamine mitme satelliidi alamhulga määramisega on failis <c7/> (VALIDATED Stanford MAAST vastu, <c8/>), kuid ühtlase sigmaga eelarve <c9/> katab endiselt ainult üksiku SV ja konstellatsiooniülesed rikked ega järgi ADD-d ({ "0.36" }, valikuline: samaaegsed mitme SV alamhulga rikked ADD v4.2 alamhulga reegli kaudu, mis on üldistatud paaridest kaugemale, <c10/>, <c11/>; MODELLED, MAAST käivitust paaridest kaugemal pole), ja mitme SV välistamist ei modelleerita; ning <c12/> on ühendatud TOML stsenaariumi käivitajaga lipu <c13/> kaudu (<c14/>), epohhi kaupa kättesaadavuse teega <c15/>; hetktõmmise/MHSS/ARAIM tuumasid katsetatakse <b>päris IGS-i täppisorbiidi (SP3) geomeetrial</b> (<c16/>) ja <b>päris Celestraki GPS+Galileo TLE-del</b> (<c17/>, iga satelliit propageeritud ühele ühisele UTC epohhile — komplekti viimasele TLE (kaherealine elemendikomplekt) epohhile, 2026-06-07T07:{ "21" }:{ "04" } — { "45" }°-kaldega { "400" } km kasutajale { "24" } h jooksul: kättesaadavus { "12" } m VAL (vertikaalne häirepiir) / { "10" } m HAL (horisontaalne häirepiir) korral on { "0.993" } ainult GPS-iga, { "1.000" } GPS+Galileo koondatult ja { "0.990" } konstellatsiooniülese rikke suhtes vastupidavas kaksikrežiimis; siin varem avaldatud arv, { "0.21" }→{ "0.67" } vastupidava režiimiga „piiratud“, pärines iga satelliidi propageerimisest tema enda TLE epohhilt — taevast, mida kunagi ei eksisteerinud — ja on tagasi võetud); varasem „EU-ARAIM-TN Table A-3“ võrdlus on tagasi võetud (avalikku allikat pole) ning avaliku EU-US WG-C ARAIM Milestone { "3" } maksimaalse URA kirjete (tabelid { "5" } kuni { "7" }, Depleted ja Baseline read) reprodutseerimist üritatakse failis <c18/> nimetatud kõrvalekalletega (MODELLED, vt INTEGRITY.md); mitte DO-229/ARAIM-sertifitseeritud

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = mitme rikke ARAIM (ADD v4.2): <b>tehtud</b>; mitme SV alamhulgad failis <c1/> + vastuvõtja domeeni gLAB võrdlus + kvaliteedinäitaja ühendamine: <b>P2</b> (vt <a1><c2/></a1>)

# text
seg-7244b585a932 = Spuufimise / segamise ohumodelleerimine

# text
# c1: spoof
# c2: src/spoof.rs
# c3: src/detection.rs
# c4: P_fa
# c5: P_md
# c6: 1 − P_md
# c7: jamming
# c8: src/jamming.rs
# c9: Q
# c10: availability_under_jamming
# c11: src/spoof_monitors.rs
# c12: parity_raim_test
# c13: AgcMonitor
# c14: SqmMonitor
# c15: fuse_spoof_layers
# c16: CombinedSpoofDetector
# c17: evaluate
# c18: spoof-detect
# c19: src/spoof_detect.rs
# c20: tests/spoof_texbat_validation.rs
seg-0cf86b61224c = <b>Stohhastiline aja spuufimise detektor</b> (liik <c1/>, <c2/> + <c3/>): neli süstimisvormi (lineaarne ramp, astmeline hüpe, meaconing, taasesitus) kellaga abistatud monitori vastu kahepoolse <b>χ²₁ energia / Neyman–Pearsoni testiga</b>, tuvastuslävi seatud sihtvalehäire eelarvest <c4/> ning <b>tuvastamata jäämise tõenäosus <c5/> esitatud nii kinnisel kujul kui ka Monte Carlo abil</b> (need kaks langevad kokku mõne ×1/√N täpsusega) — Security kvaliteedinäitaja on <c6/>. Lisaks <b>lingieelarve segamise mudel</b> (liik <c7/>, <c8/>): segaja ja signaali suhe geomeetriast (vabaruumi levikadu + suunapõhine vastuvõtuantenni võimendus), standardne <b>häiringukindla efektiivse C/N₀ võrrand</b> (hajutuse tühistamise töötlusvõimendus + spektrierituse tegur <c9/>; Kaplan & Hegarty §{ "9.4" }), satelliidi kaupa haardekadu seadistatava jälgimislävendi juures ja kvaliteedinäitaja <c10/> Walkeri konstellatsiooni üle. Lisaks <b>mitmekihiline RF/mõõtmise (RF: raadiosagedus) spuufimismonitoride komplekt</b> (<c11/>): <b>mitme satelliidi RAIM-kooskõla</b> pariteeditest (<c12/>, kaalutud jääkide SOS (ruutude summa) vs χ²(m−{ "4" }) lävi — ja see märgib õigesti, et ühisrežiimi nihe on RAIM-ile nähtamatu), <b>AGC (automaatne võimenduse reguleerimine) monitor</b> (<c13/>, vastuvõetud võimsuse ülejääk oodatava põranda suhtes), <b>signaalikvaliteedi / SQM (signal-quality monitoring) monitor</b> (<c14/>, Early/Late korrelaatori tasakaalutus) ning kihtide liitmise kombinaator (<c15/>). Need moodustavad <b>integreeritud <c16/></b>, mille <c17/> võtab sisse ühe epohhi vaadeldavad suurused (geomeetria + jäägid, AGC võimsus, Early/Late kraanid) ja käitab kõik kolm kihti läbi kaalutud liitmise ühe kutsega, tagastades kihtide kaupa diagnostika; see on avatud käivitatava <b>stsenaariumina <c18/></b> (<c19/>, ligipääsetav CLI-st / Pythonist / mänguväljakult, JSON + SVG (Scalable Vector Graphics)) ja <b>iseloomustatud avaldatud TEXBAT (Texas Spoofing Test Battery) stsenaariumi parameetrite vastu</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" }; <c20/>) — reprodutseerides dokumenteeritud tuvastatavuse mustri, sealhulgas negatiivsed tulemused: ülevõimsa ds2 püüavad AGC + SQM, sobitatud võimsusega ds3 ainult SQM, asukoha lükkav ds4 RAIM ja kandelaine faasiga joondatud sobitatud võimsusega ds7 jääb (õigesti) kellaga abistatud detektorile

# text
# c1: jamming
# c2: [crpa]
# c3: src/crpa.rs
# c4: [terrain]
# c5: src/jamming_terrain.rs
# c6: [acquisition]
# c7: [front_end]
# c8: src/jamming_rx.rs
# c9: src/iq/channel/multipath.rs
# c10: src/iq/channel/land_mobile.rs
# c11: src/iq/frontend/agc.rs
# c12: jamming
# c13: Q
# c14: navsignal
# c15: CombinedSpoofDetector
seg-e423ffff332b = Liik <c1/> on <b>lingieelarve</b> — sellel ei ole mitmeteelevi ega AGC dünaamikat ajas. Alates versioonist { "0.36" } võtab see neli valikulist jaotist: <c2/>, kanali kaupa adaptiivse massiivi kiir (nullide suunamine või MVDR failist <c3/>, kontrollitud sõltumatu numpy ümberarvutuse vastu; MODELLED), ja <c4/>, segaja tee ühe noateraga difraktsioonikadu SRTM-i plaadi kohal (<c5/>, ITU-R P.526-15 §{ "4.1" }, kontrollitud sõltumatu numpy ümberarvutuse vastu päris plaadil; MODELLED, ainult üks noatera), <c6/>, haarde- ja jälgimishüstereesi vahel, ning <c7/>, settinud AGC lugem ja ADC Gaussi sisendiga kvantiseerija kadu (<c8/>; märgitud mitte kehtivaks mitte-Gaussi segajate korral; MODELLED). Peegeldumisega mitmeteelevi, maaliikuva fading ja AGC on olemas IQ kihis (<c9/>, <c10/>, <c11/>) ning neid ei ole liiki <c12/> ühendatud; spektrierituse tabel <c13/> sisaldab õpikulisi tüübikaupa väärtusi (CW ja kitsaribaline { "1" }, lairiba ja pühitud { "2" } alates versioonist { "0.36" }), <b>kinnitatud failis <c14/> võimsusspektri tiheduste (PSD) põhjal tuletatud koefitsientidele</b> (vt nav-signaali rida). Kellaga abistatud spuufimise detektor on ühe kellaga; RF/mõõtmise monitorid on nüüd integreeritud (<c15/>) ja <b>iseloomustatud avaldatud TEXBAT stsenaariumi <em>parameetrite</em> vastu</b> (Humphreys et al.); jääk on kontrollimine <b>toorvektorite</b> vastu — TEXBAT IQ (in-phase/quadrature) valimid (mis vajavad SDR (software-defined radio) haarde/jälgimise esiotsa, mida kshanal ei ole, kuna see on simulaator, mitte vastuvõtja) või litsentsitud Spirenti stsenaarium — dokumenteeritud jätkutöö

# text
seg-34e1b6a6b738 = kellaga abistatud + integreeritud mitme SV RAIM-kooskõla + AGC + SQM <b>kombineeritud detektor</b> + TEXBAT-parameetrite iseloomustamine: <b>tehtud</b>; toorvektorite (TEXBAT IQ / litsentsitud Spirent) kontrollimine: jätkutöö

# text
seg-557448077fb0 = Navigatsioonisignaali modulatsioon ja koodijälgimise toimivus

# text
# c1: src/navsignal.rs
# c2: κ = 2/(3R_c)
# c3: κ = ∫ G_s(f)G_i(f) df
# c4: Q
# c5: jamming
# c6: Q = 1/(R_c·κ)
# c7: CodeFamily
# c8: 1/L
# c9: t(n)/L
# c10: φ(2ⁿ−1)/n
# c11: n mod 4 = 0
seg-22893b9a2c7a = <c1/>: <b>signaalitase</b> lingieelarve ja mõõtmisdomeeni vahel. Ühikpindalaga <b>võimsusspektri tihedused</b> <b>BPSK-R(n)</b> (kahendfaasmodulatsioon, ristkülikukujulised kiibid) ja <b>sine-BOC(m,n)</b> (kahendnihkega kandja) jaoks (CI-s kontrollitud ühikpindala, BPSK enda spektrierituse koefitsiendi (SSC) kinnise kuju <c2/> ja BOC spektrijaotuse suhtes — null kandjal, tipud ±f_s); <b>spektrierituse koefitsient</b> <c3/>, mis nüüd <b>tuletab häiringukindla <c4/></b>, mida kasutab <c5/>, tegelikest signaali/segaja spektritest (<c6/>) esindusliku konstandi asemel (lairiba viidet kontrollitakse CI-s ristiti); <b>RMS (Gabori) ribalaius</b> (BOC > BPSK — kaugusmõõtmise teabe / Cramér–Rao mõõt); <b>koherentne early–late DLL (delay-locked loop) koodijälgimise termilise müra värin</b> (Kaplan & Hegarty §{ "8" } — ~alla meetri C/A jaoks tasemel { "45" } dB-Hz, monotoonne C/N₀ suhtes); ning <b>mitmeteelevi vea mähis</b> (koherentne EML (early-minus-late), leitud liitdiskriminaatori nulli asukoha järgi — kitsa korrelaatori summutus kontrollitud). <b>Kaugusmõõtmise koodi kavandi kompromissi</b> kiht (<c7/>) lisab m-jada/Goldi perioodilise autokorrelatsiooni külgsagarad (<c8/> m-jada jaoks) ja kolmeväärtuselise <b>Goldi ristkorrelatsiooni piiri <c9/></b> — reprodutseerides avaldatud <b>GPS C/A −{ "23.9" } dB</b> Goldi ristkorrelatsiooni (väline ankur) ja m-jadade arvu <c10/> — pluss koodi pikkuse↔üheselt mõistetava vahemaa pöördteisenduse; Goldi garantiid tagastavad ausalt <em>None</em>, kui eelistatud paari ei ole (<c11/>), selle asemel et esitada piiri, mis ei kehti.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Alates versioonist { "0.31.0" } lisab eraldi <b>IQ kiht</b> (<c1/>, käsud <c2/>; kavand failis <a1><c3/></a1>) tarkvaravastuvõtja ahela: FFT (kiire Fourier' teisendus) haare, mitme kanaliga DLL/PLL/FLL (viivitus-, faasi- ja sagedussünkroniseeritud ahel) jälgimispank, esiotsa filtreerimine ja 1-kuni-14-bitine kvantimine ning salvestatud andmestike voogedastus. Sõltumatu tarkvaravastuvõtja taastab oma stseenide süstitud tõe ning GPS L1 C/A koodid ja LNAV (legacy navigation message) bitid on gps-sdr-sim-iga bitthaaval täpsed. Veel puudu: ahela diskriminaatorid eeldavad ideaalset BPSK korrelatsioonikolmnurka, seega puudub BOC jälgimise mitmetähenduslikkuse lahendamine; kanali- ja ahelamudelid on MODELLED, kontrollitud kinniste kujude ja süstitud tõe vastu, <b>mitte mõõdetud välja-IQ vastu</b>; ainult skalaarsed ahelad (vektorjälgimist pole). Antenni/RF-kasuliku koormuse <b>riistvara</b> kavandamine (kiirgusdiagrammid, esiots) on teadlikult ulatusest väljas — koormuspartneri roll.

# text
seg-a62a0d9aa1d0 = BOC mitmetähenduslikkus + IQ kihi välja-IQ kontrollimine: P2+

# text
seg-6b974aba070f = Kvant-PNT anduri füüsika

# text
# c1: src/inertial/quantum_imu.rs
# c2: Φ = k_eff·a·T²
# c3: σ_Φ = 1/(C√N)
# c4: q_va
# c5: |H(ω)|
# c6: coriolis_phase
# c7: 2Ω×v
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: QuantumNavBudget
# c11: ½·b·t²
# c12: AccelModel
# c13: QUANTUM.md
seg-3773b241a9e5 = Enamik andureid põhineb <b>avaldatud Alani/müraeelarve koefitsientidel</b> (CSAC, optiline), <b>pluss esimestest printsiipidest külmaatomi interferomeetri (CAI) kiirendusmõõturil</b> failis <c1/>: kolmeimpulsiline Mach–Zehnderi faas <c2/>, kvantprojektsiooni (shot) müra <c3/>, tuletatud kiiruse juhusliku käimise PSD <c4/>, mida inertsiaalne pakk tarbib, kontrastsuse vähenemine, vibratsiooni ülekandefunktsioon <c5/> + valge PSD dispersioon ning nüüd <b>Coriolisi/pöörlemise</b> (<c6/>, ekvivalentne nihe <c7/>) ja <b>AC-Starki (AC: vahelduvvool) valguse nihke</b> (<c8/>, sümmeetriline tühistus) süstemaatilised vead + tsükliaja <b>triivipühkimine</b> (<c9/>) ning <b>koostatud kvant-inertsiaalse dead-reckoning-i vea eelarve</b> (<c10/>), mis voldib CAI valge müraga kiiruse juhusliku käimise kokku jääknihke (<c11/>, ristkontrollitud sõltumatu <c12/> Euleri integraatoriga), skaalateguri vea ja valikulise <b>pikaajalise</b> stabiilsuse halvenemisega (erinev ühe laskme dekoherentsist) üheks asukoha triivi arvuks holdover-i jooksul pluss inertsiaalseks holdover-i-lävendini — kella holdover-i dead-reckoning-i kaksik. Modelleeritud kvantpõrand on <b>sulgudes (mitte pariteedis)</b> Freier et al. { "2016" } mobiilse gravimeetri { "96" } nm/s²/√Hz (arXiv:{ "1512.05660" }) suhtes — see asub sellest allpool ja ~{ "2" } suurusjärgu piires. Dokumenteeritud failis <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Lainefrondi/kiire suunamise süstemaatilisi vigu ei modelleerita; Mach–Zehnderi ribade mitmetähenduslikkuse <em>piir</em> on modelleeritud (<c1/>, <c2/> failis <c3/>), kuid mitmetähenduslikkuse lahendamist ei ole; täpsed CARIOQA-PMP (CARIOQA: Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense lennukatse eelarved (vajavad avaldatud platvormi PSD-sid + laskme kaupa SNR-i (signaali ja müra suhe)) ja JS (JavaScript) mänguväljaku eelseadistus on jääkülesanded

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = lainefrondi süstemaatilised vead + lennukatse reprodutseerimine: P2+ (<a1><c1/></a1>)

# text
# c1: src/walker.rs
# c2: tests/igs_real_data.rs
# c3: {planes × sats × inclination}
# c4: constellation-design
# c5: optimize_walker_design
# c6: MinSatellitesForCoverage
# c7: MaxCoverage
# c8: MinWorstPdop
# c9: coverage_half_angle_rad
# c10: street_half_width_rad
seg-59e99de860b2 = Sünteetiline Walker (nii analüütiline Kepleri <b>kui ka SGP4 keskmiste elementidega</b>, viimane propageeritud { "4.12" } mm-kontrollitud tuuma kaudu — <c1/>) + päris TLE mitme konstellatsiooni nähtavus ja DOP (GPS+Galileo kuni { "100" }%), kontrollitud <b>päris Celestraki gps-ops hetktõmmise</b> vastu (<c2/>); <b>PDOP (positsiooni täpsuse halvenemise tegur) kavandipühkimine</b> võrgu <c3/> üle ja <b>kattuvusosa / korduskülastuse aja</b> kvaliteedinäitajad; käivitatav <b>liik <c4/></b> (Walkeri delta- ja tähemustrid i: T/P/F konventsioonis, selgesõnalised elementide loendid, mitme kestaga kavandid ja avaldatud eelseadistused, ümber Maa, Kuu, Marsi või mis tahes muu kataloogitud keha), mille Walkeri geomeetria ning avaldatud GPS, Galileo ja GLONASS pesad on VALIDATED avaldatud tabelite vastu ja mille globaalne GPS lähtetaseme täpsuse halvenemise tegur on VALIDATED GPS Standard Positioning Service toimivusstandardi vastu, samas kui suvaliste kavandite kattekaardid jäävad MODELLED; <b>gradiendivaba kavandi optimeerija</b> (<c5/>), mis otsib võrgust valitud eesmärgi alusel parima kavandi (<c6/> / <c7/> / <c8/>), kontrollitud tagastama toore jõu võitja; ja <b>analüütiline kattuvusribade geomeetria</b> (<c9/>, <c10/>; Rider/Beste kinnised kujud, käsitsi kontrollitud — GPS { "5" }° maskiga: λ ≈ { "71.2" }°, 4-satelliidilise riba poolsuurus ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Idealiseeritud <b>kattuvusribade minimaalse satelliitide arvu</b> mõõtmine on olemas (<c1/>); vastupidiselt pöörleva tasandi piiril õmbluse täpset Rideri parandust ei ole realiseeritud; mänguväljak joonistab sõltuvusteta 3-D orbiidivaate (<c2/>) ning CZML (Cesium Language) eksport <c3/> laadib geomeetria CesiumJS gloobusele; DOP tuum on VALIDATED gnss_lib_py vastu (<c4/>) ning täielik mitme konstellatsiooni nähtavuse konveier on otsast otsani ristkontrollitud Orekit { "12.2" } + gnss_lib_py vastu (<c5/>): Maa kavandid langevad kokku kõigil lävedel, kuid Kuu ja Marsi kavandid jätavad DOP läve numbriliselt singulaarse geomeetria tõttu täitmata, mistõttu rida jääb MODELLED; geodeetiline vs geotsentriline „üles“ DOP raamis

# text
seg-3fcc2a2a90ba = kattuvusribade mõõtmine + 3-D orbiidivaade + otsast otsani Maa ristkontroll: <b>tehtud</b>; õmbluse täpne Rideri parandus + halvasti tingitud Maa-välise DOP: P2

# text
seg-afd5b595ee5e = Verifitseerimine ja valideerimine

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Sõltumatu etaloni kontrollid kogu mootoris (SGP4 vs { "666" } AIAA vektorit, Alani pere vs Stable32 ja allantools, raamid vs SOFA/ERFA, jõumudel ja orbiidi määramine vs Orekit, ARAIM vs WG-C läbitöötatud näide ja muu; elav arv on faili <a1><c1/></a1> genereeritud päises); deterministlikud Alani kontrollid; <b>masinkontrollitud kontrollimaatriks</b> (<c2/>) — nõue→moodul→test→sõltumatu etalon→staatus ristviide, mille ausustuse invariandid on <b>ühiktestitud</b>: rida võib olla sildistatud <em>kontrollituks</em> ainult siis, kui sellel on sõltumatu <b>väline</b> etalon (NIST/AIAA/SOFA/IGS/avaldatud väärtus), nii et sisemine enesekooskõla kontroll ei saa end kontrollimisena maskeerida; renderdub Markdown/CSV (CSV: komaga eraldatud väärtused) kujule ECSS-E-ST-10-02 (ECSS: European Cooperation for Space Standardization) verifitseerimise ristviiteks ning registreerib neli partneri omanduses olevat riistvara/PA (PA: toote kvaliteedi tagamine) lünka just sellisena

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Kalibreerimisansamblid katavad seni kolme ühe algväärtusega kontrolli (<a1><c1/></a1>, eelregistreeritud: Monte Carlo bootstrapi vahemik katab { "96" } % { "200" } algväärtusest; üks protsentiili tolerants on algväärtuse suhtes habras, NOT MET tasemel { "91.5" } %); ülejäänud read on endiselt kalibreeritud ühtedel algväärtustel. Maatriks jõustab rea <em>klassifikatsiooni</em> ning CI kontrollib nüüd ka, et iga test, fail ja kasti-sisene üksus, millele rida viitab, on olemas (<c2/>, <c3/>) ja et avaldatud arvud endiselt reprodutseeruvad (<c4/>); see ei hinda etaloni ennast, mida ülevaataja loeb endiselt

# text
seg-d3b92a831cd9 = kalibreerimisansamblid: P1

# text
seg-f382bb1b5d54 = LEO-PNT (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Seitse liiki, süsteemist sõltumatud nimega avalike eelseadistustega: <b><c1/></b> (mis tahes riba ja struktuuriga signaalikavandid: BPSK, BOC, MBOC (multiplexed BOC) või lamedad OFDM-laadsed (orthogonal frequency-division multiplexing) komponendid, koodijälgimine, haare, GNSS-iga ühilduvus, ribade kompromiss), <b><c2/></b> (kavandatud, elemendi-, TLE- või Walkeri läbimine riba kaupa lingieelarvega: ITU-R (International Telecommunication Union Radiocommunication Sector) vihm, skintillatsioon ja hoonesse sisenemise kadu, ionosfäär, antenn, Doppler, nähtavate MEO (keskmine Maa orbiit) GNSS satelliitide vastu), <b><c3/></b> (edastatav efemeriid ja kell Galileo ICD (interface control document) Kepleri baasil või valitavate LEO mudelitega, sobitatud ja kodeeritud CRC-24Q (24-bitine tsükliline liiasuskontroll) kaadrikontrolliga), <b><c4/></b> (ühendatud MEO + LEO pseudovahemaa ja Doppleri positsioneerimine mis tahes konstellatsioonide üle), <b><c5/></b> (PPP koondumine LEO täiendusega ja ilma, simuleeritud mõõtmistel), <b><c6/></b> (5G NTN, mittemaapealse võrgu, positsioneerimise piirid signaali ribalaiusest) ja <b><c7/></b> (üks süsteem otsast otsani, iga etapi väljund antakse järgmisele). VALIDATED osad: ITU-R lingi liikmed soovituste tabelite ja kontrollnäidete vastu, maksimaalne Doppler avaldatud tabeli vastu, Galileo kasutajaalgoritm RTKLIB vastu täpsusega { "1" } mm, CRC-24Q, SISRE (signal-in-space range error) kaalud

# text
seg-5f87d4e409d5 = Välja- ega salvestatud signaale pole; positsioneerimise, PPP, NTN ja ajastuse arvud on MODELLED (kinnised kujud, filtri kooskõla, avaldatud trendivõrdlused); eelseadistused on avaliku allikaga või tuletatud, mitte operaatori andmed

# text
seg-d29a58fe2c84 = päris salvestatud signaali kontrollimine: P3

# text
seg-4ea6f7ecc4a7 = Spekter / RF keskkond

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>Liik <c1/></b> (<c2/>): GNSS L-riba (ja ülikõrgsagedus- (UHF), S- ja C-riba mitmeribalised kavandid) ühe võimsusspektri tihedusena, sagedus risti ja aeg alla, stsenaarse segaja ajajoone all (pidevlaine-, kitsaribalised, chirp- ja sobitatud lairibasegajad), riba kaupa J/S-ga (segaja ja signaali suhe) ja efektiivse C/N₀-ga (kandja ja müra tihedus); SigMF salvestised sisse ja välja ning kompleksvalimite Welchi spektrihinnangud. Kinnised signaalispektrid ja spektrierituse koefitsiendid on VALIDATED; juga on MODELLED

# text
seg-970852c2e2e8 = GLONASS, BeiDou ja Galileo E6 signaale ei modelleerita; vastuvõtja esiotsa ega salvestatud IQ (in-phase/quadrature) kontrollimist pole

# text
seg-5402957c3eb5 = salvestatud signaali võrdlus: P3

# text
seg-a5e741fa9d69 = Vastuvõtja logi usaldus (laev ja üldine)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/>: vastuvõtja enda logi monitorid (kandja ja müra tihedus, asukoha, kiiruse ja suuna kooskõla, aeg) enne käivitust väljaöeldud sündmuste ja prognoosidega; laevaplatvormil skoor 0–100 koos põhjendustega; reaalajarežiim voo peal lausega <c2/> ja valikulise väravaga. MODELLED; nõuandev, mitte tüübikinnitust omav navigatsiooniseade

# text
seg-810132d58fbf = Läved on väljaöeldud vaikeväärtused, mitte mõõdetud kasutuses olevate vastuvõtjate vastu; logi annab skoori ainult sellele logile; raadiosageduslikku sisendit ega väljundit ei ole; mitte tüübikinnitust omav navigatsiooniseade

# text
seg-82017a0ec045 = Tõendipaketid ja usalduse telemeetria

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/>: allkirjastatud, räsiahelaga logiakna, selle konfiguratsiooni ja mootori tulemuse pakett, mis on võrguühenduseta kontrollitav, valikulise RFC { "3161" } ajatempli tokeniga. <c2/>: usaldusvoog Prometheuse mõõdikutena, syslog-sündmused (CEF või LEEF) ja valikuline OpenTelemetry, koos näidis-Grafana töölauaga

# text
seg-9d2138e7a040 = Pakett on tehniline kirje, mitte juriidiline arvamus, ega ütle, mis sündmuse põhjustas; ajatempli asutuse allkirja ei kontrollita; telemeetria edastab ainult telemeetriat

# text
seg-744f186bdf09 = Meeskonna koolituse voogud ja häirekaardid

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/>: sünteetiline sillasüsteemi NMEA stsenaarse segamise, kõrvalejuhtimise (drag-off), aja spuufimise ja taasesituse sündmustega ning juhendaja logiga (ainult tekst). <c2/>: koondatud halvenenud navigatsiooni kaardid avatud litsentsiga õhusõidukite ja laevade aruannetest ning marsruudi kokkupuude, kohalikest failidest

# text
seg-91174c1a81be = Vood on koolitusandmed, mitte kunagi laeva reaalajas navigatsioonisüsteemide jaoks; kaardid on koondatud, mitte prognoos, ja sõltuvad antud aruannetest

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/>: stsenaariumi <c2/>, <c3/> või <c4/> sõiduki liikumine ja sündmused liikumis-CSV-na, NMEA-na, teekonnapunktide tekstina ja sündmuste failidena laboratoorse GNSS-simulaatori jaoks

# text
seg-e5aa0f32fb2a = Signaali ei kirjutata; simulaatori ega vastuvõtja toimivust ei väideta; faile kontrollitakse nii, nagu ühe avatud lähtekoodiga simulaatori liikumislugejad (gps-sdr-sim) neid tagasi loevad, kuid stsenaariumi enda tõelise trajektoori füüsikat välisega ei kontrollita

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> ja <c2/>: loeb Galileo I/NAV lehti või UBX-voogu ja teatab satelliidi ning epohhi kaupa, kas navigatsiooniandmed on autenditud (allkirjastatud Merkle-juurega võti, TESLA ahel, MAC-id), koos põhjusega, miks kontroll ebaõnnestus, ja valikulise sõltumatu viiteajaga värskuse jaoks; ka <c3/> Pythonis ja WebAssembly-s

# text
seg-0e782e8a2775 = Autendib andmeid kasutaja antud võtmete vastu; ei väida spuufimisvastast toimivust ega ole navigatsiooni terviklikkuse teenus ega tüübikinnitust omav seade; kontrollitud sünteetilistel vektoritel, ametlikud ICD testvektorid on väline allalaadimine

# text
seg-98d0bc6b40ce = Avalike raamistike compliance-kaardistus

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> ja <c2/>: Kshana väljundid kaardistatud kuuele avalikule vastupidavusraamistikule ja standardile koos allikatega ja lüngaga igal real; käivitus loeb ainult siis, kui selle tulemus kannab väljasid, mida selle liik kirjutab

# text
seg-50652c747b6a = Kaardistus on otsustus; aruanne ütleb, mille kohta käivituste komplekt toetab tõendeid (supports evidence for), mitte kunagi seda, et raamistik on täidetud või toode heaks kiidetud; EN { "16803" } on viidatud ainult kataloogitekstist

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Signal K plugin, OpenCPN värava-režiimi (gate-mode) NMEA kaudu TCP-l ja viiteversioon vastuvõtja kõrval olevale väikearvutile (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Testitud salvestatud sünteetilisel väljundil; plugin ei ole npm-is avaldatud; nõuandev, mitte tüübikinnitust omav navigatsiooniseade

# text
seg-8281218f1c7c = Laiemad kosmosesüsteemide valdkonnad (täna ulatusest väljas)

# text
# c1: partial
seg-b564e0b42adc = Mitmed neist on <b>puuduvad</b>; teised on nüüd <b>esimese järgu <c1/> mudelid</b> (missioonianalüüsi / keskkonna liigid, mis lisati { "v0.17.0" } seerias) — loetletud, et ulatus oleks üheselt mõistetav, mitte vaikimisega vihjatud. Kshana on PNT simulaator, mitte GMAT/STK/Orekit (STK: Systems Tool Kit); need kõrvalolevad mudelid on teadlikult esimest järku ja MODELLED, mitte kunagi kontrollitud lennutööriistad.

# text
seg-8125b00a48e4 = Märkus / teekaart

# text
seg-6779cc4a0e99 = Missiooni kavandamine / trajektoori optimeerimine

# text
# c1: src/maneuver.rs
# c2: maneuver::lambert_multirev
# c3: tests/lambert_multirev_oracle.rs
# c4: maneuver::porkchop_kernel
# c5: tests/porkchop_de440_oracle.rs
# c6: maneuver::optimise_transfer_kernel
# c7: tests/transfer_optimiser_oracle.rs
# c8: src/ephem_provider.rs
# c9: xval/anise-mars-od
seg-3c1a80170fd5 = <c1/>: impulsiivsed ΔV sõlmed { "6" }×{ "6" } kovariatsiooni propageerimisega (ECI/LVLH (ECI: Maa-tsentriline inertsiaalne; LVLH: kohalik vertikaal, kohalik horisontaal) täitmisvea raamid), lõpliku põlemise integreerimine kontrollitud kinnise <b>Tsiolkovski</b> võrrandi vastu täpsusega < { "0.01" } %, <b>Izzo-2015 ühe tiiruga Lamberti</b> lahendaja + täpne universaalmuutujate <b>Kepleri propageerija</b> (Lamberti väljundid tsükliliselt kontrollitud kahe keha tõe vastu) ning <b>porkchop</b> (start × saabumine) C3 / saabumis-V∞ pühkimine, mis on väljastatud JSON-i kontuurivõrguna, mille miinimumi kontrollitakse analüütilise Hohmanni põranda vastu. <b>Trajektoori optimeerijat ei ole</b>; <b>mitme tiiruga Lamberti</b> lahendaja (<c2/>, kuni kolm tiiru, mõlemad harud) on VALIDATED pykep { "3.0.1" } vastu (<c3/>); porkchop töötab sünteetilisel koplanaarsel-ringmudelil või, kasutades <c4/>, DE440 SPK-l (VALIDATED SPICE olekute + pykepi Lamberti vastu, <c5/>); <c6/> leiab pideva kuupäevaoptimumi (min C3 või min saabumis-V∞, tüüp I või II) DE440-l, VALIDATED sõltumatu SPICE + pykep + SciPy optimeerija vastu (<c7/>); avaldatud NASA/TM-2010-216764 { "2026" } Maa–Marsi miinimumide vastu langeb see kokku II tüübi väärtustega ja jääb I tüübi miinimumi C3 poolest −{ "5.18" } % kaugusele (registreeritud). GMAT-i ennast ei käivitatud; pykep on teegi sõltumatu etalon. Süvakosmose <b>planeetide efemeriidi õmblus</b> (<c8/>) ja <b>DE440 (Development Ephemeris { "440" }) ristkontroll</b> (<c9/>, { "137" } m @ 1-päevane Marsi kaar) on nüüd olemas — vt süvakosmose / planeetidevahelise PNT rida. Toimivussimulatsiooni kiht GMAT/Orekit kohal, mitte asendus. P3

# text
seg-e42e299359d6 = AOCS (orientatsiooni- ja orbiidijuhtimissüsteem) / GNC (juhtimine, navigatsioon ja kontroll) / orientatsioon

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
# c3: 1.5·(μ/R³)·ΔI
# c4: src/attitude_dynamics.rs
# c5: tests/attitude_dynamics_basilisk_oracle.rs
# c6: tests/attitude_gg_torque_basilisk_oracle.rs
# c7: src/wahba.rs
# c8: aocs
# c9: src/aocs.rs
# c10: src/aocs_kind.rs
# c11: AOCS.md
# c12: src/aocs_mekf.rs
seg-a1bccf1c2e01 = Liik <c1/> (<c2/>): halvima juhtumi <b>gravitatsioonigradiendi moment</b> <c3/> + <b>RSS (ruutude summa ruutjuur) suunamisvea eelarve</b> iga panustaja 1σ liikmete üle — MODELLED skalaarne riistvara-eelne suunamise/häirete eelarve. Momendivaba <b>jäiga keha orientatsiooni dünaamika</b> kvaternioonolekuga (<c4/>: Euleri võrrandid + kvaternioonkinemaatika, RK4) on VALIDATED Basilisk { "2.9.1" } kosmoselaeva keskme vastu (<c5/>, kvaternioon { "1e-9" } piires { "1e4" } s jooksul) ja gravitatsioonigradiendi momendi tipp Basiliski GravityGradientEffector-i vastu (<c6/>); Wahba orientatsiooni määramine on failis <c7/>. <b>Liik <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>): inertsiaalne suunamispööre tasakaalustatud reaktsiooniratastega MRP tagasisidega, minimaalse normiga ratta momendid mootoripiirangutega; suletud ahel on <b>VALIDATED</b> Basilisk { "2.9.1" } vastu kolmel eelregistreeritud juhtumil ümardusveani. Güroskoobi ja tähejälgija MEKF (<c12/>) saab ahela sulgeda oma hinnangul (MODELLED, filtri kooskõla). Jälgimisjuhtimist, integraaltagasisidet, impulsimomendi haldust, magnetmomendi tekitajaid, tõukureid, ratta hõõrdumist ega kiiruspiiranguid ei ole; orientatsiooni dünaamikas puudub väline momendi keskkond; ei ole lennukontroller. P3

# text
seg-eb137d279247 = Tugisüsteemid → Maaga seotud

# text
seg-c45f5e2f4bec = <b>Tehtud</b> — TEME→ECEF/ITRF, poolusenihe ja CIO-põhine GCRS→ITRS ahel on realiseeritud ja VALIDATED (bitthaaval vs SOFA/ERFA; { "4" } mm otsast otsani vs Vallado). Vt ülal rida <b>Tugisüsteemid</b>

# text
seg-aa268d6f1635 = Side ja lingieelarved

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/>: <b>süvakosmose Friisi lingieelarve</b> (Tx võimsus · antennivõimendused · müra → C/N₀ · Eb/N₀ · varu), mis toidab radiomeetrilist/GSE (GSE: maapealne tugiseadmestik) teed, pluss optilised/RF aja edastamise lingid (<c2/>) ja käivitatav <b>liik <c3/></b> — ühesuunaline CCSDS-401/DSN-810-005 (DSN: Deep Space Network) lingivõrrand <c4/> <b>EIRP (efektiivne isotroopne kiirgusvõimsus) / G-T</b> sisenditega ja S/X/Ka riba valikuga (MODELLED insenerlik lingieelarve, mitte kalibreeritud terminali andmeleht). Ei ole juurdepääsu ajastamist ega adaptiivset kodeerimist. P2

# text
seg-cd6f9d8d0dc2 = Maasegment ja operatsioonid

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = Liik <c1/> (<c2/>): <b>maajaama tõusu/loojangu läbimise prognoos</b> — AOS/TCA/LOS (AOS: signaali haare; TCA: lähima lähenemise aeg; LOS: signaali kadu), maksimaalne kõrgus, läbimise kestus ja kogu ligipääs horisondi jooksul, SGP4 elemendikomplektist IAU 2006/2000A Maaga seotud raamis ITU-R P.834-9 refraktsiooni ja valguse ajaga — <b>VALIDATED Orekit { "13.1.8" } vastu</b> merepinna jaamades ({ "60" } juhtumit / { "1210" } läbimist, <c3/>); geomeetriline <c4/> on VALIDATED Orekit { "12.2" } kõrgusdetektori vastu ({ "22" } stsenaariumi / { "129" } läbimist, <c5/>); ajastuse optimeerijat ega konfliktide lahendamist ei ole. P3

# text
seg-ec6ce48c783e = Telemeetria / TT&C / CCSDS

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
# c4: oem
# c5: src/ccsds_tdm.rs
# c6: space-packet
# c7: src/space_packet.rs
# c8: src/omm.rs
# c9: src/naif_kernel.rs
# c10: ephem_provider::KernelEphemeris
seg-4f1158386205 = kohandatud TOML-sisend/JSON-väljund; <b>CCSDS OEM (Orbit Ephemeris Message) eksport <em>ja import</em></b> (502.0-B KVN (keyword-value notation), GMAT/Orekit/STK) käivitatava <b>liigi <c1/></b> kaudu (<c2/> <c3/> edasi-tagasi sild; standardi järgiv ühe objekti vahetus on <b>VALIDATED</b> sõltumatu <c4/> { "0.4.5" } parseri vastu); <b>CCSDS-TDM ({ "503" }) Tracking-Data-Message parsimine + väljastamine</b> (<c5/>, süvakosmose radiomeetriline vahetusvorming); ja <b>liik <c6/></b> (<c7/>): <b>CCSDS 133.0-B Space Packet</b> primaarpäise kodeerimine/dekodeerimine bitttäpse edasi-tagasi teisendusega. <b>CCSDS OMM</b> (Orbit Mean-Elements Message, 502.0-B-2, ODM-pere osa) kirjutaja (<c8/>) avaldab SGP4 keskmised elemendid KVN-is ja puhas Rusti <b>NAIF SPICE kerneli lugeja</b> (<c9/>: DAF konteiner, SPK tüüp { "2" }, binaarne PCK tüüp { "2" }) toetab <c10/>. Muud CCSDS sõnumitüübid (OPM, OCM, AEM (AEM: Attitude Ephemeris Message)) ja SPICE <em>kirjutamine</em> jäävad teekaardi punktiks (P2)

# text
seg-a3e6c2c5e7df = Koostalitlusvõime ja standardid (RINEX/SP3/SPICE/CCSDS)

# text
# c1: Propagator::Sp3Precise
# c2: kshana <orbit.toml> --export-sp3 out.sp3
# c3: export_sp3 = true
# c4: tests/sp3_export_roundtrip.rs
# c5: kshana <orbit.toml> --export-oem out.oem
# c6: export_oem = true
# c7: tests/sp3_export_roundtrip.rs
# c8: pvt
# c9: src/ccsds_tdm.rs
# c10: --export
# c11: src/interop/
# c12: tests/interop_formats.rs
# c13: --import-route
# c14: spectrum
# c15: INTEROP.md
# c16: STANDARDS.md
# c17: oem-interop
# c18: src/omm.rs
# c19: src/naif_kernel.rs
seg-b41f3b5644a8 = RINEX { "3" } <b>mitme-GNSS NAV</b> — GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>ja GLONASS</b> (PZ-90 (PZ: Parametry Zemli, vene geodeetiline datum) olekuvektori RK4) — sissevõetud + propageeritud + käivitatav ühe segatud konstellatsioonina; <b>RINEX { "3" } OBSERVATION parser</b> (pseudovahemaa/kandelaine/Doppler/SNR vaatluskoodi kaupa, LLI/SSI (LLI: haardekao indikaator; SSI: signaali tugevuse indikaator) lippudega; { "4.00" } peaks parsima, testimata); SP3-c/d täppisefemeriidi <b>lugemise ↔ kirjutamise edasi-tagasi teisendus</b> (parsimine + eksport Ginani/RTKLIB/gLAB jaoks) <b>ja 10. järgu (11 punkti) Lagrange'i propageerija</b> (<c1/>); SP3 eksport on <b>CLI-s avatud</b> (<c2/> või <c3/>) ja <b>edasi-tagasi kontrollitud</b> päris GPS konstellatsiooni vastu täpsusega <{ "0.5" } m { "24" } h jooksul (<c4/>); <b>CCSDS OEM { "2.0" } efemeriidi kirjutaja</b> — kiirust kandev TEME oleku eksport lennudünaamika tööriistadele — on nüüd <b>CLI-s avatud</b> (<c5/> või <c6/>) ja edasi-tagasi kontrollitud propageerija oleku vastu (<c7/>). <b>RINEX vaatluste parser toidab nüüd ühepunkti-positsioneerimise lahendust</b> (<c8/>, kontrollitud päris IGS andmetel — vt GNSS / PNT rida). Lisaks <b>CCSDS-TDM ({ "503" })</b> jälgimisandmete sõnumi parsimine + väljastamine (<c9/>). Geomeetria eksport vaaturitele ja missioonianalüüsi tööriistadele: <b>CZML, KML (Keyhole Markup Language), GeoJSON ja STK efemeriid</b> (<c10/>, <c11/>), igaüks parsitud tagasi vormingu spetsifikatsioonist kirjutatud valideerijaga (<c12/>), GeoJSON marsruudi import (<c13/>), <b>SigMF</b> (Signal Metadata Format) salvestised sisse ja välja liigile <c14/> ning RINEX-4-laadne / CSV tekst LEO navigatsioonisõnumi jaoks (<a1><c15/></a1>, <a2><c16/></a2>). Ei ole BeiDou-GEO-d, PPP täisarvuliste mitmetähenduslikkuste fikseerimist ega kinemaatilist RTK-d (staatiline ujuv PPP ja lühikese baasjoone RTK päris andmetel on olemas, vt GNSS / PNT rida), SPICE kirjutajat ega OPM/AEM-i veel (<b>OEM lugeja</b> on olemas liigi <c17/> kaudu, <b>OMM kirjutaja</b> failis <c18/> ja <b>SPICE SPK/PCK lugeja</b> failis <c19/>) — <b>P2</b> „lisa kõrvalvaldkonnad standardvormingute kaudu“

# text
seg-437dbb962136 = Kosmoseilm / keskkond (iono/atmo/kiirgus)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = Liik <c1/> (<c2/>): päikese/geomagnetilised indeksid (<b>Kp↔ap</b> IAGA (International Association of Geomagnetism and Aeronomy) 28-sammuline tabel, päevane Ap, tsentreeritud 81-päevane <b>F10.7a</b>), <b>Jacchia-71 eksosfääri temperatuur</b> ja <b>aktiivsusest juhitud termosfääri tiheduse sidestus</b> staatilise atmosfääri kohal — MODELLED esimest järku, <b>MITTE</b> NRLMSISE absoluuttiheduse mudel. Ionosfäär: Klobucharu edastusmudel (VALIDATED RTKLIB vastu) ja IONEX (IONosphere map EXchange format) TEC (elektronide kogusisaldus) kaardi lugeja (<c3/>, ühiktestitud). Päris CODE globaalne ionosfääri kaart (<c4/>) on geomeetriavaba kaldtee-TEC rea mõõdetud sõltumatu etalon (<c5/>), kuid see test hindab kaarti oma fikstuurigeneraatoris, seega ei ole lugejat <c6/> ennast veel päris toote vastu ristkontrollitud; füüsikapõhist ega kosmoseilmast juhitud ionosfäärimudelit ei ole; P2+

# text
seg-78a2c5a930e8 = Gravitatsioonikaardi / alt-PNT navigatsioon

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: mapmatch
# c4: particle_filter
# c5: run_gps_denied_gravity_nav
# c6: scenarios/gps-denied-gravity-nav.toml
# c7: src/igrf.rs
# c8: igrf14coeffs.txt
# c9: src/altpnt/terrain.rs
# c10: .hgt
# c11: run_terrain_nav
# c12: run_combined_altpnt
# c13: src/altpnt/sequential.rs
# c14: run_sequential_trn
# c15: particle_filter
# c16: kind=
# c17: gravity-map
# c18: terrain-nav
# c19: combined-altpnt
# c20: terrain-slam
# c21: scenarios/terrain-nav.toml
# c22: scenarios/combined-altpnt.toml
# c23: scenarios/terrain-slam.toml
# c24: gravity-map
# c25: [reference]
# c26: .gfc
# c27: xval/icgem-egm2008/
# c28: [map_error_mc]
# c29: scenarios/gravity-map-error-mc.toml
# c30: combined-altpnt
# c31: [magnetic_grid]
# c32: terrain-nav
# c33: combined-altpnt
# c34: terrain-nav
# c35: combined-altpnt
# c36: xval/srtm-ungate/
# c37: run_sequential_trn_on_map
# c38: xval/terrain-slam-rbpf/
seg-431b3f05c08c = <c1/>: külmaatomi <b>gravimeetri mõõtmismudel</b>, mille valge müra põrand on tuletatud CAI kiirendusmõõturi ASD-st (<c2/>), madala astmega <b>täielikult normaliseeritud sfäärilise harmoonilise gravitatsioonianomaalia väli</b> (kontrollitud kinniste Legendre'i funktsioonide ja käsitsi tuletatud ühe liikme anomaalia vastu) pluss sünteetilised <b>mascon'id</b> ja <b>gravitatsioonikaardi sobitamise osakeste filter</b> (komponeerib <c3/> + <c4/>), mis taastab GPS-ita raja anomaaliate jadast, mille läbi see lendab. <b>60-minutiline GPS-ita bench</b> (<c5/>, <c6/>) lendab ~{ "700" } km / ühe tunni katkestuse, kus inertsiaallahendus triivib <b>≈ { "70" } km</b> kaugusele, ja <b>hierarhiline jämedast peeneni</b> sobitaja gravimeetri deterministliku algväärtustatud valge müraga taastab selle täpsusega <b>≈ { "145" } m (< { "500" } m)</b> — stabiilne müra realisatsioonide lõikes ja tõestatavalt täpsustamisega piiratud (üks jäme võrk takerdub ~{ "2" } km juures). Lisaks <b>täielik IGRF-14 (IGRF: International Geomagnetic Reference Field) geomagnetilise põhivälja mudel</b> (<c7/>: IAGA Schmidti-normaliseeritud sfääriline harmooniline väli astmeni/järguni { "13" }, { "2025.0" } + sekulaarne muutus, koefitsiendid masinaga genereeritud ametlikust failist <c8/>; kontrollitud kinnise kujuga kaldus dipooli, skalaarpotentsiaali lõplike vahede ning teadaoleva geomagnetilise pooluse/tugevuse vastu) — magnetväli, mida platvorm saab kaardiga sobitada magnetanomaalia navigatsiooniks. Lisaks <b>maastikuga seotud navigatsioon (TERCOM/SITAN (TERCOM: maastikukontuuri sobitamine; SITAN: Sandia Inertial Terrain-Aided Navigation))</b> ja <b>kombineeritud gravitatsiooni+magnet+maastiku navigaator</b> (<c9/>): käsitsi kirjutatud SRTM (Shuttle Radar Topography Mission) <c10/> kõrgusmudeli (DEM) parser (16-bitine märgiga big-endian, reajärjestus, põhjarida esimesena, tühik -32768; kontrollitud GDAL (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format) draiveri spetsifikatsiooni ja kinnise bilineaarse keskpunkti etaloni vastu), radari/baro <b>kõrgusmõõtja</b> mudel ja <c11/> sobitaja, mis taastab GPS-ita raja maapinna kõrgusprofiilist DEM-i vastu, ja <c12/>, mis liidab <b>kolm skalaarset väljakanalit</b> teekonnapunkti kohta (Δg mGal · |B| nT maakoore anomaalia · kõrgus m), nii et ühisposterioor on teravam (madalam CRLB (Cramér–Rao alumine tõke)) kui ükskõik milline üksik väli — piiratud < { "500" } m 60-minutilise katkestuse jooksul ja ootuse järgi mitte halvem kui parim üksik kanal. Lisaks <b>järjestikune (rekursiivne) maastikuga seotud navigatsioon — SITAN kui jooksev filter</b> (<c13/>, <c14/>): sama kõrgusmõõtja-vs-DEM mõõtmismudel käivitatud <b>epohhhaaval</b> läbi <c15/> SIR (sampling importance resampling) mootori (ennusta INS-i juurdekasvu + protsessimüraga → kaalu maastikusobituse järgi → taasvali degeneratsioonil), nii et <b>ajas muutuvat</b> INS-i triivi <em>jälgitakse</em> mööda rada, kus partii sobitaja taastab ainult ühe konstantse nihke — rekursiivne hinnang jääb piiratuks ja koondub uuesti (lõpuks ≈ { "70" } m), samal ajal kui abistamata lahendus hajub piiramatult ≈ { "5" } km-ni, epohhi kaupa viga järgib maastiku eristatavust ja efektiivse valimi suuruse tervisemonitori. Aus ulatus: kaart on <b>teada ja fikseeritud</b> — rekursiivne <em>lokaliseerimine</em> salvestatud DEM-i vastu (maastiku SLAM-i (simultaneous localisation and mapping) lokaliseerimise pool); ühine kaardihinnang on eraldi RBPF allpool. Kõik neli on nüüd <b>stsenaariumimootoris <c16/> ühendatud</b> (<c17/>, <c18/>, <c19/>, <c20/>) SVG triivigraafikuga (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10):</b> navigaator <c24/> võtab valikulise päris viiteväljaga (<c25/>: komplekteeritud EGM2008 astmeni { "70" } või ICGEM <c26/> fail), mille anomaalia süntees langeb kokku ICGEM Calculation Service'iga ligikaudu { "1e-8" } mGal täpsusega (VALIDATED, <c27/>); sellel astme-70 väljal lõpeb 60-minutiline bench väärtusel { "3106" } m, seega < { "500" } m lävi on NOT MET (eelregistreeritud ja ennustatud: aste { "70" } on liiga sile). Valikuline kaardivea Monte Carlo (<c28/>, <c29/>) näitab, et sünteetiline { "144" } m fiks eeldab täpset kaarti ({ "20" } realisatsioonist { "1" } jääb { "500" } m piiresse { "2" } mGal korreleeritud vea korral; uuriv). <c30/> võtab valikulise EMAG2v3 maakoore magnetvõrgu (<c31/>; EMAG2 laaditakse, mitte ei kopeerita hoidlasse, ja selle põhjal ei väideta ühtegi navigatsioonitulemust). <c32/> jääb kavandi järgi ainult DEM-iks: see on ühe kanaliga TERCOM/SITAN sobitaja ja magnetsobitamine toimub failis <c33/>, mis liidab maastiku magnet- ja gravitatsioonikanalitega; magnetkanal liigis <c34/> dubleeriks seda, seega on auditi punkt „EMAG2 maastikunavigatsiooni“ kaetud <c35/> ühendusega (RM-16). Päris-SRTM kontrollid töötavad CI-s kahel sissekantud täisresolutsiooniga lõikel (sõlm-sõlmelt võrdne GDAL { "3.8.4" }-ga, <c36/>). Ühine kaardihinnang on olemas (<c37/>, FastSLAM-laadne RBPF): ühel läbimisel võidab see vigasel kaardil { "1.5" } % teadaoleva kaardiga SITAN-i ees, jäädes eelregistreeritud { "10" } % lävest allapoole (<c38/>). <b>Endiselt puudu:</b> kõrgastmeline gravitatsioonimudel navigatsioonikäivituses (vajab uut eelregistreerimist), päris võrgu magnetnavigatsiooni tulemus ja korduvkülastusega (ahela sulgemisega) SLAM-i juhtum. P3

# text
seg-bf09e5d705a0 = Taassisenemine / EDL (sisenemine, laskumine ja maandumine), starditeanalüüs, EO/kasulik koormus (EO: Maa vaatlus)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Esimest järku MODELLED geomeetria kolme käivitatava liigi kaudu: <b><c1/></b> (<c2/>, <b>Allen-Eggersi</b> ballistiline koridor — maksimaalne aeglustus, maksimaalse g ja maksimaalse kuumenemise kiirused, maksimaalse g kõrgus), <b><c3/></b> (<c4/>, kahe keha <b>starditeeazimuut</b> <c5/>, tasandimuutuse Δv, saidi pöörlemise boonus, päevased võimalused) ja <b><c6/></b> (<c7/>, SMAD (Space Mission Analysis and Design) kosmosekolmnurga EO <b>laiuse / GSD (ground sample distance) / ligipääsu / korduskülastuse</b> geomeetria). <b>Ei ole</b> 6-DoF EDL/aerotermilist simulatsiooni, trajektoori optimeerijat ega anduri radiomeetriat/MTF-i (MTF: modulatsiooni ülekandefunktsioon). P3

# text
seg-439bd85c8bbc = Kuu / tsislunaarne PNT (LunaNet)

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: south_pole_hpl_pass
# c6: src/cr3bp.rs
# c7: cr3bp_jacobian
# c8: propagate_state_stm
# c9: differential_correct_halo
# c10: src/lunar_orientation.rs
# c11: moon_pa_de440
# c12: pxform
# c13: tests/lunar_pa_orientation_spice_oracle.rs
# c14: lunar::mci_to_mcmf
# c15: lunar-integrity
# c16: scenarios/lunanet-araim.toml
seg-a7a12eb111fc = <c1/>: <b>Kuu ARAIM</b> mootor, mis taaskasutab Maa poolset MHSS tuuma LunaNet LNIS (LunaNet Interoperability Specification) parameetritega (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), <b>MCI↔MCMF (MCI: Kuu-tsentriline inertsiaalne; MCMF: Kuu-tsentriline, Kuuga seotud) tsislunaarse raami redutseerimine</b> (<c2/> / <c3/>, lihtsustatud keskmise pöörlemise mudel sidereaalsel kiirusel) ja <b>selenograafiline</b> lat/lon/alt (<c4/>) ning <b>lõunapooluse kaitsetaseme läbimine</b> (<c5/>), mis kvantifitseerib terviklikkuse lõhe — { "30" } m kaugusmõõtmisega on HPL lõplik, kuid ületab { "50" } m pinnaoperatsioonide häirepiiri. <c6/> lisab Maa–Kuu <b>CR3BP</b> (ringkujuline piiratud kolme keha probleem) (pöörleva raami dünaamika + RK4 propageerija + Jacobi konstant + viis Lagrange'i punkti, kontrollitud avaldatud L1/L2/L3 väärtuste ja täpse L4/L5 vastu) — kolme keha tuum, mida päris NRHO (near-rectilinear halo orbit) vajab — ning <b>olekuüleminekumaatriksi + ühe laskmise diferentsiaalkorrektori</b> (<c7/>, <c8/>, <c9/>), mis toodab tõeliselt perioodilisi L2 halo/NRHO orbiite: STM on kontrollitud lõplike vahede vastu, korrigeeritud halod sulguvad iseendaga masinatäpsusega (Jacobi-säilitav) ja avaldatud apolune oleku seemendamine reprodutseerib <b>L2 lõunapoolse { "9" }:{ "2" } NRHO</b> (Gateway orbiit) <b>perioodiga ≈ { "6.57" } d</b> ja <b>perilune ≈ { "3,250" } km</b> — kooskõlas avaldatud ≈ { "6.56" } d / ≈ { "3,370" } km | Diferentsiaalkorrigeeritud NRHO ICd (algtingimused) on nüüd ühendatud, kuid <b>korrigeeritud orbiidi denormaliseeritud selenotsentriline (MCI/MCMF) teisendus</b> ja perekonna jätkamine on endiselt jätkutööd; DE440 peatelje Kuu orientatsioon päris füüsikalise libratsiooniga on olemas (<c10/>, PCK-st <c11/>, kontrollitud SPICE <c12/> vastu failis <c13/>), kuid vanem tee <c14/> kasutab endiselt keskmist pöörlemist ilma libratsiooni või pretsesseeruva poolusenita; NRHO on CR3BP (ringkujuline, Päikeseta) lahendus, <b>mitte</b> kontrollitud päris LANS/Gateway (LANS: Lunar Augmented Navigation Service) efemeriidi vastu; käivitatav stsenaariumi liik <c15/> (<c16/>) avab lõunapooluse läbimise CLI-st | selenotsentriline teisendus + perekonna jätkamine + SPICE/LunaNet liides: <b>P3</b>

# text
seg-e3d975b70014 = Süvakosmose / planeetidevaheline PNT (Mars, radiomeetriline)

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
# c3: src/deepspace_od.rs
# c4: clock_state.rs
# c5: mars_atmos.rs
# c6: src/body.rs
# c7: src/mars_frame.rs
# c8: EphemerisProvider
# c9: src/ephem_provider.rs
# c10: mars-pnt
# c11: src/mars_pnt.rs
# c12: src/gse_sim.rs
# c13: xval/anise-mars-od
# c14: from_shadr
# c15: Body::with_gravity_field
seg-584d79a8ba08 = <b>Tarnitud { "v0.17.0" }.</b> Radiomeetriline navigatsioonimootor: iteratiivne valguse aeg + Shapiro viivitus, kahe-/ühe-/kolmesuunaline Doppler ja vahemaa (Moyeri kaks jalga), koherentne transponderi pööre, regeneratiivne/PN (PN: pseudomüra) kaugusmõõtmine (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), päikeseplasma/tropo/iono keskkonnad (<c1/>); <b>CCSDS-TDM ({ "503" })</b> parsimine + väljastamine (<c2/>); <b>vähendatud dünaamikaga SRIF</b> (ruutjuurinformatsiooni filter) RTN (radiaalne, põiki, normaal) empiiriliste kiirendustega + 3-olekulise pardakella + Marsi takistusega (<c3/>, <c4/>, <c5/>), mis teeb <b>Mars-LMO (LMO: madal Marsi orbiit) OD ≈ { "0.2" } m</b> sünteetilises suletud ahelas; ühesuunalise+kahesuunalise liitmine; mitme keha dünaamika tuum (<c6/>, Marsi GMM-3 (GMM: Goddard Mars Model), IAU Marsi raam <c7/>, <c8/> õmblus <c9/>, kaheosaline JD + TT↔TDB (TDB: Barycentric Dynamical Time)); ning <b><c10/></b> releed-PNT stsenaarium (MARCONI areostatsionaarne konstellatsioon, <c11/>) + otsast otsani GSE toimivuse simulaator (<c12/>). <b>Simulatsiooniga kontrollitud</b> (kovariatsiooni/suletud ahela kvaliteedinäitaja); Päikese-tsentriline dünaamika ristkontrollitud JPL (Jet Propulsion Laboratory) DE440 vastu ({ "137" } m @ 1-päevane kaar, <c13/>). <b>Puudu:</b> päris DSN/ESTRACK (ESTRACK: European Space Tracking network) jälgimisandmete kontrollimine; Marsi gravitatsioon oma natiivsel raamil (GMM-3 d/o { "120" } väli laaditakse PDS SHADR tabelist, <c14/>, VALIDATED pyshtools vastu, ja haakub kaudu <c15/>, kuid seda hinnatakse IAU, mitte oma Konopliv-2006 raamis); DE-klassi efemeriid tuumas (kernelipõhiselt piiratud xval-is). P3

# text
seg-00450a6acae0 = Päikesesüsteem ja PNT ümber mis tahes keha

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>Liik <c1/></b>: Päikese, planeetide, Pluuto, Kuu ja seitsme suurema kuu positsioonid, kiirused ja füüsikalised konstandid ühel epohhil, kehade vahelise valguse ajaga; planeetide positsioonid (JPL Standishi elemendid) ja valguse aeg on VALIDATED JPL Horizonsi vastu (<c2/>), kuud, Pluuto ja välisplaneetide tabel jäävad MODELLED. <b>Liik <c3/></b>: orbiiter või maandur ümber mis tahes kataloogitud keha (Mars, Kuu, Europa, Ganymedes, Titan ja ülejäänud), mis navigeerib kohaliku Walkeri konstellatsiooni ühesuunalistel pseudovahemaadel pluss valikulisel kahesuunalisel Maa vahemaal — MODELLED. Tuumas ei ole planeetide efemeriidi kernelit (analüütilised elemendid), releeorbiidid <c4/> kasutavad ainult J2 (täielik Marsi GMM-3 d/o { "120" } ja Kuu GRAIL GL0660B d/o { "660" } väli laaditakse PDS SHADR tabelitest ja haakub objektiga <c5/> propageerija jaoks, <c6/>). P3

# text
seg-433128dbc8a9 = Kampaaniad / missiooni koostamine

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>Liik <c1/></b> (<c2/>): olemasolevad liigid aheldatud ühel jagatud ajajoonel (näiteks segamine, siis spuufimine, siis holdover INS-iga inertsist liikudes, siis terviklikkuse häire, siis taastumine), parameetripühkimised ja algväärtustatud Monte Carlo ansamblid mis tahes liigi üle ning mitu stsenaariumi jagatud tingimustel kombineeritud kokkuvõttega; iga arv loetakse liikmeliigi päris käivitusest. Koostamisidentsused on testitud (<c3/>: ühefaasiline kampaania reprodutseerib iseseisva käivituse baidi baidi haaval); MODELLED. Jaotis <c4/> (võrk või piiratud Nelder–Mead ühe kuni kolme võtme üle, üks mõõdik, minimeeri, maksimeeri või saavuta siht) täidab oma eelregistreeritud kinnise kuju ja toore jõu lävendid (<c5/>); MODELLED, lokaalne otsing ilma globaalse optimumi väiteta ning ilma gradient- või Bayesi meetodita. P3

# text
seg-378c53e44b92 = Aruanded, animatsioon ja väljundid

# text
# c1: result.json
# c2: report.html
# c3: report.json
# c4: tests/advanced_report_cli.rs
# c5: --animate
# c6: src/animation.rs
# c7: ANIMATION.md
# c8: --export
seg-7bd95909787f = Iga käivitus kirjutab <c1/>, graafiku ja aruande (<c2/>, <c3/>), mille sildid loetakse kontrollimaatriksist ja mille salvestatud käsk reprodutseerib tulemuse baidi baidi haaval (<c4/>); <c5/> (svg, html või kaadrid) renderdab aegrea animatsioonina (<c6/>, <a1><c7/></a1>); <c8/> kirjutab koostalitlusvõime reas nimetatud vahetusvormingud. Need on käivituse renderdused, mitte tõendid füüsika kohta.

# text
seg-3c3d3427723f = Ökosüsteem ja valmidus (jälgitud ausalt, mitte koodivõimekus)

# text
seg-5770537524d3 = Valdkond

# text
seg-e0426ffe2628 = Märkus

# text
seg-bdee8089afb0 = Keelesidemed ja pakendamine

# text
# c1: RunOutput
# c2: array
# c3: columns
# c4: series
# c5: ScenarioKind
# c6: ErrorKind
# c7: KindMeta
# c8: run_typed
# c9: RunOutput
# c10: scenario_kinds
# c11: units
seg-89fd1e232849 = Rust + Python (abi3) + WASM kolmes registris. Tüübitud pinnad ({ "0.36" }, CAP-34): Python <c1/> NumPy ligipääsuvahenditega (<c2/>, <c3/>, <c4/>) ja stub-tüübitud <c5/> / <c6/> / <c7/>; JavaScript <c8/> (tüübitud <c9/> objekt) ja <c10/>, sama sõnavaraga TypeScripti deklaratsioonides. Tulemusdokumendid jäävad liigi kaupa JSON-iks, tüübitud ainult oma ühise ümbrisega (<c11/>, versioonid)

# text
seg-e1dee294d0fe = Haridus / sissejuhatuse UX (kasutajakogemus)

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Brauseri mänguväljak <b>juhitud režiimiga on tarnitud</b>: stsenaariumiga kohanduvad juhitud liugurid (<c1/>, kuni kuus nuppu stsenaariumi kohta) ja interaktiivne juhitud tuur (<c2/>, mänguväljakul uuesti esitatav). Iga käivitus saab ka lihtsas keeles <b>tähenduse</b> lause ja selle põhiarvud, loetud tulemusdokumendist (<c3/>, liigi kaupa mallidega failis <c4/>; liik, millel malli ei ole, saab oma esimese peaarvu lihtsalt öeldud). Puudu: arvu kaupa juhitud selgitused lisaks sellele lausele (lihtsas keeles <a1><c5/></a1> katab need)

# text
seg-becc4cd71f4c = Kogukond / juhtimine

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Juhtimise karkass olemas — <c1/> (heatahtliku hoidja mudel + tehniline lävi + avatud/suletud piir), <c2/>, <c3/>, <c4/>, probleemi/PR (PR: tõmbepäring) mallid, <c5/>, dependabot. Üksikasutaja asutaja; <b>aktiivne väline kogukond</b> (panustajad, tsiteerimised) sõltub inimestest/ajast ja alles kasvab (kontaktid ootavad ülevaatust)

# text
seg-5e222a61a61e = Rahastuse ja hanke valmidus

# text
seg-fdbb9db68f1d = puudub

# text
seg-86709f7f67c0 = TRL ~{ "3" }; agentuuride tsitaate/lepinguid veel ei ole (vt strateegiamärkmeid)

# text
# c1: kshana kinds --json
# c2: holdover-test
# c3: gnss-ssv
# c4: lunar-infrastructure
# c5: optical-atmosphere
# c6: acm-link
# c7: aocs
# c8: ascent-losses
# c9: contact-schedule
# c10: entry-heating
# c11: eo-radiometry
# c12: lunar-station-coverage
# c13: time-transfer-budget
# c14: src/holdover.rs
# c15: QuantumNavBudget
# c16: CodeFamily
# c17: src/verification.rs
seg-a887cfc920f6 = Uuendatud 2026-10-22 mootori { $version } jaoks ({ "87" } stsenaariumi liiki, allikast <c1/>; versioonis { $version } uut liiki ei ole). 2026-10-19: mootor { "0.38.0" }, { "87" } liiki (uued versioonis { "0.38.0" }: <c2/>, <c3/> ja <c4/>). 2026-10-18: { "84" } liiki (uus versioonis { "0.37" }: <c5/>). 2026-10-16: { "83" } liiki (uued versioonis { "0.36" }: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> ja <c13/>). 2026-10-10: mootor { "0.35.0" }, { "75" } liiki, uusi liiki ei ole. 2026-10-09 ja 2026-10-08: eelmised redaktsioonid. 2026-10-04: Nav-signaali rida märgib versiooni { "0.31.0" } IQ kihti. 2026-09-29: lisatud LEO-PNT, spektri, päikesesüsteemi / mis tahes keha PNT, kampaania ja väljundite read. Varem: joondatud 2026-06-02 suure auditi 27-realise võimekusmaatriksiga; süvakosmose / Marsi PNT rida lisati versioonis { "v0.17.0" }. Kvant-PNT täiendused (GNSS-ita kella holdover <c14/>, koostatud kvant-inertsiaalse dead-reckoning-i eelarve <c15/>, kaugusmõõtmise koodi kavandi kompromiss <c16/>, masinkontrollitud kontrollimaatriks <c17/>) on voldutud ridadesse Ajastus, Kvant-PNT anduri, Nav-signaali ja V&V — igaüks sildistatud kontrollituks-või-modelleerituks vastavalt oma tegelikule sõltumatule etalonile.

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = FutureNAV demonstraatori täiendused (modelleeritud, sisemiselt ristkontrollitud — <b>mitte</b> väliselt kontrollitud): ({ "1" }) <b>Masinõppega RF-häirete tuvastamise hindamise testistend</b> <c1/> — sildistatud <b>sünteetiline</b> (parameetritel põhinev, mitte IQ) häirekorpus + detektorist sõltumatu ROC/AUC/segadusmaatriksi/Pfa-Pmd (ROC: vastuvõtja töökarakteristik; AUC: kõvera alune pindala) raamistik lekkekaitse ja kihilise jaotusega; komplekteeritud detektorid on läbipaistvad avaldatud meetodi lähtetasemed, mitte SOTA (state of the art), ja kõrge AUC siin demonstreerib konveierit, mitte välitoimivust. ({ "2" }) <b>Kvant- ja klassikalise PNT kompromissimootor</b> <c2/> — mõõdetud ADEV sissevõtt (NNLS (mittenegatiivsed vähimruudud) sobitus <c3/>, edasi-tagasi kontrollitud vastu <c4/>), aja/inertsiaalse holdover-i kasutegurite tabel, mis kannab põranda eelduse hoiatust artefaktil, ja GNSS-ita vastupidavuse-vs-aja ümbrik; see <b>kvantifitseerib</b> partneri kvantkasu, mitte kunagi ei kontrolli seadet. Mõlemad vastandlikult ülevaadatud (τ²→τ³ triivibaasi viga ja vale „piiramatult piiratud“ vastupidavuse väide tabati ja parandati). { "911" } teegi testi selle täienduse ajal, fmt+clippy puhas.

# text
# c1: src/interchange.rs
# c2: Envelope
# c3: format
# c4: SCHEMA_VERSION
# c5: engine_version
# c6: compatibility()
# c7: Envelope::parse
# c8: wrap
# c9: to_json
# c10: parse
# c11: payload_as::<T>()
# c12: Deserialize
# c13: SCHEMA.md
seg-deb7124d3c70 = Vahetus- / standardvormingu täiendus (<c1/>): <b>Kshana Interchange Format (KIF)</b> — neutraalne, versioonitud, ise-kirjeldav <c2/>, mis ümbritseb mis tahes artefakti (stsenaarium, tulemus, kompromissiuuring) äratuntava <c3/> sildiga, ühe tõeallikaga <c4/> (skeemi versioon, mida varem kopeeriti literaalina { "15" } kohta, on nüüd ühes konstandis, millele kogu kast viitab), tootva <c5/> ja selgesõnalise, testitud ühilduvuslepinguga (<c6/>: sama suurversioon / võrdne või vanem alamversioon on loetav additiivse välja distsipliini all; uuem alamversioon või erinev suurversioon lükatakse piiril tagasi <c7/> poolt, mitte ei parsita vaikselt valesti). Edasi-tagasi teisendatav (<c8/>→<c9/>→<c10/>→<c11/>) mis tahes <c12/> kasuliku koormuse jaoks; teadlikult <b>ajatempliga vaba</b>, et säilitada Kshana bitthaaval reprodutseeritavust. Dokumenteeritud failis <a1><c13/></a1>, nii et vorming on <b>tsiteeritav</b>, mitte ainult väljastatud — avatud tuuma „standard ootel“ positsioneerimine. { "923" } teegi testi selle täienduse ajal, fmt+clippy puhas.

# text
# c1: src/frugal.rs
# c2: walker
# c3: src/integrity_impact.rs
# c4: classify_stanford
# c5: src/verification.rs
# c6: VERIFICATION-MATRIX.md
# c7: src/impairment_eval.rs
# c8: stratified_split
# c9: Split::has_leakage
seg-adc959257e0b = FutureNAV domineerimisversiooni täiendused (modelleeritud, sisemiselt ristkontrollitud — <b>mitte</b> väliselt kontrollitud): ({ "1" }) <b>Säästlik kulu-katvuse kohta / ROI (investeeringutasuvus) kiht</b> <c1/> — kasuraamistamise kiht konstellatsiooni mõõtmise mootori kohal (<c2/>), mis esitab kulu katvuse protsendipunkti kohta ja katvuse-euro-kohta ROI võrreldes lähtetasemega; satelliidi kulu on <b>kutsuja antud, allikaga madala/nominaalse/kõrge vahemik</b> (väljamõeldud punkthindu ei ole), nii et väljundid on vahemikud, mitte näiv täpsus; modelleeritud katvuse arvu modelleeritud majanduslik raamistus, mitte hinnapakkumine. ({ "2" }) <b>Tuvastamata jäämise terviklikkusmõju kaardistus</b> <c3/> — kaardistab tuvastamata spuufimisest/segamisest põhjustatud asukohanihke selle efektiivsele veale → Stanfordi piirkond (kättesaadav / süsteem kättesaamatu / eksitav / ohtlikult eksitav) <b>kontekstispetsiifiliste häirepiiride</b> (lagedal taevas vs linn, HAL vs VAL) vastu, komponeerides välisankruga RAIM <c4/>; tuvastamata jäämise→häirepiiri sild on modelleeritud, mitte sertifitseeritud terviklikkuse jaotus. Mõlemad on kaardistatud masinkontrollitud kontrollimaatriksisse (<c5/>, invariant Kontrollitud⇒ExternalDataset puutumata; elav ridade arv on faili <a1><c6/></a1> genereeritud päises). Ristvalideerimise / lekkekaitse / parameetrite järgi kihistatud jaotus tehisintellekti hindamise raamistiku jaoks tarniti juba failis <c7/> (<c8/>, <c9/>). { "951" } teegi testi selle täienduse ajal, fmt+clippy puhas.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = FutureNAV optimismilõhe uuringu täiendused (modelleeritud, sisemiselt ristkontrollitud kinniste kujude vastu — <b>mitte</b> väliselt kontrollitud, <b>mitte</b> simulatsioonist-välja väide): kontrollitud <b>sünteetiline</b> uuring RF-häirete detektorite jaotusesisese→jaotusevälise AUC <b>optimismilõhe</b> kohta. ({ "1" }) <b>Õppivad detektorid</b> <c1/> — fikseeritud tunnuskaart + treeninguga sobitatud standardiseerija, logistilise regressiooni lähtetase (deterministlik täispartii gradientlaskumine) ja ühe peidetud kihiga <b>MLP</b> (mitmekihiline pertseptron; algväärtustatud tagasilevi SGD (stohhastiline gradientlaskumine)) sama <c2/> tunnuse (trait) taga, mida kasutavad avaldatud meetodi lähtetasemed. ({ "2" }) <b>Käsitsi tuletatud statistika</b> <c3/> — protsentiili-bootstrapi usaldusvahemikud (CI), <b>DeLongi</b> AUC dispersioon/CI, <b>Spearmani</b> ρ ja <b>ridge</b> regressioon, igaüks kontrollitud kinnise kuju vastu (binormaalne AUC Φ(d′/√{ "2" }), käsitsi arvutatud DeLongi dispersioon, õpikuline seotud astmete ρ, täpne OLS (harilikud vähimruudud) taastamine). ({ "3" }) <b>Uuring</b> <c4/> — klassi kaupa AUC, <c5/> kaupa skaleerimisseaduse trend (lõhe vs { "1" }−tõsidus) ja <b>ainult ID ridge lõhe ennustaja</b>, mis hindab optimismilõhe ainult jaotusesisestest diagnostikatest, hinnatud <b>jäta-üks-detektor-välja</b> ja <b>jäta-üks-klass-välja</b> meetodil keskmise ennustamise lähtetaseme vastu. Ühe käsuga artefakt kaudu <c6/>. Iga arv on AUC mudelist tuletatud siltide üle sünteetilisel, parameetritel põhineval korpusel; lõhe on sünteetiline→sünteetiline tõsiduse nihe, mitte kunagi välituvastuse tulemus. Kaardistatud masinkontrollitud kontrollimaatriksisse (<c7/>, invariant Kontrollitud⇒ExternalDataset puutumata).

# text
seg-441b67566d5a = <s1>Eelmine</s1>Reprodutseeritavus

# text
seg-861984989d07 = <s1>Järgmine</s1>Standardid ja koostalitlusvõime
