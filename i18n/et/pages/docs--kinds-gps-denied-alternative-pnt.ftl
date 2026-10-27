# docs--kinds-gps-denied-alternative-pnt: translations (et)

# text
seg-b03d56f501c3 = Liik

# text
seg-f496b7f4c63a = GPS-ita kombineeritud gravitatsiooni + magnetvälja + maastiku navigaator: kolm skalaarset väljakanalit, mis on ühendatud teekonnapunkti kaupa, et saada teravam (madalama CRLB-ga) triivikorrektsioon kui ühegi üksiku väljaga.

# attr:alt
seg-498b1aea3770 = Diagramm, mille mootor kirjutab failile scenarios/combined-altpnt.toml, liik combined-altpnt

# text
seg-c8f93431680a = MODELLED kihilise PNT konfliktivastupidavus (P7): vaidlustatud keskkonna kasutaja kasutab mitut PNT kihti (avatud teenuse GNSS, lairiba-GNSS, autenditud konstellatsioon, täiendusrelee), millest igaühel on baaskättesaadavus, 1σ täpsus ja vektorikohane keelamise haavatavus jagatud segamise/spuufimise ohu suhtes. Intensiivsuse üle pühitud ALGVÄÄRTUSEGA (SEEDED) Monte Carlo keelab iga kihi tõenäosusega clamp(vulnerability·intensity·vector_weight,{ "0,1" }), ühendab ellujäänud suletud kujul pöördhajuvuse reegliga σ_fused=(Σ 1/σ_i²)^(−1/2) ning annab teada kogukaotuse tõenäosuse (kõik kihid keelatud), ühendatud vea mediaani ja kihikohased kasutatavuse/keelamise statistikad intensiivsuse suhtes. Peamine vastupidavussuhe (üksikkihi ja kihilise kogukaotuse tõenäosus) jääb ~7x juurde SÕLTUMATUSE eelduse korral; ühefaktoriline Gaussi koopula korreleeritud keelamise pühkimine näitab seejärel, et see ~7x variseb väärtuse { "1" } suunas, kui keelamise korrelatsioon kasvab (korrelatsioon nurjab kihistamise). Eelduste tundlikkuse plokk vahemikustab peamise suuruse ALLIKATEGA haavatavuse eelduste üle mcda tornado + Dirichlet' ohupingutuse ümberjaotamise + protsentiilide usaldusvahemike abil. VALIDATED tuum: Monte Carlo kogukaotus koondub suletud kujul sõltumatu korrutiseni Π_i p_deny_i (MC standardvea piires fikseeritud algväärtusega (seed) ja suure N korral); pöördhajuvuse ühendamine on suletud kujul samasus; ρ={ "0" } korral taandub koopula sõltumatule mudelile ja iga ρ säilitab iga kihi marginaalse keelamismäära. MODELLED: kihikohased haavatavuse/kättesaadavuse/täpsuse suurused on allikatega, kuid modelleeritud sisendid (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — vt conflict_threat_params), ning konkreetne ~7x suurus ja suhte-korrelatsiooni kõvera kuju tulenevad sellest parametriseeringust. § { "4.2" } vektorikohane ellujäämise lahutus lahendab seejärel jagatud RF-ohu neljaks nimetatud vektoriks (segamine/spuufimine/kineetiline/küber) ja annab teada iga vektori kasutatava PNT sujuva halvenemise kõvera S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: algväärtusega (seed) kihikohane Monte Carlo koondub sellele suletud kujule; segamine on korreleeritud RF-baasjoone teravaim vektor ja RF-immuunne inertsiaalkiht on otsustav ellujääja. Mitte sertifitseeritud navigatsiooni kättesaadavuse toode.

# attr:alt
seg-4dd2bcc206db = Diagramm, mille mootor kirjutab failile scenarios/conflict-resilience.toml, liik conflict-resilience

# text
seg-9a58a7b09423 = GPS-ita gravitatsioonikaardi sobitamise navigatsioon: külmaatomi gravimeeter taastab konstantse INS-i triivi gravitatsioonianomaalia jadast, mille läbi see lendab.

# attr:alt
seg-c42d90057e9f = Diagramm, mille mootor kirjutab failile scenarios/gravity-map-nav.toml, liik gravity-map

# text
seg-0d7bf5a4f07e = GPS-ita maastikupõhine navigatsioon (TERCOM/SITAN): radar-/baroaltimeeter sobitab maapinna kõrgusprofiili SRTM-stiilis DEM-iga, et taastada INS-i triiv.

# attr:alt
seg-c5e33c7122e2 = Diagramm, mille mootor kirjutab failile scenarios/terrain-nav.toml, liik terrain-nav

# text
seg-6bdc150ab25b = GPS-ita järjestikune (rekursiivne) maastikupõhine navigatsioon: osakestefilter käivitab maastikusobituse mõõtmismudeli epohhide kaupa (SITAN töötava filtrina), nii et ajas muutuvat INS-i triivi jälgitakse mööda trajektoori, kus partiipõhine terrain-nav taastab vaid ühe konstantse nihke.

# attr:alt
seg-4aca87f022dc = Diagramm, mille mootor kirjutab failile scenarios/terrain-slam.toml, liik terrain-slam

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-efd15cff3d32 = MODELLED (tulemuse silt)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Source: <c1/>

# text
seg-d9fdaf3208ca = GPS-ita alternatiivne PNT (stsenaariumi liikide perekond)

# text
seg-9fde6af9e09f = { "5" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Teemalehed: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Käivita üks: <c1/>. Kõik perekonnad: <a3>KINDS.md</a3>.

# attr:alt
seg-6dfd2dc2721a = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna GPS-ita alternatiivne PNT liikide jaoks

# text
seg-cff60d8c17d2 = GPS-ita järjestikune (rekursiivne) maastikupõhine navigatsioon: osakestefilter käivitab maastikusobituse mõõtmismudeli epohhide kaupa (SITAN töötava filtrina), nii et ajas muutuvat INS-i triivi jälgi

# text
seg-9d8f69b51742 = MODELLED kihilise PNT-i konfliktikindlus (P7): vaidlusaluse keskkonna kasutaja kasutab mitut PNT kihti (avatud teenuse GNSS, lairiba GNSS, autenditud konstellatsioon, täiendusreleesatelliit), igaühel

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
# c14: coeffs
# c15: mascons
# c16: refine_stages
# c17: refine_factor
# c18: noise_seed
# c19: reference
# c20: map_error_mc
seg-28486745bb43 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Valikulised: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

# text
seg-c2187e8291f9 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>gravity-map</a1>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
# c13: refine_stages
# c14: refine_factor
# c15: noise_seed
seg-b1ff6f0e1769 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Valikulised: <c13/>, <c14/>, <c15/>.

# text
seg-9bd19903f577 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>terrain-nav</a1>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: n_particles
# c12: init_pos_sigma_deg
# c13: process_sigma_deg
# c14: resample_ess_frac
# c15: seed
seg-3ec7b38184b7 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valikulised: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-7c777178ee8f = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>terrain-slam</a1>.

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
# c16: coeffs
# c17: mascons
# c18: magnetic_mascons
# c19: igrf_alt_km
# c20: refine_stages
# c21: refine_factor
# c22: noise_seed
# c23: magnetic_grid
seg-c5124441822e = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Valikulised: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
seg-d78bd011956c = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>combined-altpnt</a1>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-ab895b157152 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>conflict-resilience</a1>.

# text
seg-c0ef7d676ec1 = <s1>Eelmine</s1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus

# text
seg-54b45b00a2f0 = <s1>Järgmine</s1>Inertsiaal-, liitmis- ja kvantandurid
