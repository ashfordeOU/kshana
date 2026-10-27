# docs--kind-lunar-time-offset: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-4d208b6c0eb8 = päev

# text
# c1: docs/kinds/by-kind/lunar-time-offset.md
seg-64813e3da228 = Allikas: <c1/>

# text
# c1: lunar-time-offset
seg-000bb13909f1 = <c1/> (stsenaariumi liik)

# text
seg-7f3e13712f10 = Modelleeritud relativistlik Maa–Kuu kellakiirus (Kuu koordinaataeg, LTC/TCL): sekulaarne LTC−TT kiirus omapotentsiaali erinevusest ja Kuu kineetilisest liikmest, esitatud avaldatud { "56" }–{ "59" } µs/päevas vööndiga, pluss kogunenud nihe üle horisondi.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Ühe <c1/> käivituse kokkuvõte: lunar-time-offset | sekulaarne LTC−TT kiirus { "57.04" } µs/päevas (vöönd { "56" }–{ "59" }) | omapotentsiaal { "57.50" } kineetiline -0.46 | nihe @ { "1.00" } p = { "57.04" } µs

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-9367773c4889 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/lunar-time-offset.toml
seg-4731141e6aac = Näide <c1/> määrab muu hulgas:

# text
seg-3843825d0733 = us

# attr:alt
seg-e9deb6ed41c1 = Mootori joonistatud diagramm failile scenarios/lunar-time-offset.toml, liik lunar-time-offset

# text
seg-982426693747 = <b>VALIDATED</b> Relativistlik Maa-Kuu kellakiirus (LTC/TCL) + TT/TAI/UTC aheldamine + ansambel. Sõltumatu etalon (ExternalDataset): Ashby & Patla { "2024" }, „A Relativistic Framework to Estimate Clock Rates on the Moon“, Astronomical Journal { "167" }:{ "149" } (NIST; IAU/IAG LunaNet LTC alus): Kuu pinna omapotentsiaal L_m = { "3.13881e-11" } ja sekulaarne kogu { "56.02" } µs/päevas ühtivad avaldatud arvväärtustena; geotsentriline Kuu kiirus ristkontrollitud JPL DE440 vastu (de440s.bsp SPICE kaudu)

# text
seg-96b65f604cc2 = Ausus: MODELLED, mitte sertifitseeritud. Peamine us/päevas arv sõltub etalonist (Maa geoid W0 vs Kuu selenoid, ajakeskmistamise aken, tähelepanuta jäetud alla-us/päevas tsentrifugaal-/J2 paranded) -> aus väljund on vöönd, mitte üks arv. Midagi siin ei ole valideeritud alla nanosekundilise absoluutse täpsuseni ega sertifitseeritud operatiivseks ajahoidmiseks. Aruanne annab ka kogunenud LTC-TT nihke üle horisondi (stsenaariumifaili kommentaar, read { "11" } kuni { "16" })

# text
seg-e4552368a6a7 = <s1>Eelmine</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Järgmine</s1>lunar-vlbi-fim
