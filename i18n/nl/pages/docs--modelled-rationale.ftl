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
