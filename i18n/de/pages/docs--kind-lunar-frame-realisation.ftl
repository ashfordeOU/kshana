# docs--kind-lunar-frame-realisation: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-49f323360dc3 = <b>VALIDATED</b> 7-Parameter-Anpassung des Helmert-Datums + ICRF-Orientierungsanbindung aus einem Netz von Punkten. Orakel (ExternalDataset): Unabhängiger Löser für die Ähnlichkeitstransformation nach gewichtetem Umeyama (Horn) in geschlossener Form (numpy/scipy, SVD-basiert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — ein anderer Algorithmus als die iterative Gauss-Newton-Anpassung von kshana, der auf bytegleichen Punktnetzen dasselbe eindeutig definierte Optimum nach gewichteten kleinsten Quadraten erreicht

# text
# c1: docs/kinds/by-kind/lunar-frame-realisation.md
seg-0225ace73ba8 = Quelle: <c1/>

# text
seg-0c4c119abfca = Modellierte Realisierung des lunaren Bezugssystems: eine Anpassung eines Helmert-Datums (Ähnlichkeit) mit 7 Parametern — { "3" } Translationen, { "3" } Kleinwinkel-Rotationen, { "1" } Maßstab —, die einen geschätzten Satz von aus der Selenographie abgeleiteten MCMF-Punktkoordinaten durch gewichtete kleinste Quadrate (crate::batch_ls::gauss_newton) an ein Datum bindet, plus eine einfache Orientierungsanbindung, die die realisierte kleine Rotation um die ICRF-Achsen relativ zur Körperorientierung IAU { "2015" } WGCCRE ausdrückt. Das Szenario speist eine bekannte kleine Transformation (Translation ~einige zehn m, Rotation ~µrad, Maßstab ~{ "1e-7" }) in ein gut verteiltes synthetisches Punktnetz ein, fügt Gaußsches Rauschen mit Seed hinzu, gewinnt das Datum zurück und gibt die zurückgewonnene Transformation, den Wiedergewinnungsfehler je Parameter gegen die eingespeiste Wahrheit und das RMS-Residuum nach der Anpassung aus. MODELLED Selbstkonsistenz — gewinnt eine eingespeiste Ähnlichkeitstransformation zurück (rauschfrei bis auf ~Maschinengenauigkeit), KEINE Realisierung gegen echte Verfolgungs-/VLBI-Daten; deterministisch (mit Seed); kein TRL/Flugerbe/keine Billigung durch eine Agentur.

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-32d5e2749e64 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-frame-realisation | { "8" } points | translation err { "3.125e-1" } m, rotation err { "3.418e-7" } rad, scale err -5.891e2 ppb | rms residual { "0.887" } m | converged false

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-e732d2c2ab91 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-29f85024974b = Das Beispiel <c1/> setzt unter anderem:

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
seg-238cea087ae0 = Ehrlichkeit: MODELLED Selbstkonsistenz. Die unabhängige Referenz ist die Wiedergewinnung einer eingespeisten Ähnlichkeitstransformation mit 7 Parametern (rauschfrei bis auf ~Maschinengenauigkeit) plus die algebraische Rundlaufidentität von apply_helmert. Dies ist KEINE Realisierung des lunaren Bezugssystems gegen echte Verfolgungs-/VLBI-Daten und erhebt keinen Anspruch auf eine absolute Genauigkeit des Bezugssystems. Deterministisch (mit Seed). Es wird kein TRL, kein Flugerbe und keine Billigung durch eine Agentur beansprucht. (Kommentar in der Szenariodatei, Zeilen { "23" } bis { "27" })

# text
seg-07550d3d9610 = <s1>Zurück</s1>lunar-frame-campaign

# text
seg-5a3a7120aae2 = <s1>Weiter</s1>lunar-infrastructure

# text
# c1: lunar-frame-realisation
seg-a092c5795651 = <c1/> (Szenarioart)

# attr:alt
seg-f3a6d69d0225 = Das Diagramm, das die Engine für scenarios/lunar-frame-realisation.toml schreibt, Art lunar-frame-realisation

# text
# c1: kshana kinds --json
seg-f99a78efa965 = MODELLED Selbstkonsistenz — gewinnt eine eingespeiste Ähnlichkeitstransformation zurück (rauschfrei bis auf ~Maschinengenauigkeit), KEINE Realisierung gegen echte Verfolgungs-/VLBI-Daten; deterministisch (mit Seed); kein TRL/Flugerbe/keine Billigung durch eine Agentur. (Szenarioarten-Katalog (<c1/>))
