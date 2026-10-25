# docs--reproducibility: translations (de)

# text
seg-03cb5fb3dd8f = Ja

# text
seg-a7d5633dbcc0 = Reproduzierbarkeit & Herkunft

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Quelle: <c1/>

# text
seg-1c48a3edda84 = Kshana ist so gebaut, dass es reproduzierbar ist: Dieselben Eingaben ergeben dieselben Ergebnisse, und die Build-Artefakte lassen sich auf die Quelle zurückführen, die sie erzeugt hat. Dieses Dokument legt genau dar, was garantiert wird, was nicht, und wie die Garantien durchgesetzt werden.

# text
seg-95b0eba44abe = Determinismus-Garantien

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = Die Engine hat keine Wanduhr, keine Abhängigkeit vom Ausführungs-Thread und keine ungesäte Zufälligkeit. Jeder stochastische Prozess wird von einem Strom <c1/> getrieben, der durch den <c2/> des Szenarios bestimmt und in fester Reihenfolge gezogen wird. Folgen:

# text
seg-14df30025491 = Eigenschaft

# text
seg-f0badf8cb640 = Garantiert

# text
seg-9f6678ac42f5 = Durchgesetzt durch

# text
# c1: result.json
seg-cfc934af2c75 = Dasselbe Szenario, dieselbe Maschine → byteidentisches <c1/>

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (führt das Referenzszenario zweimal aus und vergleicht den SHA-256 (SHA: Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Dasselbe Szenario → identische Gütemaße Feld für Feld

# text
seg-bdeaf344acf8 = Ja, je Plattform

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> legt jedes Gütemaß (FoM) für die vier Referenzszenarien fest

# text
# c1: scenario_hash
seg-f7c5427c88f9 = Der Hash der Szenarioeingabe (<c1/>) ist plattformunabhängig

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = inhaltsadressierter SHA-256 des kanonischen Szenarios, festgelegt in <c1/>

# text
seg-45861afe0994 = Eingabe-Fingerabdruck + Ausgabe-<b>Struktur</b> identisch über Betriebssysteme (OS) hinweg

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> legt je Szenario einen exakten SHA-256 fest (zehn Szenarien, je eine Datei <c2/> in <c3/>), geprüft auf der CI-Matrix (kontinuierliche Integration) mit 3 Betriebssystemen

# text
seg-e54b5ff80782 = Ausgabe-<b>Werte</b> stimmen über Betriebssysteme hinweg überein (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Ja, bis auf { "1e-6" }

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = der CI-Job <c1/> führt <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) und <c4/> auf allen drei Betriebssystemen aus

# text
seg-3876618cc821 = Ein Frame einer Navigationsnachricht für niedrige Erdumlaufbahnen (LEO) hat auf jeder Plattform und in jedem Build-Profil dieselben Bytes, den WebAssembly-(WASM-)Build eingeschlossen

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (jede transzendente Funktion und jede Normalabweichung der Art <c2/> läuft über das reine Rust-Crate <c3/>); <c4/> legt einen ganzen Frame ohne Plattformschranke fest

# text
seg-69750a5db756 = Gesäte Indexziehungen (Bootstrap-Resampling, Mischungen) sind auf 32-Bit- und 64-Bit-Zielen gleich

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> zieht immer als <c2/>; festgelegt in <c3/>

# text
seg-e42899fd8a4e = Überall dieselbe Toolchain

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> legt den Kanal fest; <c2/> lässt den Build bei Abweichung scheitern; CI und Release legen dieselbe Version fest

# text
seg-b0a3fd993614 = Derselbe Abhängigkeitssatz

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> ist eingecheckt, und <c2/> wird für die SBOM (Software-Stückliste) verwendet

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Jeder Befehlszeilenlauf schreibt außerdem einen Reproduzierbarkeitsnachweis in seinen Bericht (<c1/> und <c2/>): die Engine-Version, den SHA-256 der Szenariodatei und des Ergebnisdokuments, den Seed, die Plattform und den genauen Befehl, den <c3/> erneut ausführt, bis zu einem byteidentischen Ergebnis. Der Bericht selbst ist eine reine Funktion des Laufs: Zwei Läufe von <c4/> schreiben dasselbe <c5/> Byte für Byte. Siehe <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = Der plattformübergreifende Vorbehalt (und wie die Goldens damit umgehen)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Die numerischen Ergebnisse sind <b>auf einer gegebenen Plattform bitidentisch</b>, können sich aber <b>zwischen</b> Plattformen in den letzten Einheiten der letzten Stelle (ULP) unterscheiden. Die Ursache ist die Mathematikbibliothek der Plattform: <c1/>, <c2/>, <c3/> und Verwandte müssen nach IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) nicht korrekt gerundet sein, sodass Linux (glibc, die GNU-C-Bibliothek), macOS und Windows jeweils ein anderes letztes Bit liefern können. Über einen langen Lauf summieren sich diese Unterschiede von ~{ "1e-16" } auf vielleicht ~{ "1e-12" } relativ.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Zwei Dinge machen diesen Unterschied in der letzten Stelle größer, als er anfangs ist, und beide sind gemessen statt angenommen. Ein <b>adaptiver Integrator</b> wählt seinen nächsten Schritt aus der Fehlerschätzung über eine fünfte Wurzel, sodass eine Einheit in der letzten Stelle die Schrittfolge ändert und die beiden Plattformen dann nur noch bis auf die Integrationstoleranz übereinstimmen. Ein <b>iterativer Schätzer</b> (eine Kleinste-Quadrate-Anpassung, ein Filter zur Bahnbestimmung) kann einen anderen Weg zur Konvergenz nehmen. Auf beidem aufgebaute Arten können sich zwischen Plattformen in einzelnen Feldern um mehr als { "1e-6" } unterscheiden; <c1/> hält dasselbe Regime für die Unit-Tests fest.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = Das <b>Build-Profil</b> spielt auf einer Maschine auf dieselbe Weise eine Rolle. Ein optimierter Build auf macOS fasst einen Sinus und einen Kosinus desselben Arguments zu einem einzigen Aufruf der kombinierten Routine des Systems zusammen, deren Sinus sich vom alleinstehenden <c1/> im letzten Bit bei { "379" } von { "200 000" } Argumenten unterscheidet; ein nicht optimierter Build macht die beiden Aufrufe. Gemessen auf aarch64-macOS über die { "138" } Szenariodateien liefern ein Debug- und ein Release-Build derselben Quelle bei { "102" } byteidentische Ergebnisdokumente. Die übrigen { "36" } unterscheiden sich in den letzten Stellen: { "28" } innerhalb von { "1e-6" }, eines (<c2/>) um { "2.8e-6" } und sieben Kampagnen nur in den Digests ihrer Mitgliedsläufe; keines unterscheidet sich in einer Kennzeichnung, einer Zahl oder einem Urteil. Die obige Garantie der Byteidentität gilt daher für einen Build: dieselbe Binärdatei zweimal.

# text
seg-ff368c627bd2 = Die gesäten <b>Normalziehungen</b> sind eine dritte, viel seltenere Quelle: Der Sampler ruft in seinen seltenen Zweigen die Exponential- und Logarithmusfunktion des Hosts auf, und etwa eine von einer Million Ziehungen unterscheidet sich zwischen dem nativen und dem WASM-Build im letzten Bit.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Wo eine Ausgabe <b>diskret</b> ist, ist ein Unterschied in der letzten Stelle überhaupt nicht akzeptabel, und die Art wird stattdessen mit <c1/> statt mit der Host-Bibliothek berechnet. Die Art <c2/> ist die erste: Ihr binärer Frame besteht aus übertragenen Ganzzahlen, und dasselbe Szenario wurde einmal zu drei verschiedenen Frames kodiert: in einem Release-Build, in einem Debug-Build derselben Quelle und im Browser. Jetzt sind es in allen dreien dieselben Bytes.

# text
seg-1746a0ea22fe = Deshalb legen die Golden-Tests <b>keinen</b> einzelnen plattformübergreifenden Hash der Gleitkommaausgabe fest — das wäre fragil und würde ehrlich korrekte Builds auf einem anderen Betriebssystem scheitern lassen. Stattdessen:

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> legt jedes Gütemaß mit einer relativen Toleranz von <c2/> fest — vier Größenordnungen enger als jede echte Regression (die einen Wert um ganze Prozent verschiebt), aber weit lockerer als das Jitter der Mathematikbibliothek (libm) zwischen Plattformen. Gitterbegrenzte Felder (Holdover-Sekunden) und Felder mit exakt null werden exakt festgelegt.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b> — ein Inhalts-Hash der <em>Eingaben</em> — ist plattformunabhängig und wird exakt festgelegt.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> legt einen exakten SHA-256 fest, je Szenario in <c2/> eingecheckt, über die Projektion, die über Plattformen hinweg identisch <em>ist</em>: den Eingabe-Fingerabdruck plus die Ausgabe-<b>Struktur</b> (Feldnamen, Verschachtelung, Blatttypen, Array-Längen — festgelegt durch deterministische Gitterarithmetik, nie die Gleitkommawerte). Das fängt strukturelle Regressionen exakt ab, während die obigen Toleranzfestlegungen Wertregressionen abfangen.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> erzwingt byteidentische Ausgabe über zwei Läufe <em>auf derselben Maschine</em> (die Determinismus-Garantie).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>Der CI-Job <c1/></b> führt die vier obigen Tests (<c2/>, <c3/>, <c4/>, <c5/>) auf <b>ubuntu-latest, macos-latest und windows-latest</b> aus, sodass die plattformübergreifende Reproduzierbarkeit bei jedem Push festgestellt wird — die Struktur-/Eingabe-Goldens exakt, die Numerik bis auf { "1e-6" } und die SGP4-Zustände (Simplified General Perturbations { "4" }) bis auf { "2e-5" } km — statt sich auf ein einziges Betriebssystem zu verlassen.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Wenn Sie die festgelegten Zahlen neu erzeugen müssen (z. B. nach einer beabsichtigten Modelländerung), führen Sie jedes Referenzszenario aus und kopieren Sie die ausgegebenen Gütemaßwerte in <c1/>, und vermerken Sie die Änderung dann in <c2/>.

# text
seg-9310a7af7ff8 = Software-Stückliste (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> gibt eine SBOM im Format CycloneDX { "1.5" } aus, die jedes Crate auflistet, das in einem Kshana-Artefakt ausgeliefert wird, mit seiner genauen Version, Quelle und Lizenz. Es ist ein abhängigkeitsfreier Generator auf Basis von <c2/> (er funktioniert also allein mit der Toolchain) und durchläuft den Auflösungsgraphen vom Paket kshana aus nur über normale und Build-Abhängigkeiten. Entwicklungsabhängigkeiten (reine Test-Crates wie <c3/>) sind ausgeschlossen, weil kein Artefakt sie enthält.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = Der Graph ist die Vereinigung der Feature-Mengen, mit denen die ausgelieferten Artefakte gebaut werden: der Standard-Build (Bibliothek und CLI, Befehlszeilenschnittstelle), <c1/> (das PyPI-Wheel, Python Package Index, dessen Kette <c2/> seine Fremdfunktionsgrenze ist) und <c3/> (das npm-Paket, das dieselbe SBOM in seinem Tarball mitführt). Plattformbedingte Abhängigkeiten für jedes Ziel sind eingeschlossen, da die Wheels für mehrere Betriebssysteme ausgeliefert werden und das npm-Paket auf WebAssembly zielt. Ein Dokument deckt alle drei Artefakte ab, daher ist es für jedes einzelne eine Obermenge. Derzeit listet es { "107" } Komponenten auf; die Zahl ist in <c4/> festgelegt. Der eigenständige Server <c5/> hat sein eigenes Manifest und wird von dieser SBOM nicht beschrieben.

# text
seg-4c8948e9ee7d = Die Ausgabe ist deterministisch — derselbe Abhängigkeitssatz ergibt ein byteidentisches Dokument, einschließlich einer Seriennummer, die aus der sortierten Paketliste statt aus einem Zeitstempel abgeleitet wird.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = Der Release-Workflow erzeugt die SBOM (<c1/>) und hängt sie an jedes getaggte Release an; der Publish-Workflow liefert sie außerdem neben den PyPI-Wheels und im npm-Paket aus.

# text
seg-928c3c0108a1 = Build-Herkunft

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = Der Release-Workflow erzeugt eine SLSA-Attestierung (Supply-chain Levels for Software Artifacts) der Build-Herkunft (<c1/>), die jede Datei abdeckt, die er an das GitHub-Release anhängt: die Befehlszeilen-Binärdateien für jede Plattform, die Server-Binärdatei <c2/>, die SBOM, die Validierungszusammenfassung und <c3/>. Ein Konsument kann mit <c4/> prüfen, dass die Artefakte vom Release-Workflow dieses Repositorys aus dieser Quelle gebaut wurden — und so die Lücke zwischen „hier ist eine Binärdatei“ und „hier ist eine Binärdatei, die ich auf ihre Quelle zurückführen kann“ schließen. Zum Beispiel für die SBOM von { "v0.28.0" }:

# text
seg-06515d230d33 = <s1>Zurück</s1>Herkunft

# text
seg-c6dba4e40c76 = <s1>Weiter</s1>Fähigkeitenkarte
