# docs--kinds-clocks-timing-and-holdover: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-78cba87823f7 = Uhren-Holdover gegen Spezifikation; optionales Monte-Carlo-Ensemble (runs > { "1" }).

# attr:alt
seg-cb0b7da83f5c = Das Diagramm, das die Engine für scenarios/clock-ensemble.toml schreibt, Typ clock

# text
seg-1b61962464c5 = Slot-Zeitgebung: Sekunden, bis eine freilaufende Uhr den Schutzbereich (Guard) eines zeitindizierten Routing- oder Tasking-Slots verlässt (der größte absolute Zeitfehler, den der Slot toleriert), der Beitrag jedes Terms zu diesem Zeitpunkt mit Benennung des dominanten (Unsicherheit der Synchronisation, weißes Phasenrauschen, weißes Frequenzrauschen, Flicker-Frequenzrauschen, Random-Walk- und Random-Run-Frequenzrauschen, verbleibender Frequenzoffset, Temperatur, Alterung), die seit der letzten Synchronisation verbleibende Zeit und das größte Synchronisationsintervall, das die Uhr innerhalb des Schutzbereichs hält, abzüglich der Latenz der Synchronisation. Der Oszillator ist ein KLASSEN-Standard (csac, uso, dsac, tcxo, ocxo oder rafs: eine zitierte Allan-Abweichung bei einer Sekunde und eine angenommene Rotrauschgrenze), ein DATENBLATT-PRESET der Telekom-Zeitgebung oder ein Inline-DATENBLATT (Maxima der Allan-Abweichung als Hüllkurve angepasst, dazu Alterung und ein Temperaturkoeffizient) oder eine Inline-GEMESSENE PHASENAUFZEICHNUNG (ihre überlappende Allan-Abweichung, per gewichteter Methode der kleinsten Quadrate in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } angepasst, sodass die Rotrauschgrenze gemessen statt angenommen ist). Eine Verletzung jenseits der längsten Mittelungszeit, die das Datenblatt oder die Aufzeichnung stützt, wird als extrapoliert gekennzeichnet. Ein optionaler Abschnitt zu Spoofing ergänzt das Schutzniveau der Zeitgebung für einen Empfänger im Orbit: Bahngeschwindigkeit und Umlaufzeit, wie lange ein einzelner Spoofer am Boden den Satelliten pro Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, die bedingte Schranke, den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seine Reichweite verlässt oder eine unabhängige Prüfung läuft, sowie ob jede Prüfung bei Bodenkontakt oder über Crosslink von diesem Spoofer unabhängig ist. VALIDATED: die Holdover-Inversion aus einer angepassten Aufzeichnung, zurückgehalten an einer realen Cäsiumuhr, gemessen gegen einen Wasserstoff-Maser (tests/slot_timing_cs5071a_holdout.rs, datenabhängig freigeschaltet); bei einem gemessenen Quarzoszillator ist die zurückgehaltene Vorhersage konservativ, liegt aber nicht innerhalb des Zielwerts, daher ist der Quarzfall MODELLED. MODELLED: Klassen- und Datenblattquellen, die deterministischen Terme und die Spoofing-Bewertung.

# attr:alt
seg-97a91c8a60cd = Das Diagramm, das die Engine für scenarios/slot-timing-ocxo-leo.toml schreibt, Typ slot-timing
