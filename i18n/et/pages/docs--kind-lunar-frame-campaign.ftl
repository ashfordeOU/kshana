# docs--kind-lunar-frame-campaign: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-3319b18ac61f = ja veel { "1" } maatriksis.

# text
# c1: docs/kinds/by-kind/lunar-frame-campaign.md
seg-dd57b833cb20 = Allikas: <c1/>

# text
# c1: lunar-frame-campaign
seg-120769aba2cc = <c1/> (stsenaariumi liik)

# text
seg-55679aff66db = Seitsmeparameetriline Helmerti (sarnasus-) tugisüsteemi datum, mida juhib SIMULEERITUD VAATLUSKAMPAANIA, mitte süstitud teisendus. Maajaamade võrk vaatleb Kuu pinna majakate kataloogi selgesõnalise ajakava järgi; Kuu-VLBI viivituse osatuletised koondatakse selle ajakava üle majakakoordinaatide Fisheri informatsioonimaatriksiks täpselt nagu lunar-vlbi-fim; ja see informatsioon levitatakse läbi Helmerti kavandi A = [I3 | [p]_x | p] kataloogipunktides datumi kovariatsiooniks H = A^T M_b A, mida diagnoosib crate::fim::crlb. ÜHTEGI teisendust ei süstita ja midagi ei taastata istutatud vastusest, nii et esitatud datumi täpsus tuleneb vaatlusprogrammist: viivituse sigma poolitamine poolitab selle täpselt ja kaare pikendamine parandab seda, sest libratsioon, mida aruanne MÕÕDAB (sub_earth_direction_sweep_deg), on see, mis eraldab vaatejoone suunalise majakakoordinaadi taevatasandi omadest. Auaste, datumi defekt, tingimuslikkuse arv, täielik spekter, mittevaadeldavad suunad SEITSMEPARAMEETRILISES BAASIS, nõrgim suund isegi täisastmel ja iga parameetri osa sellest väljastatakse igal käivitusel; parameeter, mida kampaania ei piira, avaldatakse väärtusega NULL ja olekuga, mitte kunagi ei loeta seda peaaegu singulaarsest pöördmaatriksist. Majakavigade korrelatsioon on mõõdetud, mitte eeldatud: kui jaamad on fikseeritud, ei puuduta ükski vaatlus kahte majakat, nii et informatsioonimaatriks on täpselt plokkdiagonaalne (offblock_fraction { "0" }), ja kui jaamu hinnatakse, on Schuri marginaliseeritud plokk seotud, esilekutsutud korrelatsioon trükitakse ja kogu levitamine käivitatakse uuesti selle kõrvaldamisega, nii et sõltumatuse eelduse hind on arv. Sama levitamine isotroopse koordinaadipõhise sigma all ja taastamisviga, mida aruandleb stsenaarium lunar-frame-realisation, käivitatakse mõlemad siin ja trükitakse kampaania väärtuse kõrvale koos nende suhetega. MODELLED: majakate kataloog on allikaga, kuid KAMPAANIA on simuleeritud — jaamavõrk ja viivituse sigma on illustratiivsed sisendid, üksikuid viivitusvaatlusi käsitletakse sõltumatutena ning Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD, nii et datumi kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks. Mitte geodeetiline toode.

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-2e02c1ff8f48 = Ühe <c1/> käivituse kokkuvõte: lunar-frame-campaign | { "4" } majakat x { "3" } baseline-i x { "49" } epohhi = { "64" } vaatlust (viivituse sigma { "1.000e-11" } s) | jaamade datum fikseeritud | Helmerti auaste 7/7 cond { "3.798e5" } | datumi translatsiooni sigma { "6.397500" } m vs süstitud teisenduse taastamisviga { "0.3125" } m (suhe { "0.049" })

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
seg-9c5feacf15ce = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-1d70a5b4a197 = Näide <c1/> määrab muu hulgas:

# text
seg-df90e5910fb4 = h

# text
seg-d9523213de9f = Tulemuse silt (mootori oma): MODELLED kampaaniapõhine Kuu tugisüsteemi datum. Seitsmeparameetriline Helmerti kovariatsioon levitatakse majakakoordinaatide informatsioonimaatriksist, mis on koondatud mootori enda Kuu-VLBI viivituse osatuletistest majakate, baseline-ide ja epohhide selgesõnalise ajakava üle; ÜHTEGI sarnasusteisendust ei süstita ja

# attr:alt
seg-883d94b321b4 = Mootori joonistatud diagramm failile scenarios/lunar-frame-campaign.toml, liik lunar-frame-campaign

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-2595bd629ffb = <b>MODELLED</b> Seitsmeparameetriline Helmerti datum, mis on levitatud SIMULEERITUD VAATLUSKAMPAANIAST, mitte taastatud süstitud teisendusest.

# text
seg-fd34d760edb1 = <b>VALIDATED</b> Seitsmeparameetriline Helmerti datumi kovariatsioon, mille kaks simuleeritud sisendit on asendatud mõõdetutega: ajakava on { "337" } arhiveeritud ILRS Kuu laserulatuse normaalpunkti maapealse edastuse epohhid (2015-04-08 kuni 2015-06-27, Grasse MeO { "7" } Testid: <a1>lunar_llr_real_data.rs</a1>.

# text
seg-055864084843 = <b>MODELLED</b> Valikulised sisendid extra_reflectors ja extra_beacons stsenaariumil lunar-llr-datum lisavad ploki station_geodesy: arhiveeritud Kuu laserulatuse lõigu viiemassiivi Helmerti informatsioon pluss informatsioon, mille lisab lisatud retroreflektor (ran Testid: <a1>lunar_station_geodesy.rs</a1>.

# text
seg-23bd763c32d8 = <b>VALIDATED</b> Stsenaariumi lunar-frame-campaign seitsmeparameetriline Helmerti datumi kovariatsioon hinnatud maajaamadega (jaam { "1" } ankurdatud), nagu lunar_frame_campaign seda arvutab binary64-s: ühine jaama ja majaka Fisheri informatsioon koondatud Testid: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

# text
seg-49f323360dc3 = <b>VALIDATED</b> 7-parameetriline Helmerti datumi sobitus + ICRF orientatsiooniside punktivõrgust. Oraakel (sõltumatu etalon) (ExternalDataset): Sõltumatu suletud kujul kaalutud Umeyama (Horn) sarnasusteisenduse lahendaja (numpy/scipy SVD-põhine; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — kshana iteratiivsest Gaussi–Newtoni sobitusest erinev algoritm, mis jõuab samale üheselt määratletud kaalutud vähimruutude optimumile baidiidentsetel punktivõrkudel

# text
seg-d024abcfd87c = <b>MODELLED</b> Seitsmeparameetriline Helmerti datum, mis on levitatud SIMULEERITUD VAATLUSKAMPAANIAST, mitte taastatud süstitud teisendusest. Maajaamad vaatlevad allikaga. Oraakel (sõltumatu etalon) (ReferenceImpl): Suletud kujuga samasused ja sõltumatu hoidlasisene tee, välist sõltumatut etaloni ei väideta. Helmerti kavand — ainus uus tuletis moodulis — tuletatakse uuesti lunar_frame_realise::apply_helmert tsentraalse lõpliku erinevusega, tee, mis ei jaga analüütilise kujuga ühtegi avaldist. Koondamine, mida see koostab, on lunar-vlbi-fim oma, mille Jacobi maatriks on lõplike erinevustega võrreldud lunar_vlbi::vlbi_delay_s vastu seal, ja kes

# text
# c1: label
seg-0abd7b181f21 = MODELLED kampaaniapõhine Kuu tugisüsteemi datum. Seitsmeparameetriline Helmerti kovariatsioon levitatakse majakakoordinaatide informatsioonimaatriksist, mis on koondatud mootori enda Kuu-VLBI viivituse osatuletistest majakate, baseline-ide ja epohhide selgesõnalise ajakava üle; ÜHTEGI sarnasusteisendust ei süstita ja midagi ei taastata istutatud vastusest. Majakate kataloog on crate allikaga nimetatud kohtade tabel, kuid KAMPAA (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-f92d22c06cd5 = Majakavigade korrelatsioon on mõõdetud, mitte eeldatud: kui jaamad on fikseeritud, ei puuduta ükski vaatlus kahte majakat, nii et informatsioonimaatriks on täpselt plokkdiagonaalne (offblock_fraction { "0" }), ja kui jaamu hinnatakse, on Schuri marginaliseeritud plokk seotud, esilekutsutud korrelatsioon trükitakse ja kogu levitamine käivitatakse uuesti selle kõrvaldamisega, nii et sõltumatuse eelduse hind on arv. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-534cea416496 = MODELLED: majakate kataloog on allikaga, kuid KAMPAANIA on simuleeritud — jaamavõrk ja viivituse sigma on illustratiivsed sisendid, üksikuid viivitusvaatlusi käsitletakse sõltumatutena ning Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD, nii et datumi kovariatsioon on Cramer-Rao piir vähendatud parameetrikomplekti jaoks. (liikide kataloog (<c1/>))

# text
seg-ec67b9d3adbb = Majakavigade korrelatsioon on MEASURED, mitte eeldatud. Kui jaamad on fikseeritud, ei puuduta ükski vaatlus kahte majakat, nii et informatsioonimaatriks on täpselt plokkdiagonaalne (offblock_fraction { "0" }); kui jaamu hinnatakse, on Schuri marginaliseeritud plokk seotud, esilekutsutud korrelatsioon trükitakse ja kogu levitamine käivitatakse uuesti selle kõrvaldamisega, nii et sõltumatuse eelduse hind on arv, mitte c (stsenaariumifaili kommentaar, read { "17" } kuni { "21" })

# text
seg-a2bb557da7ba = MODELLED: majakate kataloog on allikaga, kuid KAMPAANIA on simuleeritud — jaamavõrk ja viivituse sigma on illustratiivsed sisendid, üksikuid viivitusvaatlusi käsitletakse sõltumatutena ning Kuu keskpunkti efemeriid, jaamakellad, troposfäär ja Maa orientatsiooni parameetrid on hoitud FIKSEERITUD. Mitte geodeetiline toode. (stsenaariumifaili kommentaar, read { "27" } kuni { "30" })

# text
seg-57a371bca2c7 = Kuu tugisüsteemi datum vaatluskampaaniast on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-7b56c979b2c9 = <s1>Eelmine</s1>lunar-differential-pnt

# text
seg-70072dbfa305 = <s1>Järgmine</s1>lunar-frame-realisation
