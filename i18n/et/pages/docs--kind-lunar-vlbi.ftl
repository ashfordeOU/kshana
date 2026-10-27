# docs--kind-lunar-vlbi: translations (et)

# text
seg-c1ce24cd6008 = analüütiline

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-df90e5910fb4 = h

# text
seg-3843825d0733 = us

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Viivituse osatuletised koondatud baseline-ide × epohhide ajakava üle Fisheri informatsioonimaatriksiks, pööratud jaamakoordinaatide kovariatsiooniks ja koordinaadipõhiseks jaamasigmaks, asendades eeldatud isotroopse võrdjaotuslingi a

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Kolmas datumi valik, <c1/>, mis hoiab iga Maa jaama paigal ja hindab ainult MAJAKA Kuuga fikseeritud koordinaate — konfiguratsioon, mille jaoks Kuu pinnapunkti määramatust tegelikult esitatakse, kuna Maa jaama koordinaat

# text
# c1: docs/kinds/by-kind/lunar-vlbi.md
seg-afeb6e26c5ad = Allikas: <c1/>

# text
# c1: lunar-vlbi
seg-6d1a32afd780 = <c1/> (stsenaariumi liik)

# text
seg-e01f77d493a0 = Modelleeritud Kuu geodeetiline VLBI viivituse vaadeldav: Maa baseline (kaks maajaama, GCRS) vaatleb ühesuunalist signaali NovaMoon-klassi Kuu pinnamajakalt. Väljastab lähivälja kahe vahemaa erinevuse viivituse, selle kiiruse ja lainefrondi kõveruse lähivälja parandi üle läbilennu — ristkontrollitud sama koodibaasi tasalaine Δ-DOR vaadeldava vastu kaugvälja piiris, lõplike erinevustega kontrollitud osatuletistega. Vaikimisi analüütiline tee on MODELLED ja kannab tugisüsteemi kooskõla, xp=yp={ "0" } poolusliikumise ning tasalaine-vs-lähiväli hoiatusi. Seadistades planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path, käivitub selle asemel tuumatee (DE440, MOON_PA_DE440, ITRF93; koondunud barütsentrilised valgusajad; lisab epohhi majaka ja jaama osatuletised), mille Newtoni viivitus ja osatuletised ühtivad NAIF SPICE koondunud valgusaegadega täpsusega { "0.06" } ps ja { "7.4e-9" }. Ei ole valideeritud päris VLBI andmete vastu.

# text
# c1: scenarios/lunar-vlbi.toml
seg-92227c085867 = Ühe <c1/> käivituse kokkuvõte: lunar-vlbi | baseline { "10727" } km | majaka ulatus { "402900" } km | viivitus -10049.126 µs (kiirus { "1.312e-6" } s/s) | lähiväli { "58.9" } µs | { "13" } valimit { "6.0" } h jooksul

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
seg-1a38a07a0d70 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

# text
# c1: scenarios/lunar-vlbi.toml
seg-11450a55fc9d = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-07d97fc1abac = Mootori joonistatud diagramm failile scenarios/lunar-vlbi.toml, liik lunar-vlbi

# text
seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-61f431e422e5 = <b>MODELLED</b> Lähivälja VLBI viivitus Maa baseline-ile, mis vaatleb Kuu majakat + osatuletised

# text
seg-7342b50d34e4 = <b>VALIDATED</b> Lähivälja VLBI viivitus Maa baseline-ile, mis vaatleb Kuu majakat, majaka ja jaama osatuletistega, tuumateel (lunar_vlbi::KernelGeometry): DE440 Maa ja Kuu, DE440 Kuu peatelgedega, ITRF93 Maa orientatsioon koos UT1 ja Testid: <a1>naif_kernel_reader_check.rs</a1>.

# text
seg-5547f1f662d3 = ja veel { "2" } maatriksis.

# text
seg-1461c84350d8 = <b>MODELLED</b> Lähivälja VLBI viivitus Maa baseline-ile, mis vaatleb Kuu majakat + osatuletised. Sõltumatu etalon (ReferenceImpl): Tasalaine delta_dor (sama koodibaas) kaugvälja piiris; lõplike erinevustega osatuletised. { "0.30" } väline võrdlus, leid (jääb MODELLED): ANISE { "0.10" } koondunud valgusaegade vastu läbi DE440 ({ "75" } viivitust kuupäeval 2024-01-01 kolme DSN baseline-i üle, genereeritud xval/anise-lunar-od abil ilma Kshana koodita), ükski viivitus ei jää { "1" } ps tolerantsi piiresse. Suurim vahe on { "24" } µs, analüütilisest Kuu keskpunktist (umbes { "200" } km DE

# text
# c1: kshana kinds --json
seg-b41c162b015f = Vaikimisi analüütiline tee on MODELLED ja kannab tugisüsteemi kooskõla, xp=yp={ "0" } poolusliikumise ning tasalaine-vs-lähiväli hoiatusi. (liikide kataloog (<c1/>))

# text
seg-0beac99bb095 = Ausus: MODELLED, MITTE valideeritud päris VLBI andmete vastu. Poolusliikumine jäetakse välja (xp = yp = { "0" }), nii et jaamade inertsiaalasukohad kannavad mõnemeetrist tugisüsteemi viga; majakas segab kuupäeva keskmise ekvaatoriga Kuu rida ICRF kehaga fikseeritud nihkega (jd_tdb ~ jd_tt), tugisüsteemi kooskõla lahknevus allpool mudeli täpsust; ei ole valgusaja iteratsiooni, keskkonda ega aberratsiooni peale diferentseeritud Shapiro. Ei väideta TRL-i, lennupärandit ega agentuuri (stsenaariumifaili kommentaar, read { "17" } kuni { "21" })

# text
seg-58b64e5ff3db = Kuu geodeetiline VLBI on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-04089c4d6fbe = <s1>Eelmine</s1>lunar-vlbi-fim

# text
seg-6adcdfbaa8be = <s1>Järgmine</s1>mars-pnt
