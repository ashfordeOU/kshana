# docs--kind-jamming: translations (de)

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisches J/S-Link-Budget, Anti-Jam-C/N₀, Lock-Verlust je Satellit. Unabhängige Referenz (InternalConsistency): Anti-Jam-C/N₀-Link-Budget-Gleichung, gegen eine unabhängige numpy-Neuherleitung gegengeprüft (teilt dieselbe geschlossene Form → InternalConsistency), plus eine Charakterisierung der C/N₀-Verschlechterung mit realen JammerTest-2024-Daten. { "0.30" } Runde { "2" }, blockiert (bleibt MODELLED): der gemessene C/N0-Abfall von JammerTest { "2024" } gegen eine Link-Budget-Vorhersage (vorab registriert 6a66994b, innerhalb von { "3" } dB) wurde nicht ausgeführt, weil die Antennenposition und -ausrichtung F8.1 bei

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
seg-143f3f1cc521 = Jamming-Resilienz bei GNSS-Ausfall ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-9521a296d617 = dBi

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-5d23d7f8f872 = Familienseite: <a1>Jamming, spoofing and the spectrum</a1>

# text
# c1: docs/kinds/by-kind/jamming.md
seg-53b1a341460a = Quelle: <c1/>

# text
seg-60bf3f0ff000 = Jamming per Link-Budget: J/S → effektives C/N₀ → Verlust der Aufschaltung.

# text
# c1: scenarios/jamming-demo.toml
seg-25a1f4f327bd = Ein Lauf von <c1/> fasst sich so zusammen: scenario 5aac34b045c7 | jamming ON | availability under jamming { "0.00" } (nominal { "1.00" }) | min tracking { "0" } | mean J/S { "72.2" } dB

# text
# c1: jammer
# c2: mask_deg
# c3: tracking_threshold_dbhz
# c4: degraded_margin_db
# c5: signal_power_dbw
# c6: temp_k
# c7: freq_hz
# c8: chip_rate_hz
# c9: skyline
seg-e4f8d6b2fe1f = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/jamming-demo.toml
seg-a2433f85f8d0 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = broadband

# text
seg-4d946761b93f = <b>MODELLED</b> Geometrisches J/S-Link-Budget, Anti-Jam-C/N₀, Verlust der Aufschaltung je Satellit Tests: <a1>gnss_denied_jamming_resilience_reference.rs</a1>.

# text
seg-4f5e697dfaeb = <b>MODELLED</b> Der Bericht von hybrid-optical-rf nennt eine HF-Link-Verfügbarkeit, zusammengesetzt aus Größen, die die Engine ohnehin berechnet, statt aus einer importierten Klimatologie, und nennt die Zusammensetzung als benannte Regel: A_rf = I_closure * I_track, wobei I_clos

# text
seg-cec5c06d38af = <b>MODELLED</b> Mondeigenes Störer-zu-Signal-Verhältnis, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht) über der illustrativen Moonlight/LCNS-artigen Konstellation aus öffentlichen Quellen.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Der Bericht von <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzigen Skalar.

# text
seg-e34f60d56cf7 = und { "5" } weitere in der Matrix.

# text
seg-d7f1fc7f30a6 = Themenseite: <a1>SPECTRUM.md</a1>

# text
seg-bd78e9277435 = <s1>Zurück</s1>integrity

# text
seg-1d5e7a4b87e9 = <s1>Weiter</s1>launch-window

# text
# c1: jamming
seg-1c9fd1344128 = <c1/> (Szenarioart)

# text
seg-304496607bd7 = Szenarioart der Engine v{ $version }, Familie <a1>Jamming, spoofing and the spectrum</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# attr:alt
seg-42d46b928d09 = Das Diagramm, das die Engine für scenarios/jamming-demo.toml schreibt, Szenarioart jamming

seg-a349aa76b0ed = PARTNER
