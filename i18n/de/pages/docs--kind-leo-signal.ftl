# docs--kind-leo-signal: translations (de)

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Quelle: <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (Szenarioart)

# text
seg-97b8d07150d4 = LEO-PNT-Signalentwürfe: parametrisierte Positions-, Navigations- und Zeitgebungssignale (PNT) auf niedrigen Erdumlaufbahnen (LEO) für beliebige Systeme, Bänder und Strukturen. Ein SIGNAL besteht aus einem Band (Mittenfrequenz, Sendebandbreite, ITU-Zuweisung RNSS/RDSS/MSS/EESS/non-RNSS/other) und Komponenten (Akquisition, Daten, Pilot; jede Teilmenge), jeweils mit einer Modulation (BPSK(n) mit gebrochenem n, BOC(m,n), MBOC({ "6,1" },p) oder ein flaches OFDM-artiges Band), einem Leistungsanteil, optionalen FDMA-Unterträgerversätzen, einer Codelänge und einer Datenrate. Die Signale stammen aus einkompilierten öffentlichen Preset-Dateien (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; jeweils mit ihrer Quell-URL und jedem unveröffentlichten Wert als REPRESENTATIVE gekennzeichnet) oder werden inline geschrieben. JE SIGNAL: die bandbegrenzte spektrale Leistungsdichte und der Anteil der Leistung jeder Komponente, den das Sendeband durchlässt (BPSK-geschlossene Form neben dem numerischen Wert), die effektive (Gabor-)Bandbreite, das thermische Rauschjitter der Code-Nachführung im Delay-Lock-Loop über C/N0 und Early-Late-Abstand aus der bandbegrenzten kohärenten (oder nichtkohärenten) Early-Late-Formel von Betz & Kolodziejski { "2009" } mit ihrer Lehrbuchform für unbegrenzte Bandbreite und ihrer Gabor-Grenze für verschwindenden Abstand, die Entfernungsgenauigkeit in Metern, der Akquisitions-Suchraum (Doppler-Bins aus dem maximalen Doppler der Bahn plus Oszillator- und Nutzeranteilen, mal Code-Bins), die Detektionswahrscheinlichkeit bei quadratischem Detektor und die mittlere serielle und codeparallele Akquisitionszeit, der spektrale Trennungskoeffizient des Signals gegenüber GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und E5 AltBOC sowie jedes dieser Signale gegenüber dem Signal mit der C/N0-Verschlechterung, und das CW-, Breitband- und angepasste J/S, das die nachgeführte Komponente verträgt, aus der eigenen SSC-Maschinerie der Spektrumart. Ein BANDVERGLEICH: Laufzeitverzögerung der Ionosphäre erster Ordnung ({ "40.3" } TEC/f^{ "2" }), Freiraumdämpfung, Entfernungsgenauigkeit bei gleichem C/N0 und bei gleicher EIRP sowie Störertoleranz. Optionale FORMPRÜFUNGEN halten das Spektrum eines Entwurfs gegen eine beschriebene Messung (MODELLED-Konsistenz). VALIDATED: die geschlossenen Formen für die BPSK-Leistung im Band ({ "90.3" } % im Hauptkeulenbereich) und die Gabor-Bandbreite, das bandbegrenzte Jitter, das sich auf die Lehrbuchform des kohärenten Early-Late-Verfahrens und auf seine Gabor-Grenze zurückführen lässt, der spektrale Trennungskoeffizient des versetzten BPSK gegen seine geschlossene Parseval-Form, die Einheitsfläche des AltBOC-Spektrums und der maximale LEO-Doppler gegen die veröffentlichten Werte von Xona Pulsar (32-34 kHz) und Iridium ({ "36" } kHz). MODELLED: jeder Entwurf, jede Leistungsaufteilung sowie jeder C/N0- und Störerpegel; EFQPSK-, CSK- und OFDM-Spektren sind genähert.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Ein Lauf von <c1/> fasst sich so zusammen: Szenario leo-signal | { "5" } Signale | Rauschteppich -202.0 dBW/Hz | feinste Entfernungsmessung generic-c-wide { "0.022" } m bei { "45.0" } dB-Hz

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-b538d3ff9fdb = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/leo-band-trade.toml
seg-6aaf62f55e65 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-9fd02351d844 = ms

# text
seg-05e8854de548 = Chip

# text
seg-d12bc1d2b815 = kohärent

# text
seg-0f29946fe4fb = Ergebnisbezeichnung (die der Engine): MODELLED: parametrisierte Signalentwürfe für Positions-, Navigations- und Zeitgebungssignale (PNT) auf niedrigen Erdumlaufbahnen (LEO), bandbegrenzt auf ihre Sendebandbreite. Die darunterliegenden geschlossenen Formen sind VALIDATED (BPSK-Leistung im Band und Gabor-Bandbreite, das bandbegrenzte Early-Late-Code-Nachführjitter, das sich auf die Lehrbuchform zurückführen lässt

# attr:alt
seg-8bf45b6989d1 = Das Diagramm, das die Engine für scenarios/leo-band-trade.toml schreibt, Art leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: das Sinusintegral (sine_integral), der BPSK-R-Leistungsanteil innerhalb eines doppelseitigen Bandes in geschlossener Form (bpsk_power_in_band_closed_form), die bandbegrenzte BPSK-Gabor-Bandbreite in geschlossener Form (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: der größte Satelliten-Doppler bei einem Überflug im Zenit an der Elevationsmaske für eine Kreisbahn, v R_E cos(el) / (R_E + h) mal f / c, aus Trägerfrequenz und Bahnhöhe jedes Presets; die Art <c1/> fügt o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> Die Art <c1/>: parametrisierte Signalentwürfe (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n)-, BOC(m,n)-, MBOC- oder flachen Spektren, Leistungsanteilen, FDMA-Unterträgern, Codelängen und Datenraten Tests: <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Die Art <c1/>, erweitert über das L-Band hinaus: Bänder, angegeben als Preset-Signalentwurf (mit jeder Komponente gezeichnet, auf die Sendebandbreite bandbegrenzt, C/N0 und J/S auf die nachgeführte Komponente bezogen) oder als benutzerdefinierter Träger und Modulation Tests: <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: der größte Satelliten-Doppler bei einem Überflug im Zenit an der Elevationsmaske für eine Kreisbahn, v R_E cos(el) / (R_E + h) mal f / c,. Referenz (ExternalDataset): Veröffentlichte Werte: Xona Pulsar X1 maximaler Doppler { "32" } bis { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler bis zu +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Die Erdrotation bleibt unberücksichtigt, was den Wert um bis zu etwa { "2.3" } kHz verschiebt; beide veröffentlichten Werte werden auch ohne sie erreicht.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = die exakten Spektren von verbessertem Feher-QPSK, Code Shift Keying und OFDM: Stattdessen steht eine BPSK-Hüllkurve mit rechteckigen Chips oder ein flaches Band, wie es jedes Preset angibt (Ergebnis <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = die Linienstruktur der Spreizcodes und die Mehrfachzugriffs-Kreuzkorrelation zwischen Codes (Ergebnis <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = die Sende- und Empfangsfilter über eine ideale Rechteckflanke an der Sendebandbreite hinaus: keine Außerbandemission, keine Filtergruppenlaufzeit (Ergebnis <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = Mehrwegeausbreitung, Empfängerquantisierung und automatische Verstärkungsregelung (Ergebnis <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = die Erdrotation in der Doppler-Grenze (am Äquator bis zu etwa { "0.46" } km/s Entfernungsänderungsrate) (Ergebnis <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = die ionosphärische Laufzeitverzögerung jenseits der ersten Ordnung und die Aufteilung des Elektronengehalts oberhalb und unterhalb eines LEO-Satelliten: Der schräge TEC ist eine Eingabe (Ergebnis <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = atmosphärische Verluste, Regenverluste und Polarisationsverluste: Verglichen wird allein die Freiraumdämpfung (Regen spielt im C-Band eine Rolle) (Ergebnis <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = Akquisition über einen einzelnen Dwell mit Fehlalarmstrafe hinaus: keine Mehr-Dwell-Verifikationslogik, ein gleichverteilter Code-Phasen-Prior, der ungünstigste Fall (Straddle) (Ergebnis <c1/>)

# text
seg-8eefe4197d7f = <s1>Zurück</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Weiter</s1>link-budget
