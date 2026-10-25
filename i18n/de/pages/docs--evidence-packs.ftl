# docs--evidence-packs: translations (de)

# text
seg-2247a2344710 = Bedeutung

# text
seg-ade1d7072512 = siehe unten

# text
# c1: docs/EVIDENCE-PACKS.md
seg-802d8b6f3afd = Quelle: <c1/>

# text
seg-710e7e630acb = Nachweispakete: ein signierter Bericht über ein GNSS-Vertrauensereignis

# text
seg-dbc796deac2a = <b>Ein Paket ist ein technischer Bericht, keine Rechtsauffassung.</b> Es hält fest, was die Kshana-Engine aus einem angegebenen Empfängerlog unter einer angegebenen Konfiguration berechnet hat, und lässt jeden prüfen, dass nichts darin nachträglich geändert wurde. Es sagt nicht, was ein Ereignis verursacht hat, wer verantwortlich war, ob eine Pflicht erfüllt wurde oder dass das Log zeigt, was der Empfänger tatsächlich empfangen hat. Das Manifest und die Zusammenfassung sagen beides.

# text
seg-d99cb540310c = Ein Nachweispaket dient einem Vorfallbericht, einem Versicherer oder der Frage einer Aufsichtsbehörde: „Was hat Ihr System zwischen diesen beiden Zeitpunkten über das GNSS-Signal gesagt, und können wir diesem Bericht vertrauen?"

# text
seg-2fa31fe443b4 = Ein Paket erstellen

# text
# c1: --lab-attestation lab.toml
# c2: HARDWARE-SAFETY.md
seg-983924cb2eea = Bei einem Paket aus einer Laborsitzung hält <c1/> die Angabe des Bedieners zum Aufbau (leitungsgebunden oder abgeschirmt, Dämpfung oder Gehäuse, was HF ausgesendet hat) im signierten Manifest fest; siehe <a1><c2/></a1>. Sie wird so festgehalten, wie sie angegeben wurde, und nie überprüft.

# text
# c1: --from
# c2: --to
# c3: --out
# c4: --created-utc
# c5: 2026-01-02T03:04:05Z
# c6: none
seg-f01e59c876a3 = <c1/> und <c2/> sind Sekunden seit der ersten Epoche des Logs oder eine ISO-8601-UTC-Zeit, wenn das Log seine eigene Startzeit angibt. <c3/> darf nicht bereits Dateien enthalten. <c4/> nimmt eine echte UTC-Zeit wie <c5/> (alles andere wird abgelehnt) oder <c6/> entgegen, wodurch die Erstellungszeit entfällt und das Paket Byte für Byte reproduzierbar wird. Die Erstellungszeit ist, was der Signierende angibt; nichts prüft sie gegen eine Uhr, wofür das optionale Zeitstempel-Token da ist.

# text
# c1: keygen
# c2: kshana
# c3: .gitignore
# c4: *.evidence-key
seg-c72ddd97ad0b = Die Schlüsseldatei enthält einen 32-Byte-Ed25519-Seed als { "64" } Hexziffern; geben Sie Ihren eigenen an (zum Beispiel einen, der in Ihrem Schlüsselverwaltungssystem liegt) oder lassen Sie <c1/> einen erzeugen. <c2/> warnt, wenn die Datei für andere Benutzer lesbar ist. <c3/> schließt <c4/> aus; benennen Sie Ihren Schlüssel so, wenn er in einem Checkout liegt.

# text
seg-077cbd944c5d = Was in einem Paket enthalten ist

# attr:alt
seg-7cf2608b2b2f = Der Aufbau eines Nachweispakets. Ein Empfängerlog (NMEA, u-blox UBX, RINEX { "3" } oder ein Android-Log) und ein Zeitfenster gehen in kshana receiver-trust evidence ein, das sieben Dateien schreibt: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig und eine optionale timestamp.tsr. Das Manifest hält den SHA-256 des gesamten Logs und jeder Datei sowie eine Hash-Kette über die Dateien fest; die Signatur deckt das Manifest ab. kshana evidence verify prüft die Signatur, den Hash jeder Datei, die Kette und dass keine nicht aufgeführte Datei vorhanden ist, und beendet sich mit { "0" }, wenn verifiziert, mit { "1" }, wenn etwas fehlgeschlagen ist, und mit { "3" }, wenn der Signierende nicht gepinnt war. Ein Paket ist ein technischer Bericht, keine Rechtsauffassung.

# text
seg-e305279d5b11 = Inhalt

# text
seg-05107c0bd3c8 = die rohen Bytes des Empfängerlogs für das Zeitfenster

# text
# c1: geometry_model
# c2: [geometry]
seg-b19ce12544a5 = das Szenario, wie es ausgeführt wurde (jede Monitorschwelle, jedes Ereignis und jede Vergleichsregel), die ausgeführten Monitore, die Kalibrierungsbasislinie und der Szenario-Hash; bei einem Schiff außerdem die Hinweisaussage, die jede Schiffsausgabe trägt (beratende Software, keine typzugelassene Navigationsausrüstung); ab { "0.36" } das <c1/> (die tatsächlich verwendete Tabelle <c2/>, das Gewicht des Geometrie-Monitors, jede Herkunft und die Klassenregeln). Verzeichnisnamen und eingebettete Nutzdaten werden entfernt.

# text
# c1: geometry
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
seg-e3c2457161bc = jede Epoche im Zeitfenster mit den Statistiken der Engine, den Alarmen (den Gründen) und dem Vertrauenszustand; ab { "0.36" } außerdem ihre Satelliten-<c1/> (gut, herabgesetzt mit Gründen oder unbekannt, wo das Log keine Satellitengeometrie enthält) und eine <c2/> für jede Schlussfolgerung (<c3/>, <c4/>, <c5/>)

# text
seg-2e309765271f = eine eigenständige, skriptfreie Zusammenfassung: Identifikation, Hashes, Ergebnisse, Gründe, eine Geometriespur (Epochen nach Geometriestatus), getrennt von den Klassen der Schlussfolgerungen ({ "0.36" }), jede Schwelle, die Tabelle je Epoche und die Grenzen des Berichts

# text
seg-467277f816d2 = Engine-Version, Zeitfenster, Erstellungszeit, Format und Name des Logs, <b>der SHA-256 des vollständigen Logs</b>, Bereich und SHA-256 des Ausschnitts, der öffentliche Schlüssel und Fingerabdruck des Signierenden, Größe und SHA-256 jeder Datei sowie eine Hash-Kette über die Dateien

# text
# c1: manifest.json
seg-7a92ff70ed7f = Ed25519-Signatur über die exakten Bytes von <c1/>

# text
seg-b517814b077d = optionales RFC-{ "3161" }-Zeitstempel-Token

# text
# c1: byte-range
# c2: whole-log
seg-6ad4c5f3afbe = <b>Log-Ausschnitt.</b> Der Reader meldet den Quell-Byte-Bereich jeder Epoche, sodass der Ausschnitt der kleinste Byte-Bereich ist, der jede Epoche im Zeitfenster enthält (<c1/>): NMEA, u-blox UBX, RINEX-{ "3" }-Beobachtungen und Android-Logs. Er wird als rohe Bytes gehasht, nie als dekodierter Text. Bei einem Live-Feed oder RINEX { "2" } gibt es keinen Bereich; dann wird das ganze Log gebündelt, und das Manifest sagt <c2/> (das Zeitfenster begrenzt, welche Epochen gemeldet werden, nicht welche Bytes enthalten sind). Die Zusammenfassung gibt an, welcher Fall zutrifft. Ein Ausschnitt ist ein Bericht über die Bytes des Zeitfensters, kein eigenständiges Log: Ein RINEX-Ausschnitt hat zum Beispiel keinen Dateikopf.

# text
# c1: link₀ = SHA-256("kshana- evidence-chain/1")
# c2: linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖ name)
# c3: chain_head
seg-c4c81cbd4981 = <b>Hash-Kette.</b> Das Manifest führt die Dateien in fester Reihenfolge auf. <c1/>; für jede Datei <c2/> (Länge als { "4" } Bytes, Big-Endian). Das letzte Glied ist <c3/>. Das Umsortieren, Entfernen oder Ersetzen einer Datei ändert die Kette; die Signatur deckt die Kette ab.

# text
seg-1147c5b0d348 = Ein Paket verifizieren

# text
seg-e716ddf7bcc9 = Exit-Status { "0" } bedeutet verifiziert; { "1" } bedeutet, dass etwas fehlgeschlagen ist; { "2" } bedeutet einen Aufruffehler; { "3" } bedeutet, dass das Paket intakt ist, sein Signierender aber nicht gepinnt war (siehe unten). Jede Prüfung meldet bestanden, fehlgeschlagen oder übersprungen, und jeder Fehler wird benannt:

# text
seg-f6f2cebd9cb0 = Fehlercode

# text
seg-312a5d784f42 = das Manifest kann nicht gelesen werden

# text
# c1: manifest.json
seg-6f1b5d9d6711 = keine Signatur, keine 64-Byte-Signatur in Kleinbuchstaben-Hex, oder sie verifiziert nicht über <c1/>

# text
seg-129b78f142f1 = der Schlüssel ist ungültig oder weicht von dem ab, den Sie angegeben haben

# text
seg-c86b25543d55 = eine aufgeführte Datei fehlt oder weicht vom Manifest ab; die Datei wird benannt

# text
seg-f98d26abf045 = eine Datei ist im Paket, aber nicht im Manifest

# text
seg-842bac6a9e69 = ein Glied entspricht nicht dem, was seine Eingaben ergeben; die Datei wird benannt

# text
# c1: epochs.json
seg-413034467a64 = das Manifest widerspricht sich selbst oder <c1/>

# text
# c1: --log
seg-ef4bfbedca33 = mit <c1/>: Das Log, das Sie haben, ist nicht das festgehaltene, oder der Ausschnitt ist nicht dieser Bereich davon

# text
seg-dcd686ac77f7 = Die Änderung eines einzigen Bytes in einer beliebigen Datei lässt die Verifikation mit dem passenden Grund fehlschlagen: Ein geändertes Artefakt wird als Hash-Abweichung dieser Datei gemeldet und sonst nichts; ein geändertes Manifest lässt die Signatur fehlschlagen. Das erneute Berechnen von Hashes und Kette nach dem Bearbeiten einer Datei hilft ohne den Signierschlüssel nicht; dann schlägt nur die Signatur fehl.

# text
# c1: --pubkey
# c2: --allow-unpinned
# c3: --pubkey
# c4: .pub
seg-066fe7c07bf6 = <b>Den Schlüssel pinnen.</b> Ohne <c1/> beweist ein Paket nur, dass es gegenüber dem Schlüssel intakt ist, den es selbst nennt und den jeder erzeugen kann. Die Verifikation beendet sich dann mit { "3" } und sagt „INTACT, BUT THE SIGNER IS NOT PINNED" statt „VERIFIED"; <c2/> akzeptiert den eigenen Schlüssel des Pakets wissentlich und gibt „VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)" aus. Beziehen Sie den öffentlichen Schlüssel des Signierenden auf einem vertrauenswürdigen Weg vom Signierenden (nicht aus dem Paket) und übergeben Sie ihn mit <c3/>: { "64" } Hexziffern oder die Datei <c4/>. Die versehentliche Übergabe des privaten Schlüssels wird erkannt und abgelehnt. Der Fingerabdruck (die ersten { "128" } Bit des SHA-256 des Schlüssels, { "32" } Hexziffern) wird zum Vergleich von Auge ausgegeben; den vollständigen Schlüssel zu pinnen ist der verlässliche Weg.

# text
seg-a01c7ba606c9 = Paketformat und Verifikationsverfahren (normativ)

# text
seg-fa43e16b6aba = Dieser Abschnitt ist die Spezifikation, nach der ein unabhängiger Verifizierer geschrieben wird. Wörter in Großbuchstaben sind Anforderungen. Ein Paket ist ein Verzeichnis (oder eine beliebige Abbildung von Dateiname auf Bytes) aus Dateien, die genau wie unten benannt sind; ein Verifizierer arbeitet mit den Bytes jeder Datei, wie sie gespeichert sind, und serialisiert nie etwas neu.

# text
# c1: log-slice.bin
# c2: config.json
# c3: epochs.json
# c4: summary.html
# c5: manifest.json
# c6: manifest.sig
# c7: timestamp.tsr
seg-1fbabb3f1092 = <b>Dateien.</b> Die Artefaktdateien sind in dieser festen Reihenfolge <c1/>, <c2/>, <c3/>, <c4/>. Ein Paket hat außerdem <c5/> und <c6/> und KANN <c7/> haben. Jeder andere Name ist eine <em>nicht aufgeführte Datei</em>.

# text
# c1: 0-9a-f
seg-3ed6e38ad2ee = <b>Hex.</b> Jede Hex-Zeichenfolge besteht ausschließlich aus Kleinbuchstaben <c1/> und enthält keine Leerzeichen; Großbuchstaben werden nicht akzeptiert. SHA-256-Werte haben { "64" } Ziffern, der öffentliche Schlüssel hat { "64" } Ziffern, die Signatur hat { "128" } Ziffern.

# text
# c1: manifest.sig
# c2: manifest.json
# c3: \n
seg-6609210d003a = <b><c1/>.</b> Das Kleinbuchstaben-Hex mit 128 Ziffern der 64-Byte-Ed25519-Signatur (RFC { "8032" }, das reine Ed25519-Verfahren) über die exakten Bytes von <c2/>, gefolgt von genau einem <c3/> und sonst nichts. Die Signatur MUSS strikt geprüft werden: Eine Signatur, deren S-Wert nicht kleiner als die Gruppenordnung L ist, ist ungültig.

# text
# c1: manifest.json
seg-b163e9f5db66 = <b><c1/>.</b> Ein UTF-8-JSON-Objekt. Seine Member (ein Verifizierer MUSS jeden mit dem angegebenen JSON-Typ finden; zusätzliche Member werden ignoriert):

# text
seg-ace92bcbfd8a = Member

# text
seg-04f69a0edb2f = Typ

# text
seg-45425f378b61 = Bedeutung

# text
seg-6940543aa3c0 = Zeichenfolge

# text
# c1: kshana-evidence/1
seg-48d303baac62 = MUSS <c1/> entsprechen

# text
seg-6e57561e7f01 = beschreibend

# text
seg-abec93a4a488 = Zeichenfolge oder null

# text
seg-7d059c0b6372 = Erstellungszeit, beschreibend

# text
# c1: {from_s, to_s}
seg-507d53a53380 = Objekt <c1/>

# text
seg-bb2bcbbf404a = Zahlen, Sekunden

# text
seg-64572c65426f = nichtnegative ganze Zahl

# text
# c1: epochs.json
seg-14d421e391dd = die Anzahl der Einträge des JSON-Arrays in <c1/>

# text
seg-f5e7215e6835 = Objekt

# text
# c1: format
# c2: file_name
# c3: full_sha256
# c4: full_bytes
# c5: start_label
# c6: slice
seg-a4117217030c = <c1/> Zeichenfolge, <c2/> Zeichenfolge, <c3/> Hex, <c4/> nichtnegative ganze Zahl, <c5/> Zeichenfolge oder null und <c6/>

# text
# c1: kind
# c2: byte-range
# c3: whole-log
# c4: start
# c5: end
# c6: sha256
seg-02389e71a339 = <c1/> (genau <c2/> oder <c3/>; jeder andere Wert macht das Manifest fehlerhaft), <c4/> und <c5/> nichtnegative ganze Zahlen (Byte-Offsets, Ende exklusiv), <c6/> Hex

# text
# c1: algorithm
# c2: ed25519
# c3: public_key
# c4: fingerprint
seg-6c9176965aae = <c1/> Zeichenfolge (<c2/>), <c3/> Hex ({ "32" } Bytes), <c4/> Zeichenfolge

# text
seg-dcba59304030 = Array von Objekten

# text
# c1: name
# c2: role
# c3: bytes
# c4: sha256
# c5: link
seg-e42ed5e07430 = eines je Artefaktdatei, in der festen Reihenfolge: <c1/> Zeichenfolge, <c2/> Zeichenfolge, <c3/> nichtnegative ganze Zahl, <c4/> Hex, <c5/> Hex

# text
seg-b79c9500b744 = Hex

# text
seg-697592bd3757 = das letzte Glied

# text
seg-9da5d92757bd = Objekt, optional

# text
# c1: --lab-attestation
# c2: operator
# c3: organisation
# c4: date
# c5: setup
# c6: conducted
# c7: shielded
# c8: attenuation_db
# c9: enclosure
# c10: emitter
# c11: statement
# c12: signature
seg-2032c208038d = nur in einem Paket aus einer Laborsitzung vorhanden (<c1/>): die Angabe des Bedieners <c2/>, <c3/>, <c4/>, <c5/> (<c6/> oder <c7/>), <c8/> oder <c9/>, <c10/>, <c11/> und optional <c12/>, festgehalten wie angegeben. Sie wird von der Manifest-Signatur abgedeckt und nie verifiziert; ein Verifizierer meldet sie als „attested by the named operator; not verified by Kshana". Sonst fehlt sie, und ein Paket ohne sie bleibt unverändert

# text
# c1: signer.fingerprint
seg-9411be425a80 = <c1/> sind die ersten { "32" } Hexziffern des SHA-256 über die { "32" } Bytes des öffentlichen Schlüssels.

# text
seg-80e55f2d3496 = Hash-Kette.

# text
# c1: link0
# c2: kshana-evidence-chain/1
# c3: link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file) (32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )
# c4: SHA-256(file)
# c5: sha256
seg-9346fe50efac = <c1/> ist der SHA-256 der { "23" } ASCII-Bytes <c2/>. Für jedes Artefakt der Reihe nach <c3/>, wobei <c4/> dem im Manifest festgehaltenen <c5/> für dieses Artefakt entnommen wird (die Kette ist also eine Eigenschaft des Manifests und wird gegen dieses geprüft, nicht gegen die Dateien).

# text
# c1: code
# c2: name
# c3: pin
seg-9dd985d8cb03 = <b>Verfahren.</b> Ein Verifizierer führt diese Schritte der Reihe nach aus und sammelt jeden Fehler; das Ergebnis ist die <em>Menge</em> der Fehler, jeweils ein <c1/> und, wo angegeben, die Datei <c2/>. Er DARF NICHT beim ersten Fehler anhalten, außer wo angegeben. <c3/> ist der öffentliche Schlüssel, dem der Verifizierer laut Vorgabe vertrauen soll, falls es einen gibt.

# text
# c1: manifest.json
# c2: manifest-missing
seg-abb1d2635143 = Kein <c1/>: Fehler <c2/>; anhalten.

# text
# c1: manifest.json
# c2: artifacts
# c3: log.slice
# c4: manifest-malformed
# c5: format
# c6: unsupported-format
seg-73a4aeb463e8 = Wenn <c1/> kein JSON-Objekt mit jedem oben genannten Member in den angegebenen Typen ist (einschließlich <c2/>-Einträgen mit jedem Member und <c3/>): Fehler <c4/>. Andernfalls, wenn <c5/> nicht der oben genannte Wert ist: <c6/>.

# text
# c1: signer.public_key
# c2: public-key-malformed
# c3: signer.fingerprint
# c4: public-key-malformed
# c5: pin
# c6: public-key-mismatch
# c7: pin
# c8: pin
# c9: manifest.sig
# c10: signature-missing
# c11: \n
# c12: signature-malformed
# c13: public-key-malformed
# c14: manifest.json
# c15: signature-invalid
seg-36c9df2abf34 = Signaturphase. Diese Phase wird unabhängig davon ausgeführt, ob das Manifest lesbar war. Wenn das Manifest lesbar war, ist der <em>genannte Schlüssel</em> <c1/>; wenn er nicht aus { "64" } Kleinbuchstaben-Hexziffern besteht: Fehler <c2/> (kein genannter Schlüssel); andernfalls, wenn <c3/> nicht sein Fingerabdruck ist: Fehler <c4/> (der Schlüssel bleibt verwendbar). Wenn sowohl ein <c5/> als auch ein genannter Schlüssel existieren und sich unterscheiden: Fehler <c6/>. Der <em>Prüfschlüssel</em> ist <c7/>, wenn einer angegeben wurde, andernfalls der genannte Schlüssel, wenn es einen gibt; mit keinem von beiden gibt es keinen Prüfschlüssel (dies schließt jeden Fall ein, in dem das Manifest nicht lesbar war und kein <c8/> angegeben wurde). Wenn es kein <c9/> gibt: <c10/>. Andernfalls, wenn die Datei nicht genau { "128" } Kleinbuchstaben-Hexziffern plus ein <c11/> ist: <c12/>. Andernfalls, wenn es einen Prüfschlüssel gibt, der keine gültige Ed25519-Public-Key-Kodierung ist: <c13/>. Andernfalls, wenn es einen Prüfschlüssel gibt und die Signatur nicht strikt über die Bytes von <c14/> (was auch immer sie sind) verifiziert: <c15/>. (Ohne Prüfschlüssel wird die Signatur nicht geprüft, und dafür wird kein Fehler ausgelöst.)

# text
# c1: manifest-malformed
seg-3dbe07af8fa8 = Wenn das Manifest nicht lesbar war (Schritt { "2" } ergab <c1/>): hier anhalten.

# text
# c1: artifacts
# c2: artifact-list-malformed
# c3: file-missing
# c4: bytes
# c5: file-size-mismatch
# c6: sha256
# c7: file-hash-mismatch
seg-b7e03ef2dea5 = Artefakte. Wenn die Namen in <c1/> nicht genau die vier oben genannten in dieser Reihenfolge sind: <c2/>. Dann für jeden Manifesteintrag der Reihe nach: Wenn das Paket keine Datei dieses Namens hat: <c3/> (Name); andernfalls, wenn ihre Länge von <c4/> abweicht: <c5/> (Name); und, unabhängig davon, wenn der SHA-256 der Datei von <c6/> abweicht: <c7/> (Name).

# text
# c1: manifest.json
# c2: manifest.sig
# c3: timestamp.tsr
# c4: artifacts
# c5: unlisted-file
seg-24cda5a1d9d8 = Nicht aufgeführte Dateien: für jede Datei im Paket außer <c1/>, <c2/>, <c3/> und den Namen in <c4/> des Manifests: <c5/> (Name).

# text
# c1: artifacts
# c2: link0
# c3: sha256
# c4: manifest-malformed
# c5: link
# c6: chain-mismatch
# c7: chain_head
# c8: chain-head-mismatch
seg-d103ade9a7c7 = Kette. <c1/> des Manifests der Reihe nach ab <c2/> durchlaufen. Wenn <c3/> eines Eintrags nicht aus { "64" } Kleinbuchstaben-Hexziffern besteht: <c4/>, und die Kette wird aufgegeben (keine Prüfung des Kopfes). Andernfalls das Glied berechnen; wenn es vom <c5/> des Eintrags abweicht: <c6/> (Name). Nach dem Durchlauf, wenn die Kette nicht aufgegeben wurde und das letzte Glied von <c7/> abweicht: <c8/>.

# text
# c1: slice-record-inconsistent
# c2: start > end
# c3: end > full_bytes
# c4: log-slice.bin
# c5: sha256
# c6: slice.sha256
# c7: bytes
# c8: end - start
# c9: kind
# c10: whole-log
# c11: start != 0
# c12: end != full_bytes
# c13: slice.sha256 != full_sha256
# c14: epochs.json
# c15: epochs_in_window
# c16: epoch-count-mismatch
seg-be9fade3f879 = Ausschnitt und Epochen. <c1/> auslösen (höchstens einmal je Grund, und ein Verifizierer meldet den Code einmal, egal wie viele Gründe zutreffen), wenn eines davon zutrifft: <c2/>; <c3/>; <c5/> des Eintrags <c4/> weicht von <c6/> ab; <c7/> dieses Eintrags weicht von <c8/> ab; oder <c9/> ist <c10/> und eines von <c11/>, <c12/>, <c13/> trifft zu. Wenn <c14/> existiert und als JSON-Array geparst wird, dessen Länge von <c15/> abweicht: <c16/>.

# text
# c1: log.full_sha256
# c2: full-log-hash-mismatch
# c3: start..end
# c4: log-slice.bin
# c5: slice-not-from-full-log
seg-0dc49ed14c1f = Vollständiges Log. Nur wenn dem Verifizierer die ursprünglichen Log-Bytes übergeben wurden: Wenn deren SHA-256 von <c1/> abweicht: <c2/>; andernfalls, wenn der Bereich <c3/> nicht innerhalb des Logs liegt oder die Bytes des Logs dort von <c4/> abweichen: <c5/>.

# text
# c1: timestamp.tsr
# c2: timestamp-missing
# c3: timestamp-malformed
# c4: manifest.json
# c5: timestamp-imprint-mismatch
seg-a7f787d6e6df = Zeitstempel. Ohne <c1/>: Wenn dem Verifizierer vorgegeben wurde, einen zu verlangen: <c2/>; andernfalls nichts. Mit einem: Wenn er sich nicht als RFC-{ "3161" }-Token oder -Antwort lesen lässt (siehe unten): <c3/>; andernfalls, wenn sein Message-Imprint nicht der Hash der Bytes von <c4/> im eigenen Algorithmus des Imprints (SHA-256, SHA-384 oder SHA-512) ist: <c5/>.

# text
seg-f7d908c6bf38 = Das Paket ist genau dann verifiziert, wenn die Fehlermenge leer ist. Ob der Signierende gepinnt war, wird getrennt gemeldet und ändert die Fehlermenge nicht.

# text
# c1: ContentInfo
# c2: id-ct-TSTInfo
# c3: TimeStampResp
# c4: PKIStatusInfo
# c5: TSTInfo
# c6: genTime
# c7: --tsa-ca
seg-b0d74519122d = <b>Zeitstempel-Token.</b> Ein Token ist eine DER-<c1/>, deren Inhaltstyp CMS SignedData ({ "1.2.840.113549.1.7.2" }) und deren eingekapselter Inhaltstyp <c2/> ({ "1.2.840.113549.1.9.16.1.4" }) ist; eine Antwort ist eine DER-<c3/> (eine <c4/>, gefolgt vom Token), deren Status { "0" } oder { "1" } ist. Der Message-Imprint-Algorithmus der <c5/> muss SHA-256, SHA-384 oder SHA-512 sein, mit einem Digest der Länge dieses Algorithmus, und ihre <c6/> eine echte UTC-Kalenderzeit. BER mit unbestimmter Länge wird nicht akzeptiert. Die Signatur und die Zertifikatskette der Behörde werden nur geprüft, wenn vertrauenswürdige Anker angegeben sind (<c7/>, unten).

# text
seg-2156bf4dabb3 = RFC-{ "3161" }-Zeitstempel (optional)

# text
# c1: manifest.json
# c2: create_bundle
seg-27a71ea73d7d = Ein Zeitstempel-Token einer Zeitstempelbehörde zeigt, dass das Manifest zu einem Zeitpunkt existierte, den die Behörde bestätigt. Das Token gilt über <c1/>, wird also angefordert, nachdem das Paket erstellt wurde (beim Erstellen des Pakets lässt sich keines angeben, und <c2/> lehnt ein Token ab, das nicht über genau dieses Manifest gilt):

# text
# c1: kshana evidence verify
# c2: manifest.json
# c3: authority_signature_verified: false
# c4: openssl ts -verify
seg-7ae6e0326b65 = <c1/> liest das Token (ein reines Token oder eine vollständige Antwort), prüft, dass es gewährt wurde und dass sein Message-Imprint dem Hash von <c2/> entspricht, und gibt die darin genannte Zeit aus. Ohne vertrauenswürdige Anker fügt es „timestamp authority signature not verified by Kshana" hinzu und meldet <c3/>; für diesen Teil die Zeile <c4/> oben ausführen. Ein Token, dessen Imprint abweicht, oder eines, das sich nicht parsen lässt, ist ein Fehler. Die Inhaltstypen, die Imprint-Länge und die Erzeugungszeit des Tokens werden auf Plausibilität geprüft.

# text
# c1: --tsa-ca authority-ca.pem
# c2: verify
# c3: openssl ts -verify
# c4: genTime
# c5: timestamp-authority-invalid
# c6: authority_signature_verified
# c7: tests/fixtures/evidence_tsa/PREREGISTRATION.md
seg-88359c107bf1 = Mit <c1/> (ein oder mehrere PEM-Zertifikate, allen wird vertraut) prüft <c2/> auch die Behörde, offline, so wie <c3/> es tut: den Message-Digest der signierten Attribute, die Signatur (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 oder P-384), die ESS-Signing-Certificate-Bindung, die kritische Extended Key Usage timeStamping des Signierenden und die Kette bis zu einem selbst ausgestellten Anker, wobei jedes Zertifikat zur <c4/> des Tokens gültig sein muss. Ein Fehler wird als <c5/> mit der ersten fehlgeschlagenen Prüfung gemeldet, und <c6/> ist nur wahr, wenn alles bestanden wurde. Die Sperrung (CRL oder OCSP) wird nicht geprüft. Dieser Verifizierer stimmt mit OpenSSL { "3.0.13" } in { "27" } selbst erzeugten Fällen überein (<c7/>).

# text
# c1: verify
# c2: --require-timestamp
# c3: timestamp-missing
# c4: attach-timestamp
# c5: --replace
seg-f534ae37f10c = <b>Das Token liegt neben dem signierten Manifest, nicht darin.</b> Nichts in der Signatur oder der Kette deckt es ab, sodass ein Token entfernt oder durch ein anderes gültiges ersetzt werden kann, ohne dass die Signatur fehlschlägt. <c1/> vermerkt daher, wenn ein Paket keines hat, und <c2/> macht ein fehlendes Token zu einem Fehler (<c3/>); ein ersetztes Token wird nur erkannt, wenn es nicht zum Manifest passt. <c4/> weigert sich, ein vorhandenes Token zu überschreiben, außer Sie übergeben <c5/>. Wenn ein Zeitstempel für Sie wichtig ist, bewahren Sie das Token und das Verifikationsergebnis bei Ihren eigenen Unterlagen auf und verlangen Sie es.

# text
seg-b993ef559bd0 = Aus dem Code

# text
# c1: kshana::evidence::build_receiver_trust_pack
# c2: create_bundle
# c3: verify_bundle
# c4: EvidenceInput
# c5: BTreeMap<String, Vec<u8>>
# c6: Files
# c7: VerifyReport
# c8: wasm32
seg-de24fd02c7c2 = <c1/> ist der eine Einstiegspunkt, den die Befehlszeile und jede andere Oberfläche aufrufen, um ein Paket zu erstellen: Hinein gehen ein Szenario, die Bytes des Logs (und der Navigationsdatei, bei RINEX), das Zeitfenster als Text, ein Titel und eine optionale Erstellungszeit sowie der Signier-Seed; heraus kommen die Dateien, die Epochenanzahl, der Ausschnitt, der Manifest-Hash und der Fingerabdruck des Signierenden. Er liest keine Dateien und keine Uhr, sodass dieselben Eingaben dieselben Bytes ergeben. Darunter sind <c2/> und <c3/> reine Funktionen: Bytes hinein (<c4/>, ein 32-Byte-Seed, eine <c5/> von Dateien), serialisierbare Ergebnisse heraus (<c6/>, <c7/>). Sie verwenden keine Dateien, keine Uhr und keinen Prozesszustand und bauen für <c8/>, sodass die Oberflächen für Python, WebAssembly und Server sie unverändert aufrufen. Die Befehlszeile ist ein dünner Wrapper darum.

# text
seg-292a5bc48548 = Was ein Paket nicht leistet

# text
# c1: config.json
# c2: kshana receiver-trust
# c3: epochs.json
seg-852aca7fc407 = Es führt die Bewertung nicht erneut aus. Jeder mit dem vollständigen Log und <c1/> kann <c2/> erneut ausführen und mit <c3/> vergleichen; das Paket belegt, was festgehalten wurde, nicht dass die Engine recht hatte.

# text
seg-91639deac47d = Es beweist nicht, dass das Log echt oder vollständig ist. Der Hash des vollständigen Logs bindet den Bericht an eine Datei; woher diese Datei stammt, muss der Betreiber klären.

# text
seg-0f721c314fa1 = Es enthält keine Leistungsaussage zur Erkennung oder Abwehr von Störungen.

# text
seg-9c361736bf27 = Es ist ein technischer Bericht und weder eine Rechtsauffassung noch eine Zertifizierung.

# text
seg-68bcf43b4e27 = <s1>Zurück</s1>Zeilenabdeckung

# text
seg-09c0b5fa6e52 = <s1>Weiter</s1>Optische Strecken durch die Atmosphäre
