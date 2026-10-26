# docs--kind-moonlight-service-volume: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-8f8871ac8a0f = Themenseite: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Themenseite: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/moonlight-service-volume.md
seg-eb9f9a422d38 = Quelle: <c1/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-8516d1ded5dd = Ein Lauf von <c1/> fasst sich zusammen als: moonlight-service-volume | { "8" } Satelliten (illustrativ, LCNS-Klasse, nicht verbunden) | { "24" } Punkte × { "12" } Epochen | Abdeckung { "37.8" }% (PDOP<{ "6.0" }) | Satelliten { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL-Verfügbarkeit { "0.0" }% | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-b59e8773bcb9 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

# text
# c1: scenarios/moonlight-service-volume.toml
seg-0d935e7c43da = Das Beispiel <c1/> setzt unter anderem:

# text
seg-1974d1d64c9c = <b>VALIDATED</b> DOP / Abdeckung / Verfügbarkeit im Mond-Stil der Moonlight-Klasse + verallgemeinerte lunare ARAIM-Schutzniveaus über ein Service-Volumen. Unabhängige Referenz (ExternalDataset): Unabhängige Drittanbieter-Autorität ANISE { "0.10.2" } astro::Orbit-Kepler-Propagator (Nyx Space, MPL-2.0) — ein äquinoktialer Zweikörper-Codepfad, verschieden vom Newton-Raphson-Kepler von kshana; die MCI-Position pro Satellit stimmt auf <{ "1e-3" } m überein, und die abgeleitete Anzahl/Menge sichtbarer Satelliten stimmt an jedem Gitterpunkt exakt überein. Der DOP-Kernel ist durch gnss_lib_py validiert; die Integrität verwendet veröffentlichte LunaNet/LCNS-Parameter

# text
seg-47f496c1d603 = <b>VALIDATED</b> Topozentrische Blickwinkel pro Satellit (Azimut im Uhrzeigersinn von Nord, Elevation) und Schrägentfernung an einem benannten selenographischen Standort, gegeben der Satellit im des Standorts. Unabhängige Referenz (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, als Werkzeug aus xval/anise-service-geometry ausgeführt, Binärdatei lunar-look-angles-xval, die keinen Kshana-Code aufruft): die eigene Azimut-, Elevations- und Entfernungsroutine von ANISE (azimuth_elevation_range_sez) von Standorten, die mit seinem Breiten-Längen-Höhen-Konstruktor auf dem pck00011-Mond (Kugel { "1737.4" } km) gebaut wurden, wobei die Satelliten über moon_pa_de440_200625.bpc in MOON_PA_DE440 gedreht wurden. { "768" } Samples o

# text
seg-f3279128de3b = <s1>Zurück</s1>mars-pnt

# text
seg-92cd937a3fb7 = <s1>Weiter</s1>ntn-positioning

# text
seg-2ff91fe31123 = EHRLICHKEIT: Zusammensetzung der Stufe MODELLED. Die DOP-Geometrie ist validiert DURCH WIEDERVERWENDUNG des validierten Kernels; die Zusammensetzung aus Abdeckung / Verfügbarkeit / Integrität ist MODELLED — ein kreisförmiger/ elliptischer Kepler-Relaissatz (keine differenzialkorrigierte LCNS- / { "9" }:{ "2" }-NRHO-Ephemeride), ein Mond mit mittlerer Rotation (keine physische Libration / kein präzedierender Pol) und veröffentlichte LunaNet-LNIS-Integritätsparameter. Dies zeigt das lunare Service-Volumen M (Kommentar der Szenariodatei, Zeilen { "27" } bis { "32" })

# text
# c1: kshana kinds --json
seg-1f12671176ad = Zusammensetzung der Stufe MODELLED: ein kreisförmiger/elliptischer Kepler-Relaissatz (nicht die reale differenzialkorrigierte LCNS/NRHO-Ephemeride), ein Mond mit mittlerer Rotation (keine Libration/kein präzedierender Pol). (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-edb738273a3a = Das Diagramm, das die Engine für scenarios/moonlight-service-volume.toml schreibt, Art moonlight-service-volume

# text
# c1: moonlight-service-volume
seg-f8988314faf2 = <c1/> (Szenarioart)

# text
seg-28c6a5644152 = Modellierte Analyse des lunaren Navigations-Service-Volumens aus einer ILLUSTRATIVEN Mondorbit-Konstellation der Moonlight/LCNS-Klasse aus öffentlichen Quellen (nicht mit der ESA verbunden): Sie überstreicht ein selenographisches Breiten-/Längengitter über einen Zeithorizont und gibt DOP / Abdeckung / Verfügbarkeit (≥{ "4" } Satelliten UND PDOP < Schwellwert) sowie eine verallgemeinerte lunare ARAIM-Schutzniveau-Hüllkurve (HPL/VPL) über das Volumen aus. Die DOP-Geometrie VERWENDET den gnss_lib_py-VALIDATED-Kern (crate::orbit::dop) wieder; das Schutzniveau VERWENDET die lunare ARAIM-Maschinerie LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) wieder und reduziert sich als Sonderfall auf das bestehende Südpol-Schutzniveau. Zusammensetzung der Stufe MODELLED: ein kreisförmiger/elliptischer Kepler-Relaissatz (nicht die reale differenzialkorrigierte LCNS/NRHO-Ephemeride), ein Mond mit mittlerer Rotation (keine Libration/kein präzedierender Pol). Deterministisch (reine Geometrie). Kein TRL, keine Flugerfahrung, keine Billigung durch eine Agentur.
