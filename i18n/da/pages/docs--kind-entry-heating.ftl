# docs--kind-entry-heating: translations (da)

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Emneside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Kilde: <c1/>

seg-3a3f732cc2dd = <c1/> (scenarietype)

seg-b843e2e0a4ee = 3-DoF-punktmasseindflyvning i atmosfæren over en roterende kugleformet Jord eller Mars (ballistisk eller løftende ved konstant krængning), RK4, gennem US76, en eksponentiel eller Mars-atmosfæren, med konvektiv opvarmning i stagnationspunktet efter Sutton-Graves (NASA TR R-376): maksimal deceleration, varmeflux og dynamisk tryk, varmebelastning, downrange, en energikontrol i roterende system og Allen-Eggers' lukkede form ved siden af. Maksimal deceleration er kontrolleret mod det publicerede nominelle Stardust-forløb; opvarmningen er MODELLED.

seg-05c8dac8d411 = Én kørsel af <c1/> opsummeres som: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> maks. { "35.4" } g ved { "54.2" } km, maks. q { "746" } W/cm² ved { "62.0" } km, varmebelastning { "20970" } J/cm², maks. q_dyn { "20.8" } kPa; terminal-altitude ved { "317" } s (lukket form { "60.2" } g; MODELLED 3-DoF, ingen stråling/TPS)

seg-96504cafb034 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Eksemplet <c1/> angiver blandt andet:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistisk konsta

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Resultatmærkat (motorens egen): MODELLED — 3-DoF-punktmasseindflyvning over en roterende kugleformet planet (central tyngdekraft, ingen J2), medroterende vindfri atmosfære, konstant C_D, L/D og krængning, RK4; konvektiv opvarmning i stagnationspunktet efter NASA TR R-376 ({ "1971" }), kold væg, INGEN strålingsopvarmning, INGEN TPS-/ablationsrespons, IKKE 6-DoF

seg-dbb618cd6357 = Diagrammet, som motoren skriver for scenarios/entry-heating-stardust.toml, type entry-heating

seg-e73b339df97b = <b>VALIDATED</b> En 3-DoF-punktmasseindflyvning over en roterende kugleformet Jord gennem US Standard Atmosphere { "1976" }, integreret med RK4 fra en inertial indflyvningstilstand, der rapporterer den maksimale deceleration og dens højde; den planetrelative indflyvningstilstand fra den i Tests: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Konvektiv varmeflux i stagnationspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterne for Jordens luft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens maksimum og den integrerede varmebelastning langs en 3-DoF-indflyvning, ballistisk eller løftende ved c Tests: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> En 3-DoF-punktmasseindflyvning over en roterende kugleformet Jord gennem US Standard Atmosphere { "1976" }, integreret med RK4 fra en inertial indflyvningstilstand, der rapporterer. Uafhængig reference (ExternalDataset): Stardusts nominelle forløb fra Desai, Mitcheltree og Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksimal deceleration { "33.4" } g fra { "12.6" } km/s planetrelativt med opsendelsesmassen på { "45.8" } kg, en 6-DoF POST-bane med den fulde aerodynamiske database; indflyvningsgrænseflade fra Desai, Lyons, Tooley og Kangas (NTRS { "20090004445" }): radius { "6503.14" } km, inertial { "12.9" } km/s ved -8.2 deg. Tærskler præregistreret i xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Konvektiv varmeflux i stagnationspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterne for Jordens luft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens . Uafhængig reference (InternalConsistency): Intern konsistens: relationen og konstanterne, som de står trykt i NASA TR R-376, en halvtrinskonvergenskontrol og den forventede rækkefølge af opvarmnings- og decelerationsmaksima. HVAD DER IKKE ER: ingen publiceret opvarmningsværdi er sammenlignet (Stardust-artiklerne angiver en designgrænse og et konvektivt-plus-strålings-estimat på cirka { "1200" } W/cm2, som en relation kun for konvektion ikke kan matche); ingen strålingsopvarmning, vægtemperatur eller

seg-a0f300b2ce78 = MODELLED — 3-DoF-punktmasseindflyvning over en roterende kugleformet planet (central tyngdekraft, ingen J2), medroterende vindfri atmosfære, konstant C_D, L/D og krængning, RK4; konvektiv opvarmning i stagnationspunktet efter NASA TR R-376 ({ "1971" }), kold væg, INGEN strålingsopvarmning, INGEN TPS-/ablationsrespons, IKKE 6-DoF (resultat <c1/>)

seg-47f81ab160cc = Maksimal deceleration er kontrolleret mod det publicerede nominelle Stardust-forløb; opvarmningen er MODELLED. (typekatalog (<c1/>))

seg-47cda83af127 = Indflyvningsgrænseflade ved en radius på { "6503.14" } km, inertial { "12.9" } km/s ved -8.2 deg, { "45.8" } kg, { "0.811" } m diameter, { "0.2202" } m næseradius (Desai et al., NASA NTRS { "20050042027" } og { "20090004445" }). Breddegrad og kurs er en antaget tilnærmet indflyvning over Stillehavet; C_D er modulets standard for en kugle-kegle på { "60" } deg. Publiceret nominel 6-DoF-maksimaldeceleration: { "33.4" } g. Opvarmningen er kun konvektiv efter Sutton-Graves, MODELLED. (kommentar i scenariefilen, linje { "4" } til { "8" })

seg-98af076be1ac = Konvektiv indflyvningsopvarmning i stagnationspunktet (Sutton-Graves) på en 3-DoF-indflyvning er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Forrige</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Næste</s1>eo-coverage
