# docs--agency-orbit-validation: translations (sv)

seg-31d58f23c0a2 = Kör

seg-fbe4b3eb7310 = Källa: <c1/>

seg-87910a33b87b = Validering av kraftmodeller genom efemerispassning — metodik och validerade residualer

seg-09a1b1b673fb = Kshanas fullständiga kraftmotor (<c1/>) anpassad till <b>verkliga precisa banprodukter från rymdorganisationer</b>, med ärliga, citerbara residualer stämplade med commit-hash. Detta är valideringsunderlaget för färdplansmilstolpen P4 ("Precise astrodynamics: high-order gravity, SRP (solar-radiation pressure), validation vs agency datasets").

seg-90f366667f78 = Vad en validerad residual betyder här

seg-3861b68a03e2 = En residual rapporteras bara när allt av följande gäller (utformning <c1/>):

seg-954f4f934461 = <b>Kraftmodellen</b> innehåller varje störning som spelar roll vid målnoggrannheten: EGM2008 (Earth Gravitational Model { "2008" }) geopotential av hög grad (avkortad vid en angiven grad och ordning, d/o), fasta, oceaniska och atmosfäriska <b>tidvatten</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } kap. { "6" }), tredjekroppsinverkan från Solen och Månen, kanonkule-SRP med konisk skugga och skattad <c2/>, luftmotstånd (endast LEO (låg omloppsbana)), samt allmänna relativitetsteorins (GR) termer av Schwarzschild och Lense–Thirring (<c3/>).

seg-710f89c088cc = <b>Skattaren</b> är en verklig Gauss–Newton-batchminstakvadratanpassning med en variationell <b>tillståndsövergångsmatris</b> (korskontrollerad mot ändlig differens över hela bågen till < { "1e-6" }), <c1/>-viktning av observationer och redigering av n-sigma-avvikare.

seg-dd5dcc66ed22 = <b>Referenssystem och tid</b> använder <b>verkliga IERS finals2000A jordorienteringsparametrar (EOP)</b> (UT1 (Universal Time { "1" }, jordrotationstid)−UTC (Coordinated Universal Time), polrörelse; <c1/>) genom den validerade kedjan IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). SP3 (Standard Product { "3" }, formatet för precisa banor) GPS-tid (Global Positioning System) → TT (Terrestrial Time) via den fasta förskjutningen { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Residualerna</b> rapporteras i <b>RTN</b> (radiellt/längs banan/tvärs banan) och i 3D, <b>med och utan</b> empiriska accelerationer, tillsammans med den råa överlappningen (utan anpassning).

seg-fea4515ba842 = Varje tal är <b>reproducerbart</b> (grind med öppna data i CI (kontinuerlig integration)) och <b>citerbart</b> (commit-hash + datamängdsreferens + fixturens SHA-256 (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Metod, per datamängd

seg-a98b098e815a = Tolka den precisa SP3-banan; för den valda satelliten, ta varje ITRF-positionsbestämning (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Konvertera SP3:s GPS-epok → TT; bestäm <c1/> ur finals2000A vid den epoken.

seg-e5338b713d88 = Rotera varje ITRF-positionsbestämning till GCRS (Geocentric Celestial Reference System) genom CIO-kedjan med dessa EOP — de tröghetsbaserade positionsobservationerna. Dynamiken använder <em>samma</em> EOP för geopotentialens jordfasta rotation, så att observationer och krafter delar ett referenssystem.

seg-ce987e4dda40 = Initiera epokens tillstånd (position = första positionsbestämningen; hastighet = ändlig differens av 2:a ordningen) och batchanpassa <c1/> (nivå { "1" }), därefter dessutom de { "9" } empiriska RTN-accelerationerna per varv (CPR, cycle-per-revolution) (nivå { "2" }, med a priori-begränsning).

seg-22f839d05292 = Rapportera RTN- och 3D-RMS (root mean square) efter anpassning för båda nivåerna och den råa överlappningen.

seg-64e2c3662a27 = Galileo, medelhög jordbana — <b>GREEN</b> (< { "5" } m tröskel)

seg-e77e8e35ba80 = <b>Datamängd:</b> slutlig multi-GNSS-bana från ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) (GNSS: global navigation satellite system) <c1/>, ITRF, 5 minuters sampling, satellit <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominell MEO (medelhög jordbana)), 2022-01-01.

seg-f90d848e7a46 = <b>Öppen källa (ingen inloggning):</b> spegel hos ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Valideringscommit:

seg-c2ad9f9cc050 = <b>Fixturer (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Båge

seg-7db37f753fc1 = 3D-RMS

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Anteckningar

seg-bced8a114852 = CI-fixtur, nivå { "1" } (kraft + <c1/>)

seg-f040df9ee966 = { "8" } h

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = rå överlappning { "78.7" } km

seg-1ce1bc363541 = CI-fixtur, nivå { "2" } (+ empirisk CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = halverar residualen

seg-1b422bc76914 = Utskick av hela bågen, nivå { "1" } (före rättning†)

seg-f57ee3b36d92 = { "24" } h

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = CI-fixturernas tal ovan spelades in på nytt i { "0.36" } efter S2-rättningen av lufttidvattnet (<c1/>): Galileo nivå { "1" } flyttades { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), N-komponenterna för Swarm-A med { "1" }–{ "2" } mm; talen för utskicket av hela bågen kördes inte om. † <b>Före rättning:</b> talet för utskicket av hela bågen spelades in före S2-rättningen av lufttidvattnet i { "0.36" } och har inte körts om på den rättade koden (heldagsprodukterna hämtas av utskicksarbetsflödet och fanns inte tillgängliga i den session som gjorde rättningen). På CI-fixturerna flyttade rättningen Galileos 3D-RMS med mindre än { "1" } mm och Swarm-A:s komponenter med { "1" }–{ "2" } mm, så en ändring av samma storleksordning förväntas; nästa körning av <c2/> spelar in den på nytt.

seg-5141c1811e35 = MEO-fältet är gravitationsmässigt konvergerat vid grad { "8" } (nivå 1-resultatet för { "8" } h är identiskt vid d/o { "8" }, { "10" } och { "12" } på millimetern när), så CI-fixturens avkortning vid d/o 12 är försumbar; utskicksjobbet kör hela d/o 70. Anpassningen över { "8" } h når <b>{ "13" } cm</b> med ren kraft och <b>{ "7" } cm</b> med den empiriska nivån; hela bågen på { "24" } h (mer SRP- och förmörkelsebelastning, längre dynamiskt tidsspann) ger <b>{ "61" } cm</b> — långt inom tröskeln på { "5" } m.

seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (< { "5" } m tröskel)

seg-cba2e4a9b9b1 = <b>Datamängd:</b> ESA Swarm nivå 2, precis vetenskaplig bana med reducerad dynamik <c1/> (<c2/>, GPS-härledd, ITRF / IGb14, ~{ "2" } cm, bearbetning vid Delft University of Technology), satellit <b>Swarm-A</b> (SP3-id <c3/>, ~{ "430" } km LEO), 2022-01-01.

seg-f66ad1515550 = <b>Öppen källa (ingen inloggning):</b> ESA:s Swarm-distributionsserver <c1/> → <c2/> (öppen enligt ESA Data Policy). EOP: samma IERS-serie <c3/> 2022-001.

seg-4de8b64c0bf0 = <b>Fixtur (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = En LEO-båge lägger till <b>atmosfäriskt luftmotstånd</b> i kraftmodellen. Eftersom densitetsmodellen är en <em>statisk</em> styckvis exponentiell anpassas banan i två nivåer: en <b>dynamisk</b> nivå (skatta endast epokens tillstånd; <c1/> hålls vid { "1" }, eftersom luftmotståndet dominerar i LEO och SRP är dåligt separerbart över en kort båge), och en nivå med <b>reducerad dynamik</b> som lägger till de empiriska accelerationerna per varv som bär det omodellerade luftmotståndet — den operativt meningsfulla LEO-banan.

seg-dac35ad223dd = CI-fixtur, dynamisk (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } h

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residualen ≈ ren längs banan (luftmotstånd)

seg-4f8e7956aa78 = CI-fixtur, reducerad dynamik (+empirisk)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = det empiriska absorberar luftmotståndet

seg-ff834d33ae70 = Den dynamiska anpassningen klarar tröskeln på { "5" } m med residualen nästan helt längs banan — den klassiska luftmotståndssignaturen på ~{ "430" } km. Den empiriska nivån absorberar felet längs banan ({ "2.52" } → { "0.09" } m) och ger en anpassning med reducerad dynamik på <b>~{ "10" } cm</b> mot ESA:s egen bana på ~{ "2" } cm. Körningen över hela dygnet med full grad är det ignorerade <c1/> (distributionsservern levererar produkten genom sin filbläddrarsession, så grundaren laddar ner dygnets SP3 och pekar <c2/> på den). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) med rymdvädersdrivare är den noterade uppgraderingen som skulle skärpa den <em>dynamiska</em> nivån ytterligare.

seg-e8f5c385de62 = LRO lunar — validated, <b>över</b> tröskeln på { "5" } m (ärligt) (P4 W4b)

seg-8a22ef5d3765 = <b>Datamängd:</b> den verkliga rekonstruerade banan för NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) från JPL Horizons, geometriska månscentrerade tillståndsvektorer i ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km höjd, 1 minuts sampling ({ "241" } epoker, { "4" } h, ~{ "2" } varv). Att använda Horizons textvektorer kräver <b>ingen SPK/SPICE-läsare (SPK: planetefemeridkärna; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Gravitation:</b> <b>GRGM660PRIM</b>-fältet från GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grad { "660" }), avkortat till d/o { "150" } och anpassat vid d/o { "100" }, utvärderat i månens kroppsfasta <b>huvudaxelsystem</b>.

seg-1454f78e9ca4 = <b>Öppen källa (ingen inloggning):</b> Horizons-API:t (application programming interface) <c1/>; gravitation via ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Fixturer (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Detta är <b>månscentrerad</b> dynamik — en särskild kraftmodell (<c1/>): GRGM-fältet i månens kroppsfasta system (IAU:s { "2015" } orientering för medeljord <c2/> sammansatt med den fasta förskjutningen DE421 (Development Ephemeris { "421" }) medeljord → huvudaxel (ME→PA)), plus jorden (den dominerande störningen i månbanor) och solen som tredje kroppar, anpassad genom <em>samma</em> generiska precisa Gauss–Newton-skattare som jorddatamängderna använder (egenskapen <c3/>).

seg-68f1894a1fa5 = CI-fixtur, dynamisk (endast tillstånd)

seg-0f055118d77a = { "4" } h

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = rå överlappning { "39.9" } m

seg-2923b4d58878 = CI-fixtur, reducerad dynamik (+empirisk { "1" }+2/varv)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = empiriska 1 och 2 per varv absorberar felet längs banan

seg-3f33d99fd643 = Rättning i { "0.36" }: fram till { "0.36" } tillämpades förskjutningen ME→PA i DE421 i fel riktning (och med fel Euler-ordning), vilket gjorde att det analytiska PA-systemet hamnade omkring { "208" }″ från PA i stället för på det. Den är nu transkriberad så som SPICE definierar den (kontrollerad mot <c1/> till { "2.6e-16" } rad, <c2/>; <c3/>). Talen ovan gäller efter rättningen; före den var de { "53.8" } m rått, <b>{ "12.6" } m</b> dynamiskt ({ "3.07" }, { "10.19" }, { "6.81" } m) och <b>{ "6.65" } m</b> med reducerad dynamik ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Dessa residualer ligger <b>över</b> tröskeln på { "5" } m som Galileo ({ "0.13" } m) och Swarm-A ({ "0.10" } m) klarar, och rapporteras ärligt.

seg-c414e14eaaea = Vad som egentligen sätter golvet — en korsvalidering på DE-nivå (och en rättelse)

seg-72b06bac7f6b = Vi antog att den begränsande faktorn var noggrannheten i den <b>analytiska månorienteringen och efemeriden</b> (IAU:s librationsserie, noggrann till tiotals bågsekunder jämfört med JPL:s DE (Development Ephemeris) numeriskt integrerade <c1/>, och Montenbruck–Gills efemerid för jorden och solen, ~{ "0.3" }° jämfört med en DE/SPICE-kärna). För att pröva det direkt byter den arbetsytsexkluderade korsvalideringskratet <c2/> ut <b>enbart</b> dessa två indata mot sådana på <b>DE-nivå</b> — DE440:s (Development Ephemeris { "440" }) orientering av månens huvudaxlar (<c3/>) och DE440-efemeriden (<c4/>), lästa genom ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — en ren Rust-läsare av SPICE-kärnor) — och kör om <em>samma</em> skattare (commit <c5/>, kärnans SHA-256 <c6/> / <c7/>):

seg-3a0e724a8a2b = Nivå

seg-c1ce24cd6008 = analytisk

seg-7d04fb530a3a = rå överlappning

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamisk

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = reducerad dynamik ({ "1" }+2/varv)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Anmärkning för { "0.36" }: det mesta av vinsten på den dynamiska nivån nedan berodde på förskjutningsfelet, inte på indata på DE-nivå.</b> Med den rättade förskjutningen ME→PA ger den analytiska stacken { "39.9" } m rått, { "12.05" } m dynamiskt och { "6.67" } m med reducerad dynamik, mot { "41.5" }, { "12.0" } och { "6.67" } m på DE-nivå: de analytiska anpassningarna och de på DE-nivå stämmer nu överens på varje nivå. Avläsningen { "0.30" } i tabellen nedan följer av detta och är kvar så som den skrevs.

seg-691df96321d8 = <b>Hypotesen stämmer bara till hälften, och huvudpåståendet behövde rättas.</b> Orientering och efemerid på DE-nivå <em>förbättrar</em> den råa överlappningen ({ "53.8" } → { "41.5" } m) och den <b>dynamiska</b> anpassningen ({ "12.6" } → { "12.0" } m) — så felet i den analytiska orienteringen och efemeriden är verkligt och begränsar de nivåerna. Men de lämnar residualen med <b>reducerad dynamik</b> i stort sett <b>oförändrad</b> ({ "6.65" } → { "6.67" } m): den empiriska nivån med { "1" }+2 per varv absorberade <em>redan</em> felet i orientering och efemerid, så det operativa golvet på ~{ "6.6" } m sätts av något annat — en residual som basen med cykler per varv inte kan absorbera och som referenssystem på DE-nivå inte tar bort. Den mest samstämmiga förklaringen är <b>omodellerad icke-gravitationell dynamik hos LRO</b> (termisk återstrålning, avgasning) över den korta bågen på { "4" } h; fältets grad är utesluten (identisk vid d/o { "100" } och { "150" }) och integratorns tolerans är utesluten (identisk vid <c1/> { "1e-6" } mot { "1e-9" }). Den konstruktiva slutsatsen: <b>Kshanas slimmade, kärnfria analytiska månstack matchar redan noggrannheten på DE-nivå för den operativa månbanan med reducerad dynamik</b> — standardinställningen med enbart koefficienter lämnar ingenting oanvänt där. Att passera { "5" } m skulle kräva modellering av LRO:s icke-gravitationella krafter (en rymdfarkostspecifik box-wing-/termisk modell och en längre anpassning över flera bågar), inte bättre referenssystem.

seg-4211fbd25380 = Ärlighetskontrakt

seg-f3b0a26ff5b3 = Den "gröna" tröskeln på < { "5" } m är uppnådd för <b>Galileo MEO</b> ({ "0.13" } m dynamiskt) och <b>Swarm-A LEO</b> ({ "2.69" } m dynamiskt / { "0.10" } m med reducerad dynamik). <b>LRO lunar publiceras som den är med { "12.05" } m dynamiskt / { "6.67" } m med reducerad dynamik ({ "1" }+2 empiriska per varv) — över tröskeln</b> ({ "0.36" }, efter rättningen av förskjutningen ME→PA; { "12.6" } / { "6.65" } m före den). En korsvalidering på DE-nivå (ovan) <b>prövade och rättade</b> påståendet om den begränsande faktorn: golvet med reducerad dynamik är <b>inte</b> den analytiska orienteringen och efemeriden (DE440-kärnor lämnar det oförändrat vid { "6.67" } m), så det stängs inte av bättre referenssystem utan genom modellering av LRO:s icke-gravitationella dynamik — den ärliga, uppdaterade vägen till meternivå.

seg-559a269152ae = För LEO rapporteras nivåerna <b>dynamisk</b> (endast tillstånd, statisk densitet) och <b>reducerad dynamik</b> (med empiriska accelerationer) alltid <b>var för sig</b>, så att läsaren ser vad de empiriska termerna absorberar; nivån med reducerad dynamik är den operativa banan. Samma uppdelning gäller för MEO:s empiriska nivåer och nivåer med ren kraft.

seg-d20c7ef90250 = Varje residual har sin commit-hash, datamängdsreferens och fixturens kontrollsumma angivna ovan.

seg-733d96129fca = <b>Datamängder validerade mot verklig referens från rymdorganisationer: { "3" } av { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO lunar). <b>Når tröskeln < { "5" } m: { "2" } av { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO vid { "6.67" } m, ärligt över den).

seg-d7c77076c9c6 = <s1>Föregående</s1>SGP4-validering

seg-d661003da754 = <s1>Nästa</s1>Solsystemet och andra kroppar

seg-36a3b8105d4b = Galileo, medelhög jordbana — GREEN (< { "5" } m tröskel)

seg-b6f96cf0d55a = Swarm-A LEO — GREEN (< { "5" } m tröskel)

seg-9e739bda7f20 = LRO lunar — validated, över tröskeln på { "5" } m (ärligt) (P4 W4b)
