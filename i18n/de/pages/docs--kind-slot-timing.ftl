# docs--kind-slot-timing: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Quelle: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (Szenariotyp)

# text
seg-1b61962464c5 = Slot-Zeitgebung: Sekunden, bis eine freilaufende Uhr den Schutzbereich (Guard) eines zeitindizierten Routing- oder Tasking-Slots verlässt (der größte absolute Zeitfehler, den der Slot toleriert), der Beitrag jedes Terms zu diesem Zeitpunkt mit Benennung des dominanten (Unsicherheit der Synchronisation, weißes Phasenrauschen, weißes Frequenzrauschen, Flicker-Frequenzrauschen, Random-Walk- und Random-Run-Frequenzrauschen, verbleibender Frequenzoffset, Temperatur, Alterung), die seit der letzten Synchronisation verbleibende Zeit und das größte Synchronisationsintervall, das die Uhr innerhalb des Schutzbereichs hält, abzüglich der Latenz der Synchronisation. Der Oszillator ist ein KLASSEN-Standard (csac, uso, dsac, tcxo, ocxo oder rafs: eine zitierte Allan-Abweichung bei einer Sekunde und eine angenommene Rotrauschgrenze), ein DATENBLATT-PRESET der Telekom-Zeitgebung oder ein Inline-DATENBLATT (Maxima der Allan-Abweichung als Hüllkurve angepasst, dazu Alterung und ein Temperaturkoeffizient) oder eine Inline-GEMESSENE PHASENAUFZEICHNUNG (ihre überlappende Allan-Abweichung, per gewichteter Methode der kleinsten Quadrate in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } angepasst, sodass die Rotrauschgrenze gemessen statt angenommen ist). Eine Verletzung jenseits der längsten Mittelungszeit, die das Datenblatt oder die Aufzeichnung stützt, wird als extrapoliert gekennzeichnet. Ein optionaler Abschnitt zu Spoofing ergänzt das Schutzniveau der Zeitgebung für einen Empfänger im Orbit: Bahngeschwindigkeit und Umlaufzeit, wie lange ein einzelner Spoofer am Boden den Satelliten pro Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, die bedingte Schranke, den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seine Reichweite verlässt oder eine unabhängige Prüfung läuft, sowie ob jede Prüfung bei Bodenkontakt oder über Crosslink von diesem Spoofer unabhängig ist. VALIDATED: die Holdover-Inversion aus einer angepassten Aufzeichnung, zurückgehalten an einer realen Cäsiumuhr, gemessen gegen einen Wasserstoff-Maser (tests/slot_timing_cs5071a_holdout.rs, datenabhängig freigeschaltet); bei einem gemessenen Quarzoszillator ist die zurückgehaltene Vorhersage konservativ, liegt aber nicht innerhalb des Zielwerts, daher ist der Quarzfall MODELLED. MODELLED: Klassen- und Datenblattquellen, die deterministischen Terme und die Spoofing-Bewertung.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Ein Lauf von <c1/> fasst sich so zusammen: slot-timing (Datenblattquelle): Guard { "100.0" } ns bei k={ "3" } wird { "650.8" } s nach einer Synchronisation verletzt ({ "50.8" } s verbleibend); Synchronisation mindestens alle { "645.8" } s ({ "133.80" } pro Tag); dominanter Term: Random-Walk-Frequenzrauschen

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Pflichtfelder: <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Optionale Felder: <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = Datenblatt

# text
seg-c13396b4e57b = Ergebnisbezeichnung (die der Engine): MODELLED — Zeit, bis eine freilaufende Uhr den Guard eines Routing-Slots verlässt, und die Synchronisationskadenz, die sie innerhalb hält, aus einem stationären Potenzgesetz-Uhrenmodell. Eine Datenblattquelle ist eine Hüllkurve ihrer Maxima, keine Messung irgendeiner Einheit; eine Klassenquelle beruht auf einer angenommenen Rotrauschgrenze.

# attr:alt
seg-97a91c8a60cd = Das Diagramm, das die Engine für scenarios/slot-timing-ocxo-leo.toml schreibt, Typ slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diesen Typ nennen.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> Der Pfad des Typs <c1/> für gemessene Aufzeichnungen: die überlappende Allan-Abweichung einer Phasenaufzeichnung, per edf-gewichteter nichtnegativer Methode der kleinsten Quadrate in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } angepasst (slot_timing::fit_weighted), Tests: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> Der Typ <c1/>: der vorhergesagte Fehler E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertiert für die Verletzung, die verbleibende Zeit, das Resynchronisationsintervall abzüglich der Latenz der Synchronisation und die Synchronisationen pro Tag, jeder Term einzeln aufgeführt mit th Tests: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, erreichbar als Spoofing-Abschnitt des Typs <c1/>: Geschwindigkeit und Umlaufzeit auf Kreisbahn, die längste Zeit, die ein Spoofer am Boden den Satelliten pro Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungsl

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> Der Typ <c1/>: der vorhergesagte Fehler E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertiert für die Verletzung, die verbleibende Zeit, die Resynchronisat. Referenz (InternalConsistency): Geschlossene Formen für jeden Term einzeln und die unabhängige Nullstellensuche holdover::holdover_seconds; die Datenblattwerte sind die benannten Dokumente (docs/SLOT-TIMING.md). Ein Klassenstandard beruht auf einer angenommenen Rotrauschgrenze und eine Datenblattquelle ist eine Hüllkurve von Maxima, daher ist keines von beiden eine Messung irgendeiner Einheit

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, erreichbar als Spoofing-Abschnitt des Typs <c1/>: Geschwindigkeit und Umlaufzeit auf Kreisbahn, die längste Zeit, die ein Spoofer am Boden den Satelliten pro Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungsl. Referenz (InternalConsistency): Rückführung auf das bestehende Schutzniveau der Zeitgebung und auf die geschlossenen Formen für Kreisbahn und Sichtbarkeit bei kugelförmiger Erde. Bedingt durch die Erkennung, einen terrestrischen Spoofer bei einer angegebenen Rampenrate, einen Überflug im Zenit bei nicht rotierender Erde; nicht validiert an einem gespooften Empfänger im Orbit

# text
# c1: not_modelled[0]
seg-29af1ec87672 = Frequenzsprünge, Strahlungseffekte und relativistische Frequenzoffsets (Ergebnis <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = ein thermisches Modell: die Temperaturabweichung wird als Sprung bei der Synchronisation angesetzt (Ergebnis <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = das Synchronisationsprotokoll selbst: eine Synchronisation setzt den Fehler auf fix_sigma_ns zurück (Ergebnis <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = an welcher Wander-Metrik ein Routing-Slot akzeptiert werden sollte; siehe docs/SLOT-TIMING.md (Ergebnis <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — Zeit, bis eine freilaufende Uhr den Guard eines Routing-Slots verlässt, und die Synchronisationskadenz, die sie innerhalb hält, aus einem stationären Potenzgesetz-Uhrenmodell. Eine Datenblattquelle ist eine Hüllkurve ihrer Maxima, keine Messung irgendeiner Einheit; eine Klassenquelle beruht auf einer angenommenen Rotrauschgrenze. (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = Der Oszillator ist ein KLASSEN-Standard (csac, uso, dsac, tcxo, ocxo oder rafs: eine zitierte Allan-Abweichung bei einer Sekunde und eine angenommene Rotrauschgrenze), ein DATENBLATT-PRESET der Telekom-Zeitgebung oder ein Inline-DATENBLATT (Maxima der Allan-Abweichung als Hüllkurve angepasst, dazu Alterung und ein Temperaturkoeffizient) oder eine Inline-GEMESSENE PHASENAUFZEICHNUNG (ihre überlappende Allan-Abweichung, per gewichteter Methode der kleinsten Quadrate in der Basis aus weißer Phase und IEEE S (Typkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: die Holdover-Inversion aus einer angepassten Aufzeichnung, zurückgehalten an einer realen Cäsiumuhr, gemessen gegen einen Wasserstoff-Maser (tests/slot_timing_cs5071a_holdout.rs, datenabhängig freigeschaltet); bei einem gemessenen Quarzoszillator ist die zurückgehaltene Vorhersage konservativ, liegt aber nicht innerhalb des Zielwerts, daher ist der Quarzfall MODELLED. (Typkatalog (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: Klassen- und Datenblattquellen, die deterministischen Terme und die Spoofing-Bewertung. (Typkatalog (<c1/>))

# text
seg-1a72034c1343 = Themenseite: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Zurück</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Weiter</s1>solar-system
