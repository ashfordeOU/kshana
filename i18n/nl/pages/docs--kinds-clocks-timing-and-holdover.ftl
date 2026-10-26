# docs--kinds-clocks-timing-and-holdover: translations (nl)

seg-b03d56f501c3 = Type

seg-78cba87823f7 = Klok-holdover tegenover de specificatie; optioneel Monte-Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = De grafiek die de engine schrijft voor scenarios/clock-ensemble.toml, kind clock

seg-c0924aa36e64 = MODELLED holdovertest van een tijdsynchronisatiesysteem, gescoord uit een tijdfoutregistratie die de OPERATOR aanlevert (een linuxptp-ptp4l-, phc2sys- of ts2phc-log, een chrony-tracking- of -statistiekenlog, een TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren). De test heeft vier stappen en Kshana voert er geen enkele uit: een vergrendelde BASELINE, GNSS VERWIJDERD door de operator (de antennekabel of de simulatoruitvoer; Kshana zendt niets uit en stuurt niets aan) op een vermeld tijdstip, HOLDOVER op de eigen oscillator van het systeem, en RECOVERY nadat de operator GNSS herstelt op een tweede vermeld tijdstip. De registratie wordt op die twee tijdstippen gesplitst. Baseline: tijdfoutstatistieken en de ITU-T-maskers die voor een vergrendelde klok zijn opgesteld. Holdover: statistieken, de fractionele frequentie-afwijking die het systeem hield (een kleinste-kwadratenlijn), de maskers die voor holdover of een autonome klok zijn opgesteld, de ePRTC-A-holdoverenvelop vanaf de vermelde vergrendelde duur, en de tijd tot elk tijdfoutbudget wordt overschreden. Recovery: of en wanneer |TE| binnen een vermelde band kwam en daar bleef, de piek en de grootste stap. Elke limiet is overgenomen uit een openbare ITU-T-tabel (de maskers voor telecomtijdsynchronisatie); de bewoording is 'gemeten tegen het masker', en de twee tijdstippen zijn de verklaring van de operator, niet geverifieerd. Een registratie die te kort is voor een masker is INCOMPLETE, nooit geëxtrapoleerd. Zie docs/TIMING-HIL.md.

seg-8ce93392747b = De grafiek die de engine schrijft voor scenarios/holdover-test-ptp4l.toml, soort holdover-test

seg-540545e6f846 = MODELLED keten voor vertrouwde kwantum-tijdsynchronisatie: een end-to-end budget voor tijdoverdracht met quantum (optische-roosterklok + verstrengelings-/enkelfotonverbinding) tegenover klassiek (CSAC + RF-tweeweg), een hergebruikt beschermingsniveau voor tijdsynchronisatie + een kwaliteitsmaat voor beveiliging tegen vertragings-/replay-aanvallen (1-P_md), een detectiekans voor klokanomalieën + CUSUM-latentie, en de afweging quantum tegenover klassiek als eerlijke TradeEvidence met een representativiteits- en gaps-to-flight-register. Illustratieve apparaat-/verbindingsparameters uit openbare bronnen; modelleert de klasse, geen TRL-, vlucht- of certificeringsclaim.

seg-09760f892c7b = De grafiek die de engine schrijft voor scenarios/quantum-time-transfer.toml, soort quantum-time-transfer

seg-1b61962464c5 = Slot-tijdsynchronisatie: seconden tot een vrijlopende klok de guard verlaat van een routerings- of taakslot dat op tijd is geïndexeerd (de grootste absolute tijdfout die het slot verdraagt), de bijdrage van elke term op dat moment met de dominante term benoemd (onzekerheid van de positiebepaling, witte fase-ruis, witte, flicker-, random-walk- en random-run-frequentieruis, resterende frequentie-offset, temperatuur, veroudering), de tijd die resteert sinds de laatste positiebepaling, en het grootste interval tussen positiebepalingen dat de klok binnen het slot houdt, na aftrek van de latentie van de positiebepaling. De oscillator is een KLASSE-standaard (csac, uso, dsac, tcxo, ocxo of rafs: één aangehaalde Allan-deviatie van één seconde en een aangenomen rode-ruisondergrens), een DATABLAD-VOORINSTELLING voor telecom-tijdsynchronisatie of een inline DATABLAD (maxima van de Allan-deviatie gefit als envelop, plus veroudering en een temperatuurcoëfficiënt), of een inline MEASURED-FASEREGISTRATIE (de overlappende Allan-deviatie daarvan gefit met gewogen kleinste kwadraten in de basis van witte fase en IEEE Std { "1139" }-frequentiemodulatie, zodat de rode-ruisondergrens wordt gemeten in plaats van aangenomen). Een overschrijding voorbij de langste middelingstijd die het datablad of de registratie ondersteunt, wordt als geëxtrapoleerd gemarkeerd. Een optionele sectie voor spoofing voegt het beschermingsniveau voor tijdsynchronisatie toe voor een ontvanger in een baan: baansnelheid en -periode, hoe lang één grondspoofer de satelliet per passage kan bereiken, de ondergrens van de klokondersteunde monitor en de CUSUM-detectielatentie, de voorwaardelijke grens, de afwijking die een spoofer bij een vermelde maximale rampsnelheid opbouwt voordat de satelliet buiten bereik raakt of een onafhankelijke controle draait, en of elke controle via grondcontact of crosslink onafhankelijk is van die spoofer. VALIDATED: de holdover-inversie uit een gefitte registratie, achtergehouden op een echte cesiumklok gemeten tegen een waterstofmaser (tests/slot_timing_cs5071a_holdout.rs, afhankelijk van beschikbare data); bij een gemeten kristaloscillator is de achtergehouden voorspelling conservatief maar niet binnen de drempel, dus het kristalgeval is MODELLED. MODELLED: klasse- en databladbronnen, de deterministische termen en de beoordeling van spoofing.

seg-97a91c8a60cd = De grafiek die de engine schrijft voor scenarios/slot-timing-ocxo-leo.toml, soort slot-timing

seg-4f19d4fb1341 = Generieke N-D-sweep over elk pakket via TOML-sleutels met punten / JSON-metriekpaden.

seg-621a18c07044 = De grafiek die de engine schrijft voor scenarios/sweep-nd-inertial.toml, soort sweep-nd

seg-e7ab7b55c969 = 1-D-sweep voor een afwegingsstudie over een parameter van een klokpakket.

seg-c784b8f22f12 = De grafiek die de engine schrijft voor scenarios/sweep-clock-stability.toml, soort sweep

seg-a448b24ded2b = Telecom-tijdsynchronisatie: tijdfout, maximale tijdintervalfout (MTIE) en tijdafwijking (TDEV) van een GNSS-holdover, gecontroleerd aan ITU-T-maskers met een PASS of FAIL en een marge per masker. De invoer is een SYNTHETISCHE HOLDOVER (een oscillatorvoorinstelling -- ocxo, rubidium, cesium of csac, elk met de stabiliteits-, verouderings- en temperatuurcijfers van een benoemd openbaar Microchip-datablad -- plus de tijd van GNSS-verlies, de lengte van de registratie en het steekproefinterval; de vrijlopende klok heeft witte, flicker- en, waar de fit op het datablad dat nodig heeft, random-walk-frequentieruis, lineaire veroudering en een sinusvormige temperatuurterm) of een INGELEZEN REEKS van paren [time_s, time_error_ns] die inline worden gegeven (en, alleen op native builds, een CSV-bestand). Maskers: ITU-T G.8272 (07/2025) PRTC-A en PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabellen 1-2, TDEV Tabellen 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC vergrendeld ({ "30" } ns, Tabellen 1-2) en ePRTC-A holdover (de tijdfoutenvelop van Tabel { "3" } die stijgt van { "30" } ns naar { "100" } ns over de holdoverperiode H die wordt bepaald door de vergrendelde duur, MTIE Tabel { "4" }, TDEV Tabel { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klassen A-C (max|TE|, constante tijdfout, laagdoorlaatgefilterde MTIE en TDEV) en klasse D (max|TE_L| { "5" } ns, het enige cijfer van klasse D dat niet is overgelaten voor verdere studie); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referentiepunt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns met MTIE Tabellen 7-1 tot 7-3). Elk item dat een Recommendation markeert voor verdere studie ontbreekt in plaats van te worden ingevuld, en elk rapport vermeldt wat niet is geïmplementeerd. Rapporteert ook de tijd tot overschrijding van elk budget voor de maximale tijdfout (standaardwaarden: { "100" } ns ePRTC max|TE_HO|, { "400" } ns toewijzing voor holdover in het netwerk, { "1100" } ns punt C, { "1.5" } us klasse { "4" }), de MTIE-/TDEV-curven als CSV-tabel met elke maskerlimiet, en per numeriek veld een vermelding van eenheden en herkomst. VALIDATED: de MTIE- en TDEV-schatters tegen het pakket allantools op een vastgelegde holdoverreeks. MODELLED: de maskertabellen zijn transcripties, en een synthetische holdover is een model dat is opgebouwd uit maxima van het datablad, geen meting van een enkele eenheid. Geen conformiteitstest.

seg-ec7745a09d08 = De grafiek die de engine schrijft voor scenarios/telecom-synce-eec.toml, soort telecom-timing

seg-9a2bb9809aed = Tweewegs-tijd- en frequentieoverdracht via satelliet tussen twee stations via een geostationair relais: de tweewegsvergelijking opgelost voor T_A - T_B met elke niet-reciproke term (apparatuurvertragingen van de stations, Ku-band-ionosfeer, transponder, Sagnac), een kwadratisch onzekerheidsbudget waarvan de type-A-term de TDEV van de gesimuleerde verbinding bij de middelingstijd is, een gesimuleerde verbinding met witte en flicker-faseruis en een dagelijkse niet-reciprociteit, en de stabiliteit (snelheid, residu-RMS, TDEV, ADEV) van elke aangeleverde reeks uit BIPM Circular T Section { "1" }, MJD,ns-CSV of IGS RINEX-stationsklokgegevens. MODELLED.

seg-92d3c84024d7 = De grafiek die de engine schrijft voor scenarios/time-transfer-budget.toml, soort time-transfer-budget

seg-ccb244e60d60 = Optische versus RF-tweewegs-tijd-/frequentieoverdracht.

seg-bd76bd68eab3 = De grafiek die de engine schrijft voor scenarios/timetransfer.toml, soort timetransfer

seg-4e31c8daf798 = Register

seg-45a59bc9ac90 = Bron: <c1/>

seg-3b549536beed = Klokken, tijdsynchronisatie en holdover (familie van scenariosoorten)

seg-9095869ec445 = { "9" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-59c2beac56b5 = Themapagina's: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Voer er een uit: <c1/>. Alle families: <a5>KINDS.md</a5>.

seg-b333618375db = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Klokken, tijdsynchronisatie en holdover

seg-efd15cff3d32 = MODELLED (resultaatlabel)

seg-ff7dca09f0f2 = Telecomtijdsynchronisatie: tijdfout, maximale tijdintervalfout (MTIE) en tijdafwijking (TDEV) van een GNSS-holdover, getoetst aan ITU-T-maskers met een PASS of FAIL en een marge per masker.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Slottijdsynchronisatie: seconden totdat een vrijlopende klok de bewakingsmarge verlaat van een tijdgeïndexeerd routerings- of taaktoewijzingsslot (de grootste absolute tijdfout die het slot verdraagt), de bijdrage van elke term aan dat

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Tweewegs-tijd- en frequentieoverdracht via satelliet tussen twee stations via een geostationair relais: de tweewegsvergelijking opgelost voor T_A - T_B met elke niet-reciproke term (apparatuurvertragingen van de stations, Ku

seg-a2a710b3204f = MODELLED holdovertest van een tijdsynchronisatiesysteem, gescoord uit een tijdfoutregistratie die de OPERATOR aanlevert (een linuxptp-ptp4l-, phc2sys- of ts2phc-log, een chrony-tracking- of statistiekenlog, een TICC, TimeLab of RINEX

seg-1da440dd525c = MODELLED vertrouwde kwantumtijdsynchronisatieketen: een end-to-end budget voor kwantum (optische-roosterklok + verstrengelings-/enkelfotonverbinding) versus klassiek (CSAC + RF-tweewegs) tijdoverdracht, een hergebruikte tijdsynchronisatiebescherming

seg-50d75d48ed43 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optioneel: <c7/>, <c8/>.

seg-3273244f755c = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>clock</a1>.

seg-ee8d6e20c844 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optioneel: <c7/>.

seg-e359cc42506e = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>sweep</a1>.

seg-616716b33732 = Verplichte velden: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>telecom-timing</a1>.

seg-248e1686fddc = Verplichte velden: <c1/>, <c2/>. Optioneel: <c3/>.

seg-cc04bc2d43c5 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>slot-timing</a1>.

seg-50273a29deec = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Optioneel: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Verplichte velden: <c1/>, <c2/>. Optioneel: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Vorige</s1>Campagnes

seg-960d5c757310 = <s1>Volgende</s1>Constellaties, dekking en geometrie
