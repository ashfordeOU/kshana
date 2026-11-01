# docs--spectrum: translations (de)

# text
seg-6cb7a787ac67 = Referenzen

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Träger

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
seg-a86ce24d81de = Band

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-72f051e2d7e1 = Signal

# text
seg-47408d30d095 = Nominales C/N₀

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-53a7343c076e = Aussage

# text
seg-430edd66bda0 = Nicht modelliert

# text
seg-64509c048541 = Was modelliert wird

# text
# c1: docs/SPECTRUM.md
seg-f07519ff8071 = Quelle: <c1/>

# text
seg-901c3e032de7 = Spektrummodell und Wasserfall

# text
# c1: spectrum
seg-eac92092dd34 = Die Szenarioart <c1/> baut das L-Band des Global Navigation Satellite System (GNSS) und jedes andere Band, das ein entworfenes Signal belegt (Ultrahochfrequenz (UHF), S-Band, C-Band), als eine einzige spektrale Leistungsdichte (PSD) auf, lässt sie sich über eine geskriptete Störsender-Zeitleiste verändern und reduziert sie auf das, was eine Verfolgungsschleife interessiert: das Störer-Signal-Verhältnis (J/S) und das effektive Träger-Rauschleistungsdichte-Verhältnis (C/N₀) jedes Bandes. Sie zeichnet das Ergebnis als Wasserfall (Frequenz quer, Zeit nach unten, Farbe für Leistung) neben C/N₀-Balken je Band und liest und schreibt Aufzeichnungen im Signal Metadata Format (SigMF), sodass eine reale Aufzeichnung geschätzt und neben dem Modell dargestellt werden kann.

# text
seg-0007b6ba97ca = Schreiben Sie das mitgelieferte Beispiel in eine Datei und führen Sie es aus:

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = In einem Checkout führt <c1/> dieselbe Datei aus.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Code: <c1/> (das Modell, die Art, der Welch-Schätzer), <c2/> (der Aufzeichnungs-Codec), <c3/> (die Signalspektren mit Einheitsfläche und der spektrale Trennungskoeffizient) und <c4/> (die Voreinstellungen für den Signalentwurf, die ein Band benennen kann).

# text
seg-bb1153873209 = Modulation

# text
seg-9758b36b554c = Standard-Empfangsleistung

# text
seg-a1a68286b809 = Standard-Empfängerbandbreite

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = binäre Phasenumtastung, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = gemultiplexter binärer Offset-Träger, MBOC(6,1,1/11), oder binärer Offset-Träger BOC({ "1,1" })

# text
seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Tabelle { "12" })

# text
seg-6dc5e3668a78 = { "14.322" } MHz

# text
seg-f03380403a2a = { "1227.60" } MHz

# text
seg-06c245582533 = BPSK({ "1" }) (CM- und CL-Codes im Zeitmultiplex)

# text
seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

# text
seg-1982a811e1ef = { "1176.45" } MHz

# text
seg-dd074e33242e = BPSK({ "10" })

# text
seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

# text
seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Tabelle { "12" })

# text
# c1: [[bands]]
seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A ist der Grob-/Erfassungscode; L2C ist das zivile L2-Signal; IS-GPS-200 und IS-GPS-705 sind die GPS-Schnittstellenspezifikationen; Galileo OS SIS ICD ist das Interface Control Document des Galileo Open Service Signal-in-Space. Die Empfangsleistungen sind die Mindestwerte der Spezifikation; die Bandbreiten sind Modellierungsentscheidungen. Beide lassen sich je Band überschreiben. Ohne eine <c1/>-Tabelle verwendet der Lauf diese fünf. GLONASS G1/G2, BeiDou B1/B2 und Galileo E6 gehören <b>nicht</b> zu den benannten Bändern.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Ein Eintrag <c1/> hat eine von drei Formen:

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = ein Name aus der obigen Tabelle, mit optionalem <c1/>, <c2/> und, für <c3/>, <c4/>;

# text
# c1: signal = "<preset>"
# c2: leo-signal
# c3: name
# c4: xona-x1
# c5: xona-x5
# c6: iridium-stl
# c7: starlink-ku-beacon
# c8: centispace-l1
# c9: centispace-l5
# c10: generic-c-band-leo
# c11: generic-uhf
# c12: generic-l
# c13: generic-s
# c14: generic-c
# c15: generic-c-wide
seg-8596194c81f2 = <c1/>: ein Signalentwurf für die niedrige Erdumlaufbahn (LEO) oder ein repräsentativer Signalentwurf aus der Voreinstellungsbibliothek der Art <c2/> (<a1>LEO-SIGNAL.md</a1>), in jedem Band, gezeichnet mit jeder Komponente (Erfassung, Daten, Pilot, frequenzgeteilte Unterträger) und auf seine Sendebandbreite bandbegrenzt; C/N₀ und J/S beziehen sich auf die verfolgte Komponente, und <c3/> beschriftet sie nur. Die Voreinstellungen sind <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> und <c15/>;

# text
# c1: name
# c2: centre_mhz
# c3: modulation
# c4: BPSK(n)
# c5: BOC(m,n)
# c6: MBOC(6,1,p)
# c7: signal_power_dbw
seg-2ca46a7f2949 = ein eigenes Band: jedes <c1/> mit <c2/>, <c3/> (<c4/>, <c5/> oder <c6/>) und <c7/>.

# text
# c1: [[jammers]]
# c2: waveform
seg-fcb0f9fcffbf = Störsender (<c1/>) nehmen eine <c2/>:

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/> – ein Dauerstrichton (CW) bei <c2/>;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/> – flaches Rauschen über <c2/>;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/> – flaches Rauschen über eine breite <c2/> (ein Breitbandstörsender): dieselbe Dichte wie <c3/>, getrennt benannt, weil die Art <c4/> es als breitbandig bewertet;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/> – ein linearer Sägezahn-Sweep von <c2/> alle <c3/>;

# text
# c1: matched
# c2: matched_to
seg-675fb74a89e4 = <c1/> – Breitbandrauschen, dessen Spektrum die eigene Modulation des Bandes <c2/> ist.

# text
# c1: received_power_dbw
# c2: eirp_dbw
# c3: range_m
# c4: rx_gain_dbi
# c5: jamming
# c6: on_s
# c7: off_s
seg-64d7a14a198e = Jeder gibt entweder <c1/> an oder eine effektive isotrope Strahlungsleistung <c2/> mit einer <c3/> (und optional <c4/>), die durch die Freiraumdämpfung der Art <c5/> geht. <c6/> und <c7/> skripten die Zeitleiste.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = Der Empfänger (<c1/>) legt den Rauschteppich fest, <c2/> mit <c3/> für die Antennentemperatur <c4/> und die Rauschzahl <c5/>, sowie die Verfolgungsschwelle.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = Der Hauptwasserfall deckt <c1/> ab (Standard { "1160" } bis { "1590" } MHz in { "430" } Bins). Jeder Eintrag <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, Standard { "200" } Bins) fügt auf derselben Zeitleiste einen weiteren Wasserfall über seinen eigenen Frequenzbereich hinzu, für ein Spektrum, das mehrere Bänder umfasst.

# text
seg-a550e89c2907 = Die Störungskette

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Für ein Signal mit dem Einheitsflächen-Spektrum <c1/> und einen Störsender mit dem Einheitsleistungs-Spektrum <c2/> ist der spektrale Trennungskoeffizient (SSC) über das Empfängerband <c3/> gleich <c4/>, und die effektive Träger-Rauschleistungsdichte mit mehreren Störsendern ist

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. Aufl., §{ "9.4" }). Für einen Störsender ist dies genau die Anti-Jam-Gleichung der Art <c1/> mit <c2/>; der Block <c3/> des Berichts führt die eigenen Funktionen der Art <c4/> mit denselben Streckeneingaben aus und gibt die Differenz aus, die bis auf Rundung null ist.

# text
# c1: jamming
seg-c11d0cb8e670 = Der Bericht gibt außerdem das C/N₀ aus, das die Art <c1/> mit ihrer Q-Tabelle liefert. Die Tabelle enthält die Lehrbuchwerte, in den Tests an die geschlossenen Formen festgeschrieben:

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW und Schmalband: <c1/>.</b> Ein CW-Ton auf dem C/A-Träger hat <c2/>, also <c3/>, und die Tabelle und die Spektren stimmen überein. Im mitgelieferten Beispiel ergibt der Ton aus beiden { "17.98" } dB-Hz (die Tabelle ergab { "19.74" }, als sie { "1.5" } enthielt).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Breitband und gesweept: <c1/>, seit { "0.36" }.</b> Das ist weißes Rauschen über die Hauptkeule, wobei die Signalleistung im Band auf eins normiert ist, <c2/>. Die Tabelle enthielt bis { "0.36" } den Wert { "1" }, etwa { "3" } dB zu pessimistisch (<c3/>).

# text
seg-cd03b9c900e1 = Das Spektrummodell leitet seine eigenen Werte aus den Spektren ab:

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> für an C/A angepasstes Rauschen (<c2/>);

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> für flaches Rauschen von Nullstelle zu Nullstelle ohne die Normierung (<c2/>).

# text
seg-6c2187f0e32b = Für diese Störsender unterscheiden sich die beiden ausgegebenen C/N₀-Werte also weiterhin, absichtlich.

# text
# c1: Q
seg-73dfbeabcac2 = Jede Wasserfallzelle ist die über ihr Frequenz-Bin und ihre Zeile gemittelte PSD. Ein Chirp wird über die Zeile exakt gemittelt, ganze Sweeps plus der partielle; ein Störsender, der mitten in einer Zeile ein- oder ausschaltet, wird mit seiner Einschaltdauer gewichtet. Die C/N₀-Zeitleiste verwendet dieselben Mittelwerte, sodass Bild und Zahlen übereinstimmen. Je Band meldet die Zeitleiste das J/S im Band (Störerleistung innerhalb der Empfängerbandbreite über der Signalleistung). Je Störsender und Band gibt der Bericht den SSC, <c1/>, das gesamte J/S, das J/S im Band und das stationäre C/N₀ an.

# text
seg-2c214a0a30be = Das mitgelieferte Beispiel

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/>: eine Zeitleiste von { "60" } s, eine Zeile je Sekunde, eine Antenne mit { "290" } K und eine Rauschzahl von { "2" } dB (Teppich −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = { "10" } s bis { "40" } s: ein Chirp von { "16" } MHz um L1, Sweeps von { "9" } µs, { "50" } mW bei { "100" } m.

# text
seg-b85319af4f85 = Ab { "30" } s: ein CW-Ton auf dem L1-Träger, { "10" } mW bei { "1" } km.

# text
seg-21e2b4e76832 = Ab { "45" } s: flaches Rauschen von { "2" } MHz auf L2, empfangen mit −{ "135" } dBW.

# text
seg-45dd378c692c = Was der Lauf berechnet:

# text
seg-eecd7d7530bf = Minimales C/N₀

# text
seg-1ead35e1aad5 = Erster Verlust

# text
seg-bfb55a322ece = Zeilen mit Verfolgung

# text
seg-863ea3f1fbe9 = { "3.23" } dB-Hz

# text
seg-9aa0239a3a0c = { "10" } s

# text
seg-9979940d2359 = { "44.73" } dB-Hz

# text
seg-25364ef39455 = { "4.44" } dB-Hz

# text
seg-c8d0bc71cccd = { "41.98" } dB-Hz

# text
seg-c945914c444c = { "36.86" } dB-Hz

# text
seg-9ff066fb53a6 = nie

# text
seg-63d4f00f622d = { "44.08" } dB-Hz

# text
seg-58b097691919 = Der CW-Ton ist der Grund, warum sich die beiden L1-Signale bei { "40" } s trennen. Er trifft auf das Maximum des C/A-Spektrums und hält C/A bei { "17.98" } dB-Hz, unter der Schwelle von { "25" } dB-Hz. Er trifft auf die Nullstelle des MBOC-Spektrums, sodass Galileo E1 zu seinem nominalen C/N₀ zurückkehrt, wenn der Chirp endet.

# text
seg-064579d5fbac = Die Signale selbst liegen etwa { "20" } dB unter dem Rauschteppich, sodass der Wasserfall den Teppich und die Störsender zeigt; die C/N₀-Balken zeigen, was die Entspreizung zurückgewinnt.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Dieselben Störsender treiben eine verkettete Mission in <c1/> (siehe <a1>CAMPAIGNS.md</a1>): Die Uhr läuft im Holdover, solange der Chirp an ist, und der Empfänger weicht unter dem CW-Ton auf Galileo E1 aus.

# text
seg-6b0edbfca134 = Jenseits des L-Bandes

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> legt LEO-Signale für Positionierung, Navigation und Zeitgebung (PNT) in vier Bändern neben GPS L1 C/A und Galileo E5a, jedes Band mit eigenem Störsender, auf eine Zeitleiste von { "60" } s. Der Wasserfall <c2/> ist das L-Band; drei <c3/> fügen UHF ({ "455" } bis { "475" } MHz), S ({ "2482" } bis { "2502" } MHz) und C ({ "5005" } bis { "5035" } MHz) hinzu.

# text
seg-6818247b5863 = { "10" } s: ein CW-Ton auf dem UHF-Träger, mit −{ "120" } dBW empfangen.

# text
seg-02de8390de31 = { "20" } s: der Chirp des L-Band-Beispiels ({ "16" } MHz um L1, Sweeps von { "9" } µs, { "50" } mW bei { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s: Breitbandrauschen, { "40" } MHz um { "1185" } MHz, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s: Schmalbandrauschen, { "2" } MHz auf dem S-Träger, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s: Rauschen, angepasst an das eigene Spektrum des C-Band-Signals, −{ "124" } dBW.

# text
seg-abacb60b16a3 = Was der Lauf berechnet (das C/N₀ der entworfenen Signale ist das der verfolgten Komponente, sodass der nominale Wert um den verfolgten Anteil unter der gesamten Empfangsleistung liegt):

# text
seg-1c921b6299e4 = repräsentativ, BPSK({ "5" }), −{ "150" } dBW

# text
seg-5331cde832fb = { "34.38" } dB-Hz

# text
seg-35588b19fd72 = Mindestwert der Spezifikation

# text
seg-7d3639369444 = { "3.38" } dB-Hz

# text
seg-9eef1ec7858f = { "38.51" } dB-Hz

# text
seg-c6743d980e6b = veröffentlichter Entwurf, −{ "144.9" } dBW

# text
seg-245bf7d080b3 = { "1190.51625" } MHz

# text
seg-f2aed7e062bf = { "46.29" } dB-Hz

# text
seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

# text
seg-a6f2bb955ca2 = repräsentativ, BPSK({ "10" }), −{ "152" } dBW

# text
seg-b9312cc881d2 = { "40.35" } dB-Hz

# text
seg-03bb124d45d2 = Nur der Chirp nimmt ein Signal weg (GPS L1 C/A, ab { "20" } s). Jeder andere Störsender verschlechtert nur das Band, das sein Spektrum erreicht: Das angepasste Rauschen im C-Band hat zum Beispiel einen SSC von −{ "71.87" } dB/Hz mit dem C-Band-Signal und unter −{ "133" } dB/Hz mit jedem anderen Band.

# text
seg-a8bea652a85d = Dieselbe Maschinerie treibt die LEO-PNT-Resilienzszenarien (<a1>LEO-PNT.md</a1>):

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> stuft einen Breitbandstörsender von { "40" } MHz bei { "1185" } MHz alle { "10" } s um { "5" } dB hoch, beginnend bei −{ "125" } dBW. GPS L5 geht bei der Stufe −{ "105" } dBW verloren, Galileo E5a bei −{ "100" } dBW und Xona X5 bei −{ "95" } dBW, während ein repräsentatives LEO-L-Band-Signal, das mit −{ "135" } dBW empfangen wird, bei −{ "90" } dBW noch verfolgt: Empfangsleistung kauft J/S-Marge dB für dB.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> ist ein Kampagnen-Sweep eines Laufs <c2/> über die Leistung eines Breitbandstörsenders im L5-Band (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> ist eine verkettete Kampagne, deren Phasen das GNSS- und das LEO-C/N₀ aus Läufen <c2/> lesen, mit Panels für S- und C-Band.

# text
seg-42b00ae14ffe = IQ, SigMF und Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> zeichnet das Modell zu einem Zeitpunkt als komplexe Gleichanteil-und-Quadratur-Abtastwerte (IQ), schreibt sie als SigMF-Aufzeichnung (<c2/> oder <c3/>), liest die Aufzeichnung zurück und schätzt ihre PSD nach Welchs Methode (Hann-Fenster, { "50" } % Überlappung, gemittelte Periodogramme, dichteskaliert). Thermisches Rauschen, Signale und rauschartige Störsender werden Bin für Bin aus der eigenen Dichte des Modells gezogen; ein Ton und ein Chirp werden als reale Wellenformen gezeichnet. Bei nur rauschartigen Störsendern liegt die Welch-Schätzung innerhalb von { "0.1" } dB am Modell (Median). Ein periodischer Chirp ist ein Linienspektrum bei seiner Sweep-Rate, mit Welligkeit und Ausläufern jenseits seiner Bandkanten, die das glatte Modell auslässt: Im mitgelieferten Beispiel stimmt die Gesamtleistung innerhalb von { "0.02" } % überein, und das mediane Bin weicht um { "0.5" } dB ab. Der Schnappschuss ist eine für die Analyse geschriebene Datei; nichts wird gesendet, und es wird keine Funkhardware angesteuert.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (nur native Builds) liest eine reale SigMF-Aufzeichnung aus <c2/> (die Datendatei hat standardmäßig denselben Stamm mit <c3/>), schätzt ihre PSD und gibt sie neben dem Modell bei den Frequenzen der Aufzeichnung aus. Eine SigMF-Datei hat keine absolute Leistungskalibrierung, daher gibt der Bericht den medianen Versatz und die Form an, keinen Pegel.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = Im WebAssembly-Build sind die Dateizugriffe nicht verfügbar; <c1/> und <c2/> arbeiten mit Bytes, die die Seite liefert.

# text
seg-69b384afe05d = Signal-PSDs und SSCs

# text
# c1: jamming
seg-a65b87c51f05 = BPSK(n) Hauptkeule 2n × { "1.023" } MHz von Nullstelle zu Nullstelle; BOC({ "1,1" })-Keulen zentriert bei ±{ "1.023" } MHz (Betz { "2001" }); SSCs −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz für C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) aus ihren geschlossenen Parseval-Formen, den Werten hinter den veröffentlichten −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) und { "1.5" } (angepasst) (Kaplan & Hegarty §{ "9.4" }); die Tabelleneinträge der Art <c1/> entsprechen den geschlossenen Formen: CW und Schmalband Q = { "1" }, Breitband und gesweept Q = { "2" } (weißes Rauschen über die Hauptkeule, Leistung im Band normiert; { "1" } bis { "0.36" })

# text
seg-d2afc6e05969 = Wasserfall, J/S- und C/N₀-Zeitleiste

# text
# c1: jamming
seg-c44413d5a060 = Reduziert sich exakt auf die Kette der Art <c1/>; die Störsenderleistungen, die Zeitleiste und die Bandbreiten sind Eingaben

# text
seg-304f4aeaf4cb = SigMF-Codec und Welch-Schätzung

# text
seg-7a642dd02e5c = Rundläufe, eine direkte diskrete Fourier-Transformation, Identitäten für weißes Rauschen und Parseval; im Repository liegt keine Aufzeichnung eines Dritten

# text
seg-1138c9e62a21 = Mehrband-Wasserfall mit entworfenen Signalen und Störsendern je Band

# text
seg-ac38681004e9 = Reduziert sich auf die L-Band-Kette (ein Band mit einer einzigen Komponente liefert dieselben Zahlen wie vor der Erweiterung) und auf die validierten Signalspektren; die entworfenen Signale, Störsender und Bandbreiten sind Eingaben

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Eine Korrektur einer gängigen Kurzformel: Die Keulen des BOC({ "1,1" })-Spektrums sind bei ±{ "1.023" } MHz <em>zentriert</em> (zwischen der Trägernullstelle und der Nullstelle bei { "2.046" } MHz), aber das Maximum der PSD liegt bei ±{ "0.759" } MHz, wo <c1/> mit <c2/> gilt. Die Tests legen beides fest.

# text
seg-6ab6e241f7e5 = Linienstruktur des Spreizcodes (die { "1" }-kHz-Linien von C/A): Ein Ton wird gegen die glatte Hüllkurve bewertet, nicht gegen die nächste Codelinie.

# text
seg-4be08100a707 = Automatische Verstärkungsregelung, Quantisierung, Pulsaustastung und Notch-Filterung.

# text
seg-0f195ea4126e = Das Empfangsantennendiagramm in Richtung des Störsenders über einen einzelnen Gewinnwert hinaus.

# text
seg-d3d03da9c962 = Mehrfachzugriffsstörung zwischen Satelliten eines Bandes.

# text
seg-db5c7566f49e = Aussendungen eines entworfenen Signals außerhalb seiner Sendebandbreite: Sein Spektrum wird dort abgeschnitten, sodass keine Außerbandaussendung ein Nachbarband erreicht.

# text
seg-9cbea7151036 = Die Wirkung eines Chirps auf die Schleife bei Sweep-Raten, die mit der Schleifenbandbreite vergleichbar sind: Sein C/N₀ verwendet das zeilengemittelte Spektrum.

# text
seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation", <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan und C. J. Hegarty (Hrsg.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3. Aufl., Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C", <em>Inside GNSS</em>, Mai/Juni { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra", <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = SigMF-Spezifikation, <a1>https://sigmf.org/</a1> (Quelle: <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Zurück</s1>Integrität und Sicherheit

# text
seg-d5264da8bf65 = <s1>Weiter</s1>ARAIM-Referenz
