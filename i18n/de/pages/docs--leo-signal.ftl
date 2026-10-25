# docs--leo-signal: translations (de)

# text
seg-3ea93ae372ca = Was es enthält

# text
seg-6cb7a787ac67 = Referenzen

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-6752521002b2 = Teil

# text
seg-2b0d77219437 = Voreinstellungen

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
seg-a86ce24d81de = Band

# text
seg-74f4e80c65cb = Komponenten

# attr:title
seg-e769f0411e64 = Vom Herausgeber zurückgezogen; keine archivierte Kopie

# text
# c1: docs/LEO-SIGNAL.md
seg-2255f9acec5b = Quelle: <c1/>

# text
seg-ff4c44ecdecb = LEO-PNT-Signalentwürfe und das Mehrbandspektrum

# text
# c1: leo-signal
# c2: spectrum
# c3: leo-pass
# c4: leo-pnt-chain
seg-5e222f965192 = Der Szenariotyp <c1/> analysiert Signale für Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO). Er ist nicht an ein System gebunden. Ein Signal ist ein parametrisierter Entwurf (Daten, kein Code), sodass derselbe Typ ein veröffentlichtes kommerzielles Signal analysiert, einen repräsentativen Entwurf für ein Band, das niemand veröffentlicht hat, oder jeden Entwurf, den ein Szenario inline schreibt. Der Typ <c2/> zeichnet diese Entwürfe ebenfalls, in jedem Band von Ultrahochfrequenz (UHF) bis C, jedes Band mit eigenen Störern, und ein Band von <c3/> oder ein Lauf von <c4/> kann jeden davon tragen (siehe <a1>Wo die Entwürfe verwendet werden</a1>).

# text
seg-caccfa826a1a = Die mitgelieferten Beispiele ausführen:

# text
# c1: kshana example leo-band-trade
seg-441136f32290 = <c1/>: eine Bandabwägung von UHF bis breitem C an repräsentativen Entwürfen;

# text
# c1: kshana example xona-pulsar-signals
seg-23cea428326c = <c1/>: die veröffentlichten Signale Xona Pulsar X1 und X5;

# text
# c1: kshana example multi-band-jamming-waterfall
# c2: spectrum
seg-5dcfa318a4f3 = <c1/>: Panels für UHF, L, S und C unter Störern je Band (ein Szenario von <c2/>);

# text
# c1: kshana scenarios/celeste-iod-classical-pilot-signals.toml
seg-0390769a8d7f = <c1/>, aus einem Checkout des Repositorys (nicht mitgeliefert): die Bänder und die Signalkonfiguration der Celeste-Demonstration im Orbit (IOD), vorgestellt auf dem LEO-PNT-Workshop des Navigation Innovation and Support Programme (NAVISP) der Europäischen Weltraumorganisation (ESA), { "2026" } (siehe <a1>Workshop-Parameter</a1> unten).

# text
# c1: src/leo_signal.rs
# c2: src/navsignal.rs
# c3: src/spectrum.rs
# c4: data/leo-signals/
seg-62511ee92f8a = Code: <c1/> (Signalentwürfe, der Typ), <c2/> (die geschlossenen Formen), <c3/> (der Mehrband-Wasserfall), Voreinstellungsdateien unter <c4/>.

# text
seg-ce08de9a19de = Ein Signalentwurf

# text
seg-fc0d265f4006 = Mittenfrequenz, Sendebandbreite (außerhalb davon ist das Spektrum null) und die Zuweisung der International Telecommunication Union (ITU): Radio Navigation Satellite Service (RNSS), Radio Determination Satellite Service (RDSS), Mobile Satellite Service (MSS), Earth Exploration-Satellite Service (EESS), ein Band außerhalb von RNSS oder anderes

# text
seg-be2d5e822342 = eine beliebige Teilmenge aus einer <b>Akquisitionskomponente</b> (kurz und mit niedriger Rate, leicht zu finden), einer <b>Datenkomponente</b> (die Navigationsnachricht) und einer <b>Pilotkomponente</b> (datenfrei, für die Entfernungsmessung)

# text
seg-e73d9832efe0 = Je Komponente

# text
# c1: FLAT(<MHz>)
seg-dac784d5f41a = Modulation: binäre Phasenumtastung BPSK(n) mit n × { "1.023" } Mchip/s (n kann ein Bruch sein, BPSK(1/3) sind { "341" } kchip/s), binärer Offsetträger BOC(m,n), gemultiplextes BOC oder <c1/> für eine Bake mit orthogonalem Frequenzmultiplex (OFDM); Leistungsanteil; Unterträgerversätze des Frequenzvielfachzugriffs (FDMA); Codelänge; Datenrate

# text
seg-4ccb9e269d64 = Optional

# text
# c1: ranging = false
seg-4c22d21ea8f0 = Referenz- und Maximalempfangsleistung, Bahnhöhe, <c1/> für ein Signal nur mit Doppler, Hinweise darauf, was veröffentlicht und was angenommen ist

# text
# c1: presets = [...]
# c2: [[signals]]
# c3: generic-bands
seg-c6b46532af9a = Ein Szenario nimmt Signale aus <c1/> und aus Inline-Tabellen <c2/>. Ohne beides analysiert es die Voreinstellung <c3/>.

# text
# c1: data/leo-signals/
seg-a917a5ccfb79 = Je eine Datei unter <c1/>, einkompiliert, jede mit ihrer Quell-URL. Ein Wert, den die Quelle nicht veröffentlicht, ist in der Datei und im Bericht als REPRESENTATIVE gekennzeichnet.

# text
seg-7159574bf255 = Signale

# text
seg-c2831d853b1d = Angegebene Näherungen

# text
# c1: xona-x1
# c2: xona-x5
seg-7816d4f1c3f1 = <c1/> ({ "1593.3225" } MHz, { "1.023" } Mchip/s), <c2/> ({ "1190.51625" } MHz, { "10.23" } Mchip/s); minimale und maximale Empfangsleistung; { "1080" } km

# text
seg-332a08bef0de = enhanced Feher quadrature phase-shift keying (EFQPSK), gezeichnet mit der BPSK-Hüllkurve rechteckiger Chips; Code Shift Keying und Overlay-Codes nicht modelliert; Sendebandbreite = Hauptkeule (nicht veröffentlicht)

# text
# c1: iridium-stl
seg-d37420c5c9f5 = <c1/> Satellite-Time-and-Location-(STL-)Bursts, Quadratur-Phasenumtastung (QPSK) mit { "25" } ksymbol/s, { "780" } km, nur Doppler und Zeitgebung

# text
seg-a765878134e2 = PUBLIC, <a1>Bericht der Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
seg-5ca54b21f017 = Träger in der Mitte von { "1616" } bis { "1626" } MHz; Empfangsleistung aus dem veröffentlichten { "300" }- bis { "2400" }-Fachen des Global Positioning System (GPS) abgeleitet

# text
# c1: starlink-ku-beacon
seg-e43d1db73131 = <c1/>, eine OFDM-Bake mit { "240" } MHz, nur Doppler

# text
seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

# text
seg-fee9a553c9ae = flaches Spektrum; Kanalmitte und Schalenhöhe REPRESENTATIVE; das veröffentlichte Träger-Rausch-Dichte-Verhältnis (C/N₀) von etwa { "57" } dB-Hz wird über den Empfänger eingestellt

# text
# c1: centispace-l1
# c2: centispace-l5
seg-f89372b5231e = <c1/>, <c2/>, BPSK mit { "2.046" } Mchip/s

# text
seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

# text
seg-ac53cebe5303 = Träger auf den GPS-Trägern L1 und L5 platziert („nahe“ in der Quelle); Codelänge REPRESENTATIVE

# text
# c1: generic-c-band-leo
seg-cb1420efc108 = <c1/>, { "5020" } MHz, BPSK({ "10" }) in { "20" } MHz

# text
seg-895f6039fce2 = REPRESENTATIVE, für C-Band-Systeme, deren Parameter nicht öffentlich sind (wie TrustPoint)

# text
seg-a407aaab864c = der gesamte Entwurf

# text
seg-2f679a429dae = REPRESENTATIVE, Zuweisungen aus den <a1>Radio Regulations der ITU</a1>; der UHF-Träger bei { "465" } MHz aus der öffentlichen <s1>openRECEIVER-Erhebung zu LEO-PNT-Signalen</s1>

# text
seg-2054d9ce8a0d = der gesamte Entwurf (auch die UHF-Bandbreite und -Modulation)

# text
seg-24360342e8e6 = Die Ephemeride als „Zero-Clock“-Polynom von ATOMIC ist ein Modell für Navigationsnachrichten, kein Signalentwurf, und gehört zur Arbeit an der Navigationsnachricht, nicht hierher.

# text
seg-ebfc032d7898 = Was je Signal berechnet wird

# text
# c1: η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]
seg-211f655e00fa = <b>Bandbegrenzte spektrale Leistungsdichte (PSD)</b> und, je Komponente, der Anteil ihrer Leistung, den das Sendeband durchlässt. Für eine BPSK-Komponente in der Mitte steht die geschlossene Form <c1/> neben dem numerischen Wert ({ "90.3" } % für die Hauptkeule).

# text
# c1: β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)
seg-05e2a7b8235a = <b>Effektivwert-Bandbreite (RMS, Gabor)</b> der verfolgten Komponente im Band, mit der geschlossenen Form für BPSK <c1/>.

# text
# c1: σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]
seg-f878fd0359c9 = <b>Thermisches Rauschjitter der Codeverfolgung</b> einer Delay Lock Loop (DLL) gegen C/N₀ und Early-Late-Korrelatorabstand, aus der bandbegrenzten Early-Late-Formel von Betz und Kolodziejski ({ "2009" }): <c1/>, standardmäßig kohärent, mit dem nichtkohärenten Quadrierverlust auf Anforderung. Der Bericht fügt die Lehrbuchform für unbegrenztes Band (Kaplan und Hegarty) und die Schranke bei verschwindendem Abstand hinzu, die durch die Gabor-Bandbreite gesetzt wird. Die <b>Entfernungsmessgenauigkeit</b> ist dieses Jitter in Metern beim Referenz-C/N₀ und -Abstand.

# text
# c1: f v R_E cos(el) / ((R_E + h) c)
# c2: 2/(3T)
seg-089e4e98af82 = <b>Akquisition</b>: der größte Satellitendoppler bei einem Überflug über den Nutzer an der Elevationsmaske (<c1/>, Kreisbahn, ohne Erdrotation) plus die Oszillator- und Nutzerterme; Dopplerbins von <c2/>; Codebins über eine Periode; die Detektionswahrscheinlichkeit eines Quadratdetektors (verallgemeinertes Marcum-Q) bei einer Falschalarmwahrscheinlichkeit je Zelle, zentriert und im ungünstigsten Überlappungsfall; und die mittlere Akquisitionszeit einer seriellen und einer codeparallelen Suche mit einer einzelnen Verweilzeit (Holmes).

# text
seg-1e2029183bdc = <b>Kompatibilität</b>: der spektrale Trennungskoeffizient (SSC) des bandbegrenzten Signals in GPS L1 Coarse/Acquisition (C/A), Galileo E1, GPS L5, Galileo E5a, E5b und das Signal E5 Alternative BOC (AltBOC) über jedes Empfängerband der globalen Satellitennavigationssysteme (GNSS), der C/N₀-Verlust, den es bei seiner Empfangsleistung verursacht, sowie der SSC und der C/N₀-Verlust jedes GNSS-Signals in die verfolgte LEO-Komponente.

# text
# c1: spectrum
# c2: spectrum::Jammer::ssc
seg-864f3f2a5aa1 = <b>Störtoleranz</b>: das Verhältnis der Störleistung zur Signalleistung (J/S) eines Dauerstrichtons (CW) auf dem Träger, eines flachen Rauschens über das Sendeband und eines auf die verfolgte Komponente angepassten Rauschens, das die verfolgte Komponente an die Verfolgungsschwelle bringt, aus dem eigenen SSC-Code des Typs <c1/> (<c2/>).

# text
# c1: 10 log₁₀(s/η)
# c2: spectrum
seg-0fbea397ab93 = C/N₀-Konvention: Der Durchlauf und die Referenz sind das <b>gesamte C/N₀ im Band</b>. Der Anteil einer Komponente geht als <c1/> in die Verfolgungs- und Störformeln ein (ihr Anteil an der ungefilterten Leistung über dem Anteil im Band), dieselbe Konvention, die der Typ <c2/> für ein einfaches Band verwendet, dessen Modulationsleistung außerhalb des Empfängerbandes auf dieselbe Weise verloren geht.

# text
seg-3b7d16e8873a = Die Bandabwägung

# text
# c1: [trade]
# c2: 40.3·TEC/f²
seg-39382eb3a60c = <c1/> stellt jedes Signal neben ein Referenzsignal: ionosphärische Gruppenlaufzeit erster Ordnung <c2/> für einen von Ihnen angegebenen Schräg-Gesamtelektronengehalt (TEC) ({ "1" } TEC-Einheit, TECU, = 10¹⁶ Elektronen/m²), Freiraumdämpfung (FSPL) bei einer Schrägentfernung, Entfernungsmessgenauigkeit bei <b>gleichem C/N₀</b> und bei <b>gleicher effektiver isotroper Strahlungsleistung (EIRP)</b> (C/N₀ minus Differenz der Freiraumdämpfung, isotrope Antennen an beiden Enden) und die Störtoleranz beim C/N₀ bei gleicher EIRP.

# text
# c1: scenarios/leo-band-trade.toml
seg-58ced9eba711 = <c1/> ({ "50" } TECU, { "1000" } km, { "45" } dB-Hz, kohärenter Abstand von 0.5 Chip, Schleife von { "1" } Hz, { "20" } ms):

# text
seg-72f051e2d7e1 = Signal

# text
seg-3cfdff157be3 = Ionosphärische Verzögerung

# text
seg-b1436d1fd7a4 = ΔFSPL gegenüber L

# text
seg-b5ce20ced519 = Entfernungsmessung, gleiches C/N₀

# text
seg-2becbee24d47 = C/N₀, gleiche EIRP

# text
seg-aba982013f21 = Entfernungsmessung, gleiche EIRP

# text
seg-8b292612e43e = CW-J/S-Toleranz

# text
seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

# text
seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

# text
seg-66e74ec8ec1f = −{ "8.17" } dB

# text
seg-4dfc4b277e46 = { "0.221" } m

# text
seg-2a67835c7ddd = { "53.17" } dB-Hz

# text
seg-b36b61eaff50 = { "0.086" } m

# text
seg-37de1532b69e = { "42.1" } dB

# text
seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

# text
seg-1cc0fc817fca = { "14.19" } m

# text
seg-c1d04452ee8f = { "0.111" } m

# text
seg-b1dccfc14bb2 = { "45.00" } dB-Hz

# text
seg-467afbc3965e = { "45.0" } dB

# text
seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

# text
seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

# text
seg-271acd87a8d6 = +{ "6.41" } dB

# text
seg-0f38ea614b7f = { "0.185" } m

# text
seg-c531dc11c01d = { "38.59" } dB-Hz

# text
seg-6edbdabf77cb = { "0.388" } m

# text
seg-b1c384a78d8c = { "41.7" } dB

# text
seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

# text
seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

# text
seg-fa10d26d0f8e = +{ "12.49" } dB

# text
seg-9f6390cc903b = { "32.51" } dB-Hz

# text
seg-d04fb147c95f = { "0.465" } m

# text
seg-e825ae4d1080 = { "43.4" } dB

# text
seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

# text
seg-6f22870202af = { "0.77" } m (×{ "0.055" })

# text
seg-ad13cdf3955f = +{ "12.63" } dB

# text
seg-da4b72e53c18 = { "0.022" } m

# text
seg-07ba1b6b9728 = { "32.37" } dB-Hz

# text
seg-e96dfdc0d92f = { "0.093" } m

# text
seg-04a27fee9486 = { "50.3" } dB

# text
seg-edcaed830e15 = Die Abwägung gilt in beide Richtungen. Bei gleichem C/N₀ ist die Entfernungsmessgenauigkeit durch Chiprate und Band bestimmt (breites C misst fünfmal feiner als L). Bei gleicher Strahlungsleistung belastet die Freiraumdämpfung die höheren Bänder voll: Das C-Band verliert { "12.5" } dB C/N₀ und misst viermal schlechter als L, UHF gewinnt { "8.2" } dB, trägt aber das { "6.6" }-Fache der ionosphärischen Verzögerung. Breites C kauft seine Genauigkeit mit Bandbreite zurück. Dies beruht auf den repräsentativen Entwürfen und auf isotropen Antennen; eine gerichtete Nutzerantenne im C-Band ändert die Spalten mit gleicher EIRP.

# text
seg-9bb6fa0e7a95 = Xona Pulsar

# text
# c1: scenarios/xona-pulsar-signals.toml
seg-d71e8de9cdda = <c1/> bei den veröffentlichten Mindest-Empfangsleistungen gegen eine Antenne von { "290" } K und eine Rauschzahl von { "2" } dB (Untergrenze −{ "201.98" } dBW/Hz):

# text
seg-4cf70433cc54 = Referenz-C/N₀

# text
seg-2a22ffc83e00 = { "53.78" } dB-Hz

# text
seg-8f274ed7feff = { "57.08" } dB-Hz

# text
seg-6be7e20ca92f = Entfernungsmessgenauigkeit ({ "0.5" } Chip, kohärent, { "1" } Hz)

# text
seg-60218177538e = { "0.402" } m

# text
seg-e5ccbfea146d = { "0.028" } m

# text
seg-b5a638da9ee1 = Maximaler Satellitendoppler, { "1080" } km

# text
seg-6917f2712acf = { "33.2" } kHz

# text
seg-895ac83e4a5b = { "24.8" } kHz

# text
seg-b4c4179a0363 = Doppler × Codebins ({ "1" } ms, { "0.5" } Chip)

# text
seg-bed6ba024afe = Mittlere codeparallele Akquisitionszeit

# text
seg-93ffb02c7c50 = { "0.15" } s

# text
seg-3671bc5f2ace = { "0.37" } s

# text
seg-7e4c190cb4ab = X5 liegt bei { "1190.51625" } MHz, innerhalb des Galileo-E5-Bandes: Sein SSC beträgt −{ "91.2" } dB/Hz in Galileo E5a und GPS L5, −{ "103.2" } dB/Hz in E5b und −{ "86.2" } dB/Hz in das AltBOC-Signal, und ein X5-Satellit bei seiner Mindestleistung erhöht die Rauschdichte eines GNSS-Empfängers um { "0.0001" } bis { "0.005" } dB. Der X1-Doppler, { "33.2" } kHz, liegt innerhalb der { "32" } bis { "34" } kHz, die die Veröffentlichung berichtet (die Zeile VALIDATED zum Doppler unten).

# text
seg-661eefb1f346 = Das Mehrbandspektrum

# text
# c1: spectrum
# c2: [[bands]]
# c3: gps-l1ca
# c4: galileo-e1
# c5: gps-l2c
# c6: gps-l5
# c7: galileo-e5a
seg-0a8bbe2921fd = Die <c2/> des Typs <c1/> nehmen außer den fünf benannten GNSS-Bändern (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>) auch Folgendes:

# text
# c1: signal = "<preset signal>"
# c2: signal_power_dbw
# c3: tracked_power_dbw
seg-63bd7d8a192d = <c1/>: ein Voreinstellungsentwurf, mit jeder Komponente gezeichnet, auf seine Sendebandbreite bandbegrenzt, empfangen mit der Referenzleistung der Voreinstellung oder mit <c2/>. C/N₀ und J/S beziehen sich auf die verfolgte Komponente (<c3/> im Bericht);

# text
# c1: centre_mhz
# c2: modulation
# c3: signal_power_dbw
seg-603a2b97e621 = <c1/> mit <c2/> und <c3/>: jedes benutzerdefinierte Band.

# text
# c1: [[panels]]
# c2: wideband
# c3: l-band-waterfall-jamming
# c4: tests/leo_signal_reference.rs
seg-b1c30f5d69cf = <c1/> fügen Wasserfälle über andere Frequenzbereiche auf derselben Zeitleiste und Farbskala hinzu, und ein Störer vom Typ <c2/> (Breitband) kommt zu CW, Schmalband, Chirp und angepasstem Rauschen hinzu. Ein einfaches Band verhält sich genau wie zuvor: Das mitgelieferte Beispiel <c3/> liefert weiterhin { "43.48" } dB-Hz nominal und { "3.23" } dB-Hz minimal für L1 C/A (festgelegt in <c4/>).

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
seg-35151477cbc2 = <c1/> ({ "60" } s, eine Zeile je Sekunde):

# text
seg-47408d30d095 = Nominales C/N₀

# text
seg-e618666a44d8 = Nach dem eigenen Störer

# text
seg-f75d3804cfe8 = Störer

# text
seg-5751b2520829 = generic-uhf ({ "465" } MHz)

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-a582f1a22a07 = { "34.38" } dB-Hz ab { "10" } s

# text
seg-23570b8c7403 = CW auf dem Träger, −{ "120" } dBW

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-2e935ea7b90e = { "3.38" } dB-Hz ab { "20" } s (verloren)

# text
seg-52256ba98a99 = Chirp mit { "16" } MHz, { "50" } mW bei { "100" } m

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-71abaef6924e = { "38.51" } dB-Hz ab { "30" } s

# text
seg-45441a20f061 = Breitbandstörer mit { "40" } MHz bei { "1185" } MHz, −{ "118" } dBW

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-430461899d82 = { "46.29" } dB-Hz ab { "30" } s

# text
seg-4bcace842ce1 = derselbe Breitbandstörer

# text
seg-472da83fd67a = generic-s ({ "2492.028" } MHz)

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-0f0cad45f636 = { "41.69" } dB-Hz ab { "40" } s

# text
seg-d04f42bc0567 = Rauschen mit { "2" } MHz, −{ "128" } dBW

# text
seg-372655e7c722 = generic-c-band-leo ({ "5020" } MHz)

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-b27c4bc24059 = { "40.35" } dB-Hz ab { "50" } s

# text
seg-ab6304cf6aec = angepasstes Rauschen, −{ "124" } dBW

# text
seg-1f8a742cb215 = Jeder Störer nimmt nur sein eigenes Band; der Test hält jedes andere Band auf seinem nominalen C/N₀, bis sein eigener Störer beginnt.

# text
seg-01c63dd5d11b = Wo die Entwürfe verwendet werden

# text
seg-74f85b484b08 = Ein Entwurf wird mit seinem Namen nachgeschlagen, überall dort, wo ein Band einen nennen kann:

# text
# c1: spectrum
# c2: signal = "<design>"
# c3: multi-band-jamming-waterfall
# c4: leo-resilience-js-margin
# c5: leo-resilience-multiband-diversity
# c6: leo-resilience-gnss-jammed-leo-carries
seg-4a7aca809ec3 = ein Band von <c1/> (<c2/>, oben): <c3/>, <c4/> sowie die Kampagnen <c5/> und <c6/>;

# text
# c1: leo-pass
# c2: signal = "<design>"
# c3: frequency_mhz
seg-1ee84efd74b3 = ein Band von <c1/> (<c2/>): Das Band übernimmt die Mittenfrequenz des Entwurfs (sofern <c3/> nicht angegeben ist), die Sendebandbreite und die verfolgte Chiprate, verteilt seine EIRP nach deren Leistungsanteilen auf die Komponenten und berichtet in jeder Epoche das C/N₀ der verfolgten Komponente und das bandbegrenzte Codeverfolgungsjitter (<a1>LEO-PASS.md</a1>);

# text
# c1: leo-pnt-chain
# c2: leo-pnt-end-to-end
# c3: xona-pulsar-end-to-end
seg-33732550ba94 = der Typ <c1/>, der die Leistungsaufteilung und die Chiprate eines Entwurfs an den Überflug und seinen Träger und seine Chiprate an die fusionierte Positionslösung übergibt (<c2/>, <c3/>; <a1>LEO-PNT.md</a1>).

# text
seg-625f50ac3189 = Workshop-Parameter

# text
# c1: scenarios/celeste-iod-classical-pilot-signals.toml
# c2: src/celeste_iod.rs
# c3: scenarios/*celeste-iod*.toml
seg-9d50778efa0a = <c1/> enthält die Frequenzbänder von Celeste IOD und die Signalkonfiguration „Classical Pilot“ #1, wie sie auf dem LEO-PNT-Workshop des ESA NAVISP, { "2026" }, vorgestellt wurden, mit einer Formprüfung eines Entwurfs gegen das dort gezeigte gemessene Spektrum. Sie ist eine der Dateien der Voreinstellung Celeste IOD (die anderen sind <c2/> und die übrigen <c3/>); keine Signalspezifikation von Celeste ist öffentlich. Ihre Komponenten tragen ihre Annahmen (Leistungsaufteilungen, Codelängen, FDMA-Versätze und eine repräsentative Modulation für die Bänder, deren Modulation nicht vorgestellt wurde). Die Formprüfung ist MODELLED-Konsistenz: Sie vergleicht Formen, nicht kalibrierte Pegel.

# text
# c1: src/celeste_iod.rs
# c2: scenarios/*celeste-iod*.toml
# c3: kshana example
# c4: include_str!
seg-6e259f57af91 = Sie wird zusammen mit dem Rest der Voreinstellung zurückgehalten: <c1/> und die Dateien <c2/> löschen. Nichts kompiliert das Szenario ein: Die Befehlszeilenschnittstelle führt es als nur im Repository vorhandenes Szenario auf (<c3/> nennt es und erklärt es, statt es auszugeben), und ein Test weist jedes <c4/> davon zurück. Jedes andere Szenario, jeder andere Test und jede andere unabhängige Referenz läuft ohne sie; der Test, der sie liest, besteht mit einem Hinweis, wenn sie fehlt, und die Zählung der Szenariodateien in der README zählt sie weiterhin mit.

# text
seg-53a7343c076e = Aussage

# text
seg-6e0de0f2b25f = BPSK-Leistung im Band ({ "90.3" } % in der Hauptkeule); bandbegrenztes Early-Late-Jitter, das sich auf die kohärenten und nichtkohärenten Lehrbuchformen und auf seine Gabor-Schranke reduziert; BPSK-Eigen-SSC 2/({ "3" } R_c)

# text
seg-e35f7c20a976 = Kaplan & Hegarty, Betz & Kolodziejski { "2009" }, Betz { "2001" }, Abramowitz & Stegun Tabelle { "5.1" }

# text
seg-0ceb71e558f6 = Geschlossene Form der bandbegrenzten Gabor-Bandbreite; SSC von versetztem BPSK bei Versatz ungleich null; AltBOC mit Einheitsfläche (alles innerhalb der obigen Zeile, als Gegenprüfungen)

# text
seg-b0552001e519 = interne Konsistenz

# text
seg-af6cff634177 = hier abgeleitet, gegen Quadratur geprüft

# text
seg-6b74bc7777c7 = Maximaler LEO-Doppler

# text
seg-f4f4ee11749d = Xona Pulsar X1 { "32" } bis { "34" } kHz (arXiv { "2509.19551" }); Iridium ±{ "36" } kHz (RNTF)

# text
# c1: leo-signal
seg-08e5ec9a31a0 = Entwürfe, Akquisition, Kompatibilität, Störtoleranz, Abwägung, Formprüfungen von <c1/>

# text
seg-64f232587c5f = die validierten geschlossenen Formen, die Detektoridentität P_d({ "0" }) = P_fa, die mittlere Zeit nach Holmes, die eigene SSC-Kette des Spektrumtyps

# text
seg-a456645f97aa = Mehrbandspektrum

# text
seg-868432ccfa09 = Reduktion auf die unveränderten Spektrum- und Jamming-Ketten

# text
seg-430edd66bda0 = Nicht modelliert

# text
seg-d3bba3714684 = Die exakten Spektren von EFQPSK, Code Shift Keying und OFDM.

# text
seg-53a727d317ae = Linienstruktur des Spreizcodes und Kreuzkorrelation beim Mehrfachzugriff.

# text
seg-08e229ae97e9 = Sende- und Empfangsfilter über eine ideale Rechteckflanke hinaus: keine Aussendung außerhalb des Bandes.

# text
seg-b1fe4ce62e6a = Mehrwegeausbreitung, Quantisierung und automatische Verstärkungsregelung.

# text
seg-5d2af0802400 = Erdrotation in der Doppler-Schranke (bis zu etwa { "0.46" } km/s Entfernungsrate).

# text
seg-5e5e1124fbbb = Ionosphärische Verzögerung jenseits der ersten Ordnung und die Aufteilung des Elektronengehalts oberhalb und unterhalb eines LEO-Satelliten: Der Schräg-TEC ist eine Eingabe.

# text
seg-8c0d738304ab = Verluste durch Atmosphäre, Regen und Polarisation.

# text
seg-1fc440f042cf = Akquisitionslogik mit mehreren Verweilzeiten.

# text
seg-090a6ecf879f = Aggregierte Störung über eine Zählung je Satellit hinaus.

# text
seg-c4b2a79ee33d = J. W. Betz und K. R. Kolodziejski, „Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I“, <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

# text
seg-52ad2f21daf4 = J. W. Betz, „Binary Offset Carrier Modulations for Radionavigation“, <em>NAVIGATION</em> { "48" }({ "4" }),

# text
seg-aeeea70a0258 = E. D. Kaplan und C. J. Hegarty (Hrsg.), <em>Understanding GPS/GNSS</em>, 3. Aufl., Artech House,

# text
seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

# text
seg-34af310a980b = M. Abramowitz und I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } und Tabelle { "5.1" }.

# text
seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

# text
seg-960fc01f0a62 = Leclère, Marathe und Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

# text
seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

# text
seg-72490fa16fd2 = Kozhaya, Saroufim und Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

# text
seg-00cfb54b28c0 = CentiSpace: <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

# text
seg-4d954d28b661 = Fakten zu ESA Celeste IOD: <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

# text
seg-d43b8255ba58 = Radio Regulations der ITU: <a1>https://www.itu.int/pub/R-REG-RR</a1>.

# text
# c1: generic-uhf
seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" }. August { "2026" } (die öffentliche Quelle des UHF-Trägers bei { "465" } MHz von <c1/>): <s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>. Die Seite wurde von der Website zurückgezogen (HTTP { "404" } und am 2026-09-29 aus dem Blogindex verschwunden); Suchmaschinen führen sie noch unter diesem Titel auf.

# text
seg-18b16c83dd7c = <s1>Zurück</s1>LEO-Positionierung, -Navigation und -Zeitgebung

# text
seg-50fe3f8ae7ec = <s1>Weiter</s1>LEO-Überflug und Streckenbilanz
