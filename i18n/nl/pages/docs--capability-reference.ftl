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
