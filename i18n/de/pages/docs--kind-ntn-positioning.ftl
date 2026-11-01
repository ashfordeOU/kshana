# docs--kind-ntn-positioning: translations (de)

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-a3697ad561db = Hz

# text
seg-a849735fcc6e = Themenseite: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
# c1: docs/kinds/by-kind/ntn-positioning.md
seg-8dcdfc5da900 = Quelle: <c1/>

# text
seg-4f0edb786a35 = Positionierung aus einem 5G-Downlink eines nicht-terrestrischen Netzes (NTN) im S-Band des mobilen Satellitendienstes (MSS) (3GPP-Band n256, Downlink { "2170" } bis { "2200" } MHz; Standardträger { "2172.5" } MHz): die Cramér-Rao-Schranke (CRB) für die Ankunftszeit, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), mit beta als quadratisch gemittelter (Gabor-)Bandbreite des flachen OFDM-Spektrums (B/sqrt({ "12" })), und für die Doppler-Verschiebung eines komplexen Tons, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), für jedes Signal (standardmäßig ein New-Radio-Kanal von { "5" } MHz mit { "4.5" } MHz belegt und ein Schmalbandkanal von { "200" } kHz mit { "180" } kHz belegt); dann, über jede LEO-Konstellation, Downlink-Ankunftszeit-Fixes mit unbekannter Empfängeruhr (mit Seed, mit der Schranke plus einem Netzwerksynchronisationsfehler als Sigma), deren PDOP und formales 3D-Sigma sowie ein Ein-Satelliten-Doppler-Fix über den längsten Durchgang bei festgehaltener Höhe. MODELLED: Der Schritt von der Bandbreite zur Schranke ist die Lehrbuch-Formel in geschlossener Form, geprüft gegen numerische Integration der flachen und bandbegrenzten BPSK-Spektren (interne Konsistenz, kein veröffentlichter Rechenwert festgelegt), und die Positionierungsgenauigkeit ist eine Schranke auf einem mehrwegefreien Kanal mit einem angegebenen Synchronisationsfehler, kein erzieltes Ergebnis.

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-fea5da29df00 = Ein Lauf von <c1/> fasst sich zusammen als: 5G-NTN-Positionierung bei { "2172.5" } MHz, C/N0 { "38" } bis { "50" } dB-Hz, { "324" } Satelliten ({ "10.0" } in Sicht) NR { "5" } MHz: { "4500" } kHz, CRB-Entfernung { "0.26" } bis { "1.03" } m; mittleres formales 3D { "2.09" } m, RMS-Fehler { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB-Entfernung { "6.49" } bis { "25.85" } m; mittleres formales 3D { "25.94" } m, RMS-Fehler { "26.73" } m Ein-Satelliten-Doppler-Durchgang: { "53" } Samples über { "520" } s, horizontaler Fehler { "1.9" } m

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-145582d62c8c = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/ntn-5g-positioning.toml
seg-7ff965e77d23 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-409755afa2dd = NR { "5" } MHz

# text
seg-a99a71f7178a = NB { "200" } kHz

# text
seg-d04c7f65307d = index

# text
seg-3a0cde9988c3 = Ergebnisbezeichnung (die der Engine): MODELLED Positionierung aus Cramér-Rao-Schranken: Der Schritt von der Bandbreite zur Schranke ist eine Lehrbuch-Formel in geschlossener Form (geprüft gegen numerische Integration, nicht gegen einen veröffentlichten Rechenwert); die Genauigkeit ist eine Schranke auf einem mehrwegefreien Kanal mit einem angegebenen Synchronisationsfehler, kein erzieltes Ergebnis

# text
seg-056b5f3c8201 = <b>VALIDATED</b> Die Cramér-Rao-Schranke für die Ankunftszeit aus der quadratisch gemittelten (Gabor-)Bandbreite, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), für ein flaches OFDM-Spektrum (beta = B/sqrt({ "12" })), ein bandbegrenztes BPSK-Spektrum (Zähler in geschlossener Form) oder jedes Spektrum durch Quadratur Tests: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-c188cecaf468 = <b>VALIDATED</b> Die Cramér-Rao-Schranke für die Ankunftszeit aus der quadratisch gemittelten (Gabor-)Bandbreite, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), für ein flaches OFDM-Spektrum (beta = B/sqrt({ "12" }). Unabhängige Referenz (ExternalDataset): Veröffentlichte Rechenwerte (P1): Bachl, Lei und Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), Einzel-SSB-Schranken von NR NTN, reproduziert aus der 3GPP-TS-{ "38.211" }-SSB-Abbildung durch die eigenen numerischen Funktionen von Kshana (W_rms { "1.9616" } gegen { "1.96" } MHz, sigma_t { "38.755" } gegen { "39" } us, sigma_f 100.79/87.28 gegen 101/87 Hz, sigma_rho 0.5970/0.5831 gegen 0.60/0.58 m, jeweils innerhalb einer halben Einheit der gedruckten letzten Stelle); Betz { "2001" } Tabelle { "1" } BPSK-R-RMS-Bandbreiten (1.128/3.477 gegen

# text
# c1: label
seg-baa462153341 = MODELLED Positionierung aus Cramér-Rao-Schranken: Der Schritt von der Bandbreite zur Schranke ist eine Lehrbuch-Formel in geschlossener Form (geprüft gegen numerische Integration, nicht gegen einen veröffentlichten Rechenwert); die Genauigkeit ist eine Schranke auf einem mehrwegefreien Kanal mit einem angegebenen Synchronisationsfehler, kein erzieltes Ergebnis (Ergebnis <c1/>)

# text
seg-e23e35aa1203 = Der Schritt von der Bandbreite zur Schranke ist eine Lehrbuch-Formel in geschlossener Form; die Positionierungsgenauigkeit ist MODELLED (eine Schranke auf einem mehrwegefreien Kanal, kein erzieltes Ergebnis). (Kommentar der Szenariodatei, Zeilen { "12" } bis { "13" })

# text
seg-ccb921bf73b5 = <s1>Zurück</s1>moonlight-service-volume

# text
seg-467bd80c37f8 = <s1>Weiter</s1>oem-interop

# text
seg-49964654d5f4 = Szenarioart der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# attr:alt
seg-c200240dd65e = Das Diagramm, das die Engine für scenarios/ntn-5g-positioning.toml schreibt, Art ntn-positioning

# text
# c1: kshana kinds --json
seg-c4a9693d1191 = MODELLED: Der Schritt von der Bandbreite zur Schranke ist die Lehrbuch-Formel in geschlossener Form, geprüft gegen numerische Integration der flachen und bandbegrenzten BPSK-Spektren (interne Konsistenz, kein veröffentlichter Rechenwert festgelegt), und die Positionierungsgenauigkeit ist eine Schranke auf einem mehrwegefreien Kanal mit einem angegebenen Synchronisationsfehler, kein erzieltes Ergebnis. (Szenarioarten-Katalog (<c1/>))

# text
# c1: ntn-positioning
seg-d865fd8ceef6 = <c1/> (Szenarioart)
