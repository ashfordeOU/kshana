# docs--partner-data: translations (de)

seg-2247a2344710 = Bedeutung

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = Im Repository-Zweig, aus dem diese Dokumente stammen; noch nicht auf GitHub

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-7338b6210228 = Zeile

seg-c5ce76c91ff7 = Kennzeichnung

seg-3a04afee76ec = Quelle: <c1/>

seg-e6d8549f24b9 = Partnerdaten: was gemessene Daten an einer MODELLED-Zeile befördern könnten

seg-7b9ff34db2c4 = Kshana kennzeichnet jede Fähigkeit in einem maschinengeprüften Register (<a1>Verifikationsmatrix</a1>). Die meisten Zeilen zu Zeitgebung und Sensoren sind <b>MODELLED</b>: Sie beruhen auf genannten Modellen, veröffentlichten Datenblättern und internen Prüfungen, und keine gemessene Aufzeichnung der Geräteklasse wurde mit ihnen verglichen. Wer eine solche Aufzeichnung besitzt, kann das ändern. Diese Seite sagt, welche Zeilen, was zu senden ist, wie eine Einreichung geprüft, wie sie bewertet und wie sie angerechnet wird. Sie ist für ein Labor, einen Hersteller oder eine Universitätsgruppe geschrieben; sie ist kein Arbeitsangebot und behauptet keine Billigung durch irgendjemanden. Nur beratend: Kshana ist ein Studieninstrument, keine typzugelassene Navigations- oder Zeitgebungsausrüstung.

seg-1cf5536037d4 = Was die Kennzeichnungen bedeuten

seg-5f43f341fa27 = eine unabhängige externe Referenz stimmt unter einem vor dem Vergleich festgelegten Zielwert mit der Fähigkeit überein. Eine gemessene Aufzeichnung eines Partners kann diese Referenz für die Teilbehauptung sein, die sie abdeckt; die Invarianten der Matrix verbieten die Kennzeichnung ohne eine

seg-0d182b8c7430 = in sich konsistent, und das wird offen gesagt; keine externe unabhängige Referenz deckt die Behauptung ab. Eine MODELLED-Zeile, die mit gemessenen Daten verglichen wird und den Zielwert verfehlt, bleibt MODELLED, und die Verfehlung wird veröffentlicht

seg-8a45367544a0 = eine Disziplin, auf die sich der Lauf stützt, die ein Hardware-Partner besitzt und die Kshana nicht liefert, zum Beispiel die Zahlen, die die eigene Uhr oder das eigene Interferometer eines Partners beschreiben. Kshana modelliert, was ein solches Gerät mit einer Navigations- oder Zeitgebungskette macht; es bürgt nicht für das Gerät

seg-553a1db0e11d = Eine Einreichung kann eine Zeile nur für die Behauptung zu VALIDATED befördern, die die Daten tatsächlich testen, und nur, wenn der Vergleich seinen Zielwert erreicht. Sie kann die eigenen Zahlen eines Geräts nicht zu etwas machen, für das Kshana bürgt: Diese bleiben die des Partners (PARTNER). Ob sich die Kennzeichnung einer Zeile ändert, entscheidet der Eigentümer, festgehalten im Commit, der sie ändert, wobei der Text der unabhängigen Referenz genau sagt, was womit verglichen wurde.

seg-bac61cc47097 = Zeilen, die die Daten eines Partners befördern könnten

seg-bd4f5d3f9399 = Jede Zeile unten ist der genaue Text <c1/> einer MODELLED-Zeile der Matrix (ein Test hält diese Seite und die Matrix im Gleichschritt). „Könnte ändern“ sagt, was ein vorab festgelegter Vergleich mit gemessenen Daten stützen würde, wenn der Zielwert erreicht wird; es ist nie ein Versprechen.

seg-fb5ceb1d62f0 = Daten, die sie testen würden

seg-812eae6bbea9 = Könnte ändern

seg-f46d009d9380 = eine Aufzeichnung von Tagen einer Uhr einer genannten Klasse, frei laufend nach ihrer letzten Disziplinierung, verglichen mit einer besseren Referenz, bei einem Abtastintervall von einer Minute oder weniger

seg-2a73fc59a03d = die Rot-Rausch-Untergrenzen je Klasse, die die holdover-Werte begrenzen, bleiben heute MODELLED; eine gemessene Stabilität bei langen Mittelungszeiten könnte nur für diese Klasse mit der Untergrenze dieser Klasse verglichen werden

seg-abe6b657ce1b = die gemessene Allan-Abweichung, als Tabelle oder als Phasenaufzeichnung, der Uhr oder des Atominterferometers eines Partners

seg-6ba2b7faa909 = die Abwägungswerte quantifizieren das Gerät des Partners (validieren es aber nie), sodass sie als Zahlen des Partners gekennzeichnet würden (PARTNER); das Einlesen gemessener Allan-Daten in ein Rauschmodell ist bereits mit einem unabhängigen Löser abgeglichen

seg-ad537759d084 = eine Phasenaufzeichnung eines Oszillators eines der vier voreingestellten Modelle über mindestens einen Tag

seg-44a55f6ebef6 = ob das aus dem Datenblatt abgeleitete Rauschmodell der Voreinstellung die Stabilität einer gemessenen Einheit bei den eigenen Mittelungszeiten des Datenblatts reproduziert

seg-3da5a93abde6 = eine Phasenaufzeichnung einer noch nicht mit einem Profil erfassten Uhrenklasse (ein OCXO, ein Rubidium, ein Cäsium, ein Maser, eine optische Uhr)

seg-72f248aa4438 = ein auf dem ersten Drittel angepasstes Profil, das die Allan-Abweichung des Rests innerhalb des vorab festgelegten Faktors vorhersagt, wie es für GNSS-Satellitenuhren und einen Empfänger bereits geschehen ist

seg-54971e473811 = ein Log aus einer realen Installation (jede Daemon-Version) mit den eigenen Zusammenfassungszeilen des Daemons

seg-bccf188b7636 = die Reader wurden aus öffentlichen Zeilenlayouts und Fixtures gebaut; ein reales Log, das mit einem unabhängigen Reader verglichen wird, wäre die erste externe Prüfung

seg-e83b73ab2d5d = ein Export eines realen Zählers oder einer Analysesoftware

seg-80b69f559ea5 = dasselbe, für diese Formate

seg-0c279732d132 = ein realer holdover-Test: die Aufzeichnung, die Zeiten, zu denen der Betreiber die Referenz entfernt und wiederhergestellt hat, und die eigenen MTIE-, TDEV- und Masken-Urteile des Labors aus seiner Analysesoftware

seg-cfad71161af0 = eine unabhängige Berechnung derselben Größen zum Vergleich mit denen der Engine

seg-97c65b646eae = ein stationäres Log einer Inertialeinheit, deren Rauschparameter von jemand anderem veröffentlicht oder gemessen wurden

seg-77f9d22ec624 = die Anpassung gewinnt die unabhängigen Parameter innerhalb eines genannten Faktors zurück

seg-c9544eadc55d = ein statisches Log oder die Rauschparameter des Kaltatom-Inertialsensors eines Partners

seg-062dd193ab20 = die Gerätezahlen sind die des Partners (PARTNER); das Positionsfehlerbudget, das sie zusammensetzt, bleibt das Modell von Kshana

seg-078be7f5769f = Beginnen Sie mit den ersten beiden: Sie entscheiden, ob die holdover-Untergrenzen je Klasse und die Abwägung zwischen Quanten und Klassik auf eigenen gemessenen Daten beruhen.

seg-c325655738e0 = Was zu senden ist

seg-ca24fa511ffe = Eine Einreichung besteht aus zwei Dateien in einem Ordner: den Daten und einer kleinen Beschreibung dazu, einer TOML-Datei (<c1/>; ein ausgearbeitetes, erfundenes Beispiel ist <c2/>).

seg-a3e30cf27adb = <b>Uhrendaten.</b> Eines der Formate, die Kshana liest (siehe <a1>Uhrenlog-Formate</a1>): TAPR-TICC-Logs, ASCII-Phase oder -Frequenz im Stil von TimeLab, RINEX clock, linuxptp-Logs <c1/>, <c2/> und <c3/>, chrony-Tracking- und -Statistiklogs. Phase wird der Frequenz vorgezogen; geben Sie die Einheiten und das Abtastintervall an. Geben Sie die längste ununterbrochene Aufzeichnung an, die Sie haben: Stabilität bei langen Mittelungszeiten braucht Tage, und eine Aufzeichnung unter einem Tag wird akzeptiert, aber mit einer Warnung versehen.

seg-a14b0c961637 = <b>Inertialdaten.</b> Eine CSV mit benannten Spalten (<c1/>, rad/s und m/s^{ "2" }) oder das EuRoC-Layout, von einem ruhenden Gerät, lang genug für die Anpassung (mindestens { "2000" } Abtastwerte; Stunden sind besser).

seg-a1f2cd79bcc0 = <b>Die Beschreibung</b> sagt, und der Prüfer verifiziert, wo er kann:

seg-cfeee5da56d7 = die Art der Organisation (eine Art wie „ein nationales Zeitlabor“, kein Name; ein Name ist optional und nur für die Anrechnung);

seg-4bd30d68101c = das Gerät (Art, Klasse und ein Modell für die Klasse <c1/>);

seg-e8222178a0ee = wie die Daten aufgenommen wurden: womit sie verglichen wurden, die Startzeit (UTC), die Umgebung und ob sie roh oder aufbereitet sind (und was damit gemacht wurde);

seg-7ac28bd566f2 = der SHA-256 der Datendatei, damit die bewertete Datei die beschriebene Datei ist;

seg-0eba30c3a5b8 = die MODELLED-Zeilen, gegen die sie angeboten wird, durch den genauen Anforderungstext oben;

seg-dd694deec626 = die Lizenz (eine SPDX-Kennung oder Worte) und wie die Daten im Repository verwendet werden dürfen: <c1/> (eingecheckt, mit Quellenangabe), <c2/> (nur ihr Hash und die Bewertungen werden veröffentlicht) oder <c3/> (die Bewertung wird allein mit dem Einreichenden geteilt);

seg-7cea4b7c1df8 = drei Erklärungen: Es ist eine Messung und keine Simulation, der Einreichende darf sie für diese Verwendung lizenzieren, und die Dateien enthalten keine personenbezogenen Daten.

seg-caa6696f3f5f = <b>Nicht zu senden.</b> Alles Persönliche oder mit Kontaktdaten (der Prüfer lehnt eine E-Mail-Adresse oder Telefonnummer in der Beschreibung ab), alles, was Exportkontrollen unterliegt oder durch Vereinbarung beschränkt ist, und alle simulierten Daten, die als gemessen ausgegeben werden.

seg-a2f0067b6da5 = Wie eine Einreichung geprüft wird

seg-f1d4c097691e = Format und Metadaten, durch Sie oder uns, bevor irgendetwas läuft.

seg-c3cd90222eaa = Er bestätigt das Schema, die Pflichtfelder, den Hash, die Regeln zu Lizenz und Quellenangabe, dass die Zielzeilen existieren und MODELLED sind, dass sich die Daten mit dem eigenen Reader der Engine lesen lassen, und er meldet, was er gelesen hat (Abtastwerte, Intervall, Zeitspanne, Lücken), und warnt vor kurzen Aufzeichnungen. Der Exitstatus { "0" } bedeutet vollständig und lesbar; { "1" } listet auf, was zu beheben ist. <b>Er bewertet die Daten nicht, validiert keine Zeile und verspricht nicht, dass sie verwendet werden.</b>

seg-7dd95552a6fb = <b>Eine Vorregistrierung vor jedem bewerteten Lauf.</b> Für jede Zeile legt ein Dokument in <c1/> fest und wird eingecheckt, bevor die Daten ausgeführt werden: die Zeile, den SHA-256 der Datendatei, welcher Teil der Daten zurückgehalten wird (nichts Angepasstes darf ihn sehen), die Metrik und den Zielwert. Für Uhrenprofile ist die bestehende Vorlage die Vorhersage mit zurückgehaltenen Daten, die für die IGS- und Empfängeraufzeichnungen verwendet wurde: auf dem ersten Drittel der Aufzeichnung anpassen, die Allan-Abweichung des Rests vorhersagen und verlangen, dass das Verhältnis von vorhergesagt zu gemessen bei jeder angepassten Mittelungszeit innerhalb eines genannten Faktors liegt. Ein Zielwert wird nach einem Lauf nie gelockert.

seg-10dc9f8cf394 = <b>Ein bewerteter Lauf.</b> Das Ergebnis, jede Zahl und jede Verfehlung eingeschlossen, wird mit dem Befehl und dem Commit veröffentlicht, und ein Test legt es fest. Eine Verfehlung ist ein Befund, kein Versagen, das man verbergen müsste: Die Zeile bleibt MODELLED, und die Seite sagt das.

seg-e5704c43a6b8 = <b>Die Entscheidung über das Register trifft der Eigentümer</b>, schriftlich, im Commit, der die Zeile ändert. Der Text der unabhängigen Referenz einer beförderten Zeile nennt den Datensatz, seine Lizenz und Anrechnung, was verglichen wurde und was nicht.

seg-6d467ffb4199 = Anrechnung und Rechte

seg-e82f31e7d9cc = Die Daten bleiben unter der von Ihnen genannten Lizenz Ihre. <c1/> und <c2/> halten die Datei aus dem Repository heraus.

seg-156499ebc142 = Eine Einreichung mit <c1/> wird durch die von Ihnen angegebene Zeile zur Quellenangabe angerechnet, im Text der unabhängigen Referenz der Zeile und in der Ergebnisdatei.

seg-a5c01115d23a = Nichts wird ohne Ihre schriftliche Zustimmung unter Ihrem Namen veröffentlicht; eine als Quelle genannte Organisation wird als Quelle zitiert, nie als Befürworter. Es wird keine Aussage über eine Zulassung oder Billigung von oder über einen Partner gemacht.

seg-6c9ed423e51d = Sie können eine Einreichung zurückziehen, bevor ihr Ergebnis veröffentlicht wird. Danach bleibt das Ergebnis wie festgehalten; wenn Sie die Datenlizenz zurückziehen, wird die Datei aus dem Repository entfernt, und der Hash und die Bewertungen bleiben.

seg-2cc3c091ba0f = Kshana sendet nichts und steuert keine Hardware an. Eine Einreichung sind Dateien hinein, ein Bericht heraus.

seg-01b0ee9973dc = Ansprache

seg-b5cb4dc0493f = Ein einseitiger Text für ein Labor ist für den Eigentümer in <s1><c1/></s1> entworfen. Er ist ein Entwurf: Es wird nichts gesendet, und niemand wird kontaktiert, bis der Eigentümer entscheidet.

seg-83b30e1ca261 = <s1>Zurück</s1>Nachweispakete

seg-09c0b5fa6e52 = <s1>Weiter</s1>Optische Verbindungen durch die Atmosphäre
