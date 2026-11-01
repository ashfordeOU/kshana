# docs--licensing: translations (de)

# text
# c1: LICENSING.md
seg-a1bee28d1dfd = Quelle: <c1/>

# text
seg-b8dd205e82c4 = Kshana ist <b>doppelt lizenziert</b>. Sie können die offene Engine entweder unter der <b>offenen Lizenz</b> (AGPL-3.0) <b>oder</b> unter einer <b>kommerziellen Lizenz</b> von Ashforde OÜ verwenden. Wählen Sie die, die zu Ihrem Verwendungszweck passt.

# text
# c1: LICENSE
seg-5faea0aba960 = Dieses Dokument erklärt das Modell in einfacher Sprache. Es ist ein Leitfaden, keine Rechtsberatung, und es ändert die Lizenzen selbst nicht. Die verbindlichen Bedingungen stehen in <a1><c1/></a1> (die GNU AGPL-3.0) und in jeder kommerziellen Vereinbarung, die Sie mit Ashforde OÜ unterzeichnen. Widersprechen sich beide, gelten jene Dokumente.

# text
seg-89bd60937f0b = Option A — Open Source: GNU AGPL-3.0-only

# text
# c1: LICENSE
seg-785200a5419a = Die Voreinstellung. Der vollständige Text steht in <a1><c1/></a1>. Kurz gesagt: Die AGPL erlaubt Ihnen, Kshana kostenlos zu verwenden, zu untersuchen, zu ändern und weiterzugeben, <b>sofern</b>:

# text
seg-5bc05999ee9d = Sie, wenn Sie Kshana oder eine abgeleitete Fassung <b>weitergeben</b>, den <b>vollständigen zugehörigen Quelltext</b> unter der AGPL zur Verfügung stellen; und

# text
seg-5c9136766fdf = Sie, wenn Sie Nutzern die Interaktion mit einer <b>geänderten</b> Fassung von Kshana <b>über ein Netz</b> ermöglichen (die kennzeichnende Klausel der AGPL, §{ "13" }), <b>diesen Nutzern</b> den zugehörigen Quelltext Ihrer geänderten Fassung unter der AGPL anbieten müssen.

# text
seg-234be920d38f = Die AGPL ist eine <a1>von der OSI als Open-Source-Lizenz anerkannte Lizenz</a1> und ein starkes Copyleft. Sie ist die richtige Wahl für akademische Arbeit, Open-Source-Projekte, interne Evaluierung und Forschung und für alle, die ihre eigene abgeleitete Fassung gern offen halten.

# text
seg-16c9cc91e4eb = Option B — kommerzielle Lizenz (von Ashforde OÜ)

# text
seg-197bfc5a5166 = Wenn die AGPL nicht zu Ihnen passt, lizenziert Ashforde OÜ dieselbe Engine zu kommerziellen Bedingungen. Das ist die richtige Wahl, wenn Sie Folgendes wollen:

# text
seg-6de2b04016e5 = <b>Kshana in ein proprietäres Produkt mit geschlossenem Quelltext einbetten</b>, ohne Ihren eigenen Quelltext zu veröffentlichen;

# text
seg-e31db28c1e09 = <b>einen Netzdienst anbieten</b>, der auf einer geänderten Fassung von Kshana beruht, <b>ohne</b> die Pflicht zur Offenlegung des Quelltextes nach §{ "13" };

# text
seg-9d3578395a59 = Kshana in ein größeres System integrieren, dessen andere Komponenten nicht unter der AGPL stehen können (z. B. die proprietäre Werkzeugkette eines Hauptauftragnehmers); oder

# text
seg-99d049c650a3 = eine Gewährleistung, eine Freistellung oder Supportbedingungen erhalten, die die AGPL ausdrücklich ausschließt.

# text
seg-f68b536b93c0 = Eine kommerzielle Lizenz hebt für Ihre Nutzung die Copyleft-Pflichten zu vereinbarten Bedingungen auf. <b>Kontakt: <a1>contact@ashforde.org</a1>.</b>

# text
seg-55f1a2f687d9 = Warum so doppelt lizenziert wird

# text
seg-42c1ce05ca5c = Das Ziel ist, <b>öffentlich überprüfbar</b> zu sein (damit jeder Prüfer die Engine ausführen und auditieren kann), <b>ohne</b> einem finanzstarken Wettbewerber zu erlauben, die validierte Engine zu forken, zu schließen und ein proprietäres Konkurrenzprodukt auszuliefern, das nichts zurückgibt. Das Netz-Copyleft der AGPL erreicht das: Eine geschlossene oder gehostete abgeleitete Fassung muss zur Open Source zurückkehren — oder eine kommerzielle Lizenz von uns nehmen. Öffentliche Glaubwürdigkeit und ein geschützter Kern zugleich.

# text
seg-32b1d38914fe = Was von dieser doppelten Lizenzierung <b>nicht</b> erfasst wird

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
# c3: integrations/
seg-27636d757dba = <b>Das native OpenCPN-Plugin</b> (<c1/>) ist unter <b>GPL-3.0-or-later</b> lizenziert (siehe die Datei <c2/> in diesem Verzeichnis), nicht unter AGPL-3.0, und wird <b>nicht</b> unter der kommerziellen Lizenz angeboten. Es wird in OpenCPN geladen und gegen dessen Plugin-API-Header unter GPL-2.0-or-later gebaut, was die übliche Grundlage für OpenCPN-Plugins ist. Der Rest von <c3/> (das Signal-K-Plugin und das OpenCPN-TCP-Relay) bleibt AGPL-3.0-only.

# text
seg-f90c983e0ee3 = <b>Kshana Pro</b> und andere proprietäre Erweiterungen sind <b>getrennte Produkte mit geschlossenem Quelltext</b> unter eigenen kommerziellen Bedingungen. Sie sind nicht Teil dieses Repositorys und werden nicht unter der AGPL angeboten.

# text
# c1: deny.toml
seg-e340445b7f17 = <b>Abhängigkeiten</b> behalten ihre eigenen (permissiven) Lizenzen. Wir halten den Abhängigkeitsbaum bewusst permissiv (Apache-2.0 / MIT / BSD / ISC / …), gerade damit die kommerzielle Ausgabe sauber angeboten werden kann — eine Copyleft-Abhängigkeit würde sie belasten. Siehe <a1><c1/></a1>.

# text
# c1: C7_E1B.txt
# c2: C8_E1C.txt
# c3: scripts/fetch_galileo_e1_codes.sh
# c4: KSHANA_GALILEO_E1B
# c5: KSHANA_GALILEO_E1C
# c6: src/iq/signals/galileo.rs
# c7: data/galileo-os-sis-icd/PROVENANCE.md
seg-810191f19d4d = <b>Primäre Speichercodes von Galileo E1</b> (<c1/>, <c2/>; <b>seit { "0.36" } nicht mehr mitgeliefert</b>: Jeder Nutzer stellt seine eigene Kopie bereit, <c3/> oder <c4/> / <c5/>, gelesen von <c6/>). Das sind die primären Codes E1-B und E1-C aus Anhang C.7 und C.8 des Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), Ausgabe { "2.0" }, Januar { "2021" }, © European Union { "2021" }, unverändert aus den Anhängen des PDF extrahiert (Quell-URL, SHA-256 und eine Gegenprüfung gegen Ausgabe { "1.3" } stehen in <a1><c7/></a1>). Sie sind <b>nicht</b> von der AGPL-3.0 oder der kommerziellen Lizenz erfasst, und keine der beiden Lizenzen gewährt daran irgendetwas. Was das ICD selbst sagt, zitiert aus Ausgabe { "2.0" }:

# text
seg-daef032cbe43 = Nutzungsbedingungen §{ "3" }: „Die im OS SIS ICD enthaltenen Informationen, einschließlich seiner Anhänge, unterliegen Rechten des geistigen Eigentums.“ „Das OS SIS ICD darf nur ganz oder teilweise vervielfältigt und/oder an Dritte übermittelt werden, im Einklang mit der hierin beschriebenen zulässigen Nutzung und unter folgenden Bedingungen: Die vorliegenden ‚Nutzungsbedingungen und Haftungsausschlüsse‘ sowie die Bedingungen von Anhang G werden akzeptiert, vollständig und unverändert zusammen mit den vervielfältigten und/oder übermittelten Informationen wiedergegeben und übermittelt; der Urheberrechtsvermerk ‚© European Union { "2021" }‘ wird von keiner Seite entfernt.“ Und: „Die Nutzung der im OS SIS ICD enthaltenen Informationen, einschließlich der Spreizcodes, die geistigem Eigentum unterliegen, ist unter den in Anhang G genannten Bedingungen erlaubt.“

# text
seg-0fb25fafd9a2 = Anhang G (Ausgabe { "2.0" }; Anhang H in Ausgabe { "2.1" }, gleicher Wortlaut) definiert „Technical Data of the OS SIS ICD“ so, dass sie die „E1 and E5 Memory Codes“ einschließt, und gewährt eine Verpflichtung, nicht geltend zu machen, die „nicht ausschließlich und lizenzgebührenfrei“ sowie „nicht übertragbar und nicht unterlizenzierbar“ ist. Ihre Liste in §G.3, die sie als abschließend bezeichnet, umfasst: „a) die Nutzung der Technical Data of the OS SIS ICD, einschließlich ihrer Integration und Einbindung in beliebige Produkte“; „b) die Speicherung der Technical Data of the OS SIS ICD, sofern die Quelle genannt wird“; „c) die Vervielfältigung des OS SIS ICD, ganz oder teilweise, seine Verbreitung und seine Veröffentlichung zu nicht kommerziellen, nicht gewinnorientierten Zwecken und in entsprechendem Umfang, ohne das Dokument zu ändern oder ein Element hinzuzufügen“; und „d) das Bereitstellen von Links zur Website der EU, auf der das Dokument veröffentlicht ist“. „Produkte“ sind Software, Geräte und Mehrwertdienste, die „das OS-Signal nutzen“. Außerdem heißt es: „Die berechtigte Person darf in keinem Werbematerial oder anderswo erklären oder andeuten, dass die Produkte von der EU entwickelt wurden, von ihr oder für sie verwendet werden oder von ihr gebilligt oder unterstützt wurden.“

# text
seg-8531368368ba = <b>Entscheidung ({ "0.36" }): nicht weiterverbreitet.</b> Es wird keine ausdrückliche offene Lizenz genannt. Die Verwendung innerhalb eines Softwareprodukts (G.3 a) und die Speicherung unter Nennung der Quelle (G.3 b) sind nach den eigenen Bedingungen des ICD erfasst, die Weiterverbreitung (G.3 c) aber nur zu nicht kommerziellen, nicht gewinnorientierten Zwecken und mit unverändert beigefügten Bedingungen und Anhang G. Weil Kshana auch unter einer kommerziellen Lizenz angeboten wird, wurden die Dateien aus dem Repository und seinen Paketen entfernt; die Engine liest zur Laufzeit die eigene Kopie des Nutzers, und ohne sie geben die Galileo-E1-Signale einen Fehler zurück, der sagt, wie sie bereitzustellen sind. Jeder Nutzer stützt sich unmittelbar auf die Erlaubnis der EU; Kshana kann sie nicht weitergeben. Kshana wird nicht von der Europäischen Union entwickelt, nicht von ihr verwendet, nicht von ihr gebilligt und nicht von ihr unterstützt.

# text
# c1: NOTICE
seg-e18986aeab7f = <b>Marken.</b> „Kshana“ und seine Marken sind Marken von Ashforde OÜ. Keine der beiden Lizenzen gewährt Rechte am Namen oder an den Marken; Forks und abgeleitete Verteilungen müssen einen anderen Namen verwenden. Siehe <a1><c1/></a1>.

# text
seg-f6b7345c2c60 = Beiträge

# text
# c1: CONTRIBUTING.md
seg-1709eb19c2c5 = Beiträge werden unter den Bedingungen des Projekts für eingehende Beiträge angenommen, die Ihren Beitrag unter der AGPL lizenzieren <b>und</b> Ashforde OÜ das Recht einräumen, ihn in die kommerziell lizenzierte Ausgabe aufzunehmen (damit die doppelte Lizenzierung funktioniert). Siehe <a1><c1/></a1>.

# text
seg-940c8cce5137 = Fragen

# text
seg-e678f2ecc571 = Lizenzfragen, kommerzielle Angebote und „Welche Option gilt für uns?“ → <b><a1>contact@ashforde.org</a1></b>.

# text
seg-05d34a27a0ba = <s1>Zurück</s1>Änderungsprotokoll

# text
seg-4f7f660eea0a = <s1>Weiter</s1>Sicherheit

# text
seg-2d2b32369c30 = Was von dieser doppelten Lizenzierung nicht erfasst wird
