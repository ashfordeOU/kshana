# docs--lunanet-afs: translations (de)

# text
seg-33f4c7af9c53 = Träger

# text
seg-53a7343c076e = Aussage

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Quelle: <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = LunaNet Augmented Forward Signal: Codes, Nachrichtenformat und <c1/>

# text
seg-c1a27b995345 = Kshana implementiert die Spreizcodes und die Nachrichtenschicht des <b>Augmented Forward Signal (AFS)</b> von LunaNet so, wie eine Ausgabe der Spezifikation sie definiert, und prüft sich gegen die gedruckten Tabellen dieser Ausgabe.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Festlegung.</b> LunaNet Interoperability Specification (LNIS) <b>Version { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Version { "1.0" }, { "29" }. Januar { "2025" }</b> (NASA). Abgerufen am 2026-10-18; PDF-SHA-256 <c1/> (<a1>Herkunft</a1>). Eine spätere Ausgabe ist eine andere Festlegung und kann die Codes ändern: Das Dokument kennzeichnet seine Codetabellen mit { "{" }LSIS-TBC{ "}" } und sagt, sie seien „nur zur Erleichterung von Test- und Integrationsarbeiten enthalten“. Jeder Bericht nennt diese Ausgabe.

# text
seg-6845e671bf24 = Hinweis (beratend): Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit menschlichen Lebens.

# attr:alt
seg-69a98d01f489 = Der Codegenerator von LunaNet AFS, geprüft gegen die gedruckten Spalten der Spezifikation, aus einem echten Lauf der Engine v{ $version } (`kshana lunanet-afs-check spec`, festgelegt auf LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" }. Januar { "2025" }; das Dokument kennzeichnet seine Codetabellen mit { "{" }LSIS-TBC{ "}" }). { "9" } von { "10" } Prüfungen sind erfüllt; B4 ist NOT MET ({ "420" } von { "421" } stimmten überein). Sie prüft einen Symbolstrom gegen eine Ausgabe einer veröffentlichten Spezifikation und sagt nichts über einen LunaNet-Knoten oder -Dienst. Hinweis (beratend): Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit menschlichen Lebens. Sie prüft einen Symbolstrom gegen eine Ausgabe einer veröffentlichten Spezifikation und sagt nichts über einen LunaNet-Knoten oder -Dienst.

# text
seg-4c3f77d97294 = Was implementiert ist

# text
seg-a0b684e44fb0 = Schicht

# text
seg-5d987fca539c = Was

# text
seg-df52127d74b6 = Wo

# text
seg-637035a0b1c1 = AFS-I (Daten)

# text
seg-dbee58df4c92 = Gold-Code { "2047" }, auf { "2046" } Chips zyklisch verkürzt, G2 um eine Chipzahl je PRN verzögert, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } Symbol/s, PRN { "1" } bis { "210" }

# text
# c1: iq::signals::lunanet::afs_i
# c2: lunanet-afs-i
seg-d4480ead20d1 = <c1/>, Signalname <c2/>

# text
seg-6d84dce7f6d0 = AFS-Q (Pilot)

# text
# c1: afs_q
# c2: lunanet-afs-q
# c3: afs_q_tiered
seg-2ebf619c9cb6 = Weil-Code { "10230" } (die Konstruktion von GPS L1C), gestuft mit einem 4-Chip-Sekundärcode (S0 bis S3) und einem 1500-Chip-Tertiär-Weil-Code ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), keine Daten. <c1/> und der Signalname <c2/> sind die Empfängerreplik, primär x sekundär ({ "8" } ms): Das Tertiär-Rahmensynchronisations-Overlay von { "12" } s ist darin weggelassen, weil Akquisition und Verfolgung nicht gegen eine Replik von { "12" } s korrelieren. <c3/> ist der volle Code von { "12" } s

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Rahmen

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } verschachtelte Symbole = { "6000" } Symbole = { "12" } s bei { "500" } Symbol/s

# text
seg-a242d95d701f = { "9" } Bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), Generator { "763" } oktal, mit dem 256-Hypothesen-Korrelationsdecoder des Dokuments

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, Generator ({ "1" }+X)P(X) (Anhang H)

# text
seg-e225f10d7848 = Interleaver

# text
seg-cb075da6f8cf = { "60" } Zeilen x { "98" } Spalten, zeilenweise geschrieben und spaltenweise gelesen

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Die beiden Komponenten werden von <c1/>, <c2/>, <c3/> und <c4/> wie jedes andere Signal akzeptiert, sodass eine Aufzeichnung nach AFS-I oder AFS-Q durchsucht (<c5/>) und eine synthetische Szene für Tests von Software-Empfängern erzeugt werden kann. Eine synthetische Szene ist, wie bei jedem anderen Signal, eine Datei für einen Software-Empfänger; nichts hier steuert Funkhardware an.

# text
seg-6d7a9d17946d = Was <b>nicht</b> implementiert ist

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>Die LDPC-Kodierung mit Rate 1/2 der Unterrahmen { "2" } bis { "4" }.</b> Ihre Prüfmatrizen stehen in Anhang { "1" }, einer getrennten Datei, die nicht im PDF steht und nicht mitgeliefert wird. Die Unterrahmen { "2" } bis { "4" } werden als undurchsichtige Symbolblöcke der festgelegten Länge geführt und geprüft, und die CRC-24Q-Wörter darin werden nicht verifiziert. Ein Strom, der <c1/> besteht, ist nicht als Träger gültiger Codewörter nachgewiesen.

# text
seg-67bb5d1038c7 = <b>Nachrichteninhalt</b> (MSG-G1, MSG-G2, MSG-G4, ...): Das Dokument lässt mehrere Definitionen noch zu schreiben (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Codezuweisung je LunaNet-Knoten</b> (Tabelle F-1 ist TBD). Die PRN { "1" } bis { "12" } haben vorläufige Testzuweisungen (Tabelle { "11" }). <c1/> verwendet den Primärcode der PRN <em>n</em> mit dem Sekundärcode S((n-1) mod { "4" }); jenseits von PRN { "12" } ist das das Muster dieser Implementierung, nicht das des Dokuments. <c2/> und <c3/> nehmen jede Kombination, mit dem Tertiärcode jeder PRN.

# text
seg-6588307842fe = Link-Budget, Signal-in-Space-Fehler, Leistungs- und Kohärenzanforderungen (LSIS-100 und folgende).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> lässt die Implementierung gegen die gedruckten Tabellen und Rechenbeispiele des Dokuments laufen (Zielwerte B1 bis B10 der <a1>Vorregistrierung</a1>) und gibt jeden mit seiner Anzahl und seinem Status aus. <c2/> beendet sich mit { "1" }, sofern nicht jeder Zielwert erreicht ist.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> liest einen Hard-Decision-Symbolstrom (Text aus <c2/> und <c3/>; Leerraum wird ignoriert) und prüft das Synchronisationsmuster, die SB1-Dekodierung, FID (nur { "0" } ist definiert), die TOI-Kontinuität (Fortschreiten um eins modulo { "100" }) und den Rahmenabstand ({ "6000" } Symbole). Bei jedem Problem endet es mit { "1" }.

# text
# c1: generate
seg-f12425044025 = <c1/> schreibt einen Teststrom: das Synchronisationsmuster des Dokuments, SB1- und Rahmenlängen, mit <b>Platzhalter</b>-Unterrahmen { "2" } bis { "4" } (die alternierende Füllung von LSIS-300, nicht LDPC-kodiert, keine Nachricht). Es sind Symbole zum Testen eines Prüfers oder eines Dekoders, keine Wellenform; Kshana schreibt kein Signal.

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: lunanet_afs_check
# c5: mode
# c6: /kshana-lunanet-afs-check
seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: dieselben Namen. MCP: <c4/> (<c5/> spec, symbols oder generate). Plugin: <c6/>. Studio und JetBrains: N/A (<a1>SURFACES.md</a1>).

# text
# c1: xval/lunanet-afs/PREREGISTRATION.md
# c2: tests/lunanet_afs_codes.rs
seg-2133870991ca = In <c1/> festgelegte Zielwerte, bevor der Generator existierte; Tests in <c2/>.

# text
seg-b74d5800a039 = Zielwert

# text
seg-e75915599d5e = AFS-I erste und letzte { "24" } Chips, { "210" } PRNs

# text
seg-f654db18922f = <b>MET</b>, { "420" } von { "420" }

# text
seg-55d0d7168ceb = der gedruckte G2-Anfangszustand ist der Zustand nach der gedruckten Verzögerung

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } von { "210" }: Die Behauptung hatte die Richtung falsch. Nachträglich (B1c, nicht vorregistriert): Der gedruckte Zustand ist der Zustand nach { "2047" } minus der Verzögerung, { "210" } von { "210" }

# text
seg-b94947c99f9a = Legendre({ "10223" }) entspricht Tabelle D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q primär erste und letzte { "24" } Chips, { "210" } PRNs

# text
seg-678604d6e463 = Legendre({ "1499" }) entspricht Tabelle E-1 und tertiär erste und letzte { "24" } Chips, { "210" } PRNs

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } von { "421" }: Die Legendre-Folge stimmt überein, und { "419" } von { "420" } Codespalten stimmen überein. Die letzten { "24" } für PRN { "147" } gedruckten Chips (<c1/>) sind derselbe Wert, der für PRN { "151" } gedruckt ist, dessen Code der Generator reproduziert; zwei verschiedene Weil-Indizes ({ "607" } und { "612" }) ergeben nicht dieselben letzten { "24" } Chips, daher ist der Eintrag für PRN { "147" } höchstwahrscheinlich ein Druckfehler im Dokument. Ohne die separate Code-Datei von Annex { "3" } lässt sich das nicht klären. Durch einen Test festgeschrieben

# text
seg-aea9620e7bf1 = Sekundärcodes S0 bis S3 entsprechen Tabelle { "10" }

# text
seg-2996e986d247 = <b>MET</b> (die eigenen Konstanten des Dokuments)

# text
seg-23c9277f62e6 = SB1-Rechenbeispiel aus Abbildung { "8" }

# text
seg-fb70493dcdcf = <b>MET</b>: 0x045 wird zu 0x229F61DBB84A0 kodiert und zu FID { "0" }, TOI { "69" } dekodiert (ein Beispiel)

# text
# c1: 123456789
seg-acce07c33dec = CRC-24Q-Prüfwert für <c1/>

# text
seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (der Katalogwert, außerhalb der Spezifikation)

# text
seg-789b31d53873 = Rahmenarithmetik

# text
seg-5b5da00ad1c8 = Interleaving, dann De-Interleaving

# text
seg-80f9cd313ec4 = <b>MET</b> (eine Eigenschaft, MODELLED)

# text
seg-92a7addfdb8c = Synchronisationsmuster

# text
seg-215913f74706 = <b>MET</b> ({ "68" } Symbole; eine Transkriptionsprüfung)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 bis B4 sind VALIDATED gegen die gedruckten Tabellen der zitierten Ausgabe, die das Dokument mit { "{" }LSIS-TBC{ "}" } kennzeichnet. Ein Rundlauf Szene–Erfassung–Verfolgung beider Komponenten erfüllt dieselben Zielwerte wie die anderen Signale (<c1/>).

# text
seg-9edb6e5771ca = <s1>Zurück</s1>Galileo-OSNMA-Verifikation

# text
seg-d0043d0f578a = <s1>Weiter</s1>Jammertest als Schiedsrichter

# text
seg-52946c9ff62a = Was nicht implementiert ist

# text
seg-339c9eeb510b = kshana lunanet-afs-check
