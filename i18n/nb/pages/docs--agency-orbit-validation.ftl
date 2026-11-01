# docs--agency-orbit-validation: translations (nb)

seg-31d58f23c0a2 = Kjør

seg-fbe4b3eb7310 = Kilde: <c1/>

seg-87910a33b87b = Validering av kraftmodellen ved efemeridetilpasning — metodikk og validerte residualer

seg-09a1b1b673fb = Kshanas fullkraftsmotor (<c1/>) tilpasset <b>ekte presise banedata fra romorganisasjoner</b>, med ærlige, siterbare residualer stemplet med commit-hash. Dette er valideringsgrunnlaget for veikartets milepæl P4 («Presis astrodynamikk: høygradig gravitasjon, SRP (solstrålingstrykk), validering mot datasett fra romorganisasjoner»).

seg-90f366667f78 = Hva en validert residual betyr her

seg-3861b68a03e2 = En residual rapporteres bare når alt det følgende gjelder (utforming <c1/>):

seg-954f4f934461 = <b>Kraftmodellen</b> inkluderer alle forstyrrelser som betyr noe ved målnøyaktigheten: EGM2008 (Earth Gravitational Model { "2008" }) høygradig geopotensial (avkortet ved en oppgitt grad/orden, d/o), fast + hav- + atmosfæriske <b>tidevann</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } kap. { "6" }), tredjelegemer Sol/Måne, kanonkule-SRP med konisk skygge + estimert <c2/>, luftmotstand (bare LEO (lav jordbane)), Schwarzschild- og Lense–Thirring-ledd for generell relativitetsteori (GR) (<c3/>).

seg-710f89c088cc = <b>Estimatoren</b> er en ekte Gauss–Newton batch-minste-kvadraters metode med en variasjonell <b>tilstandsovergangsmatrise</b> (krysskontrollert mot endelig differanse over hele buen til < { "1e-6" }), <c1/> observasjonsvekting og n-sigma-redigering av uteliggere.

seg-dd5dcc66ed22 = <b>Referansesystemer/tid</b> bruker <b>ekte IERS finals2000A jordorienteringsparametere (EOP)</b> (UT1 (Universal Time { "1" }, jordrotasjonstid)−UTC (Coordinated Universal Time), polbevegelse; <c1/>) gjennom den validerte IAU-kjeden (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). SP3 (Standard Product { "3" }, formatet for presise baner) GPS-tid (Global Positioning System) → TT (Terrestrial Time) via den faste forskjellen på { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Residualer</b> rapporteres i <b>RTN</b> (radiell/langs banen/på tvers av banen) og 3D, <b>med og uten</b> empiriske akselerasjoner, ved siden av den rå overlappen (uten tilpasning).

seg-fea4515ba842 = Hvert tall er <b>reproduserbart</b> (åpne data, CI-port (kontinuerlig integrasjon)) og <b>siterbart</b> (commit-hash + datasettreferanse + SHA-256 for testdata (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Metode, per datasett

seg-a98b098e815a = Tolk den presise SP3-banen; for den valgte satellitten tas hver ITRF-posisjonsbestemmelse (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Konverter SP3 GPS-epoken → TT; finn <c1/> fra finals2000A ved den epoken.

seg-e5338b713d88 = Roter hver ITRF-posisjonsbestemmelse inn i GCRS (Geocentric Celestial Reference System) gjennom CIO-kjeden med disse EOP-ene — de inertielle posisjonsobservasjonene. Dynamikken bruker de <em>samme</em> EOP-ene for geopotensialets jordfaste rotasjon, slik at observasjoner og krefter deler ett referansesystem.

seg-ce987e4dda40 = Sett epokens tilstand (posisjon = første posisjonsbestemmelse; hastighet = endelig differanse av 2. orden) og tilpass <c1/> i batch (nivå { "1" }), deretter i tillegg de { "9" } empiriske akselerasjonene per omløp i RTN (CPR, cycle-per-revolution) (nivå { "2" }, begrenset a priori).

seg-22f839d05292 = Rapporter RMS (root mean square) i RTN + 3D etter tilpasning for begge nivåer og den rå overlappen.

seg-64e2c3662a27 = Galileo i middels jordbane — <b>GREEN</b> (< { "5" } m terskel)

seg-e77e8e35ba80 = <b>Datasett:</b> ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) endelig multi-GNSS-bane (GNSS: global navigation satellite system) <c1/>, ITRF, 5 minutters sampling, satellitt <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominell MEO (middels jordbane)), 2022-01-01.

seg-f90d848e7a46 = <b>Åpen kilde (uten innlogging):</b> speil hos ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Valideringscommit:

seg-c2ad9f9cc050 = <b>Testdata (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Bue

seg-7db37f753fc1 = 3D RMS

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Merknader

seg-bced8a114852 = CI-testdata, nivå { "1" } (kraft + <c1/>)

seg-f040df9ee966 = { "8" } t

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = rå overlapp { "78.7" } km

seg-1ce1bc363541 = CI-testdata, nivå { "2" } (+ empirisk CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = halverer residualen

seg-1b422bc76914 = Utsendelse over full bue, nivå { "1" } (før rettelsen†)

seg-f57ee3b36d92 = { "24" } t

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = CI-testdatatallene ovenfor ble tatt opp på nytt i { "0.36" } etter S2-rettelsen for lufttidevann (<c1/>): Galileo nivå { "1" } flyttet seg { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), N-komponentene for Swarm-A med { "1" }–{ "2" } mm; tallene fra utsendelsen over full bue ble ikke kjørt på nytt. † <b>Før rettelsen:</b> tallet fra utsendelsen over full bue ble tatt opp før S2-rettelsen for lufttidevann i { "0.36" } og er ikke kjørt på nytt med den rettede koden (produktene for hele døgn hentes av utsendelsesarbeidsflyten og var ikke tilgjengelige i økten som laget rettelsen). På CI-testdataene flyttet rettelsen 3D RMS for Galileo med under { "1" } mm og komponentene for Swarm-A med { "1" }–{ "2" } mm, så en endring av samme størrelsesorden er ventet; neste <c2/>-kjøring tar den opp på nytt.

seg-5141c1811e35 = MEO-feltet er gravitasjonelt konvergert ved grad { "8" } (resultatet for nivå 1 over { "8" } t er identisk ved d/o { "8" }, { "10" } og { "12" } på millimeteren nær), så avkortingen til d/o 12 i CI-testdataene er ubetydelig; utsendelsesjobben kjører full d/o 70. Tilpasningen over { "8" } t når <b>{ "13" } cm</b> med ren kraft og <b>{ "7" } cm</b> med det empiriske nivået; hele buen på { "24" } t (mer SRP-/formørkelsesbelastning, lengre dynamisk spenn) gir <b>{ "61" } cm</b> — alt langt innenfor terskelen på { "5" } m.

seg-45a95547dbcc = Swarm-A i LEO — <b>GREEN</b> (< { "5" } m terskel)

seg-cba2e4a9b9b1 = <b>Datasett:</b> presis vitenskapelig bane med redusert dynamikk fra ESA Swarm nivå 2 <c1/> (<c2/>, GPS-avledet, ITRF / IGb14, ~{ "2" } cm, behandlet ved Delft University of Technology), satellitt <b>Swarm-A</b> (SP3-id <c3/>, ~{ "430" } km LEO), 2022-01-01.

seg-f66ad1515550 = <b>Åpen kilde (uten innlogging):</b> ESA Swarms distribusjonsserver <c1/> → <c2/> (åpen under ESAs datapolitikk). EOP: den samme IERS-serien <c3/> 2022-001.

seg-4de8b64c0bf0 = <b>Testdata (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = En LEO-bue legger <b>atmosfærisk luftmotstand</b> til kraftmodellen. Fordi tetthetsmodellen er en <em>statisk</em> stykkevis eksponentiell, tilpasses banen i to nivåer: et <b>dynamisk</b> nivå (estimer bare epokens tilstand; <c1/> holdes på { "1" }, siden luftmotstand dominerer i LEO og SRP er dårlig adskillbar over en kort bue), og et <b>redusert-dynamisk</b> nivå som legger til de empiriske akselerasjonene per omløp som bærer den umodellerte luftmotstanden — den operativt meningsfulle LEO-banen.

seg-dac35ad223dd = CI-testdata, dynamisk (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } t

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residual ≈ ren langs-banen (luftmotstand)

seg-4f8e7956aa78 = CI-testdata, redusert-dynamisk (+empirisk)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = det empiriske opptar luftmotstanden

seg-ff834d33ae70 = Den dynamiske tilpasningen holder terskelen på { "5" } m med residualen nesten helt langs banen — den typiske luftmotstandssignaturen ved ~{ "430" } km. Det empiriske nivået opptar denne langs-banen-feilen ({ "2.52" } → { "0.09" } m) og gir en redusert-dynamisk tilpasning på <b>~{ "10" } cm</b> mot ESAs egen bane på ~{ "2" } cm. Kjøringen for hele døgnet og full grad er den ignorerte <c1/> (distribusjonsserveren leverer produktet gjennom sin filleserøkt, så grunnleggeren laster ned dagens SP3 og peker <c2/> på den). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) med romværdrivere er den noterte oppgraderingen som ville stramme inn det <em>dynamiske</em> nivået ytterligere.

seg-e8f5c385de62 = LRO ved Månen — validert, <b>over</b> terskelen på { "5" } m (ærlig) (P4 W4b)

seg-8a22ef5d3765 = <b>Datasett:</b> den ekte NASA/JPL-rekonstruerte banen (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) til <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) fra JPL Horizons, geometriske månesentrerte tilstandsvektorer i ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km høyde, 1 minutts sampling ({ "241" } epoker, { "4" } t, ~{ "2" } omløp). Bruk av Horizons-tekstvektorer krever <b>ingen SPK/SPICE-leser (SPK: planetefemeridekjerne; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Gravitasjon:</b> <b>GRGM660PRIM</b>-feltet fra GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, grad { "660" }), avkortet til d/o { "150" } og tilpasset ved d/o { "100" }, evaluert i det månefaste <b>hovedakse</b>-systemet.

seg-1454f78e9ca4 = <b>Åpen kilde (uten innlogging):</b> Horizons-API (application programming interface) <c1/>; gravitasjon via ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Testdata (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Dette er <b>månesentrert</b> dynamikk — en egen kraftmodell (<c1/>): GRGM-feltet i det månefaste systemet (IAU { "2015" } middelorientering for Månen <c2/> sammensatt med den faste DE421-forskyvningen (Development Ephemeris { "421" }) fra middeljord til hovedakse (ME→PA)), pluss Jorden (den dominerende forstyrrelsen i månebane) og Solen som tredjelegemer, tilpasset gjennom den <em>samme</em> generiske presise Gauss–Newton-estimatoren som jorddatasettene bruker (trekket <c3/>).

seg-68f1894a1fa5 = CI-testdata, dynamisk (bare tilstand)

seg-0f055118d77a = { "4" } t

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = rå overlapp { "39.9" } m

seg-2923b4d58878 = CI-testdata, redusert-dynamisk (+empirisk { "1" }+2/omløp)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = 1- og 2-per-omløp empirisk opptar langs-banen-feilen

seg-3f33d99fd643 = Rettelse i { "0.36" }: frem til { "0.36" } ble DE421 ME→PA-forskyvningen brukt i feil retning (og med feil Euler-rekkefølge), noe som la det analytiske PA-systemet omtrent { "208" }″ fra PA i stedet for på det. Den er nå transkribert slik SPICE definerer den (kontrollert mot <c1/> til { "2.6e-16" } rad, <c2/>; <c3/>). Tallene ovenfor er etter rettelsen; før den var de { "53.8" } m rå, <b>{ "12.6" } m</b> dynamisk ({ "3.07" }, { "10.19" }, { "6.81" } m) og <b>{ "6.65" } m</b> redusert-dynamisk ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Disse residualene ligger <b>over</b> terskelen på { "5" } m som Galileo ({ "0.13" } m) og Swarm-A ({ "0.10" } m) klarer, og de rapporteres ærlig.

seg-c414e14eaaea = Hva som faktisk setter gulvet — en kryssvalidering på DE-nivå (og en rettelse)

seg-72b06bac7f6b = Vi antok at den begrensende faktoren var kvaliteten på den <b>analytiske månens orientering og efemeride</b> (IAU-librasjonsserien, nøyaktig til titalls buesekunder mot JPL DE (Development Ephemeris) numerisk integrerte <c1/>, og Montenbruck–Gill-efemeriden for Jorden/Solen, ~{ "0.3" }° mot en DE/SPICE-kjerne). For å teste dette direkte bytter kryssvalideringskassen <c2/>, som er utelatt fra arbeidsområdet, ut <b>bare</b> disse to inndataene med inndata på <b>DE-nivå</b> — månens hovedaksemorientering fra DE440 (Development Ephemeris { "440" }) (<c3/>) og efemeriden fra DE440 (<c4/>), lest gjennom ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — en ren Rust-leser for SPICE-kjerner) — og kjører den <em>samme</em> estimatoren på nytt (commit <c5/>, kjerne-SHA-256 <c6/> / <c7/>):

seg-3a0e724a8a2b = Nivå

seg-c1ce24cd6008 = analytisk

seg-7d04fb530a3a = rå overlapp

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamisk

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = redusert-dynamisk ({ "1" }+2/omløp)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Merknad for { "0.36" }: mesteparten av gevinsten i det dynamiske nivået nedenfor kom fra forskyvningsfeilen, ikke fra inndataene på DE-nivå.</b> Med ME→PA-forskyvningen rettet gir den analytiske stabelen { "39.9" } m rå, { "12.05" } m dynamisk og { "6.67" } m redusert-dynamisk, mot { "41.5" }, { "12.0" } og { "6.67" } m på DE-nivå: de analytiske og DE-nivå-tilpasningene stemmer nå overens på hvert nivå. Avlesningen på { "0.30" } i tabellen nedenfor følger av dette og er beholdt slik den ble skrevet.

seg-691df96321d8 = <b>Hypotesen er bare halvveis riktig, og hovedpåstanden måtte rettes.</b> Orientering og efemeride på DE-nivå <em>forbedrer</em> den rå overlappen ({ "53.8" } → { "41.5" } m) og den <b>dynamiske</b> tilpasningen ({ "12.6" } → { "12.0" } m) — så feilen i den analytiske orienteringen/efemeriden er reell og begrenser disse nivåene. Men de lar den <b>redusert-dynamiske</b> residualen være i hovedsak <b>uendret</b> ({ "6.65" } → { "6.67" } m): det empiriske nivået med { "1" }+2 per omløp opptok <em>allerede</em> orienterings-/efemeridefeilen, så det operative gulvet på ~{ "6.6" } m settes av noe annet — en residual som basisen per omløp ikke kan oppta og som rammer på DE-nivå ikke fjerner. Den mest konsistente forklaringen er <b>umodellert ikke-gravitasjonell dynamikk for LRO</b> (termisk reemisjon, avgassing) over den korte buen på { "4" } t; feltgrad er utelukket (identisk ved d/o { "100" } og { "150" }) og integratortoleranse er utelukket (identisk ved <c1/> { "1e-6" } mot { "1e-9" }). Den konstruktive følgen: <b>Kshanas slanke, kjernefrie analytiske månestabel treffer allerede kvaliteten på DE-nivå for den redusert-dynamiske (operative) månebanen</b> — standarden med rene koeffisienter lar ingenting ligge igjen der. Å krysse { "5" } m ville kreve modellering av LROs ikke-gravitasjonelle krefter (en romfartøyspesifikk boks-og-vinge-/termisk modell og en lengre tilpasning over flere buer), ikke bedre rammer.

seg-4211fbd25380 = Ærlighetskontrakt

seg-f3b0a26ff5b3 = Den «grønne» terskelen på < { "5" } m er nådd for <b>Galileo MEO</b> ({ "0.13" } m dynamisk) og <b>Swarm-A LEO</b> ({ "2.69" } m dynamisk / { "0.10" } m redusert-dynamisk). <b>LRO ved Månen publiseres som den er, på { "12.05" } m dynamisk / { "6.67" } m redusert-dynamisk ({ "1" }+2 per omløp empirisk) — over terskelen</b> ({ "0.36" }, etter rettelsen av ME→PA-forskyvningen; { "12.6" } / { "6.65" } m før den). En kryssvalidering på DE-nivå (ovenfor) <b>testet og rettet</b> påstanden om den begrensende faktoren: gulvet for redusert-dynamisk er <b>ikke</b> den analytiske orienteringen/efemeriden (DE440-kjernene lar det stå uendret på { "6.67" } m), så det lukkes ikke av bedre rammer, men ved å modellere LROs ikke-gravitasjonelle dynamikk — den ærlige, oppdaterte veien til meternivå.

seg-559a269152ae = For LEO rapporteres nivåene <b>dynamisk</b> (bare tilstand, statisk tetthet) og <b>redusert-dynamisk</b> (med empiriske akselerasjoner) alltid <b>hver for seg</b>, slik at leseren ser hva de empiriske leddene opptar; det redusert-dynamiske nivået er den operative banen. Den samme adskillelsen gjelder for de empiriske nivåene og nivåene med ren kraft for MEO.

seg-d20c7ef90250 = Hver residual bærer sin commit-hash, datasettreferanse og kontrollsum for testdata ovenfor.

seg-733d96129fca = <b>Datasett validert mot ekte referanse fra romorganisasjoner: { "3" } av { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO ved Månen). <b>Nådde terskelen på < { "5" } m: { "2" } av { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO på { "6.67" } m, ærlig talt over den).

seg-d7c77076c9c6 = <s1>Forrige</s1>SGP4-validering

seg-d661003da754 = <s1>Neste</s1>Solsystemet og andre legemer

seg-36a3b8105d4b = Galileo i middels jordbane — GREEN (< { "5" } m terskel)

seg-b6f96cf0d55a = Swarm-A i LEO — GREEN (< { "5" } m terskel)

seg-9e739bda7f20 = LRO ved Månen — validert, over terskelen på { "5" } m (ærlig) (P4 W4b)
