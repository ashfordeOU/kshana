# docs--kind-leo-ppp: translations (nb)

seg-37d29d8303fe = km

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Temaside: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-8f0aab32310b = Kilde: <c1/>

seg-c9852d3b79c8 = <c1/> (scenariotype)

seg-32a570f1a4fa = Konvergens for presis punktposisjonering (PPP) med kun GNSS og med LEO-støtte: et flytende utvidet Kalman-filter på ionosfærefri kode og bærebølgefase med de statiske stasjonskoordinatene, en hvit mottakerklokke, én intersystembias per ekstra system, en random-walk zenitfuktforsinkelse avbildet med 1/sin(elevasjon) og en flytende flertydighet per satellittbue; den presise bane-og-klokke-feilen er hvit og felles for kode og fase for en satellitt, så hver satellitt er én korrelert oppdatering med to rader på Joseph-stabilisert form. Målingene simuleres fra den samme modellen med seedet støy over flere steder og seed, og hvert tilfelle (først kun GNSS, deretter hvert [[case]] med LEO-systemer, enhver konstellasjon eller forhåndsinnstilling) rapporterer median konvergenstid (den første epoken etter hvilken de horisontale og vertikale feilene holder seg under terskelene, { "10" } cm som standard), andelen som konvergerte, medianfeilkurvene og filterets konsistens (den kjøringsgjennomsnittlige posisjons-NEES mot det tosidige kjikvadratbåndet på { "95" }%). Valgfritt ved siden av de publiserte midtbreddegradstallene fra Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min for multi-GNSS forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. MODELLED: en konsistenssammenligning av trenden, ikke en gjengivelse av den studiens konstellasjoner, støy eller stasjoner; ingen flertydighetsløsning, syklushopp, fase-wind-up, tidevann eller tidskorrelerte produktfeil.

seg-8126f4edf6b6 = Én kjøring av <c1/> oppsummeres slik: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Eksemplet <c1/> setter blant annet:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Resultatetikett (motorens): MODELLED flytende PPP (ionosfærefri kode og fase, hvit klokke, random-walk fuktforsinkelse, flytende flertydigheter per bue) på simulerte målinger fra den samme modellen; tallene fra Li et al. ({ "2019" }) er en sammenligning av trend, ikke en gjengivelse

seg-225ef04c64af = Diagrammet motoren skriver for scenarios/leo-ppp-convergence.toml, typen leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Et flytende utvidet Kalman-filter for PPP på ionosfærefri kode og fase: statiske koordinater, en hvit mottakerklokke, én intersystembias per ekstra system, en random-walk zenitfuktforsinkelse avbildet med 1/sin(elevasjon), en flytende flertydighet per satell Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Et flytende utvidet Kalman-filter for PPP på ionosfærefri kode og fase: statiske koordinater, en hvit mottakerklokke, én intersystembias per ekstra system, en rand. Uavhengig referanse (ExternalDataset): NEES-kjikvadrattesten er en intern konsistenskontroll (sannhet og filter deler modellen). Trenden sammenlignes med Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. Det medfølgende scenarioet gir { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med i

seg-302365809dbf = MODELLED flytende PPP (ionosfærefri kode og fase, hvit klokke, random-walk fuktforsinkelse, flytende flertydigheter per bue) på simulerte målinger fra den samme modellen; tallene fra Li et al. ({ "2019" }) er en sammenligning av trend, ikke en gjengivelse (resultat <c1/>)

seg-6ce77bce8946 = MODELLED: en konsistenssammenligning av trenden, ikke en gjengivelse av den studiens konstellasjoner, støy eller stasjoner; ingen flertydighetsløsning, syklushopp, fase-wind-up, tidevann eller tidskorrelerte produktfeil. (typekatalog (<c1/>))

seg-ba2fd25fdcff = De fire LEO-konstellasjonene her er representative Walker delta-skall på { "1000" } km og { "60" } grader med { "60" }, { "96" }, { "192" } og { "288" } satellitter; de er IKKE artikkelens utforminger, og støyen, stasjonene og konvergensdefinisjonen (horisontale og vertikale feil under { "10" } cm til kjøringens slutt) er denne modellens. Sammenligningen er derfor en MODELLED konsistenskontroll av trenden: konvergensen må avta monotont med t (kommentar i scenariofilen, linjene { "10" } til { "14" })

seg-b641b835570c = Konvergens for presis punktposisjonering med kun GNSS og med LEO-støtte er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Forrige</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Neste</s1>leo-pvt
