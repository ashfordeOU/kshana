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
