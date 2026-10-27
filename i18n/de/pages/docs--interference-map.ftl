# docs--interference-map: translations (de)

# attr:aria-label, text
seg-6555ff9a6d8e = Ausgabe

# text
seg-2247a2344710 = Bedeutung

# text
seg-c3c260b7063e = Tests

# text
seg-d4a762001549 = Lizenz

# text
# c1: docs/INTERFERENCE-MAP.md
seg-e7b6d071246e = Quelle: <c1/>

# text
# c1: kshana interference-map
# c2: kshana route-exposure
seg-143c73287d6c = <c1/> erstellt aus offen lizenzierten Tracking-Dateien, die Sie bereitstellen, ein Tagesbild davon, wo Luftfahrzeuge und Schiffe beeinträchtigte Navigationsdaten gemeldet haben. <c2/> gibt dann an, wie viel einer geplanten Route an jedem Tag innerhalb der betroffenen Zellen lag.

# text
seg-158f33f95ec3 = Was dies ist: eine Beschreibung dessen, wie veröffentlichte Positionsmeldungen an vergangenen Tagen aussahen. Was es nicht ist: eine Messung eines Empfängers, eine Prognose oder ein Beweis für Störungen. Eine beeinträchtigte oder anomale Zelle hat mehrere mögliche Ursachen (unten aufgeführt), und eine Zelle ohne Eintrag wurde schlicht nicht beobachtet.

# text
seg-64d3ee269407 = Alles läuft auf lokalen Dateien. Die Standardbefehle öffnen nie eine Netzwerkverbindung; der einzige optionale Download-Helfer braucht ein ausdrückliches Flag.

# attr:alt
seg-e251b385ff46 = Zwei synthetische Tage der Störungskarte, gezeichnet aus den eingecheckten Beispielen in examples/interference-map/output, jeweils mit eigener synthetischer Route und den Routenexpositionsanteilen, die die Engine meldet. Links ein ADS-B-Tag: { "1" } beeinträchtigte Zelle, { "6" } nicht beeinträchtigt, { "4" } nicht bewertet (schraffiert) und Zellen ohne Eintrag, leer gezeichnet, die nicht beobachtet wurden. Die Route ist { "525" } km lang: { "11.5" } % ihrer Länge in beeinträchtigten Zellen, { "38.3" } % nicht beeinträchtigt, { "9.1" } % nicht bewertet und { "41.1" } % nicht beobachtet. Rechts ein AIS-Tag: Zellen, die vom Kreis- und vom An-Land-Detektor markiert wurden, nicht anomale Zellen und leere Zellen; die Route ist { "454" } km lang, mit { "10.5" } % in anomalen Zellen, { "21.2" } % nicht anomal, { "0.0" } % nicht bewertet und { "68.3" } % nicht beobachtet. ADS-B und AIS sind getrennte Ebenen und werden nie kombiniert. Eine markierte Zelle ist kein Befund einer Störung, und eine Zelle ohne Farbe wurde nicht beobachtet, was nicht dasselbe ist wie unauffällig. Alle Daten sind erfunden, im offenen mittleren Atlantik, und keine Messung.

# text
# c1: examples/interference-map/output/
# c2: examples/interference-map/input/
# c3: kshana route-exposure
seg-765f43228dc6 = Beide Tage sind die synthetischen Beispiele in <c1/>, jeweils mit einer synthetischen Route in <c2/>; die Routenexpositionsanteile sind das, was <c3/> für sie ausgibt. Nichts darin ist ein realer Ort, ein reales Luftfahrzeug oder Schiff.

# text
seg-228f39c0305b = Daten und Lizenzen

# text
# c1: data/INTERFERENCE-DATA-SOURCES.md
# c2: --dataset
seg-d3336cc18ff7 = Eingebaut sind nur die in <a1><c1/></a1> geprüften Quellen, ausgewählt mit <c2/>:

# text
seg-b03d56f501c3 = Typ

# text
seg-2328672e782f = Lizenzfeld der Ausgabe

# text
seg-2319c7a6f6e2 = ODbL { "1.0" }

# text
seg-7464d3c830f3 = AIS

# text
seg-c13f76567536 = US-gemeinfrei (CC0 { "1.0" } laut Herausgeber)

# text
seg-636c2bb6f29d = gemeinfrei

# text
seg-f6f4e431d36d = NLOD { "2.0" }

# text
seg-5621e3a3908f = beides

# text
seg-6b3a1f8ca649 = was Sie angeben

# text
# c1: --licence
# c2: --licence-url
# c3: --attribution
seg-be349e2c455f = <c1/>, <c2/>, <c3/> erforderlich

# text
seg-590344d1eae5 = Jede Ausgabedatei bettet die Lizenz, die Lizenz-URL, die erforderliche Namensnennung und die Abdeckungsgrenzen der Quelle ein. Für Quellen, deren Bedingungen die kommerzielle Nutzung oder die Weiterverbreitung abgeleiteter Karten verbieten, gibt es keinen eingebauten Eintrag.

# text
# c1: licence
seg-2d8eaefab0f8 = <b>ODbL und Editionen von Kshana.</b> Eine ADS-B-Datei je Zelle, die aus Daten von adsb.lol erstellt wurde, ist eine Derived Database und wird unter ODbL { "1.0" } freigegeben; ihr Feld <c1/> sagt das. Der eigene Code von Kshana bleibt AGPL-3.0. Kommerzielle Editionen von Kshana, die solche Dateien schreiben, tragen denselben Hinweis, und wer die Datei erneut veröffentlicht, muss ihn beibehalten. ADS-B- und AIS-Ergebnisse werden nie in einer Datei kombiniert, damit die ODbL nicht auf die AIS-Ebene übergreift.

# text
seg-bb4932d5d15c = <b>Abdeckungsverzerrung.</b> Karten erben die Abdeckung ihrer Quelle. adsb.lol folgt freiwilligen Empfängern, daher sind das offene Meer und dünn abgedeckte Regionen spärlich besetzt. Die offenen Daten von Kystverket lassen Fischereifahrzeuge unter { "15" } m und Freizeitfahrzeuge unter { "45" } m aus, daher spiegelt ihre Karte größere Schiffe wider. MarineCadastre deckt nur US-Gewässer ab.

# text
seg-713babc3963b = <b>Kennungen.</b> Eingabezeilen tragen eine Kennung eines Luftfahrzeugs oder Schiffs. Sie wird im Arbeitsspeicher mit einem zufälligen Salt je Lauf gehasht, nur zum Zählen verschiedener Luftfahrzeuge oder Schiffe verwendet und nie geschrieben, protokolliert oder ausgegeben. Ausgaben sind aggregiert: Nirgends in ihnen erscheint eine Kennung.

# text
# c1: 5
# c2: null
seg-fa3c70a8997a = <b>Unterdrückung.</b> Eine Zelle mit weniger als <c1/> an diesem Tag beobachteten verschiedenen Luftfahrzeugen oder Schiffen wird überhaupt nicht veröffentlicht, und bei AIS wird eine markierte Anzahl von eins oder zwei in einer veröffentlichten Zelle als <c2/> gemeldet. Kein veröffentlichter Wert kann ein einzelnes Luftfahrzeug oder Schiff herausgreifen.

# text
seg-02dbfcb9c808 = Eingabeformate

# text
# c1: YYYY-MM-DDTHH:MM:SS[.fff]Z
seg-2f291f986a87 = Einfaches CSV mit Kopfzeile, kommagetrennt, ohne Anführungszeichen, UTC-Zeiten. Die Spaltenreihenfolge ist frei; unbekannte Spalten werden ignoriert. Ein Zeitstempel sind Unix-Sekunden oder <c1/>. Zeilen, die sich nicht parsen lassen, werden in den Metadaten der Ausgabe gezählt und nicht stillschweigend verworfen.

# text
# c1: kshana interference-map adsb
seg-571365be20a5 = ADS-B (<c1/>):

# text
seg-aaeff8f42699 = Spalte

# text
seg-b10a51ed96c0 = Erforderlich

# text
seg-357c2320b43a = ja

# text
seg-14ac5d0f109b = Meldezeit

# text
seg-6dbe5595d0be = opake Kennung (gehasht, nie gespeichert)

# text
seg-c5fb6b91dc68 = Grad

# text
# c1: ground
seg-e283838c85aa = Höhe in Fuß; <c1/> oder leer schließt die Zeile aus

# text
seg-9ab90c35bd7d = mindestens eine

# text
seg-868e5b9c00ab = ganze Zahlen { "0" } bis { "11" }; leer bedeutet nicht gemeldet

# text
seg-db907db790b1 = nein

# text
# c1: adsb
seg-5c2ce9f61700 = falls vorhanden, werden nur Werte verwendet, die mit <c1/> beginnen (MLAT, TIS-B und dergleichen sind ausgeschlossen)

# text
# c1: tar -xf -
# c2: trace_full_*.json
seg-412f40b8eeb1 = <b>Verlauf von readsb bei adsb.lol, direkt gelesen.</b> Die Tagesarchive sind ein geteiltes tar aus readsb-Trace-Dateien. Entpacken Sie eines, wie der Herausgeber es beschreibt (die Teile aneinanderhängen, <c1/>), und geben Sie Kshana dann das entpackte Verzeichnis, eine einzelne Datei <c2/> oder ein CSV:

# text
# c1: trace_full_*
# c2: trace_recent_*
# c3: .json
# c4: ground
# c5: nic
# c6: nac_p
# c7: trace_files_unreadable
seg-6e7d378bd89b = Ein Verzeichnis wird rekursiv nach Dateien <c1/> durchsucht (andere Dateien, etwa <c2/>, werden ignoriert, und symbolischen Links wird nicht gefolgt). Jede Datei ist gzip-komprimiert oder reines JSON, erkannt an den ersten Bytes, weil readsb gzip unter einem Namen mit <c3/> schreibt; die Dekompression ist auf { "512" } MiB je Datei begrenzt. Aus jedem Trace-Eintrag liest Kshana den Zeitversatz, Breite, Länge, Höhe (die Markierung <c4/> schließt den Eintrag aus), die Felder <c5/> und <c6/> des Detailobjekts des Luftfahrzeugs und die Zeichenkette der Positionsquelle (Einträge von allem außer ADS-B werden ausgeschlossen). Ein Eintrag ohne Detailobjekt hat keine Genauigkeitsfelder und wird als ausgeschlossen gezählt. Eine Datei, die sich nicht lesen lässt, wird in den Metadaten der Ausgabe in <c7/> gezählt und übersprungen.

# text
# c1: kshana interference-map ais
seg-b1502f7f4c98 = AIS (<c1/>):

# text
seg-91395984ddac = Grad; die AIS-Werte „nicht verfügbar“ und ({ "0" }, { "0" }) werden verworfen

# text
seg-34ae94eb1797 = Geschwindigkeit über Grund in Knoten; { "102.3" } (nicht verfügbar) wird als fehlend behandelt

# text
# c1: --land
# c2: --land
seg-a1e60af5adaa = Der An-Land-Detektor braucht eine Landpolygon-Datei (<c1/>): GeoJSON Polygon oder MultiPolygon. Vorgesehen ist die Landebene von Natural Earth im Maßstab { "1" }:{ "10" } Millionen (gemeinfrei). Ohne <c2/> ist der Detektor aus, und die Ausgabe sagt das. So laden Sie sie herunter (der einzige Netzwerkzugriff in dieser Funktion):

# text
# c1: curl
# c2: curl
seg-cd55a09894c5 = Dies führt das System-<c1/> (als Argumentliste, nicht über eine Shell) einmalig über HTTPS aus, für eine Datei an einer festen Adresse, die einen einzelnen Commit des Upstream-Repositorys benennt. Der Download wird nur behalten, wenn sein SHA-256 dem im Code festgeschriebenen Wert entspricht; bei Abweichung wird er gelöscht und schlägt fehl. Ist <c2/> nicht installiert, sagt der Befehl das und nennt die Adresse und die Prüfsumme, sodass die Datei von Hand geholt werden kann. Nichts davon wird im Repository mitgeliefert.

# text
# c1: --out
# c2: <source>-<dataset>-<YYYY-MM-DD>.geojson
# c3: <source>
# c4: adsb
# c5: ais
# c6: <dataset>
# c7: --dataset
# c8: adsb-lol
# c9: noaa-marinecadastre
# c10: kystverket
# c11: custom
# c12: adsb-adsb-lol-2026-03-01.geojson
# c13: ais-kystverket-2026-03-01.geojson
# c14: ^(adsb|ais)-(.+)-(\d{4}-\d{2}-\d{2})\.geojson$
# c15: source_kind
# c16: data.dataset
# c17: date
# c18: examples/interference-map/output/
# c19: kshana_interference_map
# c20: cell_i
# c21: cell_j
# c22: status
# c23: degraded
seg-95eeaa0033b3 = Eine GeoJSON-Datei je Quelle und UTC-Tag im Verzeichnis <c1/>, benannt <c2/>, wobei <c3/> <c4/> oder <c5/> ist, <c6/> der Schlüssel <c7/> (<c8/>, <c9/>, <c10/> oder <c11/>) und das Datum der UTC-Tag der Meldungen: <c12/>, <c13/>. Der Datensatz steht im Namen, damit zwei Datensätze eines Typs sich keine Datei teilen können, und <b>Kshana überschreibt nie eine Datei</b>: Existiert ein Ziel, schlägt der Befehl fehl, bevor etwas geschrieben wird. Die CLI gibt für jede geschriebene Datei eine Zeile aus. Ein Leser kann die drei Teile mit <c14/> zurückgewinnen; dieselbe Information steht in der Datei (<c15/>, <c16/>, <c17/>). Synthetische Beispieldateien, eine je Quelle, liegen in <c18/>, mit dem Befehl, der sie neu erzeugt, zum Bauen und Testen eines Viewers. Ein Member <c19/> auf oberster Ebene enthält den Schemanamen, das Datum, das Gitter, die Methoden-ID und jeden Parameter, die Zahlen auf Tagesebene, die Datenlizenz und Namensnennung sowie einen Hinweis. Jedes Feature ist ein Zellpolygon mit <c20/>, <c21/>, <c22/>, <c23/> und den aggregierten Zählwerten.

# text
# c1: --cell-deg
# c2: --cell-deg
# c3: grid.preregistered_cell_deg
# c4: grid.is_preregistered
seg-1ee702004726 = Das Gitter ist fest: quadratische Zellen von <c1/> Grad (Standard { "0.5" }) in Breite und Länge, indiziert ab (-90, -180). Die Ost-West-Breite schrumpft mit der Breite: beim Standard etwa { "55" } km am Äquator und etwa { "28" } km bei { "60" } Grad. Die Breite { "90" } gehört zur letzten Zeile, und die Länge { "180" } ist derselbe Meridian wie -180. <b>Die vorab festgelegten Methoden sind auf dem Gitter von { "0.5" } Grad definiert.</b> Ein anderes <c2/> läuft, ist aber nicht die vorab festgelegte Methode: Die CLI sagt das, und die Datei hält <c3/> und <c4/> (false) fest, damit ein Viewer es ebenfalls sagen kann.

# text
# c1: null
# c2: null
# c3: status
# c4: degraded
# c5: aircraft_observed
# c6: aircraft_sampled
# c7: aircraft_affected
# c8: null
# c9: affected_share
# c10: null
# c11: vessels_flagged
# c12: null
seg-6e1e8f2a9082 = <b>Zurückgehaltene Zählwerte.</b> Jeder Zählwert je Zelle unterhalb des Veröffentlichungsminimums ({ "5" }) ist <c1/>, auch null, sodass <c2/> nie „keine“ bedeutet und kein veröffentlichter Wert ein Luftfahrzeug oder Schiff herausgreifen kann. Die Felder <c3/> und <c4/> werden weiterhin angegeben. In ADS-B-Dateien ist <c5/> für eine veröffentlichte Zelle immer mindestens { "5" }; <c6/> und <c7/> sind unter { "5" } <c8/>, und <c9/> ist <c10/>, sofern nicht beide mindestens { "5" } sind (ein Anteil würde einen zurückgehaltenen Zählwert verraten). In AIS-Dateien ist jeder Eintrag von <c11/> unter { "5" } <c12/>.

# text
seg-fd929d6ee90b = Formatversion und Felder

# text
# c1: schema: "kshana-interference-map/v1"
# c2: format_version: 1
# c3: null
seg-ff443e9cbd20 = Das Format ist festgelegt als <c1/>, <c2/>. Eine Änderung, die ein Feld entfernt oder umbenennt oder seine Bedeutung ändert, erhöht die Version; das Hinzufügen eines Felds tut das nicht, daher muss ein Leser Felder ignorieren, die er nicht kennt. Ein Zählwert, der <c3/> ist, ist zurückgehalten, nicht null.

# text
# c1: status
# c2: degraded
# c3: not_degraded
# c4: insufficient_sample
# c5: withheld_day_confounded
# c6: withheld_no_background
# c7: anomalous
# c8: not_anomalous
# c9: degraded
# c10: degraded
# c11: anomalous
# c12: kshana-route-exposure/v1
seg-60818bfc3f90 = Werte von <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> ist nur für <c10/> und <c11/> wahr. Der Routenexpositionsbericht hat sein eigenes Schema <c12/>.

# text
seg-ea526ebdd260 = Observatory: das Tagesprodukt

# text
# c1: kshana interference-map daily
# c2: kshana interference-map sensitivity
# c3: --delay-hours
# c4: degraded
# c5: not_degraded
# c6: not_observed
# c7: observatory/METHOD.md
# c8: --bbox south,west,north,east
seg-e33f63fe5c0a = <c1/> macht aus einem UTC-Tag mit ADS-B-Meldungen die drei Dateien des Observatory (GeoJSON, PNG und ein JSON mit Vorfallsbericht) und ein Hash-Manifest, und <c2/> spielt diesen Tag unter einzelnen, nacheinander vorgenommenen Änderungen der vorab festgelegten Parameter erneut ab. Der Befehl erzwingt die Freigaberegeln: mindestens { "24" } h nach Ende des Tages (<c3/> darf nur erhöht werden), Zellen von { "0.5" } Grad oder gröber, nur drei Zustände (<c4/>, <c5/>, <c6/>), keine zugeschriebene Ursache und keine OpenSky-Daten. Die Methodennotiz, die Dateiformate und die Grenzen stehen in <a1><c7/></a1>. Ein regionaler Lauf (<c8/>) liest nur die Meldungen der Box und sagt das in der Datei.

# text
seg-31ce42fc05dc = Spezifikation der Studio-Kartenseite

# text
seg-a9aca2e2d390 = Für die Kartenseite des Studio, die eine vom Nutzer bereitgestellte GeoJSON-Datei lädt (die Seite wird im Studio-Quellcode gebaut, nicht in diesem Repository). Nichts wird hochgeladen: Die Datei wird im Browser gelesen, und die Seite stellt keine Anfrage an irgendeine Datenquelle.

# text
# c1: kshana_interference_map.schema
# c2: kshana-interference-map/
# c3: format_version
seg-064ec5d4c91a = <b>Eine Datei lesen.</b> Eine Datei nur akzeptieren, wenn <c1/> mit <c2/> beginnt und <c3/> eine Zahl ist, die die Seite unterstützt; andernfalls sagen, dass die Datei keine unterstützte Störungskarte von Kshana ist. Die oben aufgeführten Felder lesen; unbekannte ignorieren. Eine Datei enthält eine Quelle und einen Tag. Es können mehrere Dateien geladen werden.

# text
# c1: status
seg-5be32f8cff46 = <b>Zellen.</b> Das Polygon jedes Features zeichnen. Nach <c1/> einfärben und in einer Legende stets angeben, was jede Farbe bedeutet. Vier Zustände, von denen keiner ausgeblendet oder zusammengeführt werden darf:

# text
seg-b652b86e6b8e = Zustand

# text
seg-4a511b6a03e3 = Woher er kommt

# text
seg-f92da2236260 = Beeinträchtigt (bei AIS anomal)

# text
seg-591ebe8007cb = ein hoher Anteil der Luftfahrzeuge meldete an diesem Tag geringe Genauigkeit, oder Schiffe zeigten Anomalien

# text
# c1: degraded
seg-bd993c64b6e8 = <c1/> ist wahr

# text
seg-88d43eb1c14a = Unauffällig

# text
seg-af5f7989fd09 = mit genügend Luftfahrzeugen oder Schiffen beobachtet und nicht markiert

# text
# c1: status
# c2: not_degraded
# c3: not_anomalous
seg-2bc810e02210 = <c1/> ist <c2/> oder <c3/>

# text
seg-d894eaa21369 = Nicht bewertet

# text
seg-38c88ed94111 = beobachtet, aber nicht genug erfasste Luftfahrzeuge, der Tag war konfundiert, oder der Hintergrund des Tages ließ sich nicht schätzen

# text
# c1: status
# c2: insufficient_sample
# c3: withheld_day_confounded
# c4: withheld_no_background
seg-e358a8c7903f = <c1/> ist <c2/>, <c3/> oder <c4/>

# text
seg-013b7c903426 = Nicht beobachtet

# text
seg-81bcffa57ec2 = zu wenige Luftfahrzeuge oder Schiffe, daher wurde die Zelle nicht veröffentlicht

# text
seg-6828d71822bd = kein Feature für diese Zelle

# text
# c1: properties
# c2: null
# c3: grid.is_preregistered
seg-753192a770ac = „Nicht beobachtet“ ist das Fehlen eines Features: neutral zeichnen (ohne Füllung oder mit Schraffur), nie in der Farbe von „unauffällig“. Ein Farbschema verwenden, das sich nicht allein auf Rot gegen Grün stützt. Zelldetails bei Hover oder Auswahl zeigen die Zählwerte in <c1/> wie angegeben und jeden Zählwert <c2/> als „zurückgehalten (weniger als { "5" })“, nie als null. Ein Viewer sollte außerdem sagen, wenn <c3/> false ist, dass die Datei eine Zellgröße außerhalb der vorab festgelegten Methode verwendet.

# text
seg-e90fedf7ad89 = <b>Ebenen.</b> ADS-B und AIS sind getrennte Ebenen mit eigenen Schaltern, Legenden und Lizenzzeilen. Sie nie in ein Farbfeld oder eine Zahl zusammenführen, nie als eine kombinierte Zelle zeichnen und ihre Zellen nie summieren. Verschiedene Tage sind verschiedene Dateien: einen Tag nach dem anderen mit einer Tagesauswahl zeigen, statt Tage zu überlagern.

# text
# c1: data.attribution
# c2: data.licence
# c3: data.licence_url
# c4: data.coverage_notes
seg-6d500d3c0baa = <b>Lizenz und Namensnennung.</b> Für jede sichtbare Ebene auf der Karte und in jedem Export oder Screenshot den Text von <c1/> wörtlich zeigen, <c2/> mit einem Link auf <c3/> und <c4/>. Wird eine ADS-B-Ebene gezeigt, gilt ihre ODbL-Lizenz nur für diese Ebene. Keinen Export einer kombinierten Datei anbieten.

# text
# c1: method.id
# c2: method.parameters
# c3: day
# c4: day_confounded
# c5: input_stats
seg-6f786153ef8e = <b>Methode.</b> Die Methoden-ID und die Parameter (<c1/>, <c2/>) und die Zahlen von <c3/> in einem Detailbereich anbieten, einschließlich <c4/> (deutlich sagen, dass wegen des Hintergrunds des Tages keine Zelle als beeinträchtigt bezeichnet wurde) und <c5/>.

# text
# c1: method.caveats
# c2: notice
seg-905348837439 = <b>Vorbehalte, die zu behalten sind</b> (die eigenen <c1/> und <c2/> der Datei zeigen und diese Formulierung oder ihr Äquivalent mit der Karte sichtbar halten):

# text
seg-1f70e308010a = Eine beeinträchtigte oder anomale Zelle ist kein Befund einer Störung. Es gibt andere Ursachen.

# text
seg-7cde0ddadb73 = Eine Zelle ohne Farbe wurde nicht beobachtet. Sie ist kein Beleg dafür, dass das Gebiet unauffällig war.

# text
seg-1135dfeadb8f = Dies ist eine Beschreibung vergangener Positionsmeldungen, keine Prognose und keine Messung eines Empfängers.

# text
seg-3ad1216bf3ed = Die Abdeckung folgt der Datenquelle; lesen Sie die Hinweise zur Abdeckung.

# text
seg-046f6af48349 = Die Seite darf kein einzelnes Luftfahrzeug und kein einzelnes Schiff nennen oder zeigen, und die Dateien enthalten keines.

# text
# c1: kshana-route-exposure/v1
# c2: caveats
# c3: map_licence
# c4: map_attribution
seg-ae79b67c3b98 = <b>Routenexposition.</b> Lädt die Seite auch einen Bericht <c1/>, seine Zeilen je Tag und Quelle mit den vier Anteilen (beeinträchtigt, unauffällig, nicht bewertet, nicht beobachtet) zusammen zeigen, nie den Anteil beeinträchtigt allein, dazu die <c2/> des Berichts und <c3/> und <c4/> jeder Zeile.

# text
# c1: kshana-interference-map/adsb/v2
seg-98131acf49d8 = ADS-B-Methode (<c1/>)

# text
seg-83b660b0bfa6 = Jede ADS-B-Meldung eines Luftfahrzeugs in der Luft trägt zwei selbst bewertete Felder zur Navigationsqualität: NIC (der Einschlussradius der Position) und NACp (die { "95" }-%-Genauigkeitsgrenze, EPU). Wenn der Empfänger an Bord seine Satellitenlösung verliert oder ihr misstraut, fallen beide, weshalb sie eine Signatur von Störungen tragen. Sie fallen auch aus anderen Gründen.

# text
seg-4b9020a68db6 = <b>Vorab festgelegte Parameter</b> (Konstanten im Code, in jede Datei geschrieben; eine Änderung bedeutet eine neue Methodenversion):

# text
seg-e73ea9921fcf = Parameter

# text
seg-8650fa804f14 = Höhenuntergrenze

# text
seg-25056ee5a36c = barometrische Höhe von mindestens { "5000" } ft

# text
seg-17322eff480a = Meldung mit geringer Genauigkeit

# text
seg-48ab6ed5eedd = NACp höchstens { "6" } (die gemeldete EPU-Grenze beträgt { "556" } m, { "0.3" } NM, oder mehr, oder ist unbekannt) oder NIC höchstens { "5" } (die gemeldete Grenze des Einschlussradius beträgt { "1852" } m, { "1" } NM, oder mehr, oder ist unbekannt)

# text
seg-84beb488319d = Gute Meldung

# text
seg-2595055d9593 = NACp mindestens { "8" } und NIC mindestens { "7" }; beurteilt an den Feldern, die die Eingabe hat (an beiden, wenn beide vorhanden sind, sonst am vorhandenen)

# text
seg-b4bbce695b2d = Geräte-Basislinie

# text
seg-4986ed51f600 = ein Luftfahrzeug zählt in einer Zelle nur mit mindestens { "5" } guten Meldungen außerhalb dieser Zelle am selben Tag

# text
seg-42859d1d785b = In einer Zelle erfasste Luftfahrzeuge

# text
seg-1ae26d6d99a9 = mindestens { "3" } Meldungen in der Zelle

# text
seg-48bba15e2e0e = In einer Zelle betroffene Luftfahrzeuge

# text
seg-1fe9c3ab930c = mindestens { "50" } % seiner Meldungen in der Zelle haben geringe Genauigkeit

# text
seg-b147473d133c = Mindeststichprobe

# text
seg-33060cda8536 = mindestens { "10" } erfasste Luftfahrzeuge

# text
seg-009ca23b9cd6 = Beeinträchtigt

# text
seg-afef85ae2a25 = mindestens { "5" } betroffene Luftfahrzeuge, ein Anteil betroffener an den erfassten Luftfahrzeugen von mindestens { "0.30" } und mindestens { "0.15" } über dem Median der Zellanteile des Tages

# text
seg-890dcc56fa5c = Konfundierter Tag

# text
seg-b27768e64d62 = Median der Zellanteile (über mindestens { "5" } Zellen mit vollständiger Stichprobe) mindestens { "0.15" }: keine Zelle wird als beeinträchtigt erklärt

# text
seg-18fbf3c348c9 = Kein Hintergrund

# text
# c1: withheld_no_background
seg-534111e0c6ad = weniger als { "5" } Zellen mit vollständiger Stichprobe, daher lässt sich der Median nicht schätzen: Eine Zelle, die die Schwellen erfüllt, ist <c1/>, nicht beeinträchtigt

# text
seg-b571f127c595 = Veröffentlichungsminimum

# text
seg-60621ffc5bcf = mindestens { "5" } verschiedene beobachtete Luftfahrzeuge

# text
# c1: degraded
# c2: not_degraded
# c3: insufficient_sample
# c4: withheld_day_confounded
# c5: withheld_no_background
seg-f36389caf81b = Diese Werte wurden aus den Definitionen der NIC- und NACp-Codes und aus der Datenschutzregel festgelegt, bevor irgendwelche Daten angesehen wurden. Sie wurden nicht an realen Daten abgestimmt, und die Tests verwenden nur synthetische Daten. Zellstatus: <c1/>, <c2/>, <c3/> (veröffentlicht, aber weniger als { "10" } erfasste Luftfahrzeuge), <c4/> und <c5/>.

# text
# c1: withheld_no_background
seg-c89afc07989b = <b>Version { "2" }.</b> Version { "1" } erklärte eine Zelle schon bei nur { "3" } betroffenen Luftfahrzeugen als beeinträchtigt, weniger als das Veröffentlichungsminimum von 5 Luftfahrzeugen, und übersprang die Prüfung des Tageshintergrunds stillschweigend, wenn weniger als { "5" } Zellen vollständig erfasst waren. Version { "2" } verlangt mindestens { "5" } betroffene Luftfahrzeuge und hält die Aussage (<c1/>) zurück, wenn sich der Hintergrund nicht schätzen lässt. Beide Änderungen verschärfen die Methode (nichts, was in Version { "1" } nicht beeinträchtigt war, ist in Version { "2" } beeinträchtigt); der Grund ist, dass eine veröffentlichte Aussage nie auf weniger Luftfahrzeugen beruhen darf als der Zahl, unter der Zählwerte zurückgehalten werden. Dateien der Version { "1" } wurden nicht freigegeben.

# text
seg-ffd0e5175548 = Warum Genauigkeitsfelder aus anderen Gründen als Störungen fallen, und der jeweilige Schutz:

# text
seg-12b613a77f64 = Ursache

# text
seg-e30479c3e5d8 = Schutz

# text
seg-ecac3d226210 = Ältere Transponder, die NIC oder NACp nie melden oder mit einem festen niedrigen Wert melden

# text
seg-8b504b60fcc0 = die Geräte-Basislinie: Ein Luftfahrzeug ohne gute Meldungen anderswo am selben Tag wird nicht gezählt

# text
seg-1df45f128708 = Geringe Höhe und Betrieb am Boden (Geländeabschattung, andere Positionsformate)

# text
# c1: ground
seg-cc5f23f0da05 = Höhenuntergrenze; mit <c1/> markierte Zeilen ausgeschlossen

# text
seg-ddf6aeb47dbe = MLAT oder andere Nicht-GNSS-Positionen

# text
# c1: source_type
seg-51162a1835d1 = Filter <c1/>, wenn die Spalte vorhanden ist

# text
seg-08196503a657 = Ein Luftfahrzeug, das viele Meldungen sendet

# text
seg-bf13dfa85dbe = es werden verschiedene Luftfahrzeuge gezählt, nicht Meldungen

# text
seg-bbcb809624bc = Ein Ausfall einer Konstellation oder Augmentation oder ein Weltraumwetterereignis, das die Genauigkeit über ein weites Gebiet senkt

# text
seg-5f428bb7ad4a = die Zelle muss den Median der Zellanteile des Tages um eine Marge übersteigen, und ein Tag, dessen Median selbst hoch ist, wird als konfundiert markiert und erklärt keine Zelle

# text
seg-30290253a95d = Ein Fehler in der Ausrüstung eines einzelnen Luftfahrzeugs

# text
seg-b673195405ff = braucht einen Anteil vieler verschiedener Luftfahrzeuge, mit einer Mindeststichprobe

# text
seg-aeebeded71be = Wenige Luftfahrzeuge in der Zelle

# text
seg-c33c60b49b17 = Mindeststichprobe; unter { "5" } beobachteten wird die Zelle nicht veröffentlicht

# text
seg-dc8abb9b411f = Was bleibt: Die Methode kann Störungen nicht von einer regionalen Ursache unterscheiden, die lokal statt großflächig ist (ein lokaler Effekt der Satellitengeometrie oder ein Ausfall einer bodengestützten Augmentation sähe gleich aus), und sie ist in einer Richtung konservativ: Ein Luftfahrzeug, das den ganzen Tag nur innerhalb einer betroffenen Region fliegt, hat keine Basislinie und wird nicht gezählt, sodass dauerhafte große Gebiete zu gering ausgewiesen werden.

# text
# c1: kshana-interference-map/ais/v2
seg-41d725eeaba9 = AIS-Methode (<c1/>)

# text
# c1: anomalous
seg-7fd53079dccf = Je Schiff und Tag fünf Detektoren. Ein Detektor <b>qualifiziert sich</b> in einer Zelle, wenn er mindestens { "5" } verschiedene Schiffe markiert, die mindestens { "20" } % der dort beobachteten Schiffe ausmachen; die Zelle ist <c1/>, wenn irgendein Detektor sich qualifiziert.

# text
seg-6d599353e8e1 = Detektor

# text
seg-551f38a9061c = Regel (vorab festgelegt)

# text
seg-295e8a28a5b9 = mindestens { "3" } Meldungen in der Zelle, mehr als { "2000" } m landeinwärts der gelieferten Küstenlinie

# text
seg-fd21160e6685 = ein Fenster von { "20" } aufeinanderfolgenden Meldungen (Schrittweite { "10" }, Lücken höchstens { "30" } min), dessen mittlerer Radius vom Schwerpunkt { "500" } m bis { "20" } km beträgt, Variationskoeffizient des Radius höchstens { "0.15" }, eine Fahrtrichtung mit einer Gesamtdrehung von mindestens { "270" } Grad (Schritte höchstens { "90" } Grad, netto mindestens { "80" } % der Summe) und mittlere Geschwindigkeit mindestens { "2" } kn

# text
seg-1aa30db06794 = mindestens { "2" } Sprünge, die in der Zelle eintreffen: aufeinanderfolgende Meldungen mindestens { "1000" } m voneinander entfernt, höchstens { "1" } h auseinander, was mehr als { "70" } kn bedeutet (die implizierte Geschwindigkeit setzt mindestens { "1" } s zwischen den Meldungen an, sodass zwei Meldungen mit demselben Zeitstempel und Positionen im Abstand von { "1" } km oder mehr als Sprung zählen)

# text
seg-7f9b22254009 = mindestens { "3" } gemeldete Geschwindigkeiten über { "70" } kn in der Zelle

# text
seg-e0d0968e8751 = mindestens { "5" } verschiedene Schiffe, die dieselbe Position melden (gerundet auf { "1e-4" } Grad, etwa { "11" } m) im selben 10-Minuten-Fenster

# text
# c1: null
seg-1bf4c460672c = Zellen mit weniger als { "5" } verschiedenen Schiffen werden nicht veröffentlicht; jede markierte Anzahl unter { "5" }, Null eingeschlossen, wird als <c1/> gemeldet.

# text
# c1: anomalous
seg-b2ea2ec6bad1 = <b>Version { "2" }.</b> Version { "1" } qualifizierte einen Detektor aus { "3" } markierten Schiffen und veröffentlichte Anzahlen von { "3" } und { "4" }. Version { "2" } hebt das Minimum markierter Schiffe auf { "5" } an, das Veröffentlichungsminimum, sodass sich ein Urteil <c1/> nie auf weniger Schiffe stützt als auf die Zahl, unter der Anzahlen zurückgehalten werden. Das verschärft die Methode, und es wurde keine Datei der Version { "1" } veröffentlicht.

# text
seg-25593339aeb0 = <b>Bekannte Ursachen für Fehlalarme</b>, die die Anteilsregel und die Schwellen verringern, aber nicht beseitigen: Schiffe in Flüssen, Kanälen und Häfen nahe einer groben Küstenlinie (dafür gibt es den Binnenlandpuffer von { "2" } km); zwei Schiffe, die eine Kennung teilen, was wie Sprünge aussieht; Transponder mit schlechter Ortung oder Testgeräte; und Kreisfahrten von Lotsenbooten und Suchschiffen, die Kreisen ähneln können. Eine Küstenlinien-Datei im Maßstab { "1" }:{ "10" } Millionen ist auf etwa einen Kilometer genau.

# text
seg-ac661440a29a = Die Sprung- und Geschwindigkeitsdetektoren vergleichen Meldungen innerhalb einer Eingabedatei; eine auf mehrere Dateien oder Tage verteilte Spur wird nicht zusammengefügt.

# text
seg-05f789b26904 = <b>Speicher.</b> Die Eingabe wird zeilenweise gelesen und nie als Ganzes gehalten. ADS-B hält nur Zähler je Luftfahrzeug und Zelle. AIS hält jede akzeptierte Meldung in einem kompakten Datensatz (etwa { "40" } Byte), bis ihr Tag ausgewertet ist; der Speicherbedarf wächst also mit der Zahl der AIS-Meldungen in der Eingabe; teilen Sie eine sehr große AIS-Eingabe nach Tagen auf.

# text
seg-206c78a69ded = Routenexposition

# text
# c1: --route
# c2: lat,lon
# c3: --map
seg-0d8832796ab7 = <c1/> ist ein GeoJSON-LineString (einzeln, in einem Feature oder in einer FeatureCollection) oder eine CSV aus Zeilen der Form <c2/>. <c3/> nimmt Kartendateien oder Verzeichnisse davon entgegen und darf wiederholt werden. Wegpunkte werden durch gerade Linien in Breite und Länge verbunden, verdichten Sie also lange Abschnitte; ein Abschnitt nimmt in der Länge den kurzen Weg herum, sodass einer, der den Antimeridian ({ "179.5" } E nach { "179.5" } W) quert, ihn auch quert. Die Route wird in Stücke von etwa { "250" } m zerlegt. Jedes Stück wird zwischen seinen eigenen zwei Endpunkten auf einer Kugel mit dem Radius { "6371.0088" } km gemessen (derselbe Pfad, der entscheidet, in welcher Zelle es liegt) und der Zelle zugeordnet, die seinen Mittelpunkt enthält.

# text
# c1: share_degraded
# c2: share_not_degraded
# c3: share_unassessed
# c4: share_not_observed
seg-cc5e2553700b = Je Tag und je Quelle gibt der Bericht die Routenlänge und vier Anteile an, die sich zu { "1" } summieren: <c1/>, <c2/>, <c3/> (Zelle vorhanden, aber ohne Urteil) und <c4/> (Zelle fehlt in der Karte). Lesen Sie die letzten beiden zusammen mit dem ersten: Bei einer Route mit niedrigem Anteil beeinträchtigter Zellen und hohem Anteil nicht beobachteter Zellen ist nicht gezeigt, dass sie frei ist. ADS-B- und AIS-Zeilen werden getrennt gemeldet und nie kombiniert. Jede Zeile trägt die Lizenz und die Quellenangabe der Karte.

# text
seg-3a087d90e317 = Bibliotheksfunktionen

# text
# c1: kshana::interference_map::api
seg-67ea1ff00bb8 = Für Aufrufer, die Daten im Speicher halten (Bindings, der MCP-Server, der Browser-Build), stellt das Modul <c1/> dieselben Methoden bereit, mit Text oder Bytes als Eingabe und JSON als Ausgabe, ohne eine Datei oder das Netz zu berühren:

# text
seg-4dbf41c0ec3b = Funktion

# text
seg-95f87a38a522 = Eingabe

# text
seg-0fe8ff25f4a1 = Ausgabe

# text
seg-9e99af2c1f84 = ADS-B-CSV-Text

# text
seg-e144f449c5b4 = ein Byte-Slice je readsb-Trace-Datei (gzip oder unkomprimiert)

# text
seg-7effd7110c4c = AIS-CSV-Text, optional GeoJSON-Text des Landes

# text
# c1: YYYY-MM-DD
seg-10c5e0c0a9c8 = Routentext, Karten-GeoJSON-Texte, optional Grenzen <c1/>

# text
# c1: kshana-route-exposure/v1
seg-be00d23d96e9 = <c1/>-JSON

# text
# c1: DayMap
# c2: file_name
# c3: <source>-<dataset>-<date>.geojson
# c4: date
# c5: geojson
# c6: DatasetSpec
# c7: Preset("adsb-lol" | "noaa-marinecadastre" | "kystverket")
# c8: Custom { licence, licence_url, attribution }
# c9: DEFAULT_CELL_DEG
# c10: MapError
seg-20a842d675c2 = Eine <c1/> hat <c2/> (<c3/>), <c4/> und <c5/> (das v1-Dokument). <c6/> ist <c7/> oder <c8/>; <c9/> ist { "0.5" }. Fehler sind <c10/>. Die Datensatzregeln (zugelassene Voreinstellungen, Lizenztext erforderlich, Art muss passen) gelten genau wie auf der Kommandozeile.

# text
seg-1195686de09b = Externe Validierung

# text
# c1: tests/interference_map_reference.rs
# c2: tests/fixtures/interference_map_ref/PREREGISTRATION.md
# c3: scripts/gen_interference_map_ref.py
seg-0de37085f544 = <c1/> vergleicht Kshana mit unabhängigen Implementierungen auf synthetischen Eingaben, mit in <c2/> vorab registrierten Toleranzen: die Bedeutungen der NIC- und NACp-Codes gegen die pyModeS-Dekodierung synthetischer ADS-B-Frames, die Werte „nicht verfügbar“ bei AIS gegen die pyais-Dekodierung synthetischer AIVDM-Sätze, die Zuordnung zu Gitterzellen gegen shapely, die Routenlänge je Zellzustand gegen shapely und GeographicLib sowie die Binnenlandmaskierung gegen shapely und pyproj. Die Fixtures werden von <c3/> erzeugt; CI braucht kein Python. Das validiert, wie die Codes und Feldwerte gelesen werden, und die Geometrie. Es validiert nicht, dass eine markierte Zelle eine Störung ist.

# text
# c1: src/interference_map/
# c2: tests/interference_map_cli.rs
seg-56a3e955cbcc = Alle Tests verwenden synthetisch erzeugte Daten und kein Netz: Unit-Tests in <c1/> und <c2/> für die Befehle von Anfang bis Ende, einschließlich dessen, dass keine Kennung in eine Ausgabe gelangt und dass Zurückweisungen keine Dateien hinterlassen.

# text
seg-212c43d1a41c = <s1>Zurück</s1>NMEA-Trainingsströme

# text
seg-7f13ee5d254e = <s1>Weiter</s1>Störungskarte: Datenquellen und Lizenzen

# text
seg-1fc1794d9388 = ADS-B-Methode (kshana-interference-map/adsb/v2)

# text
seg-a3a97ab49ed1 = AIS-Methode (kshana-interference-map/ais/v2)
