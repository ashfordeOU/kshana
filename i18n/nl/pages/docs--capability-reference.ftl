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
