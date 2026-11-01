# docs--compliance: translations (de)

# text
seg-f65b1f2b4182 = Modus

# text
# c1: docs/COMPLIANCE.md
seg-e19db3d5273b = Quelle: <c1/>

# text
seg-045b24defdbb = DO-316 / DO-229E: compliance-Zuordnung zur Integrität

# text
seg-9100800daa1c = Dieses Dokument ordnet die Anforderungen an Schutzniveaus und Integritätsüberwachung aus RTCA (früher Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satellitengestütztes Augmentierungssystem) MOPS (Mindestanforderungen an die Betriebsleistung)) und <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System), Bordausrüstung) den Funktionen von Kshana zu, die sie umsetzen. Es ist ein <b>Hilfsmittel zur technischen Rückverfolgbarkeit</b>, keine Aussage, dass irgendeine Anforderung erfüllt ist — Kshana setzt die veröffentlichten Algorithmen um; es ist keine zugelassene Avionik.

# text
# c1: sbas::do316_compliance_map
# c2: docs/ARAIM_REFERENCE.md
seg-0e6ec5617eb5 = Die maschinenlesbare Form ist <a1><c1/></a1>; dieser Text ist ihr Begleiter (er spiegelt <a2><c2/></a2>).

# text
seg-d5d7a2ec9c73 = Schutzniveaus nach der gewichteten Methode der kleinsten Quadrate (DO-229E Anhang J)

# text
# c1: Elᵢ
# c2: Azᵢ
seg-0dc19f403f5e = Für jeden Satelliten <em>i</em> mit Elevation <c1/> und Azimut <c2/> beim Nutzer lautet die Beobachtungszeile im lokalen Horizontsystem (ENU (Ost-Nord-Oben) + Uhr)

# text
# c1: wᵢ = 1/σᵢ²
# c2: σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²
# c3: D = (GᵀWG)⁻¹
seg-6415f7f28e7e = mit dem Gewicht <c1/>, <c2/> (das Budget aus UDRE (Restfehler der differentiellen Entfernung für den Nutzer) / GIVE (vertikaler Ionosphärenfehler im Gitter) / Bordseite / Troposphäre). Die Positionskovarianz ist <c3/>; ihr ENU-Block liefert die horizontalen und vertikalen Schutzniveaus (HPL, VPL):

# text
# c1: D
# c2: orbit::invert4
# c3: D[2][2]
# c4: Σᵢ S_{U,i}²·σᵢ²
# c5: inv(GᵀG)
seg-ea574448bda4 = Kshana berechnet <c1/> durch Invertieren der { "4" }×{ "4" }-Normalmatrix mit derselben Routine, die der RAIM-Stack (Überwachung der Integrität durch den Empfänger selbst) verwendet (<c2/>), und validiert das Ergebnis auf zwei Wegen (der Kovarianzweg <c3/> und der Projektionsweg <c4/> müssen übereinstimmen) sowie gegen eine unabhängige numpy-Referenzgeometrie <c5/>.

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-268ae5b25684 = Streckenflug → NPA (Nichtpräzisionsanflug; nur horizontal)

# text
# c1: √(−2·ln 5e-9)
seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

# text
seg-dbae96c75a06 = Präzisionsanflug

# text
seg-1bfafdcf6ab0 = DO-229E MOPS

# text
# c1: 6.0
# c2: Φ⁻¹(1 − 1e-9/2)
# c3: 6.109
# c4: K_V = Φ⁻¹(1 − 1e-7/2) = 5.327
# c5: raim::normal_quantile
seg-1922c53b8340 = Hinweis zur Offenheit: Die MOPS verwenden die gerundete horizontale Konstante <c1/>; das exakte zweiseitige Normalquantil <c2/> ist <c3/>. Kshana verwendet im Code das veröffentlichte { "6.0" } und leitet <c4/> aus demselben <c5/> ab, das der RAIM-Stack verwendet, eine nicht zirkuläre Gegenprobe (der Wert rundet auf das { "5.33" } der MOPS).

# text
seg-ef191c1d3db1 = Ionosphärenfreie L1/L5-Zweifrequenzkombination (IS-GPS-705)

# text
# c1: f₁ = 1575.42 MHz
# c2: f₅ = 1176.45 MHz
# c3: γ₁₅ = (f₁/f₅)² = 1.79327
seg-b69825ef05d3 = Mit <c1/>, <c2/>, <c3/>:

# text
# c1: 40.3·10¹⁶·TEC/f²
# c2: timetransfer_adv::iono_delay_m
# c3: √(c₁² + c₅²) = 2.588
seg-ce81c6b71738 = Die ionosphärische Verzögerung erster Ordnung (<c1/>) hebt sich exakt auf — geprüft gegen die unabhängige Physik von <c2/> in der Engine für einen Bereich von TEC (Gesamtelektronengehalt). Die Rauschverstärkung bei Eingaben gleicher Varianz beträgt <c3/>.

# text
# c1: γ₁₅
# c2: inv(GᵀG)
# c3: sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry
seg-e111fb05a7c6 = <b>Im Repository, automatisiert</b> (bei jedem Commit): die K-Faktoren gegen ihre Verteilungsdefinitionen, <c1/> und die ionosphärenfreien (IF) Koeffizienten gegen die Frequenzen aus IS-GPS-705 (IS: Interface Specification), die Aufhebung der Ionosphäre erster Ordnung gegen die unabhängige Verzögerungsphysik und die Schutzniveaus nach der gewichteten Methode der kleinsten Quadrate (WLS) gegen eine numpy-Referenzgeometrie <c2/> (<c3/>).

# text
# c1: tests/sbas_reference.rs
# c2: sbas_protection_level
# c3: waasprotlevels()
# c4: zsiki/rtklib_ws
# c5: d_U
# c6: core/filter.c
seg-f30d84abe275 = <b>Externe unabhängige Referenz, automatisiert</b> (<c1/>): Aus Elevation, Azimut und der gesamten 1-σ-Angabe jedes Satelliten reproduziert <c2/> die HPL einer unabhängigen Implementierung, <c3/> im SBAS-Schutzniveau-Fork <c4/> von RTKLIB (einer quelloffenen Bibliothek für kinematische Echtzeit-Positionierung) (Siki & Takács { "2017" }), auf sechs Epochen, die dieses Werkzeug aus <b>echten EGNOS-Rundsendenachrichten (European Geostationary Navigation Overlay Service)</b> (geostationäre PRN (Nummer des Pseudozufallscodes) { "120" }) und echten RINEX-Beobachtungen (Receiver Independent Exchange Format) der Station BUTE in Budapest (2017-02-19) berechnet hat, auf <b>< { "2e-3" } m</b>. Die Referenz rundet K_V auf { "5.33" }, daher wird die Vertikale ohne K-Faktor verglichen, als <c5/> gegen ihr VPL / { "5.33" }. ESA (Europäische Weltraumorganisation) gLAB { "v6.0.0" } (<c6/>) verwendet dieselbe Formel.

# text
seg-389e8a57e3e8 = <b>Nicht erledigt</b>: Das σ je Satellit stammt von der Referenz selbst; σ aus rohen UDRE/GIVE-Nachrichten zu modellieren liegt außerhalb des Umfangs, und es wurde kein offizielles veröffentlichtes Schutzniveau-Produkt von WAAS (Wide Area Augmentation System) oder EGNOS durchgängig reproduziert. DO-229E/DO-316 selbst sind bei RTCA kostenpflichtig; die offene Quelle der Herleitung sind die ICAO/EGNOS-SBAS-Seiten (ICAO: Internationale Zivilluftfahrt-Organisation) der ESA Navipedia.

# text
seg-7686fb3d3e0c = <s1>Zurück</s1>ARAIM-Referenz

# text
seg-0457ef382fb0 = <s1>Weiter</s1>Resilienz-Zuordnung
