# docs--kind-earth-gnss-lunar: translations (de)

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = kein Wert

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
# c1: docs/kinds/by-kind/earth-gnss-lunar.md
seg-9a399fed06c4 = Quelle: <c1/>

# text
# c1: earth-gnss-lunar
seg-886b3796afaa = <c1/> (Szenarioart)

# text
seg-c8a8be4b8894 = Erd-GNSS-Empfang in Monddistanz, die Schwachsignalschicht, die das Papier zur Konfliktresilienz nennt und für die die Engine kein Modell hatte. Ein GNSS-Satellit richtet seine Antenne auf die Erde; ein Empfänger nahe dem Mond sitzt etwa das Fünfzehnfache des Bahnradius entfernt, sodass drei Dinge zugleich zuschlagen. Die Erde VERDECKT DIE HAUPTSTRAHLRICHTUNG: Aus { "26,560" } km spannt sie einen Halbwinkel von { "13.9" } deg auf, sodass jeder zum Mond gerichtete Strahl den Sender mindestens so weit vom Nadir entfernt verlassen muss, was die Spitze der Keule beseitigt, bevor irgendeine Leistung berechnet wird. Was bleibt, sind der HAUPTKEULENRAND UND DIE NEBENKEULEN, das Regime, in dem die LuGRE-Nutzlast { "2025" } tatsächlich arbeitete. Und die Freiraumdämpfung beträgt etwa { "208" } dB bei L1, grob { "25" } dB mehr, als ein terrestrischer Nutzer zahlt. Der Bericht gibt eine Zeile je Satellit aus (Winkel zur Hauptstrahlrichtung, Erdverdeckung, Entfernung, Pfaddämpfung, Sendegewinn bei diesem Winkel, empfangene Leistung, Träger-Rausch-Dichte) und aggregiert nur die Verbindungen, die die Tracking-Schwelle erfüllen. ER MELDET AUCH DIE KONDITIONIERUNG, denn sie definiert diese Schicht: Jeder sichtbare Satellit liegt vom Mond aus gesehen in einem Kegel von wenigen Grad Breite, sodass die Sichtlinien nahezu parallel sind, die Verdünnung der Genauigkeit enorm ist und eine Erd-GNSS-Lösung in Monddistanz weit eher eine Beobachtung auf ZEITGEBUNGS-Niveau als auf Positionsniveau ist. MODELLED, und das Sendediagramm ist der Grund: Der Gewinn über den Winkel ist eine gleichförmige Kreisapertur (Airy), während eine reale GPS-L1-Antenne ein Wendelantennen-Array aus zwölf Elementen mit geformter Hauptkeule und Nicht-Airy-Nebenkeulen ist. Gemessene Diagramme existieren und werden hier nicht mitgeliefert, sodass Reihenfolgen und Größenordnungen aussagekräftig sind, das dB eines einzelnen Satelliten aber nicht. Bewusst NICHT ENTHALTEN, jeweils mit der Folge, dass das Budget optimistisch ist: keine ionosphärische oder troposphärische Dämpfung auf den den Limb streifenden Strahlen, keine Polarisations-, Zeige- oder Implementierungsverluste und eine kugelförmige Erde ohne refraktive Erweiterung. Die Mondposition ist eine EINGABE (Entfernung plus inertiale Richtung) statt eines Ephemeriden-Nachschlagens, weil die geprüfte Größe die Verbindung und die Strahlgeometrie ist. Diese Zeile auf validiert hochzustufen, braucht ein gemessenes Sendediagramm und LuGRE-Normalpunkte; keines von beiden ist im Repository, und keines wird hier erfunden.

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-75b6814c0091 = Ein Lauf von <c1/> fasst sich so zusammen: Earth-GNSS at lunar distance — { "24" } satellites, receiver at { "384400" } km Earth limb from the constellation: { "13.90" } deg off nadir — any lunar-bound ray must exceed this { "22" } of { "24" } not occulted; { "0" } clear the { "25.0" } dB-Hz tracking threshold no link reaches the threshold fewer than two trackable links; no angular spread to report fewer than four trackable links, or a singular geometry: no DOP SWEEP over { "64" } epochs / { "43082" } s: signal availability { "0.375" }, FIX availability { "0.000" } trackable links mean { "0.75" }, max { "2" }; best C/N0 { "30.93" } dB-Hz; best PDOP none Nehmen Sie die FIX-Verfügbarkeit als Prior dieser Schicht, nicht die Signalverfügbarkeit: Eine Verbindung ist eine Uhrenbeobachtung, vier sind eine Position. MODELLED: Der Sendegewinn ist ein Ersatz mit gleichförmiger Apertur (Airy), kein gemessener GPS-Strahl, und es wird keine atmosphärische, Polarisations- oder Implementierungsdämpfung angewendet — das Budget hier ist also optimistisch. Größenordnungen und Reihenfolgen sind aussagekräftig; das dB eines einzelnen Satelliten ist es nicht.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-6c0897da2efa = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-8c6bb203352d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# attr:alt
seg-cf1dce5fc824 = Das Diagramm, das die Engine für scenarios/earth-gnss-lunar.toml schreibt, Art earth-gnss-lunar

# text
seg-04f59a1e2ec2 = <b>MODELLED</b> Erd-GNSS-Empfang in Monddistanz: die Schwachsignalschicht, die P7 Tabelle { "1" } nennt und für die die Engine kein Modell hatte.

# text
seg-9531f6b14fc8 = <b>MODELLED</b> Erd-GNSS-Empfang in Monddistanz: die Schwachsignalschicht, die P7 Tabelle { "1" } nennt und für die die Engine kein Modell hatte. Je Satellit und je Epoche berechnet es den Winkel zur. Unabhängige Referenz (InternalConsistency): Geschlossene Identitäten und interne Konsistenz; es wird KEINE externe unabhängige Referenz beansprucht. Der Limb-Halbwinkel wird gegen asin(R_earth/r_orbit) geprüft und die Geometrie gegen ihn; die Freiraumdämpfung, der DOP-Kern und die SGP4-Propagation, die dies zusammensetzt, sind jeweils in ihren eigenen Zeilen extern validiert, und diese Zeile borgt nicht ihren Status. WARUM MODELLED, und es ist das Sendediagramm: Der Gewinn über den Winkel ist eine gleichförmig beleuchtete

# text
# c1: kshana kinds --json
seg-6dfc5503f58f = MODELLED, und das Sendediagramm ist der Grund: Der Gewinn über den Winkel ist eine gleichförmige Kreisapertur (Airy), während eine reale GPS-L1-Antenne ein Wendelantennen-Array aus zwölf Elementen mit geformter Hauptkeule und Nicht-Airy-Nebenkeulen ist. (Artenkatalog (<c1/>))

# text
seg-c40d3fd8c12e = WAS MODELLED IST, UND WARUM ES NICHT VALIDATED IST Der Sendegewinn über den Winkel ist eine gleichförmig beleuchtete Kreisapertur — ein Airy-Diagramm. Eine reale GPS-L1-Antenne ist ein Wendelantennen-Array aus zwölf Elementen, dessen gemessenes Diagramm eine geformte Hauptkeule hat, bewusst abseits der Hauptstrahlrichtung gespitzt, um die Leistung über die Erdscheibe auszugleichen, und Nebenkeulen, die überhaupt nicht Airy sind. Gemessene Diagramme sind veröffentlicht; sie werden in diesem Re (Kommentar der Szenariodatei, Zeilen { "29" } bis { "35" })

# text
seg-01fa469abd95 = Erd-GNSS in Monddistanz ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-2fd936b76f4a = <s1>Zurück</s1>contact-schedule

# text
seg-95a5aa0adeb3 = <s1>Weiter</s1>entry-heating

seg-a349aa76b0ed = PARTNER
