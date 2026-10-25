# docs--osnma: translations (de)

# text
seg-fcd0ebea49bc = Befehlszeile

# attr:aria-label, text
seg-6816f4e1a0a0 = Version

# text
seg-94058315dfe4 = Eingabe

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Quelle: <c1/>

# text
seg-1e9c104231db = Galileo-OSNMA-Verifizierer auf Empfängerseite

# text
seg-17fd702f5997 = Ein Verifizierer auf Empfängerseite für die Galileo Open Service Navigation Message Authentication (OSNMA), in reinem Rust. Er liest I/NAV-Seiten und berichtet je Satellit und je Epoche, ob die Navigationsdaten kryptographisch authentifiziert sind und warum eine Prüfung fehlgeschlagen ist.

# text
seg-ae081f55c4f1 = <b>Hinweis (beratend).</b> Dies ist eine Analyse- und Überwachungsausgabe und keine typzugelassene Navigationsausrüstung. Der hier gemeldete Authentifizierungsstatus ist kein Navigationsintegritätsdienst und darf nicht die alleinige Grundlage einer Navigations- oder Sicherheitsentscheidung sein.

# text
seg-84d7260098b1 = HINWEIS: geistiges Eigentum an der Galileo-OSNMA-Schnittstelle

# text
seg-6d78ccef53d5 = Kshana gewährt keine Rechte am geistigen Eigentum der Europäischen Union am Galileo OSNMA Signal-in-Space Interface Control Document (den „ICD-IPRs“). Das ICD trägt seine eigene Genehmigung (sein Anhang E), die nicht ausschließlich und gebührenfrei ist und eigene Bedingungen, einen eigenen Umfang und eigene Grenzen hat. Wer auf diesem Modul beruhende Software nutzt, baut oder weitergibt, stützt sich unmittelbar auf diese Genehmigung und muss ihre Bedingungen selbst lesen und annehmen. Die Lizenz von Kshana (AGPL-3.0-only oder die kommerzielle Lizenz) deckt nur den eigenen Code von Kshana ab.

# text
seg-c13ad334bf9a = Dieses Modul implementiert die Algorithmen, die die unten genannten Dokumente beschreiben. Der Text des ICD wird nicht wiedergegeben; Zahlenwerte (Feldlayouts, Aufzählungen, die MAC-Nachschlagetabelle) sind in der eigenen Notation von Kshana neu ausgedrückt, mit Quellenangabe im Code. Das ICD und die Receiver Guidelines sind © Europäische Union; die Quelle wird hier genannt. Kshana wird nicht von der Europäischen Union, der Europäischen Kommission, der EUSPA oder einer anderen Stelle entwickelt, genutzt, genehmigt oder unterstützt.

# text
seg-860096b04999 = Referenzdokumente

# text
seg-04c1e1a6278d = Veröffentlicht vom European GNSS Service Centre.

# text
seg-278dd0f9df58 = Dokument

# text
seg-3427e40d7bee = Datum

# text
seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD („SIS ICD“)

# text
seg-f63fbc1175cf = Ausgabe { "1.1" }

# text
seg-fa85e4db2c93 = Oktober { "2023" }

# text
seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

# text
seg-907e4e46056c = Ausgabe { "1.3" }

# text
seg-a9b75bc7f063 = Januar { "2024" }

# text
seg-530ae6421157 = Abschnitts- und Tabellennummern, die im Code und hier genannt werden, beziehen sich auf diese Fassungen.

# text
seg-143726cc3d5f = Was verifiziert wird

# text
seg-029a9bb7608f = Die Vertrauenskette, von der Wurzel bis zu den Daten:

# text
seg-886f1b6556ce = <b>Öffentlicher Schlüssel (ICD { "3.2.2" }, { "6.2" }).</b> Ein DSM-PKR wird aus seinen Blöcken zusammengesetzt, und sein Merkle-Pfad wird bis zu einer vertrauenswürdigen Merkle-Wurzel (SHA-256) durchlaufen.

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Ein DSM-KROOT wird zusammengesetzt; seine ECDSA-Signatur (P-256/SHA-256 oder P-521/SHA-512) wird gegen den von ihm benannten öffentlichen Schlüssel geprüft, über den NMA-Header und die Kettenparameter.

# text
seg-acc1f06cf63a = <b>TESLA-Schlüssel (ICD { "5.5" }, { "6.4" }).</b> Jeder Schlüssel in einer MACK-Nachricht wird mit der Hashfunktion der Kette bis zum KROOT oder zu einem früheren verifizierten Schlüssel zurückverfolgt.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Die flexiblen Tag-Info-Felder werden mit dem Schlüssel, der diese MACK öffnet, gegen die MACSEQ geprüft.

# text
seg-41ba810d7c8d = <b>Tags (ICD { "4.2" }, { "6.7" }).</b> Jedes Tag wird über die Satellitenkennungen, die Subframe-Zeit, die Tag-Position, den NMA-Status und die von ihm abgedeckten Navigationsdaten neu berechnet (HMAC-SHA-256 oder CMAC-AES, auf die Tag-Länge der Kette gekürzt) und verglichen. ADKD { "0" } (Ephemeride, Uhr und Status), ADKD { "4" } (Zeitgebungsparameter) und ADKD { "12" } (langsames MAC, Schlüssel zehn Subframes später veröffentlicht) werden behandelt, mit Kreuzauthentifizierung von Satelliten, die selbst kein OSNMA tragen, und Dummy-Tags (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Ein Tag, das einen reservierten Wert nennt oder dessen ADKD nicht zum Platz der MAC-Nachschlagetabelle passt, wird beiseitegelegt (die Receiver Guidelines sehen vor, es zu verwerfen) und als <c1/> gemeldet, nicht als Fehlschlag.

# text
# c1: bad_crc
seg-eb993b3a0d17 = Seiten werden vor allem anderen gegen ihre CRC (die Galileo-CRC-24Q) geprüft; eine Seite, die durchfällt, wird verworfen und gemeldet (<c1/>).

# text
seg-c414a30d0840 = Statuswerte

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Je Tag: <c1/>, <c2/> mit einem Grund (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> mit einem Grund (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) oder <c15/>. Ein Dummy-Tag (COP { "0" }) erscheint auf Tag-Ebene als <c16/>, da es den Schlüssel belegt, aber es deckt keine Navigationsdaten ab und zählt nie für einen Satelliten.

# text
seg-331a6ab821f3 = Je Satellit, in der Form, die der Empfänger-Vertrauensmonitor verarbeitet:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> nur, solange die neuesten verifizierten Ephemeriden- und Uhrendaten (ADKD { "0" } oder

# text
# c1: Unavailable
seg-38e7f56293e7 = dieses Satelliten aktuell sind (standardmäßig innerhalb von { "600" } s der Zeit des Verifizierers) und noch die verwendeten Daten sind. Die Prüfung gilt den Daten, nicht dem IODnav: Der Verifizierer behält den SHA-256 der authentifizierten Bitfolge (Word Types { "1" } bis { "5" }, wie ADKD { "0" } sie abdeckt) und der neuesten solchen Folge, die der Satellit sendet, und beide müssen gleich sein. Ein kopierter IODnav über anderen Wörtern oder veränderte Bits von Word Type { "5" } (die keinen IODnav tragen) liest sich als <c1/>, bis die neuen Daten authentifiziert sind. Ein Subframe, der Ephemeridenwörter trägt, aber keinen vollständigen Satz der Word Types { "1" } bis { "5" } unter einem IODnav, nimmt den Status auf dieselbe Weise weg (jeder echte E1-B-Subframe trägt alle fünf); einer ganz ohne Ephemeridenwörter sagt nichts aus. Tags eines anderen Satelliten (Kreuzauthentifizierung) zählen für den Satelliten, dessen Daten sie abdecken.

# text
# c1: Failed
seg-233109ef4428 = <c1/>, wenn eine Prüfung der Daten des Satelliten innerhalb des Fehlergedächtnisses fehlgeschlagen ist (standardmäßig { "600" } s der Zeit des Verifizierers), auch wenn spätere Daten verifiziert werden. Eine Abweichung wird dem Satelliten angelastet, dessen Daten das Tag abdeckt, und dem Satelliten, der das Tag gesendet hat, da jeder von beiden fehlerhaft sein könnte; eine MACSEQ-Abweichung wird dem sendenden Satelliten angelastet.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = Sonst <c1/>, und für jeden Satelliten nach einer verifizierten Alarmnachricht, bei NMA-Status „don't use“ oder einem reservierten Status und bis der erste Schlüssel verifiziert ist.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = Der Gesamtwert ist <c1/>, wenn ein Satellit fehlgeschlagen ist, <c2/>, wenn mindestens einer authentifiziert ist und keiner fehlgeschlagen ist, sonst <c3/>. <c4/> ist der passende Satz; <c5/> baut ihn.

# text
seg-446a3218ccbb = Zeit

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = Die Schlüsselkette zeigt, dass ein Schlüssel zu einem bestimmten Subframe gehört, nicht, dass der Subframe der gegenwärtige ist. Der Verifizierer nimmt daher „jetzt“ nie von einer nicht verifizierten Seite. Seine Zeit ist der spätere Wert aus der mit <c1/> (<c2/>) angegebenen Referenzzeit und dem Subframe des letzten verifizierten TESLA-Schlüssels (ein Schlüssel kann nicht vor seinem Slot bekannt sein, er belegt also, dass die Zeit nicht früher liegt). Fehlergedächtnis, das Gültigkeitsfenster einer Authentifizierung und das Entfernen alter Daten laufen auf dieser Zeit. Ein Subframe mit einem Zeitstempel von mehr als drei Subframes nach dem letzten verifizierten Schlüssel wird beiseitegelegt, sofern nicht sein eigener Schlüssel seine Zeit belegt; Schlüssel- und Alarmnachrichten darin werden weiterhin verarbeitet, da sie ihren eigenen Beleg tragen (eine Signatur oder die Merkle-Wurzel).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = Die Uhr steht still, wenn OSNMA aufhört, da nur Schlüssel sie vorrücken. Ein Live-Aufrufer muss <c1/> in jedem Subframe mit der Hostzeit aufrufen; die Authentifizierung läuft dann von selbst ab, und <c2/> (ebenfalls mit jedem Subframe ausgeführt) liefert ein Ereignis <c3/>, sobald länger als das Authentifizierungsfenster kein Schlüssel verifiziert wurde.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = Was dies nicht bietet, ist Aktualität. Ohne eine Referenzzeit aus einer Quelle, die ein Angreifer nicht verschieben kann, wird eine Wiedereinspielung alter authentischer Daten unter alten Zeitstempeln authentifiziert, und die Seitenzeitstempel sind nur so gut wie ihre Quelle: Die CLI sagt das (<c1/>), sobald keine Referenzzeit angegeben ist. Mit einer Referenzzeit liegt die Toleranz unter einem Subframe (standardmäßig { "29" } s; größere Werte werden abgelehnt). Eine Referenzzeit ist ein einzelner Zeitpunkt: Subframes, die weiter davon entfernt sind als die Toleranz, werden beiseitegelegt und gezählt, sie eignet sich daher für Live- oder gerade aufgezeichnete Daten, nicht für eine lange Aufzeichnung. Lassen Sie bei einer Aufzeichnung die Referenzzeit weg und lesen Sie das Ergebnis als „authentisch, nicht unbedingt aktuell“. Die Receiver Guidelines geben die formale Anforderung an.

# text
seg-aa37ce329914 = Die Seitenzeitstempel eines u-blox-Stroms stammen aus den nicht authentifizierten Daten selbst (siehe Eingabe) und bieten daher ebenfalls keinen Schutz der Aktualität.

# text
seg-a33d72076025 = Ketten, Schlüssel und Alarme

# text
# c1: chain_mismatch
seg-be2d9588df65 = Verifizierte Ketten werden nach Ketten-ID (CID) geführt; Tags werden mit der Kette geprüft, die der NMA-Header nennt, und ein Header, der eine nicht verifizierte Kette nennt, lässt die Tags des Subframes ungeprüft (<c1/>). Ein zweiter KROOT einer geltenden Kette fügt einen Anker hinzu; ein KROOT einer anderen Kette wird daneben behalten, sodass eine erneute Ankündigung der alten Kette nach einer Erneuerung die neue nicht aufhebt.

# text
# c1: stale
seg-bbb6574fa258 = Der NMA-Header ist nicht authentifiziert, daher zählt das, was er ankündigt, nur, wenn es bestätigt ist: wenn mehr als ein Satellit in einem Subframe denselben Header sendet oder wenn die signierte Nachricht eines verifizierten KROOT ihn trägt (der Header ist Teil dieser Nachricht). Beides ist nicht gleichwertig. Die Übereinstimmung mehrerer Satelliten schützt vor einer Anomalie eines einzelnen Satelliten, nicht vor einem Spoofer: Ein Spoofer kann zwei Satellitenkennungen fälschen. Das bringt ihm einen Denial-of-Service, und nichts weiter, da ein bestätigtes „don't use“ die authentifizierten Daten jedes Satelliten löscht: Es aufzuheben, gefälscht oder echt, stellt nichts wieder her, bis neue Tags unter echten operativen Subframes verifiziert werden. (Vor diesem Löschen konnte eine gefälschte Aufhebung für bis zu das Authentifizierungsfenster Daten zurückbringen, die bereits authentifiziert waren.) Die echte Bestätigung ist der vom KROOT signierte Header, der ein „don't use“ auch wieder aufhebt, wenn er einen operativen Status trägt. Der Header eines einzelnen Satelliten ändert nichts außer der Tag-Prüfung seines eigenen Subframes. Ein KROOT, dessen Gültigkeitszeitpunkt nicht später liegt als der der für dieselbe ID gehaltenen Kette (eine Wiedereinspielung eines älteren), wird abgelehnt (<c1/>); ein KROOT derselben Kette fügt einen Anker hinzu.

# text
seg-5c08dbaa8d43 = Der Status und der CPKS-Wert des bestätigten Headers steuern den Widerruf. Bei NMA-Status „don't use“ verwirft CPKS „chain revoked“ die Kette, die der Header nennt, und lehnt ihren KROOT von da an ab; CPKS „public key revoked“ verwirft den öffentlichen Schlüssel, der diese Kette signiert hat, und jede damit signierte Kette. Wenn die Ersatzkette für diese ID angenommen wurde, bevor der Header bestätigt wurde, wie lange davor auch immer, ist der widerrufene Schlüssel der der vorherigen Kette, nicht der der neuen; dieses Gedächtnis bleibt erhalten, bis der Widerruf ausgeführt oder der Header eines anderen Verfahrens bestätigt wird, und ein in jedem Subframe wiederholter Widerrufs-Header wird einmal ausgeführt. Dieselben CPKS-Werte mit Status operational kennzeichnen den Übergang zur Ersatzkette und widerrufen nichts. Der Header ist selbst nicht authentifiziert, daher kann ein gefälschter Widerruf nur Authentifizierung wegnehmen, und er ist endgültig, bis der Verifizierer neu gestartet wird. Diese Endgültigkeit gilt auch für den aktiven Schlüssel: Ein gefälschter Widerruf des öffentlichen Schlüssels setzt das Gedächtnis des abgelösten Schlüssels zurück und widerruft den verwendeten Schlüssel, und nur ein Neustart macht es rückgängig.

# text
# c1: Unavailable
seg-e7d43eb18c24 = Ein DSM-PKR mit NPKT { "4" } ist die Alarmnachricht; sie wird wie ein Schlüssel über den Merkle-Baum verifiziert, wobei ihr zufälliges Feld NPK Teil des Blatts ist. Ein verifizierter Alarm löscht alle Ketten und öffentlichen Schlüssel, lehnt jeden späteren KROOT und öffentlichen Schlüssel ab und setzt jeden Satelliten auf <c1/>, wie die Receiver Guidelines es vorgeben, bis der Verifizierer neu gestartet wird.

# text
seg-4068e9bda7c1 = Das Padding-Feld eines DSM-KROOT ist ein Hash der signierten Nachricht und der Signatur. Es wird vor der Signatur geprüft und sagt auch, mit welchem NMA-Header die signierte Nachricht aufgebaut wurde, wenn sich der Header änderte, während die Nachricht zusammengesetzt wurde.

# text
seg-8ea31bf25ef0 = Was nicht verifiziert oder nicht geübt wird

# text
seg-3d0808cab632 = <b>Aktualität.</b> Siehe Zeit oben: Sie braucht eine Referenzzeit von außen.

# text
seg-b3d63950baa4 = <b>Erneuerung und Widerruf.</b> Ketten und Schlüssel werden so verfolgt, wie die Ströme der veröffentlichten Vektoren sie üben (Erneuerung, Kettenende, Widerruf von Kette und Schlüssel, neuer öffentlicher Schlüssel, neuer Merkle-Baum, Alarm), nicht jeden Fall, den das ICD erlaubt. Ein vom nicht authentifizierten Header angekündigter Widerruf wird beim Wort genommen und ist für die Sitzung endgültig. Ein neuer Merkle-Baum wird nur über die Merkle-Wurzel übernommen, die dem Verifizierer gegeben wird.

# text
seg-f01d90a44585 = <b>Hash des Merkle-Baums.</b> DSM-PKR-Nachrichten werden mit einem SHA-256-Baum geprüft. Ein SHA3-256-Baum, den das ICD künftig erlaubt, wird nicht unterstützt. Die Hashfunktion der Kette kann SHA-256 oder SHA3-256 sein.

# text
seg-d9ca4e69ffc9 = <b>Schlüsselstatuslisten.</b> Der Widerruf wird über den NMA-Header und die Nachrichten im Strom verfolgt; Zertifikatsperrlisten werden nicht gelesen.

# text
seg-73e0b16d03c7 = <b>Abdeckung der authentifizierten Daten.</b> ADKD { "4" } mit COP { "1" }, in einem ungeraden Subframe gesendet, kann nicht authentifizieren (Word Type { "10" } kann ein oder zwei Subframes früher gesendet werden); das kostet nur Verfügbarkeit, nie Korrektheit.

# text
seg-acc28dcced83 = <b>Betrieb in konstanter Zeit.</b> Nicht vorgesehen und nicht nötig: Der Verifizierer hält keine Geheimnisse (nur öffentliche Schlüssel, veröffentlichte Kettenschlüssel und empfangene Daten).

# text
seg-b2f8ec90ae39 = <b>Signal- und Datenqualität.</b> Seiten werden per CRC geprüft und Alarmseiten verworfen, aber über das Signal, auf dem sie ankamen, ist nichts bekannt. Die Reed-Solomon-Wiederherstellung der I/NAV-Wörter { "1" } bis { "4" } wird nicht verwendet: Die Daten müssen direkt empfangen werden.

# text
seg-97313ba2bf88 = <b>Kein Dienst für die Positionsintegrität.</b> Authentifizierung besagt, dass die Daten vom System stammen. Sie sagt nichts über das Signal, auf dem sie ankamen, oder über die Güte der Lösung.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Einfaches Seitenformat.</b> Ein Seitenpaar pro Zeile: <c1/>, Kommentare mit <c2/> erlaubt. <c3/> ist GST in Sekunden (<c4/>) zu Beginn der Seite; das Hex sind die { "240" } Bits der geraden und der ungeraden Hälfte (Tails eingeschlossen), höchstwertiges Bit zuerst.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>Testvektor-CSV.</b> Das Layout der veröffentlichten Vektoren (<c1/>). Die Startzeit stammt aus <c2/> oder aus einem datierten Dateinamen.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Ein roher UBX-Bytestrom (<c1/>, automatisch erkannt). Galileo-E1-B-I/NAV-Nachrichten werden zu Seitenpaaren neu aufgebaut (<c2/>); andere Systeme, E5b, Alarmseiten und Rahmen mit falscher Prüfsumme werden ignoriert. SFRBX trägt keine Zeit, daher wird jede Seite aus der Zeit in ihren eigenen Daten (Word Types { "5" } und { "0" }) gestempelt und nur akzeptiert, wenn aufeinanderfolgende zeittragende Seiten mit der Anzahl der dazwischen empfangenen Seiten übereinstimmen; Seiten, die nicht eingeordnet werden können, werden verworfen, nie erraten. Diese Zeit stammt aus den Daten selbst und bietet keinen Schutz der Aktualität (siehe Zeit oben). Die Signal-ID { "0" } (E1-C) trägt keine Daten, daher ist es harmlos, sie neben E1-B zu akzeptieren. Ein vereinzeltes Synchronisationspaar mit absurder Länge hält den Leser nicht auf. Der Framing-Code ist eine dritte Kopie des UBX-Framings im Baum (<c3/>, die Eingabe des Empfänger-Vertrauens); er wird getrennt gehalten, damit das Verhalten des Empfänger-Vertrauens unverändert bleibt, und die drei könnten später einen Leser teilen. Das Wortlayout einer SFRBX-Nachricht stammt aus öffentlichen Beschreibungen und wurde nur an synthetischen Rahmen geprüft, nicht an einem Live-Empfänger.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = Die Textausgabe gibt den Status je Satellit und, mit <c1/>, je Tag und Epoche an; <c2/> gibt dasselbe mit der Tag-Liste. Exit-Status { "3" } bedeutet, dass eine Prüfung der Daten eines Satelliten fehlgeschlagen ist, { "2" } bedeutet einen Aufruf- oder Eingabefehler. Der Hinweis (beratend) oben wird auf jedem Pfad zuerst ausgegeben, Fehler und Aufrufhilfe eingeschlossen.

# text
seg-e2af23b756f5 = Aus Python und WebAssembly

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) und <c2/> (WebAssembly) führen denselben Verifizierer auf Bytes im Speicher aus und geben das JSON zurück, das <c3/> ausgibt, einschließlich des Hinweises (beratend). Der MCP-Server trägt es nicht: Die Eingabe ist ein langer roher Empfängerstrom, der mit der Kommandozeile und Python besser bedient ist, und ein Agentenwerkzeug würde eine große Eingabeoberfläche ohne Nutzen hinzufügen. Derselbe Hinweis und dieselben Grenzen gelten; der Status ist kein Navigationsintegritätsdienst.

# text
seg-0987c3b00a14 = Tests und Testdaten

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Die Testdaten sind synthetisch und werden vom eigenen Code und den eigenen Tests von Kshana erzeugt. In diesem Repository sind keine Vektoren, durchgerechneten Beispiele oder Schlüsselmaterial aus dem ICD oder den Guidelines gespeichert. Die Standardtests (<c1/> und die Unit-Tests) bauen aus den Gleichungen eine Kette, Seiten und Tags auf und prüfen die Konsistenz sowie dass absichtliche Beschädigung erkannt wird: ein gekipptes Navigationsbit, ein gekipptes Schlüsselbit, wiedereingespielte Tags, falsche Zeitstempel, eine Zeit außerhalb der Referenz, fehlende Daten und die Angriffe, die die Prüfung fand (ein gefälschter Subframe in ferner Zukunft, der einen Fehlschlag nicht löschen darf, eine Authentifizierung, die ablaufen und dem IODnav folgen muss, ein Alarm, NMA-Status „don't use“, Dummy-Tags, MACSEQ-Abweichung, widersprüchliche Schlüssel, Kettenwiderruf und -erneuerung, ein schlechtes Padding oder eine schlechte Signatur), wobei CMAC-AES, eine SHA3-256-Kette und eine P-521-Signatur durch den Verifizierer geführt werden. Da diese Daten aus unserer eigenen Lesart des ICD stammen, zeigen sie Selbstkonsistenz, nicht Konformität.

# text
seg-4906b14a33a3 = Die Primitive werden gegen veröffentlichte Known-Answer-Tests geprüft, von denen keiner aus dem ICD stammt: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) und RFC { "6979" } (ECDSA P-256). P-521-Signaturen werden auf Kodierung und Hash-Auswahl mit einem im Test erzeugten Wegwerfschlüssel geprüft; die Kurvenarithmetik stammt aus der Bibliothek.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = Die Übereinstimmung mit den offiziellen Vektoren wird von <c1/> geprüft, das optional ist: Es liest eine Kopie des offiziellen Testvektor-Archivs, die Sie selbst herunterladen, aus dem Verzeichnis, das <c2/> nennt, und tut nichts, wenn die Variable nicht gesetzt ist. Es speichert und verbreitet nichts, und Standardtestläufe verwenden kein Netzwerk. Es gibt dem Verifizierer nur eine Merkle-Wurzel und die öffentlichen Schlüssel eines Baums, wie ein Empfänger sie hätte, sodass Ketten aus dem signierten DSM-KROOT im Strom aufgebaut werden und der ganze Weg läuft: Merkle, Signatur, Schlüsselkette, MACSEQ und Tags. Es stellt je Vektorsatz fest: eine Untergrenze für die authentifizierten Tags, keines fehlgeschlagen, welche Ketten und Schlüssel der Strom ankündigt, authentifizierte Tags von ADKD { "0" }, { "4" } und { "12" }, dass die Authentifizierung nach Kettenende, Kettenwiderruf, Schlüsselwiderruf und neuem öffentlichen Schlüssel wieder einsetzt, dass die Alarmnachricht verifiziert wird und nichts authentifiziert zurücklässt, und dass jeder Vektor nur HMAC-SHA-256, eine SHA-256-Kette, 128-Bit-Schlüssel, 40-Bit-Tags und die Nachschlageeinträge { "33" } und { "34" } verwendet. Andere Algorithmen- und Parameterwahlen des ICD sind daher nur von den obigen Known-Answer- und synthetischen Tests abgedeckt.

# text
seg-70bb026ce655 = Abhängigkeiten

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = RustCrypto-Crates, reines Rust, MIT OR Apache-2.0, ohne Standard-Features gebaut: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> und <c6/> (das Feature <c7/>, nur zur Verifikation verwendet), neben <c8/>, das bereits im Baum ist. Sie bauen für <c9/> und bestehen <c10/>.

# text
seg-7ab62b91d469 = <s1>Zurück</s1>Vertrauen als Sicherheitstelemetrie

# text
seg-5dc48294fbb2 = <s1>Weiter</s1>LunaNet-augmentiertes Vorwärtssignal
