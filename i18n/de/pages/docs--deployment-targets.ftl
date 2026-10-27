# docs--deployment-targets: translations (de)

# text
seg-9c1e7fd8f838 = Wie

# text
seg-5ad814c7ef9e = Hinweise

# attr:aria-label, text
seg-9d3ee6a5613e = Läufe

# text
seg-3dc7d08f5729 = Python { "3.9" } oder neuer

# text
# c1: kshana
# c2: --features python
seg-b1f1009faa44 = das Wheel <c1/> auf PyPI (<c2/>)

# text
seg-45b4e1bd8b18 = Wheels für Linux, macOS und Windows, x86-64 und 64-Bit-ARM

# text
seg-79f04380d254 = MCP-Clients (KI-Agenten)

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
seg-4163955ed77a = der Server <c1/>: <c2/> oder das Container-Image

# text
seg-c5a32580b7bc = Image für linux/amd64 und linux/arm64

# text
seg-ec575e06d439 = Browser und JavaScript-Laufzeitumgebungen

# text
# c1: --features wasm
seg-a8238abc55bd = das WebAssembly-Paket auf npm (<c1/>)

# text
seg-c7789c7f4429 = dieselbe Engine, nach WebAssembly kompiliert

# text
seg-488c2b62d246 = Ein kleiner Rechner an Bord eines Boots, neben dem Empfänger

# text
# c1: deploy/reference-build/
# c2: kshana receiver-trust live
seg-69a58e13b706 = der Referenz-Build in <c1/>: <c2/> mit dem Gate, das an Signal K und, optional, an OpenCPN veröffentlicht

# text
# c1: MARINE-INTEGRATIONS.md
seg-df530583c13c = beratend, keine typzugelassene Navigationsausrüstung; vom Projekt nicht auf einem Schiff getestet; siehe <a1><c1/></a1>

# text
seg-cf83dbb55f99 = Signal-K-Server

# text
# c1: integrations/signalk/
seg-88ddbefb95dd = das Plugin in <c1/>

# text
seg-5f436c952149 = ausgeliefert und mit Unit-Tests an aufgezeichneter synthetischer Ausgabe getestet; nicht auf npm veröffentlicht

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-026115eafe9b = NMEA { "0183" } im Gate-Modus über TCP vom Monitor

# text
# c1: MARINE-INTEGRATIONS.md
seg-8e101a661cbc = optional; siehe <a1><c1/></a1>

# text
seg-cea294c412f0 = Nutzlastrechner der Linux-Klasse

# text
seg-bf74da1c1262 = das Rust-Crate oder die Binärdatei, quer kompiliert

# text
seg-868f121e5909 = Nutzlastrechner der OPS-SAT-Klasse und ähnliche

# text
seg-53c8be810679 = Edge-Knoten mit GPU, NPU oder FPGA neben einer Linux-CPU

# text
seg-70b2c22bf453 = auf der Linux-CPU

# text
seg-977842cb0f86 = Kshana nutzt keinen der Beschleuniger; es läuft neben ihnen

# text
seg-3e15446b6efb = Läuft nicht

# text
# c1: std
# c2: no_std
seg-205144220741 = <b>Ein Bare-Metal-Flug-MCU oder ein kleines RTOS ohne die Rust-Standardbibliothek.</b> Kshana ist durchgehend ein <c1/>-Crate: Es belegt Speicher auf dem Heap, liest Dateien, formatiert JSON und verwendet die Gleitkommafunktionen der Standardbibliothek. Es gibt keinen <c2/>-Build und kein Feature, das einen erzeugt.

# text
# c1: no_std
seg-46ccad7b96e8 = <b>Entscheidung: Wir bieten keinen <c1/>-Flugkern an.</b> Ihn zu bauen wäre ein eigenes Produkt mit eigenem Verifikationsaufwand, und es würde Kshana in die Flugsoftware bringen, wo die Qualifizierung ein eigenes Programm ist, für das wir keinen Weg haben.

# text
seg-63bc696bc66a = Was stattdessen zu tun ist

# text
# c1: slot-timing
seg-07fff123aed3 = <b>Kshana am Boden oder auf einem Nutzlastrechner ausführen und die Ergebnisse hochladen.</b> Die Art <c1/> liefert genau die Zahlen, die ein Flugrechner braucht: eine Fix-Kadenz, einen Verletzungszeitpunkt, eine Schutzgröße. Eine Tabelle davon umfasst wenige Bytes.

# text
# c1: SLOT-TIMING.md
seg-c2752c281cd3 = <b>Eine geschlossene Form portieren, wenn nur sie benötigt wird.</b> Die Holdover-Inversion ist eine kurze monotone Nullstellensuche über eine Polynomvarianz, mit ihren Gleichungen dokumentiert in <a1><c1/></a1>. Sie in Flugcode neu zu implementieren ist unkompliziert; von Kshana abgeleiteter Code bleibt unter der Lizenz von Kshana.

# text
seg-b484e9426ab0 = Ebenfalls außerhalb des Umfangs

# text
seg-7bcd90c9ef31 = Harte Echtzeitgarantien (Kshana belegt Speicher und macht keine Aussage zur Ausführungszeit im ungünstigsten Fall); die Flugqualifizierung von irgendetwas; sowie ein Synchronisationsprotokoll, ein Regler oder ein Routing-Stack. Kshana liefert die Nachweise zur Zeitgebung, gegen die diese Systeme entworfen werden. Es ist keines davon.

# text
seg-542e51fbb35a = <s1>Zurück</s1>JetBrains-Plugin

# text
seg-52a455f4c409 = <s1>Weiter</s1>Architektur

# text
# c1: docs/DEPLOYMENT-TARGETS.md
seg-e8eefc84e748 = Quelle: <c1/>

# text
seg-3e1eb98b38df = Wo Kshana läuft und wo nicht

# text
seg-1a203c4736f1 = Eine Abgrenzung des Umfangs, aufgeschrieben, damit niemand sie in einer Besprechung als Zusage entdeckt.

# text
seg-d6c92d17a3dd = Abkürzungen: CPU, Hauptprozessor; GPU, Grafikprozessor; NPU, neuronaler Prozessor; FPGA, im Feld programmierbare Gatteranordnung; MCU, Mikrocontroller; RTOS, Echtzeitbetriebssystem; OPS-SAT, das Satelliten-Softwarelabor der Europäischen Weltraumorganisation im Orbit; PyPI, der Python Package Index; MCP, das Model Context Protocol; AI, künstliche Intelligenz; JSON, JavaScript Object Notation.

# text
seg-9376bb5b192e = Ziel

# text
seg-95e7da118089 = Linux-, macOS- und Windows-Arbeitsplätze und -Server, x86-64 und 64-Bit-ARM

# text
# c1: kshana
seg-b6ef382a73ef = die Binärdatei <c1/> oder das Rust-Crate

# text
# c1: cargo install kshana
seg-b8af20715cea = Release-Binärdateien für Linux x86-64, macOS (Apple Silicon und Intel) und Windows x86-64; auf den anderen Zielen baut <c1/> es
