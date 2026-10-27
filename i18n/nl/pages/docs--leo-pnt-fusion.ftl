# docs--leo-pnt-fusion: translations (nl)

seg-cae10fb9bff8 = Scenario

seg-f63dd3d7aad4 = Bron

seg-587beeccaa11 = Voorinstelling

seg-a6c63abeb7e6 = Meegeleverde scenario's

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Label

seg-9673ca8c2705 = Bron: <c1/>

seg-989faf40651b = Gecombineerde MEO- en LEO-positiebepaling, -navigatie en -tijdsynchronisatie

seg-c14c586a29e7 = Drie scenariosoorten bieden positiebepaling, navigatie en tijdsynchronisatie (PNT) met satellieten in een lage baan om de aarde (LEO), alleen of gecombineerd met de GNSS-systemen (global navigation satellite systems) in een middelhoge baan om de aarde (MEO): <c1/> (positie, snelheid en tijd), <c2/> (precise point positioning) en <c3/> (een niet-terrestrisch 5G-netwerk). Bron: <c4/>.

seg-351652fa0e42 = De engine is <b>systeemonafhankelijk</b>. Elke constellatie bestaat uit Walker-shells, expliciete baanelementen of een GNSS-voorinstelling van het soort <c1/>; elk signaal is een draaggolf, een chipsnelheid en een omhullende van de draaggolf-ruisdichtheid (C/N0); elk foutenbudget is een expliciete eensigma. Benoemde systemen zijn optionele <b>voorinstellingen</b>, elk in één bestand, en elke mogelijkheid, test en meegeleverd scenario draait zonder enig bepaald exemplaar daarvan.

seg-3e7c6608d5c4 = Systemen en voorinstellingen

seg-1031746214ab = Een scenario somt zijn systemen op als tabellen <c1/>. Dit volledige scenario voegt de GPS-basisconstellatie samen met een generieke LEO-laag en draait zoals het er staat (<c2/>; engine { $version } geeft een mediane positie-dilution of precision van { "2.43" } voor GPS alleen en { "1.17" } gecombineerd, en een root-mean-square 3D-fout van { "2.06" } m en { "0.47" } m):

seg-6168fdca9b54 = <c1/> (het Global Positioning System, GPS; of <c2/>, <c3/>, <c4/>) neemt een gepubliceerde GNSS-constellatie over; <c5/> vult aan wat de tabel openlaat uit een LEO-voorinstelling. De C/N0 loopt lineair met de sinus van de elevatie van het masker tot het zenit (een modelleringskeuze: een echte passomhullende hangt af van het zendantennepatroon). De eensigma van de pseudoafstand is de thermische ruis van de delay-lock-loop (DLL) van de engine (<c6/>) bij die C/N0, gecombineerd met de signal-in-space range error (SISRE), tenzij <c7/> haar vastlegt; de eensigma van de afstandssnelheid is de golflengte maal <c8/>. Omdat de sigma een invoer is, kan een afzonderlijk signaalmodel haar leveren zonder dat de positiebepalingscode weet waar ze vandaan komt.

seg-a3f63252bd1b = Wat het bevat

seg-9872e31ebd72 = Bronnen

seg-e20c823f36f3 = X1 op { "1593.3225" } MHz, { "1.023" } Mchip/s, ontvangstvermogen −{ "148.2" } tot −{ "139.1" } dBW; X5 op { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } tot −{ "136.2" } dBW; { "258" } satellieten in { "18" } banen op { "1080" } km, { "53" } en { "97" } graden

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Representatief: de verdeling over de twee inclinaties, de fasering, de afstandsfout

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satellieten, zes bijna-polaire banen op { "780" } km en { "86.4" } graden; bursts op { "1616" } tot { "1626" } MHz, quadrature phase-shift keying (QPSK) met { "25 000" } symbolen/s; ontvangstvermogen { "300" } tot { "2400" } maal het GPS-minimum

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>constellatie</a3>. AFGELEID: het vermogen in dBW. Representatief: draaggolf in het midden van de band, afstandsfout

seg-36771f73c21f = Alleen Doppler: { "11.325" } GHz, baken met { "240" } MHz orthogonal frequency-division multiplexing (OFDM), C/N0 tot { "57.07" } dB-Hz, Dopplerfout { "30" } Hz; eerste shell van { "1584" } satellieten op { "550" } km en { "53" } graden

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim en Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Representatief: fasering, C/N0 aan de horizon

seg-2e13de07f9e9 = Binary phase-shift keying (BPSK) met { "2.046" } Mchip/s nabij L1 en L5; baanbepaling op centimeterniveau

seg-dd94a3839cb3 = PUBLIC: <a1>initial assessment</a1>, <a2>GPS Solutions</a2>. Representatief: draaggolven, vermogen, de hele operationele constellatie

seg-a34d6a186a36 = Een C-bandsysteem in de toewijzing van { "5010" } tot { "5030" } MHz voor de radionavigatiesatellietdienst (RNSS), voor systemen waarvan de parameters niet openbaar zijn

seg-7712896ff69a = PUBLIC: de toewijzing in het <a1>Radioreglement van de International Telecommunication Union (ITU)</a1>. Al het andere is <b>representatief</b>

seg-89ebc32469d9 = Een efemeride-en-klokmodel: efemeride met een polynoom van de zesde graad, verversing elke { "30" } s, klok gestuurd naar GNSS-tijd; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. AFGELEID: de SISRE. Te combineren met elke constellatie via <c1/>

seg-6389c92e07d4 = In-orbit demonstration (IOD) Celeste van het Europees Ruimteagentschap (ESA), één configuratie van een geparametriseerd signaalontwerp

seg-b8bd6e76aeb2 = PUBLIC-baan (<a1>ESA</a1>, <a2>Institute of Navigation (ION) abstract { "16907" }</a2>); WORKSHOP-signaalparameters, gepresenteerd op de LEO-PNT-workshop van het ESA Navigation Innovation and Support Programme (NAVISP), { "2026" }

seg-bd7fb6eb444a = Elk van de workshop afgeleid getal staat in de module <c1/> van <c2/>, gebruikt door <c3/> (<c4/> dwingt af waar ze mogen voorkomen). Hoe de voorinstelling wordt achtergehouden: elk van de workshop afgeleid getal van de engine staat in één bestand, <c5/>, dat <c6/> alleen meecompileert als het bestaat, en in de scenario's <c7/> die alleen in de repository staan. Door dat bestand en die scenario's te verwijderen wordt de voorinstelling achtergehouden zonder bronwijziging; elke andere test, onafhankelijke referentie en elk ander scenario draait zonder haar, en het aantal scenariobestanden in de README telt de achtergehouden bestanden nog steeds mee.

seg-12cdcc633ae0 = Eén soort, vier modi (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> Een ontvanger die de Doppler <c1/> meet bij golflengte <c2/> neemt de afstandssnelheid <c3/> waar, met <c4/> de zichtlijn en <c5/> de klokdrift van de ontvanger. Een batch-Gauss-Newton-fit lost de positie, de drift en optioneel een constante snelheid op, met analytische partiële afgeleiden <c6/>: alleen de satellietsnelheid dwars op de zichtlijn bevat positie-informatie, dus de geometrie is hoe de zichtlijnen tijdens het venster draaien. Het rapport geeft de fout tegenover de vensterlengte, de omhullende van Doppler, Dopplersnelheid en jerk van elk systeem, en een tabel voor één pass. Eén pass bepaalt de gebruiker langs het spoor (het moment van nul-Doppler) en dwars erop (de steilheid van de Dopplercurve); de dwarsspoorfout groeit zonder grens naarmate de pass recht overhead gaat, en het spiegelbeeld aan de andere kant van het grondspoor past bijna even goed (alleen de rotatie van de aarde scheidt ze). Een systeem met alleen Doppler (<c7/>, de voorinstelling <c8/>) draait in deze modus.

seg-007d143c7fb4 = <b>Joint.</b> Per epoch gewogen kleinste kwadraten over de pseudoafstanden van alleen de GNSS-systemen, alleen de LEO-systemen en alle systemen samen, met één ontvangerklok per systeem (de inter-systeembias, ISB, wordt geschat) of een bekende broadcast-offset op de referentietijdschaal. Het rapporteert de geometrische, positie-, horizontale, verticale en tijd-dilution of precision (GDOP, PDOP, HDOP, VDOP, TDOP), de fouten, de geschatte biassen en de DOP tegenover het aantal LEO-satellieten dat aan de GNSS-geometrie is toegevoegd.

seg-22f136a0c96f = <b>Polar.</b> Satellieten in zicht, mediane DOP en beschikbaarheid tegenover de breedtegraad voor MEO-GNSS, LEO en beide.

seg-1034557258d1 = <b>Timing.</b> Op een bekende positie is elke LEO-pseudoafstand een klokmeting. De ontvanger draait een Kalman-filter met twee toestanden (fase, frequentie) waarvan de procesruis de witte en random-walk-frequentieruis van de oscillatorklasse is (de <c1/>- en klokmodellen), houdt de tijd vast tussen passes en zet systeemtijd om naar Coordinated Universal Time (UTC) met de IS-GPS-200-uitdrukking <c2/>; de onzekerheid van de broadcast-offset is een bias per run.

seg-0d76fcc05e7d = Een float-precise-point-positioning-(PPP)-extended-Kalman-filter (EKF) op ionosfeervrije code en fase: statische coördinaten, een witte ontvangerklok, één inter-systeembias per extra systeem, een random-walk-zenit-natte-vertraging en een float-ambiguïteit per satellietboog. De fout van de nauwkeurige baan en klok is gemeenschappelijk voor code en fase van een satelliet, dus elke satelliet is één gecorreleerde update met twee rijen, in een Joseph-gestabiliseerde vorm die de covariantie positief definiet houdt over duizenden fase-updates op millimeterniveau. Metingen worden uit hetzelfde model gesimuleerd, dus de genormaliseerde geschatte kwadratische fout (NEES) van de positie moet een chikwadraatwet met drie vrijheidsgraden volgen; de test controleert dit over Monte Carlo-seeds. Convergentie is de eerste epoch waarna de horizontale en verticale fouten onder de drempelwaarden ({ "10" } cm) blijven tot het einde van de run.

seg-630384148ec7 = Een LEO-satelliet steekt de hemel in ongeveer tien minuten over, een MEO-satelliet beweegt enkele graden, dus LEO-bogen scheiden de ambiguïteiten veel eerder van de positie.

seg-17f9cf9cc24d = Een niet-terrestrische 5G-netwerk-downlink (NTN) in de S-band van de mobiele satellietdienst (MSS), band n256 van het 3rd Generation Partnership Project (3GPP) ({ "2170" } tot { "2200" } MHz). De Cramér-Rao-grens (CRB) voor de aankomsttijd is <c1/>, met <c2/> de root-mean-square-bandbreedte (Gabor) (<c3/> voor een vlak OFDM-spectrum), en voor de frequentie van een toon <c4/>. Het soort vergelijkt kanalen (standaard een New Radio-kanaal van { "5" } MHz en een smalbandkanaal van { "200" } kHz) via downlink-positiebepalingen uit aankomsttijd met een onbekende ontvangerklok en een Doppler-positiebepaling met één satelliet over een pass.

seg-516afd013d38 = Soort, modus

seg-529a5aeea10a = Wat het toont (geseed, deterministisch)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Xona Pulsar X1-laag ({ "258" } satellieten), { "1" } Hz Dopplerruis: 3D-fout { "7.5" } m na tien minuten ({ "26" } satellieten); op één pass is de dwarsspoor-eensigma { "303" } m wanneer de pass bijna overhead gaat ({ "25" } km naast het spoor) tegenover { "43" } m op { "250" } km naast het spoor

seg-da85037a6691 = Signals of opportunity met alleen Doppler, Dopplerfout van { "30" } Hz bij { "10" } Hz: formele horizontale eensigma ongeveer { "10" } m na { "20" } s met { "12" } satellieten en { "6" } m na { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = GPS en Galileo mediane PDOP { "1.47" } en root-mean-square-(RMS)-3D-fout { "1.06" } m; Xona X5 alleen { "1.73" } en { "0.49" } m; gecombineerd { "1.06" } en { "0.41" } m; de LEO-bias van { "40" } ns ({ "11.99" } m) geschat als { "12.06" } m

seg-83378a120e0d = Convergentie { "7.4" } min (alleen MEO-GNSS), { "4.8" }, { "3.2" }, { "2.7" } en { "2.3" } min met { "60" }, { "96" }, { "192" } en { "288" } LEO-satellieten

seg-4aadc3b41822 = Afstandsgrens { "0.26" } tot { "1.03" } m voor { "4.5" } MHz en { "6.5" } tot { "26" } m voor { "180" } kHz; positiebepalingen rond { "2" } m tegenover { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = GPS en Galileo VDOP { "1.20" } op de evenaar, { "1.51" } op { "89.9" } graden; met Iridium { "1.14" } aan de pool

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Iridium-tijdoverdracht over { "6" } uur bij Boulder: { "9.9" } tot { "11.4" } ns RMS bij nominale C/N0 over vier oscillatorklassen, { "15.1" } tot { "25.0" } ns bij { "30" } dB lager

seg-3007f5930dfd = <c1/> (optioneel)

seg-f6ff187a00aa = GNSS aangevuld met de twee IOD-satellieten op de referentietijdschaal (alleen in de repository, achtergehouden met de voorinstelling)

seg-98710204278b = De soorten draaien ook binnen andere scenario's: <c1/> is lid van de sweep <c2/> en van de campagnes <c3/>, <c4/>, <c5/> en <c6/>; <c7/> van de sweep <c8/>; <c9/> van de sweep <c10/>; en <c11/> en <c12/> zijn de fase voor de gecombineerde positiebepaling en de PPP-fase van het soort <c13/>. Hun resultaten staan op <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Gepubliceerde cijfers en labels

seg-8980b5ae869b = Cijfer

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Iridium-Doppler tot ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, het maximum over een dag aan passes, binnen { "5" }%

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Xona Pulsar X1 maximale Doppler { "32" } tot { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz uit één satelliet van elke gepubliceerde shell ({ "1080" } km, { "53" } en { "97" } graden), binnen het interval zonder verbreding; de shell van { "53" } graden alleen piekt op { "31.8" } kHz, omdat de rotatie van de aarde een prograde baan ten opzichte van de grond vertraagt

seg-e12713d5019f = VALIDATED (dezelfde test)

seg-370ca62e7fc7 = Xona Pulsar X1 jerk ±{ "1.26" } Hz/s²

seg-4de9b0895288 = ongeveer { "1.0" } Hz/s² op een pass recht overhead

seg-5019322f4669 = gerapporteerd, niet getoetst aan een onafhankelijke externe referentie

seg-7fcb83027ff4 = PPP-convergentie { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min met 60/96/192/288 LEO

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotoon

seg-0a1133c16dce = MODELLED consistentie van de trend (constellaties, ruis en stations niet nagebootst)

seg-7c5292729f36 = Starlink ongeveer { "2" } m in { "20" } s met drie satellieten

seg-6a54a7c58ade = Kozhaya, Saroufim en Kassas { "2025" }

seg-13fc5fc4f69f = formele horizontale eensigma ongeveer { "10" } m na { "20" } s met { "12" } satellieten, met een perfecte efemeride en elke fout in een Doppler-sigma van { "30" } Hz bij { "10" } Hz

seg-4fc80a02ed6c = MODELLED vergelijking (ontvanger en meetfrequentie niet nagebootst)

seg-5d0ae24eb74c = Iridium-tijdsynchronisatie binnen { "40" } ns van UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = ongeveer { "10" } ns RMS gemodelleerd

seg-9025f3c376c5 = MODELLED vergelijking

seg-4434b0ff1caa = Al het andere is MODELLED, met de motivering in de verificatiematrix (<c1/>): de DOP is gecontroleerd aan een met de hand afgeleid geval met vier satellieten, de positiebepalingen aan hun covariantie, het Dopplermodel aan de identiteit van de afstandsversnelling, het PPP-filter aan de chikwadraat-NEES-band en de grenzen aan kwadratuur.

seg-aa5482ac34ff = Beperkingen, duidelijk vermeld

seg-0b4564367dcd = Tweelichamenbanen met de seculaire drift door J2, de tweede zonale harmonische van de aarde; geen passingsfout van de broadcast-efemeride buiten de SISRE-eensigma, geen satellietantennepatroon.

seg-b51ccfee4ab8 = Geen ionosferische of troposferische vertraging in <c1/> (het PPP-filter bevat een toestand voor de natte vertraging; zijn ionosfeervrije combinatie verwijdert de ionosfeer van de eerste orde), geen scintillatie, multipath, cycle slips of oplossing van geheeltallige ambiguïteit.

seg-a719ccac19c0 = De NTN-nauwkeurigheid is een grens, geen bereikt resultaat.

seg-19ba6cc0ca75 = Waarden van voorinstellingen die als representatief zijn gemarkeerd, zijn illustratief en beschrijven het ontwerp van geen enkele operator.

seg-f9f335d67ff8 = <s1>Vorige</s1>LEO-navigatiebericht

seg-062138bbb73c = <s1>Volgende</s1>Constellatieontwerp
