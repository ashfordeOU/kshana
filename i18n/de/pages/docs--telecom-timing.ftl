# docs--telecom-timing: translations (de)

# text
seg-04ece0eb7bd2 = Masken-ID

# attr:aria-label, text
seg-a13eab564243 = MTIE

# attr:aria-label, text
seg-f155b7ceef1f = TDEV

# text
seg-42cdb8e987e6 = Budget

# text
seg-88372b30ed79 = Grenze

# text
seg-50fffd444946 = { "100" } ns

# text
seg-79e6a31245f2 = { "400" } ns

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-edb7b16b6c0e = Validierung

# text
seg-3c513ef2fd3b = Größe

# text
# c1: docs/TELECOM-TIMING.md
seg-62b6e83a9145 = Quelle: <c1/>

# text
seg-95222c3659cd = Telekom-Zeitgebung: Masken, Quellen und Voreinstellungen

# text
# c1: telecom-timing
# c2: src/telecom_timing.rs
# c3: scenarios/telecom-prtc-holdover-24h.toml
# c4: scenarios/telecom-synce-eec.toml
# c5: scenarios/telecom-tie-ingest.toml
seg-5a604e063370 = Diese Seite listet jede Grenze auf, die die Szenarioart <c1/> prüft, woher jede stammt und was weggelassen wurde. Der Code ist <c2/>. Das Referenzszenario ist <c3/>, das zur Frequenzsynchronisation ist <c4/>, und das Beispiel zur Einlesung ist <c5/>.

# text
seg-f078828b2325 = <b>Abkürzungen.</b> ITU-T ist der Sektor Telekommunikationsstandardisierung der Internationalen Fernmeldeunion. GNSS ist das Global Navigation Satellite System. TE ist der Zeitfehler, die Differenz zwischen der Zeit einer Uhr und der Referenzzeit. max|TE| ist der größte absolute Zeitfehler. MTIE ist der maximale Zeitintervallfehler: der größte Spitze-Spitze-Zeitfehler innerhalb eines beliebigen Beobachtungsfensters der Länge τ (Tau). TDEV ist die Zeitabweichung, ein Effektivwertmaß für das Zeitwandern bei der Mittelungszeit τ. cTE ist der konstante Zeitfehler (der mittlere Versatz). dTE ist der dynamische Zeitfehler (der sich bewegende Anteil). TE_L und dTE_L sind der Zeitfehler nach einem Tiefpassfilter erster Ordnung mit einer Bandbreite von { "0.1" } Hertz (Hz); dTE_H ist der Anteil oberhalb dieses Filters. TE_HO ist der Zeitfehler im Holdover. PRTC ist die primäre Referenzzeituhr. ePRTC ist das erweiterte PRTC. T-BC ist die Telekom-Boundary-Clock und T-TSC die Telekom-Time-Slave-Clock. PTP ist das Precision Time Protocol. PPS ist Puls pro Sekunde. OCXO ist der thermostatgeregelte Quarzoszillator. CSAC ist die Atomuhr im Chip-Format. CSV sind kommagetrennte Werte. ADEV ist die Allan-Abweichung (σ_y), das übliche Maß für die Frequenzstabilität. ns steht für Nanosekunden und µs für Mikrosekunden. ppb steht für Teile pro Milliarde (ein relativer Frequenzwert von { "1e-9" }), und MHz steht für Megahertz. Amd. ist ein Amendment zu einer Empfehlung, und Y.1367 und dergleichen sind die Nummer derselben Empfehlung in der ITU-T-Y-Serie.

# text
# c1: allantools
seg-a7746845eb05 = <b>Was das ist.</b> Die Schätzer (MTIE und TDEV) werden gegen das Drittanbieter-Paket <c1/> geprüft und sind dafür VALIDATED. Die Maskentabellen sind Abschriften der unten genannten Empfehlungen. Ein synthetischer Holdover ist ein Modell, das aus öffentlichen Datenblattwerten aufgebaut ist. Die Art ist insgesamt MODELLED. Sie ist kein Konformitätstest, und ein PASS hier ist kein Zertifikat.

# text
seg-e4adedc8e36d = Gelesene Quellen

# text
seg-44f6d9a7906c = Alle ITU-T-Texte wurden am 2026-09-25 von itu.int heruntergeladen. Verwendet wurde die neueste Ausgabe, die vollständig gelesen werden konnte.

# text
seg-28d4cebb747f = Empfehlung

# text
seg-ef3644f3af9c = Gelesene Ausgabe

# text
seg-82dcf7b71cdb = Status auf itu.int

# text
seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

# text
seg-f65ca7286466 = in Kraft

# text
seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

# text
seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), eine Veröffentlichung im Volltext

# text
seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

# text
seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), Volltext

# text
seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

# text
seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), Volltext

# text
seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

# text
seg-63c64d128cc6 = 03/2020 und ihr Amd. { "1" } (08/2024)

# text
seg-66209db00349 = Zwei neuere Amendments existieren, konnten aber nicht gelesen werden: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) und G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Beide sind vorveröffentlicht und auf ITU-Mitglieder beschränkt (Konten des Telecommunication Information Exchange Service, TIES). Falls sie eine der folgenden Zahlen ändern, spiegeln diese Seite und der Code das noch nicht wider.

# text
seg-25d639be3a1b = <b>Wie die Zahlen geprüft wurden.</b> Bei der Textextraktion aus diesen Dateien im Portable Document Format (PDF) gehen der griechische Buchstabe τ und das Mikrozeichen µ verloren, sodass aus „{ "0.275" } × { "10" }⁻³τ“ „{ "0.275" } × { "10" }⁻³“ wird. Jede Zeile der Tabellen { "1" } bis { "4" } von G.8272, der Tabellen { "1" } bis { "5" } von G.8272.1, der Tabelle { "1" } von G.8271 und der Tabelle 7-1 von G.8271.1 wurde daher erneut aus dem gerenderten Seitenbild gelesen. Die Tabellen 7-1 bis 7-5 von G.8273.2 und die Tabellen 7-2 und 7-3 von G.8271.1 wurden aus extrahiertem Text gelesen, in dem τ erhalten blieb. Wo eine Tabelle Stetigkeit an einem Knickpunkt impliziert, prüft das ein Unit-Test.

# text
seg-33b5f44c513b = Implementierte Grenzwerte

# text
seg-3ce6da7e3e99 = τ ist in Sekunden angegeben. Ein Intervall der Form „{ "0.1" } < τ ≤ { "273" }“ ist bei { "0.1" } s offen und bei { "273" } s geschlossen, genau wie in der Tabelle, und der Code behandelt beide Enden ebenso.

# text
seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A und PRTC-B, Locked-Modus

# text
seg-c54e45baa463 = max|TE|

# text
seg-25887373a479 = { "40" } ns

# text
seg-0e18047889c1 = Abschnitt { "6.1" }

# text
seg-4ce06948bf3f = MTIE (Abschnitt { "6.2" }):

# text
seg-f1e336517976 = Maske

# text
seg-7c40080fe799 = Intervall

# text
seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

# text
seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

# text
seg-a2ae8d8ad68a = Tabelle { "1" }

# text
seg-d1b301281575 = { "0.10" } µs

# text
seg-22afd1138a6a = τ > { "273" }

# text
seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

# text
seg-95049bb8aaa1 = Tabelle { "2" }

# text
seg-f2562bdf8fd5 = { "0.04" } µs

# text
seg-72ef2a66af58 = τ > { "54.5" }

# text
seg-d18148049b1e = TDEV (Abschnitt { "6.2" }):

# text
seg-f492a7e39046 = { "3" } ns

# text
seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

# text
seg-7334c58cd44b = Tabelle { "3" }

# text
seg-3bf4d8b009d5 = { "0.03" } τ ns

# text
seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

# text
seg-02bacda97914 = { "30" } ns

# text
seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

# text
seg-1c0341aaa919 = { "1" } ns

# text
seg-70c7899bf805 = Tabelle { "4" }

# text
seg-8ec1f8c65e4f = { "0.01" } τ ns

# text
seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

# text
seg-2851f795541f = { "5" } ns

# text
seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

# text
seg-9b8478f86b44 = Abschnitt { "6.2" } legt außerdem fest, dass die minimale Messdauer für TDEV das Zwölffache der Integrationsdauer beträgt (T = 12τ). Die Szenarioart wendet diese Regel auf jede berichtete TDEV an, sodass TDEV nur für τ bis zu einem Zwölftel der Aufzeichnung angegeben wird. G.8272 nennt keine Holdover-Anforderung für einen PRTC.

# text
seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

# text
seg-42c76f7b90ac = Locked-Modus:

# text
seg-160dced77932 = { "4" } ns

# text
seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

# text
seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

# text
seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

# text
seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

# text
seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

# text
seg-4d971fea7954 = τ > { "400 000" }

# text
seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

# text
seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

# text
seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

# text
seg-727399dbf061 = { "10" } ns

# text
seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

# text
seg-ca9cb946c8f4 = ePRTC-A-Holdover, Zeitfehler (Abschnitt { "8.2.1" }, Tabelle { "3" }). L ist die Zeit in Tagen, in der der ePRTC vor dem Verlust synchronisiert war, und t ist die Zeit seit Beginn des Holdover in Sekunden. Der Grenzwert steigt über die Holdover-Dauer H linear von { "30" } ns auf { "100" } ns an.

# text
seg-fa700160348e = Synchronisationsdauer L

# text
seg-61f9dec111cb = Holdover-Dauer H

# text
seg-f6a6df18839c = Grenzwert für |Δx(t)|

# text
seg-9229068d7534 = L < { "6" } Tage

# text
seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } Tage)

# text
seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

# text
seg-1af75c2d666f = { "6" } Tage ≤ L ≤ { "40" } Tage

# text
seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

# text
seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

# text
seg-71a6238f1e29 = L > { "40" } Tage

# text
seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } Tage)

# text
seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

# text
seg-3262966b5eab = ePRTC-A-Holdover, Wander (Abschnitt { "8.2.2" }):

# text
seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

# text
seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

# text
seg-a4a813c38ef6 = Tabelle { "5" }

# text
seg-5d56fb7889b2 = Abschnitt { "8.3.1" } legt den standardmäßigen maximalen Holdover-Zeitfehler max|TE_HO| auf { "100" } ns fest. Die Szenarioart verwendet ihn als Standardbudget für die Zeit bis zur Überschreitung.

# text
seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC and T-TSC

# text
seg-96b5072f792f = Klasse A

# text
seg-7737bc0444b1 = Klasse B

# text
seg-cd92242017a8 = Klasse C

# text
seg-0689443dfc12 = Klasse D

# text
seg-54163aca5d46 = max|TE| (ungefiltert)

# text
seg-b36412e1acfb = { "70" } ns

# text
seg-ed79e6cdac25 = Gegenstand weiterer Untersuchung

# text
seg-5c2985d408e3 = Tabelle 7-1

# text
seg-067c7c90c1e1 = max|TE_L| ({ "0.1" }-Hz-Tiefpass)

# text
seg-1c5ac746d16b = Tabelle 7-2

# text
seg-9802166ed2e2 = cTE-Bereich

# text
seg-b94484db77ab = ±{ "50" } ns

# text
seg-17d4f5817950 = ±{ "20" } ns

# text
seg-1399281b7ce6 = ±{ "10" } ns

# text
seg-a694039549c8 = Tabelle 7-3

# text
seg-d8799ba27fc3 = dTE_L MTIE, konstante Temperatur

# text
seg-c332ee79beaf = Tabelle 7-4, m ≤ τ ≤ { "1 000" }

# text
seg-2bd284168318 = dTE_L TDEV, konstante Temperatur

# text
seg-8358cf8c4e50 = { "2" } ns

# text
seg-6a1cc65603b3 = Tabelle 7-5

# text
seg-de739a499521 = In Tabelle 7-5 sind die Klassen A und B als m < τ ≤ { "1 000" } und Klasse C als m ≤ τ ≤ { "1 000" } geschrieben. m ist 1/16 s für einen PTP-Strom mit { "16" } Paketen pro Sekunde und { "1" } s für einen { "1" }-PPS-Ausgang. Die Szenarioart behandelt die Eingabe als { "1" }-PPS-Zeitintervallfehler, also m = { "1" } s. Anmerkung { "1" } zu Tabelle 7-3 besagt, dass cTE durch Mittelung des Zeitfehlers über { "1 000" } s geschätzt wird. Die Szenarioart berichtet den ungünstigsten Absolutwert des Mittelwerts aufeinanderfolgender Blöcke von { "1 000" } s.

# text
seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): Netzgrenzwerte am Referenzpunkt C

# text
seg-8c2b01661011 = Alle drei betreffen den Einsatzfall { "1" } und gelten nach einem Tiefpassfilter erster Ordnung mit { "0.1" } Hz.

# text
seg-b3f93a59a8eb = Abschnitt

# text
seg-23e44eab6e8b = max|TE_L|

# text
seg-cb1a66f62f8e = MTIE-Grenzwert

# text
seg-4aa99615d914 = { "7.3.1" } (Anwendungen der Klasse { "4" })

# text
seg-eacfcd0a9ea5 = { "1 100" } ns

# text
seg-dc2351580120 = { "100" } + { "75" } τ ns

# text
seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

# text
seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

# text
seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

# text
seg-884708f2736f = { "580" } ns

# text
seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

# text
seg-17c12885b0d1 = { "7.3.2" } (erweitertes Netz)

# text
seg-fcd7cb03855f = { "600" } ns

# text
seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

# text
seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

# text
seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

# text
seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

# text
seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

# text
seg-f7fda527feed = { "200" } ns

# text
seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

# text
seg-1f0b651381ea = { "7.3.3" } (PRTC im Zugangsnetz)

# text
seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

# text
seg-3aacef0066a0 = { "1" } < τ < { "400" }

# text
seg-f34cbd5ce7e4 = { "44" } ns

# text
seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

# text
seg-b0987b4e2e07 = Tabelle 7-3 lässt τ = { "400" } s selbst ohne Grenzwert (eine Zeile endet mit „< { "400" }“, die nächste beginnt mit „{ "400" } <“). Die Szenarioart berichtet dort keinen Grenzwert, statt einen zu wählen. Referenzpunkt A (Abschnitt { "7.1" }) übernimmt seine Grenzwerte aus G.8272, sodass die oben genannten PRTC-Masken ihn abdecken.

# text
seg-915182a7500e = Frequenzsynchronisation: G.811, G.812, G.8262 und G.8262.1, Wander-Erzeugung ({ "0.36" })

# text
# c1: scenarios/telecom-synce-eec.toml
seg-fb1342b76953 = Sieben Masken, jeweils der Grenzwert der Wander-Erzeugung für MTIE und TDEV bei konstanter Temperatur (innerhalb von ±{ "1" } K), definiert über das äquivalente Messfilter, einen Tiefpass erster Ordnung mit { "10" } Hz, das die Abschnitte nennen. Dieses Filter wirkt vor der Abtastung, daher nimmt die Szenarioart die Aufzeichnung als bereits durch es gemessen an und wendet nichts an. Die PRC-Maske gilt für eine autonome Uhr (G.810 Bild 2a, Konfiguration mit unabhängiger Uhr); die übrigen sind Grenzwerte im Locked-Modus für eine Uhr, die auf eine wanderfreie Referenz synchronisiert ist. Das Referenzszenario ist <c1/>: ein freilaufender OCXO gegen die drei EEC-Masken, was den Beitrag des Oszillators bei Beobachtungsintervallen, die gegenüber der Zeitkonstante jeder Regelschleife lang sind, überschätzt.

# text
seg-3faf039b0ed9 = MTIE (ns)

# text
seg-ca33cbe4fd07 = TDEV (ns)

# text
seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

# text
seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

# text
seg-cb38d6327e5c = G.811 (09/1997) clause { "6.1" }

# text
seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

# text
seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

# text
seg-5e048893f25e = G.812 (06/2004) Tables { "3" } and { "6" }

# text
seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

# text
seg-ae92888ca436 = G.812 (06/2004) Tables { "4" } and { "7" }

# text
seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-8e825000b58e = G.8262 (10/2024) Tables { "1" } and { "3" }

# text
seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

# text
seg-9ef5ff04e1d4 = wie G.812 Tabelle { "7" }, bei { "10 000" } s geschlossen

# text
seg-3ecb8d9128d0 = G.8262 (10/2024) Tables { "4" } and { "5" }

# text
seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-47d0f50aa906 = G.8262.1 (11/2025) Tables { "1" } and { "3" }

# text
seg-45e4ed8fa6ea = Jede Zeile wurde am 2026-10-13 mit dem von itu.int heruntergeladenen Text abgeglichen: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) und G.811 (09/1997). G.812 (06/2004) ist als durch eine vorab veröffentlichte Ausgabe 08/2026 ersetzt aufgeführt, und G.811 hat eine Amd. { "1" } (04/2016); keines von beiden konnte heruntergeladen werden. Falls sie eine der obigen Angaben ändern, spiegeln diese Seite und der Code das nicht wider. Wo gedruckte Koeffizienten einen Knickpunkt unstetig machen (zum Beispiel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns gegenüber dem Plateau von { "100" } ns in G.812 Tabelle { "4" }), werden die Tabellen wie gedruckt beibehalten und die Unit-Tests begrenzen den Sprung. Nicht implementiert: die Zuschläge für veränderliche Temperatur (G.812 Tabelle { "5" }, G.8262 Tabelle { "2" }, G.8262.1 Tabelle { "2" }), Holdover- und Transientenanforderungen, Jitter und die Frequenzgenauigkeit nach G.811 aus Abschnitt { "5" }.

# text
seg-4f6666854cf7 = Budgets (Zeit bis zur Überschreitung)

# text
seg-1f3322a94bbb = ePRTC-Standardwert max|TE_HO|

# text
seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) Abschnitt { "8.3.1" }

# text
seg-0d5433d85c88 = Holdover-Zuteilung im Netz, kurze GNSS-Unterbrechung

# text
seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabelle V.1, Ausfallszenario (b), „Neuanordnungen und Holdover im Netz“. Eine Beispielzuteilung, keine Anforderung.

# text
seg-afe6c9903ada = Netzgrenzwert am Referenzpunkt C

# text
seg-0c261b05c3cf = G.8271.1 Abschnitt { "7.3.1" }. Dies ist eine gefilterte Größe; als Budget wird sie ungefiltert verglichen.

# text
seg-4b5a9718d008 = Endanwendung, Genauigkeitsklasse { "4" }

# text
seg-2a38e45e7008 = { "1.5" } µs

# text
seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabelle { "1" }, Klasse { "4" }

# text
seg-ded846b5a4bc = <b>Die klassische Zahl „{ "1.5" } µs Ende zu Ende“.</b> Sie ist die Zeitfehleranforderung der Klasse { "4" } aus G.8271 Tabelle { "1" }, angegeben gegenüber einer gemeinsamen Referenz an der Endanwendung. G.8271.1 Tabelle V.1 zeigt, wie ein Netz sie im Normalbetrieb zuteilen kann: { "100" } ns für den PRTC bzw. Telecom-Grandmaster, { "200" } ns für den dynamischen Zeitfehler der Kette, ein konstanter Zeitfehler für die Uhren und Verbindungen, insgesamt { "1 100" } ns am Referenzpunkt C, dann { "250" } ns für Neuanordnungen und kurzen Holdover in der Endanwendung und { "150" } ns für das Eigenrauschen der Endanwendung, { "1 500" } ns am Referenzpunkt E. Das Ausfallszenario (c) derselben Tabelle, „lange Holdover-Zeiträume, z. B. { "1" } Tag“, ergibt { "3 350" } ns bei C und { "3 500" } ns bei E (laut ihrer Anmerkung { "5" } kann ein Überschreiten von { "1 500" } ns den Dienst beeinträchtigen). Keine der beiden Empfehlungen nennt also eine Anforderung „{ "1.5" } µs über { "24" } Stunden Holdover“, und die Szenarioart implementiert keine.

# text
seg-76cab595673a = Nicht bestätigt oder nicht implementiert

# text
seg-175c282ddce2 = Nichts davon ist als Maske implementiert. Nichts davon wurde per Schätzung ergänzt.

# text
seg-3c74e4ba9579 = <b>In den Empfehlungen als „Gegenstand weiterer Untersuchung“ gekennzeichnet:</b> G.8273.2 Klasse D max|TE|, cTE, dTE_L MTIE und TDEV, dTE_H und Holdover; ePRTC-B-Holdover (G.8272.1 Abschnitt { "8.2.1" }); ePRTC-A-Holdover MTIE und TDEV jenseits von { "10 000" } s (Tabelle { "4" } Anmerkung { "1" }, Tabelle { "5" } Anmerkung { "2" }); ePRTC-Phasendiskontinuität (Abschnitt { "7" }); T-BC/T-TSC-Phasen-/Zeit-Holdover bei Verlust sowohl der PTP- als auch der Bitübertragungsschicht-Eingänge (G.8273.2 Abschnitt { "7.4.2.1" }); der TDEV-Netzgrenzwert am Referenzpunkt C (G.8271.1 Abschnitte { "7.3.1" } bis { "7.3.3" }); Netzgrenzwerte für den Einsatzfall { "2" } am Punkt C.

# text
seg-93c60d44788e = <b>Übertragen, aber in dieser Version nicht implementiert:</b> G.8273.2 Tabelle 7-6 (MTIE bei veränderlicher Temperatur: { "40" } / { "40" } / { "10" } ns bis { "10 000" } s), Tabelle 7-7 (dTE_H Spitze-Spitze: { "70" } / { "70" } / { "30" } ns, wofür ein Hochpassfilter mit { "0.1" } Hz nötig ist), Tabelle 7-10 (Holdover-MTIE mit Frequenzunterstützung der Bitübertragungsschicht), relativer Zeitfehler (Tabellen 7-8 und 7-9) sowie die dTE_H-Grenzwerte aus G.8271.1 Abschnitt { "7.3.2" } ({ "50" } ns) und { "7.3.3" } ({ "70" } ns).

# text
seg-f5fcd3b0f8a5 = <b>Nicht angewendet:</b> das gleitende Mittelwertfilter über mindestens { "100" } Abtastwerte, das G.8272 und G.8272.1 für PTP-Schnittstellen nennen. Die Eingabe wird als { "1" }-PPS-Zeitintervallfehler behandelt, den diese Empfehlungen ohne Filter messen.

# text
seg-74fe057a4392 = <b>Nicht lesbar:</b> die beiden eingeschränkten Änderungen von { "2026" }, die unter „Gelesene Quellen“ genannt sind.

# text
seg-bd4ec59cc872 = <b>Redaktionelle Auffälligkeit:</b> In G.8272.1 Amd. { "1" } trägt der Kopf von Tabelle { "3" } in der Änderungsauszeichnung eine eingefügte Zeile „TDEV-Grenzwert [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }“, oberhalb der Zeitfehlerspalten. Sie wird nicht als Teil der Zeitfehler-Hüllkurve behandelt. Dieselbe TDEV von { "1" } ns ist Tabelle { "5" } und dort implementiert.

# text
seg-511db1219de1 = Das Messfilter

# text
seg-5fc683308b31 = G.8273.2 und G.8271.1 definieren ihre gefilterten Grenzwerte über einen Tiefpassfilter erster Ordnung mit { "0.1" } Hz Bandbreite. Die Szenarioart wendet den diskreten Glätter y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt) an, beginnend beim ersten Abtastwert. Er ist eine Näherung von Messgeräten, keine Kopie eines bestimmten Instruments. Er wird nur angewendet, wenn das Abtastintervall Δt höchstens { "1" } s beträgt. Eine gröbere Aufzeichnung wird gegen eine gefilterte Maske als NOT-EVALUATED berichtet, statt schlecht gefiltert zu werden.

# text
seg-218e5ad620af = Oszillator-Voreinstellungen (MODELLED)

# text
seg-28bb7b8ad89f = Jede Angabe stammt aus dem jeweiligen Datenblatt, gelesen am 2026-09-25.

# text
seg-b4207b682560 = Gerät und Dokument

# text
seg-13f9ba96c063 = Verwendete ADEV-Maxima (τ: σ_y)

# text
seg-d719167df981 = Alterung

# text
seg-f30740907f6a = Temperatur

# text
seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; Datenblatt Rev 12-1-2021

# text
seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

# text
seg-85f8b8fbbae6 = ±{ "0.15" } ppb/Tag nach { "72" } h (f ≤ { "10" } MHz)

# text
seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C bis +{ "70" } °C, bezogen auf +{ "25" } °C

# text
seg-53ac4dcaf8b1 = Microchip 8040C Rubidium-Frequenznormal, Standardleistung; DS00003047A (2/20)

# text
seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

# text
seg-ae0f630aba4b = <5e-11/Monat nach { "30" } Tagen

# text
seg-dbb2a780ceb9 = Temperaturkoeffizient <{ "3E-10" }, { "0" } °C bis { "50" } °C

# text
seg-79d5b7a3a453 = Microchip 5071A, Hochleistungsröhre; DS00002980D (5/25)

# text
seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } Tage: { "1.0e-14" }; { "30" } Tage: { "1.0e-14" }

# text
seg-1fbdd6edc376 = keine Rate veröffentlicht; Änderung über die Lebensdauer ≤{ "5.0e-14" }

# text
seg-bb485faf403a = ±{ "8.0e-14" } gegenüber der Umgebung ({ "0" } °C bis { "50" } °C, Luftfeuchte, Magnetfeld, Stoß)

# text
seg-889f4dc6cafc = Microchip SA.45s CSAC, Optionen { "001" } und { "003" }; DS00002985D (5/23)

# text
seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

# text
seg-c90e2f590297 = <9e-10/Monat nach { "30" } Tagen

# text
seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C to { "70" } °C

# text
seg-63ba00e95bbc = Dokumentlinks: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

# text
seg-31ad29d092ee = Bewusst weggelassen: die { "10" }-s-Zeile des 8040C, die das Datenblatt als „<{ "1.0" } x { "10" }^{ "11" }“ druckt (ein falsch gedruckter Exponent), und die Zeilen des 5071A unterhalb von { "1" } s. Der OX-049 wurde für den OCXO erwogen und nicht verwendet, weil seine Alterungszeile aus der verschobenen Tabelle nicht eindeutig lesbar ist.

# text
seg-8d4a915bc7fc = <b>Wie aus den Angaben ein Modell wird.</b> Dies sind Entscheidungen dieser Engine, und jede davon wird in der Ausgabe des Laufs berichtet:

# text
seg-f1e6ea28601c = <b>Rauschanpassung.</b> Die Niveaus des weißen, des Flicker- und des Random-Walk-Frequenzrauschens sind eine Anpassung nach der Methode der nichtnegativen kleinsten Quadrate an die ADEV-Maxima, anschließend hochskaliert, bis das Modell bei oder über jedem Punkt liegt. Die Datenblattwerte sind Maxima, daher umhüllt das Modell sie.

# text
seg-0e5ab055094a = <b>Flicker-Boden.</b> Der Boden liegt nie unter der ADEV beim längsten aufgeführten τ. Ein Datenblatt hört dort auf zu listen, wo sein Hersteller keine weitere Verbesserung mehr verspricht, daher lässt das Modell die Uhr darüber hinaus nicht besser werden. Das kann einen Holdover nur verschlechtern.

# text
seg-ebefbd6f119b = <b>Alterung.</b> Ein Monatswert wird mit { "30" } Tagen pro Monat umgerechnet und ab dem Zeitpunkt des Verlusts als linearer Frequenzdrift angewendet. Die Caesium-Voreinstellung hat keine Alterung.

# text
seg-bb08c7b5baf5 = <b>Temperatur.</b> Die angegebene Grenze wird linear über die halbe Betriebsspanne gelesen (zum Beispiel ergibt ±{ "5e-10" } über −{ "10" } °C bis { "70" } °C den Wert { "1.25e-11" } pro Kelvin) und dann von einem sinusförmigen Temperaturverlauf angetrieben, dessen Amplitude und Periode Szenarioeingaben sind. Nichts in einem Datenblatt besagt, dass die Abhängigkeit linear ist; dies ist eine Worst-Case-Lesart.

# text
seg-47a256757cfc = <b>Vor dem Verlust</b> ist die Uhr nachgeführt, und ihr Zeitfehler ist weißes Phasenrauschen mit einem angegebenen 1-Sigma-Wert.

# text
seg-3ef60b128bb7 = <b>Was das Referenzszenario zeigt.</b> Bei den festgeschriebenen Eingaben (Rubidium, ±{ "2" } K tägliche Temperaturschwankung, { "24" } h Holdover nach { "1" } h Synchronisation) erreicht die Aufzeichnung einen größten absoluten Zeitfehler von { "603.2" } ns. Sie überschreitet das ePRTC-Budget von { "100" } ns { "8 206" } s nach dem Verlust und die Zuteilung von { "400" } ns nach { "25 713" } s und bleibt den ganzen Tag innerhalb von { "1 100" } ns und { "1.5" } µs. Sie verfehlt die ePRTC-A-Holdover-Hüllkurve { "3 627" } s nach dem Verlust, was zu erwarten ist: Diese Anforderung setzt eine Referenz der Caesium-Klasse voraus. Der Temperaturterm allein kann { "660" } ns erreichen, sodass er bei diesen Eingaben mehr ausmacht als die Alterung ({ "72" } ns am Ende des Tages).

# text
# c1: tests/telecom_timing_reference.rs
# c2: allantools
# c3: tests/fixtures/telecom_timing/holdover_te_series.csv
# c4: docs/VERIFICATION-MATRIX.md
seg-ba87d450423c = <c1/> prüft MTIE und TDEV der Szenarioart gegen <c2/> { "2024.06" } an <c3/>, einer CSAC-Holdover-Reihe mit { "2" } 048 Abtastwerten mit Alterung, Flicker und Temperatur. Bei { "17" } Mittelungsfaktoren für MTIE und { "12" } für TDEV stimmt MTIE exakt überein, und TDEV stimmt auf { "1.1e-15" } relativ überein. Dieselben Kurven werden aus einem vollständigen Lauf, der die CSV einliest, wieder ausgelesen. Dies validiert die Schätzer an dieser Aufzeichnung. Es validiert weder den synthetischen Holdover noch die Masken oder die Voreinstellungen, die MODELLED-Zeilen in <c4/> sind.

# text
seg-6fdc3cc32a2f = <s1>Zurück</s1>Slot-Zeitgebung

# text
seg-1108b114de88 = <s1>Weiter</s1>Getäuschte Zeit
