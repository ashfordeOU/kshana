# docs--kind-ins-trn-coast: translations (nb)

seg-bf51947657c0 = navigasjon

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-c4ed27a559df = Temaside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-f7305f3a0b5a = Kilde: <c1/>

seg-92b90cb4a839 = <c1/> (scenariotype)

seg-5b9a6efe6337 = Feilmodell for INS/TRN-glidning: posisjonsfeil mot glidningsvarighet, bygd fra IMU-koeffisienter i stedet for å sveipe en antatt driftrate. Fem vekstbidrag — akselerometerbias, gyrobias-tilt gjennom tyngdekraften, velocity random walk, angle random walk og skalafaktor mot tilbakelagt distanse — hvert propagert gjennom en lokal-nivå treghetsfeilmodell med ni tilstander og Schuler-tilbakekobling ved en oppgitt breddegrad og høyde (de ledende lovene for kort glidning t², t³, t^{ "1.5" }, t^{ "2.5" } og t¹/t² rapporteres ved siden av) og kombinert etter en OPPGITT regel (kvadratroten av kvadratsummen som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hver kjøring slik at valget er synlig i stedet for skjult). Glidningsvarighetene som når posisjonsterskler levert av kalleren ({ "10" } m og { "50" } m som standard) finnes med motorens eksisterende halvering, hver med en oppdeling per bidrag som navngir den dominerende kilden, og krysningen for hvert enkelt bidrag inverteres i tillegg algebraisk slik at de to stemmer overens. En modus med terrengrelativ navigasjon (TRN) begrenser glidningen med periodiske posisjonsbestemmelser og rapporterer det største intervallet mellom dem som holder hver terskel; en posisjonsbestemmelse kun for posisjon lar hastighetsfeil og tilt leve videre over posisjonsbestemmelsen, så den begrenser ikke alltid glidningen ved noen rate, og rapporten sier det i stedet for å returnere null. MODELLED: IMU-klassens koeffisienter er representative båndverdier, ikke et datablad, og restfeilen i terrengposisjonsbestemmelsen er en inndata. En terskel som ikke nås, rapporteres som null med en status, aldri som en nullverdi. Ikke et sertifisert ytelsesprodukt for treghetsnavigasjon.

seg-bbd497aa3ba6 = Én kjøring av <c1/> oppsummeres slik: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Eksemplet <c1/> setter blant annet:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Resultatetikett (motorens): MODELLED feilbudsjett for INS/TRN-glidning. Hvert bidrag propageres gjennom en lokal-nivå treghetsfeilmodell med ni tilstander og Schuler-tilbakekobling (nivåplattform med kurs nord ved et oppgitt sted, fritt treghetsbasert inkludert den ustabile vertikalkanalen); dens ledende lover for kort glidning (bias t^{ "2" }, gy

seg-134a4c91da3a = Diagrammet motoren skriver for scenarios/ins-trn-coast.toml, typen ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Budsjett for posisjonsfeil mot glidningsvarighet bygd fra IMU-koeffisienter, hver feilkilde (akselerometerbias, gyrobias, velocity random walk, angle random walk, skalafaktor under cruise og under vedvarende spesifikk kraft) propagert gjennom en n

seg-d69247df315f = <b>VALIDATED</b> Budsjett for posisjonsfeil mot glidningsvarighet bygd fra IMU-koeffisienter, hver feilkilde (akselerometerbias, gyrobias, velocity random walk, angle random walk, . Uavhengig referanse (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), kjørt som et separat program under GNU Octave { "8.4.0" }: frie treghetsglidningskjøringer med den samme IMU-feilprofilen, med én rettet numerisk dødsone i kvaternionoppdateringen (qua_update.m: vernet for en rate under { "1e-8" } rad/s erstattet av wnorm == { "0" }, brukt på en kjøretidskopi og påstått å stemme én gang; med vernet på plass frøs en sakte drivende plattformholdning og kuttet

seg-498cb2f96fa7 = MODELLED feilbudsjett for INS/TRN-glidning. Hvert bidrag propageres gjennom en lokal-nivå treghetsfeilmodell med ni tilstander og Schuler-tilbakekobling (nivåplattform med kurs nord ved et oppgitt sted, fritt treghetsbasert inkludert den ustabile vertikalkanalen); dens ledende lover for kort glidning (bias t^{ "2" }, gyrobias-tilt t^{ "3" }, velocity random walk t^{ "1.5" }, angle random walk t^{ "2.5" }, skalafaktor x tilbakelagt distanse) er krysskontrollert (resultat <c1/>)

seg-63c221a546f7 = Feilmodell for INS/TRN-glidning: posisjonsfeil mot glidningsvarighet, bygd fra IMU-koeffisienter i stedet for å sveipe en antatt driftrate. (typekatalog (<c1/>))

seg-164504645f4a = MODELLED: IMU-klassens koeffisienter er representative båndverdier, ikke et datablad, og restfeilen i terrengposisjonsbestemmelsen er en inndata. (typekatalog (<c1/>))

seg-ee0281a1f401 = Spørsmålet dette besvarer: når en GNSS-studie (eller en studie med apertur-driftssyklus) sier «anta en dødregningsdrift på { "0.001" }–{ "0.050" } m/s», hvor kommer det tallet fra? Det kommer fra IMU-en, og dette scenarioet beregner det i stedet for å sveipe det. Fem vekstledd — akselerometerbias (t^{ "2" }), gyrobias-tilt gjennom tyngdekraften (t^{ "3" }), velocity random walk (t^{ "1.5" }), angle random walk (t^{ "2.5" }) og skalafaktor ganger tilbakelagt dist (kommentar i scenariofilen, linjene { "4" } til { "11" })

seg-32d4adcfe249 = <s1>Forrige</s1>inertial

seg-47366ab55be3 = <s1>Neste</s1>integrity
