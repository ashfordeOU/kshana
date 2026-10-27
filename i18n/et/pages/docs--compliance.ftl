# docs--compliance: translations (et)

# text
seg-f65b1f2b4182 = Režiim

# text
# c1: docs/COMPLIANCE.md
seg-e19db3d5273b = Allikas: <c1/>

# text
seg-045b24defdbb = DO-316 / DO-229E terviklikkuse compliance-kaart

# text
seg-9100800daa1c = See dokument seob RTCA (varem Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satelliidipõhine täiendussüsteem) MOPS (minimaalsed töötoimivusstandardid)) ja <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System) õhusõiduki seadmed) kaitsetaseme ja terviklikkuse seire nõuded Kshana funktsioonidega, mis neid realiseerivad. See on <b>inseneeriline jälgitavuse abivahend</b>, mitte väide, et ükski nõue on täidetud — Kshana realiseerib avaldatud algoritme; see ei ole heakskiidetud avioonika.

# text
# c1: sbas::do316_compliance_map
# c2: docs/ARAIM_REFERENCE.md
seg-0e6ec5617eb5 = Masinloetav vorm on <a1><c1/></a1>; see proosa on selle kaaslane (peegeldab <a2><c2/></a2>).

# text
seg-d5d7a2ec9c73 = Kaalutud vähimruutude kaitsetasemed (DO-229E lisa J)

# text
# c1: Elᵢ
# c2: Azᵢ
seg-0dc19f403f5e = Iga satelliidi <em>i</em> kohta kõrgusega <c1/> ja asimuudiga <c2/> kasutaja juures on kohaliku taseme (ENU (ida-põhi-üles) + kell) vaatlusrida

# text
# c1: wᵢ = 1/σᵢ²
# c2: σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²
# c3: D = (GᵀWG)⁻¹
seg-6415f7f28e7e = kaaluga <c1/>, <c2/> (UDRE (kasutaja diferentsiaalse vahemaa viga) / GIVE (võrgu ionosfääri vertikaalviga) / õhusõiduki / troposfääri eelarve). Asukoha kovariatsioon on <c3/>; selle ENU plokk annab horisontaalsed ja vertikaalsed kaitsetasemed (HPL, VPL):

# text
# c1: D
# c2: orbit::invert4
# c3: D[2][2]
# c4: Σᵢ S_{U,i}²·σᵢ²
# c5: inv(GᵀG)
seg-ea574448bda4 = Kshana arvutab <c1/> pööramisega { "4" }×{ "4" } normaalmaatriksit sama rutiiniga, mida kasutab RAIM (vastuvõtja autonoomne terviklikkuse seire) pinu (<c2/>), ning valideerib tulemuse kahel viisil (kovariatsiooniteel <c3/> ja projektsiooniteel <c4/> peavad ühtima) pluss sõltumatu numpy <c5/> etalongeomeetria vastu.

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-268ae5b25684 = Marsruudil → NPA (mittetäppislähenemine; ainult horisontaalne)

# text
# c1: √(−2·ln 5e-9)
seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

# text
seg-dbae96c75a06 = Täppislähenemine

# text
seg-1bfafdcf6ab0 = DO-229E MOPS

# text
# c1: 6.0
# c2: Φ⁻¹(1 − 1e-9/2)
# c3: 6.109
# c4: K_V = Φ⁻¹(1 − 1e-7/2) = 5.327
# c5: raim::normal_quantile
seg-1922c53b8340 = Aususe märkus: MOPS kasutab ümardatud horisontaalset konstanti <c1/>; täpne kahepoolne normaalkvantiil <c2/> on <c3/>. Kshana kasutab koodis avaldatud { "6.0" } ja tuletab <c4/> samast <c5/>-st, mida RAIM pinu kasutab, mis on mitteringlik ristkontroll (väärtus ümardub MOPS-i { "5.33" }-ks).

# text
seg-ef191c1d3db1 = L1/L5 kahesageduslik ionosfäärivaba kombinatsioon (IS-GPS-705)

# text
# c1: f₁ = 1575.42 MHz
# c2: f₅ = 1176.45 MHz
# c3: γ₁₅ = (f₁/f₅)² = 1.79327
seg-b69825ef05d3 = Kui <c1/>, <c2/>, <c3/>:

# text
# c1: 40.3·10¹⁶·TEC/f²
# c2: timetransfer_adv::iono_delay_m
# c3: √(c₁² + c₅²) = 2.588
seg-ce81c6b71738 = Esimest järku ionosfääri viivitus (<c1/>) tühistub täpselt — kontrollitud mootori sõltumatu <c2/> füüsika vastu TEC (elektronide koguhulk) vahemiku jaoks. Müra võimendus võrdse dispersiooniga sisendite puhul on <c3/>.

# text
# c1: γ₁₅
# c2: inv(GᵀG)
# c3: sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry
seg-e111fb05a7c6 = <b>Hoidlas, automatiseeritud</b> (iga commit): K-tegurid oma jaotuslike definitsioonide vastu, <c1/> ja ionosfäärivabad (IF) koefitsiendid IS-GPS-705 (IS: Interface Specification) sageduste vastu, esimest järku iono tühistumine sõltumatu viivitusfüüsika vastu ning kaalutud vähimruutude (WLS) kaitsetasemed numpy <c2/> etalongeomeetria vastu (<c3/>).

# text
# c1: tests/sbas_reference.rs
# c2: sbas_protection_level
# c3: waasprotlevels()
# c4: zsiki/rtklib_ws
# c5: d_U
# c6: core/filter.c
seg-f30d84abe275 = <b>Väline oraakel (sõltumatu etalon), automatiseeritud</b> (<c1/>): iga satelliidi kõrguse, asimuudi ja kogu 1-σ korral taastoodab <c2/> sõltumatu realisatsiooni HPL-i, <c3/> RTKLIB (avatud lähtekoodiga reaalajas kinemaatilise positsioneerimise teek) SBAS-i kaitsetaseme harus <c4/> (Siki & Takács { "2017" }), kuuel epohhil, mille see tööriist arvutas <b>tegelikest EGNOS (European Geostationary Navigation Overlay Service)</b> leviedastatud sõnumitest (geostatsionaarne PRN (pseudojuhuslik koodi number) { "120" }) ja tegelikest RINEX (Receiver Independent Exchange Format) vaatlustest Budapesti BUTE jaamast (2017-02-19), täpsusega <b>< { "2e-3" } m</b>. Oraakel ümardab K_V väärtuseks { "5.33" }, seega võrreldakse vertikaali K-teguriväliselt, kui <c5/> vastu selle VPL / { "5.33" }. ESA (European Space Agency) gLAB { "v6.0.0" } (<c6/>) kasutab sama valemit.

# text
seg-389e8a57e3e8 = <b>Tegemata</b>: satelliidipõhine σ on oraakli enda; σ modelleerimine toorsõnumitest UDRE/GIVE jääb ulatusest välja ning ühtegi ametlikku avaldatud WAAS (Wide Area Augmentation System) või EGNOS kaitsetaseme toodet ei ole lõpust lõpuni taastoodetud. DO-229E/DO-316 ise on RTCA tasulised; avatud tuletuse allikas on ESA Navipedia ICAO/EGNOS (ICAO: International Civil Aviation Organization) SBAS-i lehed.

# text
seg-7686fb3d3e0c = <s1>Eelmine</s1>ARAIM etalon

# text
seg-0457ef382fb0 = <s1>Järgmine</s1>Vastupidavuse ristviide
