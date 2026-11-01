# docs--governance: translations (de)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Quelle: <c1/>

# text
seg-5f8e9a4a15be = Governance von Kshana

# text
seg-b20b74b77755 = Dieses Dokument legt fest, wie Kshana geführt wird: wer Entscheidungen trifft, wie, und was das Projekt aufnimmt und was nicht. Es ist bewusst <b>leicht</b> — im Verhältnis zur aktuellen Größe des Projekts — und ehrlich über die derzeitige Lage mit einem einzigen Maintainer und den Weg zu breiterer Governance, wenn die Gemeinschaft wächst.

# text
seg-1e0c276811e2 = Auftrag und Umfang

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = Kshana ist eine <b>neutrale, reproduzierbare, ehrlich validierte Referenz für die Leistung und Resilienz hybrider Quanten-/klassischer PNT</b>. Der Auftrag legt den Maßstab für jede Entscheidung fest: Korrektheit, Zitate und Reproduzierbarkeit vor Breite. Der ehrliche Umfang ist in <a1><c1/></a1> dokumentiert und der Validierungsstand in <a2><c2/></a2>; Vorschläge werden an diesem Umfang gemessen, nicht an der Zahl der Funktionen.

# text
seg-d331a1cfc60b = Rollen

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Maintainer.</b> Kshana wird derzeit von seinem Gründer gepflegt, Ashforde OÜ (Kontakt: <c1/>). Der Maintainer entscheidet letztverbindlich über Umfang, Entwurf, Releases und das, was zusammengeführt wird. Das ist ein Modell des wohlwollenden Maintainers, offen benannt statt als ein Gremium ausgegeben, das es nicht gibt.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Mitwirkende.</b> Jeder, der ein Issue oder einen Pull Request öffnet. Beiträge werden an dem Maßstab in <a1><c1/></a1> gemessen — Herkunftsangabe für jeden numerischen Parameter, Validierung gegen eine veröffentlichte Beziehung und Ehrlichkeit zum Reifegrad.

# text
seg-d212e17ac218 = <b>Künftige Committer.</b> Wenn nachhaltige, hochwertige Beiträge es rechtfertigen, werden Commit-Rechte auf vertrauenswürdige Mitwirkende ausgeweitet, und dieses Dokument wird auf ein Modell mit mehreren Maintainern aktualisiert (Entscheidungen durch stillschweigenden Konsens, wobei die Maintainer-Gruppe Meinungsverschiedenheiten klärt). Bis dahin lautet der Weg: beitragen, sich einen Ruf erarbeiten und eingeladen werden.

# text
seg-91e3f1919016 = Wie Entscheidungen getroffen werden

# text
seg-0d45899c92f4 = <b>Offene Diskussion.</b> Inhaltliche Änderungen beginnen als GitHub-Issue, damit Begründung, Alternativen und Abwägungen dokumentiert sind.

# text
seg-88916dd2357b = <b>Stillschweigender Konsens.</b> Ein Vorschlag ohne anhaltenden Widerspruch nach angemessener Zeit, der den unten genannten technischen Maßstab erfüllt, geht weiter.

# text
seg-788566515dad = <b>Der Maintainer entscheidet bei Uneinigkeit.</b> Wo kein Konsens erreicht wird, entscheidet der Maintainer und hält den Grund fest. Uneinigkeit wird durch den Auftrag und den technischen Maßstab gelöst, nicht durch Dienstalter oder Lautstärke.

# text
seg-e45e1b565e62 = Der technische Maßstab (nicht verhandelbar)

# text
seg-2c397872e2f5 = Dies sind harte Invarianten, durch CI und Review durchgesetzt, die keine Entscheidung außer Kraft setzt:

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> muss einen Lauf bitgenau reproduzieren. Eine Änderung, die das nichtdeterministisch macht, ist ein Fehler, kein Feature.

# text
seg-b8733ea97546 = <b>Herkunft.</b> Keine anonymen numerischen Konstanten — jeder Parameter nennt eine Quelle.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Ehrlichkeit bei der Validierung.</b> Jede Fähigkeit ist als <c1/> (gegen eine externe Referenz) oder als <c2/> / <c3/> gekennzeichnet. Nichts wird über seinen Beleg hinaus behauptet. Siehe die maschinell geprüfte Matrix in <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Sauberkeit.</b> Keine Zuordnung zu automatisierten Werkzeugen irgendwo in Commits, Inhalten oder Verlauf (durchgesetzt von <c1/>).

# text
seg-45733fea1709 = Eine Änderung, die den Maßstab nicht erfüllen kann, wird abgelehnt, so nützlich sie auch wäre.

# text
seg-3eb0831d99a2 = Die Grenze zwischen offen und geschlossen

# text
# c1: LICENSING.md
seg-ca7730a3d518 = Kshana ist <b>Open Core</b>. Dieses Repository ist die vollständige offene AGPL-3.0-Engine und bleibt es — die neutrale Referenz, von Ashforde OÜ zusätzlich kommerziell doppelt lizenziert (siehe <a1><c1/></a1>). Das Projekt wird in das offene Repository <b>nicht</b> aufnehmen:

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Exportkontrollierte Tiefe oder Tiefe mit doppeltem Verwendungszweck</b> — echte Bedrohungsbibliotheken, Wellenformen von Gegnern oder Leistungsparameter für Anti-jamming/Anti-spoofing. Das öffentliche Repository bleibt bei allgemeinen, veröffentlichten Modellen und Methoden (siehe <c1/> → Exportkontrolle). Fragen Sie im Zweifel <em>vor</em> dem Beitrag nach.

# text
seg-6df31d37cfe4 = Vertrauliche Daten oder Kalibrierung von Kunden oder Partnern.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b>Copyleft-(GPL/AGPL/LGPL/MPL-)<em>Abhängigkeiten</em></b> — nicht weil sie mit der eigenen AGPL-Lizenz der Engine kollidieren (das tun sie nicht), sondern weil sie nicht in die <b>kommerzielle</b> Ausgabe umlizenziert werden können: Wir können eine kommerzielle Lizenz nur über Code verkaufen, den wir besitzen oder der permissiv ist. Eine Copyleft-Abhängigkeit würde die kommerzielle Ausgabe belasten und die Doppellizenz brechen. Abhängigkeiten bleiben daher permissiv (Apache/MIT/BSD/ISC), durchgesetzt von <a1><c1/></a1>.

# text
seg-ce264f3e43fe = Umgekehrt wird das Projekt den offenen Kern <b>nicht</b> aushöhlen, um proprietären Wert voranzutreiben: Die validierte Engine, die öffentlichen Validierungsanker, das Ehrlichkeitsregister, das Austausch-/Standardformat und die Vertriebskanäle bleiben offen. Den offenen Kern auszuhungern ist der eine tödliche Fehler bei Open Core, und er kommt nicht in Frage.

# text
seg-947b3e9b1b2d = Releases

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Semantic Versioning.</b> Vor 1.0 kann sich das Schema für Szenario/Ergebnis ändern; brechende Änderungen werden hervorgehoben, und die Version des Austauschschemas (<c1/>) ist die einzige Quelle der Wahrheit für die Kompatibilität von Artefakten.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Release-Befugnis.</b> Die Veröffentlichung (z. B. <c1/>) ist ein manueller Schritt des Maintainers, der ein Registry-Token braucht. CI und der durch Tags ausgelöste Workflow Release veröffentlichen <b>nie</b> automatisch in externen Registries — sie führen nur alle Prüfungen erneut aus und hängen ein Build-Artefakt an. Siehe <c2/> → Commits und Versionierung.

# text
seg-59c37ffa54f0 = Verhaltenskodex und Sicherheit

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = Das Verhalten wird durch <a1><c1/></a1> geregelt.

# text
# c1: SECURITY.md
seg-8574b73edbbc = Sicherheitsprobleme folgen dem privaten Meldeverfahren in <a1><c1/></a1> — öffnen Sie für eine Schwachstelle kein öffentliches Issue.

# text
seg-d86d4e609713 = Marke

# text
seg-cb1314b67b2f = Der Name und das Logo von Kshana sind Marken von Ashforde OÜ. Die Lizenz (AGPL-3.0 oder eine kommerzielle Lizenz) deckt den <b>Code</b> ab, nicht die Marken: Ein Fork darf den Code unter der Lizenz verwenden, aber nicht den Namen Kshana oder die kanonische Vertriebsidentität. Das hält Ashforde als zitierte Quelle der Wahrheit und gehört dazu, wie der offene Kern eine neutrale Referenz bleibt.

# text
seg-a678f6ed1af8 = Dieses Dokument ändern

# text
seg-db90122245fa = Änderungen an der Governance werden selbst als Pull Request vorgeschlagen und nach dem obigen Verfahren entschieden. Mit der Größe des Projekts ist zu erwarten, dass dieses Dokument ein Entscheidungsmodell mit mehreren Maintainern erhält; den technischen Maßstab wird es nicht senken.

# text
seg-0a0712cca2e7 = Leicht gewollt. Ehrlich über heute, mit einem benannten Weg für morgen.

# text
seg-4bfa7cf23a41 = <s1>Zurück</s1>Beitragen

# text
seg-f67113e34738 = <s1>Weiter</s1>Verhaltenskodex
