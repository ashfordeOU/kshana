# docs--kinds-gps-denied-alternative-pnt: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-f496b7f4c63a = GPS-gesperrter kombinierter Schwere-, Magnet- und Gelände-Navigator: drei skalare Feldkanäle, je Wegpunkt fusioniert, für eine schärfere Driftkorrektur (niedrigere CRLB) als mit jedem einzelnen Feld.

# attr:alt
seg-498b1aea3770 = Das Diagramm, das die Engine für scenarios/combined-altpnt.toml schreibt, Typ combined-altpnt

# attr:alt
seg-4dd2bcc206db = Das Diagramm, das die Engine für scenarios/conflict-resilience.toml schreibt, Typ conflict-resilience

# text
seg-9a58a7b09423 = GPS-verweigerte Navigation mit Schwerefeld-Kartenabgleich: Ein Kaltatom-Gravimeter ermittelt aus der Folge von Schwereanomalien, die es durchfliegt, eine konstante INS-Drift.

# text
seg-0d7bf5a4f07e = GPS-verweigerte geländereferenzierte Navigation (TERCOM/SITAN): Ein Radar-/Baro-Höhenmesser gleicht das Bodenhöhenprofil mit einem DEM im SRTM-Stil ab, um die INS-Drift zurückzugewinnen.

# text
seg-6bdc150ab25b = GPS-verweigerte sequenzielle (rekursive) geländereferenzierte Navigation: Ein Partikelfilter führt das Messmodell des Geländeabgleichs Epoche für Epoche aus (SITAN als laufendes Filter), sodass eine zeitveränderliche INS-Drift entlang der Spur verfolgt wird, wo das Batch-terrain-nav nur einen einzelnen konstanten Versatz zurückgewinnt.

# text
seg-4e31c8daf798 = Register

# text
seg-efd15cff3d32 = MODELLED (Ergebnisbezeichnung)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Quelle: <c1/>

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Themenseiten: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Einen ausführen: <c1/>. Alle Familien: <a3>KINDS.md</a3>.

# text
seg-cff60d8c17d2 = GPS-verweigerte sequenzielle (rekursive) geländereferenzierte Navigation: Ein Partikelfilter führt das Messmodell des Geländeabgleichs Epoche für Epoche aus (SITAN als laufendes Filter), sodass eine zeitveränderliche INS-Drift ve

# text
seg-9d8f69b51742 = MODELLED Konfliktresilienz geschichteter PNT (P7): Ein Nutzer in einer umkämpften Umgebung setzt mehrere PNT-Schichten ein (Open-Service-GNSS, Breitband-GNSS, eine authentifizierte Konstellation, ein Augmentations-Relais), jede mit

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
seg-28486745bb43 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Optional: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

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
seg-b1ff6f0e1769 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Optional: <c13/>, <c14/>, <c15/>.

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
seg-3ec7b38184b7 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Optional: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

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
seg-c5124441822e = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Optional: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-c0ef7d676ec1 = <s1>Zurück</s1>GNSS-Messungen, Positionierung und Integrität

# text
seg-54b45b00a2f0 = <s1>Weiter</s1>Inertial-, Fusions- und Quantensensoren

# text
seg-c8f93431680a = Konfliktresilienz geschichteter PNT (P7), MODELLED: Ein Nutzer in umkämpfter Umgebung setzt mehrere PNT-Schichten ein (Open-Service-GNSS, Breitband-GNSS, eine authentifizierte Konstellation, ein Augmentations-Relais), jede mit einer Basisverfügbarkeit, einer 1σ-Genauigkeit und einer Verwundbarkeit je Vektor gegenüber der gemeinsamen Jamming-/Spoofing-Bedrohung. Ein nach Intensität variiertes Monte-Carlo mit festem Seed sperrt jede Schicht mit der Wahrscheinlichkeit clamp(Verwundbarkeit·Intensität·Vektorgewicht,{ "0,1" }), fusioniert die überlebenden Schichten nach der geschlossenen Inverse-Varianz-Regel σ_fused=(Σ 1/σ_i²)^(−1/2) und berichtet die Gesamtverlustwahrscheinlichkeit (alle Schichten gesperrt), den medianen fusionierten Fehler und Statistiken zu Nutzbarkeit und Sperrung je Schicht über der Intensität. Das zentrale Resilienzverhältnis (Gesamtverlustwahrscheinlichkeit einer einzelnen Schicht gegenüber der geschichteten) liegt unter der Annahme der UNABHÄNGIGKEIT bei ~7x; ein Sweep mit korrelierter Sperrung über eine Ein-Faktor-Gauß-Kopula zeigt dann, dass dieses ~7x gegen { "1" } zusammenbricht, wenn die Korrelation der Sperrung steigt (Korrelation hebelt die Schichtung aus). Ein Block zur Priorsensitivität variiert die Kennzahl über die BELEGTEN Verwundbarkeits-Priors mittels mcda-Tornado, einer Dirichlet-Neuverteilung des Bedrohungsaufwands und Perzentil-Konfidenzintervallen. Der VALIDATED Kern: Der Gesamtverlust des Monte-Carlo konvergiert gegen das geschlossene unabhängige Produkt Π_i p_deny_i (innerhalb des Monte-Carlo-Standardfehlers bei festem Seed und großem N); die Inverse-Varianz-Fusion ist eine Identität in geschlossener Form; bei ρ={ "0" } geht die Kopula in das unabhängige Modell über, und jedes ρ erhält die marginale Sperrrate jeder Schicht. MODELLED: Die Größenordnungen von Verwundbarkeit, Verfügbarkeit und Genauigkeit je Schicht sind belegte, aber modellierte Eingaben (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — siehe conflict_threat_params), und die konkrete Größenordnung von ~7x sowie die Kurvenform von Verhältnis über Korrelation folgen aus dieser Parametrisierung. Eine Aufschlüsselung des Überlebens je Vektor nach §{ "4.2" } löst die gemeinsame HF-Bedrohung dann in die vier benannten Vektoren (Jamming/Spoofing/kinetisch/Cyber) auf und berichtet für jeden Vektor die Kurve der graceful degradation des nutzbaren PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: Das Monte-Carlo je Schicht mit festem Seed konvergiert gegen diese geschlossene Form; Jamming ist der schärfste Vektor für die korrelierte HF-Basislinie, und die HF-immune Inertialschicht ist der entscheidende Überlebende. Kein zertifiziertes Produkt zur Navigationsverfügbarkeit.

# attr:alt
seg-4aca87f022dc = Das Diagramm, das die Engine für scenarios/terrain-slam.toml schreibt, Szenarioart terrain-slam

# attr:alt
seg-6dfd2dc2721a = Kontaktbogen der Diagramme, die die Engine für die Szenarioarten der Familie GPS-verweigerte alternative PNT schreibt

# text
seg-7c777178ee8f = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>terrain-slam</a1>.

# text
seg-9fde6af9e09f = { "5" } Szenarioarten der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
seg-ab895b157152 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>conflict-resilience</a1>.

# text
seg-c2187e8291f9 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>gravity-map</a1>.

# attr:alt
seg-c42d90057e9f = Das Diagramm, das die Engine für scenarios/gravity-map-nav.toml schreibt, Art gravity-map

# attr:alt
seg-c5e33c7122e2 = Das Diagramm, das die Engine für scenarios/terrain-nav.toml schreibt, Art terrain-nav

# text
seg-d78bd011956c = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>combined-altpnt</a1>.

# text
seg-d9fdaf3208ca = GPS-verweigerte alternative PNT (Szenarioarten-Familie)

seg-643fa0f18717 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>terrain-nav</a1>.
