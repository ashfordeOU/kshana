# docs--modelled-rationale: translations (nl)

seg-aab745a65e76 = Module

seg-2db69c58f694 = Differentiële PNT op de maan

seg-1ff1d8ebf1e7 = Compliance-mapping naar openbare kaders

seg-d6476863f862 = Mogelijkheid

seg-60a43431ebe0 = Eis

seg-bde1b3a94a47 = Zonne-SRP-schaduw met randverduistering (optioneel)

seg-eaaec545dd68 = SRP-verlichte fractie als niet-bedekte fractie van de zonnestroom met randverduistering (wet in Eddington-benadering I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kwadratuur) over een sferische of WGS-84-Aarde (srp_shadow::limb_darkened_shadow, de ShadowModel-variant OblateEarthLimbDarkened)

seg-9e15970435c3 = DE440-Zon en -Maan in het Cowell-krachtenmodel (optioneel)

seg-de6831cf7785 = Optionele efemeridenlaag voor de termen van derde lichamen en SRP van het numerieke Cowell-ForceModel: de geocentrische Zon en Maan van elke EphemerisProvider (een DE440-SPK-kernel via KernelEphemeris) op TDB = TT + (TDB - TT), die een provider weigert die het epoche niet kan bedienen en elke terugval op de analytische reeks telt; standaard uit

seg-057c21daf4f2 = Atmosferisch getij S1 (optioneel)

seg-f600a39f297e = Het dagelijkse luchtdrukgetij S1 als geopotentiaalverstoring: model N1 van Biancale en Bode ({ "2006" }), graden { "2" } tot { "6" }, via de belastingformule IERS { "2010" } vgl. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), optioneel in de Cowell- en precieze krachtenmodellen (air_tide_s1, standaard uit)

seg-e8f5ff8c9149 = Zwaartekracht met sferische harmonischen van hoge graad (EGM2008 tot { "2190" })

seg-d3b2f32dcecb = Underflow-veilige, poolveilige evaluatie van een volledig genormaliseerd veld tot graad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, gemodificeerde voorwaartse kolom van Holmes-Featherstone { "2002" } met de gradiënt vrij van 1/cos phi), een streamende ICGEM-.gfc-lader (from_gfc_file / from_gfc_reader; de volledige EGM2008 wordt tijdens het uitvoeren opgehaald, niet meegeleverd), en de Holmes-Featherstone-evaluator die kan worden gekozen op de optionele Cowell Geopotential

seg-1960804ef2f4 = Batchbaanbepaling met range-rate en az/el met stationsmaskering

seg-4c185244bc66 = Herstel een epochetoestand uit gemengde tracking van afstand, range-rate en azimut/elevatie boven een elevatiemasker met Gauss-Newton op H = (dh/dx(t)) Phi(t, t0): analytische meetpartiëlen en een variationele toestandsovergangsmatrix met analytische partiëlen voor tweelichamen + J2 (met RK4 geïntegreerd, geen STM in gesloten vorm)

seg-bc3d1ee7c639 = Waarnemingsweging met de nauwkeurigheidscodes van SP3

seg-63b1fab84f85 = Zet SP3-nauwkeurigheidscodes (header ++ exponenten in { "2" }^n mm, de %f-basis, standaarddeviaties base^n mm per record) om in positiesigma's per waarneming voor de engine voor precieze baanbepaling (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Een gepubliceerd zwaartekrachtveld aan een lichaam koppelen

seg-ffb2b20e5f32 = with_gravity_field (op Body, in src/gravity_pds.rs): koppel elk geladen sferisch-harmonisch veld (bijvoorbeeld GMM-3 of GL0660B) aan een Body zodat de propagator het lichaamsvast evalueert; optioneel, standaardlichamen ongewijzigd

seg-9762cf428435 = Encoders voor navigatieberichten naast GPS LNAV (GPS CNAV, Galileo I/NAV en F/NAV)

seg-9b703b9607d8 = GPS CNAV-berichttypen 10/11/30, Galileo I/NAV-woordtypen 1-5 in nominale even/oneven pagina's en Galileo F/NAV-paginatypen 1-4: ICD-veldverpakking en kwantisatie, CRC-24Q, convolutiecodering met rate 1/2 K={ "7" } (G2 geïnverteerd voor Galileo), blokinterleaving en synchronisatiepatronen, met bijpassende testdecoders

seg-974d8c1f7876 = Hatch-draaggolfafvlakking van code op echte RINEX-waarnemingen

seg-f26b5da0f52e = Divergentievrij Hatch-filter (ionosfeervrije code gedragen door de ionosfeervrije draaggolf, venster van N epochen, herstart bij verlies van lock, geometry-free-sprong of gat) in de assemblage voor precieze single-point-positionering

seg-278ca396127a = Lezen van RINEX { "4" }-waarnemingsbestanden

seg-e0883aa933eb = RINEX 4.0x-waarnemingsheaders (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; labels gematcht in kolommen 61-80 voor versie { "4" } en later) en epoche-records

seg-33e5c74720ff = Broadcast-satellietpositie van BeiDou GEO

seg-44b61449b65a = Positie van een geostationaire satelliet volgens BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } uit een broadcast-efemeride (quasi-inertiaal stelsel, dan Rz(Ω̇e·tk)·Rx(−{ "5" }°)), optioneel via het veld include_beidou_geo van NavParseOptions, zodat de standaardlezer GEO's nog steeds overslaat

seg-71f48628ebb2 = Strak gekoppelde GNSS/INS met draaggolffase en float-ambiguïteiten

seg-5a156aa81275 = Foutentoestands-EKF over { "15" } INS-toestanden, een ontvangerklok met twee toestanden en één float-draaggolfambiguïteit per gevolgde satelliet; pseudorange, draaggolffase en optionele range-rate uit een SGP4-Walker-constellatie (lichttijd en Sagnac), correcties van Klobuchar en Saastamoinen/Niell toegepast in de lus op de eigen positie van het filter; slipdetectie met tijdgedifferentieerde draaggolf met een drempel per satelliet die wordt verruimd door de snelheidsonzekerheid; herinitialisatie van ambiguïteiten bij slips en heracquisitie

seg-7d644516b1ec = GNSS/INS-pakketten voor maritiem, spoor en luchtvaart met een optie voor strakke koppeling

seg-cbb03a8baf73 = Drie gnss-ins-scenario's op de trajectbibliotheek (een vaartuig dat met { "8" } m/s slingert met een uitval van vijf minuten; een trein door een inkarteling met twee satellieten en een tunnel; een vliegtuig waarvan de uitval een bocht met 25 graden helling beslaat) en de optionele [tight]-tabel van het pakket: pseudoranges uit een SGP4-Walker-constellatie samengevoegd door de gesloten-lus-navigator, elke satelliet boven het masker bij nominaal en de hoogste enkele bij gedegradeerd

seg-f4dab73c4eda = Gekoppeld PNT-filter met pseudoranges met biastoestand en 3D-uitbreiding in het fusiepakket

seg-742b60089361 = Eén gestapeld Kalman-filter over positie, snelheid, klokfase en -frequentie, gevoed met pseudoranges die positie en klok koppelen (updates in Joseph-vorm met de kruiscovariantie); een 1-DOF-variant aangevuld met een toestand voor een constante versnellingsmeterbias die het fusiepakket onder [coupled] draait; en de 3D-versie met 8 toestanden met line-of-sight-rijen

seg-2db2b9dc3b45 = GNSS/INS-trajectbibliotheek en import van CSV-referentie

seg-e1fe83c75a6c = Te kiezen bewegingsprofielen voor het gnss-ins-pakket (recht, figuur-8, stedelijk stop-en-go, vliegtuigklim en gecoördineerde bocht, survey-drone), gedefinieerd door commando's voor Euler-snelheid en versnelling langs het spoor die op de referentietoestand worden gesloten met de kinematische IMU (centripetale, zwaartekracht- en Coriolistermen), en geïmporteerde CSV-referentie omgezet in de IMU die haar reproduceert; de historische rit blijft ongewijzigd als er geen profiel is opgegeven

seg-86f9186bb884 = Aarde-Maan-CR3BP { "9" }:{ "2" }-NRHO tegen de baan die CAPSTONE vloog

seg-d4127cf241f3 = De circulair-beperkte zuidelijke L2-halobaan { "9" }:{ "2" } met bijna rechtlijnige baan die cr3bp::differential_correct_halo corrigeert (de baanfamilie van Gateway en CAPSTONE), vergeleken op zijn gemiddelde geometrie (periode, perilune-straal, apolune-straal) met de baan die CAPSTONE werkelijk vloog. Een meting van hoe goed het CR3BP-lid de echte baan beschrijft; een CR3BP-baan is geen baan uit een efemeridenmodel en wordt niet epoche voor epoche vergeleken

seg-1a5623c81b48 = Positiefout uit geometrie: RMS-fout = sigma_UERE x DOP voor de kleinste-kwadratenfix van de engine

seg-7a94b44a8738 = dop_error_mc::run_geometry en check: een geseedde Monte Carlo (N = { "20,000" } epochen per geometrie, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) van de eigen iteratieve kleinste-kwadratenfix van de engine (pvt::solve_spp, eenheidsgewichten, opgelost vanuit de ware positie) op de { "8" } geometrieën van tests/fixtures/dop/dop_reference.csv, waarbij de oost-, noord-, omhoog- en klokfoutvarianties, de H/V/P-RMS, de oost-noord-correlatie, de gemiddelde fouten en de fractie binnen de horizontale ellips van { "95" } % worden vergeleken met sigma^{ "2" } Q, waarbij Q de covariantiefactor is van de kernel orbit::dop (orbit::dop_cofactor, dezelfde rekenkunde) op dezelfde geometrie

seg-9acfde1b57f7 = Geometriebewuste vertrouwensclassificatie: satellietgeometrie naast de vertrouwensscore van de ontvanger en een klasse bij elke aftrek

seg-6138c41e13ff = receiver_trust::geometry: satellietgeometrie per epoche (goed, gedegradeerd met redenen few-satellites/high-pdop/high-hdop/sky-blocked, of onbekend als het logboek geen GSV, NAV-SAT of GSA geeft) afgeleid uit de gerapporteerde elevaties en azimuts via orbit::dop of overgenomen uit GSA, met een label dat altijd wordt gerapporteerd en nooit wordt gescoord (good, fair, poor, unknown) en de HDOP, PDOP, VDOP, het aantal satellieten en het signaalverlies in woorden; een geometriemonitor voor de vaartuigscore die niets aftrekt tenzij de geometrie slecht is (verhouding max(hdop/4, pdop/6, 5/n_used) boven { "1" }), dan oploopt tot een plafond van { "15" } punten bij { "1.5" } dat geometrie alleen niet onder de gedegradeerde band kan brengen (plafond, eind van de helling en ondergrens in [geometry]; geen alarm); een klasse bij elke aftrek (geometry, environment, inconsistency) waarbij verlies van lock op satellieten onder { "15" } graden als geometry wordt geclassificeerd, satellieten in zicht maar niet gevolgd als environment, en een aftrek voor slechte geometrie waarvan de opgegeven HDOP verder dan max({ "1.0" }, { "25" } % van de afgeleide HDOP) van de opgegeven hemel ligt als inconsistency

seg-e4ec41d0f5e1 = Waarneembaarheid van maanstations in absolute zin (datumdefect)

seg-b3e4160042d2 = Waarneembaarheid via Fisher-informatie van de gezamenlijke maanoplossing: zonder basislijnen naar de aarde ligt het datum van het absolute stelsel in de nulruimte van HᵀWH (de stationspositie is niet waarneembaar); ≥{ "3" } basislijnen herstellen de volle rang en begrenzen de Cramér–Rao-fout van het station, die de schatter bereikt

seg-2ed7181c97dd = Genereren van LunaNet-AFS-spreidingscodes (LSIS V1.0)

seg-13ff6c381275 = De Augmented Forward Signal-codes van LSIS V1.0 ({ "29" } januari { "2025" }): de primaire AFS-Q-code van 10230 chips, gegenereerd uit de L1C-pilootconstructie van IS-GPS-800 met de indices van IS-GPS-800J (dezelfde { "210" } toewijzingen die LSIS Appendix D afdrukt), de Gold-codes van AFS-I met 2046 chips, gegenereerd uit g1 = x^{ "11" } + x^{ "2" } + { "1" } en g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, waarbij de G2-vertraging van elke PRN is teruggewonnen uit het Annex { "3" }-bestand van de standaard, de vier secundaire codes, de tertiaire codes van 1500 chips, de voorlopige knooppunttoewijzing van Tabel { "11" } en de gelaagde pilootcode. De LSIS-inhoud wordt tijdens de run gelezen uit een lokale cache die met SHA-256 is geverifieerd en is gevuld uit de door NASA gehoste PDF; ze wordt nooit verspreid

seg-56c7aeac59c1 = Gesloten-lus-decodeerbaarheid van LunaNet AFS door een onafhankelijke ontvanger (LSIS V1.0)

seg-da2d29d437b0 = Een Kshana-AFS-opname die door een onafhankelijke softwareontvanger is verworven, gevolgd en gedecodeerd en is vergeleken met de eigen referentielabels van de opname. Dit bewijst alleen dat de uitvoer overeenkomt met de standaard en dat de labels consistent zijn; het is geen uitspraak over kanaalfysica, voortplanting, ontvangen vermogen of linkbudgetten, waarvan de waarden in de opname gekozen invoer zijn

seg-780369fb9a54 = GPS L1 C/A: gelijkheid van uitvoer tussen generatoren

seg-ee47b60515f1 = GPS L1 C/A-spreidingscodes (sdr::CaCode) en LNAV-subframes 1-3 (gps_lnav: veldkwantisatie volgens IS-GPS-200 met de pi van de specificatie, twee-complementpakking, TLM- en HOW-woorden, pariteit van Tabel 20-XIV met D29*/D30*-inversie, de pariteitsoplossende bits van woorden { "2" } en { "10" }) bit voor bit vergeleken met gps-sdr-sim op het meegeleverde brdc0010.22n ({ "32" } satellieten)

seg-bf429c8f00fb = GNSS-IQ-acquisitie op onafhankelijk gegenereerde I/Q-samples

seg-9a0c52bfb06e = iq::acq::acquire (parallelle FFT-codefasezoektocht met de kwadratische-detector-Marcum-Q-drempel) met de GpsL1Ca-replica, op { "20" } ms van de eigen 8-bit-I/Q-uitvoer van gps-sdr-sim, gedecodeerd met de iq::io-sampledecoder (ci8, { "2.6" } MHz, { "11" } satellieten, geen ruis): elke PRN { "1" } tot { "32" } doorzocht in twee vensters van { "10" } ms, waarbij het resultaat is vergeleken met de codefase en Doppler die gps-sdr-sim heeft gemoduleerd

seg-f40dc3dac990 = IQ-monitors beoordeeld in lab-replaycampagnes: detectie, gemiste detecties, valse alarmen en valse-alarmcijfers in gesloten vorm

seg-93fb3109728c = iq::campaign::detect en de campagnerunner: een optionele tabel [monitors] laat de IQ-monitors op elke cel draaien in de enkele doorgang van de runner. De vermogens- en spectrale monitors zien de samples na elke front-endketen; de C/N0-, SQM- en lockmonitors zien de lus-updates van elk gevolgd kanaal. Elk alarm wordt beoordeeld aan de hand van de opgegeven gebeurtenissen: gedetecteerd of gemist per (gebeurtenis, alarmsoort, kanaal), detectietijd, en valse alarmen buiten de gebeurtenissen over hun blootstelling. Het valse-alarmcijfer in gesloten vorm van elke test wordt vermeld: vermogen per blok (exacte gamma-staart), spectraal overschot per blok (benadering), kurtosis (eenzijdig Gaussisch), pulsen (binomiaal plafond), SQM per gemiddelde update (2Q(k) = Q(1/2, k^2/2), nieuw), en de ARL0 van de C/N0-CUSUM (Siegmund). Zonder de tabel blijven cellen, sleutels en digests ongewijzigd. Er wordt geen interferentiegolfvorm gesynthetiseerd

seg-5b7eb7ddb474 = Detectie-ROC van de IQ-monitors uit een beoordeelde lab-replaycampagne

seg-57fe85965c9c = iq::campaign::detect (windows, roc) en iq::campaign::report::rocs: elke cel van een campagne met monitors bewaart, per alarmsoort en kanaal, het maximum van de eigen toetsstatistiek van de monitor over elk opgegeven gebeurtenisvenster (positief) en over getegelde roc_window_s-vensters buiten de gebeurtenissen (negatief). De statistieken zijn de afwijking van het blokvermogen, het PSD-overschot, de kurtosis z, de SQM |z| van de gemiddelde maat, en de C/N0-CUSUM. Het rapport voegt ze per soort samen tot een empirische ROC op vensterniveau met zijn AUC en het werkpunt bij de ingestelde drempel, geschreven als roc.json (kshana.campaign-roc/1) en een sectie Detection ROC in report.html. Een campagne zonder monitors schrijft geen van beide

seg-3a3cfa322f01 = Kalibratie van de C/N0- en lockmodellen van de open ontvanger op IQ-campagneresultaten, met opgegeven voorspellingsfout

# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) en <c1/> op <c2/>, Python <c3/> en de MCP-tool labfit (alleen campagnemappen binnen zijn werkmap): leest een uitvoermap van <c4/> via zijn DIGEST en groepeert de beoordeelde cellen tot fiteenheden (signaal x lusontwerp x front-endketen x jammertype, nooit samengevoegd). Per eenheid wordt de gemeten C/N0 gefit tegen de opgegeven J/S met de vorm voor spectrale scheiding. Q_eff is niet identificeerbaar uit C/N0-gegevens zonder een onafhankelijke meting van de jammer- en signaalvermogens, dus Q wordt opgegeven en nooit gefit (de typetabel, de q van de gebeurtenis, of voor een onbekend type de meest schadelijke opgegeven waarde, cw Q = { "1" }). De gefitte parameter is de identificeerbare offset delta_eff = delta - { "10" } log10 Q, waarbij de correlatiebewaking de ontaarding meldt. C/N0-bins met lock onder { "90" } % worden gecensureerd en weergegeven. De drempel-J/S wordt direct en via de gesloten vorm gegeven; het trackinglusmodel en het empirische lockmodel zijn via het C/N0-model gekoppeld, met verlies- en herlockverblijftijden. Een geseede clusterbootstrap over opnamen ({ "1000" } replicaties) levert percentielintervallen; voorspellingsintervallen van { "90" } % komen uit residutrekkingen; leave-one-recording-out-holdouts worden gesplitst in interpolatie en extrapolatie; een vooraf geregistreerde tabel [validation] wordt gehasht en elke drempel krijgt PASS/FAIL. Rapport kshana.labfit-iq/1 als JSON, CSV en gegenereerde Markdown, met een eenhedenblok. Alleen synthetisch (geen opname van derden, geen jammergolfvorm). Het labfit-pad via ontvangerlogs is ongewijzigd

seg-9537d301c95e = GPS-LNAV-codering gedecodeerd door een onafhankelijke ontvangerbibliotheek

seg-909415621881 = De LNAV-subframes 1-3 van Kshana (gps_lnav::encode_subframes) voor de { "32" } efemeriden van brdc0010.22n, aangeboden aan decode_word en decode_frame van RTKLIB: pariteit van elk woord, subframedecodering met consistent issue of data, en elke gedecodeerde parameter tegenover het gehele getal van Kshana en tegenover de invoerwaarde

seg-f66855e35c53 = Codering van het GPS-LNAV-navigatiebericht

seg-8caf8366e2f8 = IS-GPS-200 LNAV-subframes 1-3 (gps_lnav::encode_subframes: kwantisatie naar het dichtstbijzijnde getal van elke klok- en baanparameter bij de schaalfactoren en de waarde van pi uit de specificatie, twee-complementpakking, TLM- en HOW-woorden, pariteit van Tabel 20-XIV met D29*/D30*-inversie, de pariteitsoplossende bits van woorden { "2" } en { "10" }), het bericht dat een GPS L1 C/A-signaalgenerator uitzendt

seg-c5c944357643 = Acquisitie en C/N0-schatting op echte maan-IQ

seg-f5dcb5e06bf4 = Parallelle codefasezoektocht (acquisition::pcps_acquire: draagbare FFT, coherente vouwing, niet-coherente accumulatie, chikwadraatdrempel voor een zoekbrede kans op vals alarm), verfijning, open-lus-promptcorrelatie met code-Doppler en de M2M4-C/N0-schatter, uitgevoerd op de LuGRE L1 4-bit-IQ-batches gelezen via realdata::ion_sdr

seg-709626569a5c = Acquisitie op echte maan-IQ tegenover door de baan voorspelde Doppler (beslissing op samplevermogen)

seg-784ebd80c425 = acquisition::pcps_acquire met zijn beslissing op samplevermogen op de negen L1-batches van LuGRE niet op het oppervlak met mid-rise-niveaus; Dopplerverschillen tussen verworven satellieten vergeleken met verschillen die zijn voorspeld uit de definitieve ESA-banen en de door Firefly gereconstrueerde baan van Blue Ghost

seg-89875d67b253 = Acquisitie op echte maan-IQ beoordeeld aan de hand van door de baan voorspelde Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire met de cell-averaging-beslissing (piek boven de gemiddelde cel van het raster, robuust tegen bandbegrensde ruis) op de negen L1-batches van LuGRE niet op het oppervlak met mid-rise-niveaus; Dopplerverschillen tussen verworven satellieten vergeleken met verschillen die zijn voorspeld uit de definitieve ESA-banen en de door Firefly gereconstrueerde baan van Blue Ghost

seg-8fa779dd1788 = Acquisitie op achtergehouden echte maan-IQ tegenover door de baan voorspelde Doppler

seg-484868771231 = acquisition::pcps_acquire (cell-averaging-beslissing, kans op vals alarm { "1e-7" }) met refine_doppler_coherent op de LuGRE L1-batches die op het maanoppervlak zijn opgenomen (I in de hoge nibble, mid-rise-niveaus); Dopplerverschillen tussen verworven satellieten tegenover verschillen die zijn voorspeld uit de definitieve ESA-banen en de landingsplaatskernel van Firefly

seg-10af60b488b9 = Differentieel referentiestation van het type NovaMoon: opheffing van gemeenschappelijke modi, restfout die met de basislijn groeit en DGNSS-beschermingsniveaus

seg-c04a3591074c = Interoperabiliteitsexport voor de maan

seg-91f4a066b3c0 = Aan LunaNet/IOAG afgestemde export van maanstelsel, tijd en efemeride (CCSDS OEM plus KIF) met round-trip en formaatcontrole

seg-8ab65cbefb75 = Scoring afgestemd op raamwerken voor PNT-veerkracht

seg-c48198f31d63 = Deelscores per dimensie over de eigen zeven veerkrachtcategorieën van Kshana (geen DHS-termen), de RDRR-functies van RethinkPNT en de criteria van Yang, elk gemarkeerd als berekend uit een model met zijn drijvende factor; voorlopig RPCF-niveau met een poort voor begrensde degradatie. Zelfbeoordeling op basis van simulatie, nooit certificering.

seg-d7bdb6fe186e = Studie naar beslissingsinstabiliteit van de veerkrachtscore

seg-5fcf18a68bb1 = Kwantificeert hoe één samengestelde score of één RPCF-niveau architecturen herordent onder een verdedigbare gewichtensimplex en een dreigingsensemble (top-1-omslagpercentage, Kendall-tau-spreiding, niveau-omslagpercentage, rangbereiken); analyses van opgegeven versus gemeten en van diversiteitsinstorting.

seg-1bf03544a010 = Representativiteit van de demonstratie en hiaten tot vlucht

seg-db24d16d38c9 = Eerlijkheidsregister per resultaat dat een demonstratie-uitvoer kwalificeert: de externe ankers, de modelaannames, de hiaten tot vlucht en de representatieve TRL-band, met afgedwongen invarianten (getoetst vereist een extern anker; berekend uit een model vereist een hiaat en kan niet boven TRL { "4" } claimen).

seg-52ab936eb5f5 = Bewijs voor de afweging kwantum tegenover klassiek (gemeenschappelijke vorm)

seg-a6679ed5bed7 = Eén reproduceerbaar TradeEvidence-object (vast kader: scenario, seed en engine; gemeenschappelijke kwantum-tegenover-klassiek-waarden per kwaliteitsmaat met polariteitscorrect voordeel, optioneel betrouwbaarheidsinterval van { "95" }%, label getoetst of berekend uit een model) met een representativiteitsrecord, zodat elke kwantum-PNT-vertical de afweging op dezelfde eerlijke manier rapporteert.

seg-20fee61b3107 = Bibliotheek met foutmodellen van kwantumapparaten

seg-e42eabe9bc2a = Apparaatkaarten (optisch, gevangen-ion en kwikion, plus klassieke klokken hergebruikt uit holdover/clock_state; koude-atoom-interferometer; klassieke tijdoverdrachtlinks en links met verstrengeling of enkele fotonen), elk met een representativiteitsrecord; de verstrengelingslink voegt een door shotruis begrensd model voor de tijdsprecisie toe (~jitter/sqrt(R*tau), straf voor donkere tellingen, systematische ondergrens).

seg-86d71fd89f26 = Betrouwbare kwantumtijdsynchronisatie (tijdoverdracht, beveiligde verspreiding en anomalie)

seg-d2a3d37825ef = Volledige keten voor kwantum- tegenover klassieke tijdoverdracht (klokdoorloop en linkprecisie in kwadratuur), een hergebruikt beschermingsniveau voor tijdsynchronisatie, een beveiligingskwaliteitsmaat voor vertragings- en replay-aanvallen (1-P_md) en een detectiekans voor klokanomalieën plus CUSUM-latentie, uitgegeven als eerlijk TradeEvidence met een representativiteitsrecord.

seg-eaf341ff4522 = GNSS-vrije kwantumnavigatie

seg-908a44a9f7c7 = Kwantum (koude-atoom-interferometer) tegenover klassieke dead-reckoning met een INS van navigatiekwaliteit tijdens een GNSS-uitval: groei van de positiefout, holdover tot een positiedrempel, en de afweging kwantum tegenover klassiek als eerlijk TradeEvidence; eerlijke opmerking over waarneembaarheid (bias is niet waarneembaar zonder positiebepaling, dus de fout groeit).

seg-914132833f5a = Detectie van fouten en anomalieën voor kwantum-PNT-systemen

seg-f20392820b9d = Gelabelde catalogus van kwantumfouten (klokfrequentiesprong, drift, lock-verlies; sensorbiassprong, uitval), een detectiestatistiek-ROC-AUC met een bootstrap-betrouwbaarheidsinterval, en een minimaal detecteerbare fout bij een vast valse-alarmpercentage; een door een kwantumklok ondersteunde monitor detecteert kleinere fouten dan een klassieke, uitgegeven als eerlijk TradeEvidence.

seg-d31be81dfd8f = Passieve geolocatie van zenders via TDOA/FDOA

seg-aa870cee16f6 = Een zender lokaliseren (jammer of spoofer, of een opportunistische bron voor omgekeerde PNT) uit het tijdverschil van aankomst over een ontvangernetwerk — de snijding van hyperboloïden τᵢ=(Rᵢ−R₀)/c opgelost met Gauss–Newton-kleinstekwadraten — en, door het frequentieverschil van aankomst (verschillen in afstandssnelheid) met bewegende ontvangers toe te voegen, positie en snelheid gezamenlijk terugvinden; met de Cramér–Rao-ondergrens op de positiecovariantie uit de meetgeometrie

seg-5bd3882531b6 = Convectieve binnenkomstverhitting in het stagnatiepunt (Sutton-Graves) bij een binnenkomst met 3 vrijheidsgraden

seg-4f97036ed72f = Convectieve warmteflux in het stagnatiepunt q = k sqrt(rho/R_n) V^{ "3" } met de Sutton-Graves-constanten voor lucht op aarde en de atmosfeer van Mars (NASA TR R-376, { "1971" }), haar piek en de geïntegreerde warmtebelasting langs een binnenkomst met 3 vrijheidsgraden, ballistisch of dragend bij constante rolhoek, op aarde of Mars.

seg-1b96577665fc = Radiometrie, MTF, relatieve randrespons en GIQE-{ "4" }-NIIRS van elektro-optische beeldvormers

# c1: eo-radiometry
seg-38902593e841 = Signaal-ruisbudget van een nadirbeeldvormer (Lambertiaanse scènestraling, cameravergelijking, shot-, donker-, lees- en kwantisatieruis), de systeem-MTF bij Nyquist als product van diffractie van een onbelemmerde apertuur, detectorapertuur, lineaire smeer en Gaussische jitter, de randrespons en de relatieve randrespons geïntegreerd uit die MTF, Q = lambda F / p, en de GIQE-versie { "4" }-NIIRS zonder MTF-compensatie. Uitvoerbaar als scenariosoort <c1/>.

seg-07ca77a67207 = Verliezen door zwaartekracht, weerstand, sturing en tegendruk bij lanceeropstijging

# c1: ascent-losses
seg-7a1802cf2c80 = Vlakke zwaartekrachtbochtopstijging van een voertuig met meerdere trappen boven een niet-roterende bolvormige aarde door de US Standard Atmosphere { "1976" } (dichtheid en druk), met een pitch-kick, een door de tegendruk van het mondstuk verminderde stuwkracht, uitbranden van trappen op exacte stapgrenzen, en de verliezen door zwaartekracht, weerstand, sturing en tegendruk naast de toestand geïntegreerd. Uitvoerbaar als scenariosoort <c1/>.

seg-55e8345def8b = TWSTFT-tweewegvergelijking, onzekerheidsbudget en linkstabiliteit met flikker en dagelijkse niet-reciprociteit

# c1: time-transfer-budget
seg-5ca5226c24ec = De TWSTFT-tweewegvergelijking opgelost voor T_A - T_B met zend- en ontvangstvertragingen van de stations, de ionosferische op-/neerwaartse asymmetrie in de Ku-band, het vertragingsverschil van de transponder en de Sagnac-termen, tegenover haar exacte voorwaartse model; een onzekerheidsbudget in kwadratuur met de link-TDEV als type-A-term; een tweewegreeks met witte en flikkerfaseruis (Kasdin-Walter), een dagelijkse niet-reciprociteit en een constante reciprociteitsrest; en de snelheid, rest-RMS, TDEV en ADEV van aangeleverde stationsklokreeksen in Circular T, MJD-CSV of IGS RINEX. Uitvoerbaar als scenariosoort <c1/>.

seg-2f9be02c92bc = Numerieke methoden voor de optische atmosfeer langs een schuin pad: Rytov-variantie, scintillatie, gamma-gamma-fadekans, apertuurmiddeling, optische diepte van wolken en heldere lucht

# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley-Cn2 geïntegreerd langs een schuin pad voor de Rytov-variantie van vlakke en bolvormige golven (uplink en downlink), de scintillatie-index van Andrews-Phillips en de gamma-gamma-parameters, de gamma-gamma-fadekans en fademarge, de zwakke-turbulentie-apertuurmiddelingsfactor, de optische wolkendiepte van een vloeibaarwaterkolom en de optische diepte van heldere lucht uit Kim-zicht plus Rayleigh, ter vervanging van het samengevoegde atmosferische verlies van het optische linkbudget wanneer een atmosfeer wordt aangeleverd. Uitvoerbaar binnen de scenariosoort <c1/>.

seg-a2faab92e760 = Door het weer bepaalde beschikbaarheid van optische grondlocaties en met de afstand gecorreleerde locatiediversiteit

# c1: optical-atmosphere
seg-7f4e4e763d62 = Beschikbaarheid van een optische link tegenover een opgegeven linkmarge uit een lognormaal klimaat van vloeibaar water in wolken (hoeveelheid volgens ITU-R P.840, extinctie volgens geometrische optica) en de onafhankelijke gamma-gamma-turbulentiefade, de linkmarge die nodig is voor doelbeschikbaarheden en het plafond dat geen marge kan verhogen, lognormale uitvalduren, wat-als-scenario's voor verbeteringstechnieken, en een eenfactor-Gaussische-copula-netwerkbeschikbaarheid waarvan de paarcorrelatie exp(-afstand/decorrelatielengte) is. Uitvoerbaar als scenariosoort <c1/>.

seg-043ece801e72 = Continuïteit van tijdsynchronisatie en afstandsmeting door optische uitval heen

# c1: optical-atmosphere
seg-bb9cb3fe4180 = De uitvalduurverdeling van een optische locatie gekoppeld aan de coastvariantie in gesloten vorm van het holdovermodel van de klok: fout in tijdsynchronisatie en afstandsmeting bij opgegeven uitvalkwantielen, de holdover tot een drempel voor tijdsynchronisatie, het aandeel uitvallen en uitvaltijd daarbinnen en de beschikbaarheid van tijdsynchronisatie A + U E[min(D, T_h)]/E[D], voor de klassieke en kwantumklokklassen. Uitvoerbaar binnen de scenariosoort <c1/>.

seg-b119df65d2a7 = Optische linkmarge tegenover de tijd: één geseede realisatie van het weer van een locatie

# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Een optionele tabel <c1/> (duur, stap, seed) laat de soort <c2/> per locatie ook één geseede realisatie van het opgegeven locatiemodel door de tijd heen schrijven: wolkenepisodes (heldere perioden exponentieel, wolkenuitval lognormaal met het opgegeven gemiddelde en de opgegeven spreiding, het tijdsaandeel in wolken ingesteld op de opgegeven wolkenkans), één lognormale vloeibaarwaterkolom per wolkenepisode, één gamma-gamma-scintillatiesample per stap, en daaruit de linkmarge, de wolken- en scintillatiefades en de vlag voor link omhoog, met de gerealiseerde beschikbaarheid, het wolkenaandeel, het aantal uitvallen en de langste uitval. Zonder de tabel is het resultaat het document van { "0.37" }. Trekkingen verlopen via de draagbare verdelings- en wiskunderoutines, zodat native en wasm32 dezelfde bytes geven.

seg-58cbf576c959 = Lezer voor TRK-2-18-Orbit-Data-Files en gerampt Mars-2-wegs-Dopplermodel

seg-d1055650a77f = Een lezer voor DSN Orbit Data Files (TRK-2-18): de recordgroepen van 36 bytes (bestandslabel, identificatie, baandata, ramps per station, klokoffsets, samenvatting, einde van bestand), en in elk baandatarecord de tijdstempel sinds { "1950" }, downlink- en uplinkvertragingen, observabele, stations, datatype, banden, geldigheid, kanaal, ruimtevaartuig, de referentiefrequentie van 46 bit en de compressietijd; begin- en eindtijden, snelheden en beginfrequenties van ramps. Daarbovenop een gerampt 2-wegs-X-band-Dopplermodel (geïntegreerde uplinkramps, heen-en-terug-lichttijd met Shapiro en troposfeer, DSN-stations via de IAU 2006/2000A-CIO-keten en IERS-EOP, stationstijd) en een batchbaanbepaling voor een Mars-orbiter (GMM-3-veld, derde lichamen, SRP, weerstand).

seg-455dc946c965 = Multiplicatieve-EKF-standschatting uit een gyro en een sterrenvolger

# c1: aocs
seg-553d043438b4 = De multiplicatieve EKF van Lefferts-Markley-Shuster: standfout in het lichaamsstelsel en gyrobias als toestanden, propagatie met de gyrosnelheid min de biasschatting en het discrete procesruis van Farrenkopf (hoek- en snelheidsrandomwalk), sterrenvolgerupdates met het residu { "2" } vec(q^-1 q_st) in Josephvorm, en de multiplicatieve reset; een discrete gyro- en sterrenvolgersimulator volgens Farrenkopf. De soort <c1/> kan de regellus sluiten op zijn schatting.

seg-a971ff07592a = Dienstcyclus van een apertuur voor navigatie tegenover communicatie

# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Eén run neemt een contactplan (een lijst vensters aos_s/los_s, die elk de apertuur vragen voor navigatie of communicatie — dezelfde vensterwoordenschat die <c1/> uitzendt, omgezet door <c2/>), een aantal aperturen en een expliciet arbitragebeleid, en geeft de navigatiedienstcyclus, de communicatiedienstcyclus, de ongebruikte dienstcyclus en de uitval per sessie terug. Het beleid is een invoer met een gedocumenteerde standaardwaarde (<c3/>; ook <c4/> en niet-onderbrekend <c5/>), en het rapport bevat het opgeloste beleid, de volledige definitie ervan en de definities van dienstcyclus en uitval, omdat een genoemde dienstcyclus zonder zijn arbitrageregel niet reproduceerbaar is. Het schema is een exacte intervalsweep over de vensterranden, zodat een venster dat precies eindigt waar het volgende begint nooit conflicteert, en apertuurseconden voor navigatie, communicatie en ongebruikt in die ene sweep onafhankelijk worden opgeteld. Uitvoerbaar als scenariosoort <c6/>

seg-43cd7aa7ab53 = RF-jamming van navigatie op het maanoppervlak (J/S per satelliet)

# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Maaneigen jammer-signaalverhouding, effectieve C/N₀ en verlies van lock voor een selenografische gebruiker aan het oppervlak onder een jammer op het maanoppervlak (of verhoogd), over de illustratieve constellatie van het type Moonlight/LCNS uit openbare bronnen. Stelt de open jammingketen samen (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) met de open maanhemelgeometrie (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); er wordt geen geometrie of radiometrie opnieuw afgeleid. In tegenstelling tot de aardse soort <c1/> is de signaalschakel geen vast ontvangen vermogen: het isotrope ontvangen vermogen van elke satelliet is zijn eigen linkbudget-EIRP − FSPL(schuine afstand), zodat J/S per satelliet verschilt met maanafstand en elevatie. Geeft ÉÉN RIJ PER ZICHTBARE LINK (epoch, satelliet) als JSON en als *.table.csv-artefact, met beide ontvangen vermogens waarvan J/S het verschil is ernaast afgedrukt; samengevatte kwaliteitsmaten staan naast die tabel, nooit in plaats ervan. Uitvoerbaar als scenariosoort <c2/>

seg-4c116e25c5c5 = Maanontzeggingscontour met een onzekerheidsband uit de gemeten spreiding van C/N₀

# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Het rapport <c1/> laat zijn ontzeggingscontour niet langer op één scalar rusten. Het geeft de volledige gemeten verdeling van de C/N₀ van het gewenste signaal over de tabel per satelliet — n, min, p05, p25, mediaan, p75, p95, max, gemiddelde, steekproefstandaardafwijking, en de eigen asymmetrie van de steekproef (p95 − mediaan) − (mediaan − p05) — naast de rijen per link, die ongewijzigd zijn. De contour wordt vervolgens bij elk van die rangstatistieken gerapporteerd onder BEIDE ontzeggingscriteria die de engine kent, nooit het ene in plaats van het andere: het bestaande criterium van de vermogensverhouding (J/S = { "30" } dB, dezelfde drempel die attack_surface en tracking_loop gebruiken, en het criterium achter de kolom <c2/> van de uitgebrachte tabel voor maan-linkjamming), en het criterium van verlies van lock (de effectieve C/N₀ die daalt tot tracking_threshold_dbhz), het criterium waarmee de eigen kolom links[].status van dit rapport wordt beoordeeld. Elk contourpunt wordt gegeven op beide assen van het ontzeggingsvlak — het jammer-EIRP dat nodig is bij de afstand van het scenario, en de ontzeggingsafstand bij het EIRP van het scenario — zodat de band een interval is op dezelfde assen waarop een contourplot wordt getekend. De bandranden ZIJN contour(p05) en contour(p95): dezelfde gesloten-vorm-afbeelding toegepast op de eigen kwantielen van de steekproef, geen sigma die aan de steekproef is gefit en niet mediaan ± k·stdev, en het rapport zegt dat in een band_definition-string naast de getallen. stdev wordt voor de continuïteit uitgegeven en door niets gebruikt. Een kwantiel waarvan de C/N₀ al op of onder de trackingdrempel ligt, heeft geen eindige ontzeggende J/S; die kolommen worden als null uitgegeven met een geteld motief in plaats van als oneindig of als een afgekapte straal

seg-2d3944107ba0 = Detectievermogen van een integriteitsmonitor voor meerdere modaliteiten

seg-38bc7c0bfe57 = Het rapport hybrid-optical-rf stelt wat de chikwadraatmonitor voor meerdere modaliteiten werkelijk kan DETECTEREN, niet alleen dat hij een foutvrij geval doorstaat: de minimaal detecteerbare bias per bewaakte as (oost, noord, omhoog, klok) bij de opgegeven kansen op vals alarm en gemiste detectie van het scenario, de detectievermogenscurve aan weerszijden ervan, het ruisvrije biasveelvoud waarbij de gerealiseerde statistiek de drempel voor het eerst overschrijdt, en de tijd tot detectie voor een biasramp met een opgegeven snelheid. Fouten worden ook via de echte monitor geïnjecteerd en de statistiek die hij teruggeeft wordt naast de analytische voorspelling gerapporteerd

seg-38cabd4921c1 = Hergroei van de covariantie na de overdracht tegenover de alarmlimiet

seg-9287268bbada = Het rapport hybrid-optical-rf legt het procesruismodel van het filter bloot en stelt hoe lang de oplossing na de overdracht binnen de alarmlimiet blijft: voor beide overdrachtsrichtingen neemt het de covariantie per as die de overdracht heeft achtergelaten, propageert die vooruit onder een opgegeven randomwalk-procesruis, en rapporteert het tijdstip waarop de met dekking geschaalde 1σ de horizontale, verticale en tijdsynchronisatiealarmlimieten bereikt, welke limiet het eerst bindt, de verdubbelingstijdconstante van de variantie, en een bemonsterd coastprofiel dat de overschrijding omsluit. Procesruis-PSD's, de dekkingsfactor en de alarmlimieten zijn alle invoer met gedocumenteerde standaardwaarden

seg-a3b8272862aa = Antennepatroon buiten de boresight in de export van de maangeometrie

seg-27d246503a48 = De geometrie-export per satelliet bevat, per (epoch, satelliet), de hoek buiten de boresight BIJ DE SATELLIET en de zendversterking richting de locatie uit het echte patroon van een uniform belichte cirkelvormige apertuur (Airy), en rapporteert het aantal in de bundel onder dat patroon NAAST het aantal in de bundel onder de symmetrische benadering van versterking naar bundelbreedte (θ_3dB[deg] = √(31000/G_lin)), waarbij het verschil als expliciete correctie wordt uitgegeven in links, in satellieten per epoch en als slechtste enkele epoch. Beide impliciete apertuurrendementen van de benadering worden uitgegeven ({ "0.641" } tegenover de regel van { "70" }·λ/D graden waarmee ze wordt aangehaald, { "0.920" } tegenover een uniforme cirkelvormige apertuur), zodat het rendement dat ze stilzwijgend aanneemt wordt vermeld en niet afgeleid. Standaard uit: het blok verschijnt alleen wanneer zowel een exportlocatie als een apertuur is opgegeven

seg-6fbfa234ef3e = Verlies van lock in de trackinglus en spoof-pull-in onder interferentie

# c1: tracking-loop
seg-f78c1f28a3f7 = Verlies van lock berekend uit lusdynamica in plaats van uit een vermogensverhouding: thermische 1σ-jitter van de draaggolf (Costas) en de code (niet-coherent vroeg/laat) tegenover C/N₀ met het kwadrateringsverlies, tegenover de opgegeven regels 3σ_PLL + θ_e ≤ { "45" }° en 3σ_DLL + ramplag ≤ d/2 chips; C/N₀-drempels voor wegvallen en herlock met de bindende lus genoemd en de hysterese AFGELEID uit de bredere pull-in-bandbreedte en niet beweerd; de verklaarde tijd tot verlies van lock uit een lockdetector met twee drempels en bevestigingsverblijftijden, afzonderlijk gerapporteerd van de fysieke faseontsnappingstijd (gemiddelde tijd tussen cycle slips volgens Viterbi, in log₁₀ s omdat die honderden decaden beslaat); de grootste codeslew en draaggolf-Dopplersnelheid die de lussen van het slachtoffer kunnen volgen; en de ONTZEGGINGSSTRAAL die de lusdynamica impliceert, gerapporteerd naast de bestaande straal van de vermogensverhouding met hun verschil met teken als eigen benoemd veld. Uitvoerbaar als scenariosoort <c1/>

seg-0f4d023fe2d4 = Covariantie van coördinaten van een punt op het maanoppervlak uit een VLBI-vertragingsschema, gescheiden gehouden van die van het aardstation

# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Een derde datumkeuze, <c1/>, die elk aardstation vasthoudt en alleen de met de maan meedraaiende coördinaten van de BEACON schat — de configuratie waarvoor een onzekerheid van een punt op het maanoppervlak werkelijk wordt genoemd, omdat de coördinaten van aardstations een invoer van het vertragingsmodel zijn en geen onbekende ervan. Ze bestaat omdat de covariantie op stationsniveau en de covariantie van het oppervlaktepunt VERSCHILLENDE GROOTHEDEN zijn die door de hefboomarm ρ/B worden gescheiden, en niets eerder voorkwam dat de ene tegenover de andere werd genoemd. Het uitgegeven blok <c2/> bevat ρ, de langste basislijn, de hefboomarm, de oppervlaktepuntvorm van de gelijkverdelingslink c·σ_τ·(ρ/B)·√(g/N), de berekende sigma per coördinaat van de beacon en hun verhouding — de verhouding is null in plaats van misleidend wanneer de beacon niet wordt geschat of de matrix rangdeficiënt is. B wordt genomen als de LANGSTE aanwezige basislijn, de gunstigste, zodat de verhouding alleen kan onderschatten. Uitvoerbaar als <c3/> met <c4/>, wat wordt geweigerd met een bericht dat de ontbrekende invoer noemt wanneer de beacon niet wordt geschat

seg-0315968c8214 = Differentiële PNT op de maan — restbudget van de correctielink

seg-c6785166a44c = De drie termen die een differentiële correctie oploopt tussen de epoch waarop ze wordt berekend en de epoch waarop ze wordt gebruikt, elk eerder als ongemodelleerde marge gelaten: opmetingsfout van het referentiestation (gecorreleerd over satellieten, onafhankelijk van de basislijn, ~{ "1" }:{ "1" } positieoverdracht en aantoonbaar niet door DOP versterkt), veroudering van de correctie (de bevroren baanfoutvector opnieuw geprojecteerd op de zichtlijn waarop de eigen propagator van de engine de satelliet één latentie later plaatst, plus klokdrift c·σ_y(τ)·τ uit de gekalibreerde machtswet), en uniforme linkkwantisatie over een exacte volle schaal ±(orbit_err + clock_err) met variantie step²/12. Gerapporteerd in zowel het afstands- als het positiedomein, naast — nooit in plaats van — de bestaande rest en het beschermingsniveau, met een latentiecurve naast het enkele cijfer

seg-c42646ae4707 = Dekkings- en nauwkeurigheidskaart van referentiestations op de maan

# c1: lunar-station-coverage
seg-1f9834b32629 = Monte-Carlosweep van het differentiële PNT-model voor de maan over een gebruikersraster bij de zuidpool en een dag aan epochs (de soort <c1/>): voor een differentieel referentiestation op een bekende locatie bij de zuidpool, per punt en over het gebied, de percentielen van de gecorrigeerde en niet-gecorrigeerde positiefout (3D, horizontaal, verticaal), beschikbaarheid met een reden voor elke niet-beschikbare epoch (user_lt4, station_missing_sat), dekking tegenover een drempel die vóór de run is vastgelegd, DO-229E-beschermingsniveaus, de dekkingsstraal per azimutsector, en het budget van de correctielink bij het station en bij het slechtste punt. Geen uitspraak over de prestaties van enig echt systeem; niet verbonden aan of onderschreven door enig agentschap

seg-7ecf4b0038b0 = Terreinhorizonmaskers voor de maan uit een opgegeven profiel of een polaire DEM

seg-7102948907bc = Azimutafhankelijke horizonmaskers per locatie voor de soort lunar-station-coverage (het referentiestation en elk gebruikerspunt) en het raster van moonlight-service-volume en zijn exportlocatie per satelliet (elke exportrij krijgt clears_terrain), in het skylinetabelformaat van { "0.36" } (skyline::Skyline, lineair in azimut met wrap bij { "360" } graad; een opgegeven profiel en een DEM-horizon op één locatie combineren als hun puntsgewijze maximum): een opgegeven [terrain] station_horizon of user_horizon gelabeld met zijn bron, en/of een horizon die met raymarching is bepaald over een zuidpolaire stereografische DEM (de gridindeling van de LRO LOLA-polaire laag, gelezen uit een descriptor die zijn grootte en SHA-256 vastlegt, of een tegel realdata::lola_dem met lengte- en breedtegraad met [terrain] dem_tile_path, weergegeven met zijn SHA-256) langs grote cirkels van de maanbol met exacte kromming, vanaf een opgegeven masthoogte, met een opgegeven azimutstap en bereik. Een satelliet telt op een locatie mee wanneer hij het vlakke mask_deg en de horizon bij zijn azimut vrijmaakt (lunar_service::topocentric); een epoch waarin de horizon op een punt minder dan vier satellieten overlaat waar het vlakke masker er vier geeft, telt als de reden voor niet-beschikbaarheid terrain_masked. De meegeleverde DEM is een uitsnede van het publiekdomeinproduct LOLA LDEM_75S_240M, { "5" } x { "5" } blokgemiddeld geresampled tot { "1200" } m (data/lunar-dem/NOTICE.md). Bij afwezigheid behoudt elke locatie het vlakke masker en is elk document byte-identiek

seg-d37bb01e270b = Multipath- en ontvangerhardwaretermen van referentiestations op de maan

seg-1103199f019b = De optionele sectie [receiver] van lunar-station-coverage (LRS-02): elevatieafhankelijke multipath-sigma(el) = a + b exp(-el / el0) bij de gebruiker en bij het station (de RTCA-DO-229-vorm voor luchtvaarttoepassingen, met a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } graad als standaardwaarden; op de maan is elke waarde ILLUSTRATIVE), wit bij de gebruiker en eerste-orde-Gauss-Markov over epochs bij het station (rho = exp(-dt / tau)); thermische codeknoopruis van de vroeg-min-laat-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); inter-kanaalbiassen per kanaal die gedurende een trial constant zijn, bij de gebruiker en bij het station. Stationstermen gaan in zijn correcties, gebruikerstermen in de ruwe en gecorrigeerde metingen, elk op een eigen geseede stroom. Bij afwezigheid is elk document ongewijzigd

seg-03796cb741b6 = Groei van de efemeridefout van referentiestations op de maan over de correctielatentie

seg-13b0ae9a874a = De optionele invoer orbit_err_growth_m_per_s van lunar-station-coverage (LRS-03): een correctie die latency_s na haar berekening wordt toegepast, mist de groei g latency_s van de broadcast-baanfout, g isotroop met 3D-RMS-snelheid, per satelliet en trial getrokken op een eigen geseede stroom (bereik 1-sigma-snelheid tau / sqrt({ "3" })), bovenop de herprojectie van de bevroren fout op de zichtlijn. Bij afwezigheid is elk document ongewijzigd. Een K5-addendum bij de vergelijking met gepubliceerde claims, afzonderlijk vooraf geregistreerd, draait K5 bij { "0.001" }, { "0.01" } en { "0.1" } m/s (ILLUSTRATIVE)

seg-bbb1828b3db1 = Reducties van straatcanyon, sector en terrein tot een tabel

seg-2864aec7be88 = skyline: de straatcanyon in gesloten vorm (afkapping atan((h - a) / d) met d = (w/2) / abs(sin(az - s)), open uiteinden bij een eindige lengte), scherpe sectoren met de klok mee met omslag, en terreinpunten gereduceerd tot een tabel met de kromtedaling d^2/({ "2" } * 4/3 R); de skyline is hun puntsgewijze maximum met een eventuele tabel

seg-3f3d657854ce = Skyline-voorinstellingen (stadsstraat, havenaanloop, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: vier REPRESENTATIVE geometrieën met de opgegeven afmetingen uit de ontwerpnotitie en telkens een herkomstregel: city-street (een canyon, straat { "0" } deg, { "20" } m tussen muren van { "30" } m, antenne { "1.5" } m), harbour-approach (sectoren: open naar zee over { "180" } deg, kadegebouwen { "8" } deg over { "90" } deg, de golfbreker { "3" } deg), fjord (terrein: wanden { "600" } m boven de antenne op { "1.5" } km aan weerszijden van een noord-zuidgeul, kromtedaling toegepast), container-terminal (sectoren: stapels { "12" } deg over de landwaartse helft, kraanbomen { "35" } deg en { "25" } deg over twee smalle sectoren); veld voor veld te overschrijven

seg-6012113b4836 = Skygeometriefuncties: zichtbaarheid, DOP, covariantie, foutellips, Monte-Carlo-wolk

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> en <c2/>, Python- en WASM-functies met dezelfde namen, MCP <c3/>): vanuit een locatie, een tijdstip en constellatievoorinstellingen (of satellieten als azimut/elevatie of ECEF) de zichtbare en onder een skyline gemaskeerde satellieten, GDOP/PDOP/HDOP/VDOP/TDOP, de cofactor met eenheidsvariantie (H^T H)^-1 en de covariantie in oost-noord-omhoog met één ontvangerklok per systeem of één gemeenschappelijke, de horizontale foutellips (halve assen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), oriëntatie { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) vanuit het noorden), en n geseede kleinste-kwadratenfouten bij onafhankelijke Gaussische afstandsfouten met hun empirische covariantie, RMS en insluiting van { "95" } %. De cofactor is orbit::cofactor_from_los, de ene kern achter orbit::dop en orbit::dop_cov (dop is de reductie van dop_cov): geen tweede DOP-implementatie

seg-7f66be0f15c8 = Klok-holdover zonder GNSS

seg-4d8f87668a0f = Groei van de uitloopfout in gesloten vorm + holdover tot de drempel; kwantumklokklassen

seg-29b482d88916 = Gemeten klokapparaatkaarten (voorspelling op achtergehouden data)

seg-8c68c5b25004 = clock_library: een apparaatkaart (witte fase, witte, flicker- en random-walk-FM plus een lineaire frequentiedrift) gefit op een derde van een benoemde gemeten klokregistratie na een gelogde conditioneringsronde (hiaten, faseuitschieters, fasesprongen en bursts verwijderd; frequentiesprongen gelogd), gewogen met de via lag-1 geïdentificeerde vrijheidsgraden van het ruistype, en de voorspelde Allan-deviatie ervan beoordeeld op de achtergehouden twee derde; lezers voor RINEX- en IGS-klokbestanden, BIPM-bestanden per laboratorium en Circular T, sectie { "1" }; omzetting van een kaart naar het ruismodel voor slottiming, het uitgebreide Kalman-klokmodel en de ruisniveaus van de spoofingmonitor

seg-5097a0e6460d = Gemeten GPS Block IIF-klokkaarten met termen per omloop (voorspelling op achtergehouden data)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: een apparaatkaart die de fasetermen van één tot vier per omloop draagt (periode T/k, T = { "43 082.05" } s), samen met de kwadratische term gefit met kleinste kwadraten op een derde van een gemeten satellietklokregistratie, met per term de Allan-bijdrage in gesloten vorm { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } in de voorspelde Allan-deviatie

seg-0d72fcc0fbea = Schatting van de klokstoestand aan boord

seg-6db5391f8ebe = Kalman-klok met 3 toestanden (fase/frequentie/drift) volgens Van Loan, Joseph-gestabiliseerd

seg-3f0a9d7c2971 = Foutenbudget voor tijdoverdracht

seg-216f46b43860 = Tweewegs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand

seg-157fadeb5d67 = Navigatiesignaalmodulatie en analyse van codevolging

seg-ab633d191396 = BPSK-R/BOC-PSD, spectrale scheiding κ, Gabor-bandbreedte, DLL-jitter, multipad

seg-e6c08e1e6ae3 = Prestaties van kwantuminertiaalsensoren

seg-d28e1f6a430f = Cold-atom-interferometeraccelerometer vanuit de eerste beginselen (k_eff·T², QPN)

seg-4b79d03cecf5 = Franje-ambiguïteit en dynamisch bereik van kwantuminertiaalsensoren

seg-deb2850546d5 = Dynamisch bereik van de Mach–Zehnder-franje-ambiguïteit: de 2π-periodieke franjeuitlezing stelt een maximale ondubbelzinnige specifieke kracht a_max=π/(k_eff·T²) vast, en het ondubbelzinnige bereik in resolutiecellen a_max/σ_a=π/σ_Φ is onafhankelijk van de optische schaalfactor — de T²-gevoeligheidswinst kost ondubbelzinnig bereik in exact gelijke mate (de interrogatietijd ruilt resolutie tegen bereik, waarbij het aantal cellen vastligt door de faseruis van de uitlezing)

seg-d04bf321d4a1 = Veerkracht van kwantuminertiale dode rekening

seg-c4989abb5d40 = Samengesteld positiebudget van bias + schaalfactor + VRW + stabiliteitsverval over de holdover

seg-5692c7b936b6 = Veerkracht tegen jamming zonder GNSS

seg-f4ff77caa47b = Geometrische J/S-linkbudget, anti-jam C/N₀, verlies van lock per satelliet

seg-ff90679d1de9 = Spoofingdetectie

seg-b843f63e77e6 = Klokgestuurde χ², RAIM, AGC, SQM, per epoch gefuseerd tot een kwaliteitsmaat voor beveiliging

seg-b10d07921f5e = Beschermingsniveau voor tijdsynchronisatie onder spoofing

seg-2a829711b997 = Grens in gesloten vorm voor de ongunstigste niet-gedetecteerde tijdfout = monitorvloer + uitloop-σ van de oscillator over de CUSUM-detectielatentie, gerapporteerd als een band voor de rode-ruisvloer

seg-f1d49eac89f8 = Alternatieve en aanvullende PNT

seg-023dda973f66 = Zwaartekrachtkaartvergelijking, terreingebonden navigatie (TERCOM/SITAN), magnetische anomalie

seg-791e7285c291 = Reproduceerbaarheid en softwarezekerheid

seg-7177355a482c = Deterministisch, scenario-gehasht, SBOM + platformoverschrijdende golden gates

seg-241f2eeaef12 = Gelabeld synthetisch corpus van verstoringen + detectoronafhankelijk raamwerk voor ROC/AUC/verwarring/Pfa-Pmd; lekbewaking, gestratificeerde splitsing, rapport over optimisme bij distributieverschuiving (binnen versus buiten het regime). Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Gecontroleerd synthetisch onderzoek naar de optimismekloof in AUC tussen in-distributie en buiten-distributie voor detectoren met gepubliceerde methoden en getrainde detectoren (logistische regressie / MLP met één verborgen laag): trends van schaalwetten per klasse (Spearman ρ + helling op { "1" }−ernst) en een ridge-voorspeller alleen op ID-gegevens die de kloof schat uit diagnostiek binnen de distributie, beoordeeld met leave-one-detector-out en leave-one-class-out. Reproduceerbaar via <c1/>

seg-fd6424213d1f = Afweging kwantum versus klassiek voor PNT en veerkracht zonder GNSS ({ "13503" })

seg-21b2b54200a8 = Inlezen van gemeten ADEV (NNLS), afwegingstabel (holdover voor tijdsynchronisatie/inertiaal + voordeel), veerkracht-versus-tijd-omhullende; voorbehoud over de vloer meegedragen op het artefact. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Ruimteweeromgeving en door activiteit aangedreven thermosferische dichtheid

seg-47308f611c7e = Zonne- en geomagnetische indices (definitorische Kp↔ap-tabel), de exosferische temperatuur van Jacchia-1971 en de thermosferische dichtheid van Jacchia { "1971" } (SAO Special Report { "332" }: statische diffusieprofielen die zijn tabel { "7" } reproduceren, met de dagelijkse, geomagnetische, halfjaarlijkse, seizoens-breedtegraad- en heliumvariaties) tegenover de statische USSA76-atmosfeer. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Lanceervenster en geometrie van de opstijging (missieanalyse)

seg-6066c634faba = Lanceerazimut(en) voor twee lichamen (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, oostwaartse bonus van de aardrotatie, Δv voor een vlakwijziging met dogleg en dagelijkse kansen, en, bij een gegeven epoch en IERS-finals2000A-rijen, de snelheid van het station om de ware pool (launch::site_rotation_speed_at). Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistische terugkeercorridor (Allen–Eggers)

seg-c3f3422f96e4 = Piekvertraging (onafhankelijk van de ballistische coëfficiënt), snelheid en hoogte bij de piek-g, en snelheid bij piekverhitting voor een ballistische intrede in een exponentiële atmosfeer. Uitvoerbaar vanuit de CLI/bindings als scenariosoort <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptieve codering en modulatie van DVB-S2 langs een LEO-downlinkpassage

seg-3912fb8ccb15 = Es/N0 van de downlink langs elke passage van één satelliet boven één station (EIRP, vrijeruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, constante van Boltzmann, symboolsnelheid), de efficiëntste DVB-S2-MODCOD die bij elke stap de quasi-foutvrije drempel van ETSI EN { "302" } 307-1 V1.4.1 tabel { "13" } plus een implementatiemarge haalt, het ACM-datavolume van de passage, en de basislijn met constante codering die sluit bij het masker en de grootste afstand. Uitvoerbaar als scenariosoort <c1/>. Illustratieve invoer; MODELLED.

seg-19603a7e0fe8 = Planning van grondcontacten voor meerdere satellieten en meerdere stations met conflictoplossing

seg-40edeae6e48b = Kandidaatcontacten uit elke satelliet-stationpassage met haar ACM-datavolume; conflicten waar één antenne twee satellieten binnen haar omsteltijd zou bedienen of één satelliet naar twee stations tegelijk zou downlinken; een met prioriteit gewogen leveringsdoelfunctie begrensd door de achterstand van elke satelliet; een lui plan met marginale waarde volgens het greedy-principe, een first-come-basislijn en een exacte branch-and-bound op maximaal { "26" } kandidaten, waarbij de optimaliteitskloof van het greedy-plan wordt gerapporteerd. Uitvoerbaar als scenariosoort <c1/>. Illustratieve invoer; MODELLED.

seg-3742d2aea62a = Sobere kader voor kosten per dekking / ROI

seg-4228311689f8 = Kosten per procent dekking + dekking per euro (ROI) over de engine voor constellatiedimensionering; de kosten per satelliet zijn een door de aanroeper aangeleverd bereik laag/nominaal/hoog (geen verzonnen prijzen)

seg-8ba6ee9acc8a = Integriteitseffect van gemiste detectie (contextbewuste HPL/VPL tegenover alarmlimiet)

seg-f5985399d0d5 = Zet een niet-gedetecteerde spoof- of jam-bias om in effectieve fout → Stanford-gebied (beschikbaar/niet beschikbaar/MI/HMI) tegenover contextspecifieke HAL/VAL (open lucht versus stedelijk)

seg-37d43b5b918a = Parameterblad met geciteerde foutmodellen voor CAI ({ "13503" })

seg-0b6a901f5ad2 = Prestaties van cold-atom-interferometers in een bereik (best/nominaal/conservatief) — biasinstabiliteit, snelheids-/hoekrandomwalk, stabiliteit van de schaalfactor, door de interrogatie beperkte samplefrequentie, dynamisch bereik door franje-ambiguïteit — elk herleidbaar tot een bron; voedt QuantumNavBudget zonder hardware te modelleren

seg-c93f2d3a3167 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — epochclassificator voor het Stanford-integriteitsdiagram

seg-712d5c35a6a6 = TIB: epochclassificatie volgens het Stanford-integriteitsdiagram (nominaal / niet beschikbaar / MI / HMI)

seg-573aa0193cb3 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — scorer voor integriteitsdekking

seg-4d86f3c2d8f5 = TIB: scoring van integriteitsdekking (HMI/MI/beschikbaarheidspercentages + oordeel over overbound-dekking)

seg-372dd0fdb025 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — foutencatalogus (parametrische generatoren)

seg-2604e7cf27d2 = TIB-foutenmenu (domeindivergentie, klokslam, holdover-uitloop, statische/incrementele/symmetrische/asymmetrische vertraging, replay binnen versheid, padselectief, k-uit-N-quorum)

seg-90c0eb1e7c14 = Benchmark voor het toetsen van tijdsynchronisatie-integriteit — oordeel over absorptie van niet-detecteerbare fouten

seg-f713acf042ff = TIB: oordeel over absorptie van niet-detecteerbare fouten (symmetrisch/replay moet door het PL worden geabsorbeerd en nooit als gedetecteerd worden gemeld)

seg-8adbbd2cdb74 = Zelfbeschrijving van het hybride optische/RF-rapport

seg-2a5e48b558e1 = Het hybrid-optical-rf-rapport vermeldt de linkconfiguratie waarmee het daadwerkelijk is gerund (golflengte van de draaggolf, zend- en ontvangstapertuur, afstand, pulsbreedte, integratietijd, rendementen en verliezen, standaardwaarden ingevuld) en bevat een eenhedenblok met de eenheid en herkomstklasse van elke grootheid die een artikel waarschijnlijk citeert, inclusief de sporen van de overdrachtscovariantie in vierkante meter

seg-0691f3dee8cb = Beschikbaarheid van de hybride optische/RF-link aan de RF-kant

seg-72ccb655caf0 = Het hybrid-optical-rf-rapport vermeldt een beschikbaarheid van de RF-link, samengesteld uit grootheden die de engine al berekent en niet uit een geïmporteerde klimatologie, en vermeldt de samenstelling als een benoemde regel: A_rf = I_closure * I_track, waarbij I_closure het sluitingsoordeel is van het eenrichtingslinkbudget volgens CCSDS-401 / DSN-810-005 (linkbudget::link_budget, Eb/N0-marge >= { "0" }) op de eigen afstand van het scenario en I_track het oordeel over de trackinglus (jamming::lock_status) op de C/N0 die ditzelfde budget opleverde. Elke factor draagt de herkomstklasse van zijn invoer door naar de uitvoer, en de factoren die bewust NIET in het product zitten -- geometrische zichtbaarheid, interferentieontkenning en een klimatologie van RF-uitval -- worden met de reden benoemd en niet stilzwijgend op { "1" } gezet. De opgeloste RF-tak wordt als eigen blok rf_link_configuration herhaald, en de continue cijfers naast de indicator (linkmarge, C/N0-marge, de afstanden voor sluiting en tracking in gesloten vorm, en het afstandsgebruik) zijn de afstandsinversies van hetzelfde budget. Het rapport vermeldt volledig, op het blok en in de eenhedenregel waar een lezer terechtkomt, dat dit cijfer MARGE-/GEOMETRIEBEPERKT en DETERMINISTISCH is, terwijl optische beschikbaarheid DOOR WEER/KLIMATOLOGIE BEPERKT en probabilistisch is, zodat de twee nooit als een vergelijkbaar paar percentages kunnen worden aangehaald

seg-22c5df9b6c7c = Vergelijking van optische en RF-afstandsmeting onder gelijke voorwaarden

seg-70eb396f40af = Het hybrid-optical-rf-rapport geeft de verhouding tussen optische en RF-afstandsmeting met de ENE configuratie waarop beide takken zijn geëvalueerd in hetzelfde object: hetzelfde eenrichtingspad, dezelfde afstand en dezelfde accumulatietijd. De optische tak is de door fotonen beperkte ToA-CRLB van de engine op het fotonenaantal in één richting; de RF-tak is de thermische codevolgjitter van de DLL (early-late) van de engine bij de C/N0 die het eigen linkbudget van de engine teruggeeft voor diezelfde afstand in één richting. De luslbandbreedte voor ruis is afgeleid, niet gekozen: B_L = 1/({ "2" }*integration_s) zet de RF-tak precies op de optische accumulatietijd, en als een aanroeper deze overschrijft zodat de twee middelingstijden verschillen, wordt de verhouding REFUSED -- null, met het verschil en beide tijden benoemd -- en niet op twee werkpunten aangehaald. Er wordt geen verhouding gevormd tegen de GEKOZEN parametrische rf_position_sigma_m van het scenario, en de weigering zegt waarom: die invoer draagt helemaal geen configuratie. De vrijgegeven optische kerncijfers voor twee richtingen en de exacte factor die dit met de tak voor vergelijking in één richting verbindt worden naast de verhouding uitgegeven, zodat het rapport niet kan worden gelezen als twee tegenstrijdige optische sigma's

seg-3f26f598e013 = Zelfbeschrijving van het linkbudgetrapport

seg-b88bf41d6d4c = Het linkbudgetrapport vermeldt elke absolute constante waaruit zijn eigen marge is berekend -- de draaggolffrequentie die voor het vrijeruimteverlies is gebruikt, de EIRP, de kwaliteitsmaat, het samengevoegde verlies en de Boltzmann-term -- plus de vereiste G/T waarbij de marge nul is, de linkconstante (EIRP - verliezen - vereiste Eb/N0) die de enige combinatie is die een gepubliceerde tabel met snelheid en versterking ooit kan vastleggen, en, wanneer een aanroeper een systeemruistemperatuur opgeeft, de versterking van de ontvangstantenne die die kwaliteitsmaat impliceert

seg-a7b192e27cb5 = Tabel van het kruispunt in maantijd per klokklasse

seg-cab605dc6ea2 = Eén run voor het maantijdbudget geeft per klokklasse een rij met het kruispunt van klok en stelsel tegenover één gedeelde stelselterm, zodat de klok de enige variabele in de vergelijking is; elke rij draagt het kruispunt op twee manieren bepaald -- door bisectie uit de algemene machtswetcurve van de tijdfout en algebraïsch geïnverteerd uit het dominante ruistype van de rij -- met het relatieve verschil ertussen

seg-18c72a7565d6 = Opnamefootprint tegenover hoogte en bundelbreedte

seg-9c30a0ab5233 = Tweeassige sweep van de patroongewogen, door hoogte begrensde footprint van de oppervlakteopname over zendhoogte en schotelafmeting, per werkpunt één rij uitgegeven met de halfvermogensbundelbreedte die elke diameter impliceert, en de opname aan de limb gerapporteerd als een DREMPEL -- per rij de J/S aan de limb, de marge ervan en het zendvermogen dat haar zou sluiten; per raster de gevonden doorgangen, of een expliciete verklaring dat de limb nergens op het raster wordt bereikt, met het tekort

seg-fc0a64b9a280 = Reproduceerbaarheid van het tijdfoutenbudget voor de maan

seg-5d5970506b9c = Het scenario voor het maantijdbudget publiceert zijn reeksuitvoer als een tabel in lange vorm (rasterindex, middelingstijd, term) naast het rapport, zodat de zeven curven x(tau) per term en het totaal als wortel uit de kwadratensom engine-uitvoer zijn en niet iets wat een lezer uit de methodesectie opnieuw opbouwt

seg-675887733454 = Laboratorium voor maanstationstijd: holdover van miniRAFS tegenover LTC

seg-7dfedc40da6a = Het optionele blok [time_lab] van het scenario voor het maantijdbudget modelleert een referentieklok van een maanstation (standaard de klasse miniRAFS, of een andere benoemde klasse, of een apparaatkaart gefit op opgegeven stabiliteitspunten) die op Coordinated Lunar Time wordt gestuurd en daarna vrij loopt of elke N seconden opnieuw wordt gestuurd: de tijdfoutcurve x(t) als wortel uit de kwadratensom van de machtswetterm van de klok, een constant stuurresidu (ILLUSTRATIVE), een constant residu van de LTC-realisatie en een optionele term voor de snelheid door de stationshoogte; de tijd na een sturing tot { "1" }, { "10" } en { "100" } ns (of opgegeven drempels) door bisectie naast de inverse in gesloten vorm voor het dominante ruistype, en de dominante term bij elke opgegeven horizon, alles met eenheden

seg-af3ff120b707 = Geodetische VLBI op de Maan

seg-cfd7d0126028 = Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt + partiële afgeleiden

seg-e08e98908f3a = Aarde-GNSS op maanafstand

seg-dd8ce373d1f6 = Ontvangst van Aarde-GNSS op maanafstand: de zwaksignaallaag die tabel { "1" } van P7 noemt en waarvoor de engine geen model had. Per satelliet en per epoch berekent hij de hoek buiten de boresight ten opzichte van het nadir van de zender, of de Aarde het rechte pad occulteert, de schuine afstand en het vrijeruimteverlies ervan, de zendversterking bij die hoek, het ontvangen vermogen en de draaggolf-ruisdichtheid; vervolgens aggregeert hij alleen de links die een trackingdrempel halen, en doorloopt hij een volledige omloop van de constellatie zodat het antwoord een VERDELING is en geen enkele momentopname. Drie feiten sturen het resultaat en het rapport vermeldt elk ervan: de Aarde beslaat { "13.90" } deg vanaf de constellatiestraal, zodat de PIEK van de bundel geometrisch niet beschikbaar is voor elke naar de Maan gerichte straal; wat overblijft is de rand van de hoofdlob en de zijlobben, het regime waarin LuGRE in { "2025" } bij de Maan werkte; en het L1-padverlies is ongeveer { "208" } dB, zo'n { "25" } dB meer dan een aardse gebruiker betaalt. MEASURED op de meegeleverde geometrie van 24 satellieten van GPS-klasse over { "64" } epochs van één omlooptijd: beschikbaarheid van het SIGNAAL { "0.375" } met een beste link van { "30.93" } dB-Hz, en beschikbaarheid van de POSITIEBEPALING { "0.000" } - hoogstens twee gelijktijdig volgbare links, nooit de vier die een positie nodig heeft. De scheiding van die twee beschikbaarheden is het punt, en het rapport laat niet toe dat ze door elkaar worden gehaald: Aarde-GNSS op maanafstand is een laag van TIJDSYNCHRONISATIE-niveau, niet van positieniveau, en een voorafgaande kans voor gelaagde veerkracht moet de beschikbaarheid van de positiebepaling nemen. De conditionering wordt om dezelfde reden uitgegeven - elke zichtbare satelliet ligt binnen een kegel van enkele graden breed gezien vanaf de Maan, dus de zichtlijnen zijn van nature bijna evenwijdig. Uitvoerbaar als de soort <c1/> Herformuleerd volgens D7: de bewering op maanafstand is de RELATIEVE draaggolf-ruisdichtheid tussen satellieten op één epoch, uit gemeten tweedimensionale zendpatronen (NAVCEN Block IIR/IIR-M), plus geometrische zichtbaarheid; absolute C/N0 wordt niet beweerd (Parker et al. melden een gemeenschappelijk verlies van { "7" } tot { "12" } dB).

seg-29df5b40a3f9 = Baanbepaling bij de Maan: Aarde-GNSS tegenover radiometrie vanaf de grond

seg-647902ebcee3 = Baanbepaling in een bijna-rechtlijnige halobaan (of een elliptische bevroren baan) uit twee onafhankelijke datatypen: aan boord ontvangen Aarde-GNSS-pseudoranges (de linkregel van de rij Aarde-GNSS op maanafstand, plus occultatie door de Maan) en tweewegs-afstand en -afstandssnelheid vanaf de grond van drie stations van het Deep Space Network. Elk is een batch-kleinste-kwadraten in één stap rond de referentiebaan met zijn formele covariantie; een geseede Monte-Carlo van het verschil tussen de twee schattingen toetst of de twee covarianties het verklaren (q = d' (P_G + P_R)^-1 d, chi-kwadraat met zes vrijheidsgraden wanneer de modellen overeenkomen) en wat een ongemodelleerde versnelling met de statistiek doet.

seg-652bdc29deea = Ambiguïteitsoplossing van de draaggolffase bij de Maan: oppervlak en orbiter

seg-02496f9e9af2 = Tussen ontvangers enkelvoudig gedifferentieerde Aarde-GNSS-draaggolffase en -code bij een maanoppervlaktestation en een orbiter, met het klokverschil per epoch weggeprofileerd, één ambiguïteit per ononderbroken passage en de langste passage als ijk. De covariantie van de float-ambiguïteit is een Schur-complement; LAMBDA lost de gehele getallen op, de bootstrapped-slagingskans wordt naast een geseede Monte-Carlo-slagingskans voor geheeltallige kleinste kwadraten en de float- en vaste positiesigma's gerapporteerd. Gerapporteerd zoals gevonden: bij de geregistreerde { "12" } dBi is het dubbelverschilprobleem niet te vormen (amendement { "1" } verplaatste de standaard naar { "25" } dBi nadat alleen beschikbaarheidstellingen waren gezien), en bij { "25" } dBi wordt geheeltallig vastleggen NIET bereikt - buiten bereik (hoogstens enkele procenten) hoewel de float-oplossing met de boog verbetert.

seg-11dd1bb8e4e1 = Co-schatting van het maanstelsel: oppervlaktestations en orbiters

seg-a38c8d95e6c9 = Fisher-informatie van het maanstelselsdatum met zeven parameters uit laserafstandsmeting van Aardestations naar alleen de vijf reflectoren en met toegevoegde afstanden van orbiter naar oppervlaktestation: de informatiematrix, de rang, Cramér-Rao-sigma's, de ontaardingsmaat van de identificeerbaarheidsmodule van de Maan en geseede willekeurige stationsverzamelingen. De baan wordt bekend verondersteld in de maanassen (de fout ervan wordt gedragen door de afstandssigma van de orbiter).

seg-862977c4bb01 = Precisie van de stelselkoppeling in de ruimte: samengeplaatste GNSS, VLBI en laserafstandsmeting

seg-a9ae8e99f00d = Cramér-Rao-precisie van de translatie-, schaal- en rotatieverschillen tussen technieken tussen GNSS-, VLBI- en laserafstandsstelsels wanneer één ruimtevaartuig alle drie draagt, met de positie van het ruimtevaartuig op elk epoch geëlimineerd en negen storingsparameters voor de lokale koppeling met een prior, gevarieerd over de nauwkeurigheid van de lokale koppeling. Covarianties via de vierkantswortelroute (normaalvergelijkingen verliezen de cijfers wanneer de technieken bijna perfect zijn).

seg-ae627996875e = Gevoeligheid voor Love-getallen en libratie van de Maan

seg-28780d07c4a7 = Fisher-informatie van h2, k2, l2 en de fysieke libratieamplituden uit laserafstandsmeting (radiale en horizontale getijverplaatsing, rotatie van reflectoren), orbitertracking (de k2-versnelling van graad 2 geïntegreerd langs de zichtlijn, trend verwijderd), een oppervlaktegravimeter (gravimetrische factor { "1" } + h2 - { "1.5" } k2) en een oppervlakteklok (fractionele snelheid ({ "1" } + k2 - h2) W2/c2, gekoppeld aan de maantijdconstanten). Nominale waarden van h2 en l2 zijn linearisatiepunten; het onderzoek zegt waarvoor wat gevoelig is, niet wat de getallen zijn.

seg-da712b740519 = Verbetering van de DOP met bakens op het maanoppervlak

seg-83e6341e01b1 = Door bakens verbeterde dilution of precision voor een gebruiker op het maanoppervlak: de zichtlijnrijen van zichtbare satellieten en de afstandsrijen van zichtbare oppervlaktebakens worden samengevoegd tot één ontwerpmatrix en geëvalueerd via de gedeelde DOP-kern, en de resulterende DOP wordt afgebeeld op een gerealiseerde nauwkeurigheid van 1 sigma IN METERS via een gebruikersequivalente afstandsfout per baken, samengesteld als de wortel uit de kwadratensom van termen voor kloksynchronisatie, multipad en opmeting. De zichtbaarheid van bakens is de geometrische horizon met twee hoogten op de luchtloze Maan, die geen refractieve uitbreiding heeft en daarom exact is in plaats van bij benadering. Uitvoerbaar als de scenariosoort <c1/>, die satellieten alleen, satellieten plus bakens en een grotere constellatie als concurrerende route naar dezelfde geometrie rapporteert. MEASURED op de meegeleverde gouden geometrie (gebruiker op -80 deg, drie opgemeten bakens, illustratieve LCNS met zes satellieten bij t={ "0" }, masker van { "5" } deg): { "5" } zichtbare satellieten geven PDOP { "9.6941" } en een 3D-1-sigma van { "11.222" } m; het toevoegen van de bakens die de horizon werkelijk halen geeft PDOP { "4.1160" } en { "4.765" } m, een factor { "2.355" }; de dienst met 24 satellieten geeft in plaats daarvan PDOP { "2.4226" } en { "2.804" } m, een factor { "4.002" }. Het rapport drukt het aantal ZICHTBARE bakens af en niet het ingestelde aantal, en op deze geometrie haalt slechts ÉÉN van de drie bakens de horizon: de twee flankerende locaties liggen ongeveer { "333" } km van de gebruiker tegenover een horizon van { "86" } km voor een antenne van { "2" } m, zodat een lezer nooit hoeft aan te nemen dat alle drie hebben bijgedragen

seg-845e9f5eec81 = Beschermingsniveau voor gemeenschappelijke modi en totale integriteitsomhullende

seg-90307f07e0ef = Oplossingsmodi van het maanreferentiestation: hoogtebeperking, drie satellieten, venster voor een statische gebruiker

seg-366c7ad03fb2 = De optionele sectie [solution] van lunar-station-coverage (LRS-06): een pseudo-meetrij voor de hoogte up . dx = e_h met een opgegeven 1-sigma, gewogen tegen de afstandsrijen, een minimum van drie satellieten dat alleen met deze rij is toegestaan, en een gewogen kleinstekwadratenoplossing over de laatste window_epochs epochs met een gedeelde statische positie en één klok per epoch (het antwoord van een filter voor een statische positie zonder procesruis over dezelfde data; de fouten van de epochs worden als onafhankelijk behandeld). Zonder deze sectie blijven de snapshot-oplossing en elk document ongewijzigd. Een addendum bij de vergelijking met gepubliceerde claims, met de oplossingsstijl van de bronnen, alleen vooraf vastgelegd

seg-611ba369ed00 = Nauwkeurigheid en dekking van het maanreferentiestation tegenover gepubliceerde claims

seg-4fe4f1cffa2b = Het soort lunar-station-coverage, uitgevoerd onder de openbare aannames van het gepubliceerde materiaal over een differentieel maanreferentiestation (vier navigatiesatellieten in bevroren elliptische banen van { "24" } h, { "10" } m { "95" } % SISE, { "0.30" } m codeniveauruis, correctielatentie van { "1" } s en { "600" } s, een stationsopmeting op sub-decimeterniveau, de gepubliceerde voorbeeldlocatie van het station, de zuidpoolcirkels van { "300" } km en { "600" } km) en getoetst aan de numerieke claims van de bronnen onder zes eenzijdige drempels die vóór de run zijn vastgelegd: dekking van de hele zuidpool op p95 beneden een meter (K1, K2), gecorrigeerde p95 beneden een meter en op decimeterniveau (K3, K4), beneden een meter behouden bij { "600" } s latentie (K5), en nauwkeurigheid behouden van { "10" } km tot { "500" } km basislijn (K6)

seg-7bfcb5c6a985 = ARAIM met gelijktijdige foutenhypothesen voor meerdere satellieten

seg-15043111e437 = araim_reference::add_v42_subset_plan: de bepalingsregel voor deelverzamelingen van ADD v4.2 (P_THRES, FC_THRES, bewaakte deelverzamelingen met de minste verwijderingen eerst), gegeneraliseerd van paren naar gelijktijdige combinaties van maximaal max_order satelliet- en constellatiegebeurtenissen, met de exacte prior P_no fault prod q_e; add_v42_protection_levels_to_order voert het pad voor beschermingsniveaus van ADD v4.2 erop uit (orde { "2" } is precies het bestaande pad). raim::araim_subset_raim (opt-in): geavanceerde RAIM over die hypothesenverzameling, elke bewaakte deelverzameling als één modus (p_fault, T, b, sigma) in de som van het integriteitsrisico, niet-waarneembare deelverzamelingen verplaatst naar het niet-bewaakte risico, het budget geschaald met de ADD-allocatie van het niet-bewaakte risico, en de deelverzameling met de grootste genormaliseerde scheiding gerapporteerd wanneer een fout wordt gedetecteerd. Priors die diepere deelverzamelingen nodig hebben dan max_order worden geweigerd, nooit afgekapt

seg-48ca01332f8f = RAIM naast de kwaliteitsmaten voor klok-holdover

seg-890f1006a75d = De optionele sectie [integrity] van het kloksoort (clock_integrity::run): vanuit een opgegeven locatie en constellatievoorinstellingen (geometry::sky_geometry), op elk integriteitsepoch terwijl de GNSS-tijdlijn niet wordt geweigerd, snapshot-RAIM (raim::snapshot_raim: pariteit-chikwadraattoets, beschermingsniveaus op basis van de helling) op de satellieten boven het masker met gezaaide gaussische residuen van de opgegeven sigma en een optionele opgegeven bias; een afzonderlijk blok integrity_fom met verdicten per epoch, beschermingsniveaus en beschikbaarheid. Geweigerde epochs worden als niet beschikbaar gerapporteerd, nooit geëxtrapoleerd; de kwaliteitsmaten voor holdover blijven ongewijzigd en zonder de sectie is de uitvoer byte-identiek

seg-9cbb4ee7588a = Ruimtelijke, ruisbevattende observeerbaarheid van de booglengte voor meerdere cislunaire families

seg-5ebd771deef8 = De drempel voor de observeerbaarheid van de cislunaire booglengte in de RUIMTELIJKE CR3BP met zes toestanden in plaats van de vlakke met vier toestanden, over DRO-, L2-halo- en L2-bijna-rechtlijnige-halofamilies, met meetruis die in de Gramiaan doorwerkt en TWEE criteria gerapporteerd omdat er geen enkel eerlijk criterium bestaat: het gepubliceerde rangcriterium, dat aantoonbaar invariant is voor een homoscedastische meetsigma (witmaken vermenigvuldigt de observeerbaarheidsmatrix met een scalair, waardoor het relatieve singuliere-waardenspectrum en dus rang, defect en conditie ongewijzigd blijven), en een schatbaarheidscriterium — de eerste boog waarop de formele 1σ-positieonzekerheid van de begintoestand van de chief onder een opgegeven grens komt — dat wel met de ruis meebeweegt. Elke drempel draagt het bracket in het epochraster waarin hij ligt; een niet bereikt criterium is null met een reden. De vlakke modus blijft de standaard en families buiten het vlak worden daar geweigerd in plaats van platgeslagen tot een toestand die ze niet kan weergeven

seg-e250321394bc = Voorspelfout van de aardoriëntatie in operationele stijl, gemeten voorspeld tegenover definitief

seg-0e443d241460 = Een kleinstekwadraten-fit van bias plus snelheid over een meelopend venster plus de voornaamste periodieke termen — jaarlijks, halfjaarlijks en de twee voornaamste zonale getijden voor UT1; Chandler, jaarlijks en halfjaarlijks voor de pool — geëxtrapoleerd met de laatste residu binnen het venster doorgetrokken: de klasse die IERS Bulletin A gebruikt, in plaats van de persistentievoorspeller waarop de gepubliceerde horizon berustte. Op de enige eerlijke manier beoordeeld: een voorspelling voor T+h opgebouwd uit snelle Bulletin A-rijen op of vóór T, gemeten tegen de LATER GEPUBLICEERDE definitieve Bulletin B op T+h, met persistentie beoordeeld over dezelfde epochverzameling tegen dezelfde definitieve waarden ernaast. Een doelepoch zonder gepubliceerde definitieve waarde wordt weggelaten in plaats van opnieuw tegen de snelle kolom te worden beoordeeld; een periodieke term die het venster niet kan vastleggen wordt als verworpen gerapporteerd, met de cycli die hij werkelijk beslaat; een onvolledig venster wordt geweigerd in plaats van stilzwijgend ingekort

seg-f4efd94dd746 = Maandatum van het referentiestelsel uit een waarnemingscampagne

# c1: lunar-frame-campaign
seg-a6972eb89d7d = Het Helmert-datum met zeven parameters, voortgeplant vanuit een GESIMULEERDE WAARNEMINGSCAMPAGNE in plaats van teruggevonden uit een geïnjecteerde transformatie. Aardstations observeren een bronvermelde catalogus van bakens op het maanoppervlak volgens een expliciet schema; de partiële afgeleiden van de lunar-VLBI-vertraging worden opgeteld tot een Fisher-informatiematrix van de baakencoördinaten en doorgerekend via het Helmert-ontwerp A = [I₃ | [p]ₓ | p] naar H = AᵀM_bA, zodat de gerapporteerde datumnauwkeurigheid een functie is van het waarnemingsprogramma — exact lineair in de vertragingssigma en monotoon in de boog via de libratie die het rapport METEN. Het datumdefect is het onderwerp en geen voetnoot: rang, defect, conditiegetal, spectrum, niet-waarneembare richtingen in de basis van zeven parameters, de zwakste richting zelfs bij volledige rang en het aandeel van elke parameter daarin worden bij elke run uitgegeven, en elke parameter die de campagne niet vastlegt wordt gepubliceerd als NULL met een status. Baakfoutcorrelatie wordt MEASURED en niet aangenomen — exact nul met vaste stations, en met haar kosten afgedrukt wanneer de stations worden geschat. Uitvoerbaar als het scenariosoort <c1/>

seg-ca481f2d8f9e = Bevestiging door een onafhankelijke schatter van de drempel voor de cislunaire booglengte

# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Een batch-kleinstekwadratenschatter die de begintoestand van de chief TERUGVINDT uit gesimuleerde metingen tussen satellieten over groeiende prefixen van hetzelfde epochraster dat de tabel van rang tegenover boog gebruikt, met de partiële afgeleiden van de metingen genomen als centrale eindige verschillen van het samengestelde voorwaartse model. Hij gebruikt niets van de machinerie waarmee de drempel is gemeten — geen analytische Jacobiaanrij, geen variationele toestandsovergangsmatrix, geen singuliere-waarden- of eigenwaardenontbinding, geen ranktolerantie, geen square-root-informatiefilter — en deelt alleen de dynamica, de beginvoorwaarden, de scalaire observabele en het epochraster, elk genoemd in het uitgegeven document. Twee criteria, beide doorgerekend: terugvinden zonder ruis (het analogon van rang) en Monte-Carlo-schatbaarheid (het analogon van schatbaarheid, gemeten tegen een bekende waarheid in plaats van voorspeld uit een covariantie). Uitvoerbaar als het scenariosoort <c1/>

seg-f839285852d9 = Maanservicevolume uit echte, opgehaalde constellatiegeometrie

# c1: ephemeris_path
seg-c3059fcced49 = Accepteert een getabelleerde maancentrische toestandsefemeride (de evaluatie van een SPK/BSP-kernel) of een gepubliceerde constellatiedefinitie achter <c1/>, voert dezelfde sweep van dekking / DOP / beschermingsniveau erop uit en geeft de daaruit volgende eis aan de σ_URE-afstandsmeting NAAST de ongewijzigde illustratieve Kepler-resultaten en de resultaten met verstoringen, met het verschil als eigen benoemde grootheid. Elk cijfer draagt een herkomstklasse die uit een kernel afgeleid onderscheidt van uit gepubliceerde elementen afgeleid en van gemodelleerd, zodat de twee in een latere aanhaling nooit kunnen worden verward

seg-36a6cfaf5afa = Eenheid en herkomst vastgelegd voor elke gerapporteerde grootheid

# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Een machineleesbaar schema dat eenheid, herkomstklasse en definitie geeft voor elk numeriek veld van elk scenariorapport, plus één globale poort die elk geregistreerd scenariosoort uitvoert en faalt als een uitgegeven numeriek veld een van beide mist. Het herkomstvocabulaire is gesloten en elke klasse draagt een bewijsniveau, waarbij twee klassen bewust zijn afgebeeld op <c1/> en <c2/> in plaats van een niveau te krijgen dat de klasse niet bepaalt

seg-c815cb90dcde = Geodesie van het maanreferentiestation: toegevoegde retroreflector en VLBI-baken tegenover het datum met vijf arrays

seg-103cf21173ac = De optionele invoeren extra_reflectors en extra_beacons van het scenario lunar-llr-datum voegen een blok station_geodesy toe: de Helmert-informatie van de vijf arrays uit het gearchiveerde deel met maanlaserafstandsmeting, plus de informatie die een toegevoegde retroreflector (gemeten op de gearchiveerde normaalpuntepochs waarop het meetstation boven zijn horizon staat, elk met het gearchiveerde gewicht van dat normaalpunt) en een toegevoegd VLBI-baken (waargenomen door het netwerk en het schema van lunar-frame-campaign met vaste aardstations, via de vertragingspartialen van lunar-vlbi-fim) op opgegeven locaties aan het datum met zeven parameters toevoegen, opnieuw opgelost, met de 1-sigma van elke Helmert-parameter ervoor en erna, hun verhouding, de normen ervoor en erna, en de extreme eigenwaarden van het Fisher-verschil. Bij afwezigheid of leegte blijft het rapport ongewijzigd

seg-44f582b17fa9 = Integriteit van de poort — een groen dat betekent wat het zegt

# c1: cargo test --all
seg-43fbcfbe990c = Drie structurele bewakers over het verificatieproces zelf, elk een klasse defecten sluitend die als intermitterend of onterecht rood in de canonieke poort terechtkwam. ({ "1" }) Elk geconstrueerd tijdelijk pad in de Rust-bronnen moet een uniek onderdeel per aanroep dragen; een proces-id wordt geweigerd, omdat cargo de bibliotheektests als parallelle threads van ÉÉN proces uitvoert en de pid door alle threads wordt gedeeld. ({ "2" }) Elke byte-voor-byte- of hashvastlegging moet naast zichzelf of in de moduleheader aangeven wat ze dekt en wat ze bewust uitsluit — zodat een wijziging die meerdere onderdelen raakt in één oogopslag kan zien welke vastleggingen binnen bereik zijn en welke stilzwijgend detectoren voor wijzigingen in de hele repository zijn geworden. ({ "3" }) Een groen is alleen te claimen vanuit de VOLLEDIGE suite: scripts/gate.sh voert <c1/> uit, legt de echte exitcode vast zonder pipe in de weg, en schrijft een bon die de commit, het aantal integratiebinaries, het aantal tests en de duur noemt; de pre-pushcontrole weigert een push waarvan de commit door geen geldige bon wordt genoemd, op een schone boom. Herhaalbaarheid wordt afzonderlijk bemonsterd door scripts/check-repeatability.sh, dat de bibliotheeksuite N keer uitvoert en faalt als de verzameling slagende tests verschilt.

seg-b7cd952ff133 = Samengesteld tijdsynchronisatie-PL — met P0 geënte holdover-overbrugging

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); laag-semicontinu PL({ "0" }+)≥PL({ "0" }−); K(IR/2) lopend maximum; fase-exponenten τ/τ³/τ⁵

seg-096b6cdfe2dc = Samengesteld tijdsynchronisatie-PL — LIL-a.s.-envelop (onmogelijkheid + consistentie)

seg-1671add2210d = Geen eindige worstcase-holdover (Brownse sup divergeert); met IR toegewezen HPL consistent met de Hartman-Wintner-envelop als IR→{ "0" }

seg-5a27c9f0a67d = Overgrens van de integriteit voor heterogene herleidbaarheidsbias van UTC(k)

seg-fd09ab2adbf6 = Overgrens van de bias per bron b = (U/k_cov)·Phi^-1(1-tail/2) + veroudering, die een gepubliceerde uitgebreide onzekerheid van type B opblaast tot een toegewezen integriteitsstaart; sluit aan op tpl_scalar als bias_s

seg-d75b900ad25f = Gecorreleerde kruiscovariantie van de herleidbaarheidsbias (allocatie die onveilig is bij gemeenschappelijke modus)

seg-0641f6d38c23 = N×N-kruiscovariantie van de bias met niet-diagonale elementen rho·b_i·b_j voor bronnen die een UTC(k)-realisator delen; BEWEZEN correlated_fused_bias >= independent_fused_bias (naïeve onafhankelijke allocatie onderbegrenst de gefuseerde bias -> optimistisch -> onveilig)

seg-1a3bb032960f = Consistentiestatistiek voor de gemeenschappelijke modus (fout in een gedeelde referentie waar scheiding blind voor is)

seg-1b03f522b8fc = Scorestatistiek ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 voor een verschuiving in de gemeenschappelijke modus die oplossingsscheiding (contrasten orthogonaal op { "1" }) niet kan zien; een verschuiving in de gemeenschappelijke modus blaast haar op terwijl de paarsgewijze scheidingen vlak blijven

seg-3359eee713a5 = Classificatie van de nulruimte van het maandatum (rang-additiviteit van LLR + defectopheffing door libratie)

seg-6d722c176052 = Classificatie van het probleem van het datum bij interne afstandsmeting: een enkele afstandswaarneming draagt rang { "1" } bij (nulruimte met 6 dimensies); het paar oorsprong-X en schaal is bijna nul en de fysische libratie van DE440 tilt het defect naar nul terwijl het paar bijna gedegenereerd blijft

seg-3fd19007ea67 = Informatie over het maandatum uit meerdere technieken (LLR + maan-VLBI + orbiterafstand)

seg-23d0dd7d0666 = Rijen van de datum-Jacobiaan voor LLR-afstand aarde-reflector, differentiële vertraging van maan-VLBI met twee stations en afstand orbiter-baken over het datum met 7 parameters, gecombineerd tot één consistent voorgeconditioneerde Fisher; toont aan dat niet-radiale (orbiter / diepteverschillende) tracking de degeneratie tussen oorsprong-X en schaal doorbreekt waar transversale VLBI alleen indirect helpt

seg-ab96cfc8d48c = Geometrisch substraat van het LLR-datum voor de maan (hoofdasreflectoren, grondstations, analytische afstandspartialen)

seg-40e91288f81a = De vijf retroreflectorarrays aan de aardzijde in meters in het PA-lichaamsframe en de LLR-grondstations in geodetische coördinaten; plaatsing van de reflector van lichaam naar inertiaal via de DE440-PA-oriëntatie; analytische partiële afgeleiden van de afstand aarde-reflector naar de 4 parameters van het datum; en de Fisher-matrix voor alleen LLR die de degeneratie tussen lunocentrum-X en schaal toont die de analyse met 7 parameters motiveert

seg-63a8571f8eb0 = Degeneratie tussen afstand en klokoffset bij enkelvoudige maanafstandsmeting, en de ontwerpwet van geometrische diversiteit

seg-cdd70f56051a = De degeneratie per knooppunt tussen radiale afstand en offset van de ontvangerklok is exact bij { "1" } m tot { "3.336" } ns (één over c). Het Schur-complementmarginaal { "{" }scale, offset{ "}" } (coupled_marginal_fisher) laat zien dat in een geometrisch gevarieerd netwerk tweewegsafstandsmeting het marginaal met ongeveer dezelfde factor verbetert als een gelijk aantal extra enkelvoudige data, terwijl in het geïdealiseerde regime met één knooppunt de verbetering door tweewegsmeting ordes van grootte groter is. De ontwerpwet die hieruit volgt: geometrische diversiteit, niet tweewegsafstandsmeting als zodanig, scheidt de schaal van het maanframe van de offset van de tijdschaal bij enkelvoudige afstandsmeting; een tweewegs- of externe tijdkoppeling is alleen nodig in het regime met weinig diversiteit of met één gebruiker.

seg-2c074d6260ba = Representatief menu van metingen uit meerdere technieken en de additieve combinatieregel voor Fisher

seg-beefac5c1b13 = MeasurementBlock bevat één kandidaat-meetcampagne als een bijdrage van 7x7 Fisher-informatie plus een scalaire relatieve kost; block_from_rows bouwt er een uit ruwe rijen van de datum-Jacobiaan zodat elk blok identiek wordt voorgeconditioneerd via lunar_identifiability::assemble_multi_info; combine sommeert de informatie van een gekozen deelverzameling, wat de juiste regel is omdat Fisher-informatie additief is over onafhankelijke metingen; representative_lunar_menu levert een deterministisch menu van vier blokken (LLR, een transversaal VLBI-baken op de maanrand, een orbiter aan de aardzijde en een orbiter aan de verre zijde). De door het budget beperkte ontwerpoptimalisator die dit menu gebruikt, maakt geen deel uit van deze crate.

seg-2d3347bcb15e = Tolerantie voor consistentie tussen aanbieders voor een gebruiker met gemengde aanbieders

seg-9decf2cb6b0c = consistency_tolerance: keert een positiebudget van de gebruiker om naar een eis aan de overeenstemming van de Helmert-parameters tussen aanbieders per parameter (oorsprong/schaal/rotatie) bij een referentiehefboomarm, desgewenst opgeblazen met de CRLB van de realisatie bij één aanbieder uit P1

seg-5450d921dfc9 = Foutenbudget voor maaninteroperabiliteit tussen meerdere aanbieders en ontwerpwet van frame tegenover efemeride

seg-e1e30f5c17a6 = interop_budget: splitsing in reduceerbaar (gemeenschappelijke frameverbinding) en onherleidbaar (dynamica) onder de conventies PerProvider / CommonFrameTie / CommonEphemeris, met de ontwerpwetmaat van de onherleidbare fractie (~{ "0.69" } op echte DE440/INPOP/EPM: een gemeenschappelijk frame-label alleen laat de dominante ondergrens bestaan)

seg-ebb827739614 = Byzantijnse grens voor het detecteren/identificeren via blokvonk op het autonome maannetwerk per knooppunt (T3)

seg-4fb935e6193d = byzantine_bound instantieert de coderings-/schaarse-waarneembaarheidsgrens voor veilige toestandsschatting op de geometrie van het netwerk per knooppunt: een Byzantijnse peer injecteert een willekeurige lineaire combinatie van de metingen waaraan hij deelneemt, en het netwerk DETECTEERT elke coalitie van ≤ f = block_spark − { "1" } peers en IDENTIFICEERT ondubbelzinnig elke coalitie van ≤ ⌊(block_spark − { "1" })/2⌋, waarbij block_spark de kleinste peercoalitie is waarvan de gestapelde effectieve signaturen P⊥·B_T kolomrangdeficiënt zijn. Detecteerbaarheid van een peer is VOLLE KOLOMRANG van P⊥·B_j (een blok ongelijk aan nul maar rangdeficiënt is een aanval ongelijk aan nul die in range(G) terechtkomt en geen residu achterlaat), niet louter P⊥·B_j ≠ { "0" }

seg-4f57f586cf82 = Temporele ijkondergrens bij autonome holdover voor de zelfverwijzende maanconstellatie (T4)

seg-eb690e8f5c9b = holdover_floor stelt vast dat in een ensemble van autonome knooppunten die alleen door metingen tussen knooppunten zijn verbonden, de gemeenschappelijke klokrate (δα_j += { "1" } ∀j) een vrije parameter van de ensembletijd is die in N(GᵀWG) ligt: geen enkele extra afstandsmeting tussen knooppunten kan haar waarnemen (rate_in_gauge = true, temporal_gauge_dim = { "2" } met de gemeenschappelijke offset). Dit is de werkelijke ondergrens voor holdover — het temporele analogon van de ijk van de starre framepositie. Het toevoegen van één externe absolute ratekoppeling (een directe verbinding met een referentie buiten het netwerk) verwijdert de gemeenschappelijke rate uit de nulruimte (rate_in_gauge = false, temporal_gauge_dim = { "1" }), wat bewijst dat de ondergrens een echte ijk is en geen artefact van het oscillatormodel

seg-25ffd6e1979c = Gemeenschappelijke/differentiële splitsing per aanbieder, eenmaking via één rangdeficiëntie en helling van de beschermingskloof (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Drie facetten van de ene decompositie ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) met de ijk van 8 dimensies van datum⊕tijdschaal als N(G) en de state_dim − { "8" } = { "32" } waarneembare richtingen als range(G): (T5) provider_mismatch_split classificeert een gemeenschappelijke bias van meerdere aanbieders (∈ range(G)) als NIET-DETECTEERBAAR — wat een externe koppeling vraagt — en een differentiële bias (∉ range(G)) als zelfbewaakt / DETECTEERBAAR; (§{ "0" }) de eenmaking is dat DEZELFDE blinde deelruimte range(G) de niet-detecteerbare foutklasse bepaalt, dus de datumijk N(G) en de voor fouten blinde deelruimte range(G) zijn één geometrie, niet twee; (g7) slope geeft de helling van de beschermingskloof van Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ voor een fout b ∈ range(G) (schatter bedorven bij nul pariteit) en eindig voor een detecteerbare fout

seg-632add2dbd3c = ITU-T-maskers voor telecomsynchronisatie met PASS/FAIL en marge

# c1: telecom-timing
seg-47687529aee7 = Overgenomen limieten van ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC vergrendeld en ePRTC-A holdover (inclusief de tijdfoutenvelop van Tabel { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klassen A-D en G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referentiepunt C, elk open of gesloten interval zoals de tabel het vermeldt, waarbij elke vermelding 'for further study' is weggelaten; per controle een verdict en een marge op het bepalende punt, en de tijd tot elk budget wordt overschreden. Uitvoerbaar als het scenariosoort <c1/>

seg-165ed2bc771a = ITU-T-maskers voor wander-generatie bij frequentiesynchronisatie (G.811, G.812, G.8262, G.8262.1)

# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Zeven maskers voor wander-generatie in MTIE en TDEV bij constante temperatuur voor het soort <c1/>: G.811 (09/1997) PRC (autonoom), G.812 (06/2004) Types I, II en III, G.8262 (10/2024) EEC Options { "1" } en { "2" } en G.8262.1 (11/2025) eEEC (vergrendelde modus), inclusief de machtswetstukken die de tabellen schrijven (<c2/> en dergelijke), elk interval open of gesloten zoals afgedrukt, gemeten via het filter van { "10" } Hz dat de clausules vermelden (aangenomen als toegepast vóór het bemonsteren); het referentiescenario scenarios/telecom-synce-eec.toml zet een vrijlopende OCXO tegenover de drie EEC-maskers. Niet geïmplementeerd: de toelagen bij variabele temperatuur, holdover, transiënten, jitter en de frequentienauwkeurigheid van G.811

seg-5fc2ad88faf0 = Klokloggformaten (RINEX-klok, TimeLab ASCII, TAPR TICC) gelezen tot een genormaliseerde faseserie

# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: één parserlaag die een RINEX-klokbestand (AS/AR-records van één genoemde klok, versies { "2" } en { "3.00" } tot { "3.04" }), een ASCII-fase- of frequentielog in TimeLab-stijl, of een tijdstempel- of intervallog van TAPR TICC omzet in een uniform faseraster, met tau0 opgegeven, uit een header, of de mediane afstand, waarbij elk gat, elke meting buiten het raster en elk duplicaat wordt geteld, en een beleid voor gaten van weigeren, langste run of lineair; opt-in aangesloten op de telecom-timing-reeks (<c1/>, met toevoeging van een blok <c2/>) en het kloksoort (<c3/>, met toevoeging van een blok <c4/> met ADEV, TDEV en MTIE, de SHA-256 van de tabel en de SHA-256 van de fase; runs = { "1" }). Zonder de tabel zijn beide soorten byte-identiek

seg-acdb0337bce7 = Klokloggformaten linuxptp (ptp4l, phc2sys, ts2phc) en chrony (tracking, statistics) gelezen tot een genormaliseerde faseserie

# c1: clock
seg-e87b3dba2072 = clock_log::read_input met de formaten ptp4l, phc2sys, ts2phc, chrony-tracking en chrony-statistics: de gelogde offset van een servoregel van linuxptp (ns, de eigen tijdstempel tussen haakjes van de regel, metingen voordat de servo voor het eerst s2 meldt weggelaten en geteld) of van een tracking- of statisticslog van chrony (s, op kolompositie, UTC-datum en -tijd) wordt een uniform faseraster via dezelfde gatbeleidsregels als de andere formaten; een bronkiezer (<c1/>) noemt een van meerdere interfaces, klokken of adressen; de logs voeden de telecom-timing-reeks, het kloksoort en het soort holdover-test

seg-97aebb84576e = Holdovertest beoordeeld op een door de exploitant geleverde tijdfoutopname

# c1: holdover-test
seg-ab533cf99c56 = Het soort <c1/>: een tijdfoutopname (een klokbestand van linuxptp, chrony, TICC, TimeLab of RINEX, of paren time_s,time_error_ns) wordt op de twee tijdstippen die de exploitant opgeeft voor het wegnemen en herstellen van GNSS gesplitst in een basislijn, een holdover en een herstelstap; de basislijn wordt gemeten tegen de ITU-T-maskers die voor een vergrendelde klok zijn geschreven en de holdover tegen die voor holdover of een autonome klok, de holdoverenvelop van ePRTC-A en de tijdfoutbudgetten; de holdover rapporteert de kleinstekwadraten-frequentieoffset die het systeem vasthield, en het herstel of en wanneer |TE| binnen een opgegeven band kwam en daar gedurende een opgegeven verblijftijd bleef, met de piek en de grootste stap. Elke limiet is die welke het soort telecom-timing transcribeert; de twee tijdstippen zijn de verklaring van de exploitant en worden niet geverifieerd

seg-94cbac97a1aa = Beschikbaarheid van GNSS-signalen in het Space Service Volume en daarbuiten, vergeleken met het ICG SSV-boekje

# c1: gnss-ssv
seg-c59e349fdc9e = De beschikbaarheidssweeps van het soort <c1/>: per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en gecombineerd, het aandeel van (gebruiker, epoch)-paren met ten minste één en ten minste vier signalen en de langste uitval, voor een gebruiker op een bol (de wereldwijde schil van 2,562 punten van het boekje, { "14" } dagen met { "1" } minuut) of op een baan (GEO, HEO, maantransfer), uit de Kepler-banen van bijlage C van het boekje, een constant minimaal uitgestraald vermogen binnen de referentiehoek buiten de boresight, aardblokkade door de bol plus { "50" } km en een drempel voor C/N0; gebruikersantennes uit tabel B10 van het boekje

# c1: gnss-ssv
seg-d2f04991c8a4 = Effecten van ionosfeer, plasmasfeer en atmosfeer langs de rand op strijkende GNSS-signalen, en het ontwerp van een ontvanger voor zwakke signalen, in het soort <c1/>

seg-1a1786ba90b6 = Een Chapman-ionosfeer, een plasmasfeer van het Gallagher-type en een neutrale atmosfeer (buiging door refractiviteit, zuurstofabsorptie, defocussering) geïntegreerd langs de rechte straal tussen zender en gebruiker: scheve totale elektronendichtheid, het plasmasferische deel daarvan, extra vertraging, raakhoogte en het verlies op strijkende verbindingen; en een ontwerp van een ontvanger voor zwakke signalen (coherente en niet-coherente integratie, databitlimiet, ondersteuning, Doppler-zoektocht) dat de C/N0-drempel bepaalt uit de modellen voor acquisitie en volglus

seg-6b8f9f3ca2a3 = Navigatiefilter aan boord met GNSS voor ruimtevaartuigen in hoge banen en maantransfers

# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = De modus <c2/> van het soort <c1/>: een uitgebreid Kalman-filter met negen toestanden (positie, snelheid, klokbias en -drift van de ontvanger, een schaal voor de stralingsdruk van de zon) op pseudoafstanden waarvan de beschikbaarheid, ruis en C/N0 uit dezelfde verbindingsgeometrie komen als de sweeps; de referentie wordt geïntegreerd met J2, derdelichaamseffecten van zon en maan en stralingsdruk met schaduw, het filter modelleert J2 en de derde lichamen en schat de stralingsdruk; rapporteert positie- en snelheidsfouten binnen en boven de GNSS-banen, het langste meetgat en de gemiddelde NEES

seg-5fc242476828 = Relatieve navigatie van een formatie van meerdere ruimtevaartuigen in een sterk elliptische baan met GNSS

# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = De modus <c2/> van het soort <c1/>: een chief en deputies voeren elk het absolute filter uit; de positie van de deputy ten opzichte van de chief wordt geschat door de absolute schattingen af te trekken en door een relatief filter op enkelvoudig verschillende pseudoafstanden van de signalen die beide vaartuigen volgen, waarbij de relatieve dynamica het verschil van twee niet-lineaire trajecten is

seg-7038f6902820 = Foutentermen van een koudeatoominterferometer: Raman-laserfaseruis, bias door golffrontkromming en oplossen van de streepambiguïteit

seg-4d9690207607 = inertial::cai_error_terms (bibliotheekfuncties, nog niet bereikbaar vanuit een scenariosoort): de weegfunctie van de Raman-fase van een interferometer met drie vierkante pulsen (Cheinet et al. { "2008" }, Verg. { "8" }) met de gesloten vorm voor witte fase (pi/2)^{ "2" } S_phi0/tau_R en een numerieke route voor elk spectrum; de laserfrequentieruis die de vertraging van de retroreflectie niet opheft (Le Gouet et al. { "2007" }, Verg. { "9" } tot { "11" }); de zuivere defocusbias van het golffront sigma_v^2/R van een thermische wolk en de vermindering ervan door een detectiestraal; de kans op een verkeerde streepindex erfc(pi/(sqrt({ "2" }) s)) voor een ondersteuning door een klassieke accelerometer en voor twee ondervraagtijden, en de inverse ervan

seg-363705e03bac = Voorinstellingen voor oscillatorholdover uit openbare datasheets

seg-9750d9e0ec7a = Vier voorinstellingen — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A high-performance tube) en CSAC (Microchip SA.45s) — elk met de maxima van de Allan-deviatie, veroudering en temperatuurgrens van zijn datasheet; een niet-negatieve kleinstekwadratenfit van frequentieruis met wit + flicker + random walk, geschaald om elk punt van de datasheet te omhullen, een flickerondergrens nooit onder het cijfer bij de langste τ, lineaire veroudering en een sinusvormige temperatuurterm, gesynthetiseerd als een gezaaide holdover na een GNSS-verlies

seg-d7e03158b972 = Seconden tot een vrijlopende klok de guard van een tijdgeïndexeerd slot verlaat, en de cadans van positiebepalingen die haar erbinnen houdt

# c1: slot-timing
seg-0b4d8815f756 = Het soort <c1/>: de voorspelde fout E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² omgekeerd voor de overschrijding, de resterende tijd, het hersynchronisatie-interval na aftrek van de latentie van de positiebepaling en positiebepalingen per dag, elke term uitgesplitst met de overheersende genoemd; klokken uit de zes standaardwaarden van ClockClass (TCXO, OCXO en RAFS toegevoegd, elk met verwijzing naar één datasheet), de voorinstellingen voor telecom-timing, een inline datasheet of een gemeten opname; een overschrijding voorbij de langste middelingstijd van de bron wordt als geëxtrapoleerd gemarkeerd

seg-2797643153dc = Beschermingsniveau voor tijdsynchronisatie van een ontvanger in een baan om de aarde onder GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, bereikbaar als de spoofingsectie van de soort <c1/>: baansnelheid en omlooptijd in een cirkelbaan, de langste tijd per overvlucht waarin een spoofer op de grond de satelliet kan bereiken, de ondergrens van de klokondersteunde monitor en de detectielatentie van CUSUM, het voorwaardelijke beschermingsniveau (ondergrens plus uitloop over de latentie), de afwijking die een spoofer met een opgegeven maximale rampsnelheid opbouwt voordat de satelliet zijn dekkingsgebied verlaat of een onafhankelijke controle wordt uitgevoerd, en of elke controle via grondcontact of crosslink onafhankelijk is van één spoofer op de grond

seg-f134975d4ffa = Waterfall van het L-bandspectrum met J/S per band en effectieve C/N0 onder een gescripte jammertijdlijn

seg-86ad8f89a822 = De soort <c1/>: een raster van frequentie bij tijd van de vermogensspectrale dichtheid in de L-band (thermische ruisvloer k T_sys met T_sys = T_ant + { "290" } K (F - { "1" }), de signalen bij hun minimaal ontvangen vermogens volgens de interfacespecificatie, en jammers met continue golf, smalband, chirp en gematchte ruis met aan- en uittijden), waarbij elke cel gemiddeld is over zijn bin en rij (chirps exact over hele en gedeeltelijke sweeps, jammers naar inschakelduur), de effectieve C/N0 per band = [1/(C/N0) + sum (J/S) kappa]^-1 per rij, J/S per band, J/S binnen de band en een SVG-waterfall met C/N0-balken. Het rapport bevat een kruiscontrole met de keten van de soort <c2/> op dezelfde linkinvoer

seg-6e0b9687e8ee = Uranus en Neptunus uit Standish Table { "1" }, Pluto, en planeetsnelheden

seg-df3bf502dfe9 = Posities van Uranus en Neptunus uit Standish Table { "1" } (de standaard binnen { "1800" } AD tot { "2050" } AD), Pluto uit de rij van Table { "1" } van { "1992" } die de huidige JPL-pagina niet meer vermeldt, en de heliocentrische snelheid van elke planeet: de tweelichamenafgeleide met de gemiddelde beweging die de elementen impliceren plus het draaien van de ellips door de snelheden van perihelium, inclinatie en knoop

seg-a50be56f605a = Posities van de maan en zeven grote manen (Phobos, Deimos, de Galileïsche manen, Titan)

seg-2cfbe5a1eece = De geocentrische maan uit de reeks van Montenbruck & Gill (waarvan de term van -1.3972 graad per eeuw hem al op het J2000-equinox betrekt), en planetocentrische posities en snelheden van Phobos, Deimos, Io, Europa, Ganymedes en Callisto uit de gemiddelde elementen van JPL Solar System Dynamics in het Laplace-vlak van elke maan, met de snelheid van de gemiddelde lengte afgeleid uit de IAU-snelheid van synchrone rotatie (de tabel drukt de periode met te weinig cijfers af om de fase vast te houden), en van Titan uit het IAU-rotatiemodel (de maan op min de lichaamsvaste x-as op de gemiddelde afstand), omdat de afgedrukte Laplace-vlakrij van Titan Horizons niet reproduceert, zelfs niet op zijn eigen tijdstip

seg-8b8c8e28ece9 = Fysische constanten van elk lichaam in het zonnestelsel en het rapport over het hele stelsel

seg-d225a30de35c = Body krijgt Mercurius, Venus, Jupiter, Saturnus, Uranus, Neptunus, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto en Titan (gravitatieparameter, referentiestraal, J2 waar gepubliceerd met de straal waarop die betrekking heeft, IAU-pool en nulmeridiaan), een opzoeking op naam en een BodyFacts-record (NAIF-code, klasse, moederlichaam, equatoriale en gemiddelde straal); de soort <c1/> rapporteert ze voor alle achttien lichamen met de posities, lichttijden en een baanspoor over één omloop, waarbij elk lichaam het label VALIDATED of MODELLED draagt

seg-87ab655f8270 = Positiebepaling rond elk lichaam in het zonnestelsel met een lokale constellatie en een deepspace-link vanaf de aarde

seg-d9b1b0ac97d3 = De soort <c1/>: een orbiter of een lander op het oppervlak rond een bij naam gekozen lichaam navigeert met enkele-weg-pseudoafstanden van een Walker-navigatieconstellatie rond het lichaam (tweelichamenbanen met de seculiere J2-drift van het lichaam, een onbekende gebruikersklok) en een optionele klokvrije tweewegafstand vanaf de aarde, waarbij de richting en afstand van de aarde bij elk tijdstip uit de analytische efemeride komen; zichtlijnen worden geblokkeerd door de bol van het lichaam en een elevatiemasker aan het oppervlak; per tijdstip de GDOP en PDOP van alleen de constellatie (orbit::dop), de formele positie-onzekerheid met en zonder de aardrij, en gezaaide Gauss-Newton-positiebepalingen (batch_ls::gauss_newton) in beide gevallen, met de lichttijd en de heen-en-terugreistijd van lichaam naar aarde

seg-7d4d7200cbca = Dekkings- en dilutie-van-precisiekaarten voor willekeurige multiconstellatieontwerpen op schaal, rond elk centraal lichaam

seg-b78b79e9fae4 = De soort <c1/> voorbij de twee vastgelegde gevallen: expliciete ontwerpen en ontwerpen met meerdere schillen, meerdere constellaties per run met één ontvangerklok per constellatie, de aarde, de maan en Mars uit de lichaamsconstanten, de BeiDou-voorinstelling (fase van de middelhoge baan en kruising van de hellende geosynchrone baan bij { "118" } graad O gemodelleerd), per cel de satellieten in zicht, GDOP, PDOP, HDOP, VDOP en beschikbaarheid, gedownsamplede grondsporen, en een voorfilter voor zichtbaarheid op de breedtegraad van het subsatellietpunt dat een ontwerp van { "5" } 000 satellieten op een raster van { "10" } graad in een fractie van een seconde doorrekent

seg-278c77438493 = Een geketende missie over scenariosoorten heen op één gedeelde tijdlijn

seg-3dcfb26f6234 = De fasen van de soort <c1/>: elke fase voert een of meer scenario's van bestaande soorten uit via run_toml, leest hun uitvoer in benoemde kanalen (kloktijdfout en guard, gemiddelde effectieve draaggolf-ruisdichtheidsverhouding en trackingondergrens, verticaal beschermingsniveau en alarmlimiet, positiefout, satellieten in tracking, alarmvlaggen) via voorinstellingen per soort of expliciete resultaatpaden, plaatst ze op het begin van de fase en houdt ze vast op een gemeenschappelijk raster, met fasegrenzen en gebeurtenissen; de toestand wordt doorgegeven met carry (een kanaal gaat verder vanaf de eindwaarde van de vorige fase), handoff (het nummer van een vorige fase wordt in het volgende scenario geschreven) en end_at (een fase eindigt op een tijdstip dat een run heeft berekend, zoals de detectietijd van een spoofingmonitor); een campagnehash en een digest over elk ledenresultaat

seg-ad6105af464c = Parametersweeps en gezaaide Monte Carlo-ensembles over elke scenariosoort

seg-95921611839e = De secties sweep (één tot drie gepunte sleutels van elke soort, op de aswaarden van de generieke sweep, optioneel met een ensemble bij elk knooppunt) en monte_carlo van de soort <c1/>: realisatie k draait met base_seed + k; elke metriek rapporteert het gemiddelde, de standaardafwijking, de 5e/50e/95e percentielen volgens nearest-rank en een percentiel-bootstrap-betrouwbaarheidsinterval van { "95" }% op het gemiddelde met vaste seed (inertial::metric_stat); metriekeenheden worden gelezen uit het eigen units-blok van de gesweepte soort

seg-24327a0ed82e = Meerdere scenario's onder gedeelde omstandigheden, met een gecombineerde samenvatting

seg-5833fb3b06e3 = De sectie compose van de soort <c1/>: benoemde gedeelde waarden (bijvoorbeeld het vermogen en de positie van één jammer) die in elk lid worden geschreven op de sleutels waaraan ze zijn gebonden, elk lid wordt uitgevoerd, en per metriek de kleinste, grootste en gemiddelde waarde over de leden met vermelding van het lid; metriekeenheden moeten over de leden heen overeenkomen

seg-0bc866720bde = Begrensde optimalisatie van één metriek over campagneparameters

seg-f9bdb89c2b4f = De sectie optimize van de soort <c1/> (CAP-32): één tot drie gepunte scenariosleutels begrensd tot [lo, hi] op een lin- of log-schaal, één metriek gelezen via een resultaatpad, doel minimize, maximize of target; methode grid (de aswaarden van de sweep) of een deterministische Nelder-Mead-simplex in genormaliseerde coördinaten met boxprojectie en de standaardcoëfficiënten; een ontbrekende of niet-eindige metriek scoort het slechtst en blijft in de trace; bij runs > { "1" } is de metriek het gemiddelde over gemeenschappelijke seeds; elke evaluatie is een echte run van de genoemde soort, vermeld in trace en meegeteld in de reproduceerbaarheidsdigest

seg-652e28dfa10f = Signaalontwerpen voor positiebepaling, navigatie en tijdsynchronisatie in een lage baan om de aarde: codetracking, acquisitie, GNSS-compatibiliteit en een bandafweging voor elk systeem

seg-c0ba5c7e708e = De soort <c1/>: geparametriseerde signaalontwerpen (band, zendbandbreedte, ITU-toewijzing; acquisitie-, data- en pilootcomponenten met BPSK(n), BOC(m,n), MBOC of vlakke spectra, vermogensaandelen, FDMA-subdraaggolven, codelengtes en datasnelheden) uit ingecompileerde openbare voorinstellingsbestanden (Xona Pulsar, Iridium STL, Starlink-signaal van gelegenheid, CentiSpace, een generiek C-bandontwerp en generieke UHF/L/S/C/brede-C-ontwerpen, elk met zijn bron-URL en met niet-gepubliceerde waarden gelabeld REPRESENTATIVE) of inline geschreven; per signaal de bandbegrensde vermogensspectrale dichtheid, vermogensfracties in de band, Gabor-bandbreedte, codejitter tegen C/N0 en afstand en de afstandsmetingsnauwkeurigheid, de acquisitiezoekruimte, de detectiekans met kwadratische wet en de gemiddelde seriële en codeparallelle acquisitietijd, de spectrale scheidingscoëfficiënt naar en van GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b en AltBOC met de C/N0-degradatie, en de J/S-tolerantie voor CW, breedband en gematchte ruis uit de SSC-keten van de soort spectrum; een bandafweging van ionosferische vertraging, vrije-ruimteverlies, afstandsmetingsnauwkeurigheid bij gelijke C/N0 en gelijke EIRP en jammertolerantie; en kwalitatieve vormcontroles van een ontwerp tegen een beschreven meting

seg-c2b9c8e4a364 = Multibandspectrumwaterfall (UHF, L, S, C) met ontworpen signalen en jammers per band

seg-609df4e0a085 = De soort <c1/> uitgebreid voorbij de L-band: banden gegeven als voorinstelling van een signaalontwerp (getekend met elke component, bandbegrensd tot de zendbandbreedte, C/N0 en J/S betrokken op de getrackte component) of als een eigen draaggolf en modulatie; extra waterfallpanelen over elk frequentiebereik op dezelfde tijdlijn en kleurschaal; een breedbandjammer (barrage) naast CW-, smalband-, chirp- en gematchte-ruisjammers; J/S en effectieve C/N0 per band uit de ongewijzigde keten van de spectrale scheidingscoëfficiënt

seg-d9eb3e7e69c2 = Een LEO-PNT-overvlucht en zijn linkbudget per band tegenover de MEO-GNSS-satellieten in zicht

seg-d986e44443dd = De soort <c1/>: satellieten uit een ontworpen overvlucht, elementen, een TLE via SGP4 of een Walker-constellatie uit constellation-design; per band en tijdstip de kijkhoeken, afstand, afstandssnelheid en afstandsversnelling in gesloten vorm (bij elke run gecontroleerd tegen centrale verschillen en gerapporteerd), vrije-ruimteverlies, EIRP met een isoflux-, gaussisch of vlak patroon, een patch-, halfbolvormige of isotrope gebruikersantenne, gasdemping volgens ITU-R P.676-10 Annex { "2" }, P.618-regen en -scintillatie, P.2109-gebouwindringingsverlies, polarisatiemismatch, systeemruistemperatuur, C/N0, Doppler en Dopplersnelheid, en de eerste-orde vertraging uit een schuine Klobuchar- of verticale-TEC-TEC geschaald met de Chapman-fractie onder de satelliet; ionosfeervrije paren met coderuis op de piek van de overvlucht; Galileo- of GPS-draaggolven uit hun ontvangen vermogens volgens het interfacedocument via dezelfde ontvanger

seg-95a077a980b6 = Benoemde LEO-PNT-systeemvoorinstellingen met opgegeven bronnen, en een systeemonafhankelijke engine

seg-4b47033cda24 = leo_link::presets: generiek multiband (UHF, L, S, C), generieke C-band, Xona Pulsar X1/X5, Iridium STL, Starlink als een signaal van gelegenheid met alleen Doppler, CentiSpace en een optionele Celeste IOD-voorinstelling, elk met zijn bron gemarkeerd als PUBLIC (met URL), REPRESENTATIVE of WORKSHOP, waarbij de workshopvoorinstelling in het optionele Celeste IOD-voorinstellingsbestand staat en alleen wordt ingecompileerd als dat bestand bestaat; elke band en baan kan in een scenario worden overschreven, en een scenario hoeft helemaal geen voorinstelling te noemen

seg-a39f34973373 = Positiebepaling met laag energieverbruik: tijd tot de eerste positiebepaling en energie per positiebepaling tegen inschakelduur

seg-f3b9b669a76f = leo_link::energy en de sectie [iot] van de soort <c1/>: coherente integratie begrensd door de Dopplersnelheid, niet-coherente sommen met kwadratische wet tot een detectiedrempel, een zoektocht over Doppler-bins over de enveloppe van de statische gebruiker van de baan (koud) of een ondersteund venster (warm), parallelle of seriële codezoektocht, tijd van het navigatiebericht bij een koude start, energie per positiebepaling en batterijlevensduur over positiebepalingsintervallen, voor elke LEO-band en het GNSS-signaal

seg-8121e7db3db3 = Update van het LEO-navigatiebericht midden in een overvlucht met een continuïteitscontrole bij de omschakeling

seg-34c310d85c42 = De analyse midpass-update van <c1/>: de hoogste overvlucht boven een gebruiker binnen een zoekspanne, berichten op een globaal schema met gebruiksperioden gecentreerd in hun fitvensters, en bij elke omschakeling de 3D-positiesprong, de kloksprong, de pseudoafstandssprong van de gebruiker, de grootste sprong over elke zichtbare zichtlijn (gesloten vorm over de nadirkegel), de afstandsfout vóór en na, en PASS/FAIL tegen een drempel

seg-7635a8339e78 = Gedocumenteerde binaire codering van het LEO-navigatiebericht met een kwantisatiefoutenbudget

seg-e4d9b16a2dc4 = leo_navmsg::codec: het eigen frame van Kshana (preamble, versie, model, lengte, payload, CRC-24Q) voor de vier efemeridemodellen, het klokpolynoom, SVID, issue of data, band, gezondheid, een Klobuchar-set, NeQuick-G-coëfficiënten en UTC-parameters, elk veld met een opgegeven breedte en stap (field_table), kwantisatie met weigering buiten het bereik, en een budget van de grootste positie- en klokverandering die een verandering van een halve stap van elk veld over het geldigheidsvenster veroorzaakt

seg-17ca41d7fd71 = Exports in RINEX-4-stijl en CSV van LEO-navigatieberichten

seg-185e12ccef0d = leo_navmsg::text: een blok in RINEX-4-stijl (> EPH-recordkop, satelliet- en tijdstipregel met drie kloktermen, D19.12-uitzendbaanregels) met systeemletter L en recordtypen KP16, KRAC, LU22 en APOL, in elke kop gelabeld als een Kshana-extensie die geen deel uitmaakt van RINEX { "4.02" }, en een CSV-tabel met een standaard kolomschema en voorinstellingsschema's, elk met een importer

seg-e79047fc95af = ATOMIC-ECEF-polynoom zonder klok en de synthetische LEO-modelvergelijking met vijf hoogtes

seg-e261843e35b1 = de EcefPoly-variant van leo_navmsg::elements::EphemerisModel: een ECEF-polynoom per as zonder kloktermen, de relativistische term uit -2 r.v/c^{ "2" }, gescoord tegen een gestuurde klok. Ook de modelvergelijkingsanalyse (liu_comparison over LIU2025_TABLE), die het model met 22 parameters fit op de vijf hoogtes van het artikel over bogen van 20 minuten van een door Kshana geïntegreerde baan en het resultaat naast de gepubliceerde SISRE afdrukt

seg-d2e18c8bdc14 = Positiebepaling uit LEO-Doppler, met een of meer satellieten, met klokdrift- en snelheidstoestanden

seg-de6cb3c06490 = Batch Gauss-Newton-positiebepaling uit afstandssnelheid met analytische partiële afgeleiden (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), optioneel een constante gebruikerssnelheid, een hoogtepseudometing voor een gebruiker op het oppervlak, gedempte stappen; de formele covariantie op de referentie; projecties along-track, cross-track en verticaal; de nauwkeurigheid van één overvlucht tegen de cross-trackafstand van de gebruiker; het tijdstip van de dichtste nadering. De modus doppler van de soort <c1/> voegt de fout tegen vensterlengte toe en een modus met alleen Doppler voor signalen van gelegenheid (de voorinstelling starlink-sop)

seg-7f462969d2d4 = Gezamenlijke positiebepaling met GNSS- en LEO-pseudoafstanden met intersysteembiassen en foutmodellen per signaal

seg-b9b5298e3408 = Gauss-Newton-positiebepalingen met gewogen kleinste kwadraten over elke combinatie van systemen, één ontvangerklok per systeem (de intersysteembias wordt samen met de positie geschat) of een bekende uitzendoffset op de referentietijdschaal; sigma's per meting aangeleverd door de aanroeper, standaard de thermische ruis van de delay-lock-loop van de engine (navsignal::dll_code_jitter_chips) bij de C/N0 van de elevatie gecombineerd met de signal-in-space-afstandsfout; ongewogen DOP (GDOP, PDOP, HDOP, VDOP, TDOP) in het lokale geodetische stelsel, formele oost-noord-omhoog-sigma's en de biassigma's; de gezamenlijke modus van <c1/> vergelijkt positiebepalingen met alleen GNSS, alleen LEO en gefuseerd en sweept de DOP tegen het aantal toegevoegde LEO-satellieten

seg-ee9a4a0cb530 = Convergentie van precise point positioning met alleen GNSS en met LEO-augmentatie

seg-a54f36c27d90 = Een float-PPP-uitgebreid-Kalmanfilter op ionosfeervrije code en fase: statische coördinaten, een witte ontvangerklok, één intersysteembias per extra systeem, een random-walk-zenitale natte vertraging afgebeeld met 1/sin(elevatie), een float-ambiguïteit per satellietboog die bij opkomst wordt toegevoegd en bij ondergang weggelaten, en de precieze baan- en klokfout die code en fase van een satelliet gemeen hebben, verwerkt als één gecorreleerde update met twee rijen in een Joseph-gestabiliseerde vorm; metingen gesimuleerd uit hetzelfde model; convergentietijd (fouten onder de drempels tot het einde van de run), foutcurves en de over de run gemiddelde positie-NEES voor alleen GNSS en elk LEO-geval, uitgevoerd als de soort <c1/>

seg-9306f1c06081 = Door LEO ondersteunde tijdoverdracht naar UTC tegen C/N0 en de ontvangeroscillator

seg-c618feb01476 = Klokmetingen van elke LEO-satelliet in zicht op een bekende positie, gecombineerd met inverse variantie uit het pseudoafstandsruismodel, gefilterd door een Kalmanfilter met twee toestanden (fase, frequentie) waarvan de procesruis de witte en random-walk-frequentieruis van de oscillatorklasse is (slot_timing::ClockNoise, clock_state::ClockClass; de uitloopvariantie van holdover::coast_phase_variance), een gezaaide referentieklok uit dezelfde niveaus, en de uitdrukking voor systeemtijd naar UTC uit IS-GPS-200 sectie { "20.3.3.5.2.4" } met een onzekerheid van de uitzendoffset toegevoegd als bias per run; de modus timing van <c1/> sweept oscillatoren en C/N0-offsets

seg-d92777401093 = Benoemde LEO-PNT-systemen als optionele gegevensvoorinstellingen, elk met zijn bron

seg-5130bfe2410c = Systeemonafhankelijke invoer: elk systeem is Walker-schillen, expliciete elementen of een GNSS-voorinstelling, een signaal (draaggolf, chipsnelheid, bandbreedte, ontvangen vermogen of C/N0-bereik), een SISRE, een Doppler-sigma en een klokmodel; voorinstellingen vullen alleen aan wat een scenario weglaat, één bestand per stuk met bronnen gemarkeerd als PUBLIC (met een URL), WORKSHOP of DERIVED en de niet-gepubliceerde waarden vermeld als representatief: Xona Pulsar X1/X5, Iridium STL, Starlink-signalen van gelegenheid, CentiSpace, een representatief C-bandsysteem, het ATOMIC-efemeridemodel zonder klok, en één van de workshop afgeleide voorinstelling in het optionele Celeste IOD-voorinstellingsbestand, die wordt achtergehouden door dat bestand en zijn scenario's te verwijderen

seg-dec52b5b9cd6 = Eén LEO-PNT-systeem van begin tot eind: signaalontwerp, linkbudget van de overvlucht, navigatiebericht en gefuseerde positiebepaling, waarbij de uitvoer van elke fase aan de volgende wordt doorgegeven

seg-39443b31d418 = De soort <c1/>: een leo-signal-ontwerp (openbare voorinstelling of inline) bepaalt het midden, de bandbreedte, de chipsnelheid en de EIRP-verdeling van een leo-pass-band; de overvlucht geeft per tijdstip de C/N0 van de getrackte component en de bandbegrensde codejitter; een C/N0-lijn met kleinste kwadraten in sin(elevatie), de SISRE van het leo-navmsg-bericht (gefit op de baan van de satelliet van de overvlucht, plus een opgegeven term voor baanbepaling als wortel uit de kwadratensom) en de draaggolf en chipsnelheid van het ontwerp gaan naar elk LEO-systeem van een gezamenlijke leo-pvt-positiebepaling en, optioneel, naar de LEO-gevallen van leo-ppp; elke overdracht wordt gerapporteerd met haar waarde en eenheid

seg-55ca63edff02 = Spoofingdetectie via LEO-Doppler en consistentie van de overvluchtgeometrie

seg-b12fc1728220 = De sectie <c2/> van de soort <c1/>: een spoofer vervalst, zelfconsistent in afstand en afstandssnelheid, de signalen die op een geclaimde positie worden gezien die springt en/of na een begintijdstip van de ware positie wordt weggeduwd (per LEO-band en voor het MEO-GNSS-signaal); de ontvanger voorspelt elke afstandssnelheid uit de uitgezonden baan en een onafhankelijke eerdere positie en snelheid, en toetst de gemeten afstandssnelheden met een gegeneraliseerde chi-kwadraatstatistiek met kleinste kwadraten over een venster van tijdstippen (klokdrift een storingsparameter of met een prior), op de GNSS-kanalen, de LEO-kanalen en alle kanalen, met thermische ruis van de frequency-lock-loop uit C/N0 (Kaplan & Hegarty { "2006" }, sectie { "5.6.2" }); detectiekans uit de niet-centrale chi-kwadraatverdeling bij een opgegeven kans op vals alarm, detectie verklaard bij een opgegeven kans op gemiste detectie

seg-5f341f85ac07 = Spoofingdetectie via consistentie tussen de banden van een LEO-signaal met meerdere banden

seg-2f9c4d351b0f = Voor elke LEO-satelliet en elk paar afstandsmetingsbanden vormt de sectie <c1/> de geometrievrije pseudoafstandscombinatie, verwijdert het ionosfeermodel van de ontvanger en toetst de stap van tijdstip tot tijdstip tegen de coderuis van de twee banden en een opgegeven getolereerde ongemodelleerde ionosferische snelheid (tweezijdig gaussisch, exacte detectiekans); een spoofer die sommige banden vervalst en andere niet, of elke band zonder de ionosfeer, wordt bij zijn begin gezien; een spoofer die elke band vervalst en de ionosfeer simuleert niet, wat het resultaat vermeldt

seg-97dbcd5f2728 = Ionosfeersondering: schuine TEC uit de tweebandsvertraging van een LEO-overvlucht

seg-844de34fd2f3 = Voor elk bandpaar van een satelliet van <c1/> geeft het rapport de schuine totale elektronencontent die de geometrievrije codecombinatie op de piek van de overvlucht oplevert, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), en zijn 1-sigma uit de thermische coderuis van de twee banden, zodat elk LEO-PNT-ontwerp met meerdere banden als ionosfeersonde kan worden afgewogen

seg-1fdbb476c8ab = Maritieme vertrouwensscore: de aggregatie van het bewijs van de monitors tot een score van 0-100 en zijn drie banden

seg-0d76b33144f1 = Elke monitor herleidt zijn bewijs tot een verhouding van statistiek tot drempel; de score is { "100" } min de som over de monitors van het gewicht maal een begrensde lineaire helling van de verhouding ({ "0" } tot { "0.5" }, { "1" } bij { "1.5" }), begrensd tot { "0" } tot { "100" } en afgerond op { "0.1" }, met banden bij { "90" } en { "55" }; elk tijdstip vermeldt de monitors die hebben afgetrokken en hun punten.

seg-51640405c9b7 = SIEM-gebeurtenissen van vertrouwenstelemetrie: Log Event Extended Format (LEEF) via syslog

seg-1b3245506847 = Gebeurtenissen bij bandwisseling (of per tijdstip) als Log Event Extended Format { "2.0" }-payloads in een RFC { "5424" }-envelop via UDP of TCP, met een gedocumenteerde veldtoewijzing.

seg-c04042b0270a = Interferentiedrempels van receiver-trust gekalibreerd op de dataset JammerTest { "2024" }

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: de vooraf vastgelegde kalibratie van de monitors voor C/N0-daling, AGC en jamming-indicator op de openbare dataset JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, tijdens de run opgehaald, nooit meegeleverd): per map een tijdlijn van { "1" } s uit mon_rf.csv en rinex.csv, de monitors eenmaal uitgevoerd, elk tijdstip na de kalibratie gelabeld als schoon of jamming uit de attack_log van de map (verschoven van CEST naar UTC, guard van { "60" } s), elke drempel gesweept over een vast raster, de kleinste drempel gekozen met een gepoolde kans op vals alarm op schone tijdstippen van hoogstens { "0.01" }, en achtergehouden tellingen met leave-one-folder-out; een kruiscontrole van de UBX-lezer. De keuze wordt alleen geleverd als het opt-in-profiel [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); de standaardregel en elke uitvoer zonder het profiel zijn ongewijzigd

seg-65a8361b4a22 = Jammertest scoring: een ontvangerlog die per geplande test wordt beoordeeld (detectielatentie, gemiste alarmen, valse alarmen, hersteltijd) aan de hand van het gepubliceerde testplan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): de testcatalogus en het zendplan van de NPRA (MIT, opgehaald met een vastgezette SHA-256, nooit meegeleverd) gelezen als geplande referentie met behoud van de catalogus-id's; een receiver-trust-run beoordeeld per test (eerste alarm minus geplande start, gedetecteerd/te laat/gemist ten opzichte van een tolerantie, tijd tot de eerste alarmvrije periode, alarmen buiten elk slot en de bijbehorende bewakingsmarge), met een ondertekend bewijspakket dat de scorekaart bevat. Het schema bestaat uit geplande slots, niet uit vastgelegde uitzendtijden

seg-ee99388f7b15 = compliance (kshana compliance-report): een koppeling van Kshana-uitvoer aan clausules van openbare kaders, uitsluitend op nummer, ingevuld uit de opgegeven runs; een resultaat telt alleen voor een mogelijkheid mee wanneer het het bewijs bevat dat de koppeling noemt, een lege verzameling levert nergens bewijs voor, en de formulering is "levert bewijs voor"; het rapport is geen vaststelling dat enig kader wordt gehaald en geen beoordeling of goedkeuring door wie dan ook.

seg-98c360d82d56 = Maritieme integraties: Signal K-plug-in, OpenCPN-gate-stream en scorepaneel, referentiebuild

seg-7af9ce566646 = De vertrouwensscore, band, redenen, gate-status en door de ontvanger gemelde positie, gepubliceerd onder navigation.gnss.kshana in een Signal K-server met een waarschuwings-, alarm- en normaalmelding (integrations/signalk); de gegate NMEA-stream, met de positiebepaling als ongeldig gemarkeerd zolang het vertrouwen is ingestort en een PKSHT-zin per cyclus, via TCP aan OpenCPN geleverd door de gate zelf of door een klein relay, en een eigen OpenCPN-scorepaneel dat de PKSHT-zin leest (integrations/opencpn); en systemd-units en een container die de gate draaien (deploy/reference-build). Waar deze uitvoer tonen, dragen ze de adviserende verklaring: Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.

seg-89ab9ef155eb = BOC({ "1,1" })-tracking: DLL-schaling en bump-jump-ambiguïteitsoplossing (opt-in)

seg-ef24be9b5917 = Het veld boc van iq::track::LoopConfig (opt-in, standaard None): de drie DLL-discriminatoren herschaald om de codefout in chips af te lezen met eenheidshelling op de hoofdpiek van de sinus-BOC({ "1,1" }), en een bump-jump-monitor op zeer vroege en zeer late correlatoren op een halve subdraaggolfperiode ({ "0.5" } chip) die de code-NCO naar de hoofdpiek laat springen wanneer een op/neer-teller N bereikt ({ "8" } standaard). Zonder de optie is elke uitvoer ongewijzigd.

seg-2c32955cbfb3 = IQ-kanaal voor ionosferische scintillatie (Cornell-model) tegen gemeten { "50" } Hz GPS L1-scintillatie

seg-2fdcb373ab25 = iq::channel::scint, het Cornell-scintillatiemodel (Rice-intensiteit, tweede-orde-Butterworth-spectrum, fase arg z) aangedreven met de S4 en de intensiteitsdecorrelatietijd van een gemeten venster, vergeleken op wat het genereert buiten die twee invoeren; realdata::scint50 leest het gemeten log, haalt de trend eruit en voert de vergelijking uit.

seg-160507ac3702 = Cell-averaging CFAR-optie in IQ-acquisitie

seg-7c0a1adc9ae6 = iq::acq::ca_cfar en ca_cfar_cells (opt-in): een cel van een acquisitieraster wordt vergeleken met het gemiddelde van referentiecellen van zijn Dopplerrij (guard- en stride-lags, rond de periode heen gewikkeld), met een factor alpha die is bepaald uit de gesloten-vormkans op vals alarm van CA-CFAR voor M niet-coherente blokken (ca_cfar_pfa, ca_cfar_alpha). De detector op steekproefvermogen blijft de standaard en elke bestaande uitvoer is ongewijzigd.

seg-5bd3bf0c22a7 = Spectrummodel: GLONASS-, BeiDou- en Galileo E6-banden (opt-in)

seg-9c16189c63ac = spectrum::default_band bepaalt, uitsluitend op naam (MORE_BAND_NAMES), GLONASS L1OF en L2OF op elk FDMA-kanaal K = -7 tot { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a en B3I (BPSK({ "10" })) en Galileo E6 (BPSK({ "5" })), met de draaggolven en minimale ontvangen vermogens uit hun interface control documents; de standaardbandenset en elke bestaande uitvoer zijn ongewijzigd.

seg-7b1ae0c7ca28 = Tertiaire codes en berichtlaag van LunaNet AFS (SB1 BCH, CRC-24Q, interleaver) tegen LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synchronisatiepatroon, SB1 BCH({ "51,8" })-encoder en decoder met 256 hypothesen, CRC-24Q, de blokinterleaver van { "60" } x { "98" }, een symboolstroomcontrole (kshana lunanet-afs-check) en een teststroomgenerator met plaatshouder-subframes. De rate-1/2 LDPC-codering van subframes { "2" } tot { "4" } is niet geïmplementeerd (de matrices staan in een aparte bijlage).

seg-0d7b17524c04 = Standaardenpakketten: scenario's beoordeeld aan de hand van drempels die vóór de run zijn vastgelegd

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): de testprofielen van het DHS Resilient PNT-kader voor niveaus { "1" } tot { "4" }, de nauwkeurigheidsniveaus en integriteitsevaluatie van IMO MSC.1/Circ.1575 en de pakketten monitoren, beoordelen en mitigeren van ICAO Doc { "9849" } Appendix F: elke test voert een meegeleverd scenariotype uit en vergelijkt resultaatvelden met drempels die in het pakket zijn vermeld, en tests die een ontvangerlog nodig hebben, worden vermeld als NEEDS INPUT en niet beoordeeld.

seg-8a8f2c85e0c3 = Bewijspakket voor laboratorium-roundtrip (scenario, testcondities, ontvangerlog, score)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) en de ontvangerlog-export kshana.test-conditions/1 van kshana bench-export: een ondertekend pakket dat de scenariohash, de hash van de vermelde condities, de loghash en de score ten opzichte van de vermelde gebeurtenissen vastlegt, en condities weigert die niet overeenstemmen met de beoordelingsgebeurtenissen of een log waarvan de hash niet de vermelde is. Er wordt geen signaal geschreven, afgespeeld of ingepland.

seg-a9189e4fe413 = IQ-trackingengine tegen GNSS-SDR { "0.0.19" } op onafhankelijke opnames

seg-364de05e5b1b = De volledige trackingengine van de IQ-laag (iq::track via kshana iq track: acquisitie-overdracht, correlatoren, NCO's, tweede-orde-Costas-PLL van { "15" } Hz, eerste-orde-DLL met EML-omhullende en draaggolfondersteuning van { "2" } Hz, lock-indicator en C/N0-schatters) op GPS L1 C/A bij { "30" } tot { "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antennewinsten in het jamming-type tegen een onafhankelijke numpy-herberekening

seg-192144c57783 = De optionele sectie [crpa] van het jamming-type: een bundel per kanaal naar elke satelliet (null-steering met de jammer als nul, of MVDR op sigma^{ "2" } I + P_j a_j a_j^H), die de ruis van elke link schaalt met ||w||^{ "2" } en de jammer met |w^H a_j|^{ "2" } vóór de bestaande anti-jam-C/N0-vergelijking.

seg-a2f34cff9338 = Terreinafscherming van de jammer in het jamming-type tegen een onafhankelijke numpy-herberekening op een echte SRTM-tegel

seg-334c569d9cae = De optionele sectie [terrain] van het jamming-type: het grootcirkelterreinprofiel tussen jammer en ontvanger op een SRTM .hgt-tegel met een aardbolling met k-factor, de dominante messcherpe rand (grootste Fresnel-Kirchhoff nu) en het verlies van één messcherpe rand volgens ITU-R P.526-15 sectie { "4.1" }, afgetrokken van het ontvangen vermogen van de jammer.

seg-825c121c7512 = Acquisitiehysterese en de quantiser van de front-end in het jamming-type tegen onafhankelijke herberekeningen

seg-f7207263d881 = De optionele sectie [acquisition] van het jamming-type (een satelliet wordt geacquireerd bij of boven een acquisitiedrempel na een heracquisitievertraging en vastgehouden zolang hij op of boven de trackingdrempel ligt) en de sectie [front_end] (de AGC-aflezing { "10" } log10({ "1" } + J/N) en het quantiseringsverlies van de ADC bij Gaussiaanse invoer, van elke link afgetrokken, gemarkeerd als niet geldig voor niet-Gaussiaanse jammers).

seg-9c46f1c76486 = Begrensde FLL-pull-in onder de FLL-naar-PLL-overdrachtsondergrens van het standaardontwerp (opt-in)

seg-efa1d1a9e904 = De opt-in carrier.fll_pull_in_max_s van iq::track (het veld fll_pull_in_max_s van iq::track::LoopConfig): onder fll_assist = pull-in draagt de FLL na een vaste pull-in-tijd de sturing over aan de PLL, wat de PLI ook is, met een bijpassende terugkeerverblijftijd totdat de PLI voor het eerst fll_off_pli bereikt.

seg-ac0f97e945a7 = Lezer voor RTKLIB .pos-oplossingen voor receiver-trust

seg-0b8bc2c89de4 = Leest een RTKLIB-oplossingsbestand (kalender- of GPS-week/TOW-tijd, breedte-/lengtegraad- of ECEF-positie, gebruikte satellieten) in de receiver-trust-tijdlijn (receiver_trust::machines::rtklib).

seg-849393517c04 = NovAtel OEM7 ASCII- en binaire logs (BESTPOS, RANGE, RXSTATUS) voor receiver-trust

seg-7e0021922025 = Leest BESTPOS (positie), RANGE (C/No per signaal) en RXSTATUS (de jammervlag van de ontvanger, als zelfrapportage van het epoch) uit ASCII- en binaire OEM7-logs, CRC-gecontroleerd, alleen-lezen (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = RTCM-{ "3" }-lezer voor MSM4 en MSM7 draaggolf-ruisverhouding voor receiver-trust

seg-0a0c9976236f = Leest de C/N0 van elke signaalcel van RTCM-{ "3" }-berichten MSM4 en MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) uit een framestroom, CRC-24Q-gecontroleerd (receiver_trust::machines::rtcm3). Indelingen uit de pyrtcm-tabellen met BSD-licentie, niet uit de tekst van de RTCM-standaard.

seg-cd554a7c1649 = GNSS-SDR-monitoradapter voor receiver-trust

seg-22b587ac642d = Leest GNSS-SDR Monitor- (Gnss_Synchro) en PVT-monitorberichten, doorgegeven als JSON-regels met de protoveldnamen, in C/N0 per kanaal, positiebepaling, gebruikte satellieten, HDOP en hemel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = IMU-loginvoer, gyro-headinginvoer en Allan-fit van parameters van hybride sensoren

seg-9dadc819daef = Leest een IMU-CSV (gedocumenteerde kolommen, of de EuRoC-indeling); integreert de gierdraaisnelheid tot de heading die de heading-course-monitor leest ([log.imu]); en fit de ruisparameters van accelerometer en gyro van de hybride en fusiescenario's uit een stilstaand log met overlappende Allan-deviatie (imu-fit).

seg-15a852a2dcb0 = Home Assistant MQTT-discovery en statusexporter voor vertrouwenstelemetrie

seg-6d6b07b26966 = Een JSON-statusdocument en Home Assistant MQTT-discoveryberichten voor de vertrouwensstroom, op elk oppervlak als tekst afgedrukt en door de CLI gepubliceerd via MQTT { "3.1.1" } QoS { "0" } (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = ROS-{ "2" }-pakket voor receiver-trust en gnss_lib_py-brug

seg-e7d7d99fe538 = Een ROS-vrije brug die positie- en satellietberichten als NMEA schrijft en ze via de Python-binding beoordeelt (integrations/ros2/kshana_trust), en een brug van gnss_lib_py NavData naar receiver-trust via het rtklib-pos-formaat (integrations/gnss_lib_py).

seg-c3c260b7063e = Tests

seg-b24486eee0fb = Bron: <c1/>

seg-34d1304c9555 = Gemodelleerde mogelijkheden — onderbouwing

seg-144f441bf52b = Deze mogelijkheden zijn geïmplementeerd vanuit gepubliceerde of eerstebeginselenfysica met tests, maar dragen <b>eerlijk het label MODELLED</b> — ze zijn niet tot een opgegeven tolerantie getoetst aan een onafhankelijke externe referentie. De invarianttests van de matrix dwingen af dat alleen rijen die door <c1/> worden gedragen VALIDATED mogen zijn, zodat hier niets stilzwijgend kan worden bevorderd. Elke rij vermeldt waarom ze gemodelleerd blijft.

seg-0630e39b4de3 = Soort referentie

seg-bb023086bbe3 = Waarom het gemodelleerd blijft

seg-dd6ba97ce971 = InternalConsistency

seg-bac242dada9c = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Geen externe: Orekit { "12.2" } kent geen verhouding van verlichting met randverduistering. Alleen getoetst aan gesloten vormen van dezelfde wet

seg-33d506570c1b = srp_shadow::tests (de ringvormige gesloten vorm, de uniforme wet die de conische schaduw reproduceert, de grenzen van volle zon en kernschaduw)

seg-91fe516eabd4 = ExternalDataset

seg-cb2cbb31b091 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 met ThirdBodyAttraction en SolarRadiationPressure op Orekits eigen DE440-lezer (orekit-data lnxp1990.440), als apart programma gedraaid; kshana leest een bit-voor-bit, met SPICE gecontroleerd uittreksel van NAIF de440s.bsp. Drempels vooraf vastgelegd in xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). De baandrempel ({ "0.5" } m) en de gevoeligheidscontrole zijn gehaald, maar de positiedrempel van Zon/Maan ({ "3" } m / { "0.2" } m) is gemist met { "6.39" } m / { "0.244" } m. SPICE, dat dezelfde kernel op zijn exacte TDB leest, mist Orekit met hetzelfde bedrag ({ "6.25" } m / { "0.240" } m), dus het verschil ligt tussen het pad van NAIF de440s en Orekits DE440-lezer of tijdschaal; oorzaak niet geïsoleerd. Vastgelegd en vastgepind, dus de rij blijft MODELLED

seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } gevallen x { "25" } uurlijkse toestanden over { "24" } h, LEO, GEO en HEO, derde lichaam en derde lichaam + SRP: slechtste |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; analytische-reekscontrole mist met { "9.96" } m; Zon { "6.39" } m en Maan { "0.244" } m ten opzichte van Orekits DE440-posities, een vastgelegde misser); unittests van de propagator (weigering van de provider, fallback-telling gedeeld over klonen)

seg-b55bcab6f986 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Geen externe voor het geopotentiaaleffect. De { "24" } coëfficiënten zijn overgenomen uit GFZ STR06/01 Tabel { "1" } model N1 en rij voor rij opnieuw gecontroleerd tegen het rapport (SHA-256 890865ae); de graden { "0" }, { "1" }, { "7" } en { "8" } worden niet gebruikt. Ray en Ponte ({ "2003" }) drukken geen tabel met sferisch-harmonischen af, dus er is geen tweede bron vergeleken

seg-448f4acf5c7b = tides, propagator, precise_od

seg-4014447d4bcc = tides::tests (de S1-term is dagelijks, draait { "90" } graden in een kwart dag en heeft de amplitude van de belastingsfactor van elke rij; fysische grootte bij LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

seg-a192b0f512cb = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel en pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, als aparte programma's gedraaid; drempels vooraf vastgelegd in xval/high-degree-gravity/PREREGISTRATION.md (276c869f) en xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit komt overeen overal waar het is gedefinieerd, maar pyshtools mist zijn vooraf vastgelegde drempel op de twee punten dicht bij de pool (tot { "7.3e-10" } m/s^{ "2" }; een mpmath-controle met 50 cijfers legt de fout bij pyshtools), er is geen referentiewaarde precies op de poolas, en de vooraf vastgelegde gevoeligheidscontrole van graad 70 voor de baan van { "24" } h is gemist ({ "0.726" } m tegen > { "1" } m). Elke misser is vastgelegd, niet weggestemd, dus de rij blijft MODELLED

seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit op { "8" } punten buiten de as: max |da| { "2.2e-17" } m/s^{ "2" } bij N = { "70" }, altijd gedraaid; { "3.5e-17" }, { "3.9e-17" } en { "7.3e-17" } m/s^{ "2" } bij N = { "200" }, { "360" }, { "2190" }, gated op data via KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (baan van { "24" } h 200x200, gated op data: slechtste |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; controle op graad 70 { "0.726" } m); unittests van gravity_sh (overeenstemming met de klassieke evaluator tot { "1e-13" } bij graad { "70" }, eindige differentie en poolcontinuïteit op een veld van graad 2190, een onderlopende term van graad 2190 tegen een berekening met uitgebreide exponent)

seg-84a9851b838c = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Orekit { "12.2" } (Apache-2.0) BatchLSEstimator met eigen ogenblikkelijke geometrische RangeRate- en AzEl-metingen (gecontroleerd tegen Orekits TopocentricFrame), als apart programma gedraaid op identieke gemaskeerde, gezaaide waarnemingen. Drempels vooraf vastgelegd in xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Elke drempel gehaald behalve B4, de toestandsovereenstemming zonder ruis van { "1" } cm, gemist bij { "2" } van { "4" } scenario's ({ "1.46" }, { "1.74" } cm): Orekits eigen schatting zonder ruis ligt zo ver van zijn gesimuleerde referentie (oorzaak aan de Orekit-kant niet geïsoleerd). Vastgelegd en vastgepind, dus de rij blijft MODELLED. Niet gemodelleerd: lichttijd, aberratie, refractie, aardrotatie, een sequentieel filter voor deze meettypen

seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } scenario's: range-rate, az/el en gemengd, LEO en MEO, zonder ruis en gezaaid sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, maskers van { "5" } en { "10" } graden, tegen Orekit { "12.2" }: zichtbare verzamelingen identiek; meetwaarden binnen { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM binnen { "1.2e-14" } relatief; ruisige toestanden binnen { "1.74" } cm en { "1.14e-5" } m/s; post-fit-RMS per type binnen { "2.7e-4" } relatief; kshana zonder ruis tegen de referentie { "1.06e-8" } m; kshana zonder ruis tegen Orekit { "1.464" } en { "1.740" } cm op twee scenario's, een vastgelegde misser van de drempel van { "1" } cm); unittests van orbit_determination en batch_ls

seg-a5554f29b2d7 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Geen externe: de gewichten zijn een modelleringskeuze (het SP3-formaat definieert de code alleen als nauwkeurigheidsindicator van de producent; hier wordt hij gelezen als eenmalige sigma per as). De bestaande vastgelegde agentschapsruns zijn ongewijzigd

seg-f5a76ae1fcaa = sp3, precise_od

seg-39a552abfcab = unittests van src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (vastgelegde ESOC-fixture van { "8" } h, sigma { "0.032" } m uit header-exponent { "5" }: Tier-1 3D-RMS { "0.132" } m ongewijzigd, Tier-2 { "0.035" } m tegen { "0.070" } m bij sigma { "1" } m, waarbij de wijziging voortkomt uit de herbalanceerde empirische a-priori-beperking); tests/agency_swarm.rs (het Swarm-product draagt geen nauwkeurigheidscodes en valt terug, vastgepind)

seg-a5ad470a4816 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Alleen interne consistentie. Elk gepubliceerd veld is gedefinieerd in het lichaamsvaste stelsel van zijn producent (GMM-3 in het Mars-stelsel van Konopliv et al. { "2006" }, GL0660B in het hoofdassenstelsel van de maan van DE421), terwijl het veld wordt geëvalueerd in het IAU-stelsel; de offset is niet gemodelleerd

seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

seg-eff90f999826 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Alleen interne round trip en bekende antwoorden uit de ICD; er is geen decoder van derden gedraaid (de RTKLIB/GNSS-SDR-harnas dat KSHANA_NAVMSG_ORACLE_JSON leest, is gated op data). MODELLED

seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q-controlewaarde 0xCDE703; convolutionele impulsrespons; Viterbi corrigeert ingebrachte fouten; layoutbreedten); tests/gnss_navmsg_roundtrip.rs (startbits van velden zijn gelijk aan de bitnummers van de ICD; encode -> FEC -> interleave -> Viterbi -> decode round trips binnen een halve LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS BRDC 2018-133 Galileo-records op het LSB-raster, slechtste { "3.6e-3" } LSB; vooraf vastgelegde drempel voor het aantal satellieten gemist, { "15" } van { "20" }, BEVINDING)

seg-81b76a6d1bcd = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — BEVINDING tegen de gepubliceerde ITRF2020 WTZR-coördinaat: de vooraf vastgelegde drempels (gladgestreken mediaan en p95 hoogstens { "0.6" } x ruw; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) zijn gemist, verhoudingen { "0.718" } en { "0.923" }; de resterende fout op metrisch niveau is biasachtig (C1C-codebias, antenne, getij, multipath met lange periode), niet de witte ruis die het gladstrijken verwijdert. MODELLED: de statistiek van het filter wordt intern gecontroleerd

seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

seg-e892fffaaf07 = hatch::tests (doorgave zonder ruis; variantie van witte ruis 1/(2N-1); herstarts); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } epochs, N = { "100" }: mediane 3D-fout { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

seg-1bbd39c17347 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Formaatcontrole op een echt gepubliceerd RINEX { "4.00" }-bestand (teruggelezen waarden zijn gelijk aan de afgedrukte literalen van het bestand) en een uit de specificatie afgeleide header; er is geen onafhankelijke lezer gedraaid, dus MODELLED

seg-bdda05057c91 = rinex_obs (parse_obs)

seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (eerste { "4" } epochs van het IGS MGEX RINEX { "4.00" }-bestand MAO000USA_R_20231980000_01D_30S_MO, { "58" } satellieten, { "7" } systemen: headerrecords en waarden van de eerste epoch zijn gelijk aan de gepubliceerde literalen); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (synthetische { "4.02" }-header uit de specificatie)

seg-5afb3c4bf171 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Vooraf vastgelegd (7aa264b, 110fef9) tegen een precieze IGS MGEX-baan met de GEO's; zo'n product was niet bereikbaar vanuit de sessie die het bouwde, dus de vergelijking is in afwachting en de rij is MODELLED (alleen getoetst aan de gepubliceerde nominale GEO-slots)

seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (echte records C01-C04: geostationaire straal, lengtegraden 140.02/80.04/110.55/159.99 graden op de gepubliceerde slots, |breedtegraad| { "2.13" } graden met de kanteling tegen { "6.65" } zonder; de vooraf vastgelegde vergelijking van broadcast met precieze SP3 is gated op data via KSHANA_BDS_GEO_SP3 en is niet gedraaid); rinex::tests

seg-70f61250d256 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: de metingen worden gesynthetiseerd uit de modellen die het filter gebruikt (χ² NEES/NIS over seeds, een convergentie zonder ruis, slip-injectie). MODELLED; er worden geen echte ontvangerdata of filter van derden vergeleken

seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (rit in een 8-vorm: stationaire 3D-RMS { "0.025" } m draaggolf tegen { "0.470" } m code op identieke metingen; { "12" } seeds gemiddelde NIS/dof { "1.00" } en stationaire NEES/dof { "0.92" }; een slip van 1 cyclus gedetecteerd op zijn epoch zonder valse alarmen en met intacte oplossing; het uitzetten van de broadcast-correcties verhoogt de codefout van { "0.51" } m naar { "19.6" } m (iono) en { "8.0" } m (tropo); een run zonder ruis convergeert naar { "0.3" } mm)

seg-6f3f6483690e = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Intern: de kwaliteitsmaten van elk pakket tegen zijn eigen referentie en een vergelijking tussen los en strak gekoppeld op identieke invoer. MODELLED; de NaveGo-vergelijking van de audit is niet gedraaid

seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenario's gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (elk pakket: gefuseerd onder vrije INS tijdens de uitval voor beide sensoren; spoor: strak { "5.3" } m tegen los { "12.9" } m navigatieklasse en { "15.6" } m tegen { "18.8" } m tactisch tijdens de uitval, beschikbaarheid { "0.97" } tegen { "0.95" }; strakke tabel gevalideerd); tests/gnss_ins_legacy_trajectory_pin.rs (de losgekoppelde standaard bit-identiek)

seg-2c7c37506aab = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: referentie gesimuleerd uit de eigen modellen van de filters (χ² NEES over Monte Carlo-seeds, het ontkoppelde pakket op identieke sensoren). MODELLED

seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3D-filter over { "60" } seeds: gemiddelde NEES van de tweede helft { "8.12" } voor { "8" } toestanden, χ²-som van de laatste epoch binnen zijn { "95" } %-band; een klokvaststelling van { "0.1" } ns verlaagt de 3D-positiesigma van { "5.58" } m naar { "3.07" } m; biasfilter over { "60" } seeds: χ²({ "5" })-som binnen de band, bias binnen { "3" } sigma bij { "59" } van { "60" }; fusion-pnt-coupled met bevooroordeelde versnellingsmeters: positie p95 { "18.7" } m / { "90.0" } m en integriteit { "1.00" } / { "0.97" } gekoppeld tegen { "430" } m / { "4060" } m en { "0.006" } / { "0.000" } ontkoppeld); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion en hybrid zonder [coupled] bit-identiek)

seg-0866862d2264 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Intern: identiteiten van starrelichaamkinematica, de CSV-round-trip en de eigen covariantie van het filter. MODELLED (er wordt geen echt rijlog vergeleken)

seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

seg-5a6b5289a473 = fusion::trajectory::tests (gecoördineerde bocht heeft geen zijkracht en belastingsfactor 1/cos φ; CSV-import reproduceert een gevlogen profiel tot { "1e-3" } m/s en { "1" } m); tests/gnss_ins_trajectory_library.rs (elk profiel draait en fusie verslaat vrije INS tijdens de uitval; elk vliegt zijn genoemde beweging; waarneembaarheid van de koers: yaw-sigma na { "240" } s { "1.27" } graden bij rechte kruisvlucht tegen { "0.039" } graden bij een 8-vorm en { "0.062" } graden bij stop-and-go); tests/gnss_ins_legacy_trajectory_pin.rs (legacy-resultaat en referentiehashes bit-identiek)

seg-5cb3b7bba7be = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Gemeten tegen de door JPL Horizons gereconstrueerde CAPSTONE-efemeride (NAIF -1176, CAPSTONE_merged, maangecentreerd ICRF, 2023-03-01..31 met { "10" } min), byte voor byte vastgelegd (tests/fixtures/capstone_horizons/, NOTICE.md), vooraf vastgelegd { "4e868170" } voordat ze werd opgehaald, als meting met drempels op de gemiddelde geometrie. Geen validatie: de CR3BP laat de Zon, de excentriciteit van de Maan en het stationkeeping dat CAPSTONE uitvoerde weg, dus de drempels beschrijven hoe representatief de modelbaan is, niet een nauwkeurigheid. Resultaten: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE maart { "2023" }, { "4" } perilunes en { "5" } apolunes: periode { "6.5004" } d tegen { "6.5699" } d ({ "1.07" } %, drempel { "3" } %), apolune { "71 182" } tegen { "71 215" } km ({ "0.05" } %, drempel { "5" } %), perilune { "3 385" } tegen { "3 245" } km ({ "4.1" } %, drempel { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

seg-30e946bde474 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie tegen een gesloten vorm: onder het lineaire Gauss-model is de kleinste-kwadratencovariantie sigma^{ "2" } (H^T H)^-1 (Kaplan en Hegarty (red.), Understanding GPS: Principles and Applications, 2e dr., Artech House, { "2006" }, hfdst. { "7" }). Methode en toleranties van de ontwerpnotitie over geometrie van { "0.36" }, sectie { "5.2" }, vastgelegd in een preregistratiecommit vóór de eerste run: elke variantie binnen { "5" } % ({ "5" } standaardfouten van een steekproefvariantie bij N = { "20,000" }), elke RMS binnen { "2.5" } %, de oost-noordcorrelatie binnen { "0.035" } (5/sqrt(N)), elk gemiddelde binnen { "5" } standaardfouten, de { "95" } %-ellipsfractie binnen { "0.95" } +/- { "0.0077" } ({ "5" } binomiale standaardfouten); negatieve controles (PDOP verdubbeld; fouten die groeien als 1/sin(elevatie) tegen de ongewogen Q) moeten falen. HOE HET IS SAMENGESTELD: Q is de covariantiefactor van de kernel orbit::dop, VALIDATED tegen gnss_lib_py { "1.0.4" } op ditzelfde stel van { "8" } geometrieën in tests/dop_reference.rs (rij 'GNSS geometry / dilution of precision'); deze rij voegt de stap van die factoren naar meters via de solver van de engine toe en leent de status van die rij niet. WAAROM MODELLED: er is geen externe dataset bij betrokken; overeenstemming toont dat de schatter en de ruis sigma x DOP realiseren onder het leerboekmodel, niet dat de fout van enige ontvanger gelijk is aan UERE x DOP, en sigma_UERE is een invoer

seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: alle { "104" } controles slagen bij de eerste run na preregistratie e50c88d2, slechtste variantie { "3.2" } %, RMS { "1.6" } %, correlatie { "0.012" }, gemiddelde { "2.2" } standaardfouten, ellipsfractie { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: beide controles falen zoals vereist; position_error_is_sigma_times_dop_on_masked_skies: de twee geometrieën met gemaskeerde skyline van de ontwerpnotitie, de 10sat-mixed-hemel onder de voorinstellingen city-street ({ "4" } satellieten, PDOP { "16.6" }) en container-terminal ({ "9" } satellieten, PDOP { "2.5" }), alle { "26" } controles slagen bij de eerste run na preregistratie 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (een eerste, afzonderlijke controle op vier met de hand gekozen hemels (open, geclusterd, canyon, halve hemel; sigma { "1" } m, seed 0x0D0B5EED) met chikwadraat-betrouwbaarheidsintervallen van in totaal { "1e-6" } over { "20" } controles: verhoudingen { "0.987" } tot { "1.009" }, de eigen PDOP/GDOP van de solver gelijk aan die van de kernel tot { "2.5e-12" }, en negatieve controles voor een DOP-fout van { "10" } % en fouten van 1/sin(elevatie); gedraaid vóór de preregistratie, dus gerapporteerd, niet vooraf vastgelegd); dop_error_mc::tests; dop_error_ci::tests

seg-d40d54b79e58 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: de classificatie wordt getoetst aan de regels die ze vermeldt en aan met de hand afgeleide verhoudingen op synthetische bewerkingen van het vastgelegde demolog, en de no-change-pins houden de uitvoer van { "0.35.0" } vast: geen enkele score verandert tenzij de geometrie slecht is; het label wordt altijd gerapporteerd. WAAROM MODELLED: de drempels zijn gekozen, niet gefit (herkomst in de geometry_model van elke run; de cijfers van IEC 61108-1 en GPS SPS zoals aangehaald, nog te controleren aan de tekst van de standaarden), en er is geen externe gelabelde dataset van natuurlijke geometriedegradatie tegenover aanvallen om de classificatie aan te valideren. De afgeleide DOP hergebruikt de kernel orbit::dop, VALIDATED tegen gnss_lib_py, wiens status deze rij niet leent. Een geometrieklasse is een uitspraak over de hemel, geen bevinding dat er geen aanval heeft plaatsgevonden

seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: op de synthetische fjordpassage van scenarios/training/fjord-natural-degradation.toml worden dezelfde { "624" } epochs afgetrokken met en zonder de opgegeven [skyline]; ermee wordt sky-blocked gerapporteerd op { "680" } epochs ({ "0" } zonder: de terugval op azimutgaten ziet niets in een fjord met twee zijden), open_fraction is { "0.758" } en de epochs van de omgevingsklasse dalen van { "78" } naar { "33" }, de rest zijn verliezen van satellieten die de opgegeven skyline in het open laat; buiten de gebeurtenis verandert de skyline geen enkele score); receiver_trust::geometry::tests (met de hand afgeleide verhoudingen bij de drempels, de drempelranden, de ramp en het plafond, de ondergrens, de labelranden, [geometry]-overschrijvingen, de DOP op de gevalideerde kernel, vastgehouden en verlopen hemels, onbekend niet geraden, signaalverlies, de tolerantie voor slechte geometrie, no-fix-sentinels); tests/geometry_trust.rs (een redelijke gemaskeerde hemel gelabeld en niet gescoord, een slechte gemaskeerde hemel, een verlies bij lage elevatie, een vermogensdaling, een vervalste HDOP, totaal signaalverlies, een drag-off tijdens slechte geometrie, onbekende geometrie, sessie-overschrijvingen, het live-schema); tests/geometry_trust_no_change.rs (beide voorbeeldsessies byte-identiek aan { "0.35.0" } zodra de toegevoegde sleutels zijn verwijderd); tests/geometry_corpus_identity.rs (elk vastgelegd NMEA-corpus van een vaartuig, ook als GPS-only open hemel, en de bemanningstrainingsscenario's: byte-identiek aan { "0.35.0" } behalve slechte epochs, die alleen verschillen door de geometrieaftrek)

seg-7e9cae219d72 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Intern: de gesloten vormen worden getoetst aan met de hand berekende waarden (elevaties van muurtoppen van een opgegeven straat, de open-eindvoorwaarde, de krommingsdaling van een opgegeven punt). Geen externe referentie: de ontwerpnotitie begrenst deze reducties als MODELLED, en Orekits ElevationMask neemt een tabel, dus de vergelijking van rij 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' leest hun tabellen met 360 punten als invoer en toetst ze niet

seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

seg-7ade0dffb2d8 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Geen: gekozen en opgegeven afmetingen, geen opmeting van enige straat, haven, fjord of terminal (de aspectverhouding van de straat ligt binnen de band 0.5-2 van Oke ({ "1988" }); de fjord is van de orde van de West-Noorse fjorden; de stapels gebruiken de ISO { "668" } high-cube-hoogte). De test toetst de voorinstellingen aan hun eigen opgegeven afmetingen, een transcriptiecontrole, die de validatieregel niet meetelt

seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

seg-00884df89ab2 = ReferenceImpl

seg-2ddc2b97e673 = getoetst aan een aparte implementatie in ditzelfde codebestand — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend — De DOP-factoren met één klok berusten op de kernel die is getoetst aan gnss_lib_py { "1.0.4" } (rij 'GNSS geometry / dilution of precision (DOP)'); de eigen controles van deze rij zijn intern: sky_geometry reproduceert orbit::dop en dop_cov op dezelfde geometrie, de ellips reproduceert een analytische 2x2-eigenontbinding, ECEF- en azimut/elevatie-invoer komen overeen, en de RMS en de { "95" } %-insluiting van de gezaaide wolk komen overeen met de geometrie. De ENU-covariantie met één klok per systeem en de ellips zijn VALIDATED in rij 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); wat hier MODELLED blijft, is de samenstelling: de propagatie van voorinstellingen naar een representatieve hemel, de Monte Carlo-wolk (getoetst aan de geometrie die ze bemonstert, een zelfconsistentiecontrole) en de oppervlakken. De constellatievoorinstellingen geven een representatieve hemel, geen gedateerde; het Gauss-foutmodel en de UERE zijn opgegeven invoer, geen gemeten nauwkeurigheid of integriteitsgrens

seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (de kernel met één klok tegen gnss_lib_py)

seg-0b5caf359b15 = getoetst aan een aparte implementatie in ditzelfde codebestand — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend — Recursie van de clock_state-covariantie in meerdere stappen (kruiscontrole binnen hetzelfde codebestand); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdover-cijfers per klasse met rode-ruisbodem blijven MODELLED

seg-085cbc64bab2 = holdover

seg-b31ed8fc6801 = holdover::tests (tegen de Kalman-covariantierecursie in meerdere stappen; witte FM exact; round-trip); coast-variantiekernel extern getoetst in tests/gnss_denied_clock_holdover_reference.rs (tegen scipy Van-Loan/brentq)

seg-8b8c97b664c2 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Gemeten records, achtergehouden: IGS final combined-klokken van { "30" } s van de { "11" } GPS Block IIF-satellieten over 2026-03-01 tot { "14" } (een venster dat geen enkele test had geopend; IGS, open met naamsvermelding) en de u-blox ZED-F9P-ontvanger van JammerTest { "2024" } in zijn niet-gescoorde stationaire sessies (GPL-3.0-or-later). D9 externe vergelijking (vooraf vastgelegd 2ec76864, de voorspelde / gemeten Allan-deviatie van elke kaart binnen [1/1.5, { "1.5" }] bij haar gefitte middelingstijden), een bevinding (blijft MODELLED): { "10" } van de { "11" } GPS IIF-kaarten liggen binnen de drempel; G27 is optimistisch op de schaal van twee uur ({ "0.662" } bij { "7680" } s, slechtste factor { "1.510" }), de periodieke fout op uurschaal die een machtswetkaart niet draagt. De TCXO-kaart van de ontvanger is geblokkeerd: buiten de gelogde uitzendingen laten de andere sessies van de dataset { "167" } epochs over tegenover de vereiste { "3600" }. Gerapporteerd, niet blind (records die door eerdere rijen zijn geopend): de 5071A-cesiumkaart ligt binnen de drempel (slechtste { "1.070" } tot { "4096" } s), de OCXO-kaart is conservatief en erbuiten ({ "2.348" } bij { "128" } s; zijn ruisbodem verandert tijdens de opname), en de strontiumkaart van Norcia, gefit op de drie kortste gepubliceerde punten, ligt erbinnen op de twee gescoorde punten ({ "1.291" }, { "1.405" }). Passieve waterstofmasers van Galileo (geen bereikbare bron zonder login voor definitieve Galileo-klokken) en de Deep Space Atomic Clock (één open waarde in de ruimte) zijn geblokkeerd. D9 ronde { "2" }, de ZED-F9P-ontvanger-TCXO als modelklasse op { "14" } dagen van { "12" } statische stations in Wrocław (Zenodo { "6488497" }, CC BY { "4.0" }; vooraf vastgelegd fb475550), een bevinding: met de geregistreerde pipeline waren { "11" } van de { "12" } stations niet evalueerbaar (RAIM verwierp de meeste ionosfeervrije epochs) en BX14 faalde; een openbaar gemaakte herrun met een gecorrigeerde pipeline (vooraf vastgelegd c9cc0d49) slaagt voor { "1" } van de { "11" } blinde stations (BX12, { "1.412" }; BX07 { "1.532" } en BX13 { "1.542" } er net buiten), omdat klokken van single-point-ontvangers uit onderbroken bestanden van { "30" } s geen zuiver oscillatorrecord zijn

seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; vooraf vastgelegd 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; gated op data)

seg-a2202f0e06b2 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Gemeten records, achtergehouden: IGS final combined-klokken van { "30" } s van de { "11" } GPS Block IIF-satellieten over 2026-04-01 tot { "14" } (een venster dat geen enkele test had geopend; IGS, open met naamsvermelding). D9 externe vergelijking (vooraf vastgelegd fb475550, voorspelde / gemeten Allan-deviatie binnen [1/1.5, { "1.5" }] bij elke gefitte middelingstijd op elke satelliet), een bevinding (blijft MODELLED): { "9" } van de { "11" } kaarten liggen binnen de drempel; G03 ({ "1.947" }) en G25 ({ "1.581" }) zijn optimistisch tussen { "60" } s en { "2000" } s omdat hun achtergehouden records ruisiger zijn dan hun fitderden (het achtergehouden deel van G25 bevat { "16" } gaten en { "29" } faseuitschieters), een verandering van de klok in plaats van een ontbrekende periodieke term. Het weglaten van de periodieke termen uit de voorspelling laat alle { "11" } kaarten falen ({ "1.77" } tot { "4.96" }), dus de termen dragen de voorspelling

seg-d302e2ef46ad = clock_library (card)

seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; vooraf vastgelegd fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

seg-1c858b039ab0 = getoetst aan een aparte implementatie in ditzelfde codebestand — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend — filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de blokmatrix van Van-Loan { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. Externe vergelijking van { "0.30" }, een bevinding (blijft MODELLED): op IGS final-klokken van { "30" } s van { "11" } GPS Block IIF-satellieten (2025-08-17 tot { "30" }), met Q gefit op de ADEV van de eerste helft en het filter gescoord op de achtergehouden tweede helft, is het filter één stap vooruit consistent ({ "0.906" } tot { "0.971" } van de epochs binnen zijn { "95" } %-band, drempel { "90" } %) maar overmoedig na een uur bij { "9" } van de { "11" } klokken ({ "0.486" } tot { "0.829" }) en vallen zijn innovatiesommen buiten [{ "2.4" }, { "3.6" }] bij { "5" }. De gefitte witte-faseruis is nul op elke satelliet, en de fout op uurschaal (periodieke termen, flicker-FM) zit niet in het model met 3 toestanden. Ronde { "2" } van { "0.30" }, een uitgebreid filter (flicker-FM en toestanden eenmaal en tweemaal per omwenteling) op verse achtergehouden IGS-klokken van 2025-09-01 tot { "14" } (vooraf vastgelegd 4b1a841e), een bevinding (blijft MODELLED): de consistentiecriteria voor één stap en één uur gelden op alle { "11" } satellieten ({ "0.948" } tot { "0.988" } en { "0.907" } tot { "0.996" }), maar het innovatiesomcriterium faalt op G24 ({ "0.964" }) en G30 ({ "1.929" }) tegen [{ "2.4" }, { "3.6" }]. D9 ronde { "3" }, het uitgebreide filter van ronde 2, afstemming en criteria ongewijzigd na de bevroren conditioneringsdetector van clock_library, op verse IGS-klokken van 2026-04-01 tot { "14" } (vooraf vastgelegd fb475550), een bevinding (blijft MODELLED): (a) één stap { "0.941" } tot { "0.968" } en (c) gemiddelde van drievoudige NIS { "2.641" } tot { "3.549" } gelden op alle { "11" } satellieten; (b) één uur faalt op G09 ({ "0.894" }) en G26 ({ "0.876" }) tegen { "0.90" }

seg-3016100a7015 = clock_state::tests (analytische van-Loan-Q; NEES; positiviteit van de PSD); tests/clock_state_reference.rs (volledig predict+update-traject — toestand x en covariantie P van { "3" }×{ "3" } over { "1925" } stappen / { "4" } parametersets tegen filterpy { "1.4.5" }; slechtste |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (legt de bevinding vast); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ronde { "3" })

seg-27554b73549b = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Sagnac-grootte getoetst aan een gezaghebbende GEPUBLICEERDE WAARDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), vgl. { "1.29" }: een oostwaartse omloop langs de evenaar levert { "207.4" } ns op (2ωA_E/c²); kshana reproduceert { "207.386" } ns. Onafhankelijk bevestigd door RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), dat dezelfde 2Aω/c²-geometrie bevat. Het samengestelde budget van BIPM TWSTFT-transponder/common-view/PPP heeft geen externe referentie, dus de mogelijkheid blijft gemodelleerd

seg-509026100595 = timetransfer, timetransfer_adv

seg-a1ad8fb8537d = timetransfer::tests (reciproque opheffing; Sagnac-identiteit in twee vormen); tests/time_transfer_error_budgeting_reference.rs (Sagnac bij omloop langs de evenaar = { "207.386" } ns tegen de gepubliceerde { "207.4" } ns van Ashby tot <{ "0.05" } ns; plus Sagnac/geodist-geometrie kruiselings gecontroleerd tegen RTKLIB { "2.4.3" } geodist(), gecompileerd uit C-broncode)

seg-a5714c98b299 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Kruis- en autocorrelatie van GPS C/A Gold PRECIES gelijk (geheel ±65/−1/63) aan onafhankelijke codegeneratie volgens IS-GPS-200; PSD-vorm van BPSK-R({ "1" })/BOC({ "1,1" }) tegen een onafhankelijk scipy-periodogram. De gesloten vormen voor modulatie/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) blijven analytisch, dus de rij blijft MODELLED — maar de deelclaim over codecorrelatie is extern gematcht. Ronde { "2" } van { "0.30" }, tegen de afgedrukte waarden van Betz { "2001" } en Hein et al. { "2006" } (vooraf vastgelegd 9f4f2ce8, een halve afgedrukte eenheid), een bevinding (blijft MODELLED): alle { "45" } spectrale cellen van tabel { "1" }, de correlatiewaarden bij { "1" } GHz, de MBOC-interferentiecijfers en { "2" } van de { "3" } offsets van fig. { "17" } komen overeen; de eerste zijlobben bij { "24" } MHz, de offset van BOC({ "8,4" }) in fig. { "17" } en elke worstcase-multipathbias van fig. 18-21 ({ "11" } tot { "15" } % laag) niet. Kshana en een onafhankelijke NumPy-evaluatie van de vooraf vastgelegde lezing komen overeen, dus het verschil ligt in die lezing of in een niet vermeld detail van het artikel; oorzaak onopgelost

seg-10e0cb39ac3b = navsignal

seg-1035f877de94 = navsignal::tests (BPSK-eigen-SSC = 2/3R_c; PSD met eenheidsoppervlak; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (kruis- en autocorrelatie van GPS C/A Gold exact geheel gelijk aan onafhankelijke codegeneratie volgens IS-GPS-200; PSD van BPSK-R({ "1" })/sinus-BOC({ "1,1" }) tegen een onafhankelijk scipy-periodogram); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, vastgepind)

seg-9fe0ec8c4531 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Gepubliceerde numerieke vectoren uit primaire CAI-artikelen (overdrachtsfunctie van Cheinet { "2008" }; gevoeligheid van Peters/Freier): k_eff·T² exact gelijk, ASD van shotruis een eenzijdige bodem binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten hebben technische ruis boven de kwantumbodem). Een bandbreedte, geen gelijkheid. Ronde { "2" } van { "0.30" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de alleen-QPN-rotatieruis tegen de gemeten punten van Gauguet et al. { "2009" } fig. { "14" } geeft verhoudingen van { "0.695" } tot { "0.788" } op de drie toegelaten punten ({ "0.751" } op het werkpunt), en mist de vooraf vastgelegde drempel van { "30" } % met { "0.5" } punten; de QPN-bodem ligt { "21" } tot { "31" } % onder de gemeten ruis, zoals te verwachten is van een model zonder laser- en detectieruis. De gradiometersamenstelling komt overeen met de QPN-modellijn van Janvier et al. { "2022" } (verhouding { "1.013" } tot { "1.017" }, Reference). De gemeten test kan een samenstellingsfout van sqrt({ "2" }) niet onderscheiden; alleen de Janvier-lijn met ongelijk contrast kan dat

seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016-bodembracket); tests/quantum_inertial_sensor_reference.rs (overdrachtsfunctie |H(ω)|, k_eff·T² en ASD van shotruis tegen gepubliceerde numerieke vectoren van Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, vastgepind; gradiometer_qpn_line_matches_janvier_model)

seg-0b9af8a14a54 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Zelfconsistentie van het interferometer-fringemodel: de halve-fringerand, de 2π-periodieke aliasingstructuur en de opheffing van de schaalfactor in de verhouding bereik/resolutie zijn algebraïsche identiteiten in gesloten vorm, getoetst aan de eigen fase- en gevoeligheidsfuncties van Mach–Zehnder van de engine — controles op interne consistentie, GEEN externe dataset, dus de rij blijft InternalConsistency. MODELLED ideale fringe-ambiguïteit met drie pulsen; geen grenzen voor golffrontaberratie of contrastverlies op het ondubbelzinnige bereik

seg-81802510f112 = quantum_imu::tests (a_max ligt op de ±π-halve-fringerand met de 1/T²-bereikschaling; herstel van de ingepakte fase is exact binnen [−a_max,a_max] en aliast met exact { "2" }·a_max erbuiten; het ondubbelzinnige dynamische bereik a_max/σ_a=π/σ_Φ is identiek bij twee sterk verschillende schaalfactoren voor golflengte/T; de methoden van CaiAccelerometer komen overeen met de vrije functies)

seg-91728172ea50 = getoetst aan een aparte implementatie in ditzelfde codebestand — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend — Onafhankelijke numpy Monte Carlo-SDE-integratie van tweemaal geïntegreerde witte-versnellingsruis (toetst de analytische VRW-variantie met een werkelijk onafhankelijk algoritme) + een verankering aan een gepubliceerde waarde van Groves { "2013" } voor de bias- en schaalfactortermen; de CAI-apparaatcijfers kwantificeren hardware van de partner en blijven MODELLED

seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

seg-60fb2adb58ce = budget_tests (bias tegen AccelModel-integrator; VRW tegen analytische integraal); tests/quantum_inertial_dead_reckoning_reference.rs (VRW tegen een onafhankelijke numpy Monte Carlo-dubbele integratie van witte-versnellingsruis, slechtste afwijking { "0.42" }% binnen ±{ "3" }% over { "6" } coasttijden; bias/schaalfactor tegen een gesloten-vormwaarde van Groves { "2013" }; holdover-round-trips)

seg-8bc5bc7d553c = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Vergelijking van het anti-jam C/N₀-linkbudget gecontroleerd tegen een onafhankelijke numpy-herafleiding (deelt dezelfde gesloten vorm → InternalConsistency) plus een karakterisering van de echte C/N₀-degradatie van JammerTest 2024. Ronde { "2" } van { "0.30" }, geblokkeerd (blijft MODELLED): de gemeten C/N0-daling van JammerTest { "2024" } tegen een linkbudgetvoorspelling (vooraf vastgelegd 6a66994b, binnen { "3" } dB) is niet gedraaid omdat de antennepositie en -richting van F8.1 bij Bleik en het L1-aandeel van het multibandvermogen van de ramp van { "1.6.4" } niet zijn gedocumenteerd in de testcatalogus of het officiële log

seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form en cw_q_equals_the_spectral_separation_closed_form: de Q-tabel, CW en smalband { "1" }, breedband en gesweept { "2" }, vastgepind aan de gesloten vormen van navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effectieve C-N₀ tegen een onafhankelijke numpy-herafleiding van het linkbudget van Kaplan & Hegarty §{ "9.4" }; echte JammerTest-C/N₀ daalt monotoon door de drempel van { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (vooraf vastgelegd, geblokkeerd, niet gedraaid)

seg-26b6c4436ca0 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Scenarioparameters van TEXBAT (Humphreys { "2012" }) — karakterisering, geen vastgepinde vectoren. Externe vergelijking van { "0.30" }, een bevinding (blijft MODELLED): op JammerTest { "2024" } (Bleik; GPL-3.0-data) sloegen de monitors op waarnemingsniveau (klokondersteunde chikwadraat, RAIM, mislukte oplossing) geen alarm binnen { "10" } s na een van de { "8" } evalueerbare gepubliceerde spoofing-beginmomenten (waar het venster vóór het begin schoon was, kwam het eerste alarm { "10.2" } tot { "39" } s na het gepubliceerde slotbegin), en drie vensters vóór het begin bevatten valse alarmen van de klokmonitor ({ "81" }, { "64" } en { "173" } epochs). Het eerste waarneembare effect was een verlies van tracking van GPS op twee frequenties, geen RAIM-inconsistentie. De gepubliceerde beginmomenten zijn slotbegintijden van het schema met een resolutie van een minuut; dat ze aan de RF-opname voorafgaan, is een interpretatie, geen meting. Ronde { "2" } van { "0.30" }, tegen het officiële log van JammerTest { "2024" } van de organisatoren (resolutie van een seconde; vooraf vastgelegd 6a66994b met een Hadamard-gekalibreerde klokmonitor met drie toestanden zonder latching), een bevinding (blijft MODELLED): de monitor slaat alarm binnen { "10" } s bij { "4" } van de { "10" } gelogde beginmomenten; bij de andere zes is hij { "18" } tot { "211" } s te laat of geeft hij valse klokalarmen vóór het begin ({ "1" } bij { "2.1.4" }, { "85" } bij { "2.3.15" }). D9 ronde { "3" } (een ontvangerkaart uit de andere sessies van de JammerTest-eenheid, vooraf vastgelegd 2ec76864) geblokkeerd: { "167" } trainingsepochs tegenover { "3600" }. D9 rondes { "4" } en 4b (ruisniveaus uit een modelklassekaart van een u-blox ZED-F9P, Wrocław { "2021" }, vooraf vastgelegd fb475550; 4b een openbaar gemaakte herrun met een gecorrigeerde extractie, c9cc0d49), een bevinding (blijft MODELLED): nul valse alarmen vóór het begin bij alle { "10" } gelogde beginmomenten en { "6" } van de { "10" } binnen { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } en { "2.6.1" } blijven te laat (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), ongewijzigd door het klokruisniveau

seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (karakterisering van TEXBAT-parameters); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (legt de bevinding vast); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

seg-964d859381f5 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Stelt getoetste primitieven samen (allan/holdover van Loan, beveiligingsbodem); gekalibreerd op JammerTest { "2024" }-scenario { "2.1.1" } (~{ "1.01" } ms echte afwijking van de aangeboden tijd tegen ≤{ "51" } ns beweerd). Brug over getoetste delen — zelf geen externe validatie. Externe vergelijking van { "0.30" }, een bevinding (blijft MODELLED): in de spoofingscenario's van JammerTest { "2024" } overschrijdt de gemeten onopgemerkte fout in de aangeboden tijd de nominale TPL bij { "3" } van de { "8" } gedetecteerde beginmomenten: { "184.3" } tegen { "34.6" } ns ({ "2.1.4" }), { "295.7" } tegen { "159.3" } ns ({ "2.3.5" }) en { "143.0" } tegen { "69.0" } ns ({ "2.3.11" }); drie van de vijf binnen de grens zijn triviaal (een vergrendeld vals alarm vóór het begin). Waarschijnlijke oorzaak: de coastterm uit een kalibratie van { "60" } s met nul driftruis dekt de frequentiezwerving van de TCXO van de ontvanger over { "15" } tot { "39" } s niet. De gemeten fout is de eigen single-point-klokschatting van Kshana tegen een lijn gefit op zijn eigen schattingen vóór het begin, dus zelfs overeenstemming zou niet volledig onafhankelijk zijn geweest. Ronde { "2" } van { "0.30" }, tegen de beginmomenten in het officiële log van JammerTest { "2024" } en de gemeten tijdfout van de ontvanger (vooraf vastgelegd 6a66994b), een bevinding (blijft MODELLED): bij { "4" } van de { "10" } gelogde beginmomenten overschrijdt de onopgemerkte fout de TPL met driftstoestand ({ "634.7" } tegen { "458.5" } ns bij { "2.1.1" }, { "232.6" } tegen { "16.2" } ns bij { "2.3.5" }, { "41.3" } tegen { "6.0" } ns bij { "2.3.10" }, { "218.6" } tegen { "47.4" } ns bij { "2.6.3" })

seg-9cb72e60e080 = tpl

seg-b96e16aba41a = tpl::tests (oracles in gesloten vorm + CUSUM); examples/tpl_jammertest.rs (kalibratie op echte spoofing van JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (legt de bevinding vast); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

seg-f2efb9b15383 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — IGRF-14-coëfficiënten; CRLB van het matched filter uit eerste beginselen. Het veld van de zwaartekrachtbenchmark met echt veld is extern getoetst (rij 'Gravity-anomaly synthesis from a spherical-harmonic model'), maar de navigatie-uitkomst ervan heeft geen externe referentie

seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB van map-matching; IGRF-14-veld); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (de benchmark van 60 min zonder GPS op het echte EGM2008-veld van graad 70, vooraf vastgelegd in xval/icgem-egm2008/: gematcht { "3106" } m, dus de drempel < { "500" } m is NOT MET en als gemist vastgelegd, en de tienvoudige verlaging van de drift van { "70.6" } km is MET; plus de gezaaide Monte Carlo van de kaartfout); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel en tests/emag2_real_grid.rs (op data gated EMAG2v3-lezer op een echt uitsnede; er wordt geen navigatie-uitkomst mee beweerd); tests/terrain_slam_rbpf.rs (gezamenlijke kaartschatting, een RBPF in FastSLAM-stijl, tegen SITAN met bekende kaart bij een gecorreleerde kaartfout van { "15" } m over { "20" } seeds, vooraf vastgelegd in xval/terrain-slam-rbpf/: { "1.5" }% gemiddelde winst en beter in { "10" } van de { "20" }, dus de drempels van { "10" }% en 12 van 20 zijn NOT MET en als gemist vastgelegd; geen schade op een perfecte kaart, MET)

seg-d7fd40dc37c6 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Schemacontrole van de SBOM tegen het officiële CycloneDX { "1.5" } JSON Schema (+ geldige SPDX-identificatoren) — een externe gepubliceerde standaard, nul validatiefouten over de volledige afhankelijkheidsgraaf; het deel over FoM-determinisme / byte-reproduceerbaarheid blijft een vastgepinde zelfconsistentiecontrole, dus de rij blijft MODELLED

seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (de gegenereerde SBOM valideert met nul fouten tegen het officiële CycloneDX { "1.5" } JSON Schema over de volledige meegeleverde graaf van 66 componenten: standaard- + python- + wasm-features, dev-afhankelijkheden uitgesloten)

seg-a014f82f28b0 = Evaluatie van detectie van RF-storingen met machine learning ({ "13494" })

seg-400e45e7e700 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — AUC-grenzen in gesloten vorm (Mann–Whitney) + een detector met perfecte referentie; het corpus is SYNTHETISCH (op parameters gegrond, geen veld/IQ)

seg-e4edd8fd654c = impairment_eval::tests (AUC perfect=1/identiek=0.5/gelijk={ "0.125" }, ROC monotoon, gefuseerd>{ "0.8" }, laagscheiding per klasse, lekbeveiliging, reproduceerbaar corpus, vlaggen voor distributieverschuiving duiden op optimisme); dominance_demonstrators (bereikbaar + reproduceerbaar + MODELLED-niet-VALIDATED + zelfconsistente optimismekloof)

seg-7566da9904ba = Studie naar de optimismekloof bij detectie van RF-storingen met machine learning & voorspeller van de kloof uitsluitend op ID

seg-0d7f46d20a0d = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Met de hand afgeleide statistieken tegen gesloten vormen (binormale AUC Φ(d'/√{ "2" }), DeLong-variantie, Spearman met gelijke rangen, exact OLS-herstel) + leave-one-out-CV tegen de baseline die het gemiddelde voorspelt. Het corpus is SYNTHETISCH (op parameters gegrond, nooit veld/IQ) en de optimismekloof is een synthetisch→synthetische ernstverschuiving, GEEN sim-naar-veldresultaat

seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

seg-b30ce36e7afb = impairment_study::tests (referentie-AUC per klasse≈{ "1" }, geleerde optimismekloof>{ "0" }, rastervorm + bootstrap-BI omvat het gemiddelde + positieve schalingstrend, ID-kenmerken eindig, kloofvoorspeller verslaat het voorspellen van het gemiddelde onder ZOWEL leave-one-detector-out- als leave-one-class-out-CV + deterministisch); impairment_ml::tests (logreg scheidt + deterministisch + verlies↓, MLP lost XOR op die een lineair model niet kan + gezaaid); eval_stats::tests (bootstrap/DeLong/Spearman/ridge tegen gesloten vormen)

seg-590ec8589ce6 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — De kernel voor de fit van gemeten ADEV→PSD (NNLS) komt overeen met scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — een onafhankelijke externe kernel; maar de CIJFERS van de afweging kwantificeren (en valideren nooit) een klok/CAI van de partner, dus de afweging zelf blijft MODELLED, zonder schijn van validatie

seg-e0f68f57399d = quantum_trade::tests (herstel van ADEV-round-trip, niet-negativiteit van NNLS, bodemvoorbehoud aanwezig/afwezig, voordeel>{ "1" }, monotone envelop + grens voor alt-PNT); dominance_demonstrators (gemeten ADEV is datagedreven en niet bodem-verondersteld, veronderstelde klasse markeert bodem + voorbehoud, misvormde curve geweigerd, MODELLED-niet-VALIDATED)

seg-7d1d24d8f8f5 = een deelclaim is extern getoetst, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd — Definitionele tabel Kp↔ap + gesloten vorm van de exosferische temperatuur van Jacchia-1971 (gematcht tot <{ "1" } K tegen de gepubliceerde ankers, tests/space_weather_reference.rs); de dichtheid is gekarakteriseerd tegen pymsis NRLMSISE-00 (een onafhankelijk NRL-model): de zonnecyclusuitslag op { "800" } km is 10.4x tegen 13.6x bij NRLMSISE-00. Herziening van { "0.30" }: de gekalibreerde activiteitsfactor van de eerste orde is vervangen door Jacchia { "1971" } (scenariodichtheid in de standaardinstelling op { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k verwijderd, mean_exospheric_temperature_k toegevoegd). Ronde { "2" } van { "0.30" }, gemeten versnellingsmeterdichtheden van TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; vooraf vastgelegd 20eed695), een bevinding (blijft MODELLED): baangemiddelden op { "400" } tot { "500" } km liggen binnen een factor { "2" } bij zonnemaximum buiten stormen (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), maar Jacchia { "1971" } is ongeveer 1.7x te dicht in het zonneminimum van { "2008" } (GRACE-A 412/544 binnen een factor { "2" }), dus de dichtheid is niet extern getoetst

seg-550bd3cee63e = space_weather::tests (Kp↔ap exact op rasterpunten + round-trip + monotoon, dagelijks Ap-gemiddelde, exosferische T tegen gepubliceerde ankers voor zonneminimum/gemiddelde/maximum + stormtoename, dichtheid eenheid-bij-referentie, zonnecyclusuitslag in de waargenomen band van { "5" }–{ "10" }×, scenario reproduceerbaar + MODELLED-niet-VALIDATED + weigering buiten bereik); dominance_demonstrators (bereikbaar + reproduceerbaar + fysische T + MODELLED-niet-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

seg-83c77a559939 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Lanceergeometrie in gesloten vorm met sferische trigonometrie tegen ankers uit gepubliceerde uitgewerkte voorbeelden (Vallado, Fundamentals of Astrodynamics 4e dr., Algoritme { "37" } lanceerazimut + hfdst. 6 vlakwijziging; tests/launch_window_ascent_geometry_reference.rs). Deze hergebruiken dezelfde gesloten vorm die kshana implementeert (een pariteitscontrole met gepubliceerde waarden / transcriptiecontrole, InternalConsistency); MODELLED tweelichamenprobleem, geen snelheidsdriehoek met roterende aarde, geen model voor opstijging of weerstandsverlies. Externe vergelijking van { "0.30" } tegen Orekit { "12.2" } (Apache-2.0), een bevinding (blijft MODELLED): de geometrie komt overeen tot op afronding (inclinatie teruggelezen uit het burnout-azimut over { "158" } gevallen, slechtste { "2.6e-15" } rad; minimale inclinatie, cirkelsnelheid en dogleg-delta-v tot { "3e-16" }), maar de locatiesnelheid door aardrotatie mist de vooraf vastgelegde { "1e-6" } relatief op { "62.9" } graden breedte ({ "1.12e-6" }). Het verschil groeit als tan(lat), consistent met een poolbeweging-poolverschuiving van ongeveer { "5.8e-7" } rad in het aardstelsel van Orekit die de sferische ω·R·cos(lat) weglaat. De claim was vóór de run niet versmald, dus de rij kan op grond van deze vergelijking niet worden bevorderd. Ronde { "2" } van { "0.30" } (vooraf vastgelegd 71bebf63): met een epoch en IERS-rijen komt de locatiesnelheid met ware pool overeen met Orekit binnen { "1e-6" } op { "24" } locaties over vier lengtegraden (slechtste { "4.9e-8" }), maar de nominale snelheid zonder epoch die het scenario standaard als aardrotatiebonus uitgeeft, mist nog steeds met { "1.12e-6" }, dus de rij blijft MODELLED in afwachting van een besluit over de standaarduitvoer

seg-80847ffc93bf = launch

seg-2095b880eb39 = launch::tests (lancering pal oostwaarts bereikt i=breedtegraad, KSC→ISS = leerboek { "45" }°, polair = N/Z, i<breedte onbereikbaar, { "465" } m/s equatoriale bonus, vlakwijziging van { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, aantallen dagelijkse mogelijkheden, scenario reproduceerbaar/MODELLED + dogleg-pad); dominance_demonstrators (bereikbaar + reproduceerbaar + KSC→ISS { "45" }° + MODELLED-niet-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

seg-2a0f9d168a02 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Analytische Allen–Eggers-intrede in gesloten vorm, aanvullend gecontroleerd tegen een numerieke integratie met scipy { "1.18" } solve_ivp (DOP853) van DEZELFDE ODE voor intrede met alleen weerstand (tests/ballistic_re_entry_corridor_reference.rs, { "36" } gevallen, slechtste a_max rel { "2.9e-9" }) — een controle van numerieke integraal tegen eigen analytische vorm, dus nog steeds InternalConsistency, GEEN externe validatie. MODELLED ballistisch (geen lift), geen aerothermisch/TPS — de verwarmingsuitvoer is een snelheid, geen warmteflux. Externe vergelijking van { "0.30" }, een bevinding (blijft MODELLED): tegen de reconstructie van de intrede van de Stardust SRC (Desai en Qualls, NASA NTRS { "20080008567" }) is de piekvertraging volgens Allen–Eggers voor de afgedrukte inertiale intredetoestand ({ "12.9" } km/s, -8.2 graden, H { "7200" } m) { "61.8" } g tegen { "32.89" } g van het best geschatte traject, +{ "88" } % tegen een tolerantie van { "15" } %: de oplossing met constante baanhoek zonder zwaartekracht verdubbelt ruwweg de piek van een ondiepe intrede sneller dan de ontsnappingssnelheid. Stardust had geen versnellingsmeter, dus de reconstructie is een trajectschatting. Ronde { "2" } van { "0.30" }, geblokkeerd (blijft MODELLED): een geïntegreerde vlakke puntmassaoplossing (reentry::simulate_planar_entry, US76, zwaartekracht omgekeerd kwadratisch, kromming) komt overeen met de best geschatte trajecten van Stardust en Genesis binnen { "15" } % (+{ "11.3" } %, +{ "5.6" } %), maar die maxima zijn simulatie-uitvoer van agentschappen, geen metingen, dus dit is alleen een kruiscontrole. De vergelijking met de versnellingsmeter (vooraf vastgelegd a94a283d) is geblokkeerd op een leesbare kopie van de REMM-analyse van Hayabusa2 (doi 10.57350/jesa.16)

seg-c763ac7e3cda = reentry::tests (piek-g onafhankelijk van ballistische coëfficiënt + fysische g-band, groeit met steilere γ / snellere intrede, snelheid bij piek-g = V_e·e^(−1/2) en piekverwarming = V_e·e^(−1/6) sneller, hoogte van piek-g fysisch + dieper voor hogere B, scenario reproduceerbaar/MODELLED + gedegenereerde geometrie geweigerd); dominance_demonstrators (bereikbaar + reproduceerbaar + fractie V_e·e^(−1/2) + MODELLED-niet-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (alleen kruiscontrole); tests/reentry_point_mass_accelerometer_oracle.rs (geblokkeerd, niet gedraaid)

seg-f40cd1b25160 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: de spectrale efficiëntie in gesloten vorm berekend uit K_bch van tabel 5a en de framelengtes komt overeen met de efficiënties die tabel { "13" } afdrukt (een transcriptiecontrole op de drempeltabel); de onderdelen van het linkbudget komen overeen met hun gesloten vormen; de selectie is monotoon in Es/N0 en houdt rekening met de marge; ACM verplaatst minstens het volume van constante codering. De overpassinggeometrie komt van de afzonderlijk VALIDATED schijnbare-overpassingsvoorspeller. WAT HET NIET IS: er is geen extern hulpmiddel of gemeten link vergeleken; de drempels zijn de ideale AWGN-waarden van de standaard, niet die van een modem; regenverzwakking, richtverlies tijdens de overpassing en piloten zijn niet gemodelleerd.

seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

seg-a90d5ba33c0b = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: de exacte branch-and-bound komt overeen met uitputtende opsomming op kleine willekeurige verzamelingen, elk plan wordt haalbaar bevonden tegen de conflictregels en de greedy-methode verslaat het exacte optimum nooit. WAT HET NIET IS: er is geen externe planner of operationeel plan vergeleken; contacten worden als geheel genomen (geen splitsing), de achterstand ligt vast bij het begin van het venster, slewtijd boven de vaste omlooptijd en onboardopslag zijn niet gemodelleerd.

seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

seg-7ead676849f9 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Kostenrekenkunde in gesloten vorm tegen met de hand afgeleide waarden; een economische KADERING van een gemodelleerd dekkingscijfer, geen offerte en geen gevalideerd kostenmodel

seg-c6fab6332435 = frugal (over walker)

seg-257dfa053c24 = frugal::tests (met de hand afgeleide kosten per dekking 48/96={ "0.5" }, ROI-verhouding { "2.667" }, ordening van brackets + bewakers voor nuldekking)

seg-8204455973cc = getoetst aan een aparte implementatie in ditzelfde codebestand — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend — Stelt de extern getoetste RAIM Stanford-classificatie samen (raim::classify_stanford); de afbeelding van gemiste detectie op AL zelf is gemodelleerd, geen gecertificeerde integriteitstoewijzing

seg-412105b0f541 = integrity_impact (over raim)

seg-35bc1db56d2a = integrity_impact::tests (dezelfde misser slaat om van Available→MI→HMI naarmate de context strakker wordt; conservatieve PL→Unavailable; HMI per as; invoerbewakers)

seg-7bb58c89a1fb = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Interne consistentie: de aangehaalde VRW-bracket gecontroleerd tegen de fysica van CaiAccelerometer::accel_asd + het ruwe dynamische bereik berekend uit de grens van de fringe-ambiguïteit; de cijfers zijn MODELLED brackets uit literatuuronderzoek (needs_source_confirmation), geen enkel apparaat is getoetst, geen schijn van validatie

seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

seg-061a65493a4a = inertial::cai_params::tests (fysische VRW valt binnen de aangehaalde VRW-bracket op alle { "3" } niveaus; ruw fringe-ambiguïteitsbereik berekend uit k_eff·T²; conservatief budget drift meer dan het beste; elke bracket van een bron voorzien + gemarkeerd voor bevestiging; bewakers voor ordening van brackets)

seg-3f5094fa7a30 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Onafhankelijke numpy-herimplementatie van de regel met vier gebieden (scripts/gen_tib_scorer_reference.py) op dezelfde steekproefverzameling; methode aangehaald uit het Stanford–ESA-integriteitsdiagram (Tossaint et al., ION GNSS { "2007" }) en RTCA DO-229 WAAS MOPS. GEEN nauwkeurigheidsreferentie van het type ExternalDataset — de benchmark is immuun voor eerlijkheid.

seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (vier gebieden + inclusieve grenzen + |fout| + onbeschikbaarheid bij PL>AL); tests/tib_scorer_reference.rs (classificatietellingen tegen onafhankelijke numpy op een vaste synthetische verzameling)

seg-10befbc6faae = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Onafhankelijke numpy-hertelling van gebieden in tests/fixtures/tib/reference.json; alleen kruiscontrole van de scorermachinerie, geen nauwkeurigheidsclaim.

seg-60f627e001ad = src/benchmark/coverage.rs::tests (schoon/onderbegrensd/alles-onbeschikbaar/leeg); tests/tib_scorer_reference.rs (tellingen + percentages + coverage_ok tegen numpy tot { "1e-12" })

seg-cee919e2058e = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Representatieve parametrische foutgeneratoren (gemodelleerd); de niet-detecteerbare verzameling (symmetrische vertraging, replay binnen versheid) is aangehaald uit Mizrahi RFC { "7384" } en Narula & Humphreys (IEEE JSTSP { "2018" }). Geen externe referentie — een foutencatalogus doet geen gemeten claim.

seg-6b48be996d76 = src/benchmark/faults.rs::tests (offsetprofielen, monotone coast, markering van de niet-detecteerbare verzameling, consistentie van max_offset, precies twee niet-detecteerbare klassen)

seg-0cc84aedee42 = getoetst aan zijn eigen gesloten-vorm- of analytische identiteit — vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie — Eigenschapscontrole dat de enum Verdict structureel een niet-detecteerbare fout nooit als gedetecteerd kan melden (Mizrahi RFC { "7384" }); geabsorbeerd ⟺ PL ≥ offset. Geen nauwkeurigheidsreferentie.
