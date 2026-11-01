# docs--agency-orbit-validation: translations (nl)

seg-31d58f23c0a2 = Uitvoeren

seg-fbe4b3eb7310 = Bron: <c1/>

seg-87910a33b87b = Validatie van krachtmodellen door efemeridefitting — methodologie en getoetste residuen

seg-09a1b1b673fb = De volledige krachtengine van { -brand } (<c1/>) gefit aan <b>echte precieze-baanproducten van instanties</b>, met eerlijke, citeerbare residuen die zijn gestempeld met de commit-hash. Dit is het validatiedossier voor mijlpaal P4 van de roadmap („Precieze astrodynamica: hooggradige zwaartekracht, SRP (zonnestralingsdruk), validatie tegen datasets van instanties”).

seg-90f366667f78 = Wat een getoetst residu hier betekent

seg-3861b68a03e2 = Een residu wordt alleen gerapporteerd wanneer aan al het volgende is voldaan (ontwerp <c1/>):

seg-954f4f934461 = Het <b>krachtmodel</b> bevat elke verstoring die bij de beoogde nauwkeurigheid van belang is: EGM2008 (Earth Gravitational Model { "2008" }) hooggradig geopotentiaal (afgekapt bij een vermelde graad/orde, d/o), vaste + oceaan- + atmosferische <b>getijden</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } hoofdstuk { "6" }), derde lichamen zon/maan, kanonskogel-SRP met conische schaduw + geschatte <c2/>, luchtweerstand (alleen LEO (lage baan om de aarde)), Schwarzschild- + Lense–Thirring-termen van de algemene relativiteitstheorie (GR) (<c3/>).

seg-710f89c088cc = De <b>schatter</b> is een echte Gauss–Newton-batchkleinstekwadratenmethode met een variationele <b>toestandsovergangsmatrix</b> (gecontroleerd tegen eindige differenties over de hele boog tot < { "1e-6" }), <c1/>-weging van waarnemingen en n-sigma-uitschietersbewerking.

seg-dd5dcc66ed22 = <b>Frames en tijd</b> gebruiken <b>echte IERS finals2000A-aardoriëntatieparameters (EOP)</b> (UT1 (Universal Time { "1" }, aardrotatietijd)−UTC (Coordinated Universal Time), poolbeweging; <c1/>) via de getoetste keten IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). SP3 (Standard Product { "3" }, het formaat voor precieze banen) GPS-tijd (Global Positioning System) → TT (Terrestrial Time) via de vaste offset van { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Residuen</b> worden gerapporteerd in <b>RTN</b> (radiaal/along-track/cross-track) en 3D, <b>met en zonder</b> empirische versnellingen, naast de ruwe overlap (zonder fit).

seg-fea4515ba842 = Elk getal is <b>reproduceerbaar</b> (open-data-CI-poort (continue integratie)) en <b>citeerbaar</b> (commit-hash + datasetverwijzing + SHA-256 van het fixture (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Methode, per dataset

seg-a98b098e815a = Parseer de precieze SP3-baan; neem voor de gekozen satelliet elke ITRF-positiebepaling (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Zet de SP3-GPS-epoch om naar TT; bepaal <c1/> uit finals2000A op die epoch.

seg-e5338b713d88 = Roteer elke ITRF-positiebepaling naar GCRS (Geocentric Celestial Reference System) via de CIO-keten met die EOP — de inertiële positiewaarnemingen. De dynamica gebruikt <em>dezelfde</em> EOP voor de aardvaste rotatie van het geopotentiaal, zodat waarnemingen en krachten één stelsel delen.

seg-ce987e4dda40 = Initialiseer de epochtoestand (positie = eerste positiebepaling; snelheid = eindige differentie van de 2e orde) en fit <c1/> in batch (Tier { "1" }), daarna aanvullend de { "9" } empirische RTN-versnellingen per omloop (CPR, cycle-per-revolution) (Tier { "2" }, a priori beperkt).

seg-22f839d05292 = Rapporteer de post-fit-RTN + 3D-RMS (root mean square) voor beide tiers en de ruwe overlap.

seg-64e2c3662a27 = Galileo, middelhoge baan om de aarde — <b>GREEN</b> (drempel < { "5" } m)

seg-e77e8e35ba80 = <b>Dataset:</b> definitieve multi-GNSS-baan <c1/> van ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) (GNSS: global navigation satellite system), ITRF, bemonstering van 5 min, satelliet <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominale MEO (middelhoge baan om de aarde)), 2022-01-01.

seg-f90d848e7a46 = <b>Open bron (zonder inloggen):</b> mirror van het ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Validatiecommit:

seg-c2ad9f9cc050 = <b>Fixtures (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Boog

seg-7db37f753fc1 = 3D-RMS

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Notities

seg-bced8a114852 = CI-fixture, Tier { "1" } (kracht + <c1/>)

seg-f040df9ee966 = { "8" } h

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = ruwe overlap { "78.7" } km

seg-1ce1bc363541 = CI-fixture, Tier { "2" } (+ empirische CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = halveert het residu

seg-1b422bc76914 = Dispatch over de volledige boog, Tier { "1" } (vóór de fix†)

seg-f57ee3b36d92 = { "24" } h

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = De getallen van het CI-fixture hierboven zijn opnieuw vastgelegd in { "0.36" } na de S2-luchtgetijdenfix (<c1/>): Galileo Tier { "1" } verschoof van { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), de N-componenten van Swarm-A met { "1" }–{ "2" } mm; de dispatchcijfers over de volledige boog zijn niet opnieuw uitgevoerd. † <b>Vóór de fix:</b> het dispatchcijfer over de volledige boog is vastgelegd vóór de S2-luchtgetijdenfix van { "0.36" } en is niet opnieuw uitgevoerd op de gerepareerde code (de producten voor een volledige dag worden door de dispatchworkflow opgehaald en waren niet beschikbaar in de sessie die de fix maakte). Op de CI-fixtures verschoof de fix de 3D-RMS van Galileo met minder dan { "1" } mm en de componenten van Swarm-A met { "1" }–{ "2" } mm, dus een wijziging van dezelfde orde wordt verwacht; de volgende <c2/>-run legt die opnieuw vast.

seg-5141c1811e35 = Het MEO-veld is zwaartekrachtconvergent vanaf graad { "8" } (het Tier-1-resultaat van { "8" } h is op de millimeter identiek bij d/o { "8" }, { "10" } en { "12" }), dus de afkapping van het CI-fixture op d/o 12 is verwaarloosbaar; de dispatchtaak draait de volledige d/o 70. De fit van { "8" } h bereikt <b>{ "13" } cm</b> puur kracht en <b>{ "7" } cm</b> met de empirische tier; de volledige boog van { "24" } h (meer SRP-/eclipsbelasting, langere dynamische spanne) is <b>{ "61" } cm</b> — ruim binnen de drempel van { "5" } m.

seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (drempel < { "5" } m)

seg-cba2e4a9b9b1 = <b>Dataset:</b> precieze wetenschappelijke baan <c1/> van ESA Swarm Level-2, reduced-dynamic (<c2/>, van GPS afgeleid, ITRF / IGb14, ~{ "2" } cm, verwerking door de Technische Universiteit Delft), satelliet <b>Swarm-A</b> (SP3-id <c3/>, ~{ "430" } km LEO), 2022-01-01.

seg-f66ad1515550 = <b>Open bron (zonder inloggen):</b> distributieserver van ESA Swarm <c1/> → <c2/> (open onder het ESA Data Policy). EOP: dezelfde IERS-reeks <c3/> 2022-001.

seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = Een LEO-boog voegt <b>atmosferische luchtweerstand</b> toe aan het krachtmodel. Omdat het dichtheidsmodel een <em>statische</em> stuksgewijs exponentiële functie is, wordt de baan in twee tiers gefit: een <b>dynamische</b> tier (alleen de epochtoestand schatten; <c1/> vastgehouden op { "1" }, omdat bij LEO de luchtweerstand domineert en SRP over een korte boog slecht te scheiden is) en een <b>reduced-dynamic</b> tier die de empirische versnellingen per omloop toevoegt die de niet-gemodelleerde luchtweerstand dragen — de operationeel zinvolle LEO-baan.

seg-dac35ad223dd = CI-fixture, dynamisch (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } h

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residu ≈ zuiver along-track (luchtweerstand)

seg-4f8e7956aa78 = CI-fixture, reduced-dynamic (+empirisch)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = het empirische deel neemt de luchtweerstand op

seg-ff834d33ae70 = De dynamische fit blijft onder de drempel van { "5" } m, met het residu vrijwel geheel along-track — de leerboekhandtekening van luchtweerstand op ~{ "430" } km. De empirische tier neemt die along-trackfout op ({ "2.52" } → { "0.09" } m), wat een <b>~{ "10" } cm</b> reduced-dynamic fit geeft tegen de eigen baan van ESA van ~{ "2" } cm. De run over een volledige dag en volledige graad is de genegeerde <c1/> (de distributieserver levert het product via zijn bestandsbrowsersessie, dus de oprichter downloadt de SP3 van die dag en wijst <c2/> ernaar). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosfeermodel) met ruimteweerdrivers is de genoemde upgrade die de <em>dynamische</em> tier verder zou aanscherpen.

seg-e8f5c385de62 = LRO maan — getoetst, <b>boven</b> de drempel van { "5" } m (eerlijk) (P4 W4b)

seg-8a22ef5d3765 = <b>Dataset:</b> de echte gereconstrueerde baan van de <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) van NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory), uit JPL Horizons, geometrische maancentrische toestandsvectoren in de ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km hoogte, bemonstering van 1 minuut ({ "241" } epochs, { "4" } h, ~{ "2" } omlopen). Het gebruik van Horizons-tekstvectoren vereist <b>geen SPK/SPICE-lezer (SPK: planetair efemeridekernel; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Zwaartekracht:</b> het veld <b>GRGM660PRIM</b> van GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, graad { "660" }), afgekapt tot d/o { "150" } en gefit bij d/o { "100" }, geëvalueerd in het maanvaste <b>hoofdassen</b>stelsel.

seg-1454f78e9ca4 = <b>Open bron (zonder inloggen):</b> Horizons-API (application programming interface) <c1/>; zwaartekracht via ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Fixtures (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Dit is <b>maancentrische</b> dynamica — een afzonderlijk krachtmodel (<c1/>): het GRGM-veld in het maanvaste stelsel (de gemiddelde-aardoriëntatie <c2/> van de IAU { "2015" } samengesteld met de vaste DE421-offset (Development Ephemeris { "421" }) van gemiddelde aarde → hoofdassen (ME→PA)), plus de aarde (de dominante verstoring van een maanbaan) en de zon als derde lichamen, gefit met dezelfde <em>generieke</em> precieze Gauss–Newton-schatter die de aarddatasets gebruiken (de trait <c3/>).

seg-68f1894a1fa5 = CI-fixture, dynamisch (alleen toestand)

seg-0f055118d77a = { "4" } h

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = ruwe overlap { "39.9" } m

seg-2923b4d58878 = CI-fixture, reduced-dynamic (+empirisch { "1" }+2/omloop)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = empirisch 1- en 2-per-omloop neemt de along-track op

seg-3f33d99fd643 = Correctie in { "0.36" }: tot { "0.36" } werd de DE421-ME→PA-offset in de verkeerde richting toegepast (en met de verkeerde Euler-volgorde), waardoor het analytische PA-stelsel ongeveer { "208" }″ van PA lag in plaats van erop. Het is nu overgenomen zoals SPICE het definieert (gecontroleerd tegen <c1/> tot { "2.6e-16" } rad, <c2/>; <c3/>). De cijfers hierboven zijn van na de fix; ervoor waren ze { "53.8" } m ruw, <b>{ "12.6" } m</b> dynamisch ({ "3.07" }, { "10.19" }, { "6.81" } m) en <b>{ "6.65" } m</b> reduced-dynamic ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Deze residuen liggen <b>boven</b> de drempel van { "5" } m die Galileo ({ "0.13" } m) en Swarm-A ({ "0.10" } m) halen, en worden eerlijk gerapporteerd.

seg-c414e14eaaea = Wat de ondergrens werkelijk bepaalt — een kruisvalidatie op DE-niveau (en een correctie)

seg-72b06bac7f6b = Wij veronderstelden dat de beperkende factor de nauwkeurigheid was van de <b>analytische maanoriëntatie en efemeride</b> (de IAU-libratiereeks, nauwkeurig tot tientallen boogseconden ten opzichte van de numeriek geïntegreerde <c1/> van JPL DE (Development Ephemeris), en de efemeride van Montenbruck–Gill voor aarde/zon, ~{ "0.3" }° ten opzichte van een DE/SPICE-kernel). Om dat rechtstreeks te toetsen verwisselt de kruisvalidatiecrate <c2/>, die buiten de workspace valt, <b>alleen</b> die twee invoeren voor invoeren <b>op DE-niveau</b> — de hoofdassenoriëntatie van de maan van DE440 (Development Ephemeris { "440" }) (<c3/>) en de efemeride van DE440 (<c4/>), gelezen via ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — een SPICE-kernellezer in pure Rust) — en laat <em>dezelfde</em> schatter opnieuw lopen (commit <c5/>, kernel-SHA-256 <c6/> / <c7/>):

seg-3a0e724a8a2b = Tier

seg-c1ce24cd6008 = analytisch

seg-7d04fb530a3a = ruwe overlap

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamisch

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = reduced-dynamic ({ "1" }+2/omloop)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Opmerking bij { "0.36" }: het grootste deel van de winst van de dynamische tier hieronder was de offsetfout, niet de invoeren op DE-niveau.</b> Met de gecorrigeerde ME→PA-offset geeft de analytische stack { "39.9" } m ruw, { "12.05" } m dynamisch en { "6.67" } m reduced-dynamic, tegenover { "41.5" }, { "12.0" } en { "6.67" } m op DE-niveau: de analytische fit en die op DE-niveau komen nu op elke tier overeen. De lezing van { "0.30" } van de tabel hieronder volgt daaruit en is gelaten zoals ze was geschreven.

seg-691df96321d8 = <b>De hypothese is maar half juist, en de hoofdbewering moest worden gecorrigeerd.</b> Oriëntatie en efemeride op DE-niveau verbeteren de ruwe overlap <em>wel</em> ({ "53.8" } → { "41.5" } m) en de <b>dynamische</b> fit ({ "12.6" } → { "12.0" } m) — dus de fout in de analytische oriëntatie/efemeride is reëel en beperkt die tiers. Maar ze laten het <b>reduced-dynamic</b> residu in wezen <b>ongewijzigd</b> ({ "6.65" } → { "6.67" } m): de empirische tier met { "1" }+2 per omloop nam de oriëntatie-/efemeridefout <em>al</em> op, dus de operationele ondergrens van ~{ "6.6" } m wordt door iets anders bepaald — een residu dat de basis per omloop niet kan opnemen en dat stelsels op DE-niveau niet verwijderen. De meest consistente verklaring is <b>ongemodelleerde niet-zwaartekrachtdynamica van LRO</b> (thermische heruitstraling, uitgassing) over de korte boog van { "4" } h; de veldgraad is uitgesloten (identiek bij d/o { "100" } en { "150" }) en de integratortolerantie is uitgesloten (identiek bij <c1/> { "1e-6" } tegenover { "1e-9" }). Het constructieve gevolg: <b>de slanke, kernelvrije analytische maanstack van { -brand } haalt al de nauwkeurigheid van DE-niveau voor de reduced-dynamic (operationele) maanbaan</b> — de standaard met zuivere coëfficiënten laat daar niets liggen. Om { "5" } m te passeren zou het modelleren van de niet-zwaartekrachten op LRO nodig zijn (een voor het ruimtevaartuig specifiek box-wing-/thermisch model en een langere fit over meerdere bogen), geen betere stelsels.

seg-4211fbd25380 = Eerlijkheidscontract

seg-f3b0a26ff5b3 = De „groene” drempel < { "5" } m is gehaald voor <b>Galileo MEO</b> ({ "0.13" } m dynamisch) en <b>Swarm-A LEO</b> ({ "2.69" } m dynamisch / { "0.10" } m reduced-dynamic). <b>LRO maan wordt gepubliceerd zoals het is, met { "12.05" } m dynamisch / { "6.67" } m reduced-dynamic ({ "1" }+2 per omloop empirisch) — boven de drempel</b> ({ "0.36" }, na de fix van de ME→PA-offset; { "12.6" } / { "6.65" } m ervoor). Een kruisvalidatie op DE-niveau (hierboven) <b>heeft de bewering over de beperkende factor getoetst en gecorrigeerd</b>: de ondergrens van reduced-dynamic is <b>niet</b> de analytische oriëntatie/efemeride (DE440-kernels laten haar ongewijzigd op { "6.67" } m), dus ze wordt niet gedicht door betere stelsels maar door het modelleren van de niet-zwaartekrachtdynamica van LRO — het eerlijke, bijgewerkte pad naar meterniveau.

seg-559a269152ae = Voor LEO worden de <b>dynamische</b> tier (alleen toestand, statische dichtheid) en de <b>reduced-dynamic</b> tier (met empirische versnellingen) altijd <b>afzonderlijk</b> gerapporteerd, zodat de lezer ziet wat de empirische termen opnemen; de reduced-dynamic tier is de operationele baan. Dezelfde scheiding geldt voor de empirische en puur-krachttiers van MEO.

seg-d20c7ef90250 = Elk residu draagt hierboven zijn commit-hash, datasetverwijzing en fixture-controlesom.

seg-733d96129fca = <b>Datasets getoetst aan echte referentiegegevens van instanties: { "3" } van { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO maan). <b>Die de drempel < { "5" } m halen: { "2" } van { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO met { "6.67" } m, eerlijk boven de drempel).

seg-d7c77076c9c6 = <s1>Vorige</s1>SGP4-validatie

seg-d661003da754 = <s1>Volgende</s1>Zonnestelsel en andere hemellichamen

seg-36a3b8105d4b = Galileo, middelhoge baan om de aarde — GREEN (drempel < { "5" } m)

seg-b6f96cf0d55a = Swarm-A LEO — GREEN (drempel < { "5" } m)

seg-9e739bda7f20 = LRO maan — getoetst, boven de drempel van { "5" } m (eerlijk) (P4 W4b)
