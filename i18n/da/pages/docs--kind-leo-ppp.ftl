# docs--kind-leo-ppp: translations (da)

seg-37d29d8303fe = km

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Emneside: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenarietype i motoren v{ $version }, familie <a1>Navigation i lav jordbane</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-c5478f572d21 = Familieside: <a1>Navigation i lav jordbane</a1>

seg-8f0aab32310b = Kilde: <c1/>

seg-c9852d3b79c8 = <c1/> (scenarietype)

seg-32a570f1a4fa = Konvergens for præcis punktpositionering (PPP) med kun GNSS og med LEO-udvidelse: et flydende udvidet Kalman-filter på ionosfærefri kode og bærebølgefase med de statiske stationskoordinater, et hvidt modtagerur, én intersystembias pr. ekstra system, en zenit-våd-forsinkelse som random walk afbildet med 1/sin(elevation) og en flydende multiplicitet pr. satellitbue; den præcise bane- og urfejl er hvid og fælles for kode og fase for en satellit, så hver satellit er én korreleret opdatering med to rækker i en Joseph-stabiliseret form. Målinger simuleres ud fra den samme model med seedet støj over flere steder og seeds, og hver sag (først kun GNSS, derefter hver [[case]] af LEO-systemer, enhver konstellation eller forudindstilling) rapporterer den mediane konvergenstid (den første epoke, hvorefter de horisontale og vertikale fejl bliver under tærsklerne, som standard { "10" } cm), andelen, der konvergerede, de mediane fejlkurver og filterets konsistens (den kørselsgennemsnitlige positions-NEES mod det tosidede { "95" }% chi-i-anden-bånd). Eventuelt ved siden af de offentliggjorte tal fra Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) for mellembreddegrader: { "9.6" } min for multi-GNSS forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. MODELLED: en konsistenssammenligning af tendensen, ikke en gengivelse af det studies konstellationer, støj eller stationer; ingen heltalsmultiplicitetsløsning, cycle slips, phase wind-up, tidevand eller tidskorrelerede produktfejl.

seg-8126f4edf6b6 = Én kørsel af <c1/> opsummeres sådan: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Eksemplet <c1/> angiver blandt andet:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Resultatmærkat (motorens): MODELLED flydende PPP (ionosfærefri kode og fase, hvidt ur, våd forsinkelse som random walk, flydende multiplicitet pr. bue) på simulerede målinger fra den samme model; tallene fra Li et al. ({ "2019" }) er en sammenligning af tendens, ikke en gengivelse

seg-225ef04c64af = Diagrammet, som motoren skriver for scenarios/leo-ppp-convergence.toml, scenarietype leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Et flydende PPP-udvidet Kalman-filter på ionosfærefri kode og fase: statiske koordinater, et hvidt modtagerur, én intersystembias pr. ekstra system, en zenit-våd-forsinkelse som random walk afbildet med 1/sin(elevation), en flydende multiplicitet pr. satel Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Et flydende PPP-udvidet Kalman-filter på ionosfærefri kode og fase: statiske koordinater, et hvidt modtagerur, én intersystembias pr. ekstra system, en rand. Uafhængig reference (ExternalDataset): NEES chi-i-anden-testen er en intern konsistenskontrol (sandhed og filter deler modellen). Tendensen sammenlignes med Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. Det medfølgende scenarie giver { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med i

seg-302365809dbf = MODELLED flydende PPP (ionosfærefri kode og fase, hvidt ur, våd forsinkelse som random walk, flydende multiplicitet pr. bue) på simulerede målinger fra den samme model; tallene fra Li et al. ({ "2019" }) er en sammenligning af tendens, ikke en gengivelse (resultat <c1/>)

seg-6ce77bce8946 = MODELLED: en konsistenssammenligning af tendensen, ikke en gengivelse af det studies konstellationer, støj eller stationer; ingen heltalsmultiplicitetsløsning, cycle slips, phase wind-up, tidevand eller tidskorrelerede produktfejl. (typekatalog (<c1/>))

seg-ba2fd25fdcff = De fire LEO-konstellationer her er repræsentative Walker delta-skaller ved { "1000" } km og { "60" } deg med { "60" }, { "96" }, { "192" } og { "288" } satellitter; de er IKKE artiklens udformninger, og støjen, stationerne og konvergensdefinitionen (horisontale og vertikale fejl under { "10" } cm indtil kørslens slutning) er denne models. Sammenligningen er derfor en MODELLED konsistenskontrol af tendensen: konvergensen skal blive kortere monotont med t (kommentar i scenariefilen, linje { "10" } til { "14" })

seg-b641b835570c = Konvergens for præcis punktpositionering med kun GNSS og med LEO-udvidelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Forrige</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Næste</s1>leo-pvt
