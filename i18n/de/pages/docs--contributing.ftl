# docs--contributing: translations (de)

# text
seg-c3c260b7063e = Tests

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Quelle: <c1/>

# text
seg-3fa173b79e8f = Zu Kshana beitragen

# text
seg-c3a47c614836 = Danke für Ihr Interesse. Kshana will eine <b>neutrale, reproduzierbare, ehrlich validierte</b> Referenz für hybride Quanten-/klassische PNT sein. Beiträge werden an diesem Maßstab gemessen: Korrektheit, Zitate und Reproduzierbarkeit vor Breite.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = Wie das Projekt geführt wird — wer entscheidet, der technische Maßstab und die Grenze zwischen offen und geschlossen — ist in <a1><c1/></a1> dokumentiert.

# text
seg-cc8491af7a6f = Entwicklung

# text
seg-0163ccdfaa2b = Die optionalen Sprachanbindungen sind über Features gesteuert und standardmäßig aus (damit der obige Build und das Gate der Abhängigkeitsprüfung sie nie berühren). Um daran zu arbeiten:

# text
seg-edc8bbab6e92 = Vor jedem Commit — die schnelle Schleife

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Diese dauern Sekunden. Sie sind eine Teilmenge des Jobs <c2/> von <c1/>, in derselben Reihenfolge, ein Fehler hier ist also ein Fehler dort:

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>Reproduzierbarkeit ist eine harte Invariante.</b> Eine Änderung, die <c1/> nichtdeterministisch macht, ist ein Fehler. Zufall muss durch den geseedeten Zufallszahlengenerator fließen; Quanten- und klassische Läufe verwenden unabhängige, deterministisch abgeleitete Seeds.

# text
seg-66ea0748c10f = <b>Sauberkeit des Repositorys.</b> Commits und Inhalte dürfen keine Zusätze oder Fußzeilen zur Zuordnung zu automatisierten Werkzeugen tragen und dürfen nirgends in Inhalt, Dateinamen oder Verlauf einen KI-Assistenten als Autor nennen. Der Wächter erzwingt das.

# text
seg-fbf423f6fb31 = Bevor Sie pushen — das volle Gate

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> ist das kanonische Gate: Es führt <c2/> ungekürzt aus und dann <c3/>, um die Bibliothekssuite noch einige Male erneut auszuführen, weil ein Race durch Thread-Verschränkung in einem einzelnen Lauf unsichtbar ist. Nur bei Erfolg schreibt es <c4/> (nicht versioniert — Maschinenzustand über einen Lauf, kein Inhalt).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = Es ist absichtlich langsam — 62-79 Minuten im gesunden Dauerbetrieb, laut dem Kopf von <c1/>, der die aktuelle Zahl trägt — und es gibt kein Timeout, weil ein Timeout, das kurz genug wäre, um nützlich zu sein, einen gesunden Lauf abbrechen würde. Ein Lauf einer Teilmenge, der grün zurückkam, ist kein Gate: Beide Fehler, für die dieser Mechanismus existiert, sind auf diesem Weg durchgekommen.

# text
# c1: gate.sh
seg-408da9a8b8bb = Mitwirkende, die aus einem Fork arbeiten, brauchen den Receipt-Hook nicht — er ist ein lokales Gate der Maintainer, und <b>CI ist das, was einen Pull Request tatsächlich schützt</b>. <c1/> auszuführen, bevor Sie einen öffnen, bedeutet nur, dass CI Ihnen nichts sagt, was Sie nicht schon wussten.

# text
seg-9394727b21c3 = Ein Sensormodell hinzufügen oder ändern

# text
# c1: provenance
seg-d9c891ca6827 = <b>Jeder numerische Parameter braucht eine Herkunftsangabe.</b> Setzen Sie das Zitat in die <c1/>-Zeichenkette des Modells und in die Szenariodatei. Keine anonymen Konstanten.

# text
seg-d30cb836d4c4 = <b>Validieren Sie gegen die Standardbeziehung,</b> nicht nur gegen interne Konsistenz — z. B. Allan-Abweichung für Uhren, Groves' Fehlerwachstum der Koppelnavigation für Inertialsensoren, die Umrechnung von Zeit in Entfernung für die Zeitübertragung. Fügen Sie einen Test hinzu, dass die simulierte Ausgabe den veröffentlichten Wert bzw. den Wert der Beziehung innerhalb einer angegebenen Toleranz reproduziert.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Seien Sie ehrlich zum Reifegrad.</b> Das Statusregister ist <c1/> — ergänzen oder ändern Sie dort die Zeile, nennen Sie ihre externe Referenz (oder sagen Sie klar, dass es keine gibt, wodurch sie <c2/> wird), und erzeugen Sie dann die veröffentlichten Artefakte mit <c3/> neu. <c4/>, <c5/> und <c6/> werden alle aus dieser Funktion erzeugt und sagen aus gutem Grund „nicht von Hand bearbeiten“. Aktualisieren Sie auch die Beschreibung in <c7/>, wenn der Text es braucht, und kennzeichnen Sie Angaben, die Zielwerte oder Ergebnisse von Bodendemonstratoren sind, als solche.

# text
seg-34b9c8b6f70c = Testgetrieben: Schreiben Sie zuerst den fehlschlagenden Test, mit dem erwarteten Wert <b>von Hand hergeleitet</b> aus der Physik bzw. Beziehung, bevor Sie implementieren.

# text
seg-5322d5b2188c = Deterministische Tests prüfen exakte (von Hand hergeleitete) Werte; statistische Tests prüfen eine angegebene Toleranz und mitteln idealerweise über Seeds, um die Streuung zu beherrschen.

# text
seg-7f76a26c4d5f = Commits und Versionierung

# text
# c1: feat:
# c2: fix:
# c3: docs:
# c4: test:
# c5: chore:
seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

# text
seg-1a13616ca0ac = <b>Semantic Versioning.</b> Vor 1.0 kann sich das Schema für Szenario/Ergebnis ändern; brechende Änderungen sind hervorzuheben.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>Releases werden mit einem <c1/>-Tag erstellt, und die Veröffentlichung ist automatisch, aber geordnet.</b> Der Workflow Auto-tag setzt den Tag, sobald CI auf <c2/> bei einer Versionsanhebung grün ist. Der Workflow Release führt die vollständige Verifikation auf dem markierten Commit aus und veröffentlicht nur bei Erfolg in crates.io, dem Python Package Index (PyPI), npm, ghcr.io, der Registry des Model Context Protocol (MCP) und dem JetBrains Marketplace; danach prüft er, dass jeder Kanal die Version ausliefert, und baut kshana.dev aus dem Tag neu. Niemand führt <c3/> von Hand aus. Die Schritte und wie eine fehlgeschlagene Veröffentlichung wiederholt wird, stehen in <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Pflege des Changelogs (erforderlich)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Jede für Nutzer sichtbare Änderung aktualisiert <a1><c1/></a1>:

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Fügen Sie einen Eintrag im Abschnitt <b><c1/></b> in der passenden Gruppe hinzu (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Benennen Sie beim Release <c1/> in das neue <c2/> um, beginnen Sie einen neuen <c3/>, erhöhen Sie die <c4/> in <c5/> (damit <c6/> im Ergebnis-JSON übereinstimmt), aktualisieren Sie die Vergleichslinks unten und setzen Sie den Tag <c7/>.

# text
seg-ed680e59377c = Halten Sie Einträge knapp und aus Nutzersicht; verlinken Sie Issues/PRs, wo es nützlich ist.

# text
seg-fe83216ebeed = Ein Pull Request, der Verhalten ohne Changelog-Eintrag ändert, ist unvollständig.

# text
seg-776cd2ef0b0c = Exportkontrolle

# text
seg-d0f1db9798a6 = PNT-Resilienz und Quantensensorik können Exportkontrollen für Güter mit doppeltem Verwendungszweck berühren. Halten Sie das öffentliche Repository bei allgemeinen, veröffentlichten Modellen und Methoden. Alles, was nach exportsensibler Tiefe bei Resilienz/Anti-spoofing aussieht, gehört in das private Overlay, nicht hierher. Fragen Sie im Zweifel nach, bevor Sie es beitragen.

# text
seg-506a29aafc12 = Lizenz

# text
# c1: LICENSING.md
seg-c0409a1226ca = Kshana steht unter einer Doppellizenz (AGPL-3.0 <b>oder</b> eine kommerzielle Lizenz von Ashforde OÜ — siehe <a1><c1/></a1>). Damit das weiter funktioniert, müssen Beiträge unter <b>beiden</b> Lizenzen nutzbar sein. Mit Ihrem Beitrag erklären Sie sich daher einverstanden, dass:

# text
seg-da7b02ac890c = Ihr Beitrag eingehend unter der <b>AGPL-3.0-only</b> lizenziert wird; und

# text
seg-8d6ed0d3a17f = Sie <b>Ashforde OÜ außerdem</b> eine zeitlich unbegrenzte, weltweite, gebührenfreie, unwiderrufliche Lizenz gewähren, Ihren Beitrag zu nutzen, zu ändern und <b>als Teil der kommerziell lizenzierten Ausgabe von Kshana unter anderer Lizenz weiterzugeben</b> (d. h. ihn auch unter kommerziellen Bedingungen außerhalb der AGPL zu verbreiten). Sie behalten das Urheberrecht an Ihrem Beitrag.

# text
seg-3b1a0dd6b5aa = Diese schlanke Doppellizenz-Einräumung — keine Abtretung des Urheberrechts — ist es, die das Projekt offen halten <em>und</em> eine kommerzielle Ausgabe ermöglicht. Wenn Sie ({ "2" }) nicht gewähren können (zum Beispiel bei Code im Eigentum des Arbeitgebers), sagen Sie das in Ihrem Pull Request, bevor Sie beitragen.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Ausnahme: <c1/>.</b> Dieses Verzeichnis steht unter <b>GPL-3.0-or-later</b> (siehe dessen <c2/>) und liegt außerhalb der kommerziellen Lizenz. Beiträge dazu werden eingehend <b>nur</b> unter GPL-3.0-or-later lizenziert; die Einräumung ({ "2" }) gilt für sie nicht.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Zeichnen Sie jeden Commit ab, um das <a1>Developer Certificate of Origin</a1> zu bestätigen: <c1/> (fügt eine Zeile <c2/> hinzu).

# text
seg-9f86d8f58b17 = <s1>Zurück</s1>Sicherheit

# text
seg-fc760238e9a5 = <s1>Weiter</s1>Governance
