# docs--kind-entry-heating: translations (sv)

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Ämnessida: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Källa: <c1/>

seg-3a3f732cc2dd = <c1/> (scenario kind)

seg-b843e2e0a4ee = Atmosfärsinträde med tre frihetsgrader (3-DoF) och punktmassa över en roterande sfärisk jord eller Mars (ballistiskt eller bärande med konstant roll), RK4, genom US76, en exponentiell atmosfär eller Mars-atmosfären, med konvektiv uppvärmning i stagnationspunkten enligt Sutton-Graves (NASA TR R-376): maximal retardation, värmeflöde och dynamiskt tryck, värmelast, räckvidd, en energikontroll i roterande system och den slutna formen enligt Allen-Eggers bredvid. Maximal retardation kontrolleras mot det publicerade nominella Stardust-värdet; uppvärmningen är MODELLED.

seg-05c8dac8d411 = En körning av <c1/> sammanfattas som: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

seg-96504cafb034 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Exemplet <c1/> anger bland annat:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistic consta

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Resultatetikett (motorns egen): MODELLED — 3-DoF-inträde med punktmassa över en roterande sfärisk planet (central gravitation, ingen J2), medroterande vindfri atmosfär, konstant C_D, L/D och roll, RK4; konvektiv uppvärmning i stagnationspunkten enligt NASA TR R-376 ({ "1971" }), kall vägg, INGEN strålningsuppvärmning, INGET TPS-/ablationssvar, INTE 6-DoF

seg-dbb618cd6357 = Diagrammet som motorn skriver för scenarios/entry-heating-stardust.toml, kind entry-heating

seg-e73b339df97b = <b>VALIDATED</b> Ett 3-DoF-inträde med punktmassa över en roterande sfärisk jord genom US Standard Atmosphere { "1976" }, integrerat med RK4 från ett tröghetsinträdestillstånd, med redovisning av maximal retardation och dess höjd; det planetrelativa inträdestillståndet från i Tests: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Konvektivt värmeflöde i stagnationspunkten q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterna för jordluft och Mars-atmosfären (NASA TR R-376, { "1971" }), dess topp och den integrerade värmelasten längs ett 3-DoF-inträde, ballistiskt eller bärande vid c Tests: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> Ett 3-DoF-inträde med punktmassa över en roterande sfärisk jord genom US Standard Atmosphere { "1976" }, integrerat med RK4 från ett tröghetsinträdestillstånd, med redovisning av. Oracle (ExternalDataset): Det nominella Stardust-värdet från Desai, Mitcheltree och Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximal retardation { "33.4" } g från { "12.6" } km/s planetrelativt med uppskjutningsmassan { "45.8" } kg, en 6-DoF POST-bana med den fullständiga aerodynamiska databasen; inträdesgräns från Desai, Lyons, Tooley och Kangas (NTRS { "20090004445" }): radie { "6503.14" } km, tröghet { "12.9" } km/s vid -8.2 deg. Trösklar fastställda i förväg i xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Konvektivt värmeflöde i stagnationspunkten q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterna för jordluft och Mars-atmosfären (NASA TR R-376, { "1971" }), dess . Oracle (InternalConsistency): Intern konsistens: sambandet och konstanterna som de står tryckta i NASA TR R-376, en halvstegs-konvergenskontroll och den förväntade ordningen mellan värme- och retardationstoppar. VAD SOM INTE GÄLLER: inget publicerat uppvärmningsvärde har jämförts (Stardust-artiklarna anger en konstruktionsgräns och en uppskattning av konvektiv plus strålande uppvärmning på cirka { "1200" } W/cm2, vilket ett enbart konvektivt samband inte kan matcha); ingen strålningsuppvärmning, väggtemperatur eller

seg-a0f300b2ce78 = MODELLED — 3-DoF-inträde med punktmassa över en roterande sfärisk planet (central gravitation, ingen J2), medroterande vindfri atmosfär, konstant C_D, L/D och roll, RK4; konvektiv uppvärmning i stagnationspunkten enligt NASA TR R-376 ({ "1971" }), kall vägg, INGEN strålningsuppvärmning, INGET TPS-/ablationssvar, INTE 6-DoF (result <c1/>)

seg-47f81ab160cc = Maximal retardation kontrolleras mot det publicerade nominella Stardust-värdet; uppvärmningen är MODELLED. (kind catalogue (<c1/>))

seg-47cda83af127 = Inträdesgräns vid en radie på { "6503.14" } km, tröghet { "12.9" } km/s vid -8.2 deg, { "45.8" } kg, { "0.811" } m diameter, { "0.2202" } m noskradie (Desai et al., NASA NTRS { "20050042027" } och { "20090004445" }). Latituden och kursen är ett antaget ungefärligt inträde över Stilla havet; C_D är modulens standardvärde för sfär-kon på { "60" } deg. Publicerad nominell 6-DoF-toppretardation: { "33.4" } g. Uppvärmningen är enbart konvektiv enligt Sutton-Graves, MODELLED. (scenario file comment, lines { "4" } to { "8" })

seg-98af076be1ac = Konvektiv inträdesuppvärmning i stagnationspunkten (Sutton-Graves) vid ett 3-DoF-inträde är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Föregående</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Nästa</s1>eo-coverage
