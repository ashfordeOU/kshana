# docs--kind-lunar-interop-export: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-debc2f07db78 = true

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/lunar-interop-export.md
seg-d36e6d7d8a10 = Quelle: <c1/>

# text
# c1: scenarios/lunar-interop-export.toml
seg-1726861e444f = Ein Lauf von <c1/> fasst sich so zusammen: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } states, OEM { "23" } lines | conformance PASS ({ "9" } present / { "0" } missing) | OEM round-trip ok | time-meta round-trip ok | KIF { "1640" } bytes | MODELLED

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-f8353e15aabd = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-interop-export.toml
seg-169f9446e90d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

# text
seg-3f36bd2ec5ea = LTC

# text
seg-2ac27c1e55c0 = octet

# text
# c1: oem
seg-98acb538942f = <b>MODELLED</b> An LunaNet/IOAG angelehnter Export von lunarem Bezugssystem + Zeit + Ephemeride (CCSDS OEM + KIF) mit Rundlaufkonformität. Orakel (InternalConsistency): Der lunare OEM-Export von kshana, erneut geparst von der unabhängigen Bibliothek <c1/> eines Drittanbieters (R. J. Anderson): Bezugssystem-/Zeit-Token und Zustand je Epoche stimmen im Rahmen der Schreibpräzision überein ({ "1" } mm / { "1e-9" } km/s), und ein Export ohne TIME_SYSTEM wird abgewiesen — ein struktureller Austausch-Rundlauf; die physikalische Semantik von lunarem Bezugssystem/lunarer Zeit wird von eigenen Zeilen validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): ein se

# text
# c1: honesty
seg-c9a1d76625d6 = MODELLED (Ergebnis <c1/>)

# text
seg-11d0ccba5ee7 = WAS src/lunar_interop.rs tut: * export_lunar_oem — WIEDERVERWENDET den CCSDS-OEM-{ "2.0" }-Emitter des Crates (crate::oem), für den lunaren Kontext neu etikettiert: REF_FRAME = das lunare Körperbezugssystem IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM = die lunare Zeitskala (LTC / TCL / UTC), CENTER_NAME = MOON, über eine beispielhafte ILLUSTRATIVE Ephemeride der Klasse LCNS (Positionen aus crate::lunar_service, Geschwindigkeit durch zentrale finite Differenz). * export_ (Kommentar in der Szenariodatei, Zeilen { "6" } bis { "19" })

# text
seg-f730e8f789cf = EHRLICHKEIT: MODELLED. Die Feld-NAMEN und Einheiten sind an ÖFFENTLICHE Standards angelehnt (CCSDS 502.0-B OEM, IAU-WGCCRE-{ "2015" }-Mondbezugssysteme, LunaNet Interoperability Specification / IOAG-Mondarchitektur). Der deterministische Rundlauf und die Feldnamenkonformität sind die unabhängige Referenz. Dies ist KEIN zertifizierter Interoperabilitäts-Konformitätstest. Die Ephemeride ist illustrativ, aus öffentlichen Quellen, NICHT mit der ESA verbunden und impliziert kein TRL (Kommentar in der Szenariodatei, Zeilen { "21" } bis { "26" })

# text
seg-254d48fe58a5 = Der lunare Interoperabilitätsexport ist MODELLED, nicht validiert: Er wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-07d6cc44724f = <s1>Zurück</s1>lunar-integrity

# text
seg-9669cd9b1d04 = <s1>Weiter</s1>lunar-jamming

# text
seg-5a4dcb93a643 = Modellierter lunarer Interoperabilitätsexport: gibt das lunare Bezugssystem, die lunare Zeitskala und die lunare Ephemeride in an LunaNet/IOAG angelehnten, auf CCSDS basierenden Austauschformen mit Rundlauf-/Feldkonformität aus. WIEDERVERWENDET den CCSDS-OEM-{ "2.0" }-Emitter und -Parser des Crates (crate::oem), für den lunaren Kontext neu etikettiert — REF_FRAME trägt das lunare Körperbezugssystem IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM die lunare Zeitskala (LTC / TCL / UTC), CENTER_NAME = MOON — über eine beispielhafte illustrative Ephemeride der Klasse LCNS (Positionen aus crate::lunar_service, Geschwindigkeit per finiter Differenz). Gibt außerdem einen an LunaNet/IOAG angelehnten Deskriptor der Mondzeit aus (Skalen-ID, säkulare Rate µs/Tag aus crate::lunar_time, veröffentlichtes Band, Bezugsfläche), der über serde_json einen Rundlauf besteht, und verpackt die Artefakte in den bestehenden KIF-Umschlag (crate::interchange) mit der Ehrlichkeitsbezeichnung MODELLED. Meldet ausgegebene Artefakte, OEM-Zeilenzahl, Feldkonformitätsprüfung (bestanden) samt Liste vorhandener/fehlender Felder, OEM-Rundlauf in Ordnung, Zeitmetadaten-Rundlauf in Ordnung und KIF-Bytegröße. MODELLED — deterministischer Rundlauf und Feldnamenkonformität gegenüber dem veröffentlichten CCSDS-OEM und der Feldsemantik von LunaNet/IOAG sind die unabhängige Referenz; KEIN zertifizierter Test der Interoperabilitätskonformität; illustrative Ephemeride aus öffentlichen Quellen, nicht mit der ESA verbunden; keine TRL-/Heritage-/Behördenbestätigung.

# attr:alt
seg-0e86ff364c17 = Das Diagramm, das die Engine für scenarios/lunar-interop-export.toml schreibt, Szenarioart lunar-interop-export

# text
# c1: kshana kinds --json
seg-0e91697e3036 = MODELLED — deterministischer Rundlauf + Feldnamenkonformität gegen veröffentlichtes CCSDS OEM + LunaNet/IOAG-Feldsemantik ist die unabhängige Referenz; KEIN zertifizierter Interoperabilitäts-Konformitätstest; illustrative Ephemeride aus öffentlichen Quellen, nicht mit der ESA verbunden; kein TRL/Flugerbe/keine Billigung durch eine Agentur. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-633bcd62ce93 = Gibt außerdem einen an LunaNet/IOAG angelehnten Deskriptor der Mondzeit aus (Skalen-ID, säkulare Rate µs/Tag aus crate::lunar_time, veröffentlichtes Band, Bezugsfläche), der über serde_json einen Rundlauf besteht, und verpackt die Artefakte in den bestehenden KIF-Umschlag (crate::interchange) mit der Ehrlichkeitsbezeichnung MODELLED. (Szenarioarten-Katalog (<c1/>))

# text
# c1: lunar-interop-export
seg-fdf560e675f4 = <c1/> (Szenarioart)
