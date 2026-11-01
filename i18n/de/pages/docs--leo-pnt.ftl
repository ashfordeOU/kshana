# docs--leo-pnt: translations (de)

# text
seg-46c7e6f003dd = System

# text
seg-cae10fb9bff8 = Szenario

# text
seg-f1f903f1b9ff = Resilienz

# text
seg-1759a8cce7d6 = Arten

# text
seg-71aee5eb55c5 = UHF

# text
seg-e305279d5b11 = Inhalt

# text
seg-b03d56f501c3 = Typ

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-6752521002b2 = Teil

# text
seg-cf6ae60eea4f = Hilfsdaten

# text
seg-0bdbdd2c923b = Synchronisation

# text
seg-b09dc4b322d3 = Ephemeride

# text
seg-3a835a49b43f = Weitere Dienste

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
seg-c1020ac47091 = Was ein Lauf berechnet

# text
seg-f708914fed48 = Bänder

# text
seg-486f17197d4d = REPRESENTATIVE, für C-Band-Systeme, deren Parameter nicht öffentlich sind (zum Beispiel TrustPoint)

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (optional)

# text
seg-fde146239f5d = Ergebnis eines Laufs

# text
seg-a3f63252bd1b = Was es trägt

# text
# c1: docs/LEO-PNT.md
seg-7d2c6fbf95b7 = Quelle: <c1/>

# text
seg-6f1f29597f4b = LEO-PNT in Kshana

# text
seg-2a3a1f19005a = LEO-PNT ist Positionierung, Navigation und Zeitgebung (PNT) mit Satelliten im niedrigen Erdorbit (LEO), neben oder anstelle der globalen Satellitennavigationssysteme (GNSS) der mittleren Erdumlaufbahn (MEO) wie dem Global Positioning System (GPS) und Galileo. Diese Seite verbindet jeden LEO-PNT-Typ und jedes LEO-PNT-Szenario der Engine: was jedes berechnet, die Bänder und Signalvoreinstellungen und woher ihre Zahlen stammen, was die Navigationsnachricht trägt, was VALIDATED und was MODELLED ist und wie jedes Szenario auszuführen ist. Die Typseiten gehen tiefer:

# text
seg-8e3556046e63 = Seite

# text
# c1: leo-signal
# c2: spectrum
seg-cdb06a47be0a = <c1/> (Signalentwürfe) und die Mehrband-Panels von <c2/>

# text
# c1: leo-pass
seg-09894e033033 = <c1/> (Überfluggeometrie und Streckenbilanz je Band, Positionslösungen mit geringer Energie, Ionosphärensondierung, Spoofing-Monitore)

# text
# c1: leo-navmsg
seg-f19c0bfe2996 = <c1/> (die Rundsende-Nachricht: Anpassung, Nutzeralgorithmus, Binär- und Textformate)

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (fusionierte Positionierung, präzise Punktpositionierung, Positionierung mit nichtterrestrischem 5G-Netz (NTN), Zeitgebung, polare Abdeckung)

# text
# c1: spectrum
seg-29013ad5656c = <c1/> (Jamming-Wasserfälle und das Verhältnis von Störer zu Signal (J/S) je Band)

# text
# c1: campaign
seg-d291250b5d01 = <c1/> (Ketten, Durchläufe, Monte Carlo und Zusammensetzungen beliebiger Typen)

# text
seg-8d2de8f77619 = Zuerst systemunabhängig

# text
seg-f3750a8f2863 = Die Engine ist ein generischer LEO-PNT-Simulator. Jede Konstellation (ein Walker-Muster, ausdrückliche Bahnelemente, ein Zweizeilen-Elementsatz (TLE) über den Propagator Simplified General Perturbations { "4" } (SGP4) oder ein entworfener einzelner Überflug), jeder Signalentwurf (jedes Band, jede Mischung aus Komponenten mit binärer Phasenumtastung (BPSK), binärem Offsetträger (BOC) und Frequenzvielfachzugriff (FDMA)), jedes Modell der Navigationsnachricht. Benannte Systeme sind optionale Voreinstellungen: Datendateien, jede mit ihrer Quelle, die nur ausfüllen, was ein Szenario offen lässt. Jede Fähigkeit, jeder Test, jede unabhängige Referenz und jedes mitgelieferte Szenario läuft ohne vorhandene Celeste-Daten.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: scenarios/*celeste-iod*.toml
# c4: tests/workshop_preset_isolation.rs
seg-4d3bd0301e59 = Die Voreinstellung Celeste IOD (Demonstration im Orbit) ist eine optionale Voreinstellung unter ihnen. Ihre Signalparameter wurden auf dem LEO-PNT-Workshop des ESA NAVISP (Navigation Innovation and Support Programme der Europäischen Weltraumorganisation), { "2026" }, vorgestellt und haben noch keine öffentliche Quelle. Jede aus dem Workshop abgeleitete Zahl der Engine steht in einer Datei, <a1><c1/></a1>, die <c2/> nur einkompiliert, wenn sie existiert, und in den nur im Repository vorhandenen Szenarien <c3/>. Das Löschen dieser Datei und dieser Szenarien hält die Voreinstellung ohne Quelltextänderung zurück; jeder andere Test, jede andere unabhängige Referenz und jedes andere Szenario läuft ohne sie (<c4/> wacht darüber, welche Dateien sie nennen dürfen). Diese Seite nennt keine ihrer Zahlen.

# text
seg-5b348102cb63 = Die Typen und wie sie zusammenhängen

# text
seg-120b9be05fc3 = die bandbegrenzte spektrale Leistungsdichte (PSD) eines Signalentwurfs, Leistung im Band, Effektivwert-(Gabor-)Bandbreite, Codeverfolgungsjitter gegen die Träger-Rausch-Dichte (C/N0), Akquisitionssuche und spektrale Trennungskoeffizienten (SSC) gegenüber GNSS-Signalen; eine Bandabwägung (Ultrahochfrequenz (UHF), L, S, C)

# text
seg-d9febf3c74c8 = geschlossene Formen VALIDATED, Entwürfe und Abwägung MODELLED

# text
# c1: spectrum
seg-d0d8d1edd9ee = <c1/> (Mehrband-Panels)

# text
seg-dc3ceb315e9a = Wasserfälle je Band mit Störern je Band (Dauerstrich (CW), Chirp, schmalbandig, breitbandig, angepasst), J/S und effektives C/N0 jedes Signals über eine Zeitleiste

# text
seg-126a14392994 = Spektren VALIDATED, Störer MODELLED

# text
seg-e63f73ab5bca = Überfluggeometrie, Doppler und Dopplerrate, Freiraumdämpfung, Satelliten- und Nutzerantennen, Dämpfung durch Gase, Regen, Szintillation und Gebäudeeindringverlust nach ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 je Band und Epoche neben den MEO-GNSS-Trägern; Ionosphäre je Band und die ionosphärenfreien Paare; Positionslösungen mit geringer Energie; Ionosphärensondierung; Spoofing-Monitore

# text
seg-a9fd4162604f = Komponenten VALIDATED, Überflug MODELLED

# text
seg-91304e663174 = die Rundsende-Nachricht aus Ephemeride und Uhr: Anpassung, Entfernungsfehler im Signal im Raum (SISRE) gegen Anpassungsintervall und Aktualisierungsperiode, Kontinuität der Aktualisierung mitten im Überflug, Nutzeralgorithmus, Binärrahmen mit 24-Bit-Prüfsumme (CRC-24Q), Exporte im Stil von RINEX { "4" } (Receiver Independent Exchange Format) und als kommagetrennte Werte (CSV)

# text
seg-cf93a9ba065c = Nutzeralgorithmus, Gewichte und CRC VALIDATED, Anpassungen MODELLED

# text
seg-3084696ad387 = Doppler-Positionierung, gemeinsame Pseudoentfernungslösungen aus GNSS + LEO mit Zwischensystemversätzen, polare und arktische Geometrie, Zeitübertragung zur koordinierten Weltzeit (UTC), mit einer optionalen Kurve des Zeitfehlers je Epoche

# text
seg-79117194e50b = Maximaldoppler VALIDATED, Rest MODELLED

# text
seg-1de31fd3cf86 = Konvergenz der präzisen Punktpositionierung (PPP) nur mit GNSS und mit LEO-Schichten

# text
seg-525733c10d9b = Positionierungsgenauigkeit mit 5G NTN aus der Bandbreite der Abwärtsstrecke (Cramér-Rao-Schranke)

# text
seg-cb8eee06e664 = ein System durchgängig: Signalentwurf, Überflug, Nachricht, fusionierte Positionslösung und PPP, jede Übergabe aufgeführt

# text
seg-d28e18170f82 = beliebige der obigen, auf einer Zeitleiste verkettet, durchlaufen, als Monte-Carlo-Ensemble ausgeführt oder unter gemeinsamen Bedingungen zusammengesetzt

# text
seg-5479654fabfd = Die Kette übergibt Werte im Code (siehe <a1>Durchgängige LEO-PNT-Kette</a1> unten): Der Signalentwurf legt die Aufteilung der EIRP (äquivalente isotrope Strahlungsleistung) des Überflugbandes und die verfolgte Chiprate fest; der Überflug liefert das verfolgte C/N0 und das Codejitter; der SISRE der Navigationsnachricht und das C/N0 des Überflugs gewichten die LEO-Messungen der fusionierten Positionslösung.

# text
# c1: data/leo-signals/generic-bands.toml
# c2: generic-c-band.toml
seg-a0331a21413c = Die generischen Entwürfe verwenden öffentliche Bandmitten; jeder ist REPRESENTATIVE, nicht das Signal irgendeines Systems (<c1/>, <c2/>).

# text
seg-a86ce24d81de = Band

# text
seg-daf61ebdca17 = Zuweisung

# text
seg-ba6fbebc2a98 = Generischer Entwurf

# text
seg-3332ae549a90 = Mitte

# text
seg-c7be6f6797a8 = Sendebandbreite

# text
seg-74f4e80c65cb = Komponenten

# text
seg-e95de3591152 = Ionosphärische Verzögerung erster Ordnung relativ zu L

# attr:title
seg-e769f0411e64 = Vom Herausgeber zurückgezogen; keine archivierte Kopie

# text
seg-8b04e51a023e = keine Funknavigationszuweisung (repräsentativ); Träger aus der öffentlichen <s1>openRECEIVER-Erhebung</s1> (Seite inzwischen zurückgezogen; siehe <a1>LEO-SIGNAL.md</a1>)

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-8a3026904912 = { "10" } MHz

# text
seg-e1500e8695b9 = BPSK({ "5" }) Pilot und Daten

# text
seg-ac33d89291ca = Funknavigationssatellitendienst (RNSS), die Mitte von Galileo E5

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-54e10c07ace3 = BPSK({ "10" }) Pilot und Daten

# text
seg-5e28b8377751 = Funkortungssatellitendienst (RDSS), der S-Träger von NavIC (Navigation with Indian Constellation)

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-a573432714b8 = { "16.5" } MHz

# text
seg-6fe14d537f33 = RNSS, Mitte der Zuweisung { "5010" }–{ "5030" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-0b50907d3165 = { "20" } MHz

# text
seg-c43105d1c770 = C erweitert

# text
seg-c05714081a0e = außerhalb der RNSS-Zuweisung (repräsentativ)

# text
seg-638ab0837b29 = { "5100" } MHz

# text
seg-4d3857271629 = { "120" } MHz

# text
seg-18bc5451fc46 = BPSK({ "50" }) Pilot und Daten

# text
seg-3714e1c00ab8 = S (mobiler Satellitendienst, MSS)

# text
seg-cc26934bac14 = MSS-Abwärtsstrecke, Band n256 des 3GPP (Third Generation Partnership Project)

# text
# c1: ntn-positioning
seg-12ca7304ece7 = verwendet von <c1/>

# text
seg-896b6ee57728 = { "2172.5" } MHz

# text
seg-e6e1d955489a = { "0.18" } bis { "20" } MHz

# text
seg-50e44c7042c9 = 5G-New-Radio-Positionierungssignale

# text
# c1: (f_L/f)²
# c2: f_L
# c3: 20·log10(f/f_L)
seg-e75e48eeeca1 = BPSK(n) ist binäre Phasenumtastung mit n × { "1.023" } Mchip/s. Das Verzögerungsverhältnis ist <c1/> mit <c2/> = { "1191.795" } MHz. Die Freiraumdämpfung wächst bei gleicher Entfernung um <c3/> (−{ "8.2" } dB bei UHF, +{ "6.4" } dB bei S, +{ "12.5" } dB bei C).

# text
seg-02f71b44edf5 = Signal- und Systemvoreinstellungen

# text
seg-c60ce9c32b57 = REPRESENTATIVE, Bandmitten aus den Radio Regulations der ITU

# text
# c1: generic-bands
# c2: generic-leo
# c3: leo-pass
seg-58fae66f7c12 = <c1/> (Signalentwürfe): die obige Bandtabelle; <c2/> (der Standard von <c3/>): UHF bei { "450" } MHz, L, S und C bei den obigen Mitten, { "0" } dBW EIRP je Band, eine sonnensynchrone Walker-240/12/1-Schicht in { "550" } km

# text
seg-5d918965c00c = BPSK({ "10" }) bei { "5020" } MHz, isoflux-Keule

# text
seg-dddb031a7e2e = PUBLIC: Leclère, Marathe und Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

# text
seg-67fc4039084d = X1 bei { "1593.3225" } MHz ({ "1.023" } Mchip/s) und X5 bei { "1190.51625" } MHz ({ "10.23" } Mchip/s), die veröffentlichten minimalen und maximalen Empfangsleistungen, { "258" } Satelliten in etwa { "1080" } km (Schalen mit { "53" } und { "97" } Grad)

# text
seg-f17f98d1ae0b = PUBLIC: <a1>Briefing der Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
# c1: leo-pass
seg-c6694cdbb02b = Bursts in { "1616" }–{ "1626" } MHz, Doppler bis zu ±{ "36" } kHz, { "66" } Satelliten in { "780" } km ({ "781" } km in der Voreinstellung <c1/>), Empfangsleistung „{ "300" } bis { "2400" }-mal GPS“

# text
# c1: starlink-soo
# c2: starlink-soop
# c3: starlink-sop
seg-704ec002a889 = <c1/> / <c2/> / <c3/> (Signal-, Überflug- und Positionierungstypen)

# text
seg-a4a3a7c7bc22 = PUBLIC Signalzahlen: Kozhaya, Saroufim und Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE Bahn

# text
seg-49985bf11216 = eine Ku-Band-Bake bei { "240" } MHz, nur für Doppler verwendet, C/N0 etwa { "57" } dB-Hz

# text
seg-84cb50b019e0 = PUBLIC Signalstruktur: <a1>PMC10301026</a1>; REPRESENTATIVE Bahn und Leistung

# text
seg-1c50faed9f1e = BPSK mit { "2.046" } Mchip/s nahe L1 und L5

# text
# c1: atomic-zero-clock
# c2: atomic
seg-c72e9b87f116 = <c1/> (<c2/> im Nachrichtentyp)

# text
seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) Nutzlast</a1>

# text
seg-4f0cff24b4fd = eine Ephemeride als Polynom 6. Ordnung ohne Uhrenterme (die Uhr wird auf GNSS-Zeit gesteuert)

# text
seg-9d1e7aebcd84 = WORKSHOP: vorgestellt auf dem LEO-PNT-Workshop des ESA NAVISP, { "2026" }

# text
seg-28c2e7ae6065 = die Signalkonfiguration #1 und das Nachrichtenlayout der Demonstration im Orbit, in der einen zurückhaltbaren Datei

# text
seg-9f0d16f43993 = Jede Voreinstellung kennzeichnet ihre Zahlen als PUBLIC (mit einer URL), REPRESENTATIVE (eine dokumentierte Entwurfsentscheidung, nie eine Aussage über ein reales System) oder WORKSHOP, und das Ergebnis jedes Laufs, der eine verwendet, sagt, welche.

# text
seg-556fe9c6c3b1 = Die Navigationsnachricht

# text
seg-a220662ed8de = Eine LEO-Navigationsnachricht (<a1>LEO-NAVMSG.md</a1>) trägt vier Teile, die Struktur, die das Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) und die veröffentlichten LEO-Vorschläge gemeinsam haben:

# text
seg-5bda276f6e82 = der 16-Parameter-Kepler-Satz des Galileo-ICD (Quadratwurzel der großen Halbachse, Exzentrizität, Inklination und ihre Rate, Rektaszension des Knotens und ihre Rate, Argument des Perigäums, mittlere Anomalie, Korrektur der mittleren Bewegung, sechs harmonische Korrekturen, Bezugszeit), dazu Korrekturpolynome längs der Bahn, quer zur Bahn und radial; oder das 22-Parameter-Modell von Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); oder das Zero-Clock-Polynom von ATOMIC

# text
seg-8a7dabfece01 = Wochennummer und Wochenzeit (TOW) sowie ein Uhrenpolynom zweiter Ordnung (af0, af1, af2 um toc)

# text
seg-24eaf4ae7eb3 = Raumfahrzeugkennung (SVID), Datenausgabestand (IOD), Signalzustand

# text
seg-e7d819b7a724 = ionosphärische Korrekturen für Einzelfrequenznutzer (ein Satz im Klobuchar-Stil und NeQuick-G ai0–ai2) und der Versatz von Systemzeit zu UTC (A0, A1, Schaltsekunden und ihr Zeitplan)

# text
seg-200e59d9279c = Der Binärrahmen ist Kshanas eigene dokumentierte Kodierung nach dem Vorbild dieser Komponenten, nicht das Bitlayout irgendeines Systems. RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze, daher ist der Export im RINEX-Stil eine dokumentierte Kshana-Erweiterung (Vorarbeiten: <a1>arXiv { "2401.17767" }</a1>).

# text
# c1: campaign
# c2: spectrum
seg-aa18ab84599b = Durchlauf <c1/> von <c2/>

# text
seg-70dc120ea19e = ein Breitbandstörer mit { "50" } MHz bei { "1185" } MHz, von −{ "140" } bis −{ "80" } dBW durchlaufen: GPS L5 geht bei −{ "105" } dBW verloren, Galileo E5a und das LEO-L-Band-Signal bei −{ "100" } dBW; die LEO-Signale in UHF, S und C behalten bei jeder Leistung { "49.4" }, { "49.2" } und { "47.4" } dB-Hz

# text
seg-61f05d7e3a18 = ein Breitbandstörer mit { "40" } MHz bei { "1185" } MHz, der ab −{ "125" } dBW alle { "10" } s um { "5" } dB steigt: GPS L5 geht bei −{ "105" } dBW verloren, Galileo E5a bei −{ "100" } dBW, Xona X5 (bei seiner veröffentlichten Mindestleistung, −{ "144.9" } dBW) bei −{ "95" } dBW; ein generisches LEO-Signal bei −{ "135" } dBW wird bei −{ "90" } dBW noch verfolgt ({ "28.9" } dB-Hz). Empfangsleistung kauft J/S-Marge dB für dB

# text
seg-6a3a46be60a5 = ein Positionssprung von { "30" } m an einem vermessenen Standort: Der Doppler-Test nur mit GNSS erkennt ihn nie; der Test über alle Kanäle erkennt ihn { "105" } s nach dem Einsetzen (siehe <a1>LEO-PASS.md</a1>)

# text
# c1: campaign
# c2: leo-pass
seg-d0c4683d7c93 = Zusammensetzung <c1/> aus <c2/>

# text
seg-bf0ec52f63ea = vier Spoofer, beide Monitore: Ein Spoofer nur im L-Band und ein Spoofer in allen Bändern ohne Ionosphäre werden vom Monitor zwischen den Bändern beim Einsetzen ({ "300" } s) erkannt und vom Doppler-Monitor bei { "420" } s und { "395" } s; ein ionosphärenbewusster Spoofer in allen Bändern nur vom Doppler-Monitor ({ "395" } s); ein Schub von { "30" } m nur mit GNSS von keinem von beiden

# text
# c1: campaign
# c2: spectrum
# c3: integrity
seg-17bcc4ead2ee = Kette <c1/> (<c2/>, <c3/>)

# text
seg-d9b6e6fe6807 = GNSS { "15" } Minuten lang gestört (GPS-L1-Coarse/Acquisition-(C/A-)Code auf etwa { "10" } dB-Hz, E5a auf { "17.4" } dB-Hz gegen eine Untergrenze von { "25" } dB-Hz), während die LEO-Signale in S und C { "49.2" } und { "47.4" } dB-Hz halten; die Receiver Autonomous Integrity Monitoring (RAIM) allein auf der LEO-Schicht bildet in jeder Epoche ein Schutzniveau, unter der vertikalen Alarmgrenze von { "50" } m bei { "28" } von { "30" } Rasterzeiten, wobei bei den anderen beiden der Alarm ausgelöst wird; nominale Phase und Erholungsphase { "5.4" } bis { "15.6" } m

# text
# c1: multi-band-jamming-waterfall
seg-42efdd12fc54 = Die Spoofing-Monitore, ihre Statistiken und ihre Grenzen stehen auf <a1>LEO-PASS.md</a1>. Der Mehrband-Wasserfall mit einem anderen Störer je Band ist <c1/> (<a2>LEO-SIGNAL.md</a2>).

# text
seg-d9e58c4aa8d5 = Ein Szenario je Experimentierschwerpunkt

# text
seg-1ab626f27e9d = Die acht Experimentierschwerpunkte der Celeste-IOD-Ausschreibung für Experimente Dritter (ESA Open Space Innovation Platform, OSIP) sind generische LEO-PNT-Fragen; jede hat ein systemunabhängiges Szenario:

# text
seg-afc60ca3c9da = Schwerpunkt

# text
seg-8a8f40ce3e40 = Hochgenaue Positionierung (PPP)

# text
# c1: campaign
# c2: leo-ppp
seg-b5eb3448dbb1 = Durchlauf <c1/> von <c2/>

# text
seg-5692301bc7cf = Eine Schicht mit 192 Satelliten in { "500" }, { "1000" } und { "1500" } km verkürzt die Konvergenz der Multi-GNSS-PPP mit Gleitkomma-Mehrdeutigkeiten in München von { "13.0" } min auf { "3.25" }, { "3.25" } und { "3.5" } min (sechs Realisierungen, Epochen von { "30" } s)

# text
seg-3992215bc8c9 = PNT-Resilienz (L, S, C)

# text
seg-a2cc270b415c = siehe Resilienz

# text
seg-8a6381ff15ac = Kompatibilität mit 5G/6G NTN

# text
# c1: campaign
# c2: ntn-positioning
seg-ae21ac79775f = Durchlauf <c1/> von <c2/>

# text
seg-cb52e7eb3c36 = Bandbreite der Positionierungsreferenz { "180" } kHz bis { "20" } MHz: Entfernungs-Sigma im Zenit { "6.5" } m bis { "5.8" } cm, 3D-Fehler der Ankunftszeit { "30.1" } m bis { "2.1" } m, nach unten begrenzt durch den Synchronisationsfehler des Netzes von { "1" } m

# text
seg-45985b521980 = PNT mit geringer Energie für das Internet der Dinge (IoT) und mobile Geräte

# text
# c1: campaign
# c2: leo-pass
# c3: [iot]
seg-9afaaed509ef = Durchlauf <c1/> von <c2/> <c3/>

# text
seg-3bb8cc776a28 = UHF-EIRP −{ "35" } bis +{ "5" } dBW: Unter einem medianen C/N0 von etwa { "35" } dB-Hz steigt die Energie je Warmstart-Positionslösung von { "18" } mJ auf { "55" } J; darüber beträgt die Batterielebensdauer bei einer Positionslösung je Stunde { "8334" } Tage, bestimmt durch den Schlafstrom

# text
seg-4b0890bd9215 = LEO-PNT-Wissenschaft

# text
seg-a1ddeda103fa = Schräg-Gesamtelektronengehalt (TEC) aus jedem Bandpaar eines Überflugs mit vier Bändern über Tromsø: { "18.85" } TEC-Einheiten, von jedem Paar wiedergewonnen, 1-Sigma { "0.017" } (UHF mit L) bis { "2.9" } TEC-Einheiten (S mit C)

# text
seg-fc31db33e6fe = Zusätzliche PNT-Datendienste

# text
# c1: campaign
# c2: leo-navmsg
seg-91db4e7b4d9c = Zusammensetzung <c1/> aus <c2/>

# text
seg-aee8bb27a2fb = der Nachrichtenrahmen von Kshana wächst von { "146" } Bytes (Ephemeride und Uhr, { "1045" } Bits) auf { "154" } mit dem Klobuchar-Satz, { "159" } mit NeQuick-G und { "171" } mit den UTC-Parametern

# text
seg-bd6c76037986 = Navigation in Gebäuden (UHF)

# text
seg-0a274a3aeb86 = maximales C/N0 in Gebäuden bei traditioneller Bauweise: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; bei thermisch effizienter Bauweise UHF { "15.3" } dB-Hz und jedes andere Band niedriger

# text
seg-101de8218f35 = Fusionierte PNT aus MEO + LEO

# text
# c1: campaign
# c2: leo-pvt
seg-b4daa58a2fe7 = Durchlauf <c1/> von <c2/>

# text
seg-903d8dcb96cc = Xona X5 fusioniert mit GPS und Galileo über Madrid: 3D-Fehler nur mit GNSS { "1.06" } m quadratischer Mittelwert (RMS); fusioniert { "0.08" } m bei einem LEO-SISRE von { "5" } cm, { "0.57" } m bei { "0.5" } m und { "1.01" } m bei { "5" } m

# text
seg-ebe7a27275cb = Ein Szenario je Anwendungsfeld für Endnutzer

# text
# c1: campaign
# c2: leo-pass
seg-7c21d067769a = Jedes Anwendungsfeld ist eine Kette <c1/> auf einer Zeitleiste, sodass es animiert, und jedes hat ein Mitglied <c2/>, sodass es Geometrie exportiert (siehe <a1>Ausführen</a1>).

# text
seg-1d1135625500 = Anwendungsfeld

# text
seg-f1a7e54ea7d0 = Autonome Fahrzeuge

# text
seg-3610a5f7c352 = ein Auto in München: freie Straße, fusionierter Fehler im Mittel { "0.30" } m; in einer Straßenschlucht von { "35" } Grad behalten GPS und Galileo { "8" } Satelliten und einen mittleren Fehler von { "5.8" } m, die generische LEO-Schicht fügt { "4" } bis { "5" } hinzu und bringt ihn auf { "2.1" } m, bei etwa der Hälfte der Epochen in der Straßenschlucht weiterhin über der Schwelle von { "1.5" } m für Fahrspurgenauigkeit

# text
seg-6622d9c7366d = Schiene und Seeschifffahrt

# text
# c1: maritime-strait-jamming
# c2: rail-tunnel-coast
seg-73ba745cb492 = das mitgelieferte Schiff <c1/> verliert jeden GNSS-Satelliten ({ "12.1" } dB-Hz), während sein LEO-Überflug in S und C { "44.2" } und { "38.1" } dB-Hz erreicht; der mitgelieferte Zug <c2/> erreicht { "35.8" } s nach der Tunneleinfahrt { "2" } m Inertialfehler; im Freien liefert sein LEO-Überflug { "35" } bis { "50" } dB-Hz in L

# text
seg-c87973b9139a = Kritische Infrastruktur

# text
seg-c16a4c99e132 = ein Oszillator der TCXO-Klasse (temperaturkompensierter Quarz) im Zeitserver eines Umspannwerks erreicht beim freien Lauf über einen Tag ohne GNSS { "29" } µs und überschreitet die Schutzgrenze von { "1" } µs zwischen { "75" } und { "80" } Minuten nach dem Verlust (im 5-Minuten-Raster); dieselbe Klasse, an Iridium angebunden, bleibt innerhalb von −{ "40" } bis +{ "11" } ns

# text
seg-1be8e11b2530 = Polare und arktische Nutzer

# text
seg-660e450cb4ab = GPS + Galileo mittlere Positions-Dilution-of-Precision (PDOP) { "1.38" }, { "1.57" } und { "1.62" } in Tromsø, auf Spitzbergen und am Nordpol; mit Iridium { "1.29" }, { "1.34" } und { "1.26" }, bei { "3.0" }, { "5.5" } und { "6.8" } Iridium-Satelliten in Sicht

# text
seg-22d99734acf1 = Drahtlosnetze 5G/6G

# text
# c1: telecom-timing
seg-abcc6337206f = der ofenstabilisierte Quarzoszillator (OCXO) einer Basisstation im Holdover überschreitet die Netzgrenze von { "1.1" } µs nach { "8863" } s und die Grenze der Endanwendung von { "1.5" } µs nach { "10006" } s (die Analyse des Typs <c1/>); an Xona X5 angebunden bleibt sein Zeitfehler den ganzen Tag zwischen −{ "0.7" } und +{ "0.3" } ns, mit einer vorhergesagten 1-Sigma von { "5" } ns, der angegebenen Unsicherheit des rundgesendeten UTC-Versatzes

# text
seg-532d6814ab2d = Asset-Tracking und IoT

# text
seg-b4d6d822e1d0 = die warme UHF-Positionslösung eines Containeranhängers kostet { "18" } mJ am Kai und auf See ({ "8334" } Tage Batterielebensdauer bei einer Positionslösung je Stunde) und { "34" } mJ in einem Lagerhaus ({ "5770" } Tage), wo das L-Band auf { "20" } bis { "24" } dB-Hz fällt

# text
seg-e54b0342fa79 = VALIDATED und MODELLED

# text
seg-dd808d1741f3 = Eine Zeile ist nur dann VALIDATED, wenn ein Test einen veröffentlichten Aufbau reproduziert und die veröffentlichte Zahl innerhalb einer angegebenen Toleranz festlegt; alles andere ist MODELLED, mit seiner Begründung (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

# text
seg-344712930047 = bandbegrenzte Signalleistung in geschlossener Form und Early-Late-Codeverfolgungsjitter an veröffentlichten Betriebspunkten (Betz und Kolodziejski { "2009" }), mit gegengeprüfter Gabor-Bandbreite und gegengeprüftem SSC;

# text
seg-e93d5b5d3dda = der maximale Doppler eines LEO-Navigationssatelliten (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) und die Doppler-Hüllkurve für einen ruhenden Nutzer gegen arXiv { "2509.19551" } Tabelle { "1" };

# text
seg-b02c1b42e509 = Regenkoeffizienten nach ITU-R P.838-3, Regendämpfung und troposphärische Szintillation nach P.618-14 und Gebäudeeindringverlust nach P.2109-2 gegen die Validierungsdaten der ITU-R Study Group { "3" };

# text
seg-fc668542b66d = die Skalierung der ionosphärischen Verzögerung erster Ordnung und die Freiraumdämpfung (Gruppenlaufzeitverhältnis nach IS-GPS-200, die Form nach Friis);

# text
seg-59847c667c8b = die global gemittelten SISRE-Gewichte (Montenbruck et al. { "2018" }), der Nutzeralgorithmus des Galileo-ICD gegen RTKLIB an realen Rundsende-Ephemeriden und CRC-24Q gegen seinen Katalog-Prüfwert.

# text
seg-3cc1d3f1c0f8 = Ein Szenario ausführen

# text
# c1: kshana example <name>
seg-00d5b60c0ebb = Jedes Szenario oben ist mitgeliefert: <c1/> gibt es aus, und

# text
# c1: .result.json
# c2: .chart.svg
# c3: .report.html
# c4: .report.json
# c5: .animation.html
seg-e01ebe977e65 = schreibt neben die Datei das Ergebnis (<c1/>), das Diagramm (<c2/>), den erweiterten Bericht (<c3/> und <c4/>, mit einem Abschnitt, der den animierten Lauf einbettet und die Exporte auflistet), den interaktiven Player (<c5/>) und die Exporte. Was gilt, hängt vom Typ ab:

# text
# c1: leo-pass
# c2: spoof.series
# c3: spectrum
# c4: leo-pvt
# c5: leo-ppp
# c6: --animate
# c7: leo-resilience-multiband-diversity
# c8: leo-resilience-spoof-monitors
# c9: leo-focus-*
# c10: leo-focus-science-iono-sounding
# c11: --animate
seg-8a96eda978b4 = ein Lauf mit einer Zeitachse animiert: Epochen von <c1/>, die <c2/> eines Spoofing-Laufs, Zeitleisten von <c3/>, gemeinsame Epochen und Zeitverläufe von <c4/>, Fehlerkurven von <c5/> und jede Kampagnenkette. Ein Durchlauf oder eine Zusammensetzung hat keine Zeitachse: <c6/> weist sie mit dem Exit-Status { "1" } zurück, und dann schreibt der Befehl gar nichts; die acht Durchläufe und Zusammensetzungen oben (<c7/>, <c8/> und jedes Szenario <c9/> außer <c10/>) sind daher ohne <c11/> auszuführen;

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: <name>.<member>.czml
seg-8d26148aeeff = <c1/> und <c2/> exportieren CZML (die Cesium Language), KML (Keyhole Markup Language), GeoJSON und STK-Ephemeriden (Systems Tool Kit) der Überfluggeometrie; eine Kampagne exportiert jedes Mitglied, das Geometrie hat, als eigenen Dateisatz, mit der Mitgliedsbezeichnung im Dateinamen (<c3/>), sodass jedes Anwendungsfeld seine LEO-Überflüge exportiert; die anderen LEO-Typen geben an, warum ein Format nicht zutrifft (<a1>INTEROP.md</a1>).

# text
seg-6f3ad057f914 = Die übrigen LEO-Szenarien, nach Typ (Einzelheiten auf der Seite jedes Typs):

# text
# c1: leo-band-trade
# c2: xona-pulsar-signals
# c3: celeste-iod-classical-pilot-signals
seg-73365a12bf64 = <c1/>, <c2/>, optional <c3/>

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-pass-xona-pulsar
# c3: leo-pass-iridium
# c4: leo-indoor-uhf
# c5: leo-iot-energy
# c6: leo-pass-celeste-iod-multiband
seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optional <c6/>

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
# c5: leo-navmsg-celeste-iod
seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, optional <c5/>

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: polar-arctic-leo-coverage
# c5: leo-timing-utc
# c6: celeste-iod-fused-pvt
seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optional <c6/>

# text
# c1: leo-pnt-end-to-end
# c2: xona-pulsar-end-to-end
# c3: celeste-iod-end-to-end
seg-e3017b224dfc = <c1/>, <c2/>, optional <c3/>

# text
seg-1ada84b384ee = Die optionalen Szenarien sind nur im Repository vorhanden und werden zusammen mit der Celeste-Voreinstellungsdatei zurückgehalten.

# text
# c1: leo-pnt-mega-shell
# c2: constellation-design
# c3: slot-timing-ocxo-leo
# c4: slot-timing
seg-6305e46ec778 = Zwei davon gehören zu anderen Typen. <c1/> (<c2/>) dimensioniert eine LEO-PNT-Konstellation mit 5000 Satelliten in vier veranschaulichenden Walker-Schalen: Verfügbarkeit { "99.22" } % bei einem PDOP von { "3" } oder weniger über einer Maske von { "20" }°, medianer PDOP { "1.11" } und im Mittel { "39.4" } Satelliten in Sicht über { "648" } Rasterpunkte und { "12" } Epochen. <c3/> (<c4/>) fragt, wie lange der OCXO nach Datenblatt eines LEO-Kleinsatelliten nach seiner letzten GNSS-Positionslösung bei k = { "3" } innerhalb einer Zeitschlitz-Schutzgrenze von { "100" } ns bleibt: Die Schutzgrenze wird { "650.8" } s nach einer Positionslösung gebrochen, er braucht also mindestens alle { "645.8" } s eine Positionslösung ({ "133.8" } am Tag), wobei das Random-Walk-Frequenzrauschen der bestimmende Term ist.

# text
seg-ee9f20a4485b = Durchgängige LEO-PNT-Kette

# text
# c1: leo-pnt-chain
# c2: src/leo_pnt_chain.rs
seg-a6167db680ba = Der Typ <c1/> (<a1><c2/></a1>) folgt einem LEO-PNT-System vom Signalentwurf bis zur Position des Nutzers. Jede Stufe ist ein eigener Typ der Engine, auf ihrer eigenen Tabelle des Kettenszenarios ausgeführt, und die Kette übergibt Werte im Code von einer Stufe an die nächste:

# text
seg-38ce4c90dd78 = Von

# text
seg-2cbf005ed5cc = An

# text
seg-5d84d64174b6 = Was weitergegeben wird

# text
seg-15372352ab42 = der Leistungsanteil der verfolgten Komponente, der Anteil im Band und die verfolgte Chiprate (die Aufteilung der EIRP des Bandes und sein C/N0-Versatz)

# text
# c1: [navmsg.orbit]
seg-0be525c6b695 = Höhe und Inklination des Kettensatelliten (die wahre Bahn der Nachricht), sofern <c1/> sie nicht angibt

# text
seg-d2306e118be7 = das verfolgte C/N0 an der Positionierungsmaske und im Zenit, aus einer an den Überflug angepassten Ausgleichsgeraden im Sinus der Elevation nach der Methode der kleinsten Quadrate

# text
# c1: od_sisre_m
seg-ee40b8cd109b = der Entfernungsfehler im Signal im Raum (SISRE): der Darstellungsfehler der Nachricht (quadratischer Mittelwert, Bahn und Uhr) mit dem Term <c1/> der Bahnbestimmung des Szenarios als Wurzel aus der Quadratsumme

# text
seg-b4b3dff58f3b = die Trägerfrequenz und die verfolgte Chiprate

# text
# c1: handoffs
# c2: [pass]
# c3: signal = "<design>"
# c4: leo-pass
# c5: leo-signal
seg-4def115dba1b = Ein Wert wird nur dort weitergegeben, wo die nachgelagerte Tabelle ihn offen lässt, und jede Übergabe wird im Feld <c1/> des Ergebnisses mit Wert, Einheit und Ziel aufgeführt. Ein Band von <c2/> muss den Entwurf nennen (<c3/>); so trägt auch ein Band von <c4/> für sich genommen jeden Entwurf von <c5/>: Es übernimmt die Mittenfrequenz des Entwurfs, die Sendebandbreite und die verfolgte Chiprate, verteilt seine EIRP auf die Komponenten und berichtet in jeder Epoche das C/N0 der verfolgten Komponente und das bandbegrenzte kohärente Early-Late-Codeverfolgungsjitter (Betz und Kolodziejski { "2009" }; Abstand eines halben Chips, Schleife von { "1" } Hz, { "20" } ms).

# text
# c1: generic-l
seg-2a2b15256cf4 = generisch: der repräsentative Entwurf <c1/>, ein Überflug von { "53" }° in { "1080" } km über Madrid, eine Walker-Schicht mit 240 Satelliten

# text
seg-bb05e8e505e3 = Maximum des verfolgten C/N0 { "58.2" } dB-Hz, medianes Codejitter { "0.050" } m; SISRE { "0.250" } m weitergegeben; quadratischer Mittelwert (RMS) des 3D-Fehlers nur mit GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; Konvergenz der präzisen Punktpositionierung (PPP) { "11.5" } min nur mit GNSS, { "7.5" } min mit der LEO-Schicht

# text
seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), die geneigte Schale für die Positionierung und beide Schalen für PPP

# text
seg-a8fe501bf419 = Maximum des verfolgten C/N0 { "66.3" } dB-Hz, medianes Codejitter { "0.018" } m; RMS des 3D-Fehlers nur mit GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; PPP-Konvergenz { "20.6" } min nur mit GNSS, { "5.9" } min mit Pulsar

# text
# c1: celeste-iod-end-to-end
seg-002e4c918dda = <c1/> (optional)

# text
seg-a608af78a360 = Celeste-IOD-E5-Konfiguration #1 mit der Celeste-Nachrichtenvoreinstellung (zusammen mit der Voreinstellung zurückgehalten)

# text
seg-be428c21bd27 = der Überflug reproduziert das maximale Gesamt-C/N0, auf das die Voreinstellung kalibriert ist (der Wert steht in der Voreinstellungsdatei); zwei Satelliten verändern eine fusionierte Positionslösung über 95 Minuten kaum ({ "1.50" } m auf { "1.48" } m RMS 3D)

# text
seg-bf44ba47e48b = schreibt das Ergebnis, das Diagramm, den erweiterten Bericht (der den animierten Überflug einbettet und die Exporte verlinkt), den interaktiven Player sowie CZML (die Cesium Language), KML (Keyhole Markup Language), GeoJSON und STK-Ephemeridendateien (Systems Tool Kit) der Überfluggeometrie.

# text
# c1: od_sisre_m
seg-a08e67a32d60 = Die Kette ist MODELLED: Sie fügt keine Physik hinzu, und jede Stufe behält ihre eigenen Kennzeichnungen. Das C/N0-Modell der Positionierungsstufe ist eine Gerade im Sinus der Elevation, sodass eine überflugspezifische Form auf zwei Zahlen reduziert wird; die Nachrichtenstufe modelliert keine Bahnbestimmung, weshalb <c1/> eine angegebene Eingabe ist ({ "0.25" } m in den mitgelieferten Szenarien, repräsentativ für die Bahnbestimmung an Bord im Dezimeterbereich und die gesteuerte Uhr im Chip-Maßstab, die die ATOMIC-Nutzlast meldet: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

# text
seg-ee3c5b58e6fa = <s1>Zurück</s1>Mondbahn und Mondoberfläche als Infrastruktur

# text
seg-6b951d6413c8 = <s1>Weiter</s1>LEO-Signalentwürfe

# text
seg-592a6cf625c5 = Zeilen VALIDATED zu LEO-PNT:

# text
seg-922761c46f8a = Zeilen MODELLED zu LEO-PNT: jeder Signalentwurf und jede Bandabwägung, der Mehrband-Wasserfall, jeder Überflug und jede Streckenbilanz als Ganzes, die Voreinstellungen, Positionslösungen mit geringer Energie, die Anpassung und die Formate der Nachricht, Doppler- und gemeinsame Positionierung, PPP-Konvergenz, NTN-Positionierung, Zeitübertragung, polare Abdeckung, die durchgängige Kette, die Spoofing-Monitore und die Ionosphärensondierung sowie jede Kampagne (eine Kampagne setzt Typen zusammen und fügt keine Physik hinzu; ihre Zusammensetzungsidentitäten werden getestet, <a1>CAMPAIGNS.md</a1>). Keine LEO-C/N0, kein Entfernungsmessfehler und keine Positionierungskennzahl wird mit einer Messung irgendeines Satelliten verglichen.

seg-9bfe27f7ebc5 = <s1>Zurück</s1>Missionsstrang: das Mondsegment
