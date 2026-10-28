# docs--kind-quantum-time-transfer: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-37d16b499bc5 = dB

# text
seg-a3697ad561db = Hz

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-a1810bbca337 = <b>MODELLED</b> Zweiweg/TWSTFT (Sagnac), GNSS-Common-View, PPP; Link-Jitter→Entfernung. Orakel (ExternalDataset): Sagnac-Betrag geprüft gegen einen maßgeblichen VERÖFFENTLICHTEN WERT — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärtige Umrundung am Äquator summiert { "207.4" } ns (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie trägt. Der zusammengesetzte BIPM-TWSTFT-Transponder/Common-View/

# text
seg-a8beb8dfc757 = Das Fehlerbudget der Zeitübertragung ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte pro FoM mit polaritätsrichtigem Nutzen, optional { "95" }%. Unabhängige Referenz (InternalConsistency): Identitäten für Nutzen/Gewinner in geschlossener Form + getreue Verpackung des bestehenden quantum_trade::TradeResult; die Ehrlichkeit ist an das Repräsentativitätsregister und die Verifikationslabels gebunden

# text
seg-eb75c6a4dcec = Quanten-gegen-klassisch-Trade-Evidenz (gemeinsame Form) ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Quelle: <c1/>

# text
seg-540545e6f846 = MODELLED vertrauenswürdige Quantenzeitkette: ein durchgängiges Zeitübertragungsbudget mit Quanten- (optische Gitteruhr + Verschränkungs-/Einzelphotonenstrecke) gegen klassisch (CSAC + RF-Zweiweg), ein wiederverwendetes Zeitgebungs-Schutzniveau + eine Sicherheitsgütezahl gegen Verzögerungs-/Replay-Angriffe (1-P_md), eine Erkennungswahrscheinlichkeit für Uhrenanomalien + CUSUM-Latenz und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit einem Repräsentativitäts- + Gaps-to-flight-Eintrag. Illustrative Geräte-/Streckenparameter aus öffentlichen Quellen; modelliert die Klasse, kein TRL/Flug/Zertifizierung beansprucht.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Ein Lauf von <c1/> fasst sich zusammen als: quantum-time-transfer | Quantenkette 1.233e-12s gegen klassisch 5.292e-9s | PL { "555.24" } ns | Sicherheit Pd { "1.000" } (Pfa { "1e-3" }) | Anomalie Pd { "0.761" } | Trade Quanten gewinnt 2/2 | MODELLED

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-80e94491c3df = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-time-transfer.toml
seg-6b03fa15a60d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-873de4d05663 = <b>VALIDATED</b> Tabellarischer CUSUM-Detektor: Erkennungslatenz im ungünstigsten Fall (⌊h/(z−k)⌋+{ "1" }) und mittlere Lauflänge außer Kontrolle, verwendet von den Zeitgebungs-Schutzniveau- und Spoof-Monitoren. Unabhängige Referenz (ExternalDataset): Veröffentlichte tabellarische CUSUM-ARL: Siegmund-({ "1985" })-Brownsche-Bewegung-Näherung (Hawkins & Olwell { "1998" }, Gl. { "3.7" }), kreuzverankert an die ARL-Tabellen aus Montgomery, Introduction to Statistical Quality Control (Wiley) für k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministische Latenz exakt gegen eine Erstdurchgangs-Referenz abgeglichen. Die zusammengesetzte TPL-Schranke bleibt MODELLED

# text
seg-dee0faf63e7f = Vertrauenswürdige Quantenzeit — durchgängige Zeitübertragungskette, sichere Verteilung, Anomalieerkennung und ein Quanten-gegen-klassisch-Trade. MODELLED; illustrative Geräte-/Streckenparameter aus öffentlichen Quellen; modelliert die Klasse, keine TRL-/Flugaussage. (Kommentar der Szenariodatei, Zeilen { "1" } bis { "3" })

# text
seg-6e9f5dfca6b0 = Vertrauenswürdige Quantenzeit (Zeitübertragung + sichere Verteilung + Anomalie) ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Zurück</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Weiter</s1>quantum-trade

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (Szenarioart)

# attr:alt
seg-09760f892c7b = Das Diagramm, das die Engine für scenarios/quantum-time-transfer.toml schreibt, Szenarioart quantum-time-transfer

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = MODELLED vertrauenswürdige Quantenzeitkette: ein durchgängiges Zeitübertragungsbudget mit Quanten- (optische Gitteruhr + Verschränkungs-/Einzelphotonenstrecke) gegen klassisch (CSAC + RF-Zweiweg), ein wiederverwendetes Zeitgebungs-Schutzniveau + eine Sicherheitsgütezahl gegen Verzögerungs-/Replay-Angriffe (1-P_md), eine Erkennungswahrscheinlichkeit für Uhrenanomalien + CUSUM-Latenz und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit einem Repräsentativitäts- + Gaps-to-flight-Eintrag. (Szenarioarten-Katalog (<c1/>))

seg-a349aa76b0ed = PARTNER
