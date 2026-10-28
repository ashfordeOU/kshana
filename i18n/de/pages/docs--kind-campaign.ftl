# docs--kind-campaign: translations (de)

# text
seg-8784979d6569 = dBW

# text
# c1: docs/kinds/by-kind/campaign.md
seg-68a2bcb6eedd = Quelle: <c1/>

# text
# c1: campaign
seg-24ce6aee5e53 = <c1/> (Szenarioart)

# text
seg-931a3d27c0f0 = Szenarioart der Engine v{ $version }, Familie <a1>Kampagnen</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-a07990e776cb = Kampagne: bestehende Szenarioarten, zu einem Lauf zusammengesetzt, wobei jede Zahl aus einem echten Lauf der genannten Art gelesen wird. Vier Abschnitte, in beliebiger Kombination. PHASES: eine verkettete Mission auf einer gemeinsamen Zeitachse -- jede Phase führt ein oder mehrere Szenarien aus (zum Beispiel Jamming, dann Spoofing, dann eine Uhr im Holdover mit einem daneben auslaufenden Inertialnavigationssystem, dann ein Integritätsalarm, dann Erholung), ihre Ausgaben werden durch eine Voreinstellung je Art oder durch ausdrückliche Ergebnispfade in benannte Kanäle gelesen (Uhrenzeitfehler gegen seine Schutzgrenze, Träger-Rausch-Dichte-Verhältnis gegen die Tracking-Untergrenze, Schutzniveau gegen die Alarmgrenze, Positionsfehler, trackende Satelliten, Alarmflags) und durch Halteglied nullter Ordnung auf ein gemeinsames Raster umgetastet, mit Phasengrenzen und Ereignissen; der Zustand wird durch carry (ein Kanal setzt sich vom Endwert der vorigen Phase fort), handoff (eine Zahl der vorigen Phase, in das Szenario dieser Phase geschrieben) und end_at (eine Phase endet zu einer Zeit, die ein Lauf berechnet hat, etwa der Erkennungszeit eines Spoofing-Monitors) weitergereicht. SWEEP: ein Gitter über ein bis drei gepunktete Szenarioschlüssel einer beliebigen Art (ein ganzzahliges Segment indiziert ein Array von Tabellen, wie in system.2.sisre_m), mit Metriken, die über den Ergebnispfad gelesen werden, und, bei mehr als einem Lauf, einem Monte-Carlo-Ensemble mit Seed an jedem Knoten. MONTE_CARLO: Realisierung k läuft bei base_seed + k; jede Metrik meldet Mittelwert, Standardabweichung, Perzentile 5./50./95. nach dem Nearest-Rank-Verfahren und ein Bootstrap-Konfidenzintervall von { "95" } % mit festem Seed für den Mittelwert. COMPOSE: mehrere Szenarien unter gemeinsamen Werten (Leistung und Position eines Jammers, in einen maritimen und einen Straßenempfänger geschrieben), mit einer kombinierten Zusammenfassung von bestem und schlechtestem Fall. Das Ergebnis trägt einen Kampagnen-Hash, einen Digest über jedes Mitgliedsergebnis und einen Einheiteneintrag für jede ausgegebene Zahl; die Interoperabilitätsexporte schreiben jedes Mitgliedsszenario mit Geometrie als eigenen Dateisatz. Kompositionsidentitäten werden getestet: Eine Ein-Phasen-Kampagne reproduziert den eigenständigen Lauf bitgenau, ein Ensemble mit festem Seed ist byte-stabil, und bei einer Uhr mit weißem Frequenzrauschen fällt der Ensemblemittelwert in das gemeldete Intervall, wobei die Streuung zu sqrt(q_wf * tau) passt. MODELLED: der additive Übertrag und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase trägt die Bezeichnung der Art, die sie ausgeführt hat.

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
# c2: jamming
seg-05e842f80dbb = Ein Lauf von <c1/> fasst sich so zusammen: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep of <c2/>: { "13" } nodes over [jammer_power] | { "13" } member runs (MODELLED)

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-bf339fa14645 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
seg-abd3eac6da41 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-c4f955d5f506 = availability

# text
# c1: scenarios/
seg-7bcf77278958 = { "22" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-38faa927b2bd = lin

# text
seg-1a33a746eeee = Ergebnisbezeichnung (die der Engine): MODELLED Komposition bestehender Szenarioarten. Jede Zahl wird aus einem echten Lauf der genannten Art gelesen; die Verkettung (additiver Übertrag eines Kanals über eine Phasengrenze, Halteglied nullter Ordnung auf das Zeitachsenraster, eine zu einer berechneten Zeit beendete Phase) ist eine Modellierungsentscheidung, und jede Phase trägt die Bezeichnung

# attr:alt
seg-b2c7cd1f9712 = Das Diagramm, das die Engine für scenarios/campaign-sweep-jammer-power.toml schreibt, Art campaign

# text
seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect und der Kampagnenläufer: Eine optionale Tabelle [monitors] lässt die IQ-Monitore in jeder Zelle im einzigen Durchlauf des Läufers laufen. Tests: <a1>iq_campaign.rs</a1>.

# text
seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) und iq::campaign::report::rocs: Jede Zelle einer Kampagne mit Monitoren behält je Alarmart und Kanal das Maximum der eigenen Teststatistik des Monitors über jedes genannte Ereignisfenster (positiv) und über die

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) und <c1/> auf <c2/>, Python <c3/> und das MCP-Werkzeug labfit (Kampagnenordner nur innerhalb seines Arbeitsverzeichnisses): liest einen Ausgabeordner <c4/> anhand seines Tests: <a1>iq_labfit_followup.rs</a1>.

# text
# c1: campaign
seg-f16a176dc1f8 = <b>MODELLED</b> Die Phasen der Art <c1/>: Jede Phase führt ein oder mehrere Szenarien bestehender Arten durch run_toml aus, liest ihre Ausgaben in benannte Kanäle (Uhrenzeitfehler und Schutzgrenze, mittleres effektives Träger-Rausch-Dichte-Verhältnis und Tracking-Untergrenze, v Tests: <a1>campaign_composition_reference.rs</a1>.

# text
seg-be831b52a339 = und { "4" } weitere in der Matrix.

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisches J/S-Link-Budget, Anti-Jam-C/N₀, Lock-Verlust je Satellit. Unabhängige Referenz (InternalConsistency): Anti-Jam-C/N₀-Link-Budget-Gleichung, gegen eine unabhängige numpy-Neuherleitung gegengeprüft (teilt dieselbe geschlossene Form → InternalConsistency), plus eine Charakterisierung der C/N₀-Verschlechterung mit realen JammerTest-2024-Daten. { "0.30" } Runde { "2" }, blockiert (bleibt MODELLED): der gemessene C/N0-Abfall von JammerTest { "2024" } gegen eine Link-Budget-Vorhersage (vorab registriert 6a66994b, innerhalb von { "3" } dB) wurde nicht ausgeführt, weil die Antennenposition und -ausrichtung F8.1 bei

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Der Sweep der Art <c1/> (ein bis drei gepunktete Schlüssel einer beliebigen Art, auf den Achsenwerten des generischen Sweeps, optional ein Ensemble an jedem Knoten) und der Abschnitt monte_carlo. Unabhängige Referenz (InternalConsistency): Die geschlossene Form des Phasen-Random-Walks bei weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die Statistikmaschinerie, und Byte-Gleichheit mit den eigenständigen Läufen für das Seeding. Sie prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
# c1: label
seg-c15b5ac32282 = MODELLED Komposition bestehender Szenarioarten. Jede Zahl wird aus einem echten Lauf der genannten Art gelesen; die Verkettung (additiver Übertrag eines Kanals über eine Phasengrenze, Halteglied nullter Ordnung auf das Zeitachsenraster, eine zu einer berechneten Zeit beendete Phase) ist eine Modellierungsentscheidung, und jede Phase trägt die Bezeichnung der Art, die sie erzeugt hat. (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-9e33dcc39c27 = MODELLED: der additive Übertrag und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase trägt die Bezeichnung der Art, die sie ausgeführt hat. (Artenkatalog (<c1/>))

# text
# c1: jamming
seg-adcc6ea59840 = MODELLED: wie es die Art <c1/> ist. (Kommentar der Szenariodatei, Zeile { "14" })

# text
seg-143f3f1cc521 = Jamming-Resilienz bei GNSS-Ausfall ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-d1c11e493795 = Parameter-Sweeps und Monte-Carlo-Ensembles mit Seed über jede Szenarioart sind MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-edbda7aca5b9 = Familienseite: <a1>Kampagnen</a1>

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-c4ed27a559df = Themenseite: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-774e035da605 = <s1>Zurück</s1>body-pnt

# text
seg-fadd92303a4d = <s1>Weiter</s1>cislunar-arc-recovery

seg-a349aa76b0ed = PARTNER
