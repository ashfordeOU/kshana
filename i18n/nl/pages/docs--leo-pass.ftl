# docs--leo-pass: translations (nl)

seg-cae10fb9bff8 = Scenario

seg-cbf0f9bcd2d8 = Onafhankelijke referentie

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Bron

seg-587beeccaa11 = Voorinstelling

seg-1ff32b87e030 = Satellieten

seg-a6c63abeb7e6 = Meegeleverde scenario's

seg-60cd077d82a7 = Model

seg-2b0d77219437 = Voorinstellingen

seg-5566e1d71a4f = Baan

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Label

seg-813d372bda81 = Bron: <c1/>

seg-0bd4af67ffdb = LEO-pass en linkbudget (<c1/>)

seg-30417c63c48e = LEO-PNT is positiebepaling, navigatie en tijdsynchronisatie (PNT) vanaf satellieten in een lage baan om de aarde (LEO). Het soort <c1/> simuleert een of meer LEO-satellietpasses boven een gebruiker en berekent het linkbudget band voor band, naast de GNSS-satellieten (global navigation satellite system) in een middelhoge baan om de aarde (MEO) die in zicht zijn. De engine is <b>systeemonafhankelijk</b>: elke constellatie, elk signaalontwerp en elke band, rechtstreeks in een scenario opgeschreven. Benoemde systemen zijn optionele voorinstellingen, elk in een eigen bestand met zijn bron.

seg-242c84daecb0 = Code: <a1><c1/></a1> (het soort) en <a2><c2/></a2> (openbare bouwstenen die andere modules kunnen aanroepen).

seg-0e6b09e372f5 = Scenario's: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> en het optionele <c8/> (resultaten in <a1>Meegeleverde scenario's</a1>). Het soort is ook lid van de campagnes <c9/>, <c10/>, <c11/> en van elk scenario <c12/>, en de passfase van het soort <c13/>.

seg-59cebed2f589 = Overzicht van elk LEO-PNT-soort en -scenario: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Onafhankelijke referenties: <a1><c1/></a1>, testgegevens in <c2/> met hun bron-URL's.

seg-c1020ac47091 = Wat één run berekent

seg-10dedc607eac = Voor elke LEO-satelliet, band en epoch:

seg-35bf9a48e566 = Term

seg-b0f12ee05fe9 = Elevatie, azimut, afstand

seg-24ad909c4fb8 = WGS-84 (World Geodetic System { "1984" }) gebruiker, satelliet in een inertiaalstelsel dat op het moment van de epoch samenvalt met het aardvaste stelsel

seg-c9f61c3348ef = berekend

seg-ebd800ec3d47 = Afstandssnelheid <c1/>, afstandsversnelling <c2/>

seg-232b42b71f03 = gesloten vorm; elke run controleert beide aan centrale verschillen van de gepropageerde afstand en rapporteert het grootste verschil

seg-b3a55e868346 = gesloten vorm

seg-3f1f90a57c2f = Doppler <c1/>, Dopplersnelheid <c2/>

seg-852b6c351ce4 = eerste orde, per band

seg-4eb4b779679b = Vrije-ruimteverlies

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = EIRP van de satelliet (equivalent isotropically radiated power) en patroon

seg-883702244778 = isoflux tot een randelevatie, gaussiaanse hoofdlob <c1/> dB, of vlak

seg-b6e91c5252d3 = Gebruikersantenne

seg-ed92a0abf62f = patch <c1/> dBic, halfbolvormig of isotroop

seg-0ac54d232e0a = Gasdemping

seg-30fb5b0a0bc7 = Vereenvoudigde uitdrukkingen uit ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 bijlage { "2" } (vervangen door P.676-13, waarvan de engine de getabelleerde coëfficiënten niet bevat)

seg-58d58478e9eb = Regendemping

seg-4c1e413d5fc3 = Coëfficiënten van ITU-R P.838-3 en de procedure van P.618-14 § { "2.2.1.1" }, uit een regenintensiteit R0.01 en een regenhoogte

seg-dab78c0552b6 = Troposferische scintillatie

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; onder { "4" } GHz een extrapolatie, in het rapport gemarkeerd

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Gebouwpenetratieverlies (gebruiker binnen)

seg-ef9025622e81 = ITU-R P.2109-2, traditioneel of thermisch efficiënt, op de elevatie van het pad bij de gevel

seg-c7d1bccd4d51 = Polarisatieverschil

seg-f4aaea269382 = polarisatieverliesfactor uit axiale verhoudingen en draaizin, gemiddeld over de oriëntatie van de ellips

seg-96601850a9d5 = Systeemruistemperatuur

seg-82735c7f3ea5 = antennevloer + hemelemissie van het absorberende pad ({ "275" } K) + kosmische { "2.7" } K + ontvanger <c1/>

seg-53ce973b0ee7 = C/N0 (draaggolf-ruisdichtheid)

seg-fa01d060cf1a = Ionosferische groepsvertraging

seg-33f2113dea70 = <c1/>, STEC (slant total electron content) uit het Klobuchar-model of een verticale total electron content (TEC), geschaald met het deel van een Chapman-laag onder de satelliet

seg-431dfeb5edba = schaling VALIDATED, TEC MODELLED

seg-56df31449434 = Per bandpaar: de ionosfeervrije coëfficiënten, de ruisversterking <c1/> en de thermische coderuis van elke band en van de combinatie op de piek van de pass. De MEO-GNSS-vergelijking gebruikt dezelfde gebruikersantenne en ontvanger, met per signaal het minimale ontvangstvermogen uit het interfacedocument (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Issue { "2.1" } Tabel { "12" }; GPS uit IS-GPS-200 en IS-GPS-705), plus een vermelde overmaat, geschaald met de afstand. De optionele sectie <c2/> (Internet of Things) geeft de tijd tot de eerste positiebepaling, de energie per positiebepaling en de batterijduur tegenover de duty cycle voor een vermeld vermogensbudget van de ontvanger (MODELLED, elke aanname is een invoer en staat in het rapport).

seg-7132ede02109 = <c1/> (standaard): een cirkelvormige baan die zo is geplaatst dat de gebruiker één pass ziet met een gekozen maximale elevatie op een gekozen tijdstip, oplopend of aflopend, oost of west van de gebruiker; de inclinatie kan zonsynchroon zijn.

seg-688307acbf0d = <c1/>: expliciete Kepler-elementen.

seg-e9085739bcb8 = <c1/>: een two-line element set (TLE) via de Simplified General Perturbations { "4" }-propagator (SGP4) van de engine.

seg-7dcc5fdbc249 = <c1/>: een Walker-constellatie, opgebouwd door de code <c2/> (haar <c3/> of de shells van de voorinstelling); de hoogste passes in het venster worden gerapporteerd.

seg-ec7e163dd073 = Banden en signaalontwerpen

seg-4d49743b3544 = Banden: <c1/> met een optionele deelverzameling <c2/>, en items <c3/> die een band toevoegen of een willekeurig veld van een voorinstellingsband overschrijven. <c4/> met alleen items <c5/> gebruikt helemaal geen voorinstelling.

seg-bd1e114aaea6 = Een band kan ook een ontwerp <c1/> noemen (<c2/>, elk ontwerp onder <c3/>, of een ontwerp dat het soort <c4/> aanlevert; zie <a1>LEO-SIGNAL.md</a1>). De band neemt dan de middenfrequentie van het ontwerp over (tenzij <c5/> is opgegeven), de zendbandbreedte en de chipsnelheid van de gevolgde component, verdeelt haar EIRP over de componenten van het ontwerp naar hun vermogensaandeel, en rapporteert op elke epoch de C/N0 van de gevolgde component en haar bandbegrensde early-late-codevolgjitter (Betz en Kolodziejski { "2009" }, de formule van het soort <c6/>) als de afstandsmeetfout.

seg-1d96501bb12d = Elke voorinstelling markeert haar getallen als PUBLIC (met URL), REPRESENTATIVE (een gedocumenteerde ontwerpkeuze, nooit een bewering over een echt systeem) of WORKSHOP.

seg-f708914fed48 = Banden

seg-6459abcaeebe = <c1/> (standaard)

seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- en C-draaggolven uit openbare documenten

seg-cd0075385395 = UHF { "450" } MHz (representatief), L { "1191.795" } MHz (centrum van Galileo E5), S { "2492.028" } MHz (NavIC S, de S-banddraaggolf van Navigation with Indian Constellation), C { "5020" } MHz (centrum van de toewijzing van { "5010" }–{ "5030" } MHz voor RNSS (radionavigatiesatellietdienst)), elk { "0" } dBW

seg-3f0de4312fcb = { "550" } km zonsynchroon, Walker 240/12/1

seg-486f17197d4d = REPRESENTATIVE, voor C-bandsystemen waarvan de parameters niet openbaar zijn (bijvoorbeeld TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binary phase-shift keying met { "10" } × { "1.023" } Mchip/s), isoflux

seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tabellen { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP uit het gepubliceerde minimale ontvangstvermogen bij { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) en { "97" }° ({ "66" })

seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> en de gepubliceerde baan

seg-c995dade5aa6 = Satellite Time and Location (STL) op { "1621" } MHz (midden van { "1616" }–{ "1626" } MHz); EIRP uit "{ "300" } maal GPS"

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } in { "6" } banen

seg-ad0ba129439b = PUBLIC-signaalcijfers (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE baan en EIRP

seg-1931203a036c = Ku-baken van { "240" } MHz, alleen Doppler

seg-0533710bbbe1 = PUBLIC-signaalstructuur (<a1>PMC10301026</a1>), REPRESENTATIVE baan en EIRP

seg-cee286338f01 = BPSK { "2.046" } Mchip/s nabij L1 en L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (optioneel)

seg-800f173f2b20 = WORKSHOP-signaalparameters, PUBLIC baan

seg-e8626249e708 = zeven banden van configuratie #1

seg-cb29553176c7 = { "510" } km zonsynchroon

seg-10f79909a5bc = <b>De voorinstelling Celeste IOD (in-orbit demonstration) is optioneel.</b> De signaalparameters ervan zijn gepresenteerd op de LEO-PNT-workshop van het Navigation Innovation and Support Programme (NAVISP) van het Europees Ruimteagentschap (ESA), { "2026" }, en hebben nog geen openbare bron; ze staan in de module <c1/> van <c2/>, gebruikt door <c3/>. Hoe de voorinstelling wordt achtergehouden: elk van de workshop afgeleid getal van de engine staat in één bestand, <c4/>, dat <c5/> alleen meecompileert als het bestaat, en in de scenario's <c6/> die alleen in de repository staan. Door dat bestand en die scenario's te verwijderen wordt de voorinstelling achtergehouden zonder bronwijziging; elke andere test, onafhankelijke referentie en elk ander scenario draait zonder haar, en het aantal scenariobestanden in de README telt de achtergehouden bestanden nog steeds mee. Haar EIRP en bundel zijn gekalibreerd op een C/N0-verloop dat op de workshop is getoond, zodat dat scenario het verloop per constructie reproduceert.

seg-9f9ff4fe18f8 = Het "zero-clock"-polynoom van ATOMIC als broadcast-efemeridemodel is een voorinstelling voor navigatieberichten en maakt geen deel uit van dit soort.

seg-dc496b16046b = De waarneming LEO tegenover GNSS

seg-6be559b1ac29 = <c1/> reproduceert kwalitatief wat LEO-PNT-demonstraties laten zien: de LEO-C/N0 stijgt en daalt in een belvormig verloop dat { "590" } s boven het masker blijft en piekt op { "56.8" } dB-Hz, { "8.9" } dB boven de mediaan van de vlakke MEO-GNSS-draaggolven (Galileo E1, { "40.5" } tot { "52.0" } dB-Hz, mediaan { "47.8" } dB-Hz). De marge komt van de afstand, niet van een sterkere zender: op de piek van de pass staat de satelliet { "569" } km weg, ongeveer { "40" } keer dichter dan een Galileo-satelliet in het zenit ({ "23 222" } km), wat { "32" } dB minder vrije-ruimteverlies is; de generieke voorinstelling straalt { "0" } dBW ({ "1" } W) uit.

seg-08debab7c94a = Elke rij is één run van <c1/> (engine { $version }):

seg-9a60f0bf803e = Opzet

seg-fde146239f5d = Resultaat van één run

seg-41455a3f15b6 = <c1/> L-band, { "550" } km, pass van { "80" }° boven München

seg-9d5c154eceb1 = L-piek { "56.8" } dB-Hz, mediaan { "42.2" } dB-Hz; Galileo E1-mediaan { "47.8" } dB-Hz

seg-9423b1184fb0 = <c1/>, een ontworpen pass van { "70" }° en vier satellieten in hellende shells, maritieme gebruiker

seg-63bf0b8f7f3a = X1-piek { "65.6" } dB-Hz en X5 { "68.9" } dB-Hz op de ontworpen pass; grootste X1-Doppler { "31.4" } kHz

seg-8a3383072765 = <c1/>, pass van { "65" }°, gebruiker in de lucht

seg-d2fea8542638 = STL-piek { "80.5" } dB-Hz, { "34.3" } dB boven de GPS L1-mediaan; grootste Doppler { "35.4" } kHz

seg-d837a8a7648b = <c1/>, gebruiker binnenshuis in Rome (traditioneel gebouw)

seg-4fbead0588d2 = piek UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; Galileo E1-mediaan { "22.4" } dB-Hz

seg-954e16842d59 = <c1/> UHF en L met de sectie <c2/>

seg-9aa81f6f4929 = warme start { "0.90" } s en { "18.0" } mJ op elk signaal; koude start UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

seg-97476f9d4212 = <c1/>, vier banden, pass van { "70" }° boven Tromsø

seg-fd1463da9965 = zie <a1>Ionosfeerbepaling</a1>

seg-1ad5bde12b4f = { "16" } satellieten van een generieke laag op { "1080" } km, L en C, een sprong van { "30" } m

seg-25cf36cf0de3 = zie <a1>Spoofingmonitors</a1>

seg-6cdf9830433e = <c1/> schrijft ook de interactieve speler (<c2/>, de epochs van de pass) en de efemeridebestanden CZML (de Cesium Language), KML (Keyhole Markup Language), GeoJSON en STK (Systems Tool Kit) van de passgeometrie (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

seg-d3a0fc36329a = Ionosfeerbepaling

seg-1e64715af2ff = Elk bandpaar geeft ook de schuine TEC die zijn geometrievrije codecombinatie op de piek van de pass terugvindt, <c1/>, en de 1-sigma van die schatting uit de coderuis van de twee banden op de piek (<c2/>, <c3/>). De schatting is per constructie gelijk aan de schuine TEC van het model: de combinatie is exact in de eerste orde. De sigma bepaalt of een bandplan een betere of slechtere sounder is: <c4/> (vier banden boven Tromsø) vindt uit elk paar { "18.85" } TEC-eenheden terug, met een 1-sigma van { "0.017" } TEC-eenheden voor UHF met L en { "2.9" } voor S met C. Alleen thermische coderuis; geen multipath of interfrequentiebias. MODELLED.

seg-8f59acefb2b3 = Spoofingmonitors (<c1/>)

seg-91941393400a = De optionele sectie <c1/> vervalst de signalen die een ontvanger op een geclaimde positie zou zien. Vanaf <c2/> springt de geclaimde positie met <c3/> en beweegt daarna horizontaal met <c4/> naar <c5/>; de vervalste afstand en afstandssnelheid zijn precies die van de geclaimde positie, op de LEO-banden die in <c6/> worden genoemd (standaard alle) en op het MEO-GNSS-signaal tenzij <c7/>. <c8/> bepaalt of de vervalste pseudoafstanden de ionosferische vertraging bevatten (die van een zender op de grond niet).

seg-845f6840d92d = De ontvanger draait twee monitors (<a1><c1/></a1>), elk met een vermelde kans op een vals alarm per epoch (<c2/>, standaard { "1e-5" }), en meldt detectie op de eerste epoch waarop haar detectiekans <c3/> bereikt (standaard { "0.999" }). Detectiekansen zijn exact voor de vermelde gaussiaanse ruis, berekend op het ruisvrije gemiddelde residu; er wordt geen ruis getrokken.

seg-cc38b40eb7a5 = Monitor

seg-8b34ac584c3d = Statistiek

seg-7b158594c4d9 = Wat hij ziet

seg-89756d80bc29 = Doppler- en passgeometrieconsistentie

seg-2174c7725e48 = gemeten afstandssnelheden tegenover die voorspeld uit de banen en een onafhankelijke a-priori-positie en -snelheid (<c1/>, <c2/>); een gegeneraliseerde kleinste-kwadraten-chikwadraat over een venster van <c3/> (standaard één stap), waarbij de klokdrift een hinderparameter is (of gegeven <c4/>); ruis van de frequentievergrendelingslus uit C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), op de GNSS-kanalen, de LEO-kanalen en alle kanalen

seg-14eab06a47d5 = een positiefout <c1/> verschuift een afstandssnelheid met <c2/>, <c3/>: de dwarssnelheid van een LEO-satelliet gedeeld door zijn afstand is ongeveer { "25" } keer die van een MEO-satelliet, zodat dezelfde fout in de LEO-Doppler ongeveer { "25" } keer groter is

seg-390ac49b3c09 = Consistentie tussen banden

seg-986d501c2b01 = de stap van epoch tot epoch van de geometrievrije pseudoafstandscombinatie van elk LEO-bandpaar, met het ionosfeermodel van de ontvanger eruit gehaald, tegenover <c1/> coderuis en een getolereerde ongemodelleerde ionosferische veranderingssnelheid (<c2/>)

seg-389187df55d7 = een spoofer die sommige banden wel en andere niet vervalst, of elke band zonder de ionosfeer, bij zijn start; geen spoofer die elke band vervalst en de ionosfeer simuleert

seg-4dd44d7fa566 = <c1/>: een sprong van { "30" } m op een opgemeten locatie in Frankfurt verandert de GNSS-afstandssnelheden met ongeveer { "4" } mm/s en de LEO-snelheden met ongeveer { "10" } cm/s (mediane gradiënten { "1.4e-4" } en { "3.5e-3" } per seconde). De test met alleen GNSS detecteert dit nooit (grootste niet-centraliteit { "0.06" }); de test op alle kanalen detecteert het { "105" } s na de start. <c2/> draait vier spoofers tegen beide monitors.

seg-1b64098e01f3 = Beperkingen, in elk resultaat vermeld: de spoofer is een geïdealiseerde, zelfconsistente positieduw die zijn eigen pad compenseert (geen signatuur in vermogen, aankomsthoek of correlatiepiek); de a-priori-positie is onafhankelijk van de gespoofde positiebepalingen; het ionosfeermodel van de ontvanger is dat van de engine, zodat het authentieke residu tussen banden gemiddeld nul is. MODELLED (twee rijen in <a1>VERIFICATION-MATRIX.md</a1>).

seg-edb7b16b6c0e = Validatie

seg-051b8cd1849d = Test

seg-609c537a9dfd = ITU-R P.838-3 tabel { "5" }, { "115" } frequenties

seg-5bf24bec38f2 = elke coëfficiënt binnen { "0.6" } van zijn laatst gedrukte cijfer (slechtst waargenomen { "0.51" })

seg-86204b023d44 = Validatievoorbeelden van ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 regen

seg-13180d4097d1 = { "56" } gevallen binnen { "1e-4" } dB (waargenomen { "5e-6" } dB)

seg-84161e5f97f8 = Dezelfde voorbeelden, P.618-14 scintillatie

seg-0a4305c867ff = { "42" } gevallen binnen { "1e-5" } dB

seg-054f8dbe2792 = Werkmap Clutter en BEL van ITU-R Study Group { "3" }, P.2109

seg-8ae2eeed4be4 = { "568" } waarden binnen { "0.001" } dB

seg-6df2eded9f19 = IS-GPS-200 groepsvertragingsverhouding <c1/>

seg-d0b293230f91 = tot { "1e-12" }; versterking L1/L2 en L1/L5 { "2.978" } en { "2.588" }

seg-f9a0e24c00a7 = Friis-vorm kilometer–megahertz

seg-4e94a67f40f6 = tot { "1e-4" } dB

seg-ee59b4c520eb = arXiv { "2509.19551" } tabel { "1" } (Pulsar in-orbit validation (IOV), full operational capability (FOC) polair, FOC hellend, GPS)

seg-345998ca457c = { "20" } snelheden en Dopplermaxima binnen { "0.05" } %

seg-30e34076f4a7 = De onafhankelijke referenties voor regen en scintillatie nemen de regenhoogte en de natte refractiviteit over zoals de validatievoorbeelden ze geven: de engine bevat noch de kaart van ITU-R P.839 noch die van P.453.

seg-d2d1075a0b67 = EIRP's en patronen zijn gepubliceerde ontvangstvermogens omgerekend naar een EIRP, of representatieve keuzes; het gemeten patroon van geen enkele satelliet wordt gebruikt en geen enkele LEO-C/N0 wordt met een meting vergeleken.

seg-915a9564608d = De gasterm is de vervangen vereenvoudigde methode P.676-10; onder { "1" } GHz is het de waarde bij { "1" } GHz geschaald met f², en regen wordt daar als nul genomen.

seg-cdd9faf5b61d = Het deel van de TEC onder een LEO-satelliet komt uit één Chapman-laag (geen plasmasfeer), te overschrijven met een vermeld deel.

seg-4b72218497e7 = De ontworpen pass- en Walker-banen zijn tweelichamenbanen met een optionele seculaire J2 (de tweede zonale harmonische van de aarde); het TLE-pad gebruikt SGP4. De eigen versnelling van de gebruiker blijft buiten de Dopplersnelheid in gesloten vorm (de numerieke controle rapporteert wat dat voor een bewegende gebruiker kost).

seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } kent geen LEO-navigatierecords; elke RINEX-achtige LEO-export hoort bij de code voor navigatieberichten en is een gedocumenteerde Kshana-extensie (eerder werk: arXiv { "2401.17767" }).

seg-593081243d8c = <s1>Vorige</s1>LEO-signaalontwerpen

seg-468e70f9a669 = <s1>Volgende</s1>LEO-navigatiebericht

seg-072d0d8f618c = Spoofingmonitors ([spoofer])
