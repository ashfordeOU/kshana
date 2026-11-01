# docs--agency-orbit-validation: translations (da)

seg-31d58f23c0a2 = Kør

seg-fbe4b3eb7310 = Kilde: <c1/>

seg-87910a33b87b = Validering af kraftmodeller ved efemeridetilpasning — metode og validerede residualer

seg-09a1b1b673fb = Kshanas fulde kraftmotor (<c1/>) tilpasset til <b>ægte præcisionsbaneprodukter fra rumfartsagenturer</b>, med ærlige, citérbare residualer stemplet med commit-hash. Dette er valideringsregistreringen for køreplanens milepæl P4 ("Præcis astrodynamik: gravitation af høj orden, SRP (solstrålingstryk), validering mod agenturdatasæt").

seg-90f366667f78 = Hvad et valideret residual betyder her

seg-3861b68a03e2 = Et residual rapporteres kun, når alt det følgende gælder (udformning <c1/>):

seg-954f4f934461 = <b>Kraftmodellen</b> omfatter enhver perturbation, der har betydning ved den ønskede nøjagtighed: EGM2008 (Earth Gravitational Model { "2008" }) geopotentiale af høj grad (afkortet ved en angivet grad/orden, d/o), faste + oceaniske + atmosfæriske <b>tidevand</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } kap. { "6" }), tredjelegemer Sol/Måne, kanonkugle-SRP med konisk skygge + estimeret <c2/>, luftmodstand (kun LEO (lav jordbane)), Schwarzschild- + Lense–Thirring-led fra den generelle relativitetsteori (GR) (<c3/>).

seg-710f89c088cc = <b>Estimatoren</b> er en ægte Gauss–Newton batch-mindste kvadraters metode med en variationel <b>tilstandsovergangsmatrix</b> (krydstjekket mod endelig differens over hele buen til < { "1e-6" }), observationsvægtning med <c1/> og n-sigma-redigering af outliers.

seg-dd5dcc66ed22 = <b>Referencesystemer/tid</b> bruger <b>ægte IERS finals2000A-parametre for jordorientering (EOP)</b> (UT1 (Universal Time { "1" }, tid for jordens rotation)−UTC (Coordinated Universal Time), polbevægelse; <c1/>) gennem den validerede IAU-kæde (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). SP3-GPS-tid (Standard Product { "3" }, formatet til præcise baner) (Global Positioning System) → TT (Terrestrial Time) via den faste forskydning på { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Residualer</b> rapporteres i <b>RTN</b> (radial/langs-/tværsporet) og 3-D, <b>med og uden</b> empiriske accelerationer, ved siden af det rå overlap (uden tilpasning).

seg-fea4515ba842 = Hvert tal er <b>reproducerbart</b> (åben-data CI-port (continuous integration)) og <b>citérbart</b> (commit-hash + datasætreference + fixture-SHA-256 (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Metode, pr. datasæt

seg-a98b098e815a = Fortolk den præcise SP3-bane; for den valgte satellit tages hver ITRF-positionsbestemmelse (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Konvertér SP3 GPS-epoken → TT; slå <c1/> op i finals2000A ved den epoke.

seg-e5338b713d88 = Roter hver ITRF-positionsbestemmelse til GCRS (Geocentric Celestial Reference System) gennem CIO-kæden med disse EOP — de inertiale positionsobservationer. Dynamikken bruger de <em>samme</em> EOP til geopotentialets jordfaste rotation, så observationer og kræfter deler ét referencesystem.

seg-ce987e4dda40 = Initialisér epoketilstanden (position = første positionsbestemmelse; hastighed = 2. ordens endelig differens) og tilpas <c1/> i batch (niveau { "1" }), derefter desuden de { "9" } empiriske RTN-accelerationer med cyklus pr. omløb (CPR) (niveau { "2" }, med forhåndsbegrænsning).

seg-22f839d05292 = Rapportér RTN + 3-D RMS (root mean square) efter tilpasning for begge niveauer og det rå overlap.

seg-64e2c3662a27 = Galileo i medium jordbane — <b>GREEN</b> (< { "5" } m tærskel)

seg-e77e8e35ba80 = <b>Datasæt:</b> endelig multi-GNSS-bane fra ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) (GNSS: global navigation satellite system) <c1/>, ITRF, 5-minutters sampling, satellit <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominel MEO (medium jordbane)), 2022-01-01.

seg-f90d848e7a46 = <b>Åben kilde (uden login):</b> spejl hos ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Valideringscommit:

seg-c2ad9f9cc050 = <b>Fixtures (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Bue

seg-7db37f753fc1 = 3-D RMS

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Noter

seg-bced8a114852 = CI-fixture, niveau { "1" } (kraft + <c1/>)

seg-f040df9ee966 = { "8" } t

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = råt overlap { "78.7" } km

seg-1ce1bc363541 = CI-fixture, niveau { "2" } (+ empirisk CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = halverer residualet

seg-1b422bc76914 = Afvikling af hele buen, niveau { "1" } (før rettelsen†)

seg-f57ee3b36d92 = { "24" } t

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = CI-fixture-tallene ovenfor blev genoptaget i { "0.36" } efter S2-rettelsen af lufttidevand (<c1/>): Galileo niveau { "1" } flyttede sig { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), Swarm-A's N-komponenter med { "1" }–{ "2" } mm; tallene for afvikling af hele buen blev ikke kørt igen. † <b>Før rettelsen:</b> tallet for afvikling af hele buen blev optaget før { "0.36" }-rettelsen S2 af lufttidevand og er ikke kørt igen på den rettede kode (de fulde døgnprodukter hentes af dispatch-workflowet og var ikke tilgængelige i den session, der lavede rettelsen). På CI-fixtures flyttede rettelsen Galileos 3-D RMS med under { "1" } mm og Swarm-A's komponenter med { "1" }–{ "2" } mm, så en ændring af samme størrelsesorden forventes; den næste <c2/>-kørsel optager den igen.

seg-5141c1811e35 = MEO-feltet er gravitationsmæssigt konvergeret ved grad { "8" } (niveau 1-resultatet for { "8" } t er identisk ved d/o { "8" }, { "10" } og { "12" } på millimeteren), så CI-fixturens afkortning ved d/o 12 er ubetydelig; dispatch-jobbet kører den fulde d/o 70. Tilpasningen på { "8" } t når <b>{ "13" } cm</b> med ren kraft og <b>{ "7" } cm</b> med det empiriske niveau; den fulde bue på { "24" } t (mere SRP-/formørkelsespåvirkning, længere dynamisk spændvidde) giver <b>{ "61" } cm</b> — alt sammen langt inden for tærsklen på { "5" } m.

seg-45a95547dbcc = Swarm-A i LEO — <b>GREEN</b> (< { "5" } m tærskel)

seg-cba2e4a9b9b1 = <b>Datasæt:</b> ESA Swarm Level-2 reduceret-dynamisk præcis videnskabelig bane <c1/> (<c2/>, GPS-afledt, ITRF / IGb14, ~{ "2" } cm, behandlet af Delft University of Technology), satellit <b>Swarm-A</b> (SP3-id <c3/>, ~{ "430" } km LEO), 2022-01-01.

seg-f66ad1515550 = <b>Åben kilde (uden login):</b> ESA Swarm-distributionsserver <c1/> → <c2/> (åben under ESA Data Policy). EOP: den samme IERS <c3/> 2022-001-serie.

seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = En LEO-bue føjer <b>atmosfærisk luftmodstand</b> til kraftmodellen. Fordi tæthedsmodellen er en <em>statisk</em> stykkevis eksponentiel, tilpasses banen i to niveauer: et <b>dynamisk</b> niveau (kun epoketilstanden estimeres; <c1/> fastholdt på { "1" }, da luftmodstand dominerer i LEO, og SRP kun dårligt lader sig adskille over en kort bue), og et <b>reduceret-dynamisk</b> niveau, der tilføjer de empiriske accelerationer med cyklus pr. omløb, som bærer den ikke-modellerede luftmodstand — den operationelt meningsfulde LEO-bane.

seg-dac35ad223dd = CI-fixture, dynamisk (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } t

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residual ≈ ren langs sporet (luftmodstand)

seg-4f8e7956aa78 = CI-fixture, reduceret-dynamisk (+empirisk)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = det empiriske absorberer luftmodstanden

seg-ff834d33ae70 = Den dynamiske tilpasning klarer tærsklen på { "5" } m, og residualet ligger næsten udelukkende langs sporet — luftmodstandens lærebogssignatur ved ~{ "430" } km. Det empiriske niveau absorberer denne fejl langs sporet ({ "2.52" } → { "0.09" } m) og giver en reduceret-dynamisk tilpasning på <b>~{ "10" } cm</b> mod ESA's egen bane på ~{ "2" } cm. Kørslen af hele døgnet med fuld grad er det ignorerede <c1/> (distributionsserveren leverer produktet gennem sin filbrowser-session, så grundlæggeren henter dagens SP3 og peger <c2/> på den). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosfæremodel) med rumvejrsdrivere er den noterede opgradering, der ville stramme det <em>dynamiske</em> niveau yderligere.

seg-e8f5c385de62 = LRO måne — valideret, <b>over</b> tærsklen på { "5" } m (ærligt) (P4 W4b)

seg-8a22ef5d3765 = <b>Datasæt:</b> den ægte rekonstruerede bane for NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) fra JPL Horizons, geometriske månecentrerede tilstandsvektorer i ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km højde, 1-minuts sampling ({ "241" } epoker, { "4" } t, ~{ "2" } omløb). Brug af Horizons' tekstvektorer kræver <b>ingen SPK/SPICE-læser (SPK: planetarisk efemeridekerne; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Gravitation:</b> <b>GRGM660PRIM</b>-feltet fra GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grad { "660" }), afkortet til d/o { "150" } og tilpasset ved d/o { "100" }, evalueret i det månefaste <b>hovedaksesystem</b>.

seg-1454f78e9ca4 = <b>Åben kilde (uden login):</b> Horizons API (application programming interface) <c1/>; gravitation via ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Fixtures (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Dette er <b>månecentreret</b> dynamik — en særskilt kraftmodel (<c1/>): GRGM-feltet i det månefaste system (IAU { "2015" }-orienteringen for gennemsnitlig jord <c2/> sammensat med den faste DE421-forskydning (Development Ephemeris { "421" }) fra gennemsnitlig jord til hovedakser (ME→PA)), plus Jorden (den dominerende perturbation i månebaner) og Solen som tredjelegemer, tilpasset gennem den <em>samme</em> generiske præcise Gauss–Newton-estimator, som jorddatasættene bruger (traitet <c3/>).

seg-68f1894a1fa5 = CI-fixture, dynamisk (kun tilstand)

seg-0f055118d77a = { "4" } t

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = råt overlap { "39.9" } m

seg-2923b4d58878 = CI-fixture, reduceret-dynamisk (+empirisk { "1" }+2/omløb)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = 1- og 2-pr.-omløb empiriske absorberer det langs sporet

seg-3f33d99fd643 = Rettelse i { "0.36" }: indtil { "0.36" } blev DE421 ME→PA-forskydningen anvendt i den forkerte retning (og med den forkerte Euler-rækkefølge), hvilket placerede det analytiske PA-system omkring { "208" }″ fra PA i stedet for på det. Den er nu transskriberet, som SPICE definerer den (kontrolleret mod <c1/> til { "2.6e-16" } rad, <c2/>; <c3/>). Tallene ovenfor er efter rettelsen; før den var de { "53.8" } m rå, <b>{ "12.6" } m</b> dynamisk ({ "3.07" }, { "10.19" }, { "6.81" } m) og <b>{ "6.65" } m</b> reduceret-dynamisk ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Disse residualer ligger <b>over</b> tærsklen på { "5" } m, som Galileo ({ "0.13" } m) og Swarm-A ({ "0.10" } m) klarer, og rapporteres ærligt.

seg-c414e14eaaea = Hvad der faktisk sætter gulvet — en krydsvalidering på DE-niveau (og en rettelse)

seg-72b06bac7f6b = Vi antog, at den begrænsende faktor var troværdigheden af den <b>analytiske månes orientering og efemeride</b> (IAU's librationsserie, nøjagtig til titals buesekunder i forhold til JPL's numerisk integrerede DE (Development Ephemeris) <c1/>, og Montenbruck–Gill-efemeriden for Jorden/Solen, ~{ "0.3" }° i forhold til en DE/SPICE-kerne). For at teste det direkte bytter krydsvalideringskassen <c2/>, som er udelukket fra workspace, <b>kun</b> de to input ud med input på <b>DE-niveau</b> — DE440-orienteringen (Development Ephemeris { "440" }) af månens hovedakser (<c3/>) og DE440-efemeriden (<c4/>), læst gennem ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — en ren Rust-læser af SPICE-kerner) — og kører den <em>samme</em> estimator igen (commit <c5/>, kerne-SHA-256 <c6/> / <c7/>):

seg-3a0e724a8a2b = Niveau

seg-c1ce24cd6008 = analytisk

seg-7d04fb530a3a = råt overlap

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamisk

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = reduceret-dynamisk ({ "1" }+2/omløb)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Note for { "0.36" }: det meste af gevinsten i det dynamiske niveau nedenfor skyldtes forskydningsfejlen, ikke input på DE-niveau.</b> Med ME→PA-forskydningen rettet giver den analytiske stak { "39.9" } m rå, { "12.05" } m dynamisk og { "6.67" } m reduceret-dynamisk mod { "41.5" }, { "12.0" } og { "6.67" } m på DE-niveau: den analytiske tilpasning og tilpasningen på DE-niveau stemmer nu overens på hvert niveau. Aflæsningen på { "0.30" } i tabellen nedenfor følger heraf og er bevaret, som den blev skrevet.

seg-691df96321d8 = <b>Hypotesen er kun halvt rigtig, og hovedpåstanden måtte rettes.</b> Orientering og efemeride på DE-niveau forbedrer <em>faktisk</em> det rå overlap ({ "53.8" } → { "41.5" } m) og den <b>dynamiske</b> tilpasning ({ "12.6" } → { "12.0" } m) — så fejlen i den analytiske orientering/efemeride er reel og begrænser de niveauer. Men de lader det <b>reducerede-dynamiske</b> residual i det væsentlige <b>uændret</b> ({ "6.65" } → { "6.67" } m): det empiriske niveau med { "1" }+2 pr. omløb absorberede <em>allerede</em> fejlen i orientering/efemeride, så det operationelle gulv på ~{ "6.6" } m sættes af noget andet — et residual, som basen med cyklus pr. omløb ikke kan absorbere, og som referencesystemer på DE-niveau ikke fjerner. Den mest sammenhængende forklaring er <b>ikke-modellerede ikke-gravitationelle kræfter på LRO</b> (termisk genudstråling, afgasning) over den korte bue på { "4" } t; feltets grad er udelukket (identisk ved d/o { "100" } og { "150" }), og integratortolerance er udelukket (identisk ved <c1/> { "1e-6" } mod { "1e-9" }). Den konstruktive følge: <b>Kshanas slanke, kernefri analytiske månestak matcher allerede troværdigheden på DE-niveau for den reducerede-dynamiske (operationelle) månebane</b> — standarden med rene koefficienter efterlader intet på bordet der. At nå under { "5" } m ville kræve modellering af LRO's ikke-gravitationelle kræfter (en rumfartøjsspecifik box-wing-/termisk model og en længere tilpasning over flere buer), ikke bedre referencesystemer.

seg-4211fbd25380 = Ærlighedskontrakt

seg-f3b0a26ff5b3 = Den "grønne" tærskel på < { "5" } m er nået for <b>Galileo MEO</b> ({ "0.13" } m dynamisk) og <b>Swarm-A LEO</b> ({ "2.69" } m dynamisk / { "0.10" } m reduceret-dynamisk). <b>LRO måne offentliggøres som den er, med { "12.05" } m dynamisk / { "6.67" } m reduceret-dynamisk ({ "1" }+2 pr. omløb empirisk) — over tærsklen</b> ({ "0.36" }, efter rettelsen af ME→PA-forskydningen; { "12.6" } / { "6.65" } m før den). En krydsvalidering på DE-niveau (ovenfor) <b>testede og rettede</b> påstanden om den begrænsende faktor: gulvet for det reducerede-dynamiske niveau er <b>ikke</b> den analytiske orientering/efemeride (DE440-kernerne lader det uændret på { "6.67" } m), så det lukkes ikke af bedre referencesystemer, men ved at modellere LRO's ikke-gravitationelle dynamik — den ærlige, opdaterede vej til meterniveau.

seg-559a269152ae = For LEO rapporteres det <b>dynamiske</b> niveau (kun tilstand, statisk tæthed) og det <b>reducerede-dynamiske</b> niveau (med empiriske accelerationer) altid <b>hver for sig</b>, så læseren kan se, hvad de empiriske led absorberer; det reducerede-dynamiske niveau er den operationelle bane. Den samme adskillelse gælder for de empiriske niveauer og niveauerne med ren kraft i MEO.

seg-d20c7ef90250 = Hvert residual bærer sin commit-hash, datasætreference og fixture-kontrolsum ovenfor.

seg-733d96129fca = <b>Datasæt valideret mod ægte reference fra agenturer: { "3" } af { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO måne). <b>Når tærsklen på < { "5" } m: { "2" } af { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO ved { "6.67" } m, ærligt talt over den).

seg-d7c77076c9c6 = <s1>Forrige</s1>SGP4-validering

seg-d661003da754 = <s1>Næste</s1>Solsystemet og andre legemer

seg-36a3b8105d4b = Galileo i medium jordbane — GREEN (< { "5" } m tærskel)

seg-b6f96cf0d55a = Swarm-A i LEO — GREEN (< { "5" } m tærskel)

seg-9e739bda7f20 = LRO måne — valideret, over tærsklen på { "5" } m (ærligt) (P4 W4b)
