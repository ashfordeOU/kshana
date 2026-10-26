# docs--capability-reference: translations (nl)

seg-aab745a65e76 = Module

seg-65d239fc4894 = Maanreferentiestelsel-datum uit echte laserafstandsmetingen

seg-c92dd319fa36 = { "337" } ILRS-normaalpunten · mediaan { "5.13" } mm

seg-2f7f950518be = Vervangt de gesimuleerde campagne door echte gegevens: { "337" } gearchiveerde ILRS-normaalpunten van maanlaserafstandsmetingen over vijf retroreflectorarrays, waarbij elke waarneming wordt gewogen met haar eigen, in het bestand vastgelegde precisie. De reflectorcoördinaten zijn een DE440-catalogus in hoofdassen, bewaard onder een eigen bestandsnaam, gescheiden van de DE430-tabel van het gemiddelde-aardesysteem: wie de een met de rotatie van de ander voedt, verplaatst een reflector over honderden meters zonder dat iets protesteert, omdat beide goedgevormde coördinaten zijn.

seg-2db69c58f694 = Differentiële PNT op de maan

seg-32adcb9b1b02 = Exacte gemeenschappelijke-modusidentiteit · gemodelleerde decorrelatie

seg-d4ac8cbac83e = Differentiële correcties tussen een referentiestation op de maan en een gebruiker. De opheffing van de gemeenschappelijke modus is een exacte identiteit; het residu van de ruimtelijke decorrelatie is een eerste-orde geometrisch model dat met de basislijn groeit, en het residubudget van de correctieverbinding wordt ernaast gerapporteerd, zodat de beperkende term zichtbaar blijft in plaats van in één getal op te gaan.

seg-9b83e78dcd7b = Tijdschalen op de maan en geodetische VLBI

seg-bcd769beab07 = Crossovertabel per klokklasse

seg-80107b7841bf = Crossovertijden per klokklasse voor een maantijdschaal — wanneer elke oscillatorklasse zonder update niet meer aan een gestelde grens voldoet — samen met een geodetische VLBI-observabele op de maan en de Fisher-informatie die deze aan het datum bijdraagt.

seg-99084680c321 = Echte, opgehaalde constellatiegeometrie van de maan

seg-a7be7d68e767 = { "5" } vastgelegde fixtures, elk opnieuw te genereren uit de vastgelegde bron

seg-d3591b4b4633 = Het servicevolume draait op gepubliceerde constellatieontwerpen in plaats van op een illustratieve: de referentieset van vijf satellieten voor de LANS-interoperabiliteitsdemonstratie, de LNCSS-casestudies met { "8" }, { "12" } en { "16" } satellieten, en de vier ruimtevaartuigen die op 2023-01-01 daadwerkelijk in een maanbaan waren, uit JPL Horizons. Elk bestand vermeldt zijn eigen referentiestelsel en zijn eigen herkomstklasse, een horizon voorbij het einde van een getabelleerde efemeride wordt geweigerd in plaats van geëxtrapoleerd, en het illustratieve Keplerresultaat wordt naast het opgehaalde resultaat gegeven, samen met het verschil ertussen, en vervangt dat nooit.

seg-807b9fc7b517 = Ontkenningscontour op de maan uit een gemeten C/N₀-spreiding

seg-a908030a9fcc = Afstand { "49.2" } km volgens de vermogensverhouding tegenover { "19.4" } km volgens verlies van vergrendeling

seg-3ee440e8b619 = Jammer-tot-signaalverhouding per satelliet over echte schuine afstanden op de maan, waarbij de kant van het gewenste signaal als verdeling wordt bewaard in plaats van tot een mediaan samengevouwen, zodat de ontkenningscontour de onzekerheidsband draagt die de relaygeometrie werkelijk oplevert. Twee criteria worden naast elkaar gerapporteerd: de drempel voor de vermogensverhouding, en het verlies van vergrendeling, berekend uit de dynamica van de volglus. De orbitale vangstvoetafdruk wordt doorgerekend over zenderhoogte en bundelbreedte, en waar het raster nooit de vangst aan de rand bereikt, zegt het rapport dat en drukt het het tekort af.

seg-229134190045 = VLBI-schema naar covariantie van stationscoördinaten

seg-547181855481 = Rang { "6" }, defect { "0" }; defect van het vrije netwerk { "1" }, benoemd als een gemeenschappelijke translatie

seg-6d147beefb43 = Accumuleert de partiële afgeleiden van de VLBI-vertraging op de maan tot een Fisher-informatiematrix over een schema van basislijnen per epoche en geeft de covariantie van de stationscoördinaten terug, zodat de stap van vertragingsprecisie naar coördinatensigma wordt geschat in plaats van aangenomen. Het vrije netwerk wordt naast het netwerk met vastgelegd datum gerapporteerd, met zijn rangdefect en de niet-waarneembare richting benoemd. De covariantie van het oppervlaktepunt wordt gescheiden gehouden van die van het aardstation, omdat de partiële afgeleide van het nabijveldbaken een verschil is van twee eenheidsvectoren van stations en zich niet gedraagt als het verreveldgeval.

seg-028833cc45bc = Radiometrische navigatie en relay-PNT

seg-6c94ae122721 = PNT in de diepe ruimte en op Mars

seg-ef21cd4b1962 = Door simulatie getoetst (covariantie- en closed-loop-kwaliteitsmaten, geen gecertificeerde beschermingsniveaus); de zonscentrische Marsdynamica is gecontroleerd tegen JPL DE440 tot op { "137" } m @ een boog van 1 dag; Mars-LMO OD ≈ { "0.2" } m.

seg-469988966702 = Een open radiometrische navigatie-engine voor de diepe ruimte en Mars: iteratieve lichttijd + Shapiro-vertraging, twee-/een-/drieweg-Doppler en afstand (Moyer, twee benen), coherente transponderomkering, regeneratieve/PN-afstandsmeting en Δ-DOR; CCSDS-TDM-I/O; een reduced-dynamic Square-Root Information Filter (empirische versnellingen + boordklok + Marsweerstand) dat baanbepaling rond Mars in een lage Mars-baan (LMO) uitvoert in een synthetische gesloten lus; fusie van eenweg en tweeweg; en een MARCONI-constellatie van areostationaire relays met een end-to-end GSE-prestatiesimulator.

seg-b4284bd2629e = Optische en RF-overdracht met integriteit over meerdere modaliteiten

seg-ae131bc1ba67 = Optische / RF-PNT

seg-1b25468c9780 = Minimaal detecteerbare bias { "8.20" } m horizontaal, { "12.30" } m verticaal, { "24.6" } ns tijdsynchronisatie

seg-a5387333ab2d = Foutinjectie geeft de monitor over meerdere modaliteiten een detectievermogen in plaats van een foutvrije doorgang: een minimaal detecteerbare bias per as bij een vastgelegd budget voor valse alarmen en gemiste detecties. Na een overdracht wordt de hergroei van de covariantie doorgerekend tegen de alarmgrenzen, zodat het rapport aangeeft hoe lang de oplossing met één modaliteit daarbinnen blijft, en niet alleen dat de overdracht continu was. De optische en RF-afstandsmetende schakels worden alleen vergeleken bij gelijke accumulatietijd en gelijk pad, en het rapport weigert een verhouding te vormen ten opzichte van een waarde die gekozen is in plaats van gemeten.

seg-00cb9df27979 = Autonome integriteit van de ontvanger (ARAIM)

seg-f86ecc2fda8e = MHSS op een echte GPS- en Galileo-momentopname · DO-316 met twee constellaties

seg-841a6f3f0277 = Momentopname-RAIM en RAIM met oplossingsscheiding, met horizontale en verticale beschermingsniveaus (HPL/VPL), foutdetectie en -uitsluiting, en Stanford-integriteitsdiagrammen — plus een expliciet beschermingsniveau op basis van een integriteitsrisicobudget (MHSS) met de foutmodus voor de gehele constellatie bij twee of meer constellaties (EU-ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM tegenover gepubliceerde referentievectoren

seg-08f9dd480ba7 = Grootste fout { "0.044" } m tegenover de eigen tolerantie van { "0.05" } m van de bronnen

seg-68185dd65478 = De MHSS-beschermingsniveaus van de engine worden uitgevoerd tegen de eigen gepubliceerde uitgewerkte voorbeelden van het referentie-algoritme voor luchtvaartuigen van EU-U.S. Working Group C, elk overgenomen met zijn ophaal-URL, datum, pagina en SHA-256 van het bestand en op twee plaatsen bewaard, waarvan een test controleert dat ze overeenkomen. De acceptatievector is het intern consistente Reference Airborne Algorithm Description Document v3.1, Appendix D. Het rapport van Milestone { "3" } bevat twee interne gebreken — een tekenfout in de geometrie, en een vermenigvuldiger voor valse alarmen die bij { "57" } foutmodi is geëvalueerd terwijl de tekst er één vermeldt — dus de beschermingsniveaus ervan worden gerapporteerd als gemeten afwijkingen in plaats van beoordeeld, en de gebreken worden aangetoond door de eigen getallen van het document door te rekenen.

seg-17b28b3cf1fa = SBAS-/WAAS-beschermingsniveaus en dubbele frequentie

seg-99766b79a00a = Augmentatie (SBAS)

seg-4cfec990b19b = DO-229E K-factoren · L1/L5 ionosfeervrij

seg-ef3a5513bbd8 = SBAS-/WAAS-beschermingsniveaus in de gewogen-kleinste-kwadratenvorm van DO-229E (K-factoren voor precisienadering en en-route) en de ionosfeervrije combinatie met dubbele frequentie L1/L5 (IS-GPS-705) die DO-316 ondersteunt, met de geometrie van het beschermingsniveau gecontroleerd tegen een referentie-implementatie van lineaire algebra.

seg-0a5bd5230c32 = Holdover, stabiliteit en overdracht van tijd en frequentie

seg-69a0269c4732 = Klok en tijdsynchronisatie

seg-641ae762b453 = gekalibreerd op datasheets van klokken · holdover gecontroleerd tegen de van-Loan-covariantierecursie

seg-6f1c2e1f0bf4 = Holdover met een Kalmanfilter met twee toestanden, stabiliteit uit de Allan-familie (ADEV / MDEV / TDEV / HDEV) met betrouwbaarheidsintervallen en een volledige machtswetfit met vijf coëfficiënten volgens IEEE-1139, en de operationele overdrachtsmethoden — TWSTFT met de gesloten Sagnac-vorm van het BIPM, GNSS common-view, ionosfeervrije PPP-overdracht, een optische vrije-ruimteverbinding met turbulentiescintillatie, en een tijdschaal van een klokensemble met inverse-variantiegewichten. Een rekenmodule voor klok-holdover zonder GNSS inverteert de groei van de van-Loan-uitloopfout tot een holdover-tot-drempel — hoe lang een klok vrij loopt voordat haar tijdfout het budget overschrijdt — voor klassieke en kwantumklokklassen; gemodelleerd, en eerlijk over het feit dat voor een zeer stabiele klok de holdover tot een strakke drempel wordt bepaald door de aangenomen ruisvloer bij lange tau, niet door de aangehaalde ADEV.

seg-85b181275293 = Pseudoafstand, ionosfeer en troposfeer

seg-835df2d05f2a = GNSS-meetdomein

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell eenheid in het zenit · Klobuchar volgens IS-GPS-200

seg-43c0372fe6e7 = Voorwaartse synthese van pseudoafstand en Doppler met een Klobuchar-ionosfeer (uitgezonden) en een IONEX-/TEC-rasterionosfeer (gemeten) — inclusief een IONEX-bestandsparser, tijdinterpolatie en de afbeelding van schuine obliquiteit met een dunne schil — Saastamoinen- en Niell-troposfeer, en momentopname-RAIM.

seg-3458cb02f156 = Positiebepaling met één punt (PVT)

seg-640e4cd9f008 = GNSS-positiebepaling

seg-4fa43feda96a = Getoetst aan echte IGS-gegevens (station ABMF, 2018-05-13) tot { "5.7" } m 3D-RMS / { "1.1" } m horizontaal ten opzichte van de opgemeten coördinaat.

seg-b107ba0607b0 = Een echte ontvangerpositie, opgelost uit echte RINEX-codepseudoafstanden + uitgezonden efemeriden met iteratieve gewogen kleinste kwadraten — Sagnac-/aardrotatiecorrectie, uitgezonden klok met TGD, de ionosfeervrije combinatie L1/L2 met twee frequenties (of Klobuchar met één frequentie), Saastamoinen-/Niell-troposfeer, elevatieweging, DOP en momentopname-RAIM.

seg-5819c351d123 = Jamming en spoofdetectie in meerdere lagen

seg-9a03f3db9ef0 = χ²₁-NP-detector · gesloten vorm en Monte-Carlo P_fa/P_md komen overeen

seg-788fdc9a22a1 = Een jammingmodel op basis van een linkbudget (J/S → effectieve C/N₀ → verlies van vergrendeling), een stochastische detector voor tijdspoofing (Neyman–Pearson / χ²₁-energietest met Monte-Carlo P_fa/P_md en een Security FoM van { "1" } − P_md), en een spoofdetector in meerdere lagen die een RAIM-consistentieparitytest, een RF-AGC-vermogensmonitor en een monitor voor signaalkwaliteit (SQM) samenvoegt. Plus een foutbudget voor quantum-inertiële dead reckoning dat de witte-ruisdrift van een koudeatoominterferometer met restbias (gecontroleerd tegen een onafhankelijke integrator) en schaalfactorfout samenstelt tot een positiedrift over de holdover — de inertiële tegenhanger van de klok-holdover.

seg-87bca15c6939 = Modulatie, anti-jam en codevolging

seg-c7d3ff7ea829 = Prestaties van navigatiesignalen

seg-1aec700caefe = BPSK-zelf-SSC = 2/(3R_c) · C/A-DLL-jitter onder de meter bij { "45" } dB-Hz · GPS C/A Gold-kruiscorrelatie -23.9 dB

seg-304803ee178d = De laag voor signaalprestaties tussen het linkbudget en het meetdomein: vermogensspectrale dichtheden met eenheidsoppervlak voor BPSK-R(n) en sinus-BOC(m,n), de spectrale scheidingscoëfficiënt die de anti-jam-Q waarvan het jammingmodel gebruikmaakt rechtstreeks afleidt uit de werkelijke signaal- en jammerspectra, de RMS-bandbreedte (Gabor) die de afstandsinformatie-inhoud bepaalt (BOC > BPSK), de thermische-ruisjitter van de coherente early–late-DLL-codevolging, en de omhullende van de multipathfout van coherent early-minus-late met onderdrukking door een smalle correlator, en een ontwerpafweging voor afstandsmetingscodes (zijlobben van de autocorrelatie van m-sequenties/Gold en de driewaardige kruiscorrelatiegrens van Gold, plus de inversie van codelengte naar ondubbelzinnig bereik). Dit is analyse van signaalprestaties, niet het ontwerp van RF-payload of antennehardware.

seg-684494a7877c = Passieve RF-geolocatie (TDOA/FDOA)

seg-414872cdf952 = Passieve RF-geolocatie

seg-bed5944d15dd = ruisvrije TDOA voorwaarts→invers tot { "1e-6" } m · J·CRLB = I · GDOP monotoon in ontvangers · schatter bereikt haar CRLB over { "4000" } Monte-Carlo-runs

seg-be8f2a419275 = Lokaliseer een jammer of spoofer (of een opportunistische bron voor reverse-PNT) uit hyperboloïden van tijdsverschil van aankomst over een ontvangernetwerk, opgelost met Gauss–Newton-kleinste-kwadraten; met frequentieverschil van aankomst en bewegende ontvangers worden de positie en snelheid van de zender gezamenlijk herleid, met de Cramér–Rao-grens op de positiecovariantie uit de netwerkgeometrie. Een puntbronmodel met zichtlijn — zonder multipath / NLOS, ontvangerklokbias of refractietermen.

seg-48e98ff7065e = RINEX-, SP3- en CCSDS-formaten

seg-7c6f4dc6bcba = Interoperabiliteit

seg-ae8dc649ab26 = uitgezonden efemeride + SP3-interpolatie tegen RTKLIB; OEM tegen een onafhankelijke CCSDS-parser

seg-75aae4d201fd = Inlezen van multi-GNSS-RINEX-3-uitgezonden efemeriden (GPS, Galileo, QZSS, BeiDou, GLONASS), een RINEX-3-observatieparser (de RINEX { "4.00" }-observatielay-out wordt naar verwachting correct geparsed, maar er is nog geen { "4.00" }-bestand doorheen gelezen; RINEX { "4" }-navigatiebestanden worden bij naam geweigerd), een lezer/schrijver voor SP3-c/d-precisie-efemeriden met Lagrange-interpolatie, en CCSDS OEM { "2.0" } + OMM (gemiddelde elementen) als export voor vluchtdynamicahulpmiddelen (GMAT, Orekit, STK), en CCSDS-TDM ({ "503" }) parsen en uitzenden van berichten met volggegevens voor radiometrisch volgen in de diepe ruimte.

seg-1f379e235f5f = Machinaal gecontroleerde verificatiematrix

seg-a4d10bb41065 = Verificatie en borging

seg-72ec664ea7ae = voor getoetste rijen is een externe onafhankelijke referentie vereist (invariant afgedwongen in CI)

seg-cab165105f32 = Een kruisverwijzing van eis naar module naar test naar onafhankelijke referentie naar status, gerenderd uit de engine zelf (Markdown/CSV), met in unittests gecontroleerde eerlijkheidsinvarianten: een rij mag alleen als getoetst worden gelabeld als zij een onafhankelijke externe referentie draagt (NIST / AIAA / SOFA / IGS / een gepubliceerde waarde), zodat een interne zelfconsistentiecontrole zich niet als validatie kan voordoen — en de hardware-/PA-mogelijkheden die { -brand } niet levert, worden vastgelegd als hiaten die bij de partner liggen. De uitvoerbare ruggengraat voor een ECSS-E-ST-10-02-verificatiekruisverwijzing.

seg-190cdf3ca8dc = Eenheid en herkomst bij elke gerapporteerde grootheid

seg-1c7bb8c3e887 = { "87" } van { "87" } soorten, { "3127" } van { "3127" } numerieke velden

seg-3e7fb040a7c4 = Elk numeriek veld dat een scenario uitgeeft, draagt een eenheid en een herkomstklasse uit een gesloten vocabulaire, met een definitie waar die bestaat, gepubliceerd als machineleesbaar schema naast de engine. Een stapsgewijs aangescherpte poort draait elke ingebouwde soort en faalt bij een veld dat er geen draagt; de soorten die nog niet compleet zijn, worden een voor een genoemd met de reden waarom elk nog openstaat, en de lijst kan alleen korter worden. Rapporten die hun eigen constanten vermelden — het eenrichtingslinkbudget, het optische en RF-budget — laten een lezer de kopwaarde uit het rapport alleen herberekenen.

seg-0e1a01c9158a = Budgetten voor lancering, terugkeer, dekking en richting

seg-f5cf9e86d3c9 = Missieanalyse

seg-767b2cd5f4ba = gecontroleerd tegen gesloten vorm (lanceerazimut · Allen-Eggers · SMAD)

seg-23bac81d700b = Eerste-orde budgetten voor missieontwerp, elk een uitvoerbaar scenario: tweelichamenmeetkunde van lancering en opstijging (lanceerazimut, minimale inclinatie, bonus van de aardrotatie, Δv voor vlakwijziging met dogleg, dagelijkse mogelijkheden), een ballistische terugkeercorridor volgens Allen–Eggers (piekvertraging, snelheden bij piek-g en piekverhitting), dekkingsgeometrie voor aardobservatie (zwadbreedte / nadir-GSD / toegang buiten nadir / herbezoektijd via de SMAD-ruimtedriehoek), een foutbudget voor 3-DOF-attitude en richting (zwaartekrachtgradiëntmoment + RSS-richtbudget), voorspelling van grondstationpassages (AOS/TCA/LOS, maximale elevatie, toegang), en een eenrichtingslinkbudget volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005 (FSPL, C/N₀, Eb/N₀, marge, sluiting). De analytische laag vóór de hardware onder STK/GMAT/Basilisk — gemodelleerde eerste-orde budgetten, geen vervanging voor een 6-DoF- of radiometrische analyse.

seg-43f53b910042 = Delen van de apertuur tussen navigatie en communicatie

seg-989637b0c6fc = Uitval en contentie per sessie, niet één dutycyclecijfer

seg-5c63a4559aff = Een contactplan en een aantal aperturen erin; navigatieduty, communicatieduty, uitval per sessie en contentie eruit. Het arbitragebeleid wordt in het rapport genoemd in plaats van verondersteld, en een sessie die niet volledig kan worden bediend, rapporteert het deel dat verloren ging in plaats van in een gemiddelde te verdwijnen.

seg-c8eb43aeb31a = Ruimteweer en thermosferische dichtheid

seg-37b8c9397544 = Ruimteomgeving

seg-25e24a6c0ba3 = Jacchia-71 getoetst aan gepubliceerde zonneminimum-, gemiddelde en -maximumwaarden

seg-1eff250f41c3 = Een ruimteweermodel van de omgeving: zonne-activiteitsindices (F10.7 / gecentreerde 81-daagse F10.7a) en geomagnetische activiteitsindices (Kp, met de definitorische Kp↔ap-tabel), de exosferische temperatuur volgens Jacchia-1971 die zij aansturen, en de activiteitsgecorrigeerde versus de statische thermosferische neutrale dichtheid op hoogte — de afhankelijkheid van de dichtheid van de zonnecyclus die een statische atmosfeer weglaat. Een gekalibreerde eerste-orde koppeling via de schaalhoogte, geen met gegevens getoetste NRLMSISE-atmosfeer.

seg-49bac998eb07 = Evaluatie van detectie van RF-verstoringen en PNT-afweging

seg-dca720256d85 = Evaluatie en afweging van machine learning

seg-5f0a39efe160 = AUC-harnas gecontroleerd tegen de binormale gesloten vorm Φ(d′/√{ "2" }) (Gneiting & Vogel { "2018" }); evaluatiemetrieken bit voor bit getoetst tegen scikit-learn { "1.9.0" } — synthetisch corpus, niet raw-IQ/TEXBAT

seg-0dc3a7135442 = Een testomgeving voor de evaluatie van detectie van RF-verstoringen: een gelabeld, op parameters gegrondvest synthetisch corpus (nominaal / jamming / tijdspoofing / positiespoofing / multipath), een detectoronafhankelijk ROC/AUC-harnas dat elke detector beoordeelt met Pd per klasse bij een doel-Pfa, en de optimismekloof tussen in- en buiten-de-verdeling. Een diepere studie van de optimismekloof breidt dit uit tot een panel van 13 detectoren (energie / AGC / SQM / parity plus geseede logistische regressie- en MLP-detectoren met één verborgen laag), schaalwetten voor in- versus buiten-de-verdeling met een permutatienulmodel, en een leave-one-out-voorspeller van de degradatie buiten de verdeling; een front-end van een software-defined receiver (ruwe IQ/IF naar correlator-early/prompt/late-taps naar SQM) en adapters voor het inlezen van echte gegevens (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) laten dezelfde detectoren draaien over lokaal aangeleverde opnamen. Plus een afweging tussen kwantum en klassiek voor PNT die het voordeel voor tijdsynchronisatie en inertiële holdover van een kandidaatklok kwantificeert uit een gemeten ADEV-curve tegen een klassieke basislijn, met een envelop van veerkracht-versus-tijd zonder GNSS. Gemodelleerde operationele karakteristieken — nooit veld- of IQ-gegevens, geen oordeel goed/slecht.

seg-8766e058334d = Crossoverkaart van veerkracht tussen kwantum en klassiek

seg-8f851e9cf8c2 = genereert de inertiële en klokcrossoverstudies achter de figuren bij de resultaten opnieuw; afwegingskernen getoetst tegen scipy { "1.17.1" }

seg-a057ad4c89ce = Een reproduceerbare kaart van waar een kwantumsensor zijn klassieke tegenhanger inhaalt bij parameteronzekerheid: koudeatoom versus dead reckoning van navigatiekwaliteit en optische versus chipschaalklok-holdover, over uitvaltijd en platformtrilling, waarbij elke curve een label voor technologische gereedheid draagt. Reproduceerbaar via cargo run --bin crossover_study. Gemodelleerde prestatiebudgetten — de invoer bestaat uit gepubliceerde of omkaderde coëfficiënten, niet uit vluchtgegevens.

seg-6347618838dd = Voorwaardelijk beschermingsniveau voor tijdsynchronisatie

seg-a846e806e577 = Integriteit van tijdsynchronisatie

seg-762bc9f28716 = samenstelling gecontroleerd tegen de meerstaps-covariantierecursie van clock_state; gekalibreerd op JammerTest { "2024" } (Zenodo { "15911589" })

seg-3622798325cd = Een door holdover begrensde bovengrens voor de onopgemerkte tijdfout bij GNSS-spoofing: gegeven een onafhankelijke kruiscontrole wordt de fout in de geleverde tijd begrensd door een k-sigma-monitorondergrens, de van-Loan-uitloopvariantie over de detectielatentie en een CUSUM-tijd-tot-alarm. Gekalibreerd op een echte opgenomen spoof (JammerTest { "2024" }) en reproduceerbaar via cargo run --example tpl_jammertest. Gemodelleerde samenstelling, voorwaardelijk aan detectie — er is geen eindige onvoorwaardelijke grens, omdat een voldoende langzame helling één klokgestuurde monitor ontduikt.

seg-734a93b6a809 = Scoring van PNT-veerkracht en beslissingsinstabiliteit

seg-c25b4e240fb5 = Veerkrachtbeoordeling

seg-f42ae8719e02 = { "35" } met de hand afgeleide tests met een onafhankelijke referentie; byte-deterministisch studieartefact (vaste seed); afgestemd op DHS RPCF v2.0

seg-8e69193ca540 = Een scoring-engine, afgestemd op een kader (de categorieën van DHS RPCF), die het gesimuleerde gedrag van een architectuur afbeeldt op subscores per dimensie en vervolgens vraagt of een enkele samengestelde score of volwassenheidsniveau een stabiele basis voor een beslissing is — via een Dirichlet-gewichtensimplex, Kendall-tau-rangorde-instabiliteit, een omslagpercentage van de nummer-1-winnaar en instorting van de diversiteit in gemeenschappelijke modus (Hill-N2) — met een rapport voor borging met integriteitshash. Reproduceerbaar via cargo run --example resilience_report. Gemodelleerde synthetische architecturen afgestemd op RPCF v2.0; een zelfbeoordeling, geen certificering.

seg-62ef40799af4 = Gemiste detectie → integriteitsgebieden

seg-52e55797d77c = Effect op integriteit

seg-99025f66f277 = Stanford-ESA-integriteitsgebieden (Tossaint et al., NAVIGATION { "2007" })

seg-13f23ffe5840 = Een brug van gemiste detectie naar integriteit: een niet-gedetecteerde bias die achterblijft na een gemiste spoof-, jam- of RAIM-detectie vergroot de effectieve positiefout, die — gehouden tegen alarmgrenzen voor de context — wordt ingedeeld in de Stanford-ESA-integriteitsgebieden (beschikbaar / niet beschikbaar / misleidend / gevaarlijk). Stelt de extern verankerde RAIM-Stanford-indeling samen; voegt geen nieuwe integriteitswiskunde toe.

seg-3a7572774192 = ROI per dekking

seg-797d137dc022 = Beslissingsondersteuning

seg-d77993b6ef59 = Een ROI-lens voor kosten per dekking — kosten per eenheid geleverde dekking bij een afweging tussen constellaties of architecturen. De dekkingscomponent is samengesteld uit de getoetste dekkingsgeometrie en de rekenkunde is in unittests gecontroleerd, maar de kosten zijn een invoer van de gebruiker — dus de verhouding is een planningshulpmiddel en geen extern getoetste grootheid (vandaar, eerlijk gezegd, geen bewijsbadge).

seg-690b4cb0df55 = { -brand } Interchange Format (KIF)

seg-558523b5e0ac = Uitwisseling van artefacten

seg-b882cccf5cee = envelop met versie · round-trip en voorwaarts compatibel lezen gecontroleerd

seg-ff5a4ead87fe = Een zelfbeschrijvende envelop met versie die een scenarioresultaat omhult met zijn soort, schemaversie en de labels gemodelleerd en getoetst, zodat een opgeslagen artefact zichzelf blijft documenteren en oudere enveloppen voorwaarts compatibel leesbaar blijven.

seg-5052e1720602 = Vertrouwensscore van de ontvanger voor een vaartuig

seg-70144aeea2d1 = rekenkunde van de monitor gecontroleerd tegen pynmea2 en GeographicLib

seg-9d9329128f06 = Beoordeelt of de positiebepaling van een vaartuig te vertrouwen is op basis van de NMEA { "0183" } die zijn ontvanger en instrumenten al uitzenden: een score van 0 tot 100, drie banden en de redenen erachter, per epoche, in batch, live of als poort. Monitors vergelijken de positiebepaling met de eigen beweging van het vaartuig, de koerssensor, het log en de signaalsterkten van de satellieten. Adviserende software, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk. De rekenkunde van de monitors is gecontroleerd tegen onafhankelijke bibliotheken; de regel en de drempels van de score zijn die van het project zelf en blijven gemodelleerd.

seg-a47934361f43 = NMEA-streams voor bemanningstraining

seg-c6492d4a7dae = { "225,227" } zinnen geparsed en gedecodeerd door pynmea2

seg-9ca765cc09fc = Schrijft synthetische NMEA { "0183" } van de brug voor een gescripte reis met door de instructeur gescripte jamming, positie-wegtrekking, tijdspoofing en replay-gebeurtenissen, met een instructeurslogboek, zodat een bemanning kan zien hoe een gedegradeerde positiebepaling eruitziet op de eigen instrumenten. Alleen tekst, nooit voor de live navigatiesystemen van een vaartuig; er wordt niets uitgezonden en er wordt geen radiosignaal gemaakt. De zinnen en hun gedecodeerde waarden worden gecontroleerd; de modellen van ontvanger, hemel en gebeurtenissen zijn gemodelleerd.

seg-39f61b88209e = codebetekenissen en geometrie gecontroleerd tegen pyModeS, pyais, shapely en GeographicLib

seg-4c1667d3d453 = Bouwt per dag een GeoJSON-kaart van waar vliegtuigen (ADS-B) en schepen (AIS) gedegradeerde navigatiegegevens meldden, uit openlijk gelicentieerde invoer, en het aandeel van een route dat door gedegradeerde cellen loopt. Een gedegradeerde cel is een uitspraak over gerapporteerde nauwkeurigheidsvelden of onwaarschijnlijke posities, geen vaststelling van interferentie, en een cel die niemand heeft waargenomen is geen bewijs van een vrije route. Eerdere meldingen, geen voorspelling.

seg-e0962980e96f = Vertrouwenstelemetrie voor beveiligingsoperaties

seg-9b538e790bd7 = Prometheus, OTLP en CEF teruggelezen door onafhankelijke parsers

seg-f33e062790d9 = Exporteert de vertrouwensstream als Prometheus-metrics, OpenTelemetry (OTLP/HTTP) en CEF- of LEEF-syslogberichten via stdout, HTTP, UDP of TCP, zodat een security operations centre een navigatiefout naast zijn andere alarmen ziet. Een niet-werkende collector legt de beoordeling niet stil en blijft ook niet onopgemerkt. Prometheus, OTLP en CEF worden teruggelezen door onafhankelijke parsers; LEEF wordt alleen gecontroleerd tegen zijn eigen specificatie.

seg-c74f3b9569b1 = Ondertekende bewijspakketten

seg-28016686504c = RFC { "8032" }-vectoren byte voor byte; een clean-room-verificateur komt overeen op { "71" } pakketten

seg-123fa1de2e23 = Bundelt het venster rond een vertrouwensgebeurtenis in een pakket met hashketen en Ed25519-handtekening dat iedereen offline kan verifiëren: een gewijzigd, verwijderd, verwisseld of toegevoegd bestand, een opnieuw ondertekend pakket of een verkeerde vastgepinde sleutel wordt benoemd. Een optioneel RFC { "3161" }-tijdstempeltoken is eraan gebonden. Een technisch verslag, geen juridisch oordeel, vaststelling van feiten of attestatie.

seg-ee2e250497f9 = Export voor testbench

seg-ea618add831e = conversies en coderingen gecontroleerd tegen PROJ, GeographicLib, pynmea2 en SciPy

seg-be8af88f4f99 = Schrijft de voertuigbeweging en gebeurtenissen van een scenario als CSV-trajectorie en NMEA { "0183" } voor een GNSS-simulator in een laboratorium: aardgebonden, geodetische en lokale-snelheidskolommen, attitude en UTC. Alleen beweging en gebeurtenissen: er wordt geen signaal geschreven en er wordt geen prestatie van een simulator of ontvanger beweerd.

seg-1ff1d8ebf1e7 = Compliance-mapping naar openbare kaders

seg-83af3fa21509 = Koppelt { -brand }-uitvoer aan de clausules van openbare kaders (IMO-richtlijnen voor schepen, EU NIS2 artikel { "21" }, EN { "16803" }, het Amerikaanse DHS-kader voor veerkrachtige PNT en EASA-richtlijnen voor de luchtvaart) uitsluitend via het clausulenummer, ingevuld uit de runs die u aanlevert, en geeft aan voor welke rijen een reeks runs bewijs levert, met het hiaat van elke rij. Het is geen vaststelling dat een kader is nageleefd en geen beoordeling of goedkeuring door wie dan ook.

seg-1b784a8701ac = GNSS-authenticatie

seg-2b5a6095013a = alle { "18" } officiële testvectorsets: { "186,382" } tags geauthenticeerd, { "0" } mislukt

seg-0419e9af208d = Een open verificateur in pure Rust aan de ontvangerkant voor Galileo Open Service Navigation Message Authentication: hij controleert van welke satellieten een ontvanger de navigatiegegevens kan authenticeren uit I/NAV-pagina's of een u-blox-UBX-stream, via de controles van publieke sleutel, sleutelketen en tags uit de specificatie van het signaal in de ruimte, en rapporteert authenticatie per satelliet en per tijdstip. Hij authenticeert gegevens; hij beweert geen enkele prestatie tegen spoofing.

seg-d8bb6226f2e3 = Zichtbaarheid met skylinemasker, DOP en foutellips

seg-6c6e7248496f = Hemelgeometrie

seg-94ff262653a6 = { "1173" } kijkhoeken en { "142" } zichtbare sets komen overeen met Orekit { "12.2" } en gnss_lib_py { "1.0.4" } tot { "1e-12" }; de ellips komt overeen met numpy in { "270" } gevallen

seg-309521d4c9e1 = Welke satellieten een locatie kan zien wanneer gebouwen, kaden, kranen of terrein een deel van de hemel blokkeren, en wat dat doet met de dilution of precision (DOP) en de horizontale foutellips. Een azimutafhankelijke skyline vervangt de enkele elevatiegrens; de zichtbare set, de DOP ervan en de ellips komen per epoche en per constellatie uit. Een skyline verwijdert satellieten met zichtlijn en niets meer: ze modelleert geen reflecties, geen diffractie en geen signaalsterkte.

seg-448e81d36ca4 = Skylinevoorinstellingen en de functies voor hemelgeometrie

seg-6483f9d89f15 = met de hand berekende waarden en de geometrie die de wolk bemonstert; geen externe onafhankelijke referentie

seg-ebc2904904d3 = De reducties van straatcanyon, sector en terrein tot een skylinetabel, vier representatieve voorinstellingen (stadsstraat, havenbenadering, fjord, containerterminal) en de functies die deze samenstellen tot een skyplot en een Monte Carlo-wolk, vanuit de CLI, MCP, Python en de browser. De voorinstellingen zijn representatieve geometrieën met gekozen, vermelde afmetingen, geen opmetingen, en de reducties zijn alleen gecontroleerd tegen met de hand berekende waarden.

seg-c2a5a6a7bcb0 = Geometriebewuste indeling van vertrouwen

seg-2f51e4da63b4 = de indelingsregel en de drempels zijn die van het project zelf, gecontroleerd tegen zichzelf

seg-b664ce284745 = Zet de satellietgeometrie naast de vertrouwensscore van de ontvanger en benoemt bij elke aftrek een klasse: signaalverlies, slechte geometrie of een inconsistentie tussen de door de ontvanger opgegeven DOP en de DOP afgeleid uit de zichtbare satellieten. Geometrie wordt alleen beoordeeld wanneer ze bekend is, en het label is de kop: alleen een slechte geometrie kost punten. Adviserende software, geen typegoedgekeurde navigatieapparatuur.

seg-5026aab26cb8 = Studie van een referentiestation op de maan

seg-d6935d32272b = stelt geteste functies voor differentiële correcties, klok en referentiestelsel op de maan samen; gecontroleerd tegen zichzelf en een numpy-referentie, geen externe vluchtgegevens

seg-4f9696706384 = Eén reproduceerbare studie van wat een referentiestation op de zuidpool van de maan zou kunnen doen onder openbare aannames: een dekkings- en nauwkeurigheidskaart over het poolgebied (percentielen van de gecorrigeerde en ongecorrigeerde positiefout, beschikbaarheid met een reden voor elke niet-beschikbare epoche, beschermingsniveaus en het budget van de correctieverbinding), een tijdlaboratorium dat een maantijdreferentie op een atoomklok houdt, en de geodesie van een toegevoegde laserretroreflector en VLBI-baken ten opzichte van het datum met vijf arrays. Elke invoer is gelabeld met zijn openbare bron of als illustratief. Het is geen uitspraak over de prestaties van een echt systeem, en { -brand } is niet verbonden aan enig agentschap.

seg-cad8be3b66a3 = Optische tijdverbindingen door wolken en turbulentie

seg-e86745da72f0 = { "7" } van { "7" } vooraf vastgelegde numerieke drempels gehaald tegen een onafhankelijk mpmath-programma; er is geen gemeten beschikbaarheidsregistratie vergeleken

seg-dd98aa94f8c8 = Hoe vaak een optische tijdoverdrachtsverbinding beschikbaar is wanneer de atmosfeer in het pad zit. Voor elke grondlocatie geeft de engine het verlies bij heldere lucht, de turbulentietoestand van Hufnagel-Valley met gamma-gamma-scintillatiefades en apertuurmiddeling, de beschikbaarheid tegen de linkmarge uit een vermeld wolkenklimaat, het plafond dat geen marge kan opheffen, de verdeling van de uitvalduur en de tijdfout die een uitval een holdover-klok kost. Daarna toont hij wat extra locaties, een grotere apertuur, een andere golflengte of adaptieve optiek opleveren. De meegeleverde wolkenklimaten zijn illustratief, niet gemeten; de uitvoer is adviserend.

seg-861d57389dd7 = GNSS voorbij de constellatie: het Space Service Volume en daarbuiten

seg-8705c276af61 = ICG SSV-boekjestabellen, vooraf vastgelegd; de meeste drempels NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = Voor een ruimtevaartuig op een bol (de globale schil van het ICG Space Service Volume-boekje) of op een Kepler-baan van LEO tot maantransfer telt dit per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en voor alle samen de signalen boven een C/N0-drempel: beschikbaarheid van een en van vier signalen, langste uitval, ontvangen C/N0, dilution of precision, en verbindingen via de hoofdlob tegenover die via zijlobben. De zendpatronen zijn die van het boekje, een parametrische vervanger of een patroon dat u zelf aanlevert; een model voor ionosfeer, plasmasfeer en atmosfeer langs de randstraal en een ontvangerontwerp voor zwakke signalen zijn optioneel; een GNSS-filter aan boord voor hoge banen en maantransferbanen en relatieve navigatie in formatie zijn inbegrepen. MODELLED: vergeleken met de tabellen van het boekje onder een preregistratie die voor de run is vastgelegd, komen de constanten voor minimaal uitgestraald vermogen en de drempel voor de maan overeen, de andere drempels zijn NOT MET onder de vooraf vastgelegde lezing (bijna allemaal door de inconsistente GLONASS-bundelhoek van het boekje), en de parametrische zijlobvervanger reproduceert de gemeten GPS-paneelpatronen niet.

seg-61817375c8ea = Maanbaan en maanoppervlak als navigatie- en geodetische infrastructuur

seg-d2439abaeabb = numpy-/scipy-onafhankelijke referenties van de numerieke methoden; drie vooraf vastgelegde drempels NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Vijf studies in een beperkt driehoudenmodel: een baanbepaling aan boord met Aarde-GNSS in een bijna-rechtlijnige halobaan tegenover een onafhankelijke baanbepaling vanaf de grond met afstand en afstandssnelheid; gezamenlijke vaststelling van de geheeltallige ambiguïteit van de draaggolffase van oppervlaktestation en orbiter (LAMBDA); de Fisher-informatie van een maandatum met zeven parameters met en zonder afstanden tussen orbiter en oppervlak; GNSS-, VLBI- en laserafstandsoffsets ten opzichte van de lokale koppeling; en gevoeligheid voor de getijden- en libratieparameters van de maan. MODELLED met illustratieve invoer: de numerieke methoden zijn gecontroleerd tegen onafhankelijke numpy- en scipy-programma's, niet de natuurkunde. Onder de vooraf vastgelegde drempels zijn er drie NOT MET: een geïnjecteerde krachtfout wordt niet gedetecteerd met het vermelde percentage (C3), het bootstrapped slagingspercentage verschilt van het numpy-orakel met { "1.7e-6" } tegenover een drempel van { "1e-9" } (Q3), en het toevoegen van een afstandsfamilie verlaagt het spoor van de pseudo-inverse niet altijd (G3, sporenhelft).

seg-f4f59f19e091 = Mogelijkhedenkaarten

seg-501d3a72ea43 = Integriteit

seg-20db2c79b998 = Getoetst

seg-29e58493fdd4 = Berekend uit een model

seg-298cc35fe9d1 = Inertiaal

seg-b03984610dc0 = Lunair

seg-f1f903f1b9ff = Veerkracht

seg-bd64cfb4dc52 = Baanpropagatie en constellatieontwerp

seg-a7cfe6f135f1 = Baan en geometrie

seg-3060564c3e21 = 666/666 AIAA-vectoren · { "4.12" } mm

seg-5b265eaf8f29 = SGP4/SDP4-propagatie uit echte two-line elements (een vastgelegde Celestrak-GPS-momentopname) of synthetische Walker-constellaties waarvan de gemiddelde elementen de formule i:T/P/F realiseren tot onder { "1" } km over { "24" } u. Zichtbaarheid van meerdere constellaties, dilution of precision en GNSS-beschikbaarheid, een optimalisator voor constellatieontwerp, dimensionering van streets-of-coverage en een Walker-ontwerpsweep die de Pareto-optimale ontwerpen rapporteert over een raster van vlakken × satellieten.

seg-66e33b899daf = Cowell-propagator en krachtmodel met zes verstoringen

seg-a5a572db3bed = Numerieke propagator

seg-52a4410a54da = conservatieve niveaus < { "0.08" } m / { "24" } u tegenover Orekit { "12.2" }

seg-463ed85c6e40 = Een numerieke (Cowell-)propagator als aanvulling op het analytische SGP4/SDP4-pad, met een hiërarchisch krachtmodel: twee lichamen + het volledige zonale veld J2–J6, een optioneel tesserale geopotentiaal van EGM2008 tot graad/orde { "70" }, zwaartekracht van Zon en Maan als derde lichaam op basis van de epoche (een ingebouwde efemeride, geen DE/SPK-kernel), zonnestralingsdruk met een conische umbra/penumbra-schaduw, atmosferische weerstand, de post-Newtoniaanse relativistische correctie van Schwarzschild en de frame-dragging-term van Lense–Thirring — aangestuurd door een keuze van adaptieve integratoren: RK4 met stapverdubbeling of Dormand–Prince RK5({ "4" }).

seg-797370a2faef = Burns, Lambert en porkchop

seg-57b120fb0aac = Manoeuvres en trajectontwerp

seg-5081c84dfdd7 = Tsiolkovsky < { "0.01" } % · Lambert-rondgangen naar de referentie voor twee lichamen

seg-da6b16ebd59b = Impulsieve ΔV-knooppunten met covariantiepropagatie van { "6" }×{ "6" }, integratie van eindige burns gecontroleerd aan de raketvergelijking van Tsiolkovsky tot onder { "0.01" } %, een Lambert-oplosser van Izzo-2015 voor één omloop en een exacte Kepler-propagator met universele variabelen, en een porkchop-sweep (lancering × aankomst) van C3 / aankomst-V∞ uitgegeven als JSON-contourraster — de laag voor prestatiesimulatie boven GMAT/Orekit.

seg-831552a45712 = Tijdschalen en frames voor de oriëntatie van de Aarde

seg-76b323512350 = Tijdsystemen

seg-60208bd726eb = bit voor bit tegenover SOFA/ERFA · Vallado van begin tot eind { "4" } mm

seg-42373dd9ca64 = IERS-schalen UTC / TAI / TT / UT1 met schrikkelseconden, een Juliaanse-datum-API, de IAU-2000 Earth Rotation Angle, op GMST gebaseerde frames TEME ↔ ECEF en geodetische WGS-84-frames, volledige nutatie IAU 2000A/2000B en precessie IAU { "2006" }, en de equinoxvrije, op CIO gebaseerde reductie IAU 2006/2000A GCRS↔ITRS met IERS-poolbeweging — bit voor bit getoetst aan de SOFA/ERFA-vectoren en onafhankelijk gecontroleerd tegenover ANISE (pure-Rust SPICE): GCRS→ITRS tegenover ANISE ITRF93, dezelfde IERS-EOP, komen overeen tot ≤ { "0.86" } m op de grond / ≤ { "3.6" } m op GNSS-baanhoogte.

seg-dd766880e73a = Voorspelling van de oriëntatie van de Aarde in realtime

seg-54169bca19e9 = { "12" } voorspeltijden tegenover gearchiveerd Bulletin A: UT1 { "2.93" } ms, poolbeweging { "1.76" } mas

seg-81be07e41d1c = Een voorspeller van de oriëntatie van de Aarde in operationele stijl — kleinste kwadraten over bias, snelheid en de voornaamste periodieke termen over een meelopend venster — gemeten tegenover werkelijk gearchiveerde voorspellingen van Bulletin A in plaats van tegenover persistentie. De offline standaardinvoer is een echt IERS-product finals2000A met voorspellingsrijen van Bulletin A, zodat een kale run een gevulde tabel per horizon geeft in plaats van een lege. UT1 en poolbeweging worden gerapporteerd over een gemeenschappelijke rijenset samen met hun combinatie, zodat het gezamenlijke cijfer één statistiek is en geen kwadratische som van twee verschillende steekproeven.

seg-0e18bc4add10 = Strapdown-INS en kaartgestuurde navigatie

seg-26561c9a96a7 = CAI-versnellingsmeter uit eerste principes · afgeleide VRW gecontroleerd tegenover een onafhankelijke integrator

seg-d18714ee32fb = Strapdown-INS met drie assen — standhoek met quaternionen, WGS-84 NED-mechanisatie, coning/sculling-compensatie en een volledig deterministisch IMU-foutmodel — plus een versnellingsmeter met koude-atoominterferometer uit eerste principes (Mach–Zehnder-fase, projectieruis, contrastverval, trillingskoppeling) en een deeltjesfilter voor terrein-/zwaartekrachtgerefereerde navigatie zonder GPS.

seg-0e44bdf12d16 = Inertiaal en terreingerelateerd doorvaren door een uitval heen

seg-07cb40aa5cd1 = { "10" } m na { "249" } s, { "50" } m na { "595" } s, bias van de versnellingsmeter bij beide dominant

seg-d5df17e4425b = Positiefout tegenover de duur van het doorvaren uit een foutbudget van de IMU — bias, random walk en schaalfactor, elk met zijn eigen groeiwet en zijn eigen aandeel in de overschrijding — zodat de kosten van een navigatie-uitval een berekende curve zijn en geen gesweepte driftsnelheid. Overschrijdingen van drempels zijn uitvoer van de engine, met per overschrijding de dominante bijdrage genoemd, over vier IMU-klassen, en een interval voor terreinpositiebepaling wordt in een eigen blok gescoord, zodat de kerncijfers van de overschrijdingen onondersteund blijven.

seg-6631a5d69c84 = Matching van zwaartekracht-, terrein- en magnetische kaarten

seg-6af8e99df46d = Alt-PNT (zonder GPS)

seg-72527f4459c7 = 60 min zonder GPS · ~{ "145" } m (< { "500" } m)

seg-89bd5fb3e90b = Een meetmodel voor een zwaartekrachtmeter met koude atomen waarvan de witteruisvloer is afgeleid uit de fysica van de CAI-versnellingsmeter, een volledig genormaliseerd sferisch-harmonisch zwaartekrachtanomaliveld van lage graad plus synthetische mascons, en een deeltjesfilter voor het matchen van zwaartekrachtkaarten — uitgebreid naar terreingerefereerde navigatie tegenover een SRTM-hoogtemodel (TERCOM/SITAN), een IGRF-14 geomagnetisch hoofdveld tot graad/orde { "13" }, en een gecombineerde navigator voor zwaartekracht + magnetisme + terrein die alle drie de scalaire kanalen fuseert. Een benchmark van 60 minuten zonder GPS — een uitval van ~{ "700" } km / één uur waarin de inertiale oplossing tot ~{ "70" } km wegdrijft — wordt hersteld tot ~{ "145" } m door een hiërarchische grof-naar-fijn-matcher: het doel ESA NAVISP Quantum Wayfarer.

seg-dbd63be796ff = GNSS / INS-sensorfusie

seg-f9582184adea = Fusie

seg-f2166e96405f = strak gekoppelde UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = Een EKF met foutstaat van 15 toestanden die door GNSS-uitval heen doorvaart op een gekalibreerde inertiale oplossing; een strak gekoppelde pseudoafstandsmodus die blijft corrigeren met minder dan vier satellieten; een gekoppeld filter voor klok + positie; een algemene unscented (sigmapunt-)Kalman-schatter; een strak gekoppelde GNSS/INS-UKF-navigator, getoetst tot { "0.77" } m RMS door een uitval van { "120" } s op een bochtige LEO-passage; en een volledige strak gekoppelde GNSS/INS-UKF met 17 toestanden waarvan de kwantum-CAI-koppelnavigatie de uitval overbrugt op de afgeleide velocity random walk van de koude-atoomversnellingsmeter.

seg-4af862bd1307 = Batch- en sequentiële baanbepaling

seg-ca67c864635c = Baanbepaling

seg-948441304a32 = batch + sequentiële baanbepaling tegenover Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = Herstel van een baantoestand uit afstandsmetingen van grondstations, met het krachtmodel voor twee lichamen + J2 en de RK4-integrator gecombineerd met een Gauss–Newton-batchcorrector (submeter / mm·s⁻¹ uit ruisvrije afstanden, ~{ "2" } m bij een ruisvloer van { "5" } m) en een sequentiële variant met unscented filter.

seg-06406b3d0b88 = Fisher-informatie en waarneembaarheid

seg-4e28248ef77b = Waarneembaarheid en schattingstheorie

seg-a5b38d0a8d64 = eigenwaarden tegenover numpy.linalg.eigh · CRLB tegenover σ²(XᵀX)⁻¹ via numpy.linalg.inv · GNSS-DOP uit de informatiematrix, alles tot { "1e-9" } · gesloten vormen van Kay ({ "1993" }) + bereiken van de CRLB met Monte Carlo

seg-3ee5597d6f8a = Een algemene, herbruikbare laag voor Fisher-informatie / Cramér–Rao (src/fim.rs): de informatiematrix M = HᵀWH, de Cramér–Rao-ondergrens, de waarneembaarheidsrang en de nulruimte van het datumdefect (Moore–Penrose-pseudo-inverse), en D/A/E/T-optimale scalars voor experimentontwerp uit een symmetrische Jacobi-eigenwaardenoplosser. Ze ondersteunt de DOP-engine, de grens voor passieve geolocatie en het resultaat voor de absolute waarneembaarheid van lunaire stations — interne afstandsmeting laat een datumdefect van een stijf lichaam met zes vrijheidsgraden over dat een VLBI-verbinding met een basislijn op Aarde herstelt voor een ijle constellatie en aanscherpt voor een rijke, waarbij het absolute datum sluit bij drie niet-collineaire aardstations.

seg-ed467622dbd0 = CR3BP-propagatie en LunaNet-integriteit

seg-e386dced1d16 = Lunair en cislunair

seg-f444bc39efbe = Reproduceert de gepubliceerde L2 { "9" }:{ "2" } NRHO (~{ "6.57" } d omlooptijd · ~{ "3,250" } km perilune); STM gecontroleerd tegenover eindige verschillen

seg-272afbca5e48 = Een circulaire beperkte driebodempropagator Aarde–Maan (CR3BP) in het roterende frame — een behouden Jacobi-constante en alle vijf de Lagrangepunten — met een toestandsovergangsmatrix van { "6" }×{ "6" } en een differentiële corrector met enkelvoudig schieten die echt periodieke halo-/bijna-rechtlijnige halobanen (NRHO) oplevert: hij reproduceert de gepubliceerde zuidelijke L2 { "9" }:{ "2" } NRHO (de Gateway-baan) met een omlooptijd van ~{ "6.57" } dagen en een perilune van ~{ "3,250" } km. Plus de LunaNet / LNIS-geometrie voor cislunaire PNT (MCI↔MCMF-reductie, selenografische coördinaten) met een ARAIM-passage aan de lunaire zuidpool die de integriteitskloof eerlijk zichtbaar maakt: een σ_URE van ~{ "30" } m drijft het beschermingsniveau ver boven een alarmlimiet van { "50" } m.

seg-619f89bf160c = Realisatie van het lunaire referentiestelsel

seg-c6b12768a219 = tegenover numpy/scipy Umeyama–Horn-SVD

seg-29327b86ea27 = Realiseert een lunair lichaamsvast frame uit een waarneemcampagne: een gewogen Gauss–Newton-gelijkvormigheidsfit over de geometrie station–reflector, die het datum, zijn covariantie en de slechtst bepaalde as rapporteert. De gekoppelde ijk van frame en tijdschaal wordt expliciet meegevoerd in plaats van geabsorbeerd, zodat het rangdefect zichtbaar is in het rapport en niet begraven zit in een pseudo-inverse.

seg-b3ba1e7b197d = Lunair navigatieservicevolume en ARAIM

seg-353878596468 = ANISE { "0.10.2" }-banen · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = Laat een illustratieve constellatie van de klasse Moonlight/LCNS een selenografisch raster doorlopen: zichtbaarheid, dilution of precision, dekking en ARAIM-beschermingsniveaus per epoche tegenover een instelbare alarmlimiet. De nauwkeurigheid van de afstandsmeting in de signaalruimte is een parameter, zodat de sweep een eis aan de afstandsmeting beantwoordt over het hele volume in plaats van geslaagd/niet geslaagd bij één vaste waarde.

seg-a94db5b03c9c = Lunair interoperabiliteitsbudget tussen aanbieders

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 via calceph

seg-646a00230694 = Meet hoeveel drie onafhankelijke gezaghebbende lunaire efemeriden daadwerkelijk van elkaar afwijken, en maakt daar een ontwerpwet van: het foutbudget tussen frame en efemeride dat een gebruiker met gemengde aanbieders erft, en de consistentietolerantie die een aanbieder moet aanhouden om dat budget binnen een vermelde grens te houden.

seg-0f359c118090 = Waarneembaarheid van fouten in een autonoom vrij netwerk

seg-ae99396c03bd = tegenover onafhankelijke numpy/scipy-pariteitsalgebra

seg-51828c93731b = De lineaire algebra die een zelfreferentiële lunaire constellatie nodig heeft om haar eigen fouten te detecteren zonder grondreferentie: de gewogen pariteitsprojector in de pseudo-inverse-vorm voor rangdeficiënte stelsels die de ijk van datum en tijdschaal doorstaat, de detecteerbaarheid per knooppunt, de minimaal detecteerbare bias van Baarda, en detect/identify-aantallen voor Byzantijnse block-spark over echte DE440-geometrie tussen knooppunten.

seg-d6476863f862 = Mogelijkheid

seg-ad856ad710eb = Status

seg-6962adaa6a1f = Bij het bouwen gegenereerd uit de scenariobestanden en de verificatiematrix van de repository.

seg-6f44f45f6bf9 = De { "61" } mogelijkhedenkaarten uit <c1/>, daarna alle { "388" } rijen van de verificatiematrix.

seg-30200bb5be58 = orbit-sgp4-gps.toml uitvoeren in Kshana Studio

seg-ecacc78711a1 = realtime-frame-eop.toml uitvoeren in Kshana Studio

seg-fe9baedab7f0 = imu-deadreckoning.toml uitvoeren in Kshana Studio

seg-58a3232bc4cf = ins-trn-coast.toml uitvoeren in Kshana Studio

seg-27ffc4dfa394 = gps-denied-gravity-nav.toml uitvoeren in Kshana Studio

seg-eb0c08082d24 = gnss-ins.toml uitvoeren in Kshana Studio

seg-8d0f45d119a9 = lunanet-araim.toml uitvoeren in Kshana Studio

seg-09641b89ad3a = lunar-frame-realisation.toml uitvoeren in Kshana Studio

seg-4eea1b7d77cd = moonlight-service-volume.toml uitvoeren in Kshana Studio

seg-3cd4cd7d7c16 = lunar-interop-export.toml uitvoeren in Kshana Studio

seg-d767de2fa87a = lunar-llr-datum.toml uitvoeren in Kshana Studio

seg-29266e8878ac = lunar-differential-pnt.toml uitvoeren in Kshana Studio

seg-0955d6ded82d = lunar-time-budget.toml uitvoeren in Kshana Studio

seg-ab41004755ea = lunar-jamming.toml uitvoeren in Kshana Studio

seg-edbe5cf449a0 = lunar-vlbi-fim.toml uitvoeren in Kshana Studio

seg-d706c2d59dd1 = mars-pnt-lmo.toml uitvoeren in Kshana Studio

seg-71586c459df8 = hybrid-optical-rf.toml uitvoeren in Kshana Studio

seg-87634a6d41b5 = integrity-raim.toml uitvoeren in Kshana Studio

seg-a281aa02ddc7 = araim-reference-check.toml uitvoeren in Kshana Studio

seg-9184b54b1173 = clock-holdover.toml uitvoeren in Kshana Studio

seg-2f270136b41d = gnss-sim-raim.toml uitvoeren in Kshana Studio

seg-f2f3ede70967 = pvt-abmf.toml uitvoeren in Kshana Studio

seg-eac325fbeed1 = spoof-attack.toml uitvoeren in Kshana Studio

seg-07d55d3e7bdc = oem-interop.toml uitvoeren in Kshana Studio

seg-5b70a59accce = aperture-duty-cycle.toml uitvoeren in Kshana Studio

seg-d3df277fd118 = space-weather.toml uitvoeren in Kshana Studio

seg-7dc863bf8f7b = impairment-eval.toml uitvoeren in Kshana Studio

seg-1c3083a77264 = conflict-resilience.toml uitvoeren in Kshana Studio

seg-b3f2b2d88d8c = gnss-ssv-shell.toml uitvoeren in Kshana Studio

seg-e42b759ccbaf = lunar-infrastructure-od-consistency.toml uitvoeren in Kshana Studio

seg-60a43431ebe0 = Eis

seg-cbf0f9bcd2d8 = Onafhankelijke referentie

seg-1603e76bcf66 = Identificatie van machtswetruis via lag-1-autocorrelatie

seg-d95fe5878ee3 = allan::lag1_noise_id: de lag-1-autocorrelatie-ruisidentificator van Riley en Greenhall ({ "2004" }) (gedecimeerde fase met verwijderde kwadratische term, of groepsgemiddelde frequentie met verwijderde lijn; herhaalde eerste differenties tot delta = r1/({ "1" }+r1) < { "0.25" } of d = dmax), die de gehele en de niet-afgeronde machtswetexponent alpha (+{ "2" } witte PM tot -2 random-walk-FM) teruggeeft bij elke middelingsfactor; hij bepaalt de vrijheidsgraden van het ruistype van de apparaatkaarten in de bibliotheek van gemeten klokken

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin en medewerkers, LGPL-3.0-or-later, door de fixturegenerator als afzonderlijk programma uitgevoerd): een onafhankelijke implementatie van het gepubliceerde Riley-Greenhall-algoritme, een eenduidig gedefinieerde grootheid onder de vermelde conventies. Toetst de identificator, niet de ruisinhoud van een echte klok

seg-aedf395f3597 = Authenticatie van navigatiedata aan ontvangerzijde met Galileo OSNMA

seg-1e6e62438dad = osnma + <c1/>: een open, in pure Rust geschreven verificatiemodule aan ontvangerzijde voor Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) uit I/NAV-pagina's of een u-blox UBX-RXM-SFRBX-stroom: publieke sleutels in een Merkle-boom (DSM-PKR), de ECDSA P-256/P-521-handtekening van de DSM-KROOT, verificatie van de TESLA-sleutelketen (SHA-256 of SHA3-256), MACSEQ- en tagverificatie (HMAC-SHA-256 of CMAC-AES) voor ADKD { "0" }, { "4" } en { "12" } met kruisauthenticatie, einde/herroeping/vernieuwing van de keten, vernieuwing en herroeping van publieke sleutels, en het alarmbericht; status per satelliet Authenticated/Failed/Unavailable met een reden voor elke mislukking of vertraging. Adviserend: geen typegoedgekeurde navigatieapparatuur en geen integriteitsdienst voor navigatie; er wordt geen prestatie tegen spoofing beweerd

seg-a6bd60ed728f = De officiële Galileo OSNMA-testvectoren die het European GNSS Service Centre publiceert als bijlage bij de Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } van { "18" } sets, { "186,382" } tags geauthenticeerd, { "0" } mislukt, offline uitgevoerd op 2026-10-10 (bewijsrecord in kshana-pro docs/evidence). Reikwijdte: de vectoren toetsen de cryptografische verificatie (Merkle, KROOT/ECDSA, TESLA-keten, MACK-tags, ADKD 0/4/12) en de uitkomsten daarvan op de gepubliceerde scenario's; ze gebruiken alleen HMAC-SHA-256, een SHA-256-keten, 128-bitsleutels, 40-bittags en opzoekvermeldingen { "33" } en { "34" }, dus CMAC-AES, SHA3-256-ketens en andere parameters worden alleen gedekt door gepubliceerde known-answer-tests van primitieven en synthetische tests. De verharding van vertrouwde tijd, databinding, verloop en headerbevestiging wordt getest met de synthetische aanvalstests, niet met een externe onafhankelijke referentie. Niet gecontroleerd: certificaatintrekkingslijsten, live signalen of een live ontvanger (de UBX-woordindeling is alleen op synthetische frames gecontroleerd), SHA3-256-Merkle-bomen, versheid zonder onafhankelijke tijd. Geen EU-dienst

seg-27a61718eb95 = Karakterisering van frequentiestabiliteit

seg-56174d771190 = Allan-/gemodificeerde/Hadamard-deviatie + identificatie van machtswetruis met χ²-BI's

seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32-referentiedeviaties op NBS14

seg-25b78672c194 = Frequentiestabiliteit op een echte gemeten klok

seg-fd378f5fe04a = Overlappende Allan- + overlappende Hadamard-deviatie op een echte cesiumstandaard

seg-64fd49d58394 = Stable32 overlappende ADEV/HDEV op de gemeten 5071A-cesiumfasereeks (allantools)

seg-f305dbc83f2b = Pariteit van de Allan-schatters op de canonieke Stable32-referentiereeks

seg-5bfca5dcfb7c = Overlappende Allan- + gemodificeerde Allan- + tijddeviatie over de volledige AF-ladder

seg-327ab6dcf16a = Stable32-referentiedeviaties voor PHASE.DAT (Riley; de standaard regressiereeks)

seg-96c4275f5a89 = Frequentiestabiliteit met uitgebreid bereik (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 en totale deviatie (TOTVAR) — schatters van de stabiliteit bij lange tau met uitgebreid bereik, die ~{ "75" }% van het record bestrijken waar de Allan-deviatie rond ~{ "50" }% uitgeput raakt; de van bias ontdane ThêoH-hybride (allan::theoh_curve) die erop is gebouwd blijft MODELLED

seg-a38edc2526f5 = allantools { "2024.06" } — een onafhankelijke bibliotheek van een derde partij voor frequentiestabiliteit — theo1 (NIST SP { "1065" } vgl. { "30" }) en totdev (NIST SP { "1065" } vgl. { "25" }) op de hermetische LCG-dataset van NIST SP { "1065" } §{ "12.4" }; offline opnieuw te genereren via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Maximum Time Interval Error (MTIE) — wandermetriek voor telecom

seg-5c54ba2748f7 = MTIE(τ): de maximale piek-tot-piek-zwaai van de tijdfout over elk schuivend venster van τ = m·tau0, de wanderstatistiek van ITU-T G.810/G.823/G.8261 waartegen de limieten van synchronisatienetwerken (MTIE-maskers) zijn geschreven — een extremale (max/min) maat, te onderscheiden van de RMS-familie van Allan

seg-300fd3f945a0 = allantools { "2024.06" } — een onafhankelijke bibliotheek van een derde partij voor frequentiestabiliteit — mtie() op de hermetische LCG-faseserie van NIST SP { "1065" } §{ "12.4" }; MTIE is een zuivere max/min-statistiek, dus de uitvoer van de schatter is bitexact gelijk aan allantools op de identiek opgebouwde fasearray (de vastgelegde referentieconstanten met 15 significante cijfers liggen binnen { "1" } ULP). Offline opnieuw te genereren via tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Gemodificeerde Allan- / tijddeviatie (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): de overlappende gemodificeerde Allan-deviatie (schatter met schuivend venster op tweede differenties die witte van flikkerfaseruis onderscheidt), en TDEV(τ) = τ/√{ "3" }·MDEV(τ), de wanderstatistiek in het tijddomein van ITU-T G.811/G.812/G.823 waartegen de synchronisatiemaskers zijn geschreven

seg-24a441f32375 = allantools { "2024.06" } — een onafhankelijke bibliotheek van een derde partij voor frequentiestabiliteit — mdev() en tdev() op de hermetische LCG-faseserie van NIST SP { "1065" } §{ "12.4" } (dezelfde serie als de rijen Theo1/TOTDEV/MTIE), die dezelfde eenduidig gedefinieerde schatters berekent; overeenkomend tot <{ "1e-9" } relatief. Offline opnieuw te genereren via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (De datagebonden phasedat_reference.rs controleert deze ook tegen Stable32 tot { "1e-3" }; dit is de strakke, altijd actieve hermetische kruiscontrole)

seg-e4b6d707cbf5 = Frequentiestabiliteit van een optische klok op een echte gemeten curve

seg-e9077554a08f = NNLS-herstel van een machtswet (witte FM + rode-ruisvloer) uit een gepubliceerde gemeten Allan-deviatie van de optische klokovergang van ⁸⁸Sr — dat σ_y(τ) en de kopschaling 4.7e-16/√τ bij korte τ reproduceert met een echte gemeten vloer bij lange τ, in plaats van de gesynthetiseerde vloer van optische klasse die holdover.rs anders aanneemt

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Fig. { "4" } gemeten ADEV; curve ongewijzigd overgenomen uit Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Beperkt tot het reproduceren van de gepubliceerde gemeten stabiliteitscurve — de apparaatcijfers voor holdover-tot-drempel per klokklasse blijven MODELLED

seg-cc95c8615d39 = Integriteit (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = ARAIM-oplossingsscheiding met meervoudige hypothesen volgens het ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels en add_v42_protection_levels_ecef: bepaling van deelverzamelingen met de regels P_THRES en FC_THRES, VPL, HPL, de effectieve monitordrempel EMT en sigma_acc); snapshot-RAIM-foutdetectie met chi-kwadraat en uitsluiting van één satelliet (raim::snapshot_raim, raim::snapshot_raim_fde) en op hellingen gebaseerde HPL/VPL op het geodetische lokale niveau; en de SBAS DO-229E-combinatie van beschermingsniveaus (sbas::sbas_protection_level) op de L1-dienst. NIET gedekt, helder gesteld: de gemaksfuncties met uniforme sigma raim::araim_raim en raim::araim_dual_raim zijn NIET conform de ADD (bij overeenkomende invoer wijken ze af van Stanford MAAST met { "0.75" } m VPL / { "4.04" } m HPL en { "0.39" } m VPL / { "1.93" } m HPL, een bevinding); de L5-SBAS-vergelijking met dubbele frequentie en meerdere constellaties (DFMC) is een bevinding ({ "308" } gebruikersepoche-paren zonder GEO in zicht worden door Kshana wel beschermd en door MAAST niet, waarvan Kshana de GEO-ontvangstpoort niet modelleert); raim::solution_separation_raim heeft geen externe vergelijking

seg-a83c68500982 = Drie onafhankelijke hulpmiddelen, vooraf vastgelegd (0123cee1) voordat er een fixture of orakeluitvoer bestond, met toen vastgezette toleranties. ({ "1" }) ARAIM: Stanford MAAST voor ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als afzonderlijk programma uitgevoerd onder GNU Octave { "8.4" } met een compatibiliteitsshim voor unique() aan de driverzijde (bekendgemaakt, geen algoritmewijziging), bij de ADD TOL_PL van { "0.05" } m: de Rust reproduceert de referentie-implementatie van de ADD op { "270" } echte gevallen. Bekendgemaakt: het ADD-pad van Kshana is geschreven na de preregistratie, volgens de ADD zoals MAAST die implementeert; een onafhankelijke achtergehouden set van de beoordelaar ({ "270" } nieuwe gebruikersgeometrieën en een tweede integrity support message, MAAST opnieuw uitgevoerd tegen de bevroren code) slaagde bij dezelfde drempel. ({ "2" }) Snapshot-RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde in een afzonderlijke C-harness voor detectie en uitsluiting; de helling-PL uit RTKLIB matinv/xyz2enu plus SciPy { "1.18.1" } chi2/ncx2, waarbij beide kanten dezelfde gesloten vorm evalueren (Brown; Parkinson en Axelrad), zodat de PL-controle de implementatie dekt, niet de formule. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, ongewijzigd, op de eigen vastgelegde WAAS-uitzendingen van MAAST: L1-niveaus binnen { "1e-4" } m na de herschaling met K en een gelijke beschermde verzameling. Dezelfde vergelijkingen leverden de bevindingen op die in de capability staan: de ARAIM-functies met uniforme sigma zijn niet conform de ADD, en de gelijkheid van de L5-verzameling faalt bij { "308" } paren zonder GEO in zicht (de niveaus bij de { "3267" } paren die beide hulpmiddelen beschermen komen overeen tot { "1e-13" } m). De K-factoren van DO-229E/DO-316 zijn overgeschreven constanten en de echte geometrie is een invoer; geen van beide telt als onafhankelijke referentie. Herziening { "0.30" }: de beschermingsniveaus van snapshot_raim zijn verplaatst van het radiale naar het geodetische lokale niveau (tot { "0.31" } m HPL en { "0.14" } m VPL bij { "16" } graden N)

seg-1c37702cc5f2 = Baanpropagatie en baanbepaling

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + verstoringen, batch-/sequentiële OD

seg-c84585f43297 = Verificatievectoren AIAA 2006-6753 voor SGP4

seg-50c545872e4f = Numerieke Cowell-propagator en krachtenmodel

seg-74f8c585bcfd = Numerieke Cowell-propagator met een hiërarchisch krachtenmodel (tweelichamen, zonale J2–J6, derde lichaam Zon/Maan, kanonskogel-SRP, exponentiële weerstand); RK4 met stapverdubbeling / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — een onafhankelijke bibliotheek, een andere integrator en sferisch-harmonische recursie. De conservatieve lagen (tweelichamen → zonale J2–J6 → derde lichaam Zon/Maan → kanonskogel-SRP) komen over een boog van { "24" } uur overeen tot onder de meter, wat de integrator + krachtenalgebra toetst; de weerstandslaag en de absolute getrouwheid van de efemeride van Zon/Maan en van de dichtheidsinvoer blijven MODELLED (alleen karakterisering)

seg-d38c4be472ac = SRP-schaduw voor afgeplatte Aarde (optioneel)

seg-ab8247c6b4d2 = SRP-verlichte fractie met het WGS-84-ellipsoïde als bedekkend lichaam (schijnbare aardstraal vanaf de ellipsoïdelimb richting de Zon, formule met dubbele schijf-lens; srp_shadow::oblate_conical_shadow), optioneel in het Cowell-krachtenmodel via propagator::ForceModel::srp_shadow (standaard: de sferische conische schaduw, ongewijzigd)

seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio met een WGS-84- en een sferisch OneAxisEllipsoid als bedekkend lichaam, als afzonderlijk programma uitgevoerd met de Zon op dezelfde inertiale positie vastgezet. Drempels vooraf vastgelegd in xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } op beide, en een spreiding van afgeplat versus bol van > { "1e-2" }; alle gehaald. De ellipsoïdeas is aan beide kanten de inertiale z-as (geen precessie-nutatie)

seg-01066d639b39 = Box-wing- en ECOM2-zonnestralingsdruk, met partiële afgeleiden (optioneel)

seg-2a5fc9708bd0 = Zonnestralingsdruk anders dan kanonskogel: een box-wing-model met vlakke platen (Vallado vgl. 8-44; eenzijdige lichaamspanelen, naar de Zon gerichte vleugels) met de tabellen voor Galileo FOC, IOV en IOV aan het einde van de levensduur uit de GSC-satellietmetadata, in nominale GNSS-yawsturing, met analytische partiële afgeleiden voor de stralingsfactor en de spiegelende en diffuse coëfficiënten van elk paneel; en het empirische model ECOM2 (D2/B1) met zijn partiële afgeleiden. De box-wing is optioneel in de Cowell-propagator (propagator::ForceModel::box_wing_srp, door het veld srp_boxwing in te stellen) en in het precieze baanbepalingsmodel (precise_od::PreciseForceModel::box_wing_srp), en vervangt de kanonskogelterm met cr als stralingsfactor; beide staan standaard op None, zodat elk bestaand pad byte-identiek blijft. ECOM2 is niet aangesloten op een krachtenmodel

seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft met FixedPanel en PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), GenericGNSS-nominale yaw en ECOM2(nD = { "2" }, nB = { "1" }), als afzonderlijk programma uitgevoerd met de Zon op vaste inertiale posities; de afgeleide van de stralingsfactor uit Hipparchus Gradient, afgeleiden per paneel als centrale differenties van Orekit (Orekit heeft die niet). Drempels vooraf vastgelegd in xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), voordat er enige Orekit-uitvoer bestond: { "1e-12" } relatief ({ "1e-11" } end to end, { "1e-9" } voor de differenties); alle gehaald (RESULTS.md). VALIDATED dekt alleen de modelevaluatie: de GSC-tabellen zijn overgeschreven invoer, en de geschiktheid van een box-wing voor echte Galileo-banen, thermische heruitstraling, de gemodificeerde yaw-wet bij lage bèta en eclipsbochten worden niet gedekt; de Galileo-SRP-voorspelling blijft MODELLED

seg-bde1b3a94a47 = Zonne-SRP-schaduw met randverduistering (optioneel)

seg-eaaec545dd68 = SRP-verlichte fractie als niet-bedekte fractie van de zonnestroom met randverduistering (wet in Eddington-benadering I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kwadratuur) over een sferische of WGS-84-Aarde (srp_shadow::limb_darkened_shadow, de ShadowModel-variant OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Geen extern: Orekit { "12.2" } heeft geen verlichtingsverhouding met randverduistering. Alleen gecontroleerd tegen gesloten vormen van dezelfde wet

seg-673b17e9dcf7 = Thermosferische dichtheid NRLMSISE-00

seg-09e997231de8 = Een port van de empirische thermosfeer NRLMSISE-00 (gtd7 en gtd7d: dichtheden per soort, totale massadichtheid met anomale zuurstof, temperaturen; de { "24" } schakelaars; modi met dagelijkse Ap en 3-uurlijkse ap-array) uit de C-versie in het publieke domein van de NRL-Fortran

seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, dat de NRL-Fortran GTD7D in enkele precisie uitvoert, en de C-port van NRLMSISE-00 (release { "20190709" }, publiek domein) gecompileerd als afzonderlijk programma, plus de { "17" } gepubliceerde testuitvoeren van de C-distributie. Drempels vooraf vastgelegd in xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) voordat de port bestond; alle gehaald (RESULTS.md). Toetst de port, niet de nauwkeurigheid van het model ten opzichte van gemeten dichtheid

seg-12977f65b2ea = Weerstandsdichtheidslaag NRLMSISE-00 (optioneel)

seg-17aec847b675 = forces::DensityModel (Exponential standaard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) en propagator::ForceModel::drag_density: kwadratische weerstand ten opzichte van de meeroterende atmosfeer met de NRLMSISE-00-dichtheid op het geodetische WGS-84-punt (aardrotatiehoek met UT1 = TT, lokale zonnetijd UT + lon/15), constant ruimteweer per model; standaard uit en bit-identiek

seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 met DragForce over de eigen NRLMSISE00-implementatie van Orekit, als afzonderlijk programma uitgevoerd met hetzelfde aardrotatiehoekstelsel, dezelfde WGS-84-vorm, dezelfde conventie voor lokale zonnetijd (een gemiddelde Zon) en TT als UT; de conventie-opzet is onafhankelijke referentie tegen onafhankelijke referentie gecontroleerd (Orekit versus pymsis, { "5.2e-5" } in dichtheid). Drempels vooraf vastgelegd in xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } van de weerstandsverplaatsing, en twee gevoeligheidscontroles van > { "100" } m; alle gehaald. Niet gedekt: de nauwkeurigheid van het model ten opzichte van gemeten dichtheid, tijdsvariërend ruimteweer, een GMAT-tak

seg-1ac7430e88fc = Standaard exponentiële weerstand tegen een onafhankelijke implementatie (equatoriaal)

seg-a9c41b03f2ca = De standaardweerstand van de Cowell-propagator: kwadratische weerstand ten opzichte van de meeroterende atmosfeer met forces::atmospheric_density, de stuksgewijs exponentiële tabel van Vallado Tabel 8-4 op de sferische hoogte (propagator::ForceModel::drag met de standaardvariant Exponential van forces::DensityModel)

seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole met de exponentiële atmosfeer (dezelfde tabel met 28 banden), puntmassa-Aarde en PrinceDormand78, uitgevoerd, nooit meegeleverd. Drempels vooraf vastgelegd in xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) op de weerstandsverplaatsing van elke kant (run met weerstand min run zonder weerstand), waardoor de twee mu-waarden van de Aarde en de integratoren wegvallen; alle gehaald (RESULTS.md). GMAT gebruikt geodetische hoogte en kshana sferische hoogte: die vallen alleen op de evenaar samen, dus VALIDATED dekt equatoriale banen; buiten de evenaar verschillen de modellen door ontwerp ({ "10.4" } % van de verplaatsing over { "24" } uur bij { "51.6" } graden, { "400" } km). De publieke build van GMAT heeft geen NRLMSISE-00 (plug-in ontbreekt), dus de NRLMSISE-00-laag heeft alleen de onafhankelijke referentie van Orekit. De nauwkeurigheid van de tabel ten opzichte van gemeten dichtheid wordt niet gedekt

seg-9e15970435c3 = DE440-Zon en -Maan in het Cowell-krachtenmodel (optioneel)

seg-de6831cf7785 = Optionele efemeridenlaag voor de termen van derde lichamen en SRP van het numerieke Cowell-ForceModel: de geocentrische Zon en Maan van elke EphemerisProvider (een DE440-SPK-kernel via KernelEphemeris) op TDB = TT + (TDB - TT), die een provider weigert die het epoche niet kan bedienen en elke terugval op de analytische reeks telt; standaard uit

seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 met ThirdBodyAttraction en SolarRadiationPressure op de eigen DE440-lezer van Orekit (orekit-data lnxp1990.440), als afzonderlijk programma uitgevoerd; kshana leest een bit-voor-bit, met SPICE gecontroleerd uitsnede van NAIF de440s.bsp. Drempels vooraf vastgelegd in xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). De baandrempel ({ "0.5" } m) en de gevoeligheidscontrole zijn gehaald, maar de drempel voor de positie van Zon/Maan ({ "3" } m / { "0.2" } m) is gemist met { "6.39" } m / { "0.244" } m. SPICE, dat dezelfde kernel op zijn exacte TDB leest, wijkt met hetzelfde bedrag van Orekit af ({ "6.25" } m / { "0.240" } m), dus het verschil zit tussen het de440s-pad van NAIF en de DE440-lezer of tijdschaal van Orekit; oorzaak niet geïsoleerd. Vastgelegd en vastgepind, dus de rij blijft MODELLED

seg-057c21daf4f2 = Atmosferisch getij S1 (optioneel)

seg-f600a39f297e = Het dagelijkse luchtdrukgetij S1 als geopotentiaalverstoring: model N1 van Biancale en Bode ({ "2006" }), graden { "2" } tot { "6" }, via de belastingformule IERS { "2010" } vgl. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), optioneel in de Cowell- en precieze krachtenmodellen (air_tide_s1, standaard uit)

seg-7dd9fccac779 = Geen extern voor het geopotentiaaleffect. De { "24" } coëfficiënten zijn overgeschreven uit GFZ STR06/01 Tabel { "1" } model N1 en rij voor rij opnieuw gecontroleerd tegen het rapport (SHA-256 890865ae); de graden { "0" }, { "1" }, { "7" } en { "8" } worden niet gebruikt. Ray en Ponte ({ "2003" }) drukken geen sferisch-harmonische tabel af, dus er is geen tweede bron vergeleken

seg-b150b1bdb599 = Coëfficiënten van het atmosferische getij S2 in de IERS-conventie

seg-87e9238b8c53 = Luchtdrukharmonischen S2 van Ray ({ "2001" }) (n <= { "4" }, prograde en retrograde) omgezet naar de volledig genormaliseerde vorm met sinusvoorloop van IERS { "2010" } vgl. 6.20-6.21 (amplitude gedeeld door N_nm, epsilon = { "90" } graden - psi) en toegepast als de S2-term van tides::atmospheric_tide

seg-4745148b6c60 = Biancale en Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Tabel { "5" }, model A2: Ray ({ "2001" }) gepubliceerd in volledig genormaliseerde harmonischen met fasen met sinusvoorloop, een onafhankelijke weergave van hetzelfde model. Vooraf vastgelegd in xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) samen met de fix die het toetst. Dekt alleen de coëfficiëntomzetting; het geopotentiaaleffect van het luchtgetij heeft geen externe onafhankelijke referentie

seg-444f0a65b6fd = Tesseraal geopotentiaal in de Cowell-propagator

seg-ad475816bc78 = Optioneel tesseraal EGM2008-veld (tot graad/orde { "70" }) als centrale zwaartekracht van het numerieke Cowell-ForceModel, geëvalueerd in een aardvast stelsel dat is geroteerd met de IAU { "2000" }-aardrotatiehoek (of de CIO-keten GCRS-naar-ITRS); standaard uit, dus geen bestaande uitvoer verschuift

seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 met HolmesFeatherstoneAttractionModel over dezelfde coëfficiënten (tools/egm2008_to70.gfc) in een lichaamsstelsel dat met dezelfde formule voor de aardrotatiehoek is geroteerd, als afzonderlijk programma uitgevoerd. Drempels vooraf vastgelegd (f0e0e65, gewijzigd vóór enige vergelijking in 2da899a): |dr| <= { "0.5" } m en |dv| <= { "5e-4" } m/s, en beide negatieve controles missen met > { "100" } m; alle gehaald, drempels daarna aangescherpt tot { "0.1" } m en { "1e-4" } m/s. Niet getoetst: getrouwheid van de aardoriëntatie (beide kanten gebruiken UT1 = TT zonder precessie-nutatie in het Era-stelsel), de Cio-stelseloptie (alleen interne controle), graden boven { "70" }

seg-e8f5ff8c9149 = Zwaartekracht met sferische harmonischen van hoge graad (EGM2008 tot { "2190" })

seg-d3b2f32dcecb = Underflow-veilige, poolveilige evaluatie van een volledig genormaliseerd veld tot graad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, gemodificeerde voorwaartse kolom van Holmes-Featherstone { "2002" } met de gradiënt vrij van 1/cos phi), een streamende ICGEM-.gfc-lader (from_gfc_file / from_gfc_reader; de volledige EGM2008 wordt tijdens het uitvoeren opgehaald, niet meegeleverd), en de Holmes-Featherstone-evaluator die kan worden gekozen op de optionele Cowell Geopotential

seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel en pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, als afzonderlijke programma's uitgevoerd; drempels vooraf vastgelegd in xval/high-degree-gravity/PREREGISTRATION.md (276c869f) en xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit komt overeen overal waar het is gedefinieerd, maar pyshtools mist zijn vooraf vastgelegde drempel op de twee punten dicht bij de pool (tot { "7.3e-10" } m/s^{ "2" }; een controle met mpmath met 50 cijfers legt de fout bij pyshtools), er is geen waarde van een onafhankelijke referentie precies op de poolas, en de vooraf vastgelegde gevoeligheidscontrole voor graad 70 van de baan van { "24" } uur is gemist ({ "0.726" } m tegen > { "1" } m). Elke misser is vastgelegd, niet weggeregeld, dus de rij blijft MODELLED

seg-e81b7418c382 = DOP853-integrator

seg-e6e3638aa68e = Expliciete Runge-Kutta DOP853 van Hairer { "8" }({ "5,3" }) met de gecombineerde foutschatter van 5e/3e orde, de stapregelaar van SciPy/Hairer, automatische beginstap, een fail-closed-stapbewaking en dense output van 7e orde; te kiezen als propagator-Integrator-variant Dop853 / propagator::propagate_dop853

seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) en zijn routines voor enkele stap, foutnorm, dense output en beginstap, een onafhankelijke implementatie; exacte tweelichamentoestanden uit mpmath { "1.3.0" } met { "40" } cijfers. Drempels vooraf vastgelegd in xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) vóór de eerste vergelijking; alle gehaald (xval/dop853-scipy/RESULTS.md). De eerste stap van SciPy wordt in de volledige runs aan beide oplossers gegeven; de beginstaproutine wordt afzonderlijk vergeleken. Niet gedekt: RKF7({ "8" }), stijfheidsdetectie, gebeurtenislokalisatie

seg-9ad7c1f4da77 = Robuuste oplosser voor de Kepler-vergelijking

seg-4b9d812fd13e = Elliptische Kepler-oplosser voor alle { "0" } <= e < { "1" } en alle middelbare anomalieën: kubische startwaarde en vijfdeordecorrectie van Markley ({ "1995" }), een annulatievrij residu (1-e)E + e(E - sin E) - M, en bewaakte Newton-verfijning (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause) wortels met 50 cijfers uit de exacte binaire invoer. Drempels vooraf vastgelegd in xval/kepler-mpmath/PREREGISTRATION.md (df22174), uitgedrukt ten opzichte van |E| met het conditioneringsargument e -> { "1" }, M -> { "0" }; alle gehaald (xval/kepler-mpmath/RESULTS.md). De oudere oplossers (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) zijn numeriek ongewijzigd, omdat vastgelegde uitvoer ervan afhangt, en worden niet door deze rij gedekt

seg-1960804ef2f4 = Batchbaanbepaling met range-rate en az/el met stationsmaskering

seg-4c185244bc66 = Herstel een epochetoestand uit gemengde tracking van afstand, range-rate en azimut/elevatie boven een elevatiemasker met Gauss-Newton op H = (dh/dx(t)) Phi(t, t0): analytische meetpartiëlen en een variationele toestandsovergangsmatrix met analytische partiëlen voor tweelichamen + J2 (met RK4 geïntegreerd, geen STM in gesloten vorm)

seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator met eigen instantane geometrische metingen RangeRate en AzEl (gecontroleerd tegen het TopocentricFrame van Orekit), als afzonderlijk programma uitgevoerd op identieke gemaskeerde, geseedde waarnemingen. Drempels vooraf vastgelegd in xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Elke drempel is gehaald behalve B4, de ruisvrije toestandsovereenkomst van { "1" } cm, die bij { "2" } van { "4" } scenario's is gemist ({ "1.46" }, { "1.74" } cm): de eigen ruisvrije schatting van Orekit ligt zo ver van zijn gesimuleerde referentie (oorzaak aan de kant van Orekit niet geïsoleerd). Vastgelegd en vastgepind, dus de rij blijft MODELLED. Niet gemodelleerd: lichttijd, aberratie, refractie, aardrotatie, een sequentieel filter voor deze meettypen

seg-bc3d1ee7c639 = Waarnemingsweging met de nauwkeurigheidscodes van SP3

seg-63b1fab84f85 = Zet SP3-nauwkeurigheidscodes (header ++ exponenten in { "2" }^n mm, de %f-basis, standaarddeviaties base^n mm per record) om in positiesigma's per waarneming voor de engine voor precieze baanbepaling (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Geen extern: de gewichten zijn een modelleringskeuze (het SP3-formaat definieert de code alleen als nauwkeurigheidsindicator van de producent; hier wordt hij gelezen als een eenmalige sigma per as). De bestaande vastgelegde agentschapsruns zijn ongewijzigd

seg-e35df6881c80 = Planetaire zwaartekrachtvelden uit PDS SHADR-tabellen

seg-f78b73ae8742 = Lees PDS SHADR-tabellen met sferische harmonischen (from_shadr, op SphericalHarmonicField in src/gravity_pds.rs: eenheidsomrekening, C00 = { "1" } aangeleverd, controles op volledigheid en normalisatie) en evalueer de lichaamsvaste zwaartekracht van Mars GMM-3 (d/o { "120" }) en het GRAIL-maanveld GL0660B (d/o { "660" })

seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) dat dezelfde PDS-bestanden leest en puntzwaartekracht evalueert, als afzonderlijk programma uitgevoerd, en de gepubliceerde headers en labels van de PDS-producten. Drempels vooraf vastgelegd in xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); alle gehaald (RESULTS.md). Data: NASA PDS Geosciences Node, publiek domein; crops van graad 20 meegeleverd met NOTICE, volledige bestanden worden tijdens de test opgehaald

seg-ae3e8833a5ef = Een gepubliceerd zwaartekrachtveld aan een lichaam koppelen

seg-ffb2b20e5f32 = with_gravity_field (op Body, in src/gravity_pds.rs): koppel elk geladen sferisch-harmonisch veld (bijvoorbeeld GMM-3 of GL0660B) aan een Body zodat de propagator het lichaamsvast evalueert; optioneel, standaardlichamen ongewijzigd

seg-bcb731f7a9b5 = Alleen interne consistentie. Elk gepubliceerd veld is gedefinieerd in het lichaamsvaste stelsel van zijn producent (GMM-3 in het Marsstelsel van Konopliv et al. { "2006" }, GL0660B in het hoofdasenstelsel van de maan DE421), terwijl het veld in het IAU-stelsel wordt geëvalueerd; de verschuiving is niet gemodelleerd

seg-659bfeba459c = Batch- en sequentiële baanbepaling

seg-dbc98f498941 = Herstel een epochetoestand [r,v] uit afstanden tot grondstations via een Gauss–Newton-batchdifferentiaalcorrector en een sequentieel filter, over een krachtenmodel van tweelichamen+J2

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — een onafhankelijke schattingsbibliotheek van een derde partij op een afgestemd krachtenmodel; de herstelde epochetoestand + de RMS van de residuen na de fit komen overeen tot <{ "1e-3" } m ruisvrij en <{ "3" } m bij een ruisvloer van { "5" } m

seg-acdac055acb9 = Radiometrische lichttijdoplosser voor de diepe ruimte

seg-62a478e40850 = Vertraagde (neerwaartse tak) eenweg-lichttijdoplossing τ = |r_rx − r_target(t−τ)|/c voor radiometrische navigatie in de diepe ruimte (Aarde→Mars/Zon/Maan)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) lichttijd met geconvergeerde Newtoniaanse aberratie (Aberration::CN; equivalent aan SPICE spkapo) over JPL DE440 — een onafhankelijke SPICE-implementatie in Rust; de vastepuntsoplosser met vertraging van kshana kwam overeen tot onder de nanoseconde. De bredere cijfers voor Doppler / Shapiro / OD met gereduceerde dynamica blijven MODELLED

seg-c69ef9342160 = Satellietpositie uit broadcast-efemeride (multi-GNSS RINEX)

seg-62702fc6f242 = Kepler-broadcast-efemeride van IS-GPS-200 / Galileo-OS / BeiDou-OS → ECEF-satellietpositie uit een geparsed RINEX-3-navigatierecord

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() gecompileerd uit C-broncode (T. Takasu, BSD-2-Clause) — een onafhankelijke implementatie van IS-GPS-200/SIS-ICD, gevoed met dezelfde RINEX-3-navigatierecords; ECEF-satellietpositie kwam overeen tot ~{ "62" } nm. (Interpolatie van SP3-precieze efemeriden wordt afzonderlijk getoetst — zie 'Interpolatie van SP3-precieze efemeriden')

seg-c807a782b20e = Interpolatie van SP3-precieze efemeriden

seg-238de70daab9 = Lagrange-interpolatie volgens de IGS-standaard van satellietposities uit SP3-precieze efemeriden met de aardrotatiecorrectie per knooppunt (roteer elk knooppunt met ω⊕·(t_node−t) naar het aardvaste stelsel van het opvraagmoment vóór de polynoomfit)

seg-e9249ae44a11 = RTKLIB peph2pos() gecompileerd uit C-broncode (preceph.c; T. Takasu, BSD-2-Clause) — de feitelijke IGS-referentie, een onafhankelijke implementatie; de interpolator van kshana (die nu dezelfde aardrotatiecorrectie per knooppunt toepast) kwam op een echt SP3-product overeen tot ~{ "15" } nm, tegen ~{ "5.5" } cm vóór de correctie

seg-9762cf428435 = Encoders voor navigatieberichten naast GPS LNAV (GPS CNAV, Galileo I/NAV en F/NAV)

seg-9b703b9607d8 = GPS CNAV-berichttypen 10/11/30, Galileo I/NAV-woordtypen 1-5 in nominale even/oneven pagina's en Galileo F/NAV-paginatypen 1-4: ICD-veldverpakking en kwantisatie, CRC-24Q, convolutiecodering met rate 1/2 K={ "7" } (G2 geïnverteerd voor Galileo), blokinterleaving en synchronisatiepatronen, met bijpassende testdecoders

seg-7939b210e83c = Interne round trip en known answers uit de ICD; er is geen decoder van een derde partij uitgevoerd (de harness voor RTKLIB/GNSS-SDR die KSHANA_NAVMSG_ORACLE_JSON leest, is datagebonden). MODELLED

seg-5ce7cd3d6011 = Lezer en interpolatie voor IONEX-wereldwijde ionosferische kaarten op een echte CODE-GIM

seg-502656556ddf = IONEX { "1.0" }-lezer (header, I5-waarden met vaste kolommen, TEC- en RMS-kaarten, absolute epochen, ontbrekende waarden) met bilineaire ruimtelijke interpolatie, de tijdinterpolatie van het formaat met nearest / opeenvolgend / geroteerde kaart (vgl. 1-3) en slant-TEC met dunne schil

seg-1575dc4cfb4a = De afgedrukte waarden van de CODE-GIM (exact in elk knooppunt; de kaart wordt tijdens de test opgehaald, niet meegeleverd, omdat de licentie onbevestigd is) en een onafhankelijke herimplementatie in Python-stdlib van de IONEX { "1.0" }-interpolatieformules die samen met de fixture is vastgelegd (drempels vooraf vastgelegd e4d8b1f, { "1e-9" } TECU). Controle door een derde partij (B6, vooraf vastgelegd, eerste run): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, als afzonderlijk hulpmiddel uitgevoerd) komt op { "6885" } opvraagpunten overeen met IonexFile::vtec_at tot { "3.6e-13" } TECU in beide interpolatiemodi, tegen een drempel van { "1e-5" } TECU. Datagebonden: CODE-GIM opgehaald tijdens de test, met SHA vastgepind; RTKLIB leest het volledige bestand omdat zijn getindex de breedte-crop weigert. tests/fixtures/ionex_code_gim/fetch.sh haalt het op en controleert de SHA-256, de test faalt bij alle andere bytes, en run_rtklib.sh is het gedocumenteerde reproductiepad (netwerktoegang nodig). Bevorderd tot VALIDATED door het besluit van de eigenaar op basis van datagebonden bewijs (2026-10-13)

seg-974d8c1f7876 = Hatch-draaggolfafvlakking van code op echte RINEX-waarnemingen

seg-f26b5da0f52e = Divergentievrij Hatch-filter (ionosfeervrije code gedragen door de ionosfeervrije draaggolf, venster van N epochen, herstart bij verlies van lock, geometry-free-sprong of gat) in de assemblage voor precieze single-point-positionering

seg-fac84cb9b256 = BEVINDING ten opzichte van de gepubliceerde ITRF2020-coördinaat van WTZR: de vooraf vastgelegde drempels (afgevlakte mediaan en p95 hoogstens { "0.6" } x ruw; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) zijn gemist, verhoudingen { "0.718" } en { "0.923" }; de resterende fout op metrisch niveau lijkt op een bias (C1C-codebias, antenne, getij, multipath met lange periode), niet op de witte ruis die afvlakking verwijdert. MODELLED: de statistieken van het filter zijn intern gecontroleerd

seg-2eec513ae8c8 = RTK-dubbele differenties met LAMBDA-vaststelling van geheeltallige waarden op echte RINEX-waarnemingen

seg-6571676bf918 = Relatieve positionering met korte basislijn uit echte tweefrequente GPS-code en draaggolffase: dubbele differenties ten opzichte van de hoogste satelliet met hun volledige covariantie, een float-Kalman-filter over de basislijn en de ambiguïteiten van enkele differenties met herinitialisatie bij slips, LAMBDA-geheeltallige kleinste kwadraten met de ratiotest, en de basislijn geconditioneerd op de vastgestelde gehele getallen

seg-e50c5d4b65c7 = Gepubliceerde ITRF2020-coördinaten van WTZR en WTZZ (IGN ITRF2020_GNSS.SSC, oplossing { "3" }, met de RINEX-antennehoogten) die de referentiebasislijn geven; drempels vooraf vastgelegd in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md vóór de code werd geschreven. Alleen korte basislijn: er worden geen ionosferische of troposferische dubbele differenties gemodelleerd

seg-f9aa0c529393 = PPP-tijdoplossing van de ontvangerklok tegen de definitieve stationsklok van IGS

seg-83ad9e893db9 = De ontvangerklok geschat door het statische float-PPP-filter op echte tweefrequente GPS-code en -fase met definitieve IGS-banen en -klokken: een tijdoverdracht van de ontvanger naar IGS-tijd, de ionosfeervrije PPP-tijdoplossing.

seg-91a882dd71e8 = De definitieve gecombineerde IGS-klok voor station WTZR (AR-records van IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, een combinatie van de netwerkoplossingen van meerdere analysecentra; IGS-producten, vrij gebruik met bronvermelding); drempels vooraf vastgelegd in xval/ppp-time/PREREGISTRATION.md vóór enige vergelijking; alle hielden stand bij de eerste run. WAT HET NIET IS: één station en één geconvergeerd venster van twee uur; IGS-tijd, niet UTC(k); de constante offset omvat codebiases van de ontvanger en is begrensd, niet gekalibreerd; geen traceerbaarheid naar Circular T.

seg-a9b2a93401a3 = Float precieze puntpositionering op echte RINEX-waarnemingen

seg-cc991ccec112 = Statisch float-PPP-extended-Kalman-filter op echte tweefrequente GPS-code en draaggolffase met definitieve IGS-banen en -klokken: ionosfeervrije combinatie, antenne-offsets van satelliet en ontvanger (variaties van de ontvanger), vaste-aardegetij, fase-wind-up, Shapiro-vertraging, geschatte zenitale natte vertraging, float-ambiguïteiten per boog met slipdetectie via geometry-free / Melbourne-Wübbena

seg-36e7c9286af7 = Gepubliceerde ITRF2020-coördinaat van WTZR (IGN ITRF2020_GNSS.SSC, oplossing { "3" }, gepropageerd met zijn snelheid) — drempels vooraf vastgelegd in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md vóór het filter werd geschreven; ontwikkeling alleen op het collocated station WTZZ. Niet gemodelleerd: oceaanbelasting, satelliet-PCV, vaststelling van geheeltallige ambiguïteiten

seg-c8d87abed330 = Lezen van RINEX { "4" }-navigatiebestanden

seg-28913a01af00 = RINEX 4.00-4.02-navigatiebestanden: <c1/>-records van GPS LNAV, Galileo I/NAV en F/NAV, BeiDou D1/D2 en QZSS LNAV gedecodeerd in het broadcast-efemeridetype; records van CNAV, CNV1-3, FDMA, SBAS, STO, EOP en ION overgeslagen tot de volgende recordheader; een record waarvan de header een andere satelliet noemt, of een afgekapt record, wordt geweigerd

seg-687b3b159691 = Het samengevoegde RINEX { "3" }-broadcastbestand van IGS van dezelfde dag (gepubliceerde data, geschreven door een andere bestandsgenerator uit dezelfde broadcastberichten); drempels vooraf vastgelegd in tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) vóór de eerste run

seg-278ca396127a = Lezen van RINEX { "4" }-waarnemingsbestanden

seg-e0883aa933eb = RINEX 4.0x-waarnemingsheaders (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; labels gematcht in kolommen 61-80 voor versie { "4" } en later) en epoche-records

seg-971fb1203a6d = Formaatcontrole op een echt gepubliceerd RINEX { "4.00" }-bestand (teruggelezen waarden zijn gelijk aan de afgedrukte literals van het bestand) en een uit de specificatie afgeleide header; er is geen onafhankelijke lezer uitgevoerd, dus MODELLED

seg-33e5c74720ff = Broadcast-satellietpositie van BeiDou GEO

seg-44b61449b65a = Positie van een geostationaire satelliet volgens BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } uit een broadcast-efemeride (quasi-inertiaal stelsel, dan Rz(Ω̇e·tk)·Rx(−{ "5" }°)), optioneel via het veld include_beidou_geo van NavParseOptions, zodat de standaardlezer GEO's nog steeds overslaat

seg-06d500099814 = Vooraf vastgelegd (7aa264b, 110fef9) tegen een precieze IGS MGEX-baan met de GEO's; zo'n product was niet bereikbaar vanuit de sessie die het bouwde, dus de vergelijking staat nog open en de rij is MODELLED (alleen gecontroleerd tegen de gepubliceerde nominale GEO-slots)

seg-559814996a4c = Interpolatie van SP3-precieze klokken

seg-8e7a0dbd1755 = Satellietklokoffset tussen de getabelleerde SP3-klokknooppunten door lineaire interpolatie over de twee omsluitende geldige knooppunten (het schema pephclk van RTKLIB; sentinel voor slechte klok overgeslagen), en dezelfde knooppunten als records equivalent aan RINEX-klokken aan de keten van precieze producten gevoerd

seg-1f4f0f841802 = Definitieve IGS-combinatie van satellietklokken met { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): gepubliceerde klokschattingen op de opvraagmomenten, niet geïnterpoleerd uit de SP3; drempels vooraf vastgelegd in tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md vóór de eerste run (RMS { "0.15" } ns, p95 { "0.30" } ns, mediaan van knooppunten { "1e-12" } s, discriminatie 2x)

seg-71f48628ebb2 = Strak gekoppelde GNSS/INS met draaggolffase en float-ambiguïteiten

seg-5a156aa81275 = Foutentoestands-EKF over { "15" } INS-toestanden, een ontvangerklok met twee toestanden en één float-draaggolfambiguïteit per gevolgde satelliet; pseudorange, draaggolffase en optionele range-rate uit een SGP4-Walker-constellatie (lichttijd en Sagnac), correcties van Klobuchar en Saastamoinen/Niell toegepast in de lus op de eigen positie van het filter; slipdetectie met tijdgedifferentieerde draaggolf met een drempel per satelliet die wordt verruimd door de snelheidsonzekerheid; herinitialisatie van ambiguïteiten bij slips en heracquisitie

seg-00576e8c1032 = Interne consistentie: de metingen worden gesynthetiseerd uit de modellen die het filter gebruikt (χ² NEES/NIS over seeds, een ruisvrije convergentie, slipinjectie). MODELLED; er worden geen echte ontvangerdata of filter van een derde partij vergeleken

seg-7d644516b1ec = GNSS/INS-pakketten voor maritiem, spoor en luchtvaart met een optie voor strakke koppeling

seg-cbb03a8baf73 = Drie gnss-ins-scenario's op de trajectbibliotheek (een vaartuig dat met { "8" } m/s slingert met een uitval van vijf minuten; een trein door een inkarteling met twee satellieten en een tunnel; een vliegtuig waarvan de uitval een bocht met 25 graden helling beslaat) en de optionele [tight]-tabel van het pakket: pseudoranges uit een SGP4-Walker-constellatie samengevoegd door de gesloten-lus-navigator, elke satelliet boven het masker bij nominaal en de hoogste enkele bij gedegradeerd

seg-273c14256d4c = Intern: de kwaliteitsmaten van elk pakket tegen zijn eigen referentie en een vergelijking los/strak op identieke invoer. MODELLED; de NaveGo-vergelijking van de audit is niet uitgevoerd

seg-f4dab73c4eda = Gekoppeld PNT-filter met pseudoranges met biastoestand en 3D-uitbreiding in het fusiepakket

seg-742b60089361 = Eén gestapeld Kalman-filter over positie, snelheid, klokfase en -frequentie, gevoed met pseudoranges die positie en klok koppelen (updates in Joseph-vorm met de kruiscovariantie); een 1-DOF-variant aangevuld met een toestand voor een constante versnellingsmeterbias die het fusiepakket onder [coupled] draait; en de 3D-versie met 8 toestanden met line-of-sight-rijen

seg-9558d7aad3af = Interne consistentie: referentie gesimuleerd uit de eigen modellen van de filters (χ² NEES over Monte Carlo-seeds, het ontkoppelde pakket op identieke sensoren). MODELLED

seg-4a64aa1fe3ca = Los gekoppelde GNSS/INS-EKF met hefboomarm op de KF-GINS-dataset

seg-30f503856ac5 = De gesloten-lus-foutentoestands-EKF met 15 toestanden, aangedreven door IMU-incrementen, waarbij GNSS-antenneposities worden samengevoegd via het hefboomarmmodel H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], geconfigureerd uit een KF-GINS-YAML-bestand (beginstoestand en sigma's, ARW/VRW, Gauss-Markov-biases)

seg-b01d28a09abe = Het gepubliceerde referentietraject van de dataset en het KF-GINS C++-programma (GPL-3.0, commit 8291a93e, als afzonderlijk hulpmiddel uitgevoerd); drempels vooraf vastgelegd in xval/kfgins/PREREGISTRATION.md, en KF-GINS is vóór die vastlegging niet op deze data uitgevoerd (gecontroleerd in de Results). Alle zes drempels hielden stand bij de eerste run. DATAGEBONDEN: de KF-GINS-demodataset (echte Leador-A15-IMU en RTK-GNSS met een referentietraject) heeft geen licentie, dus wordt niet meegeleverd; xval/kfgins/fetch.sh haalt hem tijdens de test op met de SHA-256 van elk bestand vastgepind, en de test faalt bij een afwijking; het reproductiepad, waarvoor netwerktoegang nodig is, staat in xval/kfgins/PREREGISTRATION.md. Bevorderd tot VALIDATED door het besluit van de eigenaar op basis van datagebonden bewijs (2026-10-13)

seg-e6b6c605564c = Testbench-export gelezen door de bewegingsbestandslezers van een simulator (gps-sdr-sim)

seg-a07429aa1998 = De bewegingsbestanden van de bench-export, aangeboden aan de eigen lezers van een opensource-GNSS-simulator, komen terug als het geëxporteerde traject: het NMEA GGA-bestand (-g), de snede tijd/breedte/lengte/hoogte van de beweging-CSV (-x) en de snede tijd/x/y/z (-u), op { "6" } gnss-ins-scenario's (inclusief de maritieme, spoor- en luchtvaartpakketten, gelezen tot de limiet van 3000 samples van de simulator) en { "2" } stationaire. Alleen beweging; er wordt geen signaal geschreven of gegenereerd.

seg-07b5f46a900f = WAT EXTERN IS GECONTROLEERD, nauw gesteld: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion en readUserMotionLLH met zijn eigen WGS { "84" } llh2xyz, aangeroepen via xval/testbench-gpssdrsim/driver.c (geen signaalfunctie aangeroepen), rij voor rij tegen de aardvaste kolommen van de beweging-CSV, met drempels vooraf vastgelegd in xval/testbench-gpssdrsim/PREREGISTRATION.md vóór enige run: elke sample gelezen op alle { "8" } scenario's; NMEA slechtste { "1.21" } mm (drempel { "1" } cm); LLH-snede slechtste { "0.145" } mm (drempel { "1" } mm); aardvaste snede met vier kolommen exact (drempel { "1" } um, wijziging { "1" }); gnss-ins-rijen op het { "10" } Hz-raster van de simulator tot { "2.3e-13" } s. BEVINDING (run { "1" }, vastgepind): de CSV over de volledige breedte zonder header is niet leesbaar door -u, omdat de regelbuffer van 100 tekens van de lezer elke rij van 161 tekens in twee samples splitst; docs/TEST-BENCH.md geeft de snede met vier kolommen. WAT HET NIET IS: de fysica van het referentietraject van het scenario; de signaaluitvoer van gps-sdr-sim; de lezer van enige andere simulator; enige ontvanger.

seg-2db2b9dc3b45 = GNSS/INS-trajectbibliotheek en import van CSV-referentie

seg-e1fe83c75a6c = Te kiezen bewegingsprofielen voor het gnss-ins-pakket (recht, figuur-8, stedelijk stop-en-go, vliegtuigklim en gecoördineerde bocht, survey-drone), gedefinieerd door commando's voor Euler-snelheid en versnelling langs het spoor die op de referentietoestand worden gesloten met de kinematische IMU (centripetale, zwaartekracht- en Coriolistermen), en geïmporteerde CSV-referentie omgezet in de IMU die haar reproduceert; de historische rit blijft ongewijzigd als er geen profiel is opgegeven

seg-30ea002a06a0 = Intern: identiteiten uit de kinematica van starre lichamen, de CSV-round trip en de eigen covariantie van het filter. MODELLED (er is geen echt ritlogboek vergeleken)

seg-8685fd899e3c = Strapdown-INS-mechanisatie

seg-ba942e322f8a = Strapdown-inertiële mechanisatie met quaternionattitude in WGS-84 NED (met coning/sculling-compensatie) die een navigatietoestand propageert uit (Δθ, Δv)-incrementen

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) onder Octave uitgevoerd — een onafhankelijke gepubliceerde INS-toolbox, aangedreven door dezelfde stroom (Δθ,Δv)-incrementen. De attitude komt bit-voor-bit overeen (dezelfde conventies voor NED / scalar-first-quaternion / aardrotatie / transportsnelheid); snelheid/positie komen overeen op twee gedocumenteerde verschillen na — de noordelijke zwaartekrachtterm door loodlijnafwijking die NaveGo meeneemt en kshana bewust weglaat (loodlijnzwaartekracht; tot elk cijfer gelijk aan de gesloten vorm van Groves, met een sanity-floor-assert) en O(dt²)-verschillen in de integrator — geen mechanisatiefouten

seg-d1a5c8e7ca74 = Functionaalsynthese van het zwaartekrachtveld (zwaartekrachtgesteunde / GNSS-vrije navigatiekaart)

seg-8336eb12eb7b = Zwaartekrachtgrootte + verstoring met sferische harmonischen (mGal) uit elk ICGEM-.gfc-model; normale zwaartekracht GRS80

seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) normale zwaartekracht van Somigliana + gepubliceerde γ_e/γ_p; echt ICGEM EGM2008-veld

seg-86f9186bb884 = Aarde-Maan-CR3BP { "9" }:{ "2" }-NRHO tegen de baan die CAPSTONE vloog

seg-d4127cf241f3 = De circulair-beperkte zuidelijke L2-halobaan { "9" }:{ "2" } met bijna rechtlijnige baan die cr3bp::differential_correct_halo corrigeert (de baanfamilie van Gateway en CAPSTONE), vergeleken op zijn gemiddelde geometrie (periode, perilune-straal, apolune-straal) met de baan die CAPSTONE werkelijk vloog. Een meting van hoe goed het CR3BP-lid de echte baan beschrijft; een CR3BP-baan is geen baan uit een efemeridenmodel en wordt niet epoche voor epoche vergeleken

seg-e0cc33dfb10b = Gemeten tegen de door JPL Horizons gereconstrueerde CAPSTONE-efemeride (NAIF -1176, CAPSTONE_merged, maancentrisch ICRF, 2023-03-01..31 met { "10" } min), byte voor byte vastgelegd (tests/fixtures/capstone_horizons/, NOTICE.md), vooraf vastgelegd { "4e868170" } voordat zij werd opgehaald, als meting met drempels op de gemiddelde geometrie. Geen validatie: de CR3BP laat de Zon, de excentriciteit van de Maan en de stationkeeping die CAPSTONE uitvoerde weg, dus de drempels beschrijven hoe representatief de modelbaan is, geen nauwkeurigheid. Resultaten: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-c866a5bd4318 = CR3BP-roterende toestanden afgebeeld op maancentrisch ICRF op de Aarde-Maan-lijn van DE440

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf beeldt een dimensieloze roterende Aarde-Maan-CR3BP-toestand af op een maancentrische ICRF-positie en -snelheid op de ogenblikkelijke Aarde-Maan-lijn (lengte-eenheid de afstand Aarde-Maan, tijdseenheid de inverse baansnelheid, de volledige hoeksnelheid van het stelsel inclusief zijn snelheid buiten het vlak uit de versnelling van de Maan), met de inverse from_moon_centred_icrf, en cr3bp::to_moon_centred_icrf_de440 leest de geocentrische maantoestand uit een DE440-SPK. Het beeldt toestanden af; het maakt van een CR3BP-baan geen baan uit een efemeridenmodel

seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) sxform van een dynamisch stelsel met twee vectoren (primair +X langs de positie van de Maan ten opzichte van de Aarde, secundair +Y langs zijn snelheid, de440s), toegepast op de dimensionele roterende toestand opgebouwd uit de eigen maantoestand van SPICE, door een afzonderlijk programma dat geen Kshana-code aanroept (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Vooraf vastgelegd 2313eb1b, vóór enige run gewijzigd in d5ef79b3 om de hoeksnelheid buiten het vlak van het stelsel op te nemen (zonder die zou de snelheid tot { "8e-2" } m/s afwijken). Alleen een bibliotheekcontrole van de transformatie. Resultaten: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

seg-d543e3e84f36 = Zonnestelsel-kind op een JPL-kernel (planetary_kernel_path)

seg-e8a96f29afc7 = Het <c1/> kind met planetary_kernel_path: elk gerapporteerd lichaam waarvan de eigen NAIF-code in de SPK staat, neemt zijn heliocentrische J2000-positie en -snelheid uit de kernel via de eigen lezer van de engine (label KERNEL), een verbinding waarvan beide uiteinden in de kernel staan wordt erop berekend, barycentra worden nooit in de plaats van een planeet gebruikt, en elk ander lichaam blijft analytisch met zijn eigen label; het rapport krijgt alleen een kernelblok (pad, SHA-256, de lichamen en verbindingen die eruit zijn genomen) als de optie is ingesteld. Met de440s.bsp zijn dat Mercurius, Venus, de Aarde en de Maan

seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) spkezr heliocentrische toestanden op de volledige de440s.bsp, een afzonderlijk programma dat geen Kshana-code aanroept (tests/fixtures/solar_system_kernel/, NOTICE.md); de engine leest bit-voor-bit uitsneden van de440s. Vooraf vastgelegd f8e946ea. Een bibliotheekcontrole van de aansluiting: DE440 zelf en de analytische lichamen worden hier niet getoetst. Resultaten: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

seg-7f3d53b4e8d1 = Porkchop op de DE440-efemeride

seg-bd813d7e0b58 = maneuver::porkchop_kernel: de sweep over lanceerdatum x aankomstdatum van vertrek-C3 (km²/s²) en aankomst-V-oneindig (km/s) met de prograde Lambert-oplosser voor één omloop en de collineariteitsbewaking van { "0.5" } graden, op de heliocentrische J2000-toestanden van twee willekeurige NAIF-lichamen die door de eigen lezer van de crate uit een JPL DE440-SPK zijn gelezen. Eén omloop, prograde, geen beperkingen van draagraket of aankomst: een sweep, geen missieontwerp

seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) heliocentrische toestanden op de440s.bsp en pykep { "3.0.1" } lambert_problem (ESA, de C++-kern kep3, MPL-2.0), een onafhankelijke Lambert-oplosser, als afzonderlijk programma uitgevoerd dat geen Kshana-code aanroept (tests/fixtures/porkchop_de440/, NOTICE.md); de engine leest een bit-voor-bit uitsnede van de440s. Vooraf vastgelegd 2d857fb1. Een bibliotheekcontrole van de sweep. Resultaten: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

seg-b1401bed5da8 = Optimalisator voor impulsieve transfers op de DE440-efemeride

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: de vertrek- en aankomstdata van een ballistische transfer met twee impulsen en één omloop die vertrek-C3 of aankomst-V-oneindig minimaliseren binnen Type I of Type II, als continu optimum (een raster van 2 dagen over beide vensters, daarna 2D Nelder-Mead), op heliocentrische toestanden uit de DE440-SPK. Een data-optimalisator voor één traject, geen missieontwerp: geen opties voor draagraket, parkeerbaan, manoeuvres in de diepe ruimte of meerdere omlopen

seg-6c695aef043b = Een onafhankelijke optimalisator: NAIF SPICE Toolkit (CSPICE N0067 via spiceypy { "8.3.0" }) heliocentrische toestanden op dezelfde uitsnede van de440s, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) en SciPy { "1.18.1" } Nelder-Mead, zonder Kshana-code aan te roepen. Het NASA-handboek Aarde-naar-Mars (MIDAS, efemeride niet vermeld, datumraster van 2 dagen) is een secundaire gepubliceerde referentie en bepaalt de status niet

seg-93f3cdbb7297 = Lambert-transferoplosser voor meerdere omlopen

seg-995a6a995b78 = Elke oplossing van het probleem van Lambert met maximaal drie volledige omlopen (maneuver::lambert_multirev: de oplossing voor één omloop, dan de linker en rechter tak van elk aantal omlopen, Izzo { "2015" }), met de randsnelheden v1 en v2, voor prograde en retrograde transfers, in canonieke en heliocentrische SI-eenheden, inclusief transfers binnen { "1" } % van de minimale vliegtijd van een aantal omlopen en geometrieën dichtbij 180 graden. Alleen een tweelichamenoplosser (geen verstoringen)

seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, de C++-kern kep3, MPL-2.0), een onafhankelijke bibliotheek, als afzonderlijk programma uitgevoerd door scripts/gen_lambert_multirev_ref.py; alleen de numerieke uitvoer is vastgelegd. Vooraf vastgelegd a75de851 (gevallenset, drempels, uitkomstregel) vóór enige vergelijking; de referentie is onafhankelijk opnieuw gegenereerd en is byte-identiek. Resultaten: docs/design/evidence/lambert-multirev/RESULTS.md

seg-ff9c6140fe1c = Lambert-tweelichamentransferoplosser

seg-d8c39ced64b2 = Lambert-oplosser van Izzo-2015 voor één omloop (r1, r2, vliegtijd → randsnelheden) over LEO→GEO→heliocentrische transfers, prograde en retrograde

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — een onafhankelijke Lambert-oplosser van een derde partij. Het Lambert-probleem voor één omloop (M={ "0" }) heeft een unieke oplossing, dus overeenstemming tussen bibliotheken is een echte externe controle; overeenkomend tot <{ "1e-4" } m/s (waargenomen ~{ "1e-11" }), dezelfde soort toetsing die DOP krijgt ten opzichte van gnss_lib_py

seg-347cece5df63 = Referentiestelsels en tijdschalen

seg-5a4bc2c15eaa = IAU 2006/2000A-precessie-nutatie, CIO GCRS↔ITRS, tijdschalen met schrikkelseconden

seg-51d28ab9d256 = IAU SOFA / ERFA-referentievectoren; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Tweedelige juliaanse data en schrikkelseconden op het tijdpad van de aardbaan

seg-5e859e3aa613 = Een UTC-kalenderdatum en -tijd naar een tweedelige juliaanse UTC-datum met de SOFA-conventie dtf2d voor dagen die op een schrikkelseconde eindigen ({ "86 401" } s lang, { "23" }:{ "59" }:{ "60" }.x geldig), UTC naar TAI en terug, en UT1 uit UTC via TAI, op tweedelige data vanaf 1972-01-01: het tijdpad dat SGP4 (Sgp4::propagate_at, gemeten vanaf een tweedelige epoche) en de aardvaste rotatie van IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop met de tweedelige aardrotatiehoek) nemen

seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; de SOFA-algoritmen zoals door het ERFA-project uitgebracht), een onafhankelijke bibliotheek: erfa.dtf2d("UTC"), erfa.utctai en erfa.taiutc op de vastgelegde momenten, het verschil deel voor deel gevormd op de tweedelige data, drempel { "1e-6" } s vastgezet vóór de run (vooraf vastgelegd e947e69d). Slechtste verschil { "9.6e-12" } s (dtf2d) en { "1.9e-11" } s (utctai, taiutc). Elke UTC-dag als { "86 400" } s nemen, of de fractie van de schrikkeldag ongeschaald laten, maakt de test rood. UT1 via TAI (iauUtcut1) wordt gecontroleerd door de ERFA-tak van de rij over het aardbaanpad. Reikwijdte: UTC vanaf 1972-01-01; de eerdere UTC met driftende snelheid is niet gemodelleerd

seg-f1c7bc235a6b = Tweedelige juliaanse data via aardrotatie op het baanpad

seg-cee11d4bad08 = Aardrotatie uit een tweedelige juliaanse UT1-datum op het baanpad, zodat de aardvaste positie de microseconde behoudt die een enkele f64-datum verliest (ongeveer { "3e-9" } rad rond { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, de TEME-conventie, op de twee delen), cio::gcrs_to_itrs_matrix_jd2 (de CIO-matrix GCRS naar ITRS met de aardrotatiehoek uit de twee delen), en, daarop gebouwd en intern gecontroleerd, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 en own_jd2_utc, de optionele two_part_jd van het efemeridenscenario (de ECEF-positie, het grondspoor en het stationsbeeld; standaard uit, ongewijzigd), en verliesvrije From-conversies tussen jd2::Jd2 en timescales::TwoPartJd. Precessie-nutatie en de epoche van het Cowell-krachtenmodel blijven enkele f64, waar een afronding van { "40" } us onder { "1e-15" } rad ligt of ver onder de fout van de analytische Zon/Maan-efemeride

seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; de SOFA-algoritmen zoals door het ERFA-project uitgebracht), een onafhankelijke bibliotheek: gmst82 en c2t06a op de vastgelegde tweedelige data, poolbeweging { "0.1" } en { "0.3" } boogseconden. Vooraf vastgelegd b10475ee (data, drempels) voordat de functies werden geschreven en voordat de onafhankelijke referentie werd uitgevoerd. De interne tests (de scenario-optie, de TEME/ITRF-round trip, de typeconversies) zijn ondersteunende zelfconsistentie

seg-096df3971f5f = Stelselmatrices tegen ERFA-vectoren: IAU { "2006" }-biasprecessie, TEME naar GCRS, en de CIO-keten met hemelpooloffsets

seg-731a5ed967b3 = Drie stelselmatrices element voor element of op rotatiehoek vergeleken met ERFA op willekeurige epochen: precession::precession_matrix (IAU { "2006" }-biasprecessie met Fukushima-Williams-hoeken), nutation::teme_to_gcrs_matrix (de rotatie TEME naar GCRS P^T N^T Rz(-EE) met IAU { "2006" }-precessie, IAU 2000B-nutatie en de equinoxvergelijking met zijn twee voornaamste complementaire termen), en cio::gcrs_to_cirs_matrix_with_offsets (de rotatie GCRS naar CIRS met de IERS-hemelpooloffsets dX, dY opgeteld bij de model-CIP X, Y vóór de rotatie, de conventie van het SOFA-kookboek; nieuw). De modelkeuzes zelf (2000B-nutatie op het TEME-pad, de complementaire reeks met twee termen) zijn niet getoetst, alleen hun implementatie

seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; de SOFA-algoritmen zoals door het ERFA-project uitgebracht), een onafhankelijke bibliotheek: pmat06; numat(obl06, nut00b) met de equinoxvergelijking uit eect00 (de volledige complementaire reeks), samengesteld als P^T N^T Rz(-EE); xys06a dan c2ixys(X + dX, Y + dY, s). Vooraf vastgelegd 979c1e39 (epochen, offsets en drempels) voordat de onafhankelijke referentie werd uitgevoerd. Het TEME-residu van { "1.1e-10" } rad is het voorspelde effect van het behouden van twee complementaire termen (ongeveer { "3" } mm op een GNSS-baan)

seg-4e2fe2e3dabb = UTC van vóór 1972 (tijdperk met driftende snelheid) op het tijdpad met tweedelige juliaanse data

seg-1d086e669f09 = UTC van 1960-01-01 tot 1971-12-31, toen UTC met een offsetsnelheid ten opzichte van TAI liep en in fracties van een seconde werd gestapt, op het pad met tweedelige juliaanse data: TAI - UTC uit de drifttabel van elke periode (timescales::tai_minus_utc_on_date), de UTC-kalenderdatum naar een tweedelige juliaanse UTC-datum met de daglengte { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC naar TAI met de dagfractie geschaald van UTC naar SI-seconden (jd2::utc_to_tai) en TAI terug naar UTC (jd2::tai_to_utc), volgens SOFA dtf2d, utctai en taiutc. Vóór { "1960" } wordt TAI - UTC als { "0" } genomen (de waarde van SOFA; UTC niet gedefinieerd) en valt buiten de bewering. De enkele-f64-functie timescales::tai_minus_utc begrenst nog steeds op { "10" } s vóór { "1972" } en wordt niet gedekt

seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; de SOFA-algoritmen zoals door het ERFA-project uitgebracht), een onafhankelijke bibliotheek: erfa.dtf2d("UTC"), erfa.utctai en erfa.taiutc op de vastgelegde momenten, het verschil deel voor deel gevormd. Vooraf vastgelegd 23c40661 (momenten, tolerantie en de controlesom voor { "1972" }+) vóór de enginewijziging en voordat de onafhankelijke referentie werd uitgevoerd. De drifttabel is overgeschreven uit dezelfde SOFA-iauDat-tabel die de onafhankelijke referentie gebruikt, dus de vergelijking dekt de rekenkunde van de conversie (daglengte, schaling van UTC naar SI, iteratie), niet de historische tabel zelf

seg-efacec095051 = GLONASS-broadcast-satellietklok en propagatie van de broadcast-baan

seg-821b9c01b56e = De GLONASS-broadcast-satellietklokbias -tau_n + gamma_n (t - t_b) op een tijd gelezen op de satellietklok (glonass::GlonassEphemeris::sv_clock_bias_s, de voor de klokbias gecorrigeerde offset door twee vastepuntsiteraties), en de PZ-90-aardvaste positie van de broadcast-toestandsvector, gepropageerd met RK4 via de bewegingsvergelijkingen uit de GLONASS-ICD binnen +/-15 min van de referentie-epoche (GlonassEphemeris::position_ecef), uit echte RINEX { "3" }-GLONASS-navigatierecords. Er wordt geen transformatie van PZ-90.11 naar ITRF toegepast (ze komen sinds { "2014" } op centimeterniveau overeen; RTKLIB past er ook geen toe). Niet aangesloten op een scenario-uitvoer: bibliotheekfunctie

seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk en geph2pos, gecompileerd uit C-broncode in een afzonderlijke harness (xval/rtklib-glonass) die hetzelfde RINEX-bestand met de eigen lezer van RTKLIB leest, zodat de parsing, het teken van -tau_n, de eenheden en de iteratie net zo goed worden vergeleken als de klok en de baan. Vooraf vastgelegd e099c42a voordat de functie bestond en voordat de harness werd gebouwd. Beide kanten evalueren dezelfde gesloten vorm van de klok, dus de klokvergelijking dekt de implementatie, niet de formule. De baanintegratoren verschillen (RTKLIB stapt { "60" } s en dan de rest, Kshana gelijke stappen van hoogstens { "60" } s) en de constanten ook (RTKLIB mu { "3.9860044e14" }, Kshana de PZ-90.11 { "3.986004418e14" }); het slechtste geval van { "1.1" } mm is dat verschil, zoals vóór de run voorspeld. Reikwijdte: de broadcast-efemeride binnen zijn geldigheidsinterval, niet de ware baan of klok (geen vergelijking met precieze producten)

seg-d3b72a6fbb18 = Eén aardbaanpad: SGP4-elementensets naar de GCRS en ITRS op de IAU 2006/2000A-keten met aardoriëntatieparameters

seg-e4eca7205b5e = Het propagatie- en stelselpad dat elk gerouteerd aardbaan-kind deelt: een SGP4-gemiddelde elementenset met een tweedelige UTC-epoche (sgp4::MeanElementSet, gelezen uit constellatieontwerpelementen door MeanElementSet::from_earth_fixed) gepropageerd door SGP4/SDP4 naar TEME (sgp4::SgpOrbit), en de rotaties TEME -> ITRS en GCRS -> ITRS van de IAU 2006/2000A-keten met UT1 - UTC en poolbeweging (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, de nulparametervormen teme_to_itrs_matrix en gcrs_to_itrs_matrix). TEME is de ware evenaar van de datum met de gemiddelde equinox, bereikt vanuit de GCRS via de IAU { "2006" }-biasprecessie, de IAU 2000B-nutatie en de equinoxvergelijking

seg-44f28276f859 = Tak { "1" }: python-sgp4 { "2.24" } (MIT-licentie; de referentie-C++-SGP4 van D. Vallado, de code die de verificatievectoren AIAA 2006-6753 voortbracht), WGS-72, verbeterde modus. Tak { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, de SOFA-routines): c2t06a met TT uit utctai/taitt en UT1 uit utcut1, en voor TEME c2t06a . pnm06a^T . rz(-ee06a). Drempels vastgezet vóór de run (vooraf vastgelegd 72ea9eb0). Bekendgemaakt: de eerste run faalde in tak { "2" } op 2016-12-31T23:{ "59" }:{ "59.5" } met één seconde rotatie (UT1 genomen uit de quasi-juliaanse UTC-datum op een dag met een schrikkelseconde); de engine is gecorrigeerd (jd2::utc_to_ut1) en de tweede run komt overeen bij ongewijzigde drempels. Weggelaten poolbeweging ({ "46" } fouten) of WGS-84-constanten in plaats van WGS-72 ({ "4432" } fouten) maken de test rood. Dit ontwerp met drie takken verving een end-to-end-vergelijking met Orekit die faalde op de SDP4 van Orekit bij e = { "0" } en op zijn IERS { "1996" }-TEME (de bevinding blijft vastgepind in tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

seg-f650a11458b8 = Afweging bij ontwerp van afstandsmetingscodes

seg-071e552a7179 = Grenzen voor zijlobben en kruiscorrelatie van m-sequenties/Gold-codes, lengte↔ambiguïteit

seg-65b7902a2d8f = Gepubliceerde GPS C/A Gold-kruiscorrelatie (−{ "23.9" } dB); Gold { "1967" }-grens

seg-5ec4c0730280 = GNSS-geometrie / dilution of precision (DOP)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP uit line-of-sight-geometrie via Q=(HᵀH)⁻¹ met een lokale ENU-splitsing

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — onafhankelijke bibliotheek, overeenkomend tot { "1e-6" } relatief

seg-1a5623c81b48 = Positiefout uit geometrie: RMS-fout = sigma_UERE x DOP voor de kleinste-kwadratenfix van de engine

seg-7a94b44a8738 = dop_error_mc::run_geometry en check: een geseedde Monte Carlo (N = { "20,000" } epochen per geometrie, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) van de eigen iteratieve kleinste-kwadratenfix van de engine (pvt::solve_spp, eenheidsgewichten, opgelost vanuit de ware positie) op de { "8" } geometrieën van tests/fixtures/dop/dop_reference.csv, waarbij de oost-, noord-, omhoog- en klokfoutvarianties, de H/V/P-RMS, de oost-noord-correlatie, de gemiddelde fouten en de fractie binnen de horizontale ellips van { "95" } % worden vergeleken met sigma^{ "2" } Q, waarbij Q de covariantiefactor is van de kernel orbit::dop (orbit::dop_cofactor, dezelfde rekenkunde) op dezelfde geometrie

seg-90f18c774d57 = Interne consistentie tegen een gesloten vorm: onder het lineaire Gauss-model is de kleinste-kwadratencovariantie sigma^{ "2" } (H^T H)^-1 (Kaplan en Hegarty (red.), Understanding GPS: Principles and Applications, 2e dr., Artech House, { "2006" }, hfst. { "7" }). Methode en toleranties van de ontwerpnotitie voor geometrie van { "0.36" }, sectie { "5.2" }, vastgezet in een preregistratiecommit vóór de eerste run: elke variantie binnen { "5" } % ({ "5" } standaardfouten van een steekproefvariantie bij N = { "20,000" }), elke RMS binnen { "2.5" } %, de oost-noord-correlatie binnen { "0.035" } (5/sqrt(N)), elk gemiddelde binnen { "5" } standaardfouten, de fractie van de ellips van { "95" } % binnen { "0.95" } +/- { "0.0077" } ({ "5" } binomiale standaardfouten); negatieve controles (PDOP verdubbeld; fouten die groeien als 1/sin(elevatie) tegen de ongewogen Q) moeten falen. HOE HET SAMENHANGT: Q is de covariantiefactor van de kernel orbit::dop, VALIDATED tegen gnss_lib_py { "1.0.4" } op dezelfde { "8" } geometrieën in tests/dop_reference.rs (rij 'GNSS-geometrie / dilution of precision'); deze rij voegt de stap toe van die factoren naar meters via de oplosser van de engine en leent de status van die rij niet. WAAROM MODELLED: er is geen externe dataset bij betrokken; overeenstemming toont dat de schatter en de ruis sigma x DOP realiseren onder het leerboekmodel, niet dat de fout van enige ontvanger gelijk is aan UERE x DOP, en sigma_UERE is een invoer

seg-9acfde1b57f7 = Geometriebewuste vertrouwensclassificatie: satellietgeometrie naast de vertrouwensscore van de ontvanger en een klasse bij elke aftrek

seg-6138c41e13ff = receiver_trust::geometry: satellietgeometrie per epoche (goed, gedegradeerd met redenen few-satellites/high-pdop/high-hdop/sky-blocked, of onbekend als het logboek geen GSV, NAV-SAT of GSA geeft) afgeleid uit de gerapporteerde elevaties en azimuts via orbit::dop of overgenomen uit GSA, met een label dat altijd wordt gerapporteerd en nooit wordt gescoord (good, fair, poor, unknown) en de HDOP, PDOP, VDOP, het aantal satellieten en het signaalverlies in woorden; een geometriemonitor voor de vaartuigscore die niets aftrekt tenzij de geometrie slecht is (verhouding max(hdop/4, pdop/6, 5/n_used) boven { "1" }), dan oploopt tot een plafond van { "15" } punten bij { "1.5" } dat geometrie alleen niet onder de gedegradeerde band kan brengen (plafond, eind van de helling en ondergrens in [geometry]; geen alarm); een klasse bij elke aftrek (geometry, environment, inconsistency) waarbij verlies van lock op satellieten onder { "15" } graden als geometry wordt geclassificeerd, satellieten in zicht maar niet gevolgd als environment, en een aftrek voor slechte geometrie waarvan de opgegeven HDOP verder dan max({ "1.0" }, { "25" } % van de afgeleide HDOP) van de opgegeven hemel ligt als inconsistency

seg-6987737c5fe4 = Interne consistentie: de classificatie wordt gecontroleerd tegen de regels die ze zelf stelt en tegen met de hand afgeleide verhoudingen op synthetische bewerkingen van het vastgelegde demologboek, en de no-change-pins houden de uitvoer van { "0.35.0" } vast: geen score verandert tenzij de geometrie slecht is; het label wordt altijd gerapporteerd. WAAROM MODELLED: de drempels zijn gekozen, niet gefit (herkomst in de geometry_model van elke run; de cijfers van IEC 61108-1 en GPS SPS zoals geciteerd, nog te controleren tegen de tekst van de normen), en er is geen externe gelabelde dataset van natuurlijke geometrieverslechtering tegenover aanvallen om de classificatie tegen te toetsen. De afgeleide DOP hergebruikt de kernel orbit::dop, VALIDATED tegen gnss_lib_py, waarvan deze rij de status niet leent. Een klasse geometrie is een uitspraak over de hemel, geen bevinding dat er geen aanval heeft plaatsgevonden

seg-540420863a5a = Broadcast-ionosfeermodel (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Klobuchar eenfrequente L1 schuine ionosferische groepsvertraging uit de acht broadcast-coëfficiënten α/β

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — onafhankelijke referentie-implementatie gecompileerd uit de bron; overeenkomend tot < { "1e-4" } m

seg-0af6b1a073ce = Statistische kernel voor RAIM/ARAIM-integriteit (χ² / niet-centraal χ² / normale verdelingen)

seg-224a6c4200cd = De verdelingskern waarop elk beschermingsniveau rust: de drempel voor snapshot-foutdetectie χ²₁₋ₚfₐ(dof), de niet-centraliteit voor gemiste detectie pbias=√λ, en de vermenigvuldigers K_fa/K_md/K_V voor oplossingsscheiding

seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — onafhankelijke bibliotheek (Cephes/Boost), een ander algoritme dan de onvolledige-gammareeks van Kshana; overeenkomend tot ≤{ "1e-6" } rel. Alleen de kernel. De *toewijzing* van het ARAIM MHSS P_HMI-budget is niet langer zonder gepubliceerde numerieke onafhankelijke referentie — het eigen uitgewerkte voorbeeld van de WG-C ARAIM Technical Subgroup ondersteunt nu de afzonderlijke rij 'ARAIM MHSS-beschermingsniveaus tegen gepubliceerde referentievectoren', overeenkomend bij de eigen TOL_PL = { "5e-2" } m van de referentie — dus de reikwijdte van deze rij is de statistische kernel en die rij draagt de toewijzing (zie docs/ARAIM_REFERENCE.md)

seg-03578217425f = SBAS-beschermingsniveau (DO-229E gewogen-LS HPL/VPL)

seg-df640d6c7a5d = DO-229E Bijlage J gewogen-kleinste-kwadraten-beschermingsniveaus: D=(GᵀWG)⁻¹ uit elevatie/azimut per satelliet en foutenbudget, hoofdas van de horizontale foutellips en verticale σ, geschaald met de gepubliceerde K-factoren

seg-39aed7b4bffd = RTKLIB SBAS-PL-fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, „DO-229D Appendix J”), uitgevoerd door rnx2rtkp -ws op echte EGNOS GEO-PRN120-berichten + echte BUTE/Boedapest-RINEX; onafhankelijke implementatie van een derde partij, HPL overeenkomend tot < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) bevestigde een identieke conventie. Beide onafhankelijke referenties ronden K_V→{ "5.33" } af tegenover de exacte Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } van Kshana (~{ "0.06" }%), dus de verticale wordt gecontroleerd als de K-factorvrije d_U

seg-8f32eb9c8167 = Evaluatiemetrieken voor ML-detectoren (ROC/AUC/confusie/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann-Whitney, gelijke rangen ½), confusiematrix bij drempel, P_d/P_md/P_fa/precisie/accuratesse/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — onafhankelijke bibliotheek, exacte overeenkomst

seg-e7af87ce5e72 = Scoring van anomaliedetectie op echte telemetrie van ruimtevaartuigen

seg-9659b33fca5b = ROC-AUC + bootstrap-BI die echte gelabelde anomalieën scheidt; transparante detector (reproduceert de labels)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score op de testsplitsing van OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — echte OPS-SAT-telemetrie

seg-5c3f1057c6cc = Numerieke kernels voor kwantumafwegingen (NNLS / χ²-banden / van-Loan Q)

seg-f82113ccb30b = NNLS-fit van gemeten ADEV, NEES/NIS χ²-consistentiebanden en de discrete procesruiscovariantie volgens van Loan van de klok (holdover-coast) — de rekenkundige ruggengraat van de afwegingsengine

seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exact, χ² <{ "5e-4" } bij operationele vrijheidsgraden. Alleen kernels — cijfers voor apparaatprestaties blijven berekend uit een model (volgende rij)

seg-6f3099e7562c = Geomagnetisch referentieveld (synthese van IGRF-14)

seg-e9534723cb34 = Sferisch-harmonische synthese van het IGRF-14-hoofdveld — componenten X/Y/Z/F, declinatie en inclinatie — dat de alt-PNT-laag voor magnetische anomalieën voedt

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — de pure-Python-IGRF-referentie-implementatie van IAGA-VMOD met de officiële IGRF14.shc-coëfficiënten (IAGA 14e generatie, Zenodo 10.5281/zenodo.14012302); een onafhankelijke codebasis van een derde partij die het eenduidig gedefinieerde IGRF-14-veld berekent, overeenkomend over een wereldwijd raster

seg-cb3fea409de7 = Detectiestatistieken — Gauss-AUC en minimaal detecteerbare fout

seg-ca677becb465 = Analytische binormale ROC-AUC = Φ(μ/(σ√{ "2" })) en de minimaal detecteerbare fout σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) die de kwantumfout- en anomaliedetectoren ondersteunen

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), beide BSD-3-Clause — onafhankelijke bibliotheken die dezelfde eenduidig gedefinieerde Gauss-staart-/AUC-grootheden berekenen, overeenkomend tot de A&S-erf-ondergrens (~{ "7e-8" }). Het daarop gebouwde kwantum-versus-klassiek voordeel blijft MODELLED

seg-1ed12110fb74 = Kernel voor rangordestatistieken (Kendall-τ / Dirichlet / percentiel)

seg-0fb003404a5b = Kernels voor rangcorrelatie en hersampling onder de studie naar beslissingsinstabiliteit bij weerbaarheid: Kendall τ-b, Dirichlet-gemiddelde, wedstrijdrangschikking en percentiel-betrouwbaarheidsintervallen

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — onafhankelijke implementaties (merge-sort-τ) van de eenduidig gedefinieerde rangstatistieken, overeenkomend tot { "1e-12" }. De op deze kernels gebouwde studie naar beslissingsinstabiliteit blijft MODELLED

seg-fdd2ba203d5b = Kernel voor het afleiden van MCDA-prioriteiten (AHP-eigenvector / consistentieratio)

seg-d01c155fbddf = Analytic Hierarchy Process-prioriteitsgewichten = genormaliseerde hoofdeigenvector (Perron) van een reciproke matrix van paarsgewijze vergelijkingen via machtsiteratie, met de Saaty Consistency Index / Consistency Ratio en de acceptatiepoort CR<{ "0.10" }

seg-d1947f2f2b3b = De canonieke Random Index-tabel van Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) exact gereproduceerd + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) als onafhankelijke eigenwaardeoplosser die dezelfde eenduidig gedefinieerde Perron-eigenvector/-eigenwaarde berekent, overeenkomend tot <{ "1e-9" }. De op deze kernel gebouwde beslissingslaag voor Pareto / gevoeligheid / MAUT blijft MODELLED (de aggregators WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE worden afzonderlijk extern getoetst — zie de rijen hieronder)

seg-73e933220afb = MCDA-kernels voor gewogen aggregatie (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (min–max-genormaliseerd additief aggregaat + rangschikking) en Weighted Product Model (somgenormaliseerd, reciprook voor kosten, multiplicatief aggregaat) — de twee scorers voor waardeaggregatie in afwegingsstudies

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — een onafhankelijke, veelgebruikte Python-MCDA-bibliotheek van een derde partij die dezelfde eenduidig gedefinieerde gewogen aggregaten berekent; overeenkomend tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_wsm/ en tests/fixtures/mcda_wpm/. Garbage-in-garbage-out op de invoer; de gevoeligheids-/robuustheidslaag blijft MODELLED

seg-f00bdb66a052 = MCDA-rangschikking op afstand tot het ideaal (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — min–max-normalisatie, gewogen positieve/negatieve ideale oplossingen, relatieve nabijheid Cᵢ = d⁻/(d⁺+d⁻) en rangschikking

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — een onafhankelijke MCDA-bibliotheek van een derde partij die dezelfde eenduidig gedefinieerde nabijheidscoëfficiënten berekent; overeenkomend tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = MCDA-compromisrangschikking (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija — groepsnut Sᵢ, individueel spijt Rᵢ en de compromisindex Qᵢ bij strategiegewicht v={ "0.5" }, met rangschikking waarbij lager beter is

seg-69fbe488dec5 = Fisher-informatie en Cramér–Rao-waarneembaarheid

seg-043d4c7a2d6a = Fisher-informatie M=HᵀWH, Cramér–Rao-ondergrens, waarneembaarheidsrang en nulruimte van het datumdefect (Moore–Penrose-pseudo-inverse), en D/A/E/T-optimale scalaire maten voor het experimentontwerp uit een symmetrische Jacobi-eigenwaardenoplosser

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, op LAPACK gebaseerd) — een onafhankelijke externe autoriteit die dezelfde eenduidig gedefinieerde eigenwaarden, dezelfde σ²(XᵀX)⁻¹-Cramér–Rao-covariantie en dezelfde GNSS-factoren voor de verslechtering van de nauwkeurigheid (dilution of precision) berekent met een ander algoritme (LAPACK-verdeel-en-heers plus LU) dan de cyclische Jacobi-sweep en de spectrale pseudo-inverse van Kshana; overeenstemming tot { "1e-9" }. Dezelfde klasse externe bibliotheken toetst al de DOP-engine (aan gnss_lib_py) en de χ²/erf-kernels (aan SciPy). Daarnaast gecontroleerd aan de hand van de gesloten-vorm-CRLB's van Kay ({ "1993" }) en het behalen van de CRLB in Monte Carlo (intern)

seg-e4ec41d0f5e1 = Waarneembaarheid van maanstations in absolute zin (datumdefect)

seg-b3e4160042d2 = Waarneembaarheid via Fisher-informatie van de gezamenlijke maanoplossing: zonder basislijnen naar de aarde ligt het datum van het absolute stelsel in de nulruimte van HᵀWH (de stationspositie is niet waarneembaar); ≥{ "3" } basislijnen herstellen de volle rang en begrenzen de Cramér–Rao-fout van het station, die de schatter bereikt

seg-238597f6aa01 = Analytische structuur van het datumdefect — de niet-waarneembare modus van het absolute stelsel ligt in de nulruimte van de Fisher-informatie (gesloten vorm), de rangdrempel komt overeen met de gepubliceerde ontwerpmotivering met 3 stations, en de schatter bereikt de resulterende CRLB in Monte Carlo. De maangeometrie zelf is een representatief netwerk (geen gevlogen efemeride), dus de rij blijft MODELLED; de onderliggende FIM/CRLB-engine wordt apart gecontroleerd aan de gesloten vormen van Kay ({ "1993" }). { "0.30" } ronde { "2" } (preregistratie fab02df9), geblokkeerd (blijft MODELLED): NumPy/SciPy herberekenen de rang en het defect bij de genoemde drempel van { "1e-9" }, het aandeel van de stationsassen in de nulruimte (binnen { "8.4e-10" }) en de CRLB van het station (binnen { "1.2e-10" }) op { "17" } vastgelegde, door Kshana gegenereerde configuraties (P2). Niet verhoogd: de bewering dat de schatter de grens bereikt (Monte-Carlo-efficiëntie ongeveer { "0.98" }) heeft geen onafhankelijke referentie, en de afbakening die haar MODELLED zou laten wacht op een besluit van de eigenaar

seg-ae4b71d54dfa = Helmert-datumfit met 7 parameters en ICRF-oriëntatiekoppeling vanuit een netwerk van punten

seg-9e434924b34c = Onafhankelijke gesloten-vorm-oplosser voor gewogen Umeyama-(Horn-)gelijkvormigheidstransformaties (numpy/scipy, SVD-gebaseerd; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — een ander algoritme dan de iteratieve Gauss–Newton-fit van kshana, dat op byte-identieke puntennetwerken hetzelfde eenduidig gedefinieerde gewogen kleinstekwadratenoptimum bereikt

seg-4bcec6e2dd9f = Maannavigatieservicevolume

seg-dba98ad5df1c = Maan-DOP, dekking en beschikbaarheid van het type Moonlight, plus gegeneraliseerde maan-ARAIM-beschermingsniveaus over een servicevolume

seg-7e981d90a806 = Onafhankelijke externe autoriteit: de Kepler-propagator ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0) — een equinoctiaal tweelichamenpad dat verschilt van de Newton-Raphson-Kepler van kshana; de MCI-positie per satelliet komt overeen tot <{ "1e-3" } m en het afgeleide aantal en de afgeleide set zichtbare satellieten komen op elk rasterpunt exact overeen. De DOP-kernel is getoetst aan gnss_lib_py; voor de integriteit worden gepubliceerde LunaNet/LCNS-parameters gebruikt

seg-2ed7181c97dd = Genereren van LunaNet-AFS-spreidingscodes (LSIS V1.0)

seg-13ff6c381275 = De Augmented Forward Signal-codes van LSIS V1.0 ({ "29" } januari { "2025" }): de primaire AFS-Q-code van 10230 chips, gegenereerd uit de L1C-pilootconstructie van IS-GPS-800 met de indices van IS-GPS-800J (dezelfde { "210" } toewijzingen die LSIS Appendix D afdrukt), de Gold-codes van AFS-I met 2046 chips, gegenereerd uit g1 = x^{ "11" } + x^{ "2" } + { "1" } en g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, waarbij de G2-vertraging van elke PRN is teruggewonnen uit het Annex { "3" }-bestand van de standaard, de vier secundaire codes, de tertiaire codes van 1500 chips, de voorlopige knooppunttoewijzing van Tabel { "11" } en de gelaagde pilootcode. De LSIS-inhoud wordt tijdens de run gelezen uit een lokale cache die met SHA-256 is geverifieerd en is gevuld uit de door NASA gehoste PDF; ze wordt nooit verspreid

seg-dc1dd144b107 = Referentie: de waarden die LSIS V1.0 afdrukt ter validatie (Tabellen C-1 t/m C-5, D-1 t/m D-6, E-1 t/m E-6) en de elektronische codebestanden van Annex { "3" }, onder een criterium van nul afwijkingen dat voor de vergelijking is vastgelegd. Het criterium wordt niet gehaald door één afgedrukte cel die intern strijdig is met het eigen Annex { "3" }-bestand van de standaard, dus de rij blijft MODELLED; een erratumnotitie is in concept opgesteld. Dezelfde chips zijn ook gelijk aan die van LANS-AFS-SIM (rij 'LunaNet-AFS-basisbandweergave tegenover een onafhankelijke generator, gegeven zijn kanaalstaat')

seg-ea20909686ea = LunaNet-AFS-basisbandweergave tegenover een onafhankelijke generator, gegeven zijn kanaalstaat (LSIS V1.0)

seg-c0f021c38842 = De weergavekern van de AFS-basisband (LSIS-130: complexe omhullende I + jQ, I = de Gold-code van AFS-I maal het symboolraster van { "500" } symbolen/s bij { "1.023" } Mchip/s, Q = de gelaagde AFS-Q-piloot bij { "5.115" } Mchip/s, draaggolfrotatie, chip- en symboolafstemming) reproduceert de samples van een onafhankelijke generator wanneer die wordt aangestuurd met de eigen vastgelegde kanaalstaat van die generator (codefasen en -snelheden, draaggolffase en -frequentie, amplitude per kanaal). Niet gedekt: het knooppuntmodel dat die staat afleidt uit een Doppler, vertraging en draaggolf-ruisdichtheid, de 50/50-vermogensverdeling berekend uit de draaggolf-ruisdichtheid (de amplitudes komen uit de simulator), en de SigMF-metadata en het schrijven van samples van 8 bit

seg-dd1142957a05 = Bibliotheek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-bandbuild, als apart programma uitgevoerd); de samples van Kshana worden uitsluitend aangestuurd door de vastgelegde kanaalstaat van de simulator, en een build met alleen trace-uitvoer is byte-identiek bevonden aan de ongepatchte. Drempels vastgelegd vóór de run: nul chip- en symboolafwijkingen, |rho| >= { "0.999" } over de run en >= { "0.99" } per blok van { "2" } ms, fase binnen { "0.05" } rad. Gelijke I- en Q-amplitudes zijn een invoer van de vergelijking, dus de vermogensverdeling wordt er niet mee getoetst. LANS-AFS-SIM leest zijn tertiaire codes uit het Annex { "3" }-bestand van LSIS, dus dat deel is niet onafhankelijk van de coderij. LANS-AFS-SIM en PocketSDR-AFS delen een auteur en tellen als één onafhankelijke implementatie. Datagebonden: de LANS-AFS-SIM-vergelijking vereist de lokale LSIS V1.0-cache (xval/lunar-afs/fetch_lsis.sh, SHA-256 geverifieerd) en wordt zonder die cache met een melding overgeslagen

seg-5d79da539912 = Kanaalcodering van het LunaNet-AFS-frame, FID { "0" } (LSIS V1.0)

seg-6ed2b4c792e6 = Het FID { "0" }-frame van { "12" } s en 6000 symbolen van LSIS V1.0: synchronisatiepatroon van 68 symbolen, BCH ({ "51" }, { "8" }) subframe { "1" } (octale generator 763), CRC-24 (({ "1" } + X)·P(X)) op subframes 2-4, LDPC-codering met rate 1/2 met de afgedrukte A, B^-1, C, D (LSIS Annex { "1" }, tijdens de run gelezen uit de met SHA-256 geverifieerde lokale cache) en de punctuering van de standaard, een blokinterleaver van { "60" } x { "98" }; een uitputtende subframe-1-decoder die een TOI buiten { "0" }..99 markeert, en een genormaliseerde min-sum-LDPC-decoder die uitsluitend is geschreven op basis van H = [[A, B, { "0" }], [C, D, I]]

seg-46879e2e8ab5 = Bibliotheek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), waarvan de eigen BCH, CRC, LDPC en interleaver voor dezelfde inhoud frames opleveren die symbool voor symbool identiek zijn aan die van Kshana (nul afwijkingen, drempel vastgelegd vóór de run). Onderbouwd door referentiewaarden: het uitgewerkte BCH-voorbeeld in Figuur { "8" } van LSIS V1.0 en de CRC-24/LTE-A-controlewaarde (de catalogus van geparametriseerde CRC-algoritmen van Greg Cook), beide bitexact; en door PocketSDR-AFS, dat in drie runs elk subframe decodeerde van de frames waarop het synchroniseerde, met geslaagde CRC en overeenkomende bits van subframe 2. De pariteitscontrole is vrijwel een interne identiteit (ze bevestigt dat de afgedrukte B^-1 de afgedrukte B inverteert) en telt niet als onafhankelijke referentie. Datagebonden: de LANS-AFS-SIM-vergelijking vereist de lokale LSIS V1.0-cache (xval/lunar-afs/fetch_lsis.sh, SHA-256 geverifieerd) en wordt zonder die cache met een melding overgeslagen

seg-56c7aeac59c1 = Gesloten-lus-decodeerbaarheid van LunaNet AFS door een onafhankelijke ontvanger (LSIS V1.0)

seg-da2d29d437b0 = Een Kshana-AFS-opname die door een onafhankelijke softwareontvanger is verworven, gevolgd en gedecodeerd en is vergeleken met de eigen referentielabels van de opname. Dit bewijst alleen dat de uitvoer overeenkomt met de standaard en dat de labels consistent zijn; het is geen uitspraak over kanaalfysica, voortplanting, ontvangen vermogen of linkbudgetten, waarvan de waarden in de opname gekozen invoer zijn

seg-8211583afc64 = Bibliotheek: PocketSDR-AFS (T. Ebinuma naar PocketSDR { "0.13" } van T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-bandbuild, kopie met alleen afdrukken op logniveau), onder criteria die vóór elke run zijn vastgelegd. De derde vooraf geregistreerde vergelijking haalt haar decodeer- en trackingdrempels C1 en C2 volledig, maar haar bewaking G0 niet zoals geschreven (twee runs van de ongewijzigde ontvanger verschillen in dezelfde vier acquisitierecords), en de tweede miste de drempel met { "5" } overschrijdingen, dus de rij blijft MODELLED. LANS-AFS-SIM en PocketSDR-AFS delen een auteur en tellen als één onafhankelijke implementatie; de controles met afgedrukte vectoren in de rij over frame-codering waarborgen dat er niet een gedeelde misinterpretatie in zit

seg-780369fb9a54 = GPS L1 C/A: gelijkheid van uitvoer tussen generatoren

seg-ee47b60515f1 = GPS L1 C/A-spreidingscodes (sdr::CaCode) en LNAV-subframes 1-3 (gps_lnav: veldkwantisatie volgens IS-GPS-200 met de pi van de specificatie, twee-complementpakking, TLM- en HOW-woorden, pariteit van Tabel 20-XIV met D29*/D30*-inversie, de pariteitsoplossende bits van woorden { "2" } en { "10" }) bit voor bit vergeleken met gps-sdr-sim op het meegeleverde brdc0010.22n ({ "32" } satellieten)

seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, als apart programma uitgevoerd via een vastgelegde harness), preregistratie f88f2969 met een bitexacte drempel op (A) C/A-chips, (B) elk berekend LNAV-veld, (C) elke pariteitsbit. BEVINDING: (A) { "0" } van { "32 736" } chips verschillen, (C) de pariteit van { "0" } van { "1 920" } woorden verschilt, (B) { "230" } van { "1 152" } berekende velden verschillen met één eenheid: de eph2sbf van gps-sdr-sim kapt af naar nul met C-casts waar het uitgezonden gehele getal afronding vereist (elke afwijkende waarde ligt binnen { "0.01" } van een eenheid van het afgeronde gehele getal van Kshana). Blijft MODELLED: de vastgelegde drempel was de conjunctie

seg-325900ed59ea = Signaalgeometrie van GNSS-IQ-scènes tegenover een onafhankelijke basisbandgenerator

seg-ee5625b30ff2 = De referentie per satelliet van de IQ-scènegenerator voor een GPS L1 C/A-scène met broadcast-efemeride (iq::scene: een SatGeometry met broadcast-efemeride, gegenereerd in TruthRecord-referentierecords): welke satellieten boven de horizon staan, de pseudorange, de codefase bij het eerste sample, de draaggolf-Doppler en de kijkhoeken, voor een statische ontvanger, vergeleken met de kanaalstaat waaruit gps-sdr-sim het eerste blok van zijn eigen I/Q-uitvoer opbouwt, voor dezelfde efemeride, ontvanger en starttijd (ionosfeer aan beide kanten uit)

seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), een onafhankelijke GPS L1 C/A-basisbandgenerator, gebouwd met zijn eigen Makefile en als apart programma uitgevoerd op zijn meegeleverde brdc0010.22n op de voorbeeldlocatie uit zijn gebruikstekst (scripts/gen_iq_gpssdrsim_ref.sh); een vastgelegde harness die tegen dezelfde build is gelinkt, drukt de kanaalstaat af (computeRange, computeCodePhase) achter het eerste blok van het programma. Drempels vastgelegd voordat de generator werd uitgevoerd (preregistratie 7777da53). Bereik: GPS L1 C/A-geometrie voor een statische ontvanger zonder ionosfeer, troposfeer of ontvangerklok; de kanaalmodellen, de ruis en de navigatiedata van de scène maken geen deel uit van deze rij

seg-bf429c8f00fb = GNSS-IQ-acquisitie op onafhankelijk gegenereerde I/Q-samples

seg-9a0c52bfb06e = iq::acq::acquire (parallelle FFT-codefasezoektocht met de kwadratische-detector-Marcum-Q-drempel) met de GpsL1Ca-replica, op { "20" } ms van de eigen 8-bit-I/Q-uitvoer van gps-sdr-sim, gedecodeerd met de iq::io-sampledecoder (ci8, { "2.6" } MHz, { "11" } satellieten, geen ruis): elke PRN { "1" } tot { "32" } doorzocht in twee vensters van { "10" } ms, waarbij het resultaat is vergeleken met de codefase en Doppler die gps-sdr-sim heeft gemoduleerd

seg-fb96290003e1 = I/Q-samples van gps-sdr-sim (MIT, commit 28ca29a6) en zijn eigen kanaalstaat, preregistratie 7777da53: (B1) elke gesimuleerde PRN verworven, (B2) geen andere PRN verworven, (B3) codefase binnen { "0.5" } chip, (B4) Doppler binnen { "125" } Hz. BEVINDING: B1, B3 en B4 gelden in beide vensters (slechtste { "0.195" } chip, { "72" } Hz), maar B2 faalt: alle { "21" } PRN's die gps-sdr-sim niet heeft gesimuleerd overschrijden ook de drempel (statistiek { "151" } tot { "206" } tegen { "79.5" }; gesimuleerde PRN's { "1 300" } en hoger). De drempel is ingesteld voor Gaussische ruis met het gemeten samplevermogen; gps-sdr-sim voegt geen ruis toe, dus de cellen van een afwezige PRN bevatten de kruiscorrelatie van de andere satellieten. Blijft MODELLED: de vastgelegde drempel was de conjunctie

seg-f40dc3dac990 = IQ-monitors beoordeeld in lab-replaycampagnes: detectie, gemiste detecties, valse alarmen en valse-alarmcijfers in gesloten vorm

seg-93fb3109728c = iq::campaign::detect en de campagnerunner: een optionele tabel [monitors] laat de IQ-monitors op elke cel draaien in de enkele doorgang van de runner. De vermogens- en spectrale monitors zien de samples na elke front-endketen; de C/N0-, SQM- en lockmonitors zien de lus-updates van elk gevolgd kanaal. Elk alarm wordt beoordeeld aan de hand van de opgegeven gebeurtenissen: gedetecteerd of gemist per (gebeurtenis, alarmsoort, kanaal), detectietijd, en valse alarmen buiten de gebeurtenissen over hun blootstelling. Het valse-alarmcijfer in gesloten vorm van elke test wordt vermeld: vermogen per blok (exacte gamma-staart), spectraal overschot per blok (benadering), kurtosis (eenzijdig Gaussisch), pulsen (binomiaal plafond), SQM per gemiddelde update (2Q(k) = Q(1/2, k^2/2), nieuw), en de ARL0 van de C/N0-CUSUM (Siegmund). Zonder de tabel blijven cellen, sleutels en digests ongewijzigd. Er wordt geen interferentiegolfvorm gesynthetiseerd

seg-4c4fff313585 = De gesloten vormen van de monitors zelf op Kshana's eigen GPS L1 C/A-scènes (ruis en legitieme signalen; verzwakkingsgebeurtenissen van de eigen signalen van de satellieten), tegenover drempels die vooraf zijn vastgelegd in docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). BEVINDING: M1, M2 en M4 gehaald. M3 gehaald op detectie ({ "18" } van { "18" } verzwakkingen, P_md { "0" }) en NOT MET op de tijdsclausule: de mediane detectietijd is { "1.001" } s tegen { "2" } x ARL1 samples = { "0.433" } s. De CUSUM ziet één schatting per venster van { "1" } s, dus de grens in aantal samples ligt onder één sample. Alleen interne consistentie: er is geen echte ontvanger of opgenomen interferentie gecontroleerd

seg-5b7eb7ddb474 = Detectie-ROC van de IQ-monitors uit een beoordeelde lab-replaycampagne

seg-57fe85965c9c = iq::campaign::detect (windows, roc) en iq::campaign::report::rocs: elke cel van een campagne met monitors bewaart, per alarmsoort en kanaal, het maximum van de eigen toetsstatistiek van de monitor over elk opgegeven gebeurtenisvenster (positief) en over getegelde roc_window_s-vensters buiten de gebeurtenissen (negatief). De statistieken zijn de afwijking van het blokvermogen, het PSD-overschot, de kurtosis z, de SQM |z| van de gemiddelde maat, en de C/N0-CUSUM. Het rapport voegt ze per soort samen tot een empirische ROC op vensterniveau met zijn AUC en het werkpunt bij de ingestelde drempel, geschreven als roc.json (kshana.campaign-roc/1) en een sectie Detection ROC in report.html. Een campagne zonder monitors schrijft geen van beide

seg-e882dd678998 = Synthetische campagnes uit Kshana's eigen GPS L1 C/A-scènes (verzwakkingen van de eigen signalen van de satellieten), tegenover drempels die vooraf zijn vastgelegd in docs/design/DETECTION-ROC.md (b47e358d). BEVINDING: R2 gehaald (kansniveau als er niets te detecteren valt). R1 NOT MET: cn0_drop-AUC { "0.7855" } tegen { "0.95" }, omdat elk negatief venster na een gebeurtenis het verval van de CUSUM na de detectie overneemt (alle { "18" } negatieve vensters na een gebeurtenis bereiken { "81" } of meer; alle { "18" } vensters vóór een gebeurtenis blijven op { "0" }). Alleen interne consistentie: er is geen echte ontvanger of opgenomen interferentie gecontroleerd

seg-3a3cfa322f01 = Kalibratie van de C/N0- en lockmodellen van de open ontvanger op IQ-campagneresultaten, met opgegeven voorspellingsfout

# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) en <c1/> op <c2/>, Python <c3/> en de MCP-tool labfit (alleen campagnemappen binnen zijn werkmap): leest een uitvoermap van <c4/> via zijn DIGEST en groepeert de beoordeelde cellen tot fiteenheden (signaal x lusontwerp x front-endketen x jammertype, nooit samengevoegd). Per eenheid wordt de gemeten C/N0 gefit tegen de opgegeven J/S met de vorm voor spectrale scheiding. Q_eff is niet identificeerbaar uit C/N0-gegevens zonder een onafhankelijke meting van de jammer- en signaalvermogens, dus Q wordt opgegeven en nooit gefit (de typetabel, de q van de gebeurtenis, of voor een onbekend type de meest schadelijke opgegeven waarde, cw Q = { "1" }). De gefitte parameter is de identificeerbare offset delta_eff = delta - { "10" } log10 Q, waarbij de correlatiebewaking de ontaarding meldt. C/N0-bins met lock onder { "90" } % worden gecensureerd en weergegeven. De drempel-J/S wordt direct en via de gesloten vorm gegeven; het trackinglusmodel en het empirische lockmodel zijn via het C/N0-model gekoppeld, met verlies- en herlockverblijftijden. Een geseede clusterbootstrap over opnamen ({ "1000" } replicaties) levert percentielintervallen; voorspellingsintervallen van { "90" } % komen uit residutrekkingen; leave-one-recording-out-holdouts worden gesplitst in interpolatie en extrapolatie; een vooraf geregistreerde tabel [validation] wordt gehasht en elke drempel krijgt PASS/FAIL. Rapport kshana.labfit-iq/1 als JSON, CSV en gegenereerde Markdown, met een eenhedenblok. Alleen synthetisch (geen opname van derden, geen jammergolfvorm). Het labfit-pad via ontvangerlogs is ongewijzigd

seg-f9abecb1eea6 = Synthetisch terugvinden van parameters op Kshana's eigen GPS L1 C/A-scènes met een bekend C/N0-profiel dat is opgelegd vanuit de formule van sectie { "3.1" }, gevolgd en beoordeeld door kshana iq campaign, tegenover drempels die vooraf zijn vastgelegd in docs/design/LABFIT-FROM-IQ.md (sectie { "5.1" }, gewijzigd 2026-10-12 in b7117bf, sectie { "13" }). De C/N0-schatter van de campagnes (M2M4) is vastgelegd in 5b13e3c2, gepusht vóór de eerste drempelevaluatie (samen met de fitcode vastgelegd, niet afzonderlijk), na één bekendgemaakte diagnostische trackingrun. BEVINDING bij de campagne met 18 gebeurtenissen: (c) PASS; (a') NOT MET, fout in delta_eff -1.097 dB tegen { "0.5" } dB (nog steeds -0.89 dB op bins bij { "38" } dB-Hz en hoger); (b') NOT MET, { "0" } van { "50" } campagnes dekken de referentie (fout -1.189 +/- { "0.093" } dB, interval ongeveer { "0.3" } dB); (d) NOT MET, gesloten vorm { "2.20" } dB onder de directe J/S bij verlies, ongeveer de gefitte dalingsverblijftijd maal de rampsnelheid ({ "2.09" } dB); de oorspronkelijke Q-clausules van (a) en (b) zijn NOT MET omdat Q niet identificeerbaar is. VERVOLG (drempels vooraf geregistreerd in 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): op een campagne met stapsgewijze J/S wordt delta_eff teruggevonden binnen +{ "0.185" } dB (S1 MET: de rampfout is schatterlag); (d) zoals geschreven wordt erop gehaald door het trackinglusmodel ({ "0.45" } dB) maar niet door het empirische model ({ "6.42" } dB), dus S2 is NOT MET; op een verse ramp-campagne ligt (d) met de gefitte dalingsverblijftijd maal de rampsnelheid van elke gebeurtenis opgeteld binnen { "1" } dB voor beide modellen (R1 MET), en (a') en (d) zoals geschreven worden opnieuw gemist (-1.25 dB; { "2.32" } en { "9.47" } dB). De methode wordt gecontroleerd, geen enkele ontvanger: ze kan uit synthetische data niet VALIDATED worden

seg-9537d301c95e = GPS-LNAV-codering gedecodeerd door een onafhankelijke ontvangerbibliotheek

seg-909415621881 = De LNAV-subframes 1-3 van Kshana (gps_lnav::encode_subframes) voor de { "32" } efemeriden van brdc0010.22n, aangeboden aan decode_word en decode_frame van RTKLIB: pariteit van elk woord, subframedecodering met consistent issue of data, en elke gedecodeerde parameter tegenover het gehele getal van Kshana en tegenover de invoerwaarde

seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame als apart programma, preregistratie ca5f0142: R1 pariteit en decodering, R2 gedecodeerde waarde gelijk aan het gehele getal van Kshana maal de IS-GPS-200-schaal binnen { "2" }^-52 relatief, R3 binnen een half kwantum van de invoer. BEVINDING: R1 { "960" } van { "960" } woorden en { "96" } van { "96" } subframes; R3 elke parameter, week en referentietijd exact; R2 faalt bij { "41" } waarden (af1, delta-n, IDOT) met { "1" } tot { "4" } eenheden in de laatste plaats omdat P2_43 van RTKLIB het decimale getal { "1.136868377216160E-13" } is, { "2.6e-16" } relatief ten opzichte van { "2" }^-43; delen door de constante van RTKLIB levert in elk geval het gehele getal van Kshana op. Blijft MODELLED: de vastgelegde drempel R2 was te strak voor de eigen constante van de onafhankelijke referentie

seg-f66855e35c53 = Codering van het GPS-LNAV-navigatiebericht

seg-8caf8366e2f8 = IS-GPS-200 LNAV-subframes 1-3 (gps_lnav::encode_subframes: kwantisatie naar het dichtstbijzijnde getal van elke klok- en baanparameter bij de schaalfactoren en de waarde van pi uit de specificatie, twee-complementpakking, TLM- en HOW-woorden, pariteit van Tabel 20-XIV met D29*/D30*-inversie, de pariteitsoplossende bits van woorden { "2" } en { "10" }), het bericht dat een GPS L1 C/A-signaalgenerator uitzendt

seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx die het dagelijkse IGS-broadcastbestand BRDC00IGS_R_20250610000_01D_MN.rnx parseert en decode_word/decode_frame die de woorden van Kshana decoderen, als apart programma uitgevoerd; preregistratie d4d9eb9d vóór het ophalen van het bestand, drempel van exacte gehele getallen. Mutatie: afkappen in plaats van afronden geeft { "235" } fouten. Eerdere vergelijkingen van dezelfde encoder zijn als bevindingen vastgelegd: tegenover gps-sdr-sim, dat afkapt ({ "230" } velden), en tegenover de geschaalde waarden van RTKLIB, waarvan de decimale constante { "2" }^-43 een drempel van één ulp miste ({ "41" } waarden). Verificatie achteraf door de integrator (blijft MODELLED): de vergelijking komt overeen en een mutatie van de pariteitsset kleurt haar ook rood, maar de preregistratie d4d9eb9d bereikte de publieke branch om { "20" }:{ "02" }:{ "29" } UTC, twee seconden na de resultaatcommit 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) die al de uitvoer van RTKLIB voor het bestand bevat, dus de volgorde 'vastgelegd voordat het bestand werd opgehaald' kan niet worden aangetoond; een nieuwe registratie die wordt gepusht voordat een nog niet ingezien broadcastbestand wordt opgehaald, zou dat beslechten

seg-c5c944357643 = Acquisitie en C/N0-schatting op echte maan-IQ

seg-f5dcb5e06bf4 = Parallelle codefasezoektocht (acquisition::pcps_acquire: draagbare FFT, coherente vouwing, niet-coherente accumulatie, chikwadraatdrempel voor een zoekbrede kans op vals alarm), verfijning, open-lus-promptcorrelatie met code-Doppler en de M2M4-C/N0-schatter, uitgevoerd op de LuGRE L1 4-bit-IQ-batches gelezen via realdata::ion_sdr

seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, apart programma, vastgezette configuratie) op de negen L1-batches niet op het oppervlak en de RAW-C/N0 van de vluchtontvanger (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), preregistratie 768cb62b. BEVINDING: de lezer van Kshana decodeert alle { "288" } vergeleken spans identiek aan een onafhankelijke converter; GNSS-SDR verklaart { "266" } van { "288" } zoektochten positief en Kshana is het eens bij alle { "266" } beslissingen, maar slechts { "250" } liggen op de cel van GNSS-SDR (A2 faalt); de C/N0-tak is leeg, want geen enkele RAW-epoch van de vluchtontvanger ligt binnen { "30" } s van een batch (dichtstbijzijnde { "141" } s). De meeste positieven zijn artefacten: de kale twee-complementniveaus hebben een gemiddelde van -0.5 op I en Q, een nulfrequentielijn { "32" } dB boven de ruis in een bin van { "1" } kHz, die beide ontvangers verwerven. Twee batches (OP5, OP12) zijn ten onrechte uitgesloten: een lezing van hun metadata zonder cijfers werd aangezien voor een tegenspraak met hun headers; de werkelijke oorzaak was dat de lezer geen sample kon lezen dat breder is dan een woord (inmiddels verholpen). Blijft MODELLED

seg-709626569a5c = Acquisitie op echte maan-IQ tegenover door de baan voorspelde Doppler (beslissing op samplevermogen)

seg-784ebd80c425 = acquisition::pcps_acquire met zijn beslissing op samplevermogen op de negen L1-batches van LuGRE niet op het oppervlak met mid-rise-niveaus; Dopplerverschillen tussen verworven satellieten vergeleken met verschillen die zijn voorspeld uit de definitieve ESA-banen en de door Firefly gereconstrueerde baan van Blue Ghost

seg-38b8127db267 = Voorspelde Doppler uit de definitieve ESA/ESOC-banen en de door NAIF gereconstrueerde CLPS-baan (xval/lugre-predicted-doppler/predict.py, onafhankelijk van Kshana), preregistratie 0d1839d2. BEVINDING: alle { "288" } zoektochten overschrijden de drempel op ruis (samplevermogenstatistieken ongeveer { "430" } tot { "520" } tegen { "346.3" }), dus P1 geldt triviaal en P3 geldt ({ "274" } van { "288" } voorspeld zichtbaar) terwijl P2 faalt bij { "4033" } van { "4036" } paren. De bandbegrensde front-end verhoogt de ruis van elke cel ongeveer { "1.46" } keer (vastgezet: ruisvloer { "292" } tegen de witte ruis van { "200" } op OP2 PRN { "1" }), wat de samplevermogenstatistiek niet ziet. Blijft MODELLED

seg-89875d67b253 = Acquisitie op echte maan-IQ beoordeeld aan de hand van door de baan voorspelde Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire met de cell-averaging-beslissing (piek boven de gemiddelde cel van het raster, robuust tegen bandbegrensde ruis) op de negen L1-batches van LuGRE niet op het oppervlak met mid-rise-niveaus; Dopplerverschillen tussen verworven satellieten vergeleken met verschillen die zijn voorspeld uit de definitieve ESA-banen en de door Firefly gereconstrueerde baan van Blue Ghost

seg-f80a751bc49b = Voorspelde Doppler uit de definitieve ESA/ESOC-banen en de door NAIF gereconstrueerde CLPS-baan (xval/lugre-predicted-doppler/predict.py, onafhankelijk van Kshana), preregistratie a81a9a4e. BEVINDING: P1 en P3 gelden ({ "4" } batches, { "12" } van { "12" } acquisities voorspeld zichtbaar) maar P2 faalt bij { "8" } van { "8" } paren. De twee sterkste paren komen qua grootte overeen met de voorspelling met omgekeerd teken (OP2 PRN 18/24: +{ "7670.0" } Hz gemeten, -7693.9 voorspeld; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), dus de vastgelegde volgorde met I in de lage nibble is het complement van de batches; de zes detecties net boven de drempel komen met geen van beide tekens overeen. De Dopplerspreiding van de verfijning ({ "30" } tot { "50" } Hz tussen twee runs) werd door de registratie eveneens onderschat. Blijft MODELLED

seg-8fa779dd1788 = Acquisitie op achtergehouden echte maan-IQ tegenover door de baan voorspelde Doppler

seg-484868771231 = acquisition::pcps_acquire (cell-averaging-beslissing, kans op vals alarm { "1e-7" }) met refine_doppler_coherent op de LuGRE L1-batches die op het maanoppervlak zijn opgenomen (I in de hoge nibble, mid-rise-niveaus); Dopplerverschillen tussen verworven satellieten tegenover verschillen die zijn voorspeld uit de definitieve ESA-banen en de landingsplaatskernel van Firefly

seg-8bfd18bb6478 = Voorspelde Doppler uit de definitieve ESA/ESOC-banen en de NAIF-CLPS-landingsplaatskernel van Firefly (xval/lugre-predicted-doppler/predict_surface.py, onafhankelijk van Kshana), preregistratie 2108e6ff op batches die nooit eerder zijn geopend. BEVINDING: niet-leegheid faalt; geen enkele batch bevat twee acquisities. OP40 uitgesloten (metadata noemt een ontbrekend bestand); OP38, OP73, OP77_0, OP77_1 verwerven niets en tonen geen vals alarm bij { "1e-7" } (hoogste statistieken { "325" } tot { "356" } tegen { "385.9" }); OP74 en OP76 verwerven PRN { "31" } en OP78_0 en OP78_1 PRN { "12" }, elk alleen, allemaal voorspeld zichtbaar. Blijft MODELLED. Bekendgemaakte afwijkingen: de vastgelegde Dopplerdrempel van { "10" } Hz berust op een synthetische Monte-Carlosimulatie van de coherente verfijning, niet op de spreiding van de reeds geziene batches waar de integrator om vroeg; OP40 is vóór de run uitgesloten omdat zijn metadata een samplebestand noemt dat de dataset niet meelevert

seg-758af035b3ce = Gezamenlijke communicatie- en navigatiegeometrie op de maan

seg-11f861bdc6bf = Topocentrische kijkhoeken per satelliet (azimut met de klok mee vanaf het noorden, elevatie) en schuine afstand op een benoemde selenografische locatie, gegeven de satelliet in het met de maan meedraaiende lichaamsstelsel van de locatie (de getoetste claim). De nauwkeurigheid van de afstandsmeting in de signaalruimte is beschikbaar als scenarioparameter, zodat de sweep over het servicevolume een VEREISTE voor de afstandsmeting oplevert in plaats van een geslaagd/niet geslaagd bij één vaste sigma; die parameter is een ontwerpinvoer buiten de getoetste claim

seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, als hulpmiddel uitgevoerd vanuit xval/anise-service-geometry, binary lunar-look-angles-xval, dat geen Kshana-code aanroept): de eigen routine van ANISE voor azimut, elevatie en afstand (azimuth_elevation_range_sez) vanaf locaties die zijn opgebouwd met zijn constructor voor lengtegraad, breedtegraad en hoogte op de pck00011-maan (bol van { "1737.4" } km), met de satellieten geroteerd naar MOON_PA_DE440 via moon_pa_de440_200625.bpc. { "768" } samples over { "8" } locaties (de { "4" } benoemde locaties en { "4" } andere, boven en onder de horizon), { "12" } epochs en { "8" } satellieten komen overeen binnen { "1e-6" } graad in azimut en elevatie en { "1" } mm in afstand en locatiepositie (vastgelegd vóór de vergelijking); gemeten { "2.2e-12" } graad, { "2.1e-13" } graad en { "5.6e-9" } m. Claim: plaatsing van de locatie en kijkhoeken gegeven de satelliet in het lichaamsstelsel van de locatie. De eigen realisatie door Kshana van een met de maan meedraaiend stelsel met gemiddelde rotatie en de parameter voor de nauwkeurigheid van de afstandsmeting vallen erbuiten; de gesloten-vorm-eenheidstests van de geometrie blijven bestaan als ondersteunende controles

seg-10af60b488b9 = Differentieel referentiestation van het type NovaMoon: opheffing van gemeenschappelijke modi, restfout die met de basislijn groeit en DGNSS-beschermingsniveaus

seg-96b2627b388a = Identiteit voor differentiële foutopheffing en hergebruik van de SBAS-PL-machinerie van DO-229E; de oplossing met enkelvoudig verschil plus WLS wordt daarnaast gecontroleerd aan RTKLIB's lsq()/matinv() (Takasu, BSD-2-Clause, gecompileerde C) — onafhankelijke solvercode, maar dezelfde eerste-orde-LOS-verschilalgebra, dus nog steeds InternalConsistency

seg-c04a3591074c = Interoperabiliteitsexport voor de maan

seg-91f4a066b3c0 = Aan LunaNet/IOAG afgestemde export van maanstelsel, tijd en efemeride (CCSDS OEM plus KIF) met round-trip en formaatcontrole

# c1: oem
seg-f5f8ed69bea7 = De maan-OEM-export van kshana opnieuw geparseerd door de onafhankelijke bibliotheek <c1/> van derden (R. J. Anderson): stelsel- en tijdtokens en toestand per epoch komen overeen tot de schrijfprecisie ({ "1" } mm / { "1e-9" } km/s) en een export zonder TIME_SYSTEM wordt geweigerd — een structurele uitwisselings-round-trip; de fysische semantiek van maanstelsel en tijd wordt door hun eigen rijen getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): een tweede onafhankelijke lezer, de CCSDS-OEM-parser van Orekit { "12.2" } (Apache-2.0, strikte standaardwaarden), weigert beide maanbestanden omdat hij de tijdsystemen LTC en TCL niet implementeert (hij decodeert de EME2000/UTC-OEM van de crate, en decodeert de maanbestanden zodra TIME_SYSTEM door TDB is vervangen); oem { "0.4.5" } decodeert ze alleen binnen de geschreven precisie door terug te vallen van het niet-ondersteunde tijdsysteem. Uitwisseling van deze maanbestanden met gangbare CCSDS-lezers is niet vastgesteld

seg-8ab65cbefb75 = Scoring afgestemd op raamwerken voor PNT-veerkracht

seg-c48198f31d63 = Deelscores per dimensie over de eigen zeven veerkrachtcategorieën van Kshana (geen DHS-termen), de RDRR-functies van RethinkPNT en de criteria van Yang, elk gemarkeerd als berekend uit een model met zijn drijvende factor; voorlopig RPCF-niveau met een poort voor begrensde degradatie. Zelfbeoordeling op basis van simulatie, nooit certificering.

seg-f905aeb203bb = Met de hand afgeleide formules per maat: inverse-Simpson-diversiteit, gewogen-gemiddelde-samenstelling, begrensde en onbegrensde tijdlijnduur, zwakste-schakel-niveauladder

seg-d7bdb6fe186e = Studie naar beslissingsinstabiliteit van de veerkrachtscore

seg-5fcf18a68bb1 = Kwantificeert hoe één samengestelde score of één RPCF-niveau architecturen herordent onder een verdedigbare gewichtensimplex en een dreigingsensemble (top-1-omslagpercentage, Kendall-tau-spreiding, niveau-omslagpercentage, rangbereiken); analyses van opgegeven versus gemeten en van diversiteitsinstorting.

seg-b6bf76a752a0 = Identiteiten voor rangstatistieken in gesloten vorm (tau in [-1,{ "1" }] met met de hand berekende waarden; deterministische geseede Dirichlet) en geconstrueerde stabiele en instabiele getuigen

seg-1bf03544a010 = Representativiteit van de demonstratie en hiaten tot vlucht

seg-db24d16d38c9 = Eerlijkheidsregister per resultaat dat een demonstratie-uitvoer kwalificeert: de externe ankers, de modelaannames, de hiaten tot vlucht en de representatieve TRL-band, met afgedwongen invarianten (getoetst vereist een extern anker; berekend uit een model vereist een hiaat en kan niet boven TRL { "4" } claimen).

seg-81d3adb239c5 = Invarianten in gesloten vorm die aansluiten bij de compliance-discipline 'representativiteit onderbouwd en hiaten tot vlucht geïdentificeerd'; gekoppeld aan de grens tussen verificatiestatus en soort onafhankelijke referentie

seg-52ab936eb5f5 = Bewijs voor de afweging kwantum tegenover klassiek (gemeenschappelijke vorm)

seg-a6679ed5bed7 = Eén reproduceerbaar TradeEvidence-object (vast kader: scenario, seed en engine; gemeenschappelijke kwantum-tegenover-klassiek-waarden per kwaliteitsmaat met polariteitscorrect voordeel, optioneel betrouwbaarheidsinterval van { "95" }%, label getoetst of berekend uit een model) met een representativiteitsrecord, zodat elke kwantum-PNT-vertical de afweging op dezelfde eerlijke manier rapporteert.

seg-70da3e15ea8b = Identiteiten voor voordeel en winnaar in gesloten vorm en een getrouwe omhulling van het bestaande quantum_trade::TradeResult; eerlijkheid gekoppeld aan het representativiteitsregister en de verificatielabels

seg-20fee61b3107 = Bibliotheek met foutmodellen van kwantumapparaten

seg-e42eabe9bc2a = Apparaatkaarten (optisch, gevangen-ion en kwikion, plus klassieke klokken hergebruikt uit holdover/clock_state; koude-atoom-interferometer; klassieke tijdoverdrachtlinks en links met verstrengeling of enkele fotonen), elk met een representativiteitsrecord; de verstrengelingslink voegt een door shotruis begrensd model voor de tijdsprecisie toe (~jitter/sqrt(R*tau), straf voor donkere tellingen, systematische ondergrens).

seg-632600203e1f = Hergebruikte klok- en CAI-coëfficiënten (holdover/clock_state, gepubliceerde waarden) plus identiteiten voor shotruis en verlies in gesloten vorm voor de verstrengelingslink

seg-86d71fd89f26 = Betrouwbare kwantumtijdsynchronisatie (tijdoverdracht, beveiligde verspreiding en anomalie)

seg-d2a3d37825ef = Volledige keten voor kwantum- tegenover klassieke tijdoverdracht (klokdoorloop en linkprecisie in kwadratuur), een hergebruikt beschermingsniveau voor tijdsynchronisatie, een beveiligingskwaliteitsmaat voor vertragings- en replay-aanvallen (1-P_md) en een detectiekans voor klokanomalieën plus CUSUM-latentie, uitgegeven als eerlijk TradeEvidence met een representativiteitsrecord.

seg-ac95d112a17a = Budget in gesloten vorm in kwadratuur over hergebruikte getoetste kernels (ADEV tegenover Stable32/NIST; TPL-grens; detectie analytic_pd/pmd); eerlijkheid gekoppeld aan het representativiteitsregister

seg-eaf341ff4522 = GNSS-vrije kwantumnavigatie

seg-908a44a9f7c7 = Kwantum (koude-atoom-interferometer) tegenover klassieke dead-reckoning met een INS van navigatiekwaliteit tijdens een GNSS-uitval: groei van de positiefout, holdover tot een positiedrempel, en de afweging kwantum tegenover klassiek als eerlijk TradeEvidence; eerlijke opmerking over waarneembaarheid (bias is niet waarneembaar zonder positiebepaling, dus de fout groeit).

seg-508f2c8884e2 = Hergebruikte inertiabudgetten gecontroleerd aan een onafhankelijke Octave-dubbele-integratie van dezelfde dead-reckoning-ODE (andere runtime, gedeeld model → ReferenceImpl) plus de gepubliceerde kortetermijnruis van Freier-2016 als eenzijdig anker; het samengestelde kwantum-tegenover-klassiek-resultaat blijft MODELLED

seg-914132833f5a = Detectie van fouten en anomalieën voor kwantum-PNT-systemen

seg-f20392820b9d = Gelabelde catalogus van kwantumfouten (klokfrequentiesprong, drift, lock-verlies; sensorbiassprong, uitval), een detectiestatistiek-ROC-AUC met een bootstrap-betrouwbaarheidsinterval, en een minimaal detecteerbare fout bij een vast valse-alarmpercentage; een door een kwantumklok ondersteunde monitor detecteert kleinere fouten dan een klassieke, uitgegeven als eerlijk TradeEvidence.

seg-a689ab2ebb84 = Gaussische AUC in gesloten vorm = Phi(mu/(sigma*sqrt2)) gecontroleerd aan de extern getoetste eval_stats::bootstrap_auc_ci (tegenover scikit-learn) plus analytische detectiedrempels

seg-0633e05d393f = Aandrijfmomentvrije stijve-lichaam-standdynamica

seg-23f43007bcbf = De rotatiebewegingsvergelijkingen van Euler (I ω̇ = τ − ω × Iω, hoofdas- en algemene traagheidstensor) gekoppeld aan quaternionkinematica van de stand (q̇ = ½ q ⊗ ω) en gepropageerd met een RK4-integrator met vaste stap die de quaternion bij elke stap hernormaliseert

seg-2d21a01ea132 = Basilisk { "2.9.1" } propagatie van het stijve lichaam van de ruimtevaartuighub (AVSLab, ISC; MRP-stand via zijn eigen gekoppelde hubvergelijkingen, svIntegratorRKF78 bij relatieve tolerantie { "1e-12" }), een onafhankelijke implementatie van de aandrijfmomentvrije stijve-lichaamsvergelijkingen: de RK4-quaternion van Kshana (dt { "0.01" } s) en de lichaamssnelheden komen overeen binnen { "1e-9" } over { "1e4" } s op twee algemene niet-diagonale traagheden (slechtste { "3.3e-11" } en { "3.4e-12" } rad/s); tolerantie vastgelegd vóór de vergelijking. Getoetste claim: aandrijfmomentvrije beweging; de term voor extern moment is niet vergeleken. De controles op behoudswetten en de symmetrische tol blijven bestaan als ondersteunende zelfconsistentie. Geen omgeving met flexibele lichamen, regellus of extern moment

seg-93b8ba1ba0e5 = Relatieve-bewegingsdynamica van Clohessy–Wiltshire en Hill

seg-17f27a95d009 = Relatieve beweging van een chaser rond een target op een cirkelvormige referentiebaan in het LVLH-stelsel: de gelineariseerde Clohessy–Wiltshire-vergelijkingen (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) opgelost met de toestandsovergangsmatrix Φ(n,t) van { "6" }×{ "6" } in gesloten vorm (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) met de begrensde relatieve-baanvoorwaarde ẏ₀=−2n·x₀, en een tweede-ordecorrectie in gesloten vorm (cw_dynamics::second_order_correction, de CW-respons op de kwadratische termen van de exacte vergelijkingen met een cirkelvormige chief; Karlgaard en Lutze { "2003" }, Newman, Lovell en Pratt { "2015" }), samengesteld als cw_dynamics::propagate_second_order. De getoetste uitvoer is propagate_second_order; de lineaire Φ alleen is gekarakteriseerd tegenover niet-lineaire referentie, niet getoetst

seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, tweelichamen, LOFType.QSW, als apart programma uitgevoerd (fixture ongewijzigd sinds ronde { "1" }). Vooraf geregistreerde drempel van { "1e-3" } m op elke sample van elk geval; de tweede-orde-enginecorrectie is er ongewijzigd opnieuw tegen gedraaid (amendement 8c8e768d, geschreven voordat de propagator bestond, met de bekendmaking dat de eerste-ordeverschillen bekend waren). propagate_second_order komt overeen binnen { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } en { "2.2e-8" } m; halvering van de tweede-orde-term faalt bij { "1.85e-3" } tot { "3.14e-3" } m. De lineaire Φ alleen wijkt { "1.2" } tot { "6.3" } mm af van de niet-lineaire referentie bij { "100" } m over een derde van een baan (de weggelaten tweede-orde-term; de strikte test ervan blijft genegeerd), dus ze is gekarakteriseerd, niet getoetst. Interne controles behouden: Φ tegenover een RK4-integratie van de Hill-vergelijkingen, Φ(t)Φ(−t)=I, de identiteiten voor de begrensde baan en de driftterm −12π·x₀, en de derde-ordeschaling van de restterm van de tweede-orde-term. Bereik: cirkelvormige chief, afstanden bij benadering { "100" } m, tot een derde van een baan; geen excentriciteit (Tschauner–Hempel), geen J2- of differentiële-weerstandstermen; aanname van kleine afstand

seg-d31be81dfd8f = Passieve geolocatie van zenders via TDOA/FDOA

seg-aa870cee16f6 = Een zender lokaliseren (jammer of spoofer, of een opportunistische bron voor omgekeerde PNT) uit het tijdverschil van aankomst over een ontvangernetwerk — de snijding van hyperboloïden τᵢ=(Rᵢ−R₀)/c opgelost met Gauss–Newton-kleinstekwadraten — en, door het frequentieverschil van aankomst (verschillen in afstandssnelheid) met bewegende ontvangers toe te voegen, positie en snelheid gezamenlijk terugvinden; met de Cramér–Rao-ondergrens op de positiecovariantie uit de meetgeometrie

seg-17b45796fd43 = Zelfconsistentie van de schatter en de geometrie: round trips voorwaarts→invers, de Fisher/CRLB-identiteit J·CRLB=I, monotoniciteit van GDOP, en de schatter die zijn eigen Cramér–Rao-grens bereikt onder Monte-Carlo-ruis — controles op interne consistentie, GEEN externe dataset, dus de rij blijft InternalConsistency. MODELLED passieve geolocatie — puntbronmodel met zichtlijn; geen termen voor multipath, NLOS, ontvangerklokbias of atmosferische refractie. { "0.30" } ronde { "2" }, tegenover Ho en Chan { "1993" } en Ho en Xu { "2004" } (preregistratie f89018b8, { "1" } % van elke afgedrukte waarde), een bevinding (blijft MODELLED): de door het oppervlak begrensde TDOA-grens reproduceert de geometrische factoren bij { "40" } N (-0.11 %, -0.02 %) en de maximale TDOA; de gezamenlijke TDOA+FDOA-grens reproduceert Fig. { "6" } (+{ "0.06" } %, -0.17 %) en, bij de bron die de eigen code van de auteurs voor Fig. { "7" } noemt (amendement geschreven nadat dat resultaat was gezien, bekendgemaakt), Fig. { "7" } (+{ "0.11" } %, -0.02 %); ze is gelijk aan de gepubliceerde grenscode van de auteurs (BSD-stijl, uitgevoerd onder GNU Octave) tot { "3e-12" }; de covariantiegewogen maximum-likelihood-oplosser bereikt de afgedrukte grens (+{ "0.3" } tot +{ "0.4" } %). De factoren voor Ottawa die het artikel afdrukt uit een Monte-Carlosimulatie ({ "251" }, { "7.1" }) wijken +{ "1.3" } % en +{ "4.4" } % af, buiten de drempel van { "1" } %

seg-36b74b49f82f = Piekvertraging bij ballistische binnenkomst met 3 vrijheidsgraden tegenover het gepubliceerde nominale geval van Stardust

# c1: entry-heating
seg-a05ca2fde6fc = Een binnenkomst van een puntmassa met 3 vrijheidsgraden boven een roterende bolvormige aarde door de US Standard Atmosphere { "1976" }, met RK4 geïntegreerd vanuit een inertiale binnenkomsttoestand, met rapportage van de piekvertraging en haar hoogte; de planeetrelatieve binnenkomsttoestand uit de inertiale. Uitvoerbaar als scenariosoort <c1/>.

seg-5ab7065c0803 = Het nominale geval van Stardust van Desai, Mitcheltree en Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximale vertraging { "33.4" } g vanaf { "12.6" } km/s planeetrelatief met de lanceermassa van { "45.8" } kg, een POST-traject met 6 vrijheidsgraden en de volledige aerodynamische database; binnenkomstinterface van Desai, Lyons, Tooley en Kangas (NTRS { "20090004445" }): straal { "6503.14" } km, inertiaal { "12.9" } km/s bij -8.2 graden. Drempels vooraf geregistreerd in xval/entry-stardust/PREREGISTRATION.md vóór elke run op deze invoer; beide gehaald bij de eerste run. WAT HET NIET IS: één gepubliceerd geval en één grootheid (piekvertraging, die in de ballistische benadering niet afhangt van de ballistische coëfficiënt); de breedtegraad en koers van de binnenkomst zijn aangenomen; verhitting, warmtebelasting en het landingspunt zijn er niet mee vergeleken; puntmassa met constante C_D, niet 6 vrijheidsgraden.

seg-5bd3882531b6 = Convectieve binnenkomstverhitting in het stagnatiepunt (Sutton-Graves) bij een binnenkomst met 3 vrijheidsgraden

seg-4f97036ed72f = Convectieve warmteflux in het stagnatiepunt q = k sqrt(rho/R_n) V^{ "3" } met de Sutton-Graves-constanten voor lucht op aarde en de atmosfeer van Mars (NASA TR R-376, { "1971" }), haar piek en de geïntegreerde warmtebelasting langs een binnenkomst met 3 vrijheidsgraden, ballistisch of dragend bij constante rolhoek, op aarde of Mars.

seg-5a203ecfeaee = Interne consistentie: de relatie en constanten zoals afgedrukt in NASA TR R-376, een convergentiecontrole met halve stap, en de verwachte volgorde van de pieken in verhitting en vertraging. WAT HET NIET IS: er is geen gepubliceerde verhittingswaarde vergeleken (de Stardust-artikelen geven een ontwerplimiet en een schatting van convectief plus stralend van ongeveer { "1200" } W/cm2, die een uitsluitend convectieve relatie niet kan evenaren); geen correctie voor stralingsverhitting, wandtemperatuur of katalyse, en geen respons van het hitteschild.

seg-1b96577665fc = Radiometrie, MTF, relatieve randrespons en GIQE-{ "4" }-NIIRS van elektro-optische beeldvormers

# c1: eo-radiometry
seg-38902593e841 = Signaal-ruisbudget van een nadirbeeldvormer (Lambertiaanse scènestraling, cameravergelijking, shot-, donker-, lees- en kwantisatieruis), de systeem-MTF bij Nyquist als product van diffractie van een onbelemmerde apertuur, detectorapertuur, lineaire smeer en Gaussische jitter, de randrespons en de relatieve randrespons geïntegreerd uit die MTF, Q = lambda F / p, en de GIQE-versie { "4" }-NIIRS zonder MTF-compensatie. Uitvoerbaar als scenariosoort <c1/>.

seg-bb3a01edc95d = Gesloten vormen: de diffractie-MTF bij de halve afsnijfrequentie, de randhelling van één pixel van een zuivere detectorapertuur (RER { "1" }), de normale-CDF-rand van een Gaussische vervaging (RER = erf(0.5/(sigma sqrt { "2" }))), schaling van shotruis, en de GIQE-{ "4" }-coëfficiënten zoals gepubliceerd (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). WAT HET NIET IS: er is geen externe beeldvormer, gemeten MTF of beoordeeld beeld vergeleken; de GIQE is een empirische regressie met een eigen fout; geen strooilicht, atmosferische MTF, MTF-compensatie of aliasing.

seg-07ca77a67207 = Verliezen door zwaartekracht, weerstand, sturing en tegendruk bij lanceeropstijging

# c1: ascent-losses
seg-7a1802cf2c80 = Vlakke zwaartekrachtbochtopstijging van een voertuig met meerdere trappen boven een niet-roterende bolvormige aarde door de US Standard Atmosphere { "1976" } (dichtheid en druk), met een pitch-kick, een door de tegendruk van het mondstuk verminderde stuwkracht, uitbranden van trappen op exacte stapgrenzen, en de verliezen door zwaartekracht, weerstand, sturing en tegendruk naast de toestand geïntegreerd. Uitvoerbaar als scenariosoort <c1/>.

seg-174ed29adbbe = Interne consistentie: de exacte identiteit uitbrandsnelheid = som Isp g0 ln(m0/mf) min de vier geïntegreerde verliezen (rest onder { "1e-6" } m/s), de vergelijking van Tsiolkovski bij een verticale vacuümverbranding met zwaartekracht als enig verlies, en de US76-druk op zeeniveau en bij de tropopauze. WAT HET NIET IS: de verliezen van geen enkel gepubliceerd voertuig zijn vergeleken; geen aardrotatie, coast, throttling of geleiding buiten de kick; constante C_D; geen trajectoptimalisator.

seg-55e8345def8b = TWSTFT-tweewegvergelijking, onzekerheidsbudget en linkstabiliteit met flikker en dagelijkse niet-reciprociteit

# c1: time-transfer-budget
seg-5ca5226c24ec = De TWSTFT-tweewegvergelijking opgelost voor T_A - T_B met zend- en ontvangstvertragingen van de stations, de ionosferische op-/neerwaartse asymmetrie in de Ku-band, het vertragingsverschil van de transponder en de Sagnac-termen, tegenover haar exacte voorwaartse model; een onzekerheidsbudget in kwadratuur met de link-TDEV als type-A-term; een tweewegreeks met witte en flikkerfaseruis (Kasdin-Walter), een dagelijkse niet-reciprociteit en een constante reciprociteitsrest; en de snelheid, rest-RMS, TDEV en ADEV van aangeleverde stationsklokreeksen in Circular T, MJD-CSV of IGS RINEX. Uitvoerbaar als scenariosoort <c1/>.

seg-244f7396ac25 = Interne consistentie: het voorwaartse model en de opgeloste vergelijking komen overeen tot { "1e-15" } s, de Sagnac-term is gelijk aan de onafhankelijke BIPM-2A-omega/c^{ "2" }-lusvorm van de module, de ionosferische term is { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, en de ruisprocessen tonen hun verwachte TDEV-vormen. WAT HET NIET IS: er is geen echte TWSTFT-meting of kalibratierapport vergeleken; de opgegeven vertragingen en onzekerheden zijn invoer, niet gemeten; de stabiliteiten van aangeleverde reeksen worden gerapporteerd, niet getoetst.

seg-2f9be02c92bc = Numerieke methoden voor de optische atmosfeer langs een schuin pad: Rytov-variantie, scintillatie, gamma-gamma-fadekans, apertuurmiddeling, optische diepte van wolken en heldere lucht

# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley-Cn2 geïntegreerd langs een schuin pad voor de Rytov-variantie van vlakke en bolvormige golven (uplink en downlink), de scintillatie-index van Andrews-Phillips en de gamma-gamma-parameters, de gamma-gamma-fadekans en fademarge, de zwakke-turbulentie-apertuurmiddelingsfactor, de optische wolkendiepte van een vloeibaarwaterkolom en de optische diepte van heldere lucht uit Kim-zicht plus Rayleigh, ter vervanging van het samengevoegde atmosferische verlies van het optische linkbudget wanneer een atmosfeer wordt aangeleverd. Uitvoerbaar binnen de scenariosoort <c1/>.

seg-7ca512adff99 = De numerieke methoden zijn vergeleken met een onafhankelijk programma (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } met { "30" } cijfers, tanh-sinh-kwadratuur op de oorspronkelijke hoogtevariabele en Bessel-K-gamma-gammadichtheden) dat geen code met Kshana deelt, onder drempels die zijn vastgelegd voordat er een implementatie bestond (xval/optical-atmosphere/PREREGISTRATION.md). WAAROM MODELLED: die onafhankelijke referentie evalueert dezelfde gepubliceerde formules, dus ze controleert de implementatie van de genoemde formules en niet de atmosfeer; er is geen ITU-R-validatievoorbeeld en geen gemeten scintillatie- of extinctieregistratie langs een schuin pad gebruikt (de ITU-waarden vormen een openstaand licentiebesluit en blijven buiten de repository). Het niveau van het Cn2-profiel, het zicht, de schaalhoogten van aerosol en moleculen, de padlengte voor apertuurmiddeling en de momentenmatching waarmee apertuurmiddeling op de gamma-gamma-parameters wordt toegepast, zijn opgegeven invoer of conventies. Een bronregel in de module legt vast dat één veel gekopieerd overzicht de tweede scintillatie-exponent als 7/6 afdrukt waar Andrews en Phillips 5/6 geven; de 5/6-vorm is geïmplementeerd

seg-a2faab92e760 = Door het weer bepaalde beschikbaarheid van optische grondlocaties en met de afstand gecorreleerde locatiediversiteit

# c1: optical-atmosphere
seg-7f4e4e763d62 = Beschikbaarheid van een optische link tegenover een opgegeven linkmarge uit een lognormaal klimaat van vloeibaar water in wolken (hoeveelheid volgens ITU-R P.840, extinctie volgens geometrische optica) en de onafhankelijke gamma-gamma-turbulentiefade, de linkmarge die nodig is voor doelbeschikbaarheden en het plafond dat geen marge kan verhogen, lognormale uitvalduren, wat-als-scenario's voor verbeteringstechnieken, en een eenfactor-Gaussische-copula-netwerkbeschikbaarheid waarvan de paarcorrelatie exp(-afstand/decorrelatielengte) is. Uitvoerbaar als scenariosoort <c1/>.

seg-20eab6e9b925 = Interne consistentie: limieten en monotoniciteit van het diversiteitsmodel in gesloten vorm, de gesloten vorm van het wolkenplafond, en de lognormale uitvalidentiteiten. GEEN externe onafhankelijke referentie wordt geclaimd en er is er geen vergeleken: er is geen gemeten beschikbaarheid van een optisch grondstation of registratie van wolkvrije zichtlijnen gebruikt. WAAROM MODELLED: het wolkenklimaat (kans op wolken, mediaan en spreiding van de vloeibaarwaterkolom, uitvalduren), de onafhankelijkheid van wolken en turbulentie, de Gaussische-copulavorm, de decorrelatielengte en elke techniekwinst zijn aannames; de meegeleverde scenario's noemen ILLUSTRATIVE klimaten, geen dataset. Voor het verhogen van deze rij is een geciteerde gemeten beschikbaarheidsregistratie nodig en een drempel die vóór de vergelijking is vastgelegd

seg-043ece801e72 = Continuïteit van tijdsynchronisatie en afstandsmeting door optische uitval heen

# c1: optical-atmosphere
seg-bb9cb3fe4180 = De uitvalduurverdeling van een optische locatie gekoppeld aan de coastvariantie in gesloten vorm van het holdovermodel van de klok: fout in tijdsynchronisatie en afstandsmeting bij opgegeven uitvalkwantielen, de holdover tot een drempel voor tijdsynchronisatie, het aandeel uitvallen en uitvaltijd daarbinnen en de beschikbaarheid van tijdsynchronisatie A + U E[min(D, T_h)]/E[D], voor de klassieke en kwantumklokklassen. Uitvoerbaar binnen de scenariosoort <c1/>.

seg-ab2a33c1b1a4 = Interne consistentie met de holdovermodule, bit voor bit; GEEN externe onafhankelijke referentie wordt geclaimd. De klasse-PSD's zijn de gesynthetiseerde lange-tau-ondergrenzen die de holdovermodule al bevat, dus de cijfers erven haar genoemde kanttekening dat holdover tot een strakke drempel wordt bepaald door de aangenomen rode-ruisondergrens en niet door de geciteerde Allan-deviatie. De uitvalduren zijn een lognormaal model met opgegeven parameters, geen gemeten registratie van wolkverblijfduur

seg-b119df65d2a7 = Optische linkmarge tegenover de tijd: één geseede realisatie van het weer van een locatie

# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Een optionele tabel <c1/> (duur, stap, seed) laat de soort <c2/> per locatie ook één geseede realisatie van het opgegeven locatiemodel door de tijd heen schrijven: wolkenepisodes (heldere perioden exponentieel, wolkenuitval lognormaal met het opgegeven gemiddelde en de opgegeven spreiding, het tijdsaandeel in wolken ingesteld op de opgegeven wolkenkans), één lognormale vloeibaarwaterkolom per wolkenepisode, één gamma-gamma-scintillatiesample per stap, en daaruit de linkmarge, de wolken- en scintillatiefades en de vlag voor link omhoog, met de gerealiseerde beschikbaarheid, het wolkenaandeel, het aantal uitvallen en de langste uitval. Zonder de tabel is het resultaat het document van { "0.37" }. Trekkingen verlopen via de draagbare verdelings- en wiskunderoutines, zodat native en wasm32 dezelfde bytes geven.

seg-d25e5d2449bd = Alleen interne consistentie; GEEN externe onafhankelijke referentie wordt geclaimd en voor een weerrealisatie bestaat er geen. De controles vergelijken één trekking met de statistische uitvoer van hetzelfde model, dus een geslaagde controle zegt dat de generator de opgegeven verdelingen bemonstert (de beschikbaarheid en het wolkenaandeel van de trekking liggen binnen vooraf geregistreerde toleranties van de opgegeven cijfers), niet dat een echte locatie zich zo gedraagt. De reeks is één realisatie, niet het klimaat: haar beschikbaarheid wijkt van de opgegeven af met de bemonsteringsfout van de trekking, en scintillatiesamples bij verschillende stappen zijn onafhankelijk, een opgegeven vereenvoudiging van een proces dat in milliseconden decorreleert. De weerinvoer blijft een aanname van het scenario.

seg-58cbf576c959 = Lezer voor TRK-2-18-Orbit-Data-Files en gerampt Mars-2-wegs-Dopplermodel

seg-d1055650a77f = Een lezer voor DSN Orbit Data Files (TRK-2-18): de recordgroepen van 36 bytes (bestandslabel, identificatie, baandata, ramps per station, klokoffsets, samenvatting, einde van bestand), en in elk baandatarecord de tijdstempel sinds { "1950" }, downlink- en uplinkvertragingen, observabele, stations, datatype, banden, geldigheid, kanaal, ruimtevaartuig, de referentiefrequentie van 46 bit en de compressietijd; begin- en eindtijden, snelheden en beginfrequenties van ramps. Daarbovenop een gerampt 2-wegs-X-band-Dopplermodel (geïntegreerde uplinkramps, heen-en-terug-lichttijd met Shapiro en troposfeer, DSN-stations via de IAU 2006/2000A-CIO-keten en IERS-EOP, stationstijd) en een batchbaanbepaling voor een Mars-orbiter (GMM-3-veld, derde lichamen, SRP, weerstand).

seg-6d533149f6f0 = Het PDS3-label dat het DSN-navigatieproces voor datacondicionering met het bestand heeft voortgebracht (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), gecontroleerd tegenover drempels die vooraf zijn geregistreerd in xval/mro-odf/PREREGISTRATION.md voordat de lezer bestond. MODELLED omdat één geregistreerde drempel (de rijen van de einde-van-bestand-tabel, { "121" } in het bestand tegen { "120" } in het label) werd gemist; het label is daar intern inconsistent. Fase { "2" } (xval/mro-od/PREREGISTRATION.md, amendementen A1 en A2 vóór het beoordeelde resultaat): de Doppler voorspeld uit de reconstructie van het MRO-navigatieteam (mro_psp5, NAIF) komt overeen met de waargenomen gerampte 2-wegs-Doppler tot { "12.5" } mHz op passages die niet in de ontwikkeling zijn gebruikt, drempel gehaald; de geregistreerde baanbepaling faalde op de beoordeelde boog (normaalmatrix niet positief definiet) en leverde geen baan op, dus de baandrempels zijn niet gehaald. Run { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, een gedempte schatter, dezelfde boog en drempels, een beoordelingsamendement R2-A1 bekendgemaakt in docs/revisions) convergeerde: de geschatte baan ligt binnen { "0.36" } km RMS ({ "0.53" } km maximum) van de reconstructie, drempels gehaald, maar de post-fit-Doppler-RMS is { "48.6" } mHz tegen de drempel van { "30" } mHz, niet gehaald, dus de rij blijft MODELLED. WAT HET NIET IS: geen enkele geschatte baan heeft elke geregistreerde drempel gehaald; ionosfeer, zonneplasma en het grootste deel van de antenne-offset (een radiale offset van { "1.5" } m wordt op de ontwikkelingspassage gefit) zijn niet gemodelleerd.

seg-c7d292f14693 = Standregeling in gesloten lus met MRP-terugkoppeling en reactiewielen

# c1: aocs
seg-f33781b74cc2 = Standregeling voor inertiale richting van een stijve hub met drie of meer gebalanceerde reactiewielen: de MRP-terugkoppelwet L_r = -K sigma_BR - P omega_BR (Schaub en Junkins), motorkoppels van de wielen met minimale norm G_s u = -L_r begrensd op de limiet van elk wiel, de gekoppelde dynamica van hub en wielen waarbij de hubtraagheid de spintraagheid van de wielen bevat, quaternionkinematica, RK4 met een zero-order hold. Uitvoerbaar als scenariosoort <c1/> (lus met ware toestand).

seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; de bsk-wielrun als apart hulpmiddel uitgevoerd, nooit gelinkt of meegeleverd): ruimtevaartuighub, reactionWheelStateEffector (BalancedWheels, koppellimiet aan), simpleNav, inertial3D, attTrackingError, mrpFeedback (zonder integrerende term) en rwMotorTorque bij dt = { "0.1" } s met zijn RK4, tegenover de eigen implementatie van Kshana op drie gevallen (drie orthogonale wielen; een piramide van vier wielen; een verzadigend geval met vier wielen), drempels vooraf geregistreerd in xval/aocs-basilisk/PREREGISTRATION.md vóór de code en de run. Alle drempels zijn bij de eerste run gehaald. WAT HET NIET IS: sensorruis in de lus, integrerende terugkoppeling, trackinggeleiding, wielwrijving, jitter, toerentalgrenzen en vermogen, de versterkingen van enig echt ruimtevaartuig; de vergelijking controleert de implementatie van de wet en de dynamica tegenover een onafhankelijke implementatie, geen vluchtregelaar.

seg-455dc946c965 = Multiplicatieve-EKF-standschatting uit een gyro en een sterrenvolger

# c1: aocs
seg-553d043438b4 = De multiplicatieve EKF van Lefferts-Markley-Shuster: standfout in het lichaamsstelsel en gyrobias als toestanden, propagatie met de gyrosnelheid min de biasschatting en het discrete procesruis van Farrenkopf (hoek- en snelheidsrandomwalk), sterrenvolgerupdates met het residu { "2" } vec(q^-1 q_st) in Josephvorm, en de multiplicatieve reset; een discrete gyro- en sterrenvolgersimulator volgens Farrenkopf. De soort <c1/> kan de regellus sluiten op zijn schatting.

seg-846cb1eeb35c = Interne consistentie: de genormaliseerde geschatte kwadratische fout van het filter tegenover een referentie die met dezelfde sensormodellen over Monte-Carlo-seeds is gesimuleerd, en convergentie van de schattingen van stand en bias. WAT HET NIET IS: er is geen externe schatter of vluchtdata vergeleken (Basilisk { "2.9.1" } heeft geen MEKF-module); de sensormodellen zijn die uit het leerboek, zonder misalignment, schaalfactor of effecten van het beeldveld van de sterrenvolger.

seg-059732bda693 = Standbepaling met Wahba/TRIAD/QUEST

seg-3ee6e56d790f = Optimale driedimensionale stand uit gewogen vectorwaarnemingen (richtingen van ster, zon en magnetometer): de deterministische tweevectormethode TRIAD, de q-methode van Davenport (de exacte minimalisator van het Wahba-verlies — het optimale quaternion is de eigenvector bij de grootste eigenwaarde van de Davenport-matrix K van { "4" }×{ "4" }, opgelost met een symmetrische Jacobi-eigenwaardenoplosser), en QUEST (Newton/secant-wortel van de karakteristieke vergelijking van K met als startwaarde Σ gewichten, daarna herstel van het quaternion via de Gibbs-vector)

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — de Kabsch/Markley-SVD-oplossing van het probleem van Wahba, een werkelijk onafhankelijk algoritme (SVD van de standprofielmatrix) en codebasis ten opzichte van de Davenport-K-eigenwaardenoplossing en de QUEST-methode met karakteristieke wortel van kshana, die DEZELFDE eenduidig gedefinieerde Wahba-optimale stand berekent. Op ruisvrije sets van gewogen vectorwaarnemingen reproduceren TRIAD, de q-methode en QUEST de optimale rotatie van scipy tot <{ "1e-9" } rad (vergeleken via de tekeninvariante standfouthoek). De statistische bewering uit Monte Carlo met ruis dat 'optimaal TRIAD verslaat' blijft MODELLED (geen externe onafhankelijke referentie); alleen waarnemingen van eenheidsvectoren in puntrichting — geen modellering van beeldveld, bias of temporele correlatie van sensoren, en QUEST is singulier bij { "180" }° (de q-methode dekt dat geval)

seg-cd342cc48afc = Detectiestatistieken van GNSS-acquisitie met kwadratische detector

seg-6d97452de33e = Kwadratische (niet-coherente) acquisitiedetector over een zoektocht in codefase × Doppler: kans op vals alarm (centrale χ² met 2M vrijheidsgraden), de drempel die een doel-P_fa bereikt (χ²-CDF omgekeerd door bisectie), en detectiekans (niet-centrale χ² met niet-centraliteit 2M·ρ voor de snr ρ per cel na correlatie), met de gegeneraliseerde Marcum-Q-functie Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — een onafhankelijk algoritme (kettingbreuk voor niet-centrale en centrale χ²) ten opzichte van de incomplete-gammareeks van kshana (raim::chi2_cdf / noncentral_chi2_cdf), dat dezelfde eenduidig gedefinieerde detectiestatistiek-KERN berekent: de gegeneraliseerde Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), de detectiekans P_d, de kans op vals alarm P_fa en de inversie P_fa→drempel, overeenkomend tot ~{ "1e-6" } — dezelfde onafhankelijkheidsbasis als de getoetste rij 'statistische RAIM/ARAIM-integriteitskernel'. Alleen de KERN: de CFAR-celmiddeling per cel en het straddlingverlies van code- en Doppler-bins blijven MODELLED

seg-77f425a38aa2 = Geheeltallige ambiguïteitsoplossing voor GNSS-draaggolffase (LAMBDA)

seg-410ce8b6cebf = Geheeltallige kleinstekwadraten voor ambiguïteitsfixatie volgens LAMBDA: een volumebehoudende geheeltallige (Z) decorrelerende transformatie (geheeltallige-Gauss-grootteverkleining van de L D Lᵀ-factor) plus een exacte Schnorr–Euchner-depth-first-branch-and-bound-zoektocht naar geheeltallige kleinste kwadraten, met de ratiotest op de twee beste kandidaten (de getoetste claim); plus het succespercentage van de bootstrap in gesloten vorm P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), alleen intern gecontroleerd en buiten de getoetste claim

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (zijn bronbestand lambda.c, T. Takasu, BSD-2-Clause), een onafhankelijke LAMBDA-reductie en MLAMBDA-zoektocht, gecompileerd uit C en als hulpmiddel uitgevoerd, op { "300" } willekeurige covarianties (n { "2" } tot { "10" }): geheeltallige kleinste kwadraten hebben een unieke minimalisator, dus de gefixeerde gehele getallen moeten identiek zijn ({ "0" } afwijkingen) en de twee beste gekwadrateerde normen, die de ratiotest voeden, komen relatief overeen tot { "1e-9" } (gemeten { "5.6e-13" }); tolerantie vastgelegd vóór de vergelijking. Getoetste claim: de ILS-oplossing en haar twee beste normen. RTKLIB berekent het succespercentage van de bootstrap niet; dat blijft intern gecontroleerd tegenover een Monte-Carlosimulatie van het afrondingsproces; de invarianten van de Z-transformatie en de brute-force-enumeratie blijven bestaan als ondersteunende controles. Alleen geheeltallige-Gauss-decorrelatie (de herordeningspermutaties van de volledige LAMBDA-reductie versnellen de zoektocht, maar veranderen noch het exacte ILS-antwoord noch het bootstrap-percentage)

seg-4ad1ec05610f = B-vlakrichting en gravity assist met aaneengesloten kegelsneden

seg-d249aea7c3ea = Geometrie van een hyperbolische flyby (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, draaihoek δ={ "2" }·asin(1/e), botsingsparameter |B|=|a|·√(e²−{ "1" })), het B-vlak-richtpuntstelsel Ŝ/T̂/R̂ en de ontbinding B·T̂/B·R̂, en een gravity assist met aaneengesloten kegelsneden (grootte van v∞ behouden, richting afgebogen over δ, heliocentrische Δv={ "2" }·v∞·sin(δ/2) zonder brandstofkosten) met de Tisserand-parameter T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, als apart programma uitgevoerd) op { "192" } hyperbolische aardtoestanden: B.T, B.R en |B| binnen { "1e-6" } km (slechtste { "1.35e-8" } km), de draaihoek en beide asymptoten binnen { "1e-9" } rad (slechtste { "9.3e-15" } rad); de snelheidsverandering van de assist uit GMAT-C3 en asymptoten binnen { "1e-9" } v_inf (slechtste { "5.6e-14" }); heliocentrische SMA, ECC en INC op { "350" } zonscentrische toestanden voor en na de assist binnen { "1e-9" } relatief en { "1e-12" } rad (slechtste { "2.2e-14" } en { "4.1e-14" } rad); de Tisserand-parameter tegenover sbpy { "0.6.0" } (BSD-3) op GMAT-elementen binnen { "1e-9" } (slechtste { "1.3e-15" }) en tegenover { "3" } - C3/v_c^{ "2" } ({ "8.9e-16" }); en de gesloten vorm van Tisserand tegenover Kasuga en Jewitt ({ "2019" }) Tabel { "8.1" } voor { "12" } objecten binnen de grens van de afgedrukte afronding (slechtste { "0.39" } ervan; een gepubliceerde uitgewerkte waarde van P1). Vooraf geregistreerd (436293bf; heliocentrisch herstel 6fd9f5e6); amendement 374c806b, geschreven nadat de referentiebestanden waren gegenereerd en vóór enige Kshana-waarde, verruimde het invoerfilter voor inclinatie van { "1e-2" } naar { "1e-3" } rad, waardoor meer en slechter geconditioneerde toestanden behouden bleven. MODELLED bereik: flyby met aaneengesloten kegelsneden en twee lichamen op een cirkelvormige planeetbaan, zonder overgang tussen invloedssferen, verstoringen bij de ontmoeting of efemeride

seg-8e82da17a463 = Anti-jamming-arraybeamforming met CRPA

seg-1744f527b4d1 = Nulsturing van een antenne met gecontroleerd ontvangstpatroon: complexe array-stuurvectoren a(û)=exp(j·k·pₙ·û), deterministische nulsturing (eenheidsversterking richting de SV, exacte nullen richting maximaal N−{ "1" } jammers via de minimumnorm w=Aᴴ(AAᴴ)⁻¹b), en adaptieve MVDR-gewichten w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) die diepe nullen zelf op sterke interferenten richten (met een complexe lineaire-algebrakernel vanuit het niets)

seg-8016dae66350 = numpy.linalg / scipy.linalg (complexe LAPACK-zgesv-oplossing) — een onafhankelijke lineaire-algebracodebasis ten opzichte van de complexe kernel van kshana vanuit het niets, die DEZELFDE eenduidig gedefinieerde gewichten berekent: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) en nulsturing met minimumnorm w=Aᴴ(AAᴴ)⁻¹b, plus de resulterende arrayresponsversterkingen, overeenkomend tot ~{ "1e-9" } — dezelfde klasse onafhankelijke referentie als de getoetste rijen voor DOP (gnss_lib_py) en Fisher-informatie (numpy). MODELLED smalbandige verre-veld-array met identieke isotrope elementen — geen onderlinge koppeling, mismatch per element, eindige bandbreedte (STAP) of schattingsfout van de stuurvector

seg-f2c973f14d52 = IEEE-1139-klokruis met machtswet plus flikker-FM-ondergrens

seg-4a0159558671 = De IEEE-1139-conversie tussen PSD en Allan-variantie met vijf coëfficiënten S_y(f)=Σh_α f^α → σ_y²(τ) (witte en flikker-PM, witte, flikker- en randomwalk-FM), de flikker-FM-ondergrens σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) als eersteklas fitbare term, en een niet-negatieve fit in de FM-familie in de basis { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" } die de ondergrens terugvindt die de driftbasis { "{" }1/τ,τ,τ³{ "}" } niet kan weergeven

seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; coëfficiënten van Kasdin & Walter { "1992" } / Vernotte { "2015" }) — een onafhankelijke codebasis van derden met eigen citatielijn die DEZELFDE eenduidig gedefinieerde IEEE-1139-conversie van PSD naar Allan σ_y(τ) berekent voor elk van de vijf machtswetruistypen. powerlaw::allan_deviation van kshana komt overeen met de gesloten vormen van allantools (witte FM, flikker-FM, RW-FM en witte PM tot <{ "5e-9" } relatief; flikker-PM tot ~{ "1e-5" } — het werkelijke onafhankelijkheidssignaal, doordat kshana de getabelleerde constante { "1.038" } uit NIST-SP-1065 gebruikt tegenover de volledige 3γ−ln2 van allantools), en de flikker-FM-ondergrens √({ "2" } ln2·h_{ "{" }-1{ "}" }) komt over de hele reeks overeen met allantools — dezelfde drempel die de getoetste rijen voor MDEV/TDEV/Theo1/MTIE halen. MODELLED stationair machtswetmodel — geen deterministische driftterm (τ²); coëfficiënten per apparaat en gemeten ondergrenzen blijven uit een model berekend

seg-cc1ac065e684 = Uitwisseling van het covariantieblok van CCSDS-OEM

seg-ec4d44e7cf78 = Het CCSDS-{ "502.0" }-OEM-blok COVARIANCE_START…COVARIANCE_STOP serialiseren en parsen — de positie/snelheid-covariantie van { "6" }×{ "6" } geschreven als haar onderdriehoek van 21 elementen (canonieke volgorde CX_X … CZ_DOT_Z_DOT) met de optionele COV_REF_FRAME, als aanvulling op de bestaande schrijver en parser van OEM-toestandsvectoren, zodat covarianties van baanbepaling en filters in het standaardformaat een round-trip doorstaan

seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — DEZELFDE onafhankelijke CCSDS-502-parser die de getoetste rij 'CCSDS OEM-interoperabiliteit' vertrouwt, een volledig aparte codebasis (eigen KVN-tokenizer, toestandsmachine voor covariantiesecties en numpy-matrixopbouw). kshana zendt een volledig OEM-segment uit met zijn ongelabelde onderdriehoeks-COVARIANCE-blok met kale getallen; oem parseert het en reconstrueert de symmetrische { "6" }×{ "6" }, die element voor element overeenkomt met de invoercovariantie van kshana tot f64-afrondingsfout — een werkelijke uitwisselings-round-trip van bibliotheek tegen bibliotheek (vergeleken met de reconstructie van oem, niet met een nieuwe parse van kshana), waarmee het eerdere hiaat 'geen fixture van derden' van de rij wordt gedicht

seg-ae061c7f082c = Foutgroei bij INS/TRN-coasting en drempeloverschrijdingen

# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Budget van positiefout tegenover coastduur, opgebouwd uit IMU-coëfficiënten, waarbij elke foutbron (versnellingsmeterbias, gyrobias, snelheidsrandomwalk, hoekrandomwalk, schaalfactor tijdens cruise en onder aanhoudende specifieke kracht) wordt gepropageerd door een INS-foutmodel met negen toestanden in een lokaal horizontaal stelsel met de Schuler-terugkoppeling (inertial::coast::ErrorDynamics naar Groves 2e druk hoofdstuk { "14" }: stand-, snelheids- en positiefouten, het verticale kanaal met zijn zwaartekrachtgradiënt, WGS-84-stralen en normale zwaartekracht, een horizontaal platform dat met de ingestelde snelheid naar het noorden gaat, latitude_deg en height_m; systematische termen via een uitgebreide matrixexponentiaal, randomwalks via Van Loan), waarbij de vlakke-aarde-monomen alleen als leading_order_m worden bewaard; bijdragen gecombineerd onder een opgegeven regel (rss / lineaire som / deterministische som met stochastische rss); de coastduur waarmee door de aanroeper opgegeven positiedrempels ({ "10" } m en { "50" } m standaard) worden bereikt, bepaald met een voorwaartse scan naar de eerste overschrijding (first_crossing_s, omdat de door Schuler begrensde krommen niet monotoon zijn), met de dominante bron bij elke overschrijding; en een TRN-begrensde modus die het grootste terreinfixinterval geeft dat elke drempel haalt. Uitvoerbaar als scenariosoort <c1/>

seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), als apart programma uitgevoerd onder GNU Octave { "8.4.0" }: vrije-inertie-coastruns met hetzelfde IMU-foutprofiel, met één gecorrigeerde numerieke dode band in zijn quaternionupdate (qua_update.m: de bewaking op een snelheid onder { "1e-8" } rad/s vervangen door wnorm == { "0" }, toegepast op een kopie tijdens de run en één keer geverifieerd dat ze overeenkomt; met de bewaking op zijn plaats bevroor de stand van een langzaam driftend platform en verbrak dat de Schuler-terugkoppeling). Vooraf geregistreerd (4262b969) met de gecorrigeerde generator voordat die werd uitgevoerd; de engine (440b3877) is gecommit voordat enige gecorrigeerde uitvoer werd geopend; dezelfde drempel van { "5" } %, { "48" } punten, termen, seeds en statistiek als ronde { "1" }. Resultaat: 48/48 binnen { "5" } % (slechtste +{ "3.70" } % snelheidsrandomwalk bij { "1200" } s, +{ "3.33" } % hoekrandomwalk bij { "1800" } s); bij { "3600" } s geven NaveGo/Kshana 2375.4/2376.2 m voor de versnellingsmeterbias en { "130" } 885/131 { "675" } m voor de gyrobias. Het op nul zetten van de Schuler-terugkoppeling van de transportsnelheid laat de test falen (+{ "695" } % bij { "3600" } s). Bekendgemaakt: voorspellingen voor één kanaal van Schuler en de NaveGo-waarden van ronde 1 waren bekend; het model heeft geen gefitte parameter. Bereik: de foutkrommen per term bij tactische klasse, { "45" } graden N, horizontaal en naar het noorden gericht, tot { "3600" } s; de overschrijdingen, de combinatieregel en de TRN-modus zijn deterministische functies van die krommen. De coëfficiënten van de IMU-klasse (bandcijfers uit Groves { "2013" } Tabel { "4.1" }) en de TRN-fixrest blijven MODELLED invoer. Ronde { "1" } (vervangen): de vlakke-aarde-monomen, nu leading_order_m, overschatten na { "600" } s (2.2x tot 8x na een uur). { "0.30" } herziening: elke ins-trn-coast-uitvoer verschuift (de piek van de TRN in het meegeleverde scenario { "52.932679" } -> { "44.711834" } m)

seg-a971ff07592a = Dienstcyclus van een apertuur voor navigatie tegenover communicatie

# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Eén run neemt een contactplan (een lijst vensters aos_s/los_s, die elk de apertuur vragen voor navigatie of communicatie — dezelfde vensterwoordenschat die <c1/> uitzendt, omgezet door <c2/>), een aantal aperturen en een expliciet arbitragebeleid, en geeft de navigatiedienstcyclus, de communicatiedienstcyclus, de ongebruikte dienstcyclus en de uitval per sessie terug. Het beleid is een invoer met een gedocumenteerde standaardwaarde (<c3/>; ook <c4/> en niet-onderbrekend <c5/>), en het rapport bevat het opgeloste beleid, de volledige definitie ervan en de definities van dienstcyclus en uitval, omdat een genoemde dienstcyclus zonder zijn arbitrageregel niet reproduceerbaar is. Het schema is een exacte intervalsweep over de vensterranden, zodat een venster dat precies eindigt waar het volgende begint nooit conflicteert, en apertuurseconden voor navigatie, communicatie en ongebruikt in die ene sweep onafhankelijk worden opgeteld. Uitvoerbaar als scenariosoort <c6/>

# c1: passes::predict_passes
seg-656fd7d44a9e = Interne consistentie, uit drie grootheden die in dezelfde sweep met verschillende uitdrukkingen worden berekend en daarna moeten sluiten. Apertuurseconden voor navigatie, communicatie en ongebruikt worden afzonderlijk opgeteld — ongebruikt uit (aperturen − |bediend|) per elementair interval, nooit als restant — en hun som wordt getoetst aan aperturen × horizon_s, wat een verkeerd omsloten rand, een dubbel geteld interval of een weggevallen interval onmiddellijk breekt; de bediende tijden per sessie moeten afzonderlijk weer optellen tot de twee dienstentotalen. De structurele eigenschappen van de planner worden gemeten in plaats van aangenomen: de bediende tijd moet niet-dalend zijn in het aantal aperturen over { "200" } pseudowillekeurige plannen voor alle drie de beleidsvormen (niet vanzelfsprekend voor het niet-onderbrekende beleid, waar een extra apertuur bij elke latere rand verandert wie wat bezet), en de randrekenkunde wordt vastgepind bij het paar dat elkaar raakt of een seconde overlapt waar een off-by-one zich anders zou verbergen. De brug naar de passagevoorspeller wordt gecontroleerd tegen de uitvoer van <c1/>: met één apertuur en geen concurrerende dienst zijn de apertuurseconden voor navigatie gelijk aan de eigen opgetelde passageduren van de voorspeller. Er wordt geen externe onafhankelijke referentie geclaimd en er bestaat er geen: de mogelijkheid vervangt handberekening in plaats van eraan getoetst te worden, het meegeleverde contactplan is illustratief en niet gevlogen, en geen operationele planner publiceert een paar van plan plus antwoord met zijn arbitrageregel vermeld — een dienstcyclus berekend onder een niet-vermeld beleid is niet vergelijkbaar met een berekend onder een vermeld beleid, en de beleidsafhankelijkheid wordt gemeten (navigatiedienstcycli van 100/150 tegenover 50/150 op hetzelfde plan). Slew- en omschakeltijd, datavolume, bufferstatus, energie en linksluiting zijn in het rapportlabel uitgesloten in plaats van stilzwijgend gemodelleerd

seg-43cd7aa7ab53 = RF-jamming van navigatie op het maanoppervlak (J/S per satelliet)

# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Maaneigen jammer-signaalverhouding, effectieve C/N₀ en verlies van lock voor een selenografische gebruiker aan het oppervlak onder een jammer op het maanoppervlak (of verhoogd), over de illustratieve constellatie van het type Moonlight/LCNS uit openbare bronnen. Stelt de open jammingketen samen (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) met de open maanhemelgeometrie (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); er wordt geen geometrie of radiometrie opnieuw afgeleid. In tegenstelling tot de aardse soort <c1/> is de signaalschakel geen vast ontvangen vermogen: het isotrope ontvangen vermogen van elke satelliet is zijn eigen linkbudget-EIRP − FSPL(schuine afstand), zodat J/S per satelliet verschilt met maanafstand en elevatie. Geeft ÉÉN RIJ PER ZICHTBARE LINK (epoch, satelliet) als JSON en als *.table.csv-artefact, met beide ontvangen vermogens waarvan J/S het verschil is ernaast afgedrukt; samengevatte kwaliteitsmaten staan naast die tabel, nooit in plaats ervan. Uitvoerbaar als scenariosoort <c2/>

seg-2a4393ae7c52 = Samenstellingscontrole tegenover een onafhankelijk codepad in dezelfde repository: elke J/S per link wordt opnieuw afgeleid als het verschil van twee linkbudgetten berekend met linkbudget::received_signal_power_dbw, waarvan het vrije-ruimteverlies de enkele uitdrukking { "20" }·log10(4πRf/c) is in plaats van de som van drie termen die jamming::free_space_path_loss_db gebruikt — de twee komen op elke rij overeen tot < { "1e-9" } dB (gemeten slechtste geval { "7.11e-14" } dB, dat wil zeggen floatafrondingsfout). De onderliggende interferentieketen die ze samenstelt, is apart extern verankerd in tests/gnss_denied_jamming_resilience_reference.rs (onafhankelijke numpy/scipy-herafleiding van J/S en effectieve C/N₀, vastgepind aan Kaplan & Hegarty §{ "9.4" }, plus gemeten C/N₀ van JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); de maangeometrie die ze samenstelt is de lunar_service/lunar-geometrie met zijn eigen onafhankelijke referenties. Identiteiten in gesloten vorm die hier worden gecontroleerd: een gehalveerde jammerafstand voegt exact { "20" }·log10({ "2" }) dB toe aan elke rij; J/S is exact invariant voor de versterking van de gebruikersantenne in de boresight terwijl C/N₀ precies met die versterking verschuift; een elevatiemasker verandert geen enkele overblijvende rij bit voor bit. De rij zelf blijft ReferenceImpl/berekend uit een model: er bestaat geen gemeten maanjammingcampagne om tegen te toetsen, en de constellatie is een illustratieve geometrie van het type Moonlight/LCNS uit openbare bronnen, geen gevlogen efemeride

seg-4c116e25c5c5 = Maanontzeggingscontour met een onzekerheidsband uit de gemeten spreiding van C/N₀

# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Het rapport <c1/> laat zijn ontzeggingscontour niet langer op één scalar rusten. Het geeft de volledige gemeten verdeling van de C/N₀ van het gewenste signaal over de tabel per satelliet — n, min, p05, p25, mediaan, p75, p95, max, gemiddelde, steekproefstandaardafwijking, en de eigen asymmetrie van de steekproef (p95 − mediaan) − (mediaan − p05) — naast de rijen per link, die ongewijzigd zijn. De contour wordt vervolgens bij elk van die rangstatistieken gerapporteerd onder BEIDE ontzeggingscriteria die de engine kent, nooit het ene in plaats van het andere: het bestaande criterium van de vermogensverhouding (J/S = { "30" } dB, dezelfde drempel die attack_surface en tracking_loop gebruiken, en het criterium achter de kolom <c2/> van de uitgebrachte tabel voor maan-linkjamming), en het criterium van verlies van lock (de effectieve C/N₀ die daalt tot tracking_threshold_dbhz), het criterium waarmee de eigen kolom links[].status van dit rapport wordt beoordeeld. Elk contourpunt wordt gegeven op beide assen van het ontzeggingsvlak — het jammer-EIRP dat nodig is bij de afstand van het scenario, en de ontzeggingsafstand bij het EIRP van het scenario — zodat de band een interval is op dezelfde assen waarop een contourplot wordt getekend. De bandranden ZIJN contour(p05) en contour(p95): dezelfde gesloten-vorm-afbeelding toegepast op de eigen kwantielen van de steekproef, geen sigma die aan de steekproef is gefit en niet mediaan ± k·stdev, en het rapport zegt dat in een band_definition-string naast de getallen. stdev wordt voor de continuïteit uitgegeven en door niets gebruikt. Een kwantiel waarvan de C/N₀ al op of onder de trackingdrempel ligt, heeft geen eindige ontzeggende J/S; die kolommen worden als null uitgegeven met een geteld motief in plaats van als oneindig of als een afgekapte straal

seg-f7457156f960 = Interne consistentie tegenover de eigen voorwaartse functies van de engine, het enige wat deze mogelijkheid eerlijk kan claimen. Elk contourpunt is een inversie in gesloten vorm, en elke inversie wordt gecontroleerd door haar antwoord terug te voeren door de VOORWAARTSE functie waarmee de eigen rijen van het rapport zijn beoordeeld: de J/S-kolom via jamming::effective_cn0_dbhz (die tracking_threshold_dbhz moet teruggeven tot < { "1e-9" } dB-Hz), de afstandskolom via jamming::free_space_path_loss_db en jamming::j_over_s_db (dezelfde J/S tot < { "1e-9" } dB), de EIRP-kolom via jamming::j_over_s_db bij de eigen afstand van het scenario. De contour wordt verder gecontroleerd als de GRENS van de ontzeggingsverzameling en niet als een punt erbinnen — lock_status verliest lock bij een strikte ongelijkheid, dus het oordeel wordt gemeten om van DEGRADED naar LOST om te slaan binnen { "1e-4" } dB J/S aan weerszijden van de contour, wat een contour die een epsilon ernaast zit zou laten falen. De sterkste controle is per link in plaats van per kwantiel: dezelfde afbeelding toegepast op de eigen C/N₀ van elke rij reproduceert de statuskolom van het rapport exact — { "0" } afwijkingen op { "38" } van { "38" } rijen bij het gedocumenteerde werkpunt (kind = lunar-jamming, elke invoer standaard behalve jammer.range_m = { "25 000" } m), waar { "26" } rijen LOST zijn en { "12" } niet. Monotoniciteit wordt gemeten, niet aangenomen: { "20 001" } samples over [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } schendingen van een strikt dalende afstand en een strikt stijgend vereist vermogen, zodat de kwantielvolgorde van de band wordt aangetoond in plaats van beweerd. ExternalDataset wordt afgewezen en daarmee ook het getoetst-zijn: er bestaat geen gemeten maanjammingcampagne om een ontzeggingsstraal mee te vergelijken, de constellatie is een illustratieve geometrie van het type Moonlight/LCNS uit openbare bronnen en geen gevlogen efemeride, en de invoer van de contour (EIRP, jammervermogen, antennaversterkingen, ruistemperatuur) zijn representatieve ordegroottes. ReferenceImpl is ook overwogen en afgewezen — de inverse en de voorwaartse uitdrukking zijn DEZELFDE algebra in twee richtingen gelezen, dus de round trip vangt transcriptie- en tekenfouten maar is geen onafhankelijke implementatie; dat een kruiscontrole noemen zou de geleende-onafhankelijkheidsmanoeuvre zijn die de invarianten van de matrix moeten voorkomen. Wat de band oplevert wordt gemeten en genoemd in plaats van beweerd: bij dat werkpunt is de contour met één scalar { "27.402916" } km en plaatst { "25" } km aan de ontzegde kant voor alle { "38" } rijen, terwijl de band { "21.256108" } .. { "29.921360" } km het werkpunt bevat en dus de verdeling rapporteert die de tabel werkelijk toont. De twee criteria blijken ook uiteen te lopen — de band van de vermogensverhouding ({ "38.186527" } .. { "53.691675" } km) bevat { "25" } km helemaal niet — en daarom worden beide afgedrukt

seg-2d3944107ba0 = Detectievermogen van een integriteitsmonitor voor meerdere modaliteiten

seg-38bc7c0bfe57 = Het rapport hybrid-optical-rf stelt wat de chikwadraatmonitor voor meerdere modaliteiten werkelijk kan DETECTEREN, niet alleen dat hij een foutvrij geval doorstaat: de minimaal detecteerbare bias per bewaakte as (oost, noord, omhoog, klok) bij de opgegeven kansen op vals alarm en gemiste detectie van het scenario, de detectievermogenscurve aan weerszijden ervan, het ruisvrije biasveelvoud waarbij de gerealiseerde statistiek de drempel voor het eerst overschrijdt, en de tijd tot detectie voor een biasramp met een opgegeven snelheid. Fouten worden ook via de echte monitor geïnjecteerd en de statistiek die hij teruggeeft wordt naast de analytische voorspelling gerapporteerd

seg-b6b8dec4dcff = Twee interne onafhankelijke referenties, geen externe dataset. ({ "1" }) Round trip in gesloten vorm: de minimaal detecteerbare bias wordt voortgebracht door de niet-centrale chikwadraatstaart te inverteren op de niet-centraliteit (raim::pbias) en wordt geverifieerd door de resulterende niet-centraliteit terug te voeren door raim::noncentral_chi2_cdf bij de eigen drempel van de monitor, wat P_md moet teruggeven. ({ "2" }) Injectie tegenover analyse: een bias wordt in de RF-schatting van één as geschreven en cross_raim::run_cross_raim wordt opnieuw uitgevoerd, zodat de statistiek die met de analytische niet-centraliteit wordt vergeleken, die is die de monitor heeft berekend en geen herafleiding. Een geseede Monte-Carlosimulatie van de statistiek zelf zit als derde controle in de tests; ze zit bewust NIET in het rapport, omdat een bemonsterde schatting trager zou zijn en niet bit voor bit reproduceerbaar. ExternalDataset wordt afgewezen: de grootheid is het detectievermogen van DEZE monitor bij de sigma-toewijzing van DIT scenario, en de sigmagroottes waarmee de MDB wordt geschaald zijn representatieve invoer uit een model en geen metingen. ReferenceImpl is ook overwogen en afgewezen — de Monte-Carlosimulatie bemonstert dezelfde statistiek als de analyse beschrijft, dus ze vangt transcriptie- en coëfficiëntfouten maar is geen onafhankelijke implementatie van de monitor. { "0.30" } ronde { "2" } (preregistratie 0135a9e4), geblokkeerd (blijft MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq reproduceren de drempel van het rapport (binnen { "5.4e-12" }), de MDB per as, de vermogenscurve, het kruisingsveelvoud en de tijd tot detectie van de ramp (binnen { "5.3e-10" }) op vijf configuraties; de statistieken van geïnjecteerde fouten hebben geen onafhankelijke referentie en de sigmagroottes zijn invoer uit een model, dus de afbakening wacht op een besluit van de eigenaar

seg-38cabd4921c1 = Hergroei van de covariantie na de overdracht tegenover de alarmlimiet

seg-9287268bbada = Het rapport hybrid-optical-rf legt het procesruismodel van het filter bloot en stelt hoe lang de oplossing na de overdracht binnen de alarmlimiet blijft: voor beide overdrachtsrichtingen neemt het de covariantie per as die de overdracht heeft achtergelaten, propageert die vooruit onder een opgegeven randomwalk-procesruis, en rapporteert het tijdstip waarop de met dekking geschaalde 1σ de horizontale, verticale en tijdsynchronisatiealarmlimieten bereikt, welke limiet het eerst bindt, de verdubbelingstijdconstante van de variantie, en een bemonsterd coastprofiel dat de overschrijding omsluit. Procesruis-PSD's, de dekkingsfactor en de alarmlimieten zijn alle invoer met gedocumenteerde standaardwaarden

seg-c85b822227f3 = Geen externe onafhankelijke referentie. De overschrijding is een oplossing in gesloten vorm van de randomwalk-variantiegroei, en de tests herberekenen haar onafhankelijk uit de waarden die het rapport zelf publiceert en niet uit de interne onderdelen van de uitgever. De startcovariantie is bit voor bit vastgepind aan de trace die het bestaande overdrachtsblok al rapporteerde, zodat de coast geen covariantie kan propageren die niemand anders heeft gezien. De procesruis-PSD's zijn MODELLED representatieve invoer en de overschrijdingstijden schalen er direct mee, wat de schalingstest als gemeten eigenschap vermeldt en niet als bewering. ExternalDataset wordt bewust afgewezen: de coasttijd is een directe functie van twee uit een model berekende PSD's en van alarmlimieten die zelf representatief zijn, en er bestaat geen gemeten optische/RF-overdrachtscoast op de maan om mee te vergelijken. Een externe onafhankelijke referentie zou hier een gepubliceerde curve voor covariantiegroei na overdracht of holdovernauwkeurigheid voor een vergelijkbare ontvanger vereisen, met vermeld procesruismodel, gecontroleerd tot een tolerantie

seg-a3b8272862aa = Antennepatroon buiten de boresight in de export van de maangeometrie

seg-27d246503a48 = De geometrie-export per satelliet bevat, per (epoch, satelliet), de hoek buiten de boresight BIJ DE SATELLIET en de zendversterking richting de locatie uit het echte patroon van een uniform belichte cirkelvormige apertuur (Airy), en rapporteert het aantal in de bundel onder dat patroon NAAST het aantal in de bundel onder de symmetrische benadering van versterking naar bundelbreedte (θ_3dB[deg] = √(31000/G_lin)), waarbij het verschil als expliciete correctie wordt uitgegeven in links, in satellieten per epoch en als slechtste enkele epoch. Beide impliciete apertuurrendementen van de benadering worden uitgegeven ({ "0.641" } tegenover de regel van { "70" }·λ/D graden waarmee ze wordt aangehaald, { "0.920" } tegenover een uniforme cirkelvormige apertuur), zodat het rendement dat ze stilzwijgend aanneemt wordt vermeld en niet afgeleid. Standaard uit: het blok verschijnt alleen wanneer zowel een exportlocatie als een apertuur is opgegeven

seg-f7f79e2dd6c5 = Gemengd, en gescheiden in plaats van samengevoegd. Het PATROON eronder is extern getoetst en houdt zijn eigen rij (een fixture scipy.special.j1 tot < { "0.05" } dB in tests/validate_p1_orbital_footprint.rs, plus hier de gepubliceerde Airy-abscis voor half vermogen x = { "1.61634" } bepaald met bisectie en niet aangenomen). De GEOMETRIE is gecontroleerd aan de driehoeksmeetkunde in gesloten vorm, geschreven als een andere uitdrukking dan het inwendig product dat wordt getest. De INSLUITING van de echte bundel door de benaderende kegel is afgeleide algebra (28.019/√η tegenover { "29.479" } graden per λ/D), zodat de correctie alleen niet-positief kan zijn voor η ≤ { "0.9035" }. Maar de AANTALLEN in de bundel zelf hebben geen externe onafhankelijke referentie: geen gepubliceerde tabel geeft hoeveel satellieten van een schil van het type Moonlight/LCNS een locatie aan de zuidpool binnen de halfvermogensbundel van een bepaalde schotel houden, en de constellatie is een illustratieve benadering uit openbare bronnen, geen gevlogen efemeride. De gemeten afwijking bij het gedocumenteerde werkpunt — { "0" } links in de bundel onder het echte patroon tegenover { "28" } onder de benadering, −{ "2.33" } satellieten per epoch, slechtste epoch { "3" }, op { "76" } geëvalueerde links — is daarom een MODELLED bevinding over de benadering, vastgepind als regressieliteraal (de dichtstbijzijnde rij ligt { "0.069" }° van elke bundelrand, vier ordes van grootte boven elke afwijking in het laatste cijfer), geen extern getoetst dekkingsgetal. De rij ExternalDataset noemen op grond van het eigen externe anker van het patroon zou geleende validatie zijn, en dat is precies wat de invarianten van de matrix moeten voorkomen. { "0.30" } ronde { "2" } (preregistratie d9755d28), geblokkeerd (blijft MODELLED): SPICE-geometrie en Bessel-functies van SciPy reproduceren de hoek buiten de boresight (slechtste { "3.0e-5" } graad), de Airy-versterking en de vlaggen voor in de bundel op { "6 336" } rijen met toestanden van gevlogen orbiters en het gedocumenteerde werkpunt; maar op gevlogen geometrie splitsen de vlaggen per satellietidentiteit (de dichtstbijzijnde link ligt { "1.66" } graad van de bundelrand), wordt de zichtbaarheid van { "5" } graden als vlag gecontroleerd en niet als numerieke elevatie, past de vlag van de symmetrische benadering de vuistregel 31000/G toe op een getoetste hoek zonder de regel te toetsen, en hebben de impliciete rendementen geen onafhankelijke referentie; de afbakening wacht op een besluit van de eigenaar

seg-6fbfa234ef3e = Verlies van lock in de trackinglus en spoof-pull-in onder interferentie

# c1: tracking-loop
seg-f78c1f28a3f7 = Verlies van lock berekend uit lusdynamica in plaats van uit een vermogensverhouding: thermische 1σ-jitter van de draaggolf (Costas) en de code (niet-coherent vroeg/laat) tegenover C/N₀ met het kwadrateringsverlies, tegenover de opgegeven regels 3σ_PLL + θ_e ≤ { "45" }° en 3σ_DLL + ramplag ≤ d/2 chips; C/N₀-drempels voor wegvallen en herlock met de bindende lus genoemd en de hysterese AFGELEID uit de bredere pull-in-bandbreedte en niet beweerd; de verklaarde tijd tot verlies van lock uit een lockdetector met twee drempels en bevestigingsverblijftijden, afzonderlijk gerapporteerd van de fysieke faseontsnappingstijd (gemiddelde tijd tussen cycle slips volgens Viterbi, in log₁₀ s omdat die honderden decaden beslaat); de grootste codeslew en draaggolf-Dopplersnelheid die de lussen van het slachtoffer kunnen volgen; en de ONTZEGGINGSSTRAAL die de lusdynamica impliceert, gerapporteerd naast de bestaande straal van de vermogensverhouding met hun verschil met teken als eigen benoemd veld. Uitvoerbaar als scenariosoort <c1/>

seg-c3794c8d85c5 = De eigen sdr-correlator van de engine (sdr::correlate / synth_if / CaCode) voorwaarts gestapt op geseede synthetische IF bij een gekalibreerde C/N₀ — een apart codepad dat dezelfde getallen bereikt door numerieke correlatie van bemonsterde IQ in plaats van door een algebraïsche jitteruitdrukking, dus een andere route en geen herformulering — plus standaard getabelleerde waarden van de gemodificeerde Bessel-functie I₀ voor de cycle-slip-term. Lustheorie volgens Kaplan & Hegarty hoofdstuk { "8" } en Viterbi/Gardner voor de slip-tijd. De rij blijft ReferenceImpl/MODELLED: de kruiscontrole zit in dezelfde codebasis, en de controle bessel_i0 toetst één speciale functie en niet het trackingmodel, dus de rij op die grondslag verhogen zou zelfbedienend labelen zijn. ExternalDataset zou een opgenomen ruwe IF-dataset vereisen met referentie-C/N₀ en een geannoteerd moment van verlies van lock (klasse TEXBAT/OAKBAT); geen daarvan zit in deze boom, en zelfs met de IQ publiceren die datasets geen referentie van de lustoestand per epoch, dus een verklaarde tijd van verlies van lock kon alleen worden getoetst aan de lockdetector van een andere ontvanger, wat een gemodelleerde keuze is en geen onafhankelijke referentie. De lusbandbreedtes, integratietijd, correlatorafstand, pull-in-verhouding, verblijftijden, jammervermogen en antennaversterkingen zijn representatieve bandcijfers, geen datasheet. { "0.30" } ronde { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, als programma uitgevoerd) op onafhankelijk gegenereerde IF (preregistratie 6ef7698c, amendementen op de meetmethode bekendgemaakt), een bevinding (blijft MODELLED): de jitter van PLL en DLL in gesloten lus komt overeen binnen { "8" } % bij { "35" } tot { "45" } dB-Hz, de dynamische belasting van { "10" } Hz/s binnen { "1" } % en de ramplag van de eerste-ordecode binnen { "2" } %; bij { "30" } dB-Hz is de PLL-jitter { "21" } % hoger en de DLL-jitter { "32" } % lager, liggen de gemeten drempels van de 15-gradenregel { "1.5" } dB boven de engine, en slipt de tweede-orde-lus { "0.5" } tot { "2" } decaden vaker dan de slip-tijdgrens van de eerste orde. { "0.30" } herziening: de slip-tijd van Costas gebruikt nu de lus-snr rho/4 (halve-cyclusslips); de standaard jitter_table log10_mean_time_to_cycle_slip_s daalt van { "11.58" } naar { "2.10" } bij de drempel van { "25.47" } dB-Hz

seg-69155fb79ebd = Covariantie van stationscoördinaten voor maan-VLBI uit een trackingschema

# c1: lunar-vlbi-fim
seg-141285301f58 = Vertragingspartiëlen opgeteld over een schema van basislijnen × epochs tot een Fisher-informatiematrix, geïnverteerd tot de covariantie van de stationscoördinaten en de sigma per coördinaat van het station, ter vervanging van een aangenomen isotrope gelijkverdelingslink uit een scalaire vertragingsprecisie. De toestand bevat aardvaste (ITRS) stationscoördinaten, dus de Jacobiaan is de inertiale partiële geroteerd met de GCRS→ITRS-matrix van elke epoch en de aardrotatie maakt die coördinaten waarneembaar — het rapport METEN de aardvaste zichtlijnsweep en de declinatie van de beacon en neemt ze niet aan. Rang, datumdefect, conditiegetal, het informatiespectrum en de nulruimte van het vrije netwerk worden bij elke run uitgegeven, en bij een rangdeficiëntie wordt de hoofdsigma als NULL met een status gepubliceerd en niet uit een bijna singuliere inverse afgelezen. De gelijkverdelingswaarde c·σ_τ·√(g/N) voor ZELFDE schema wordt naast de berekende afgedrukt met hun verhouding, samen met de isotrope tracegrens √(p/trace(M)) die AM-HM tot een harde ondergrens maakt. Uitvoerbaar als scenariosoort <c1/>

seg-b259d4d18f42 = Een onafhankelijke route in dezelfde repository. Elke Jacobiaanrij wordt opnieuw afgeleid met een centraal eindig verschil van lunar_vlbi::vlbi_delay_s, geëvalueerd uit de eigen aardvaste en met de maan meedraaiende coördinaten van de toestand, voorwaarts geroteerd door de stelselketen — een pad dat geen afgeleide berekent en geen uitdrukking deelt met de analytische partiëlen — en de informatiematrices die de twee routes opbouwen komen overeen tot < { "1e-6" } van de grootste diagonaalwaarde. De lineaire-algebrakernel die dit samenstelt (information_matrix, crlb, sym_eig) is apart extern verankerd aan numpy.linalg.eigh / numpy.linalg.inv in tests/fim_observability_reference.rs, en de vertragingsobservabele draagt de eigen delta-DOR-verreveldreferentie van lunar_vlbi; de rij leent geen van beide statussen. Identiteiten in gesloten vorm die hier worden gecontroleerd en als zodanig gelabeld: σ²- en 1/N-schaling, en √(p/trace(M)) als AM-HM-ondergrens die de berekende sigma niet kan verslaan en die alleen op een isotrope geometrie met de gelijkverdelingswaarde samenvalt — daarom is de gemeten verhouding precies de anisotropie die de aanname negeerde. { "0.30" } externe vergelijking (bibliotheek: NAIF SPICE CSPICE N0067 via spiceypy { "8.2.0" }, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), vooraf geregistreerd ({ "50863551" }) samen met een aan de enginekant uitgevoerde gevoeligheidsrun voor modelfouten: elke Jacobiaanrij wordt herbouwd met centrale verschillen van geconvergeerde Newtoniaanse lichttijdverschillen uit SPICE-geometrie (de lichttijdvergelijking is een kort script over SPICE-posities; SPICE levert de geometrie), met het schema herbouwd uit SPICE-elevaties. Het schema, de rang, het defect, het informatiespectrum, het conditiegetal, de stationssigma's, de hoofdwaarde, de tracegrens, de gelijkverdelingsverhoudingen, de nulruimte van het vrije netwerk, de zichtlijnsweep en de declinatie van de beacon komen overeen binnen de vooraf geregistreerde { "1" } % / { "0.1" } graad, wat boven de bekende analytische maanfout van de engine ligt ({ "3.2e-3" } op sigma's, gemeten vóór de run). NumPy { "2.3.5" } herhaalt de lineaire algebra op de vastgelegde Jacobiaan van de engine tot { "2e-13" } (P2). Getoetst als Cramér-Rao-grens voor de opgegeven beperkte parameterset op de opgegeven illustratieve invoer: de efemeride van het maancentrum, klokken, troposfeer en parameters van de aardoriëntatie zijn in beide takken vastgehouden, dus het is geen nauwkeurigheid van een echte campagne

seg-0f4d023fe2d4 = Covariantie van coördinaten van een punt op het maanoppervlak uit een VLBI-vertragingsschema, gescheiden gehouden van die van het aardstation

# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Een derde datumkeuze, <c1/>, die elk aardstation vasthoudt en alleen de met de maan meedraaiende coördinaten van de BEACON schat — de configuratie waarvoor een onzekerheid van een punt op het maanoppervlak werkelijk wordt genoemd, omdat de coördinaten van aardstations een invoer van het vertragingsmodel zijn en geen onbekende ervan. Ze bestaat omdat de covariantie op stationsniveau en de covariantie van het oppervlaktepunt VERSCHILLENDE GROOTHEDEN zijn die door de hefboomarm ρ/B worden gescheiden, en niets eerder voorkwam dat de ene tegenover de andere werd genoemd. Het uitgegeven blok <c2/> bevat ρ, de langste basislijn, de hefboomarm, de oppervlaktepuntvorm van de gelijkverdelingslink c·σ_τ·(ρ/B)·√(g/N), de berekende sigma per coördinaat van de beacon en hun verhouding — de verhouding is null in plaats van misleidend wanneer de beacon niet wordt geschat of de matrix rangdeficiënt is. B wordt genomen als de LANGSTE aanwezige basislijn, de gunstigste, zodat de verhouding alleen kan onderschatten. Uitvoerbaar als <c3/> met <c4/>, wat wordt geweigerd met een bericht dat de ontbrekende invoer noemt wanneer de beacon niet wordt geschat

seg-18096ae23d96 = Identiteiten in gesloten vorm, zonder dat een externe onafhankelijke referentie wordt geclaimd of beschikbaar is. De hefboomarm wordt gecontroleerd aan ρ/B en de twee gelijkverdelingsvormen aan elkaar tot { "1e-15" } — algebraïsche identiteiten, dus ze vangen een bedradingsfout en niets anders en zijn als zodanig gelabeld. Het inhoudelijke resultaat is MEASURED en niet beweerd: een vertraging van een vaste basislijn beperkt de RICHTING van de beacon, dus de zichtlijncomponent bereikt de informatiematrix alleen via de nabijveldafstandsterm, en de test leest de resulterende anisotropie af uit het uitgegeven spectrum in plaats van haar af te leiden. AM-HM maakt √(p/trace(M)) tot een harde ondergrens, zodat een isotrope gelijkverdelingslink alleen ONDERSCHATTEN kan, en de verhouding berekend-over-gelijkverdeling is precies de anisotropie die ze negeerde. MEASURED op het paar Goldstone-achtig/Canberra-achtig waarvan de koorde { "10726.748" } km is: over { "112" } bemonsterde dagen laten { "36" } helemaal geen onderling zichtbare epoch toe bij een masker van { "10" }°, is het grootste aantal ooit onderling zichtbaar { "17" } van een schema van 49 samples, en op de { "73" } bruikbare dagen loopt de verhouding voor drie componenten van { "113.9" }× tot vier ordes van grootte meer, mediaan { "1513" }×, terwijl beperking tot de twee transversale richtingen waarin de zichtlijn niet verhongert { "3.94" }× tot { "25.8" }× geeft, mediaan { "7.8" }×. WAT DEZE RIJ NIET CLAIMT: een van die cijfers als eigenschap van een echte campagne. Ze stelt vast dat de grootheid van het oppervlaktepunt nu wordt BEREKEND en niet aangenomen, en dat ze niet stilzwijgend verwisseld kan worden met die op stationsniveau. Blijft ReferenceImpl/MODELLED: er bestaat geen gepubliceerde maan-VLBI-oppervlaktepuntcovariantie om tegen te toetsen, de stations en de beaconlocatie zijn illustratief en niet opgemeten, en de efemeride, klokken, troposfeer en parameters van de aardoriëntatie worden VASTGEHOUDEN, dus dit is een Cramér-Rao-grens voor een beperkte parameterset en op zichzelf optimistisch. Dezelfde grootheid op het kernelpad (beacon op de DE440-maan) is getoetst op haar eigen rij, "…, kernelpad"; op dit analytische pad is de kleinste beaconsigma { "3.9" } % lager dan de SPICE-referentie van die rij, en daarom blijft deze rij MODELLED

seg-8958521eedf7 = Covariantie van coördinaten van een punt op het maanoppervlak uit een VLBI-vertragingsschema, kernelpad

# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = De covariantie van de beacon met alle stations vast voor het scenario lunar-vlbi-fim (elk aardstation vastgehouden, alleen de met de maan meedraaiende coördinaten van de beacon geschat) met de beacon geplaatst op de JPL-DE440-maan die door de eigen kernellezer van de engine wordt gelezen (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Alleen het maancentrum verschilt van het analytische pad; de IAU-lichaamsrotatie van { "2015" }, de stations, de aardrotatie en de lineaire algebra zijn dezelfde. De getoetste uitvoer bestaat uit de waarnemingsset, het informatiespectrum van { "3" } x { "3" }, de rang en het conditiegetal, de drie met de maan meedraaiende beaconsigma's en hun RMS, de hefboomarm en de verhouding berekend-over-gelijkverdeling, op het standaardschema. Uitvoerbaar als het scenario <c1/> met datum = "all-stations-fixed", estimate_beacon = true en planetary_kernel_path ingesteld

seg-63250578ec6b = Bindende bibliotheektak: NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) op de440s, earth_latest_high_prec (ITRF93 met UT1 en poolbeweging) en de DE440-maanstelsels, met de beacon vast in MOON_ME; elke Jacobiaanrij is een centraal verschil van { "3" } km van het geconvergeerde Newtoniaanse lichttijdverschil (de eigen lichttijdcode van de referentie M069, geïmporteerd), nooit een partiële van Kshana; zichtbaarheid herbouwd uit WGS-84-elevaties; NumPy { "2.3.5" } / SciPy { "1.18.1" } (BSD-3-Clause, LAPACK) eigh en inv. P2-tak: NumPy op de vastgelegde Jacobiaan van de engine. Vooraf geregistreerd (4a51256) voordat de fixture of referentie bestond, met drempels van { "1" } % op eigenwaarden, conditie, sigma's, RMS en verhouding, { "1e-4" } op de hefboomarm, exacte waarnemingsset en rang; P2 { "1e-9" }. Bekendgemaakt: de vergelijking van alleen de engine tussen analytische en kernelmaan ({ "3.9" } % op de y-sigma) is vóór de preregistratie uitgevoerd om het kernelpad te kiezen en wordt daar vermeld. Resultaat: beide takken komen overeen, slechtste { "1.7e-3" } (beacon-y-sigma { "0.081211" } m tegenover { "0.081351" } m). Mutatie: het transponeren van de lichaamsrotatie van de partiële van de beacon laat beide takken falen. Beide kanten lezen DE440, dus de overeenstemming bevestigt de geometrie en lineaire algebra op DE440, niet DE440 zelf. Buiten de claim: de oppervlaktepuntnauwkeurigheid van een echte campagne (klokken, troposfeer en aardoriëntatie vastgehouden; illustratieve stations en beaconlocatie), en het analytische standaardpad (rij hierboven, die MODELLED blijft: op de analytische maan is de y-sigma { "3.9" } % lager dan deze referentie)

seg-0315968c8214 = Differentiële PNT op de maan — restbudget van de correctielink

seg-c6785166a44c = De drie termen die een differentiële correctie oploopt tussen de epoch waarop ze wordt berekend en de epoch waarop ze wordt gebruikt, elk eerder als ongemodelleerde marge gelaten: opmetingsfout van het referentiestation (gecorreleerd over satellieten, onafhankelijk van de basislijn, ~{ "1" }:{ "1" } positieoverdracht en aantoonbaar niet door DOP versterkt), veroudering van de correctie (de bevroren baanfoutvector opnieuw geprojecteerd op de zichtlijn waarop de eigen propagator van de engine de satelliet één latentie later plaatst, plus klokdrift c·σ_y(τ)·τ uit de gekalibreerde machtswet), en uniforme linkkwantisatie over een exacte volle schaal ±(orbit_err + clock_err) met variantie step²/12. Gerapporteerd in zowel het afstands- als het positiedomein, naast — nooit in plaats van — de bestaande rest en het beschermingsniveau, met een latentiecurve naast het enkele cijfer

seg-29b8e6c12471 = Identiteiten in gesloten vorm en zelfconsistentie: de variantie step²/12 van de uniforme kwantisator, de exacte covariantiepropagatie (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ die voor gelijke σ instort tot σ·PDOP, de overdracht van { "1" }:{ "1" } van de opmetingsterm als gevolg van û_user ≈ û_ref, en sluiting in kwadratuur bij uitschakeling. De PDOP-kruiscontrole tegenover orbit::dop deelt de normaalmatrix [−û, { "1" }], dus het is een consistentiecontrole en als zodanig gelabeld en geen onafhankelijke referentie. Er is geen ExternalDataset beschikbaar of geclaimd: geen enkel maanoppervlakstation heeft een gepubliceerde opgemeten nauwkeurigheid, geen enkele maan-link voor differentiële correcties heeft een gepubliceerde latentie of berichtformaat, en het kwantisatieresultaat is een gesloten vorm en geen meting. RTKLIB — al de externe-codereferentie voor de kernel met enkelvoudig verschil en gewogen kleinste kwadraten — zou kunnen worden aangestuurd met een opzettelijk verkeerd opgemeten basis om de opmetingsoverdracht van { "1" }:{ "1" } te bevestigen, maar dat is onafhankelijke code over dezelfde eerste-orde-zichtlijnalgebra. DE GROOTTEN ZIJN MODELLED: de standaardwaarde van de opmeting is de eigen toewijzing voor realisatie van het maanstelsel van deze crate en geen gemeten station, de latentie en het aantal bits zijn ILLUSTRATIVE invoer, en de groei van de VECTOR van de broadcast-efemeridefout zelf wordt helemaal niet gemodelleerd — vermeld in de uitgegeven veroudering-wetstring, omdat het de term is die in een echte link het waarschijnlijkst domineert

seg-c42646ae4707 = Dekkings- en nauwkeurigheidskaart van referentiestations op de maan

# c1: lunar-station-coverage
seg-1f9834b32629 = Monte-Carlosweep van het differentiële PNT-model voor de maan over een gebruikersraster bij de zuidpool en een dag aan epochs (de soort <c1/>): voor een differentieel referentiestation op een bekende locatie bij de zuidpool, per punt en over het gebied, de percentielen van de gecorrigeerde en niet-gecorrigeerde positiefout (3D, horizontaal, verticaal), beschikbaarheid met een reden voor elke niet-beschikbare epoch (user_lt4, station_missing_sat), dekking tegenover een drempel die vóór de run is vastgelegd, DO-229E-beschermingsniveaus, de dekkingsstraal per azimutsector, en het budget van de correctielink bij het station en bij het slechtste punt. Geen uitspraak over de prestaties van enig echt systeem; niet verbonden aan of onderschreven door enig agentschap

seg-2308d94fa25e = Rekenwerk opnieuw berekend door een onafhankelijk numpy-script op geëxporteerde gevallen (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; vooraf geregistreerd in tests/fixtures/lunar_station/PREREGISTRATION.md, afzonderlijk gecommit in 9caedf97 vóór de eerste run): op { "20" } gevallen met elke foutterm aan zijn de zichtbare sets en de status identiek, komen de ruwe afstandsfouten overeen tot { "1.4e-14" } m, de positiefoutvectoren en -groottes tot { "1.4e-9" } m tegenover een drempel van { "1e-6" } m, en is de p95 van elk punt bit voor bit gelijk aan numpy.percentile; de stationscorrecties HEBBEN hun drempel van { "1e-9" } m GEMIST (slechtste { "3.73e-9" } m, { "15" } van { "20" } gevallen), en daarmee de gecorrigeerde afstandsfouten: gecontroleerd in rekenkunde met 60 cijfers liggen beide kanten binnen de dubbele-precisie-afronding van de exacte waarde, waarbij de opmetingsterm een verschil is van twee afstanden van { "1e7" } m waarvan de eenheid van de laatste plaats { "1.86e-9" } m is; vastgelegd, niet bijgesteld. De soort reduceert exact tot de soort lunar-differential-pnt bij één punt, één epoch en één trial. Het foutmodel, het decorrelatiemodel en elke drempel zijn van dit project zelf of ILLUSTRATIVE; niets hier is een uitspraak over enig echt systeem

seg-7ecf4b0038b0 = Terreinhorizonmaskers voor de maan uit een opgegeven profiel of een polaire DEM

seg-7102948907bc = Azimutafhankelijke horizonmaskers per locatie voor de soort lunar-station-coverage (het referentiestation en elk gebruikerspunt) en het raster van moonlight-service-volume en zijn exportlocatie per satelliet (elke exportrij krijgt clears_terrain), in het skylinetabelformaat van { "0.36" } (skyline::Skyline, lineair in azimut met wrap bij { "360" } graad; een opgegeven profiel en een DEM-horizon op één locatie combineren als hun puntsgewijze maximum): een opgegeven [terrain] station_horizon of user_horizon gelabeld met zijn bron, en/of een horizon die met raymarching is bepaald over een zuidpolaire stereografische DEM (de gridindeling van de LRO LOLA-polaire laag, gelezen uit een descriptor die zijn grootte en SHA-256 vastlegt, of een tegel realdata::lola_dem met lengte- en breedtegraad met [terrain] dem_tile_path, weergegeven met zijn SHA-256) langs grote cirkels van de maanbol met exacte kromming, vanaf een opgegeven masthoogte, met een opgegeven azimutstap en bereik. Een satelliet telt op een locatie mee wanneer hij het vlakke mask_deg en de horizon bij zijn azimut vrijmaakt (lunar_service::topocentric); een epoch waarin de horizon op een punt minder dan vier satellieten overlaat waar het vlakke masker er vier geeft, telt als de reden voor niet-beschikbaarheid terrain_masked. De meegeleverde DEM is een uitsnede van het publiekdomeinproduct LOLA LDEM_75S_240M, { "5" } x { "5" } blokgemiddeld geresampled tot { "1200" } m (data/lunar-dem/NOTICE.md). Bij afwezigheid behoudt elke locatie het vlakke masker en is elk document byte-identiek

seg-dd838d199a0d = Oppervlakken in gesloten vorm (InternalConsistency): de dip van de kale bol, een krater in een plateau op de bol met een waarnemer op en naast zijn middelpunt, en een analytische kegel tegenover zijn eigen rasterisatie. Op de echte uitsnede komt een onafhankelijke numpy-raycast (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; vooraf geregistreerd in tests/fixtures/lunar_terrain/PREREGISTRATION.md, afzonderlijk gecommit in edbb9b02 vóór het script bestond) overeen op vijf locaties: locatiehoogten tot { "1.0e-11" } m en alle { "1800" } horizonelevaties tot { "5.5e-10" } graad tegenover drempels van { "1e-6" }, aantallen afgekapte stralen exact; dit controleert het rekenwerk, niet het terrein. Er is geen gepubliceerd polair horizon- of verlichtingscijfer gereproduceerd: de meegeleverde uitsnede van { "1200" } m gladstrijkt het reliëf van minder dan een kilometer dat gepubliceerde verlichtingsstudies oplossen, dus de DEM-horizons zijn een MODELLED zichtlijn over een geresamplede echte DEM en geen getoetste horizon. De stationslocatie en de constellatie blijven ILLUSTRATIVE; niets hier is een uitspraak over enig echt systeem

seg-d37bb01e270b = Multipath- en ontvangerhardwaretermen van referentiestations op de maan

seg-1103199f019b = De optionele sectie [receiver] van lunar-station-coverage (LRS-02): elevatieafhankelijke multipath-sigma(el) = a + b exp(-el / el0) bij de gebruiker en bij het station (de RTCA-DO-229-vorm voor luchtvaarttoepassingen, met a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graad als standaardwaarden; op de maan is elke waarde ILLUSTRATIVE), wit bij de gebruiker en eerste-orde-Gauss-Markov over epochs bij het station (rho = exp(-dt / tau)); thermische codeknoopruis van de vroeg-min-laat-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); inter-kanaalbiassen per kanaal die gedurende een trial constant zijn, bij de gebruiker en bij het station. Stationstermen gaan in zijn correcties, gebruikerstermen in de ruwe en gecorrigeerde metingen, elk op een eigen geseede stroom. Bij afwezigheid is elk document ongewijzigd

seg-4fbc7d86b491 = Gesloten vormen en statistieken van de eigen trekkingen van het model (InternalConsistency): de DLL-formule tegenover een handberekening, de DO-229-vorm, het nulbasislijnverschil van twee ontvangers, de lag-1-correlatie van Gauss-Markov. Er bestaat geen maanmeting van multipath of ontvangers om mee te vergelijken; de waarden zijn ILLUSTRATIVE en niets hier is een uitspraak over enige echte ontvanger

seg-03796cb741b6 = Groei van de efemeridefout van referentiestations op de maan over de correctielatentie

seg-13b0ae9a874a = De optionele invoer orbit_err_growth_m_per_s van lunar-station-coverage (LRS-03): een correctie die latency_s na haar berekening wordt toegepast, mist de groei g latency_s van de broadcast-baanfout, g isotroop met 3D-RMS-snelheid, per satelliet en trial getrokken op een eigen geseede stroom (bereik 1-sigma-snelheid tau / sqrt({ "3" })), bovenop de herprojectie van de bevroren fout op de zichtlijn. Bij afwezigheid is elk document ongewijzigd. Een K5-addendum bij de vergelijking met gepubliceerde claims, afzonderlijk vooraf geregistreerd, draait K5 bij { "0.001" }, { "0.01" } en { "0.1" } m/s (ILLUSTRATIVE)

seg-332ceb320b65 = De gesloten-vorm-sigma van de groeiterm en de eerste-ordepropagatiecontrole (InternalConsistency). Het K5-addendum (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, afzonderlijk vooraf geregistreerd in 59d88248): K5 faalt bij elke snelheid, gecorrigeerde p95 3D { "369.8" } m, { "2315" } m en { "22797" } m tegenover een drempel van { "1.5" } m ({ "292.96" } m vastgelegd zonder groei), zoals vóór de run vermeld. Geen enkele openbare bron geeft een groeisnelheid voor de maan: ILLUSTRATIVE

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — een onafhankelijke MCDA-bibliotheek van derden die dezelfde eenduidig gedefinieerde, bereiknormaliseerde S/R/Q-aggregatie berekent; overeenstemming tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA-rangschikking op basis van netto outrankingstroom (PROMETHEE II)

seg-b25cedf6da6e = Preference Ranking Organization METHod — paarsgewijze voorkeursindex met de zes standaardvormen van het gegeneraliseerde criterium, positieve en negatieve outrankingstromen en de volledige rangschikking op netto stroom (gebruikelijk criterium getoetst aan een externe referentie)

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — een onafhankelijke MCDA-bibliotheek van derden die dezelfde eenduidig gedefinieerde netto outrankingstroom berekent; overeenstemming tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_promethee/generate_promethee_reference.py. De voorkeursvormen met drempels (q/p/σ) herleiden tot dezelfde algebra van het gegeneraliseerde criterium en blijven op eigenschappen gecontroleerd

seg-72248291c388 = MCDA-keuzekern op basis van outranking (ELECTRE I)

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — concordantie- en discordantiematrices, de dominantierelatie met concordantie en niet-veto, en de outranking-keuzekern (conventie: alleen baten, op de som genormaliseerde gewichten, één globale schaal)

seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — een onafhankelijke multicriteria-beslissingsbibliotheek van derden die dezelfde eenduidig gedefinieerde concordantie, discordantie, dominantie en kern berekent; element voor element overeenstemmend tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_electre/generate_electre_reference.py. De keuze van de drempels ĉ/d̂ is een invoer van de analist (de gevoeligheid blijft MODELLED)

seg-95942c6a2689 = MCDA-aggregatiekernen (WASPAS / MOORA)

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (lineair genormaliseerde convexe combinatie λ·WSM+({ "1" }−λ)·WPM bij λ={ "0.5" }) en het MOORA-ratiosysteem (vectornormaliseerd gewogen baten totaal min gewogen kosten totaal) — de stabiliteitsversterkte waardecombinatie en de scorebepaler met teken voor het ratiosysteem

seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA ratio system, vector normalisation) — een onafhankelijke, veelgebruikte Python-MCDA-bibliotheek van derden die dezelfde eenduidig gedefinieerde aggregaten berekent; overeenstemming tot <{ "1e-9" }. Offline opnieuw te genereren via tests/fixtures/mcda_waspas/ en tests/fixtures/mcda_moora/. Garbage in, garbage out voor de invoer; de gevoeligheids- en robuustheidslaag blijft MODELLED

seg-7de67fedc1da = MCDA-proportionele rangschikking (COPRAS)

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — op kolomsom genormaliseerde batensignificantie S⁺ plus de term voor de inverse kostensignificantie, de relatieve significantie Q en de nutsgraad U = Q/max Q (beste alternatief = { "1" })

seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — een onafhankelijke MCDA-bibliotheek van derden die dezelfde eenduidig gedefinieerde relatieve significantie en nutsgraad van COPRAS berekent. pyDecision wordt bewust gebruikt: de COPRAS van pymcdm { "1.4.0" } valt algebraïsch terug op het triviale S⁺+S⁻ en is geen getrouwe referentie, terwijl pyDecision de canonieke Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)) implementeert. Overeenstemming tot <{ "1e-9" }; offline opnieuw te genereren via tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = Detectielatentie en ARL van CUSUM-veranderingsdetectie

seg-302f5db625df = Detectielatentie in het ongunstigste geval (⌊h/(z−k)⌋+{ "1" }) en gemiddelde runlengte buiten controle van de tabulaire CUSUM-detector, gebruikt door de beschermingsniveaus voor tijdsynchronisatie en de spoofmonitors

seg-691a506ce13f = Gepubliceerde ARL van de tabulaire CUSUM: Brownse-bewegingsbenadering van Siegmund ({ "1985" }) (Hawkins & Olwell { "1998" }, vgl. { "3.7" }), kruisverankerd aan de ARL-tabellen van Montgomery, Introduction to Statistical Quality Control (Wiley) voor k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministische latentie exact overeenstemmend met een eerste-passage-referentie. De samengestelde TPL-grens blijft MODELLED

seg-d923a77bd31a = Variantie tijdens uitloop van de klok en inversie naar een drempel (holdover)

seg-4fafaf5f919d = Groei van de variantie van de fasefout tijdens uitloop q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 en de monotone inversie ervan naar een holdover-drempel voor de tijdsynchronisatiefout

seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm die de discrete procesruis Q₀₀ = ∫₀ᵗ ΦQcΦᵀds van Van Loan { "1978" } berekent via Padé-schaling en kwadrering op de uitgebreide { "6" }×{ "6" }-matrix — een onafhankelijke route die de polynoomcoëfficiënten van kshana nooit ziet; plus optimize.brentq die dezelfde monotone curve inverteert, tegenover de bisectie van kshana. De cijfers voor de rode-ruisvloer per klasse (ClockClass) blijven MODELLED

seg-eb3cd9e92d8d = Inverse-Simpson-diversiteitskern

seg-244d57819f2b = Effectieve architecturale diversiteit = inverse Simpson / Hill-getal van orde 2, 1/Σpᵢ², over de bronkwaliteiten per onafhankelijkheidsgroep (de diversiteitsterm in de veerkrachtscore)

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — een onafhankelijke bibliotheek van derden die de eenduidig gedefinieerde inverse-Simpson-index berekent; byte voor byte gereproduceerd. Het scoringskader DHS-RPCF (gewichten en niveaus) dat erbovenop is gebouwd blijft MODELLED

seg-c14b8fe46517 = Azimutafhankelijk skylinemasker: zichtbare verzameling, azimut en elevatie, en DOP onder het masker

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: het geodetische (WGS-84) azimut en de elevatie van een satelliet vanaf een grondstation, een azimut/elevatie-maskertabel die lineair in azimut wordt geïnterpoleerd met omslag bij { "360" } deg, de zichtbare verzameling el >= max(mask_deg, mask(az)), en de DOP met gemeenschappelijke klok en de ENU-en-klok-cofactormatrix van die verzameling (de kern achter orbit::dop). Hiermee bepaalt de sectie [skyline] de zichtbaarheid in de soorten gnss-sim, jamming, leo-pvt, leo-pass en nmea-scenario en, met het grondstation user_site, in orbit en integrity

seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): een TopocentricFrame op een WGS-84 OneAxisEllipsoid voor de kijkhoeken en een ElevationMask per tabel, uitgevoerd door xval/orekit-skyline/OrekitSkyline.java op vastgelegde aardvaste toestanden (de propagatie wordt niet vergeleken), met get_dop van gnss_lib_py { "1.0.4" } (wheel-metadata MIT) voor de DOP en de ENU-en-klok-DOP-matrix van de verzamelingen die Orekit zichtbaar vindt. Vooraf vastgelegd (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) voordat een van beide referenties op de vergelijkingsinvoer werd uitgevoerd; de lineaire interpolatie met omslag van Orekit is van tevoren bevestigd met een synthetische proefmeting. Reikwijdte: tabelmaskers, geodetische kijkhoeken, de gemaskeerde zichtbare verzameling en de DOP en cofactor met gemeenschappelijke klok. NIET gecontroleerd: de reducties voor straatcanyon, sector en terrein en de voorinstellingen (hun tabellen van 360 punten gingen als invoer erin; rijen 'Street-canyon, sector and terrain reductions to a table' en 'Skyline presets'), de klokstoestanden per systeem en de foutellips (rij 'Horizontal error ellipse and per-system cofactor from the geometry covariance'), de GMST-rotatie van het grondstation user_site in orbit/integrity en het dateren van elke propagator op één tijdstip (Orekit krijgt aardvaste toestanden), en elke echte obstructie (alleen zichtlijn)

seg-bbb1828b3db1 = Reducties van straatcanyon, sector en terrein tot een tabel

seg-2864aec7be88 = skyline: de straatcanyon in gesloten vorm (afkapping atan((h - a) / d) met d = (w/2) / abs(sin(az - s)), open uiteinden bij een eindige lengte), scherpe sectoren met de klok mee met omslag, en terreinpunten gereduceerd tot een tabel met de kromtedaling d^2/({ "2" } * 4/3 R); de skyline is hun puntsgewijze maximum met een eventuele tabel

seg-50f1df206b30 = Intern: de gesloten vormen zijn gecontroleerd aan handberekende waarden (hoogten van de muurranden van een opgegeven straat, de voorwaarde voor een open uiteinde, de kromtedaling van een opgegeven punt). Geen externe referentie: de ontwerpnotitie plaatst deze reducties als MODELLED, en de ElevationMask van Orekit neemt een tabel, dus de vergelijking van rij 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' leest hun tabellen van 360 punten als invoer en controleert ze niet

seg-3f3d657854ce = Skyline-voorinstellingen (stadsstraat, havenaanloop, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: vier REPRESENTATIVE geometrieën met de opgegeven afmetingen uit de ontwerpnotitie en telkens een herkomstregel: city-street (een canyon, straat { "0" } deg, { "20" } m tussen muren van { "30" } m, antenne { "1.5" } m), harbour-approach (sectoren: open naar zee over { "180" } deg, kadegebouwen { "8" } deg over { "90" } deg, de golfbreker { "3" } deg), fjord (terrein: wanden { "600" } m boven de antenne op { "1.5" } km aan weerszijden van een noord-zuidgeul, kromtedaling toegepast), container-terminal (sectoren: stapels { "12" } deg over de landwaartse helft, kraanbomen { "35" } deg en { "25" } deg over twee smalle sectoren); veld voor veld te overschrijven

seg-44ae9b6289d9 = Geen: gekozen en opgegeven afmetingen, geen opmeting van een bepaalde straat, haven, fjord of terminal (de beeldverhouding van de straat valt binnen de band van 0.5-2 van Oke ({ "1988" }); het fjord is van de orde van de West-Noorse fjorden; de stapels gebruiken de ISO { "668" }-hoogte van een high-cube). De test controleert de voorinstellingen aan hun eigen opgegeven afmetingen, een transcriptiecontrole, die de validatieregel niet meetelt

seg-2c53381d48ae = Horizontale foutellips en cofactor per systeem uit de geometriecovariantie

seg-15fea5c05cbd = geometry::sky_geometry: de ENU-en-klok-cofactor (H^T H)^-1 met één ontvangerklok gemeenschappelijk of één per systeem (de kern orbit::cofactor_from_los), en de horizontale foutellips uit het oost-noordblok ervan (halve assen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), het azimut van de lange as gerekend vanuit het noorden)

seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv van G^T G en numpy.linalg.eigh van het horizontale blok ervan op de vastgelegde invoer, een onafhankelijke numerieke bibliotheek die de inverse en de eigenwaardeontbinding met eigen algoritmen uitvoert (standaard P2). Vooraf vastgelegd in xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) vóór de run; de opmaak van de uitvoer van het stuurprogramma is eenmaal gecorrigeerd na de preregistratie (een numpy-scalar geschreven als np.float64(...)), zonder wijziging van het protocol of de toleranties. De getoetste bewering is de lineaire algebra op die invoer; het Gaussische foutmodel en de UERE zijn opgegeven invoer, geen gemeten nauwkeurigheid of integriteitsgrens

seg-6012113b4836 = Skygeometriefuncties: zichtbaarheid, DOP, covariantie, foutellips, Monte-Carlo-wolk

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> en <c2/>, Python- en WASM-functies met dezelfde namen, MCP <c3/>): vanuit een locatie, een tijdstip en constellatievoorinstellingen (of satellieten als azimut/elevatie of ECEF) de zichtbare en onder een skyline gemaskeerde satellieten, GDOP/PDOP/HDOP/VDOP/TDOP, de cofactor met eenheidsvariantie (H^T H)^-1 en de covariantie in oost-noord-omhoog met één ontvangerklok per systeem of één gemeenschappelijke, de horizontale foutellips (halve assen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), oriëntatie { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) vanuit het noorden), en n geseede kleinste-kwadratenfouten bij onafhankelijke Gaussische afstandsfouten met hun empirische covariantie, RMS en insluiting van { "95" } %. De cofactor is orbit::cofactor_from_los, de ene kern achter orbit::dop en orbit::dop_cov (dop is de reductie van dop_cov): geen tweede DOP-implementatie

seg-aa0da1028636 = De DOP-factoren met één klok steunen op de kern die is getoetst aan gnss_lib_py { "1.0.4" } (rij 'GNSS geometry / dilution of precision (DOP)'); de eigen controles van deze rij zijn intern: sky_geometry reproduceert orbit::dop en dop_cov op dezelfde geometrie, de ellips reproduceert een analytische 2x2-eigenwaardeontbinding, ECEF- en azimut/elevatie-invoer komen overeen, en de RMS en insluiting van { "95" } % van de geseede wolk komen overeen met de geometrie. De ENU-covariantie met één klok per systeem en de ellips zijn VALIDATED in rij 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); wat hier MODELLED blijft is de samenstelling: de propagatie van de voorinstellingen naar een representatieve hemel, de Monte-Carlo-wolk (gecontroleerd aan de geometrie die hij bemonstert, een zelfconsistentiecontrole) en de oppervlakken. De constellatievoorinstellingen geven een representatieve hemel, geen gedateerde; het Gaussische foutmodel en de UERE zijn opgegeven invoer, geen gemeten nauwkeurigheid of integriteitsgrens

seg-7f66be0f15c8 = Klok-holdover zonder GNSS

seg-4d8f87668a0f = Groei van de uitloopfout in gesloten vorm + holdover tot de drempel; kwantumklokklassen

seg-2d260626e3d2 = Recursie van de clock_state-covariantie in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kern voor de uitloopvariantie en de holdover-inversie is extern getoetst aan scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdover-cijfers per klasse voor de rode-ruisvloer blijven MODELLED

seg-29b482d88916 = Gemeten klokapparaatkaarten (voorspelling op achtergehouden data)

seg-8c68c5b25004 = clock_library: een apparaatkaart (witte fase, witte, flicker- en random-walk-FM plus een lineaire frequentiedrift) gefit op een derde van een benoemde gemeten klokregistratie na een gelogde conditioneringsronde (hiaten, faseuitschieters, fasesprongen en bursts verwijderd; frequentiesprongen gelogd), gewogen met de via lag-1 geïdentificeerde vrijheidsgraden van het ruistype, en de voorspelde Allan-deviatie ervan beoordeeld op de achtergehouden twee derde; lezers voor RINEX- en IGS-klokbestanden, BIPM-bestanden per laboratorium en Circular T, sectie { "1" }; omzetting van een kaart naar het ruismodel voor slottiming, het uitgebreide Kalman-klokmodel en de ruisniveaus van de spoofingmonitor

seg-af2d78e2986c = Gemeten registraties, achtergehouden: IGS-eindresultaten van gecombineerde klokken van { "30" } s van de { "11" } GPS Block IIF-satellieten over 2026-03-01 tot { "14" } (een venster dat geen enkele test had geopend; IGS, open met naamsvermelding) en de u-blox ZED-F9P-ontvanger van JammerTest { "2024" } in zijn niet-gescoorde stationaire sessies (GPL-3.0-or-later). Externe D9-vergelijking (vooraf vastgelegd 2ec76864, voorspelde / gemeten Allan-deviatie van elke kaart binnen [1/1.5, { "1.5" }] bij de gefitte middelingstijden), een bevinding (blijft MODELLED): { "10" } van de { "11" } GPS IIF-kaarten vallen binnen de drempel; G27 is optimistisch op de schaal van twee uur ({ "0.662" } bij { "7680" } s, slechtste factor { "1.510" }), de periodieke fout op uurschaal die een machtswetkaart niet bevat. De TCXO-kaart van de ontvanger is geblokkeerd: buiten de gelogde transmissies laten de andere sessies van de dataset { "167" } epochs over tegen de vereiste { "3600" }. Gerapporteerd, niet blind (registraties die door eerdere rijen zijn geopend): de cesiumkaart van de 5071A valt binnen de drempel (slechtste { "1.070" } tot { "4096" } s), de OCXO-kaart is conservatief en valt erbuiten ({ "2.348" } bij { "128" } s; zijn ruisvloer verandert tijdens de registratie), en de strontiumkaart van Norcia, gefit op de drie kortste gepubliceerde punten, valt er binnen op de twee gescoorde punten ({ "1.291" }, { "1.405" }). Galileo passieve waterstofmasers (geen bereikbare bron van definitieve Galileo-klokken zonder login) en de Deep Space Atomic Clock (één open waarde uit de ruimte) zijn geblokkeerd. D9 ronde { "2" }, de TCXO van de ZED-F9P-ontvanger als modelklasse op { "14" } dagen van { "12" } statische stations in Wrocław (Zenodo { "6488497" }, CC BY { "4.0" }; vooraf vastgelegd fb475550), een bevinding: met de geregistreerde pipeline waren { "11" } van de { "12" } stations niet te evalueren (RAIM verwierp de meeste ionosfeervrije epochs) en faalde BX14; een bekendgemaakte herhaling met een gecorrigeerde pipeline (vooraf vastgelegd c9cc0d49) laat { "1" } van de { "11" } blinde stations slagen (BX12, { "1.412" }; BX07 { "1.532" } en BX13 { "1.542" } er net buiten), omdat klokken van single-point-ontvangers uit onderbroken bestanden van { "30" } s geen zuivere oscillatorregistratie zijn

seg-5097a0e6460d = Gemeten GPS Block IIF-klokkaarten met termen per omloop (voorspelling op achtergehouden data)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: een apparaatkaart die de fasetermen van één tot vier per omloop draagt (periode T/k, T = { "43 082.05" } s), samen met de kwadratische term gefit met kleinste kwadraten op een derde van een gemeten satellietklokregistratie, met per term de Allan-bijdrage in gesloten vorm { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } in de voorspelde Allan-deviatie

seg-83981cd13a17 = Gemeten registraties, achtergehouden: IGS-eindresultaten van gecombineerde klokken van { "30" } s van de { "11" } GPS Block IIF-satellieten over 2026-04-01 tot { "14" } (een venster dat geen enkele test had geopend; IGS, open met naamsvermelding). Externe D9-vergelijking (vooraf vastgelegd fb475550, voorspelde / gemeten Allan-deviatie binnen [1/1.5, { "1.5" }] bij elke gefitte middelingstijd op elke satelliet), een bevinding (blijft MODELLED): { "9" } van de { "11" } kaarten vallen binnen de drempel; G03 ({ "1.947" }) en G25 ({ "1.581" }) zijn optimistisch tussen { "60" } s en { "2000" } s omdat hun achtergehouden registraties ruiziger zijn dan hun fitdelen (het achtergehouden deel van G25 bevat { "16" } hiaten en { "29" } faseuitschieters), een verandering van de klok en geen ontbrekende periodieke term. Het weglaten van de periodieke termen uit de voorspelling laat alle { "11" } kaarten falen ({ "1.77" } tot { "4.96" }), dus de termen dragen de voorspelling

seg-0d72fcc0fbea = Schatting van de klokstoestand aan boord

seg-6db5391f8ebe = Kalman-klok met 3 toestanden (fase/frequentie/drift) volgens Van Loan, Joseph-gestabiliseerd

seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via het blokmatrixschema van Van Loan { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. Externe vergelijking { "0.30" }, een bevinding (blijft MODELLED): op IGS-eindklokken van { "30" } s van { "11" } GPS Block IIF-satellieten (2025-08-17 tot { "30" }), met Q gefit op de ADEV van de eerste helft en het filter beoordeeld op de achtergehouden tweede helft, is het filter één stap vooruit consistent ({ "0.906" } tot { "0.971" } van de epochs binnen zijn band van { "95" } %, drempel { "90" } %) maar overmoedig na één uur bij { "9" } van de { "11" } klokken ({ "0.486" } tot { "0.829" }) en vallen zijn innovatiesommen buiten [{ "2.4" }, { "3.6" }] bij { "5" }. De gefitte witte faseruis is nul op elke satelliet, en de fout op uurschaal (periodieke termen, flicker-FM) zit niet in het model met 3 toestanden. Ronde { "2" } van { "0.30" }, een uitgebreid filter (flicker-FM en toestanden van één en twee per omloop) op nieuwe achtergehouden IGS-klokken van 2025-09-01 tot { "14" } (vooraf vastgelegd 4b1a841e), een bevinding (blijft MODELLED): de consistentiecriteria voor één stap en één uur gelden voor alle { "11" } satellieten ({ "0.948" } tot { "0.988" } en { "0.907" } tot { "0.996" }), maar het criterium voor de innovatiesom faalt bij G24 ({ "0.964" }) en G30 ({ "1.929" }) tegen [{ "2.4" }, { "3.6" }]. D9 ronde { "3" }, het uitgebreide filter van ronde 2, afstelling en criteria ongewijzigd na de bevroren conditioneringsdetector van clock_library, op nieuwe IGS-klokken van 2026-04-01 tot { "14" } (vooraf vastgelegd fb475550), een bevinding (blijft MODELLED): (a) één stap { "0.941" } tot { "0.968" } en (c) gemiddelde van drievoudige NIS { "2.641" } tot { "3.549" } gelden voor alle { "11" } satellieten; (b) één uur faalt bij G09 ({ "0.894" }) en G26 ({ "0.876" }) tegen { "0.90" }

seg-3f0a9d7c2971 = Foutenbudget voor tijdoverdracht

seg-216f46b43860 = Tweewegs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand

seg-e7b6aac2ec58 = Sagnac-grootte gecontroleerd aan een gezaghebbende GEPUBLICEERDE WAARDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), vgl. { "1.29" }: een oostwaartse omloop langs de evenaar levert { "207.4" } ns op (2ωA_E/c²); kshana reproduceert { "207.386" } ns. Onafhankelijk bevestigd door geodist() van RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), dat dezelfde 2Aω/c²-geometrie bevat. Het samengestelde BIPM-budget voor TWSTFT-transponder, common-view en PPP heeft geen externe referentie, dus de mogelijkheid blijft gemodelleerd

seg-157fadeb5d67 = Navigatiesignaalmodulatie en analyse van codevolging

seg-ab633d191396 = BPSK-R/BOC-PSD, spectrale scheiding κ, Gabor-bandbreedte, DLL-jitter, multipad

seg-94f0c4fc2930 = GPS C/A Gold-kruis-/autocorrelatie EXACT overeenstemmend (geheel ±65/−1/63) met een onafhankelijke codegeneratie volgens IS-GPS-200; PSD-vorm van BPSK-R({ "1" })/BOC({ "1,1" }) tegenover een onafhankelijk scipy-periodogram. De gesloten vormen voor modulatie, SSC en DLL (Betz { "2001" } / Kaplan & Hegarty) blijven analytisch, dus de rij blijft MODELLED — maar de deelbewering over de codecorrelatie is extern bevestigd. Ronde { "2" } van { "0.30" }, tegen de gedrukte waarden van Betz { "2001" } en Hein et al. { "2006" } (vooraf vastgelegd 9f4f2ce8, een halve gedrukte eenheid), een bevinding (blijft MODELLED): alle { "45" } spectrale cellen van tabel { "1" }, de correlatiewaarden bij { "1" } GHz, de MBOC-interferentiecijfers en { "2" } van de { "3" } offsets van fig. { "17" } komen overeen; de eerste zijlobben bij { "24" } MHz, de offset van BOC({ "8,4" }) in fig. { "17" } en elke worstcase-multipadafwijking in figuren 18-21 ({ "11" } tot { "15" } % te laag) niet. Kshana en een onafhankelijke NumPy-evaluatie van de vooraf vastgelegde lezing komen overeen, dus het verschil zit in die lezing of in een niet vermeld detail van het artikel; oorzaak onopgelost

seg-589e0053e3e8 = Generatie van de GPS L1 C/A-spreidingscode

seg-782d4da75b59 = G1/G2-LFSR-generator voor de C/A-code die de in IS-GPS-200 gepubliceerde octale verificatievectoren van de eerste 10 chips reproduceert voor PRN { "1" }–{ "9" } (plus lengte van 1023 chips, balans van 512 enen, driewaardige periodieke autocorrelatie)

seg-473f24d4e06a = IS-GPS-200 tabel 3-Ia 'Code Phase Assignments' — de gezaghebbende, in het publieke domein gepubliceerde OCTALE verificatievectoren van de eerste 10 chips van de Amerikaanse overheid (GPS Directorate, navcen.uscg.gov); de eigen G1/G2-LFSR van kshana regenereert elke vector voor PRN { "1" }–{ "9" } exact. De daaropvolgende gesloten vormen voor modulatie, SSC en DLL blijven gemodelleerd (aparte rij)

seg-e6c08e1e6ae3 = Prestaties van kwantuminertiaalsensoren

seg-d28e1f6a430f = Cold-atom-interferometeraccelerometer vanuit de eerste beginselen (k_eff·T², QPN)

seg-57fd0a6e5d72 = Gepubliceerde numerieke vectoren uit de primaire CAI-artikelen (overdrachtsfunctie van Cheinet { "2008" }; gevoeligheid van Peters/Freier): k_eff·T² exact overeenstemmend, de shotruis-ASD een eenzijdige ondergrens binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten dragen technische ruis boven de kwantumvloer). Een bracket, geen pariteit. Ronde { "2" } van { "0.30" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de rotatieruis met alleen QPN tegenover de gemeten punten van Gauguet et al. { "2009" }, fig. { "14" }, geeft verhoudingen van { "0.695" } tot { "0.788" } bij de drie toegelaten punten ({ "0.751" } bij het werkpunt) en mist de vooraf vastgelegde drempel van { "30" } % met { "0.5" } punten; de QPN-vloer ligt { "21" } tot { "31" } % onder de gemeten ruis, zoals te verwachten bij een model zonder laser- en detectieruis. De gradiometersamenstelling komt overeen met de QPN-modellijn van Janvier et al. { "2022" } (verhouding { "1.013" } tot { "1.017" }, referentie). De gemeten test kan een samenstellingsfout van sqrt({ "2" }) niet onderscheiden; alleen de Janvier-lijn met ongelijk contrast kan dat

seg-4b79d03cecf5 = Franje-ambiguïteit en dynamisch bereik van kwantuminertiaalsensoren

seg-deb2850546d5 = Dynamisch bereik van de Mach–Zehnder-franje-ambiguïteit: de 2π-periodieke franjeuitlezing stelt een maximale ondubbelzinnige specifieke kracht a_max=π/(k_eff·T²) vast, en het ondubbelzinnige bereik in resolutiecellen a_max/σ_a=π/σ_Φ is onafhankelijk van de optische schaalfactor — de T²-gevoeligheidswinst kost ondubbelzinnig bereik in exact gelijke mate (de interrogatietijd ruilt resolutie tegen bereik, waarbij het aantal cellen vastligt door de faseruis van de uitlezing)

seg-7603ff7a7693 = Zelfconsistentie van het franjemodel van de interferometer: de halve-franjerand, de 2π-periodieke aliasingstructuur en het wegvallen van de schaalfactor in de verhouding bereik/resolutie zijn algebraïsche identiteiten in gesloten vorm, gecontroleerd aan de eigen Mach–Zehnder-fase- en gevoeligheidsfuncties van de engine — controles van interne consistentie, GEEN externe dataset, dus de rij blijft InternalConsistency. MODELLED ideale franje-ambiguïteit met drie pulsen; geen grenzen voor wavefrontaberratie of contrastverlies op het ondubbelzinnige bereik

seg-d04bf321d4a1 = Veerkracht van kwantuminertiale dode rekening

seg-c4989abb5d40 = Samengesteld positiebudget van bias + schaalfactor + VRW + stabiliteitsverval over de holdover

seg-bfe4085115c1 = Onafhankelijke numpy-Monte-Carlo-SDE-integratie van dubbel geïntegreerde witte-versnellingsruis (toetst de analytische VRW-variantie met een werkelijk onafhankelijk algoritme) + een verankering aan de gepubliceerde waarde van Groves { "2013" } voor de bias- en schaalfactortermen; de CAI-apparaatgetallen kwantificeren hardware van de partner en blijven MODELLED

seg-bc6e733c39b3 = GNSS/INS-sensorfusie

seg-16514286bb51 = EKF met 15 foutentoestanden, losjes gekoppeld (getoetst op een echte IMU/GNSS-rit tegenover NaveGo); een strak gekoppelde pseudorange/Doppler-UKF en een gekoppeld klok-plus-positiefilter (alleen consistentie, buiten de getoetste bewering)

seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als hulpmiddel onder GNU Octave uitgevoerd, nooit gelinkt): zijn losjes gekoppelde ins_gnss op zijn eigen echte IMU/GNSS-landvoertuigrit met Ekinox, beide oplossingen beoordeeld tegen het Ekinox-referentietraject. Beide filters lezen dezelfde float32-invoer van { "20" } Hz, en de configuratie van Kshana is mechanisch afgeleid van de gepubliceerde parameters van de dataset. De horizontale en verticale positie-RMS van Kshana en zijn positie-innovatie-RMS liggen binnen 1.2x van die van NaveGo (gemeten { "0.912" }, { "0.940" } en { "0.861" }) en zijn gemiddelde genormaliseerde innovatie bedraagt hoogstens { "1.5" } (gemeten { "0.395" }: ongeveer 2.5x te weinig zelfvertrouwen, gegeven de opgegeven GNSS-sigma's van de dataset); toleranties vastgesteld vóór de vergelijking. Reikwijdte: GNSS is de hele rit aanwezig met { "5" } Hz, dus er wordt geen uitval of uitloop getest en de controle vangt grove filterfouten, geen fijnafstemming (ruwe fixes met hefboomarmcorrectie zouden dicht bij de verticale drempel uitkomen); de hefboomarmtransformatie wordt in de testomgeving berekend. De strak gekoppelde UKF en het gekoppelde klok-plus-positiefilter behouden hun consistentiecontroles met filterpy { "1.4.5" } (lineaire posteriors tot { "2.4e-12" }) en blijven buiten de getoetste bewering

seg-5692c7b936b6 = Veerkracht tegen jamming zonder GNSS

seg-f4ff77caa47b = Geometrische J/S-linkbudget, anti-jam C/N₀, verlies van lock per satelliet

seg-daf317735edb = Vergelijking voor het anti-jam-C/N₀-linkbudget gecontroleerd aan een onafhankelijke numpy-herafleiding (deelt dezelfde gesloten vorm → InternalConsistency) plus een karakterisering van de C/N₀-degradatie in de echte JammerTest-2024. Ronde { "2" } van { "0.30" }, geblokkeerd (blijft MODELLED): de gemeten C/N0-daling in JammerTest { "2024" } tegenover een linkbudgetvoorspelling (vooraf vastgelegd 6a66994b, binnen { "3" } dB) is niet uitgevoerd omdat de positie en richting van de F8.1-antenne bij Bleik en het L1-aandeel van het vermogen van de multibandramp { "1.6.4" } niet zijn gedocumenteerd in de testcatalogus of het officiële logboek

seg-ff90679d1de9 = Spoofingdetectie

seg-b843f63e77e6 = Klokgestuurde χ², RAIM, AGC, SQM, per epoch gefuseerd tot een kwaliteitsmaat voor beveiliging

seg-baeb1c3db11f = Scenarioparameters van TEXBAT (Humphreys { "2012" }) — karakterisering, geen vastgezette vectoren. Externe vergelijking { "0.30" }, een bevinding (blijft MODELLED): bij JammerTest { "2024" } (Bleik; GPL-3.0-data) gaven de monitors op waarnemingsniveau (klokgestuurde chi-kwadraat, RAIM, oplosfout) geen alarm binnen { "10" } s na een van de { "8" } evalueerbare gepubliceerde spoofingstarts (waar het venster vóór de start schoon was, kwam het eerste alarm { "10.2" } tot { "39" } s na het gepubliceerde begin van het tijdslot), en drie vensters vóór de start bevatten valse alarmen van de klokmonitor ({ "81" }, { "64" } en { "173" } epochs). Het eerste waarneembare effect was het verlies van GPS-tracking op twee frequenties, geen RAIM-inconsistentie. De gepubliceerde starttijden zijn begintijden van tijdsloten uit het schema met een resolutie van een minuut; dat ze aan de RF-opname voorafgaan is een interpretatie, geen meting. Ronde { "2" } van { "0.30" }, tegen het officiële logboek van JammerTest { "2024" } van de organisatoren (resolutie van een seconde; vooraf vastgelegd 6a66994b met een Hadamard-gekalibreerde klokmonitor met drie toestanden zonder vergrendeling), een bevinding (blijft MODELLED): de monitor alarmeert binnen { "10" } s bij { "4" } van de { "10" } gelogde starts; bij de andere zes komt hij { "18" } tot { "211" } s te laat of geeft hij valse klokalarmen vóór de start ({ "1" } bij { "2.1.4" }, { "85" } bij { "2.3.15" }). D9 ronde { "3" } (een ontvangerkaart uit de andere sessies van het JammerTest-toestel, vooraf vastgelegd 2ec76864) geblokkeerd: { "167" } trainingsepochs tegen { "3600" }. D9 rondes { "4" } en 4b (ruisniveaus uit een modelklassekaart van een u-blox ZED-F9P, Wrocław { "2021" }, vooraf vastgelegd fb475550; 4b een bekendgemaakte herhaling met een gecorrigeerde extractie, c9cc0d49), een bevinding (blijft MODELLED): nul valse alarmen vóór de start bij alle { "10" } gelogde starts en { "6" } van de { "10" } binnen { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } en { "2.6.1" } blijven te laat (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), ongewijzigd door het ruisniveau van de klok

seg-b10d07921f5e = Beschermingsniveau voor tijdsynchronisatie onder spoofing

seg-2a829711b997 = Grens in gesloten vorm voor de ongunstigste niet-gedetecteerde tijdfout = monitorvloer + uitloop-σ van de oscillator over de CUSUM-detectielatentie, gerapporteerd als een band voor de rode-ruisvloer

seg-682251b2e3c7 = Stelt getoetste primitieven samen (allan/holdover van Van Loan, beveiligingsvloer); gekalibreerd op JammerTest { "2024" }, scenario { "2.1.1" } (~{ "1.01" } ms echte afwijking van de aangeboden tijd tegenover ≤{ "51" } ns beweerd). Brug over getoetste delen — zelf geen externe validatie. Externe vergelijking { "0.30" }, een bevinding (blijft MODELLED): in de spoofingscenario's van JammerTest { "2024" } overschrijdt de gemeten niet-gedetecteerde fout van de aangeboden tijd de nominale TPL bij { "3" } van de { "8" } gedetecteerde starts: { "184.3" } tegen { "34.6" } ns ({ "2.1.4" }), { "295.7" } tegen { "159.3" } ns ({ "2.3.5" }) en { "143.0" } tegen { "69.0" } ns ({ "2.3.11" }); drie van de vijf binnen de grens zijn triviaal (een vergrendeld vals alarm vóór de start). Waarschijnlijke oorzaak: de uitloopterm uit een kalibratie van { "60" } s met nul driftruis dekt de frequentiedwaling van de TCXO van de ontvanger over { "15" } tot { "39" } s niet. De gemeten fout is de eigen single-point-klokschatting van Kshana tegenover een lijn gefit op zijn eigen schattingen vóór de start, dus zelfs overeenstemming zou niet volledig onafhankelijk zijn geweest. Ronde { "2" } van { "0.30" }, tegen de starts in het officiële JammerTest-{ "2024" }-logboek en de gemeten tijdfout van de ontvanger (vooraf vastgelegd 6a66994b), een bevinding (blijft MODELLED): bij { "4" } van de { "10" } gelogde starts overschrijdt de niet-gedetecteerde fout de TPL met driftstoestand ({ "634.7" } tegen { "458.5" } ns bij { "2.1.1" }, { "232.6" } tegen { "16.2" } ns bij { "2.3.5" }, { "41.3" } tegen { "6.0" } ns bij { "2.3.10" }, { "218.6" } tegen { "47.4" } ns bij { "2.6.3" })

seg-0ec37553bbc4 = Missieanalyse voor cislunaire ruimte

seg-a47465f682ba = CR3BP-STM + differentiële corrector met enkelvoudig schieten; zuidelijke L2-NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; zuidelijke halo-familie bij Aarde–Maan-L2, methodologie van Howell/Davis) — extern gepubliceerde periode T, Jacobi-constante C en beginvoorwaarden voor loodrechte kruising; de STM-corrector van kshana met enkelvoudig schieten, gezaaid met de catalogus-IC en verstoord, convergeert terug naar de leden van de catalogus

seg-f1d49eac89f8 = Alternatieve en aanvullende PNT

seg-023dda973f66 = Zwaartekrachtkaartvergelijking, terreingebonden navigatie (TERCOM/SITAN), magnetische anomalie

seg-da869d48e505 = IGRF-14-coëfficiënten; matched-filter-CRLB uit de eerste beginselen. Het veld van de zwaartekrachtbenchmark met een echt veld wordt extern gecontroleerd (rij 'Gravity-anomaly synthesis from a spherical-harmonic model'), maar het navigatieresultaat ervan heeft geen externe referentie

seg-db7767ab661d = Synthese van zwaartekrachtanomalieën uit een sferisch-harmonisch model

seg-2db367c4a473 = Zwaartekrachtanomalie in sferische benadering (Barthelmes STR09/02 vgl. { "126" }, ICGEM gravity_anomaly_sa) uit volledig genormaliseerde coëfficiënten tegenover een niveau-ellipsoïde in gesloten vorm (WGS84/GRS80), met de term van graad nul, op een raster gezet voor de zwaartekrachtkaartvergelijker

seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), een onafhankelijke implementatie: EGM2008 afgekapt bij graad { "70" }, gravity_anomaly_sa, WGS84, getijvrij, term van graad nul, h = { "0" }. De uitvoer van de dienst draagt geen expliciete licentie, dus de rasters worden tijdens de test opgehaald met een vastgezette SHA-256 (tools/fetch_icgem_grid.sh) en slechts tien waarden worden met naamsvermelding aangehaald

seg-31f51d4998cb = SRTM-hoogtemodellezer op echt terrein

seg-08ea4ae0b671 = Zelfgeschreven SRTM-.hgt-parser (16 bit big-endian, noordelijke rij eerst, voidbewust) + bilineaire sampler die een echte DEM-tegel uit het publieke domein leest en een gedocumenteerde landmeetkundige benchmark oplost

seg-aae487789add = NASA/USGS SRTM v3 (1-boogseconde) tegel N36W117 — hoogtegegevens van de Amerikaanse overheid in het PUBLIC-DOMAIN uit de open AWS-spiegel elevation-tiles-prod, teruggebracht tot 6 boogseconden en vastgelegd onder tests/fixtures/terrain/ (zie NOTICE.md), plus uitsneden in volledige resolutie van N36W117 en N36W119, knooppunt voor knooppunt gecontroleerd tegen de onafhankelijke SRTMHGT-lezer van GDAL en de landmeetkundige benchmarks Mount Whitney ({ "4421" } m) en Badwater (−{ "86" } m). De gedocumenteerde benchmark van Badwater Basin (−{ "86" } m, het laagste punt van Noord-Amerika) verankert de geogerefereerde uitlezing. De terreinvergelijking/TERCOM-navigatiefix die het DEM gebruikt blijft gemodelleerd (aparte rij Alternatieve/aanvullende PNT)

seg-791e7285c291 = Reproduceerbaarheid en softwarezekerheid

seg-7177355a482c = Deterministisch, scenario-gehasht, SBOM + platformoverschrijdende golden gates

seg-6cf9d570cc51 = De SBOM komt overeen met het officiële CycloneDX { "1.5" } JSON Schema (+ geldige SPDX-identificatiecodes) — een extern gepubliceerde standaard, nul validatiefouten over de volledige afhankelijkhedengraaf; het deel over FoM-determinisme en byte-reproduceerbaarheid blijft een vastgezette zelfconsistentiecontrole, dus de rij blijft MODELLED

seg-89b2114542bb = Evaluatie van AI/ML-detectie van RF-verstoringen ({ "13494" })

seg-241f2eeaef12 = Gelabeld synthetisch corpus van verstoringen + detectoronafhankelijk raamwerk voor ROC/AUC/verwarring/Pfa-Pmd; lekbewaking, gestratificeerde splitsing, rapport over optimisme bij distributieverschuiving (binnen versus buiten het regime). Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/impairment-eval.toml)

seg-72a3c97ef04b = AUC-grenzen in gesloten vorm (Mann–Whitney) + een detector met perfecte referentie; het corpus is SYNTHETISCH (op parameters gebaseerd, geen veld-/IQ-data)

seg-c38ebee794b3 = Onderzoek naar de optimismekloof bij AI/ML-detectie van RF-verstoringen en een voorspeller van de kloof alleen op basis van ID-gegevens

seg-642087659fda = Gecontroleerd synthetisch onderzoek naar de optimismekloof in AUC tussen in-distributie en buiten-distributie voor detectoren met gepubliceerde methoden en getrainde detectoren (logistische regressie / MLP met één verborgen laag): trends van schaalwetten per klasse (Spearman ρ + helling op { "1" }−ernst) en een ridge-voorspeller alleen op ID-gegevens die de kloof schat uit diagnostiek binnen de distributie, beoordeeld met leave-one-detector-out en leave-one-class-out. Reproduceerbaar via <c1/>

seg-c46973920f5b = Met de hand afgeleide statistieken tegenover gesloten vormen (binormale AUC Φ(d'/√{ "2" }), DeLong-variantie, Spearman met gelijke rangen, exact OLS-herstel) + leave-one-out-CV tegenover de basislijn die het gemiddelde voorspelt. Het corpus is SYNTHETISCH (op parameters gebaseerd, nooit veld-/IQ-data) en de optimismekloof is een synthetisch→synthetische ernstverschuiving, GEEN sim-naar-veld-resultaat

seg-fd6424213d1f = Afweging kwantum versus klassiek voor PNT en veerkracht zonder GNSS ({ "13503" })

seg-21b2b54200a8 = Inlezen van gemeten ADEV (NNLS), afwegingstabel (holdover voor tijdsynchronisatie/inertiaal + voordeel), veerkracht-versus-tijd-omhullende; voorbehoud over de vloer meegedragen op het artefact. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/quantum-trade.toml)

seg-37d11937c966 = De kern voor de fit van gemeten ADEV→PSD (NNLS) komt overeen met scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — een onafhankelijke externe kern; maar de GETALLEN van de afweging kwantificeren (en toetsen nooit) een klok/CAI van de partner, dus de afweging zelf blijft MODELLED, zonder validatiekeurmerk

seg-1fa865bfddd1 = Ruimteweeromgeving en door activiteit aangedreven thermosferische dichtheid

seg-47308f611c7e = Zonne- en geomagnetische indices (definitorische Kp↔ap-tabel), de exosferische temperatuur van Jacchia-1971 en de thermosferische dichtheid van Jacchia { "1971" } (SAO Special Report { "332" }: statische diffusieprofielen die zijn tabel { "7" } reproduceren, met de dagelijkse, geomagnetische, halfjaarlijkse, seizoens-breedtegraad- en heliumvariaties) tegenover de statische USSA76-atmosfeer. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/space-weather.toml)

seg-1cad4329e226 = Definitorische Kp↔ap-tabel + gesloten vorm voor de exosferische temperatuur van Jacchia-1971 (overeenstemming tot <{ "1" } K tegenover de gepubliceerde ankerpunten, tests/space_weather_reference.rs); de dichtheid wordt gekarakteriseerd tegenover pymsis NRLMSISE-00 (een onafhankelijk NRL-model): de zonnecyclusuitslag op { "800" } km is 10.4x tegenover 13.6x bij NRLMSISE-00. Herziening { "0.30" }: de gekalibreerde activiteitsfactor van de eerste orde is vervangen door Jacchia { "1971" } (dichtheid in het standaardscenario op { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k verwijderd, mean_exospheric_temperature_k toegevoegd). Ronde { "2" } van { "0.30" }, gemeten TOLEOS-dichtheden uit CHAMP/GRACE/GRACE-FO-accelerometers (ESA Swarm DISC; vooraf vastgelegd 20eed695), een bevinding (blijft MODELLED): baangemiddelden op { "400" } tot { "500" } km liggen binnen een factor { "2" } bij zonnemaximum buiten stormen (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), maar Jacchia { "1971" } is ongeveer 1.7x te dicht in het zonneminimum van { "2008" } (GRACE-A 412/544 binnen een factor { "2" }), dus de dichtheid is niet getoetst

seg-29bedb28c34f = CCSDS OEM-interoperabiliteit (import van efemeriden uit GMAT/Orekit/STK)

seg-edb58ffbbb5b = CCSDS { "502.0" }-OEM-importer (parse_oem), tolerant voor COMMENT-regels, extra metadatasleutelwoorden en covariantieblokken, en de exacte inverse van de schrijver; heen-en-terugtest + inlezen van externe bestanden met een controle op snelheidsconsistentie. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/oem-interop.toml)

seg-bc507f96c4df = Onafhankelijke CCSDS-502-parser van derden <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) — een aparte codebase die de uitgezonden EME2000/UTC-OEM van kshana byte-identiek decodeert ({ "24" } toestanden over { "2" } fixtures, pos/vel Δ = { "0" }) en waarvan de strikte lezer de metadatatokens bevestigt; de parser van kshana komt eveneens met die van haar overeen op een meegeleverde externe OEM. Twee eerlijke bevindingen over interoperabiliteit (de oem-bibliotheek verwerpt de conventie van kshana met meerdere segmenten per satelliet en de covariantieregels met meerdere items) zijn in de test gedocumenteerd — dus dit toetst de uitwisseling van één object die overeenkomt met de standaard, niet de volledige overeenkomst met CCSDS-502 van elke kshana-variant

seg-c76b8c395ef0 = Lanceervenster en geometrie van de opstijging (missieanalyse)

seg-6066c634faba = Lanceerazimut(en) voor twee lichamen (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, oostwaartse bonus van de aardrotatie, Δv voor een vlakwijziging met dogleg en dagelijkse kansen, en, bij een gegeven epoch en IERS-finals2000A-rijen, de snelheid van het station om de ware pool (launch::site_rotation_speed_at). Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/launch-window.toml)

seg-2515ab37f99b = Sferisch-trigonometrische lanceergeometrie in gesloten vorm tegenover gepubliceerde uitgewerkte voorbeelden als ankerpunt (Vallado, Fundamentals of Astrodynamics 4e druk, algoritme { "37" } lanceerazimut + hfst. 6 vlakwijziging; tests/launch_window_ascent_geometry_reference.rs). Deze gebruiken dezelfde gesloten vorm die kshana implementeert (een pariteits- of transcriptiecontrole op een gepubliceerde waarde, InternalConsistency); MODELLED met twee lichamen, geen model voor de snelheidsdriehoek met roterende aarde, opstijging of luchtweerstandsverlies. Externe vergelijking { "0.30" } met Orekit { "12.2" } (Apache-2.0), een bevinding (blijft MODELLED): de geometrie komt overeen tot op afronding (inclinatie teruggelezen uit het uitbrandazimut over { "158" } gevallen, slechtste { "2.6e-15" } rad; minimale inclinatie, cirkelsnelheid en delta-v voor dogleg tot { "3e-16" }), maar de stationssnelheid door aardrotatie mist de vooraf vastgelegde relatieve { "1e-6" } op { "62.9" } deg breedtegraad ({ "1.12e-6" }). Het verschil groeit als tan(lat), in overeenstemming met een poolverschuiving door poolbeweging van ongeveer { "5.8e-7" } rad in het aardstelsel van Orekit die de sferische ω·R·cos(lat) weglaat. De bewering was vóór de run niet versmald, dus de rij kan op grond van deze vergelijking niet promoveren. Ronde { "2" } van { "0.30" } (vooraf vastgelegd 71bebf63): met een epoch en IERS-rijen komt de stationssnelheid om de ware pool (scenarioveld site_rotation_speed_true_pole_m_s) met Orekit overeen binnen { "1e-6" } op { "24" } stations over vier lengtegraden (slechtste { "4.9e-8" }), maar de nominale snelheid zonder epoch die het scenario standaard als bonus van de aardrotatie uitvoert mist nog steeds met { "1.12e-6" }, dus de rij blijft MODELLED in afwachting van een besluit over de standaarduitvoer

seg-ff2cd766bb52 = Ballistische terugkeercorridor (Allen–Eggers)

seg-c3f3422f96e4 = Piekvertraging (onafhankelijk van de ballistische coëfficiënt), snelheid en hoogte bij de piek-g, en snelheid bij piekverhitting voor een ballistische intrede in een exponentiële atmosfeer. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/reentry.toml)

seg-121f02d79ae0 = Analytische intrede van Allen–Eggers in gesloten vorm, bovendien gecontroleerd tegenover een numerieke integratie met scipy { "1.18" } solve_ivp (DOP853) van dezelfde intrede-ODE met alleen luchtweerstand (tests/ballistic_re_entry_corridor_reference.rs, { "36" } gevallen, slechtste a_max rel { "2.9e-9" }) — een controle van numerieke integraal tegenover de eigen analytische vorm, dus nog steeds InternalConsistency, GEEN externe validatie. MODELLED ballistisch (geen lift), geen aerothermisch/TPS — de verhittingsuitvoer is een snelheid, geen warmteflux. Externe vergelijking { "0.30" }, een bevinding (blijft MODELLED): tegenover de reconstructie van de intrede van de Stardust-SRC (Desai en Qualls, NASA NTRS { "20080008567" }) bedraagt de piekvertraging volgens Allen–Eggers voor de gedrukte inertiële intredetoestand ({ "12.9" } km/s, -8.2 deg, H { "7200" } m) { "61.8" } g tegenover { "32.89" } g van het best geschatte traject, +{ "88" } % tegen een tolerantie van { "15" } %: de oplossing met constante baanhoek en zonder zwaartekracht verdubbelt ruwweg de piek van een ondiepe intrede sneller dan de ontsnappingssnelheid. Stardust had geen accelerometer, dus de reconstructie is een trajectschatting. Ronde { "2" } van { "0.30" }, geblokkeerd (blijft MODELLED): een geïntegreerde vlakke puntmassaoplossing (reentry::simulate_planar_entry, US76, zwaartekracht met inverse kwadraat, kromming) komt binnen { "15" } % overeen met de best geschatte trajecten van Stardust en Genesis (+{ "11.3" } %, +{ "5.6" } %), maar die maxima zijn simulatie-uitvoer van ruimtevaartorganisaties, geen metingen, dus dit is alleen een kruiscontrole. De vergelijking met de accelerometer (vooraf vastgelegd a94a283d) is geblokkeerd op een leesbare kopie van de REMM-analyse van Hayabusa2 (doi 10.57350/jesa.16)

seg-8c10b50407d3 = Footprint en dekkingsgeometrie van een EO-payload

seg-45c1e799c87c = SMAD-ruimtedriehoeksgeometrie: hoekstraal van de aarde, zwadbreedte, nadir-GSD, maximale off-nadir-toegang en cirkelperiode, plus de nodale periode van de eerste orde van J2 (eo_payload::j2_nodal_period) en de afstand tussen grondsporen op de evenaar R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) met een vlag voor aaneengesloten dekking, voor een baanhoogte, inclinatie en sensor-FOV/IFOV. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/eo-coverage.toml); de standaardinclinatie is de zonsynchrone uit eo_payload::sun_synchronous_inclination, een gemaksstandaard die geen deel uitmaakt van de getoetste bewering

seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) en GeographicLib { "2.1" } (MIT), beide als aparte programma's uitgevoerd, vooraf vastgelegd (766823f3) vóór de enginewijziging en elke referentierun: bolgroottes binnen { "1e-9" } relatief (slechtste: hoekstraal { "5.4e-16" }, zwad { "7.0e-13" }, toegang { "1.9e-14" }), periode { "1e-12" } ({ "1.6e-16" }), nadir-GSD { "1e-7" } ({ "2.9e-10" }), de nodale periode van J2 en de knoopafstand binnen { "0.1" } % van een numerieke J2-propagatie met Orekit met een knoopdetector ({ "1.2e-5" } en { "6.7e-5" }), de vlag voor aaneengesloten dekking exact (168/168), en tegenover de WGS-84-ellipsoïde de limb binnen { "0.3" } deg ({ "0.186" } deg) en het maximale grondbereik binnen { "0.5" } % ({ "3.2e-3" }). Het weglaten van de term voor nodale regressie laat { "35" } van de { "42" } knooppunten falen. MODELLED reikwijdte: footprint op een bolvormige aarde; geen radiometrie, MTF, atmosfeer, jitter of glint; de zonsynchrone standaardinclinatie wordt niet vergeleken. De eerdere kruiscontrole met Skyfield/SGP4 blijft behouden als regressietest. Herziening { "0.30" }: de afstand draagt nu de nodale regressie van J2 (standaardscenario { "2756.37" } -> { "2752.17" } km)

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-framing

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet: coderen en decoderen van de primaire header (versie/type/sec-hdr/APID/seq-flags/teller/datalengte) + een framingscenario. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — een onafhankelijke implementatie van CCSDS 133.0-B-2 door een derde; encode_packet/decode_packet van kshana kwamen byte voor byte overeen (de primaire header van 6 octetten voor { "33" } gevallen + het volledige gecodeerde pakket voor { "12" })

seg-5510c82f671a = CCSDS Space Packet: secundaire header, pakketfoutcontrole en segmentatie

seg-7503bf761df9 = Uitbreidingen van CCSDS 133.0-B-2 Space Packet naast de primaire header: een secundaire header met een tijdcode van CCSDS 301.0-B (CUC of CDS, expliciet of impliciet P-veld) en aanvullende gegevens, het veld voor CRC-16-pakketfoutcontrole, segmentatie van een grote gebruikersgegevenseenheid en de hermontage ervan, streamdecodering met controles op reeksgaten en volgorde, en PUS-TM-pakketten. De uitvoer van de primaire header is byte-identiek aan die van voorheen

seg-4123d600477a = Vooraf vastgelegd (003ef3eb) vóór enige vergelijking; vier onafhankelijke implementaties, geen GPL, niets meegeleverd: ccsdspy { "2.0.1" } (BSD-3-Clause) decodeert { "34" } door Kshana geschreven pakketten in { "5" } streams (primaire header, P-veld, grove en fijne tijd, CDS-velden, aanvullende gegevens, gebruikersgegevens, PEC) en beide gesegmenteerde eenheden van 1000 octetten worden uit zijn gebruikersgegevens herbouwd met { "0" } afwijkingen, en het markeert de streams met het weggelaten en het verwisselde pakket die Kshana verwerpt; de CRC van { "8" } berichten en { "57" } PEC-velden is gelijk aan CPython binascii.crc_hqx en spacepackets-rs { "0.18.0" } (controlewaarde 0x29B1); { "66" } gevallen met CUC- en CDS-tijdcodes zijn gelijk aan het schrijven en lezen van spacepackets-rs { "0.18.0" } octet voor octet ({ "3" } CDS-gevallen ook spacepackets-py { "0.32.0" }); { "4" } PusTm-pakketten van spacepackets-py { "0.32.0" } zijn byte-identiek aan die van Kshana. Niet gedekt: tijdcodes met epoch van een ruimtevaartorganisatie ({ "7" } gevallen steunen op unittests), TC-transferframes en elke linklaag onder het pakket

seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, pakketfoutcontrole, segmentatie en hermontage, streamdecodering)</s1>

seg-7c61da52b8f8 = SPICE-SPK-export (typen { "9" } en { "13" })

seg-582ce23522f6 = Schrijver en lezer van NAIF SPICE-SPK-kernels van de typen { "9" } (Lagrange, ongelijke tijdstappen) en { "13" } (Hermite, ongelijke tijdstappen), met de DAF-indeling, segmentbeschrijvingen en epochmappen, en de export van een CCSDS-OEM naar een SPK-kernel (UTC- of TDB-epochs naar efemeridentijd)

seg-194c37ac787f = CSPICE N0067 via spiceypy { "8.3.0" }, leapseconds-kernel naif0012.tls, vooraf vastgelegd (5059fd2a) voordat SPICE een Kshana-kernel las: de inventaris van SPICE van de vier kernels van Kshana is exact; spkpvn en spkgeo op { "5 516" } epochs en { "690" } ketenevaluaties zijn bit voor bit gelijk aan de eigen evaluatie van Kshana en blijven op elk knooppunt binnen de drempel (slechtste { "0.022" } ervan); Kshana leest door SPICE geschreven kernels bit-identiek; voor dezelfde invoer zijn de kernels van Kshana byte-identiek aan die van SPICE ({ "0" } afwijkende bytes in vier bestanden); OEM-epochs worden omgezet naar efemeridentijd binnen { "6.0e-8" } s van str2et (drempel { "1e-6" } s) en SPICE evalueert de OEM-export binnen de drempel (slechtste { "0.060" }). Synthetische Kepler-bogen: niets over fysieke nauwkeurigheid. Andere SPK-typen worden niet geschreven

seg-d699104fc2af = SPICE-SPK-typen { "3" } en { "21" } (Chebyshev, uitgebreide verschillijnen)

seg-7d3e8b5b40af = Schrijver en lezer van NAIF SPICE-SPK-segmenten van type { "3" } (Chebyshev-polynomen voor positie en snelheid over vaste intervallen, graad { "0" } tot { "27" }) en type { "21" } (uitgebreide gemodificeerde verschilreeksen, de verschillijnen van JPL-integratoren, MAXDIM { "15" } tot { "25" }), uit gegeven records, in bestanden die ook segmenten van type { "9" } en { "13" } bevatten; recordselectie en evaluatie in de volgorde van de SPICE-lezers. Kshana fit geen Chebyshev-coëfficiënten en produceert geen verschillijnen

seg-40323a2adce1 = CSPICE N0067 via spiceypy { "8.3.0" } (spkw03, spkw13 en, uit dezelfde bibliotheek via haar f2c-symbool, spkw21; spkpvn, spkgeo), vooraf vastgelegd (e1cf80d8) voordat de code bestond, de synthetische records getrokken uit de SHA-1 van die commit: voor drie bestanden (type { "3" } met graden { "0" }, { "12" } en { "27" } met { "3" } tot { "150" } records; type { "21" } MAXDIM { "15" }, { "20" } en { "25" } met { "1" } tot { "250" } lijnen, nul tot twee mapitems en een middenketen; type { "3" }, { "21" } en { "13" } in één bestand met commentaar) is de inventaris van SPICE van de kernels van Kshana exact, zijn de kernels van Kshana byte-identiek aan degene die SPICE uit dezelfde records schrijft, en zijn spkpvn en spkgeo bit voor bit gelijk aan de lezer van Kshana op bestanden van Kshana en van SPICE ({ "48 876" } componenten in elke richting, drempel { "1e-12" } relatief). Synthetische records: niets over fysieke nauwkeurigheid; echte door JPL geproduceerde kernels van type { "21" } zitten niet in de gevallenset

seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

seg-f88f6ea002c8 = Schrijver en lezer van de CCSDS 504.0-B-2 Attitude Data Messages in KVN en NDM/XML: AEM versie { "2.0" } (en { "1.0" } in KVN, met ATTITUDE_DIR, QUATERNION_TYPE en numerieke rotatievolgordes) met attitudetypen quaternion, Euler-hoeken en spin en hun afgeleide, hoeksnelheids- en nutatievarianten, meerdere segmenten; APM versie { "2.0" } met blokken voor quaternion, Euler, hoeksnelheid, spin, traagheid en manoeuvres; het A-naar-B-quaternion van een record (504.0-B-2 bijlage F)

seg-8853058de1f3 = Orekit { "13.1.8" } (Apache-2.0) parsers en schrijvers, als apart programma uitgevoerd (xval/adm-orekit), vooraf vastgelegd (7a6a05fe) vóór enige vergelijking: Orekit parseert elk door Kshana geschreven bericht ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) en elke waarde ligt binnen zijn drempel (quaternionen { "1e-14" }, hoeken { "1e-9" } deg; slechtste { "0.054" } van een drempel); Kshana parseert de { "31" } berichten die Orekit uit dezelfde invoer schrijft binnen elke drempel; de rotatie van elk van { "135" } quaternion-, Euler- en spinrecords is gelijk aan AemSegment.getAngularCoordinates binnen { "1e-12" } (slechtste { "0.0071" } van de drempel). Alle { "15" } XML-berichten van Kshana valideren tegen het NDM/XML-{ "4.0.0" }-schema (gegevensafhankelijk, opgehaald met vastgezette SHA-256). Bevinding: de APM-schrijver van Orekit weigert een manoeuvre zonder MAN_DELTA_MASS (optioneel in de standaard), dus APM-manoeuvres worden alleen in de richting waarin Kshana schrijft gedekt. Buiten de gevallenset: AEM { "1.0" } */RATE-typen en XML, herhaalde APM-blokken

seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

seg-eaddfd311fea = Schrijver en lezer van de CCSDS 502.0-B-3 Orbit Data Messages in KVN en NDM/XML: OPM { "3.0" } en { "2.0" } (toestandsvector, osculerende Kepler-elementen, ruimtevaartuigparameters, covariantie, manoeuvres, door de gebruiker gedefinieerde parameters), OMM { "3.0" } en { "2.0" } (gemiddelde elementen via gemiddelde beweging of halve lange as, TLE-gerelateerde parameters met BSTAR of BTERM en AGOM, covariantie), en OCM { "3.0" } met traject (CARTP, CARTPV, CARTPVA; absolute of relatieve epochs), fysieke eigenschappen, covariantie (CARTP, CARTPV in LTM-volgorde), manoeuvre- en door de gebruiker gedefinieerde blokken; een OMM met volledige precisie uit een SGP4-elementenset naast de ongewijzigde OmmFile::to_omm_kvn

seg-d4c7896b5963 = Orekit { "13.1.8" } (Apache-2.0) parsers en schrijvers voor OPM, OMM en OCM, als apart programma uitgevoerd (xval/odm-orekit), vooraf vastgelegd (cc6841da) vóór enige vergelijking: { "27" } van de { "30" } door Kshana geschreven berichten ({ "6" } OPM-, { "5" } OMM- en { "5" } OCM-gevallen in KVN, en XML voor versie { "3.0" }) worden door Orekit geparseerd met elke waarde binnen { "1e-14" } relatief en elke epoch binnen { "1e-9" } s ({ "904" } waarden, slechtste { "0.021" } van een drempel), en Kshana leest alle { "25" } berichten die Orekit terugschrijft binnen dezelfde drempels ({ "858" } waarden, slechtste { "0.020" }); alle { "14" } XML-berichten van Kshana valideren tegen het NDM/XML-{ "4.0.0" }-schema (gegevensafhankelijk). Bevindingen, vastgezet, die de bewering versmallen: Orekit vereist ELEMENT_SET_NO (optioneel in 502.0-B-3), weigert COMMENT in door de gebruiker gedefinieerde XML-parameters (het schema staat het toe), schrijft geen BTERM zonder BSTAR (dus BTERM en AGOM worden alleen in de richting waarin Kshana schrijft gedekt), en telt relatieve OCM-epochs op als SI-seconden, zodat ze onder TDB ongeveer { "1.9e-10" } s/s afwijken van de lezing van de TDB-kalender (UTC, TAI en TT komen overeen). De verouderde uitvoer van OmmFile::to_omm_kvn, die OMM-metadata in META_START/META_STOP verpakt, wordt door Orekit geweigerd (vastgelegd). Buiten de reikwijdte: OCM-PERT- en OD-blokken, niet-cartesische elementensets, andere covariantievolgordes

seg-1e5ea1d9918d = Foutenbudget voor attitude en richting met 3 vrijheidsgraden (AOCS)

seg-21f2f8efcf19 = Verstoringskoppel van de zwaartekrachtgradiënt in het ongunstigste geval ((3/2)(μ/R³)ΔI) als de piek over de attitude (de getoetste bewering), plus een RSS-richtfoutbudget over benoemde bijdragen van 1σ met de dominante term (een kwadratensom van door de aanroeper aangeleverde getallen, buiten de getoetste bewering). Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), een onafhankelijke C++-implementatie van het zwaartekrachtgradiëntkoppel met de volledige tensor: de piek (3/2)(μ/R³)ΔI van Kshana is gelijk aan het koppel van Basilisk bij de attitude van { "45" } deg binnen { "1e-12" } relatief (slechtste { "2.1e-15" }) over { "5" } hoogten en { "8" } traagheidstensoren, en begrenst het koppel van Basilisk over { "2000" } willekeurige attitudes per geval; tolerantie vastgesteld vóór de vergelijking. Getoetste bewering: de piek van het zwaartekrachtgradiëntkoppel. Het RSS-richtbudget is een kwadratensom van door de aanroeper aangeleverde getallen zonder externe waarheid en blijft daarbuiten; de met de hand gecodeerde maximalisatie van de volledige tensor met Hipparchus blijft bestaan als ondersteunende zelfconsistentie. Geen simulatie van regelkringen, 6-DoF of flexibele modi

seg-1461aa14a7ff = Voorspelling van grondstationpassages (grondsegment)

seg-e1cf1ec4f005 = Zichtbaarheidspassages in het tijdsdomein (AOS/TCA/LOS, maximale elevatie, duur) van een enginepropagator boven een station boven een elevatiemasker, met geïnterpoleerde op- en ondergangsdoorgangen en totale toegang: passes::predict_passes, de geometrische planner (geen refractie of lichttijd). De scenariosoort <c1/> voert de schijnbare voorspeller uit van de rij 'Apparent ground-station pass prediction with refraction and light time'

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — een onafhankelijke bibliotheek voor vluchtdynamica: ElevationDetector (Brent-wortelzoeker) + EventsLogger over een ITRF-efemeride, station als WGS-84-TopocentricFrame. AOS/LOS/maximale elevatie/aantal passages/totale toegang komen overeen bij identieke baan + station + masker + venster (vastgelegde fixture; stuurprogramma xval/orekit-passes)

seg-1dd8b2655b18 = Voorspelling van schijnbare grondstationpassages met refractie en lichttijd

seg-46f93d3c24d2 = Zichtbaarheidspassages (AOS, TCA, LOS, maximale schijnbare elevatie, duur) van een SGP4-elementenset boven een WGS-84-station op het getoetste pad voor aardbanen (IAU 2006/2000A, optionele aardoriëntatieparameters), met troposferische refractie volgens ITU-R P.834-9 (vergelijkingen { "9" } tot { "14" }, de gedrukte coëfficiënten van de aanbeveling) en de lichttijd van de downlink, elk schakelbaar; doorgangen opgelost door bisectie tot { "1e-7" } s en het hoogtepunt door gouden-sectiezoeken. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/passes.toml), beide correcties standaard aan

seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) met Hipparchus { "4.0.3" }: TLEPropagator op dezelfde elementensets in een TEME die Orekit volgens de opgegeven definitie opbouwt (zijn IERS-{ "2010" }-TOD geroteerd met GAST - GMST), ElevationDetector en ElevationExtremumDetector met en zonder ITURP834AtmosphericRefraction, en AngularAzEl met AngularRadioRefractionModifier voor het geval met lichttijd, doorgangen en maximum opgelost door Hipparchus; { "60" } gevallen (vier banen, vijf stations op zeeniveau, maskers { "0" }, { "5" } en { "10" } deg, { "24" } uur). Drempels vastgesteld vóór de run (vooraf vastgelegd e947e69d, onderdeel { "3" } van 72ea9eb0). Als de lichttijd wordt genegeerd ({ "9777" } fouten) of de P.834-constante { "1.728" } wordt gewijzigd in { "1.828" } ({ "7883" } fouten), wordt de test rood. Reikwijdte: stations op zeeniveau; de P.834-coëfficiënt h*theta0^{ "2" } van Orekit is { "0.011380" } waar de aanbeveling { "0.01380" } afdrukt (vastgezet), dus hoogten boven zeeniveau worden niet vergeleken. Ronde { "1" }, tegen de standaard IERS-{ "1996" }-TEME van Orekit, haalde elke passagedrempel maar miste de richtingsdrempel door het verschil van { "72" } mas in de TEME-conventie (vastgezet)

seg-7b4a8e25c3c9 = Adaptieve codering en modulatie van DVB-S2 langs een LEO-downlinkpassage

seg-3912fb8ccb15 = Es/N0 van de downlink langs elke passage van één satelliet boven één station (EIRP, vrijeruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, constante van Boltzmann, symboolsnelheid), de efficiëntste DVB-S2-MODCOD die bij elke stap de quasi-foutvrije drempel van ETSI EN { "302" } 307-1 V1.4.1 tabel { "13" } plus een implementatiemarge haalt, het ACM-datavolume van de passage, en de basislijn met constante codering die sluit bij het masker en de grootste afstand. Uitvoerbaar als scenariosoort <c1/>. Illustratieve invoer; MODELLED.

seg-a7f26e3a6030 = Interne consistentie: de spectrale efficiëntie, in gesloten vorm berekend uit K_bch van tabel 5a en de framelengtes, komt overeen met de efficiënties die tabel { "13" } afdrukt (een transcriptiecontrole op de drempeltabel); de onderdelen van het linkbudget komen overeen met hun gesloten vormen; de selectie is monotoon in Es/N0 en houdt de marge aan; ACM verplaatst minstens het volume van constante codering. De passagegeometrie komt van de afzonderlijk VALIDATED schijnbare passagevoorspeller. WAT HET NIET IS: er is geen extern hulpmiddel of gemeten link vergeleken; de drempels zijn de ideale AWGN-waarden van de standaard, niet die van een modem; regenfading, richtverlies langs de passage en piloten zijn niet gemodelleerd.

seg-19603a7e0fe8 = Planning van grondcontacten voor meerdere satellieten en meerdere stations met conflictoplossing

seg-40edeae6e48b = Kandidaatcontacten uit elke satelliet-stationpassage met haar ACM-datavolume; conflicten waar één antenne twee satellieten binnen haar omsteltijd zou bedienen of één satelliet naar twee stations tegelijk zou downlinken; een met prioriteit gewogen leveringsdoelfunctie begrensd door de achterstand van elke satelliet; een lui plan met marginale waarde volgens het greedy-principe, een first-come-basislijn en een exacte branch-and-bound op maximaal { "26" } kandidaten, waarbij de optimaliteitskloof van het greedy-plan wordt gerapporteerd. Uitvoerbaar als scenariosoort <c1/>. Illustratieve invoer; MODELLED.

seg-bc520db98f9a = Interne consistentie: de exacte branch-and-bound komt overeen met brute-force-opsomming op kleine willekeurige verzamelingen, elk plan wordt op haalbaarheid gecontroleerd tegen de conflictregels, en het greedy-plan verslaat het exacte optimum nooit. WAT HET NIET IS: er is geen extern planningshulpmiddel of operationeel plan vergeleken; contacten worden als geheel genomen (geen splitsing), de achterstand ligt vast bij het begin van het venster, omsteltijd boven de vaste omsteltijd en boordopslag zijn niet gemodelleerd.

seg-ddf2bc2f13a9 = Linkbudget in één richting (communicatie / linkontwerp)

seg-83331f513dba = Vrijeruimte-padverlies, C/N₀, Eb/N₀, marge en sluiting volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005 voor EIRP/G·T/afstand/snelheid/band tegenover een vereiste Eb/N₀. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/link-budget.toml)

seg-195bf7e31f24 = Gepubliceerde designcontroletabel voor telecommunicatie in de diepe ruimte als vastgezette numerieke vectoren: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabel 1-1 (Galileo X-band) — kshana zet de regelposten van de tabel opnieuw in elkaar en reproduceert de gepubliceerde L_fs van { "290.54" } dB en Pr/N0 van { "54.6" } dB-Hz van begin tot eind; het vrijeruimteverlies is ook gecontroleerd tegenover ITU-R P.525

seg-3742d2aea62a = Sobere kader voor kosten per dekking / ROI

seg-4228311689f8 = Kosten per procent dekking + dekking per euro (ROI) over de engine voor constellatiedimensionering; de kosten per satelliet zijn een door de aanroeper aangeleverd bereik laag/nominaal/hoog (geen verzonnen prijzen)

seg-d542ac64c31c = Kostenrekenwerk in gesloten vorm tegenover met de hand afgeleide waarden; een economische KADERING van een gemodelleerd dekkingscijfer, geen offerte en geen getoetst kostenmodel

seg-8ba6ee9acc8a = Integriteitseffect van gemiste detectie (contextbewuste HPL/VPL tegenover alarmlimiet)

seg-f5985399d0d5 = Zet een niet-gedetecteerde spoof- of jam-bias om in effectieve fout → Stanford-gebied (beschikbaar/niet beschikbaar/MI/HMI) tegenover contextspecifieke HAL/VAL (open lucht versus stedelijk)

seg-124d0ffe959e = Stelt de extern getoetste RAIM-Stanford-classificatie samen (raim::classify_stanford); de afbeelding van gemiste detectie naar AL is zelf gemodelleerd, geen gecertificeerde integriteitstoewijzing

seg-37d43b5b918a = Parameterblad met geciteerde foutmodellen voor CAI ({ "13503" })

seg-0b6a901f5ad2 = Prestaties van cold-atom-interferometers in een bereik (best/nominaal/conservatief) — biasinstabiliteit, snelheids-/hoekrandomwalk, stabiliteit van de schaalfactor, door de interrogatie beperkte samplefrequentie, dynamisch bereik door franje-ambiguïteit — elk herleidbaar tot een bron; voedt QuantumNavBudget zonder hardware te modelleren

seg-4b66096727b8 = Interne consistentie: het geciteerde VRW-bereik is gecontroleerd tegenover de natuurkunde van CaiAccelerometer::accel_asd + het ruwe dynamische bereik berekend uit de grens van de franje-ambiguïteit; de getallen zijn MODELLED bereiken uit een literatuuroverzicht (needs_source_confirmation), geen apparaat getoetst, geen validatiekeurmerk

seg-c93f2d3a3167 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — epochclassificator voor het Stanford-integriteitsdiagram

seg-712d5c35a6a6 = TIB: epochclassificatie volgens het Stanford-integriteitsdiagram (nominaal / niet beschikbaar / MI / HMI)

seg-93b913e60063 = Onafhankelijke numpy-herimplementatie van de regel met vier gebieden (scripts/gen_tib_scorer_reference.py) op dezelfde steekproefverzameling; methode overgenomen uit het Stanford–ESA-integriteitsdiagram (Tossaint et al., ION GNSS { "2007" }) en RTCA DO-229 WAAS MOPS. GEEN ExternalDataset-nauwkeurigheidsreferentie — de benchmark is immuun voor oneerlijkheid.

seg-573aa0193cb3 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — scorer voor integriteitsdekking

seg-4d86f3c2d8f5 = TIB: scoring van integriteitsdekking (HMI/MI/beschikbaarheidspercentages + oordeel over overbound-dekking)

seg-645eb084ae8e = Onafhankelijke numpy-hertelling van gebieden in tests/fixtures/tib/reference.json; alleen een kruiscontrole van de scorermechaniek, geen nauwkeurigheidsbewering.

seg-372dd0fdb025 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — foutencatalogus (parametrische generatoren)

seg-2604e7cf27d2 = TIB-foutenmenu (domeindivergentie, klokslam, holdover-uitloop, statische/incrementele/symmetrische/asymmetrische vertraging, replay binnen versheid, padselectief, k-uit-N-quorum)

seg-b907aecaccd0 = Representatieve parametrische foutgeneratoren (gemodelleerd); de niet-detecteerbare verzameling (symmetrische vertraging, replay binnen versheid) is overgenomen uit Mizrahi RFC { "7384" } en Narula & Humphreys (IEEE JSTSP { "2018" }). Geen externe referentie — een foutencatalogus doet geen gemeten bewering.

seg-90c0eb1e7c14 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — oordeel over absorptie van niet-detecteerbare fouten

seg-f713acf042ff = TIB: oordeel over absorptie van niet-detecteerbare fouten (symmetrisch/replay moet door het PL worden geabsorbeerd en nooit als gedetecteerd worden gemeld)

seg-6840c2467c63 = Eigenschapscontrole dat de Verdict-enum structureel een niet-detecteerbare fout niet als gedetecteerd kan melden (Mizrahi RFC { "7384" }); geabsorbeerd ⟺ PL ≥ offset. Geen nauwkeurigheidsreferentie.

seg-3652a591eefc = Engineering van het ruimtevaartuigplatform (AOCS/thermisch/structuren/voortstuwing/energie)

seg-50a9c1c7dff0 = Niet geleverd — Kshana is een simulator voor navigatieprestaties, geen platformbouwer

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = Ontwerp van navigatie-RF-payload en antennehardware

seg-76c983a23e7b = Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware

seg-7bba3b35214c = Ontwerp en rijping van kwantumpayloadhardware

seg-15fcc200b859 = Niet geleverd — alleen prestatiemodellen; hardware voor cold-atom en klokken is van een partner

seg-d69dd4c5167b = Productborging voor vluchthardware (straling/EEE/MAIT)

seg-b1540f78ffd4 = Niet geleverd — Kshana richt zich alleen op productborging van software; productborging voor vluchthardware is van een partner

seg-1f200f8efc71 = Maancoördinatentijd

seg-2e6961dbffe9 = Relativistische klokgang Aarde–Maan (LTC/TCL) + koppeling van TT/TAI/UTC + ensemble

seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; basis voor de LTC van IAU/IAG LunaNet): zelfpotentiaal aan het maanoppervlak L_m = { "3.13881e-11" } en seculier totaal { "56.02" } µs/dag komen overeen met de gepubliceerde numerieke waarden; geocentrische maansnelheid gecontroleerd tegenover JPL DE440 (de440s.bsp via SPICE)

seg-8adbbd2cdb74 = Zelfbeschrijving van het hybride optische/RF-rapport

seg-2a5e48b558e1 = Het hybrid-optical-rf-rapport vermeldt de linkconfiguratie waarmee het daadwerkelijk is gerund (golflengte van de draaggolf, zend- en ontvangstapertuur, afstand, pulsbreedte, integratietijd, rendementen en verliezen, standaardwaarden ingevuld) en bevat een eenhedenblok met de eenheid en herkomstklasse van elke grootheid die een artikel waarschijnlijk citeert, inclusief de sporen van de overdrachtscovariantie in vierkante meter

seg-23f0c10237f4 = Geen externe referentie, en een is ook niet mogelijk: dit is zelfbeschrijving, geen meting. Het is vastgelegd omdat het ontbreken ervan een gebrek was -- P5 moest de golflengte van de draaggolf en de zendapertuur uit standaardwaarden in de broncode halen, en uit een interne consistentiecontrole afleiden dat een kale <c1/> in vierkante meter was. De afleiding was juist, en juist daarom deed het ertoe: niets zou hebben opgevangen dat ze onjuist was

seg-0691f3dee8cb = Beschikbaarheid van de hybride optische/RF-link aan de RF-kant

seg-72ccb655caf0 = Het hybrid-optical-rf-rapport vermeldt een beschikbaarheid van de RF-link, samengesteld uit grootheden die de engine al berekent en niet uit een geïmporteerde klimatologie, en vermeldt de samenstelling als een benoemde regel: A_rf = I_closure * I_track, waarbij I_closure het sluitingsoordeel is van het eenrichtingslinkbudget volgens CCSDS-401 / DSN-810-005 (linkbudget::link_budget, Eb/N0-marge >= { "0" }) op de eigen afstand van het scenario en I_track het oordeel over de trackinglus (jamming::lock_status) op de C/N0 die ditzelfde budget opleverde. Elke factor draagt de herkomstklasse van zijn invoer door naar de uitvoer, en de factoren die bewust NIET in het product zitten -- geometrische zichtbaarheid, interferentieontkenning en een klimatologie van RF-uitval -- worden met de reden benoemd en niet stilzwijgend op { "1" } gezet. De opgeloste RF-tak wordt als eigen blok rf_link_configuration herhaald, en de continue cijfers naast de indicator (linkmarge, C/N0-marge, de afstanden voor sluiting en tracking in gesloten vorm, en het afstandsgebruik) zijn de afstandsinversies van hetzelfde budget. Het rapport vermeldt volledig, op het blok en in de eenhedenregel waar een lezer terechtkomt, dat dit cijfer MARGE-/GEOMETRIEBEPERKT en DETERMINISTISCH is, terwijl optische beschikbaarheid DOOR WEER/KLIMATOLOGIE BEPERKT en probabilistisch is, zodat de twee nooit als een vergelijkbaar paar percentages kunnen worden aangehaald

seg-319705ea0166 = Geen externe referentie, en ExternalDataset is afgewezen. De twee invoeren zijn een Eb/N0-marge en een doorgang van een C/N0-drempel, beide functies van een MODELLED EIRP, kwaliteitsmaat en samengevoegde verliestoewijzing; er is geen gemeten beschikbaarheidsregistratie voor een hybride optische/RF-dienst Aarde–Maan om het samengestelde cijfer aan te toetsen. De controles die er zijn, zijn intern en worden als zodanig vermeld: de samenstelling wordt herberekend uit de eigen gepubliceerde marges van het rapport en niet uit de interne gegevens van de zender, en de sluitingsafstand wordt gecontroleerd door de linkvergelijking OP die afstand opnieuw uit te voeren en te eisen dat de marge verdwijnt -- een inversieheen-en-terugtest, geen onafhankelijke implementatie. De eerlijke grens van het cijfer is op het rapport zelf vastgelegd: het is een deterministische 0/1-indicator, geen kans, omdat niets in deze engine een verdeling van RF-linkuitval op deze band en geometrie meet. Die ontbrekende invoer wordt in rf_availability.factors_not_included benoemd en niet verzonnen, en die aan te leveren is wat een probabilistische RF-beschikbaarheid nodig zou hebben

seg-22c5df9b6c7c = Vergelijking van optische en RF-afstandsmeting onder gelijke voorwaarden

seg-70eb396f40af = Het hybrid-optical-rf-rapport geeft de verhouding tussen optische en RF-afstandsmeting met de ENE configuratie waarop beide takken zijn geëvalueerd in hetzelfde object: hetzelfde eenrichtingspad, dezelfde afstand en dezelfde accumulatietijd. De optische tak is de door fotonen beperkte ToA-CRLB van de engine op het fotonenaantal in één richting; de RF-tak is de thermische codevolgjitter van de DLL (early-late) van de engine bij de C/N0 die het eigen linkbudget van de engine teruggeeft voor diezelfde afstand in één richting. De luslbandbreedte voor ruis is afgeleid, niet gekozen: B_L = 1/({ "2" }*integration_s) zet de RF-tak precies op de optische accumulatietijd, en als een aanroeper deze overschrijft zodat de twee middelingstijden verschillen, wordt de verhouding REFUSED -- null, met het verschil en beide tijden benoemd -- en niet op twee werkpunten aangehaald. Er wordt geen verhouding gevormd tegen de GEKOZEN parametrische rf_position_sigma_m van het scenario, en de weigering zegt waarom: die invoer draagt helemaal geen configuratie. De vrijgegeven optische kerncijfers voor twee richtingen en de exacte factor die dit met de tak voor vergelijking in één richting verbindt worden naast de verhouding uitgegeven, zodat het rapport niet kan worden gelezen als twee tegenstrijdige optische sigma's

seg-acbb3ac98ee3 = Geen externe referentie voor de VERHOUDING, en ExternalDataset is bewust afgewezen. De onderliggende RF-keten heeft er wel een -- tests/validate_p5_rf_ranging_precision.rs controleert linkbudget::link_budget en navsignal::dll_code_jitter_chips tegenover een onafhankelijke Python/NumPy-fixture en tegenover de vastgecodeerde uitgewerkte waarde van Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m bij { "45" } dB-Hz) -- en de optische CRLB heeft een eigen rij in gesloten vorm. Een van beide ankers voor deze rij claimen zou geleende validatie zijn, wat de invarianten van de matrix moeten voorkomen: de grootheid hier is een VERHOUDING bij een configuratie met een MODELLED EIRP, kwaliteitsmaat, zendvermogen en apertuur, en er bestaat geen gemeten vergelijking van optische en RF-afstandsmeting op een gemeenschappelijk werkpunt om haar aan te toetsen. Wat intern wordt gecontroleerd is datgene waarop de verhouding werkelijk fout kan gaan: dat de twee takken op één werkpunt zitten. Dat wordt gemeten door de gemeenschappelijke accumulatietijd te schalen en te eisen dat beide takken volgens dezelfde wortelwet bewegen en de verhouding gelijk blijft, en het wordt afgedwongen door de verhouding volledig te weigeren wanneer de middelingstijden verschillen. Beide takken zijn grenzen door thermische ruis/shotruis en beide sluiten mediavertraging, klokfout en ambiguïteit uit, dus de uitsluiting is aan beide kanten gelijk; het rapport zegt dat expliciet in plaats van het af te laten leiden

seg-3f26f598e013 = Zelfbeschrijving van het linkbudgetrapport

seg-b88bf41d6d4c = Het linkbudgetrapport vermeldt elke absolute constante waaruit zijn eigen marge is berekend -- de draaggolffrequentie die voor het vrijeruimteverlies is gebruikt, de EIRP, de kwaliteitsmaat, het samengevoegde verlies en de Boltzmann-term -- plus de vereiste G/T waarbij de marge nul is, de linkconstante (EIRP - verliezen - vereiste Eb/N0) die de enige combinatie is die een gepubliceerde tabel met snelheid en versterking ooit kan vastleggen, en, wanneer een aanroeper een systeemruistemperatuur opgeeft, de versterking van de ontvangstantenne die die kwaliteitsmaat impliceert

seg-52f98f50522f = Geen externe referentie: dit is zelfbeschrijving over een vergelijking die al is getoetst aan een gepubliceerde designcontroletabel (zie de rij voor het linkbudget in één richting). Het is vastgelegd omdat het ontbreken ervan een gemeten gebrek was -- het reproduceren van het vrijgegeven d1_rate_gain_beamwidth.csv vereiste het terugrekenen van één effectieve constante tot { "0.0034" } dB uit alle dertig rijen, en de engine benoemt die combinatie nu en bewijst met een test dat geen enkele vrijgegeven tabel ooit de drie componenten had kunnen scheiden

seg-a7b192e27cb5 = Tabel van het kruispunt in maantijd per klokklasse

seg-cab605dc6ea2 = Eén run voor het maantijdbudget geeft per klokklasse een rij met het kruispunt van klok en stelsel tegenover één gedeelde stelselterm, zodat de klok de enige variabele in de vergelijking is; elke rij draagt het kruispunt op twee manieren bepaald -- door bisectie uit de algemene machtswetcurve van de tijdfout en algebraïsch geïnverteerd uit het dominante ruistype van de rij -- met het relatieve verschil ertussen

seg-ccec15f0b125 = Twee verschillende berekeningen van dezelfde grootheid binnen de codebase, niet één die wordt herhaald: bisectie op de machtswetcurve van IEEE-1139 weet niets van het ruistype, terwijl de gesloten vorm het dominante type algebraïsch inverteert, zodat een verkeerd geclassificeerd ruistype of een slechte omsluiting zich toont als een niet-klein relatief verschil. De vier waarden reproduceren ook de gepubliceerde tabel van het artikel tot op de helft van het laatste gedrukte cijfer -- maar die tabel is zelf uit dezelfde gesloten vorm gereconstrueerd, dus het is een reproduceerbaarheidscontrole en geen externe referentie, en de stelselterm waartegen wordt gemeten is een gemodelleerde toewijzing

seg-ff32b78acb8c = Gezamenlijke UT1- en poolbewegingsfout over een gemeenschappelijke rijenverzameling

seg-561e588153af = Eén tabel geeft de voorspellingsfout van UT1, de poolfout van de poolbeweging en hun kwadratische combinatie bij de Maan over een IDENTIEKE epochverzameling per horizon, en geeft de epochs waarop elke component is gemeten. Daarnaast benoemt het scenario welke EOP-invoer van kracht is en ontleedt het de telling van zijn rijen, en geeft het altijd de tabel van voorspeld tegenover definitief per horizon met een expliciete verklaring waarom die leeg is wanneer dat zo is

seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3) dat het IERS-product finals2000A leest met zijn eigen regel Bulletin B anders A, en pyerfa { "2.0.1.5" } (SOFA) volledige rotaties van hemels naar terrestrisch (c2i06a, sp00, pom00, c2tcio; de aardrotatiehoek volgens IERS { "2010" } vgl. { "5.15" } in exacte rekenkunde), als aparte programma's uitgevoerd op letterlijke rijen van het bevroren finals2000A.all van 2026-09-30; vooraf vastgelegd (455b8fb5) met amendementen A1 en A2 die alleen de numerieke precisie van de referentie vastleggen (beide bekendgemaakt bij de runs die erop volgden): elke epochlijst van tabel { "3" } gelijk, UT1- en polenstatistieken binnen { "6e-16" }, de combinatie binnen { "1.9e-7" }, 12/12 gevallen van voorspeld tegenover definitief. De combinatiecontrole kan polaire termfouten onder ongeveer { "1e-4" } relatief niet oplossen omdat UT1 haar domineert; de poolnauwkeurigheid steunt op de poolstatistiekcontrole van { "1e-9" }. De regels voor epochverzameling en terugval zijn de generator die de definities van Kshana spiegelt, en de statussen van lege tabellen zijn ontwerpgedrag zonder externe waarheid. Ordegroottes: gerealiseerde voorspellingsfouten in tabel 3a van het IERS Annual Report { "2019" }, Kshana/IERS { "1.001" } tot { "1.100" } bij { "1" } tot { "90" } dagen (drempel [{ "0.8" }, { "1.25" }], gemeten). Rijentelling: astropy (rij met offline invoer). Ronde { "1" } (behouden als regressietest): tegenover de nauwkeurigheidsformule die in { "178" } Bulletin A-uitgaven is gedrukt komt de pool binnen 1.5x overeen en UT1 niet, wat de IERS-formule toetst tegenover haar gerealiseerde fout

seg-3692f1fc89e6 = Standaardinvoer voor aardoriëntatie offline is een echt IERS-product

seg-f9a9d385fd26 = De standaard van <c1/> tijdens runtime is de eigen ingebedde kopie van de bibliotheek van een letterlijk uittreksel uit IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } opeenvolgende dagrijen, MJD 61224-61397, geknipt uit het finals2000A.all van 2026-09-30) met alle drie de rijvintages die het formaat definieert, geclassificeerd met de I/P-vlaggen van IERS (eop::row_vintage): { "30" } definitieve Bulletin B-rijen, { "54" } gemeten snelle rijen (vlag I zonder Bulletin B-blok) en { "90" } voorspellingen uit Bulletin A (vlag P). Een kale run zonder bestandsargument en zonder netwerk geeft een gevulde tabel per horizon, de telling rijen = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) en predicted_rows.n = { "90" } over MJD 61308-61397; de afkapdatum zoals uitgegeven van de vergelijkingen tussen voorspeld en definitief is de laatste gemeten rij. Het eerdere uittreksel van 32 rijen (tools/finals2000A_2026.txt, elke rij vlag I) en het fragment van vijf rijen met alleen definitieve gegevens blijven meegeleverd en in gebruik: daarop is predicted_rows.n gelijk aan { "0" }, een eigenschap van het invoerbestand en geen uitkomst van de parser

seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), dat dezelfde bytes leest met zijn eigen lezer, en de tabel van IERS Bulletin A Vol. XXXIX nr. { "039" }, getal voor getal overgenomen; vooraf vastgelegd (6fdae01b) met zes exacte criteria voordat astropy werd uitgevoerd. Alle zes gelden: { "30" } definitieve, { "54" } snelle en { "90" } voorspelde rijen met gelijke MJD-lijsten, elke voorspelde rij met vlag P, de telling van de standaardrun gelijk, en de voorspellingen gelijk aan Bulletin A binnen het laatste gedrukte cijfer. Bekendgemaakt: de uitsnede is gekozen met een gewone kolomsnede van de vlaggen en het Bulletin B-blok, die 30/54/90 liet zien, vóór de commit; het uittreksel is een letterlijke snede die deze repository uit een IERS-product heeft geknipt (SHA-256 in de fixture-NOTICE). De getoetste bewering is de classificatie van de vintage en de telling van de meegeleverde standaardinvoer en haar voorspelde rijen; willekeurige gebruikersinvoer wordt met dezelfde vlagregel geclassificeerd maar maakt geen deel uit van de vergelijking. Ronde { "1" } van { "0.30" } (vervangen): de eerdere standaard noemde { "12" } rijen met vlag I voorspellingen uit Bulletin A; de engine classificeert nu op vlag. REVISIES: de cellen van de standaardrun die zijn verschoven staan van oud naar nieuw in docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, de poolvloer { "0.06776" } -> { "0.05550" } mas, de term voor aardoriëntatie { "14.01601" } -> { "14.01583" } m, het totaal { "20.09759" } -> { "20.09746" } m en { "67.03834" } -> { "67.03790" } ns, de rijen van tabel { "2" } van tests/golden/realtime-frame-eop.csv, en de overeenstemmingscijfers van de operationele voorspeller); eerdere in docs/revisions/G12-default-eop-cell-changes.md

seg-18c72a7565d6 = Opnamefootprint tegenover hoogte en bundelbreedte

seg-9c30a0ab5233 = Tweeassige sweep van de patroongewogen, door hoogte begrensde footprint van de oppervlakteopname over zendhoogte en schotelafmeting, per werkpunt één rij uitgegeven met de halfvermogensbundelbreedte die elke diameter impliceert, en de opname aan de limb gerapporteerd als een DREMPEL -- per rij de J/S aan de limb, de marge ervan en het zendvermogen dat haar zou sluiten; per raster de gevonden doorgangen, of een expliciete verklaring dat de limb nergens op het raster wordt bereikt, met het tekort

seg-4d866b62d4f7 = Verzamelingsinsluiting: de verhouding van storer tot signaal komt als een uniforme decibelverschuiving binnen, dus de opgenomen verzameling bij een hoger zendvermogen bevat de verzameling bij een lager en de fractie kan alleen stijgen -- een eigenschap die het Airy-patroon NIET geeft in bundelbreedte of hoogte, waar het opgenomen gebied in ringen uiteenvalt en de fractie werkelijk niet-monotoon is. Geen enkele gepubliceerde tabel geeft de opgenomen schijffractie van een maanomloopzender tegenover hoogte en bundelbreedte, dus er is niets externs om deze cellen aan te toetsen; het onderliggende patroon is afzonderlijk getoetst aan gepubliceerde Bessel-waarden en heeft een eigen rij

seg-fc0a64b9a280 = Reproduceerbaarheid van het tijdfoutenbudget voor de maan

seg-5d5970506b9c = Het scenario voor het maantijdbudget publiceert zijn reeksuitvoer als een tabel in lange vorm (rasterindex, middelingstijd, term) naast het rapport, zodat de zeven curven x(tau) per term en het totaal als wortel uit de kwadratensom engine-uitvoer zijn en niet iets wat een lezer uit de methodesectie opnieuw opbouwt

seg-62df6258bc62 = Alleen zelfconsistentie: het gepubliceerde totaal wordt gecontroleerd tegen de wortel uit de kwadratensom van de termen in hetzelfde bestand, en de uitgegeven curve reproduceert het vrijgegeven p3_time_budget_curve.csv over alle { "57" } punten. Beide controles delen de eigen termdefinities van deze engine, dus geen van beide is onafhankelijk. De klokterm steunt op gepubliceerde klokspecificaties, maar de GROOTTES van de vloeren voor link, stelsel, relativistische effecten en efemeride zijn gedocumenteerde budgettoewijzingen zonder externe referentie

seg-675887733454 = Laboratorium voor maanstationstijd: holdover van miniRAFS tegenover LTC

seg-7dfedc40da6a = Het optionele blok [time_lab] van het scenario voor het maantijdbudget modelleert een referentieklok van een maanstation (standaard de klasse miniRAFS, of een andere benoemde klasse, of een apparaatkaart gefit op opgegeven stabiliteitspunten) die op Coordinated Lunar Time wordt gestuurd en daarna vrij loopt of elke N seconden opnieuw wordt gestuurd: de tijdfoutcurve x(t) als wortel uit de kwadratensom van de machtswetterm van de klok, een constant stuurresidu (ILLUSTRATIVE), een constant residu van de LTC-realisatie en een optionele term voor de snelheid door de stationshoogte; de tijd na een sturing tot { "1" }, { "10" } en { "100" } ns (of opgegeven drempels) door bisectie naast de inverse in gesloten vorm voor het dominante ruistype, en de dominante term bij elke opgegeven horizon, alles met eenheden

seg-3801e9b32309 = Alleen interne consistentie: de met bisectie bepaalde tijd tot de drempel wordt gecontroleerd tegen de inverse in gesloten vorm van het dominante ruistype van de klok, en de vrij lopende klokterm tegen de eigen klokterm van het budget. De klokklassen steunen op gepubliceerde specificaties voor één dag (hun eigen rijen); de LTC-snelheid wordt hier niet opnieuw afgeleid en houdt haar eigen VALIDATED-rij (Maancoördinatentijd); het stuurresidu is ILLUSTRATIVE, het realisatieresidu is een budgettoewijzing en er is geen thermisch model opgenomen. Het doel op nanosecondeniveau uit het materiaal van ICG WG-B Lunar PNT van juni { "2024" } wordt geciteerd als bronuitspraak en niet als bewering overgenomen; niets hier is een uitspraak over een echte stationsklok

seg-af3ff120b707 = Geodetische VLBI op de Maan

seg-cfd7d0126028 = Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt + partiële afgeleiden

seg-d1943f9932af = Vlakkegolf-delta_dor (zelfde codebase) in de limiet van het verre veld; partiële afgeleiden met eindige differenties. Externe vergelijking { "0.30" }, een bevinding (blijft MODELLED): tegenover geconvergeerde lichttijden van ANISE { "0.10" } via DE440 ({ "75" } vertragingen op 2024-01-01 over drie DSN-basislijnen, gegenereerd door xval/anise-lunar-od zonder Kshana-code) valt geen enkele vertraging binnen de tolerantie van { "1" } ps. Het grootste verschil is { "24" } µs, door het analytische maanmiddelpunt (ongeveer { "200" } km van DE440), de ene momentane geometrie zonder lichttijditeratie ({ "3.6" } µs) en de weggelaten poolbeweging; partiële afgeleiden van het baken wijken tot { "2.9e-3" } relatief af tegenover { "1e-6" }. De bewering in de moduledocumentatie dat de benaderingen van het stelsel onder de modelnauwkeurigheid liggen, geldt op dit niveau niet. Ronde { "2" } van { "0.30" }: het kernelpad (lunar_vlbi::KernelGeometry) is getoetst aan lichttijden van NAIF SPICE in zijn eigen rij, Geodetische VLBI op de Maan, kernelpad; de ANISE-vergelijking van dat pad (75/75 binnen { "1" } ps, slechtste { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) is alleen een kruiscontrole van de kernelevaluatie, omdat de lichttijdoplossing in dat testraamwerk van dit project zelf is. Deze rij (het analytische standaardpad) blijft MODELLED met de bevinding hierboven

seg-d12d4565b01d = Geodetische VLBI op de Maan, kernelpad

seg-11e1c942e41c = Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt, met partiële afgeleiden voor baken en station, op het kernelpad (lunar_vlbi::KernelGeometry): DE440-Aarde en -Maan, DE440-hoofdassen van de Maan, ITRF93-aardoriëntatie met UT1 en poolbeweging, elke lichttijd geconvergeerd in het barycentrische stelsel, partiële afgeleiden met de lichttijdfactor 1/(c - u.V). Uitvoerbaar als het scenario <c1/> met planetary_kernel_path, earth_orientation_kernel_path en moon_orientation_kernel_path ingesteld; de getoetste uitvoer is de reeks geometric_delay_s van het kernelpad en epoch_partials. Op het kernelpad telt delay_s de analytische gedifferentieerde Shapiro-term erbij, die niet wordt vergeleken, en delay_rate en near_field_correction_us worden niet vergeleken

seg-c7f6842b6019 = Geconvergeerde Newtoniaanse lichttijden van NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) (spkcpt/spkcpo, CN) van een baken vast in MOON_PA_DE440 naar de DSN-stations DSS-14, DSS-43 en DSS-63 uit het NAIF-stationskernel earthstns_itrf93_260814.bsp, met de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec en naif0012; partiële afgeleiden zijn vijfpunts centrale differenties van SPICE-lichttijden, niet de formule 1/(c - u.V) van Kshana. Vooraf vastgelegd (a689c797, epochs van { "2024" }) met drempels van { "1" } ps op elke vertraging en { "1e-6" } relatief op elke partiële afgeleide. Die eerste run faalde (17/75 vertragingen binnen { "1" } ps, slechtste { "1.03e-11" } s): SPICE draagt ET als één double, waarvan de stap bij { "2024" } het emissie-epoch tot { "6e-8" } s afrondt, ongeveer { "6" } ps lichttijd, en het residu komt met dat afronden overeen bij een correlatie van { "0.99999" } (vastgezet; de beoordelaar heeft het onafhankelijk gereproduceerd). Amendement 66e365d4, geschreven na dat resultaat en vóórdat de bijbehorende fixture bestond, verplaatste dezelfde referentie en drempels naar { "25" } uurlijkse epochs bij J2000, waar de ET-stap hoogstens { "1.5e-11" } s is: 75/75 vertragingen binnen { "1" } ps (slechtste { "6.2e-14" } s), 75/75 partiële afgeleiden van het baken (slechtste { "7.4e-9" }), 150/150 partiële afgeleiden van het station (slechtste { "3.8e-11" }). Buiten de bewering: het analytische standaardpad (reeks-Maan en gemiddeld maanstelsel, { "24" } µs van ANISE via DE440, de rij Geodetische VLBI op de Maan), de gedifferentieerde Shapiro-term die het scenario analytisch toevoegt, media, en de schaal van barycentrisch naar geocentrisch

seg-1f10810131be = NAIF-kernelreader: DAF-container, SPK-type { "2" } en binaire PCK-type { "2" }

seg-7da4847e7a28 = De eigen pure-Rust-lezer van de engine voor binaire NAIF-kernels (naif_kernel): de DAF-container (beide byte-volgordes, gekoppelde samenvattingsrecords), SPK-type-2-Chebyshev-positiesegmenten die via hun middelpunten tot een laagste gemeenschappelijke voorouder worden geketend, en binaire PCK-type-2-Eulerhoeksegmenten omgezet in een rotatie van J2000 naar lichaam, met epochs als tweedelige ET zodat een offset van minder dan een microseconde zijn precisie behoudt. Hij is wat KernelEphemeris (ephem_provider) en de kernelpaden van lunar_vlbi, lunar_llr en lunar_vlbi_fim gebruiken om DE440 te lezen. De bewering is dat hij JPL-kernels correct leest; het is niet de bewering dat DE440, of de analytische Zon- en Maanreeksen van de engine, nauwkeurig is

seg-09773b73d785 = Twee onafhankelijke kernellezers op dezelfde NAIF-bestanden: NAIF SPICE Toolkit N0067 (CSPICE via spiceypy { "8.2.0" }, MIT; spkezr en pxform) en ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate en Almanac.rotate), beide als aparte programma's uitgevoerd op de440s.bsp en moon_pa_de440_200625.bpc. Vooraf vastgelegd (abcd9133) voordat enige fixture of referentiewaarde bestond: de rasterseed zijn de eerste { "16" } hexadecimale cijfers van de hash van die commit, zodat noch de { "200" } epochs noch de lichaamsparen konden worden gekozen met het resultaat in zicht; elk epoch draagt ook de Maan en de Zon ten opzichte van de Aarde. Drempels vooraf vastgesteld uit Chebyshev-evaluatie met dubbele precisie (hoogstens { "15" } coëfficiënten, n^{ "2" } u = { "2.5e-14" } per evaluatie, twee evaluaties en hoogstens twee sprongen per kant): positie { "1e-13" } R + { "1e-5" } m, snelheid { "1e-13" } V + { "1e-10" } m/s, R en V de grotere grootte ten opzichte van de laagste gemeenschappelijke voorouder; rotatie-element { "1e-13" } W + { "1e-15" }, W de coëfficiëntensom van het dekkende record; ANISE voegt { "2" } ns relatieve beweging toe voor zijn nanoseconde-epochs. Resultaat: elk van { "600" } toestanden en { "200" } rotaties binnen zijn drempel tegen beide referenties, op de uitsnede en op de volledige kernels; slechtste { "6.0e-3" } van de drempel (positie), { "5.9e-3" } (snelheid), { "3.7e-3" } (rotatie). Mutatie: elk record evalueren bij -s laat { "3597" } vergelijkingen falen. Bekendgemaakt: een eerdere controle met 25 epochs tegen SPICE ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) is vóór deze rij gezien en is niet haar bewijs; de eerste run van de fixturegenerator brak af op een leeg rasterinterval voordat enige waarde werd geproduceerd en is gecorrigeerd. Beide kanten lezen DE440, dus overeenstemming toetst de lezer, niet de efemeride

seg-e08e98908f3a = Aarde-GNSS op maanafstand

seg-dd8ce373d1f6 = Ontvangst van Aarde-GNSS op maanafstand: de zwaksignaallaag die tabel { "1" } van P7 noemt en waarvoor de engine geen model had. Per satelliet en per epoch berekent hij de hoek buiten de boresight ten opzichte van het nadir van de zender, of de Aarde het rechte pad occulteert, de schuine afstand en het vrijeruimteverlies ervan, de zendversterking bij die hoek, het ontvangen vermogen en de draaggolf-ruisdichtheid; vervolgens aggregeert hij alleen de links die een trackingdrempel halen, en doorloopt hij een volledige omloop van de constellatie zodat het antwoord een VERDELING is en geen enkele momentopname. Drie feiten sturen het resultaat en het rapport vermeldt elk ervan: de Aarde beslaat { "13.90" } deg vanaf de constellatiestraal, zodat de PIEK van de bundel geometrisch niet beschikbaar is voor elke naar de Maan gerichte straal; wat overblijft is de rand van de hoofdlob en de zijlobben, het regime waarin LuGRE in { "2025" } bij de Maan werkte; en het L1-padverlies is ongeveer { "208" } dB, zo'n { "25" } dB meer dan een aardse gebruiker betaalt. MEASURED op de meegeleverde geometrie van 24 satellieten van GPS-klasse over { "64" } epochs van één omlooptijd: beschikbaarheid van het SIGNAAL { "0.375" } met een beste link van { "30.93" } dB-Hz, en beschikbaarheid van de POSITIEBEPALING { "0.000" } - hoogstens twee gelijktijdig volgbare links, nooit de vier die een positie nodig heeft. De scheiding van die twee beschikbaarheden is het punt, en het rapport laat niet toe dat ze door elkaar worden gehaald: Aarde-GNSS op maanafstand is een laag van TIJDSYNCHRONISATIE-niveau, niet van positieniveau, en een voorafgaande kans voor gelaagde veerkracht moet de beschikbaarheid van de positiebepaling nemen. De conditionering wordt om dezelfde reden uitgegeven - elke zichtbare satelliet ligt binnen een kegel van enkele graden breed gezien vanaf de Maan, dus de zichtlijnen zijn van nature bijna evenwijdig. Uitvoerbaar als de soort <c1/> Herformuleerd volgens D7: de bewering op maanafstand is de RELATIEVE draaggolf-ruisdichtheid tussen satellieten op één epoch, uit gemeten tweedimensionale zendpatronen (NAVCEN Block IIR/IIR-M), plus geometrische zichtbaarheid; absolute C/N0 wordt niet beweerd (Parker et al. melden een gemeenschappelijk verlies van { "7" } tot { "12" } dB).

seg-bed2679f88e5 = Identiteiten in gesloten vorm en interne consistentie; er wordt GEEN externe referentie beweerd. De halve limbhoek wordt gecontroleerd tegen asin(R_earth/r_orbit) en de geometrie daartegen; het vrijeruimteverlies, de DOP-kern en de SGP4-propagatie die dit samenstelt zijn elk extern getoetst in hun eigen rijen en deze rij leent hun status niet. WAAROM MODELLED, en het is het zendpatroon: de versterking bij hoek is een uniform verlichte cirkelvormige apertuur, het Airy-patroon, terwijl een echte GPS-L1-antenne een spiraalvormige array met twaalf elementen is met een gevormde hoofdlob die buiten de boresight piekt om het vermogen over de aardschijf gelijk te trekken, en met zijlobben die niet Airy zijn. Gepubliceerde gemeten patronen bestaan en worden hier niet meegeleverd, dus rangordes en ordegroottes gelden, terwijl de dB van een afzonderlijke satelliet dat niet doet. EEN EERSTE IMPLEMENTATIE VAN DEZE RIJ WAS FOUT OP EEN MANIER DIE HET VASTLEGGEN WAARD IS: de Airy-uitdrukking geldt alleen in de voorwaartse halve ruimte, haar argument gaat als sin(theta), en bij theta in de buurt van { "180" } deg slaat ze om en geeft ze de VOLLEDIGE BORESIGHT-VERSTERKING achter de apertuur - dus de twee sterkste links in het eerste rapport waren satellieten die hun antenne van de Maan af richtten, en zij waren de enige twee die de drempel haalden. Achter de apertuur past het model nu een vlakke vloer voor de achterlob toe, vermeld als een grens en niet als een verzonnen patroonvorm. Bewust afwezig, elk met als effect dat het budget OPTIMISTISCH is: geen ionosferisch of troposferisch verlies op de limbstrijkende stralen, geen polarisatie-, richt- of implementatieverlies, en een bolvormige Aarde zonder refractieve uitbreiding. De positie van de Maan is een INVOER, geen opzoeking in een efemeride, omdat de grootheid die wordt getest de link en de bundelgeometrie is. Deze rij verheffen tot getoetst vereist een gemeten zendpatroon en LuGRE-normaalpunten om aan te toetsen; geen van beide staat in de repository en geen van beide is hier verzonnen. Ronde { "2" } van { "0.30" }, een bevinding (blijft MODELLED): een linkpad met gemeten invoer (echte SP3-posities, zendvermogen per blok, getabelleerde zend- en ontvangstpatronen, hysterese bij acquisitie en tracking) is gecontroleerd tegen tabel { "3" } van Montenbruck et al. { "2023" } voor GENESIS op { "6000" } km (vooraf vastgelegd 5b414f0a): gemiddelden voor de zenitantenne komen bij { "5" } van { "6" } binnen een dB van de gevoeligheid in het artikel overeen; gemiddelden voor de nadirantenne liggen { "1.0" } tot { "2.4" } satellieten hoger dan gedrukt, waarschijnlijk omdat het artikel azimutafhankelijke GPS-zijlobpatronen gebruikte die niet zijn gepubliceerd. De cijfers op maanafstand van deze rij gebruiken nog steeds de Airy-vervanger. { "0.30" }+ D7, een bevinding (blijft MODELLED): de herformuleerde grootheid, het C/N0-VERSCHIL tussen op één epoch gevolgde Block IIR/IIR-M-satellieten, voorspeld met de gemeten L1-patronen per SVN van NAVCEN (tweedimensionaal, yaw-stuurstelsel) tegen de vlucht-C/N0 van LuGRE (vooraf vastgelegd 768cb62b: { "99" } % zichtbaar, RMS van paren <= { "3.0" } dB, mediaan <= { "2.0" } dB, minstens { "50" } records en { "30" } paren) heeft te weinig gegevens: de { "26" } kwalificerende transit- en maanomloopepochs bevatten { "15" } gevolgde IIR/IIR-M-records (meestal worden IIF en III gevolgd) en één paar. Alle { "15" } worden voorspeld zichtbaar en het residu van het ene paar is -0.06 dB; er wordt niets beweerd

seg-29df5b40a3f9 = Baanbepaling bij de Maan: Aarde-GNSS tegenover radiometrie vanaf de grond

seg-647902ebcee3 = Baanbepaling in een bijna-rechtlijnige halobaan (of een elliptische bevroren baan) uit twee onafhankelijke datatypen: aan boord ontvangen Aarde-GNSS-pseudoranges (de linkregel van de rij Aarde-GNSS op maanafstand, plus occultatie door de Maan) en tweewegs-afstand en -afstandssnelheid vanaf de grond van drie stations van het Deep Space Network. Elk is een batch-kleinste-kwadraten in één stap rond de referentiebaan met zijn formele covariantie; een geseede Monte-Carlo van het verschil tussen de twee schattingen toetst of de twee covarianties het verklaren (q = d' (P_G + P_R)^-1 d, chi-kwadraat met zes vrijheidsgraden wanneer de modellen overeenkomen) en wat een ongemodelleerde versnelling met de statistiek doet.

seg-226dedaba243 = Een onafhankelijk scipy/numpy-programma integreert dezelfde variatievergelijkingen (drempel O1). Er wordt niets vergeleken met een meting van een maanbaan. De referentie controleert de numeriek van opgegeven formules, niet de natuurkunde, dus de rij blijft MODELLED. Beperkt drielichamenmodel: geen Zon, geen maanharmonischen, de rotatieas van de Aarde langs de baannormaal, ILLUSTRATIVE invoer voor ontvanger en station.

seg-652bdc29deea = Ambiguïteitsoplossing van de draaggolffase bij de Maan: oppervlak en orbiter

seg-02496f9e9af2 = Tussen ontvangers enkelvoudig gedifferentieerde Aarde-GNSS-draaggolffase en -code bij een maanoppervlaktestation en een orbiter, met het klokverschil per epoch weggeprofileerd, één ambiguïteit per ononderbroken passage en de langste passage als ijk. De covariantie van de float-ambiguïteit is een Schur-complement; LAMBDA lost de gehele getallen op, de bootstrapped-slagingskans wordt naast een geseede Monte-Carlo-slagingskans voor geheeltallige kleinste kwadraten en de float- en vaste positiesigma's gerapporteerd. Gerapporteerd zoals gevonden: bij de geregistreerde { "12" } dBi is het dubbelverschilprobleem niet te vormen (amendement { "1" } verplaatste de standaard naar { "25" } dBi nadat alleen beschikbaarheidstellingen waren gezien), en bij { "25" } dBi wordt geheeltallig vastleggen NIET bereikt - buiten bereik (hoogstens enkele procenten) hoewel de float-oplossing met de boog verbetert.

seg-8d8296752eb8 = Een onafhankelijke numpy-oplossing van dezelfde normaalvergelijkingen uit de geëxporteerde rijen (Q3) en een brute-force-opsomming van gehele getallen (Q4). Er wordt geen GNSS- of maandraaggolffasemeting mee vergeleken. MODELLED.

seg-11dd1bb8e4e1 = Co-schatting van het maanstelsel: oppervlaktestations en orbiters

seg-a38c8d95e6c9 = Fisher-informatie van het maanstelselsdatum met zeven parameters uit laserafstandsmeting van Aardestations naar alleen de vijf reflectoren en met toegevoegde afstanden van orbiter naar oppervlaktestation: de informatiematrix, de rang, Cramér-Rao-sigma's, de ontaardingsmaat van de identificeerbaarheidsmodule van de Maan en geseede willekeurige stationsverzamelingen. De baan wordt bekend verondersteld in de maanassen (de fout ervan wordt gedragen door de afstandssigma van de orbiter).

seg-47d2afc53b3d = Een onafhankelijke numpy-eindige-differentie van het voorwaartse model (F2). Er wordt niets vergeleken met echte oplossingen voor het maanstelsel. De factor is voorwaardelijk aan de aangenomen bekende baan en de afstandssigma van { "1" } m. MODELLED.

seg-862977c4bb01 = Precisie van de stelselkoppeling in de ruimte: samengeplaatste GNSS, VLBI en laserafstandsmeting

seg-a9ae8e99f00d = Cramér-Rao-precisie van de translatie-, schaal- en rotatieverschillen tussen technieken tussen GNSS-, VLBI- en laserafstandsstelsels wanneer één ruimtevaartuig alle drie draagt, met de positie van het ruimtevaartuig op elk epoch geëlimineerd en negen storingsparameters voor de lokale koppeling met een prior, gevarieerd over de nauwkeurigheid van de lokale koppeling. Covarianties via de vierkantswortelroute (normaalvergelijkingen verliezen de cijfers wanneer de technieken bijna perfect zijn).

seg-b37ac7294112 = Een onafhankelijk numpy-gestapeld stelsel met de positieonbekenden geëlimineerd via expliciete Schur-complementen (T3). Er worden geen GRASP-, Genesis- of andere missiegegevens mee vergeleken. MODELLED.

seg-ae627996875e = Gevoeligheid voor Love-getallen en libratie van de Maan

seg-28780d07c4a7 = Fisher-informatie van h2, k2, l2 en de fysieke libratieamplituden uit laserafstandsmeting (radiale en horizontale getijverplaatsing, rotatie van reflectoren), orbitertracking (de k2-versnelling van graad 2 geïntegreerd langs de zichtlijn, trend verwijderd), een oppervlaktegravimeter (gravimetrische factor { "1" } + h2 - { "1.5" } k2) en een oppervlakteklok (fractionele snelheid ({ "1" } + k2 - h2) W2/c2, gekoppeld aan de maantijdconstanten). Nominale waarden van h2 en l2 zijn linearisatiepunten; het onderzoek zegt waarvoor wat gevoelig is, niet wat de getallen zijn.

seg-180d74388339 = Een onafhankelijke numpy-assemblage met eindige differenties (G2) en evaluatie in gesloten vorm (G4). De k2-gevoeligheid van de orbiterfamilie is een cijfer voor de bovenkant (de baantoestand absorbeert hier alleen een constante en een trend). Er wordt geen maangetijde- of libratiemeting mee vergeleken; k2 wordt als nominale waarde overgenomen van Lemoine et al. { "2014" }. MODELLED.

seg-da712b740519 = Verbetering van de DOP met bakens op het maanoppervlak

seg-83e6341e01b1 = Door bakens verbeterde dilution of precision voor een gebruiker op het maanoppervlak: de zichtlijnrijen van zichtbare satellieten en de afstandsrijen van zichtbare oppervlaktebakens worden samengevoegd tot één ontwerpmatrix en geëvalueerd via de gedeelde DOP-kern, en de resulterende DOP wordt afgebeeld op een gerealiseerde nauwkeurigheid van 1 sigma IN METERS via een gebruikersequivalente afstandsfout per baken, samengesteld als de wortel uit de kwadratensom van termen voor kloksynchronisatie, multipad en opmeting. De zichtbaarheid van bakens is de geometrische horizon met twee hoogten op de luchtloze Maan, die geen refractieve uitbreiding heeft en daarom exact is in plaats van bij benadering. Uitvoerbaar als de scenariosoort <c1/>, die satellieten alleen, satellieten plus bakens en een grotere constellatie als concurrerende route naar dezelfde geometrie rapporteert. MEASURED op de meegeleverde gouden geometrie (gebruiker op -80 deg, drie opgemeten bakens, illustratieve LCNS met zes satellieten bij t={ "0" }, masker van { "5" } deg): { "5" } zichtbare satellieten geven PDOP { "9.6941" } en een 3D-1-sigma van { "11.222" } m; het toevoegen van de bakens die de horizon werkelijk halen geeft PDOP { "4.1160" } en { "4.765" } m, een factor { "2.355" }; de dienst met 24 satellieten geeft in plaats daarvan PDOP { "2.4226" } en { "2.804" } m, een factor { "4.002" }. Het rapport drukt het aantal ZICHTBARE bakens af en niet het ingestelde aantal, en op deze geometrie haalt slechts ÉÉN van de drie bakens de horizon: de twee flankerende locaties liggen ongeveer { "333" } km van de gebruiker tegenover een horizon van { "86" } km voor een antenne van { "2" } m, zodat een lezer nooit hoeft aan te nemen dat alle drie hebben bijgedragen

seg-179fb996fc72 = De DOP-rekenkunde is de kern crate::orbit::dop, afzonderlijk extern getoetst tegen gnss_lib_py in tests/dop_reference.rs; deze rij leent de status van die rij niet opnieuw. De horizon van de zichtbaarheid van bakens is de gesloten vorm L01, en sigma = DOP x sigma_URE is de standaard GNSS-relatie (Kaplan en Hegarty, Understanding GPS/GNSS, sectie { "7" }). Binnen deze rij wordt de verbetering zelf gecontroleerd tegen een onafhankelijk DOP-pad in de repository en vastgezet aan een vastgelegde golden. WAAROM MODELLED: het constellatieontwerp, de plaatsing van de bakens, de antennehoogten en alle drie de groottes van het foutenbudget zijn illustratieve invoer en geen in gebruik zijnde opmeting of gemeten link, dus de gerapporteerde meters zijn een eigenschap van een gekozen scenario en niet van een ingezette dienst. OPMERKING OVER HERKOMST: deze mogelijkheid werd in de README aangekondigd en door twee validatietests beproefd, maar had GEEN matrixrij en geen scenariosoort, dus ze was vanuit een run helemaal niet te bereiken. Ze werd in proza beweerd, ontbrak in het register en was in de engine onbereikbaar, alles tegelijk. De rij en de soort zijn samen toegevoegd. Ronde { "2" } van { "0.30" } (vooraf vastgelegd db0eb9ec), geblokkeerd (blijft MODELLED): zichtbaarheid met ANISE { "0.10.6" } en een numpy-DOP op de rijgeometrie komen overeen (zichtbare verzamelingen exact, inclusief { "72" } gevallen vlak bij de horizon en { "48" } vlak bij het masker; DOP binnen { "7.2e-13" }), maar de gerapporteerde meters zijn DOP maal een illustratieve wortel uit de kwadratensom van de afstandsfout van { "1.158" } m zonder referentie; de afbakening die ze zou uitsluiten wacht op een besluit van de eigenaar

seg-b0b618abf402 = Blindheid van de integriteit voor gemeenschappelijke modi

seg-e732ac99a9ae = Exacte splitsing in de pariteitsdeelruimte van een meetfout in het deel dat RAIM niet kan zien en het deel dat het wel kan. Voor het gelineariseerde momentopnamemodel y = G·x + e ontbindt elke fout dy eenduidig in een BLINDE component in range(G) — geabsorbeerd als toestandsfout S·dy en geannuleerd door de residuprojector Pperp = I − G·S, dus onzichtbaar voor ELKE residutest, niet slechts voor een bepaalde drempel — en een DETECTEERBARE component in de pariteitsruimte. De module geeft de projector, de splitsing en de blinde fractie terug, zodat een aanroeper kan kwantificeren hoeveel van een specifieke fout een momentopnamemonitor structureel niet kan melden. Toegepast op de echte vloer tussen efemeriden: het verschil van een meter tussen DE440 en INPOP21a en tussen DE440 en EPM2021 in de geocentrische positie van de Maan wordt bijna volledig geabsorbeerd als fout in de gebruikerspositie (mediane blinde fractie { "1.000000" }; mediane blinde positiefout { "2.3955" } m en { "2.0050" } m) tegenover een pariteitsresidu op het niveau van { "1e-15" } m

seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) berekent de splitsing met kleinste kwadraten opnieuw op vastgelegde invoer mét een echt pariteitsdeel (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), seed { "20261001" }) op de geometrie met 8 satellieten en een deelverzameling van 6 satellieten, { "1464" } gevallen over beide echte efemeridenparen, vooraf vastgelegd (f672a314): blind_dx, residual, blind_norm en detectable_norm binnen { "1e-12" } relatief ten opzichte van |dy| en blind_fraction binnen { "1e-12" } absoluut (slechtste blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy bouwt G zelf op uit de vastgelegde posities, terwijl de engine normaalvergelijkingen met Gauss-Jordan gebruikt; een scheve linkerinverse maakt de test rood bij { "5.5e-2" } |dy|. Amendement { "1" } (86c53301, na een eerste run, bekendgemaakt) versoepelde alleen een invoervoorwaarde op de pariteitsfractie (elk geval minstens { "1e-3" } en { "95" } % van elke geometrie minstens { "0.05" }), niet de overeenstemmingsdrempel. Getoetste bewering, zoals P2 toestaat: de lineaire algebra van de splitsing op die invoer; de groottes van de vloer tussen efemeriden en de illustratieve maangeometrie ({ "8" } LCNS-achtige knooppunten op { "5000" } km) zijn invoer, niet getoetst, en de blindheid is een bekende eigenschap van alle momentopname-RAIM. De numpy-vergelijking van ronde 1 (tests/lunar_common_mode_integrity_reference.rs) controleerde alleen de identiteit S·G = I omdat haar invoer in range(G) lag; ze wordt als regressietest bewaard. Herkomst van de efemeriden: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

seg-845e9f5eec81 = Beschermingsniveau voor gemeenschappelijke modi en totale integriteitsomhullende

seg-2246ffa73869 = cmpl_horizontal begrenst de horizontale positiefout van k-sigma die door de blinde klasse van gemeenschappelijke modi wordt bijgedragen, door blind_position_covariance = S*Cov*S^T te vormen en die in ENU te projecteren; integrity_envelope geeft hpl_total = hpl_araim + cmpl. Het onderscheid waarvoor het paar bestaat: de RESIDU-test van RAIM/ARAIM is aantoonbaar blind voor fouten in range(G), maar het BESCHERMINGSNIVEAU van ARAIM is dat niet - de term zonder fouten begrenst ze al tot een URA van de aanbieder plus nominale bias. De CMPL is dus alleen het OVERSCHOT tussen aanbieders dat de URA/ISM per aanbieder van één aanbieder niet afdekt, en de som is een conservatieve grens met de driehoeksongelijkheid en geen RSS, alleen geldig waar dat overschot nog niet binnen de URA valt.

seg-ffc59a7ed497 = Analytische projectoralgebra tegen zichzelf gecontroleerd: een covariantie beperkt tot range(G) moet een positieve CMPL geven, een covariantie beperkt tot de pariteitsruimte moet ongeveer nul geven, en de omhullende moet twee in de meetruimte orthogonale bijdragen optellen. De covariantie van gemeenschappelijke modi, de constellatiegeometrie en k zijn representatieve gemodelleerde invoer, GEEN gecertificeerd budget, en er wordt niet beweerd dat de driehoeksgrens scherp is. OPMERKING OVER HERKOMST: cmpl_horizontal, blind_position_covariance en integrity_envelope zijn publiek en meegeleverd, en hun unittests werden al aangehaald door de rij over blindheid voor gemeenschappelijke modi, maar de BEWERING OVER DE OMHULLENDE zelf had geen rij - dus de ene kanttekening die haar eerlijk houdt, namelijk dat de som een driehoeksgrens is en geen RSS, stond nergens in het register. De rij legt de bewering en de kanttekening samen vast.

seg-5ed34a5b402e = Gezamenlijke multitechniek-OD + klok voor de Maan

seg-5ace1caff5a9 = Batchfusie van VLBI + lokale afstand op de Maan + afstand tussen satellieten om posities en klokken van stations en constellatie te herstellen

seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq met LAPACK gelsd, numpy.linalg.inv; BSD-3) berekent elke Gauss-Newton-stap, de geconvergeerde gewogen-kleinste-kwadratenoplossing, de formele sigma's en de stationsfout opnieuw op de vastgelegde Jacobianen en waarnemingen van zes gesimuleerde netwerken, vooraf vastgelegd (5094bc31) bij max({ "1e-8" }, { "100" } kappa eps) relatief. De eerste run faalde op het netwerk zonder VLBI ({ "6.1e-7" } tegen { "1e-8" }, een inverse van de normaalvergelijkingen bij conditie { "1.4e5" }); de enginecorrectie die na dat resultaat is geschreven (batch_ls::gauss_newton_qr, een Householder-QR-stap die door estimate en formal_covariance wordt gebruikt) is opnieuw uitgevoerd bij de ongewijzigde drempel: stappen { "1.1e-14" } tot { "2.4e-11" }, sigma's hoogstens { "1.3e-11" }. De getoetste bewering is de lineaire algebra van de fusieoplossing op die invoer, niet de fysieke groottes van het gesimuleerde netwerk of zijn waarnemingsmodellen: de rij voor de geodetische VLBI-vertraging op de Maan blijft MODELLED (haar analytische pad wijkt tot { "24" } µs van ANISE af), en de stelsels hebben hun eigen rijen. Herstel van een ingebrachte gesimuleerde waarheid en NEES-consistentie blijven interne controles; de eerdere kruiscontrole met Orekit { "12.2" } / Hipparchus Levenberg-Marquardt (tests/lunar_joint_multi_technique_od_reference.rs) oefent batch_ls::gauss_newton uit, dat estimate niet meer aanroept, en blijft behouden als controle van dat primitief. Herziening { "0.30" }: de standaardstationsfouten van lunar-joint-od-clock { "3.541344" } -> { "3.541350" } m met VLBI en { "2183.119" } -> { "2183.558" } m zonder (QR-oplossing). Herziening { "0.36" } (STUDIO-15, draagbare wiskunde; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m met VLBI en { "2183.558" } -> { "2184.021" } m zonder, en de oplossing zonder VLBI stopt na { "5" } iteraties, niet { "2" } (een door afronding beperkte stop op het slecht geconditioneerde netwerk); de vooraf vastgelegde vergelijking is opnieuw uitgevoerd op opnieuw geëxporteerde invoer bij de ongewijzigde drempel (numpy { "2.4.6" }, alle zes netwerken slagen)
