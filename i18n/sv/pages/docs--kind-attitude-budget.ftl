# docs--kind-attitude-budget: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-40ca4197150b = Källa: <c1/>

seg-a271f371a3cf = <c1/> (scenariotyp)

seg-62c0dda9fc56 = Attityd- och pekfelsbudget i 3 frihetsgrader: det värsta fallets gravitationsgradientstörande vridmoment ((3/2)(μ/R³)ΔI) och en pekfelsbudget som kvadratisk summa över namngivna 1σ-bidrag (sensorbrus, reaktionshjulsjitter, termiskt, uppriktning) med den dominerande termen, för en banhöjd + spridning i kroppens tröghet. MODELLED skalär AOCS-budget — ett komplement före hårdvaran till Basilisk/42, inte en simulering av reglerslinga, 6 frihetsgrader eller flexibla moder.

seg-9fdc45a8aaa3 = En körning av <c1/> sammanfattas som: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG-vridmoment { "7.04e-5" } N·m; pekning { "10.7" }" RSS (dominerande: reaction_wheel_jitter) (MODELLED skalär budget)

seg-7cf112b1bcc3 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Exemplet <c1/> anger bland annat:

seg-c33e3cbba749 = bågsekunder

seg-36df1bc710ab = uppriktning

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Resultatetikett (motorns): MODELLED — skalär AOCS-felbudget i 3 frihetsgrader: det värsta fallets gravitationsgradientstörande vridmoment + RSS-pekbudget; INTE en simulering av reglerslinga / 6 frihetsgrader / flexibla moder (ett komplement före hårdvaran till Basilisk/42, inte en ersättning)

seg-ad0e72e3b688 = Diagrammet som motorn skriver för scenarios/attitude-budget.toml, typ attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Det värsta fallets gravitationsgradientstörande vridmoment ((3/2)(μ/R³)ΔI) som toppvärdet över attityd (det validerade påståendet), plus en RSS-pekfelsbudget över namngivna 1σ-bidrag med den dominerande termen (en kvadratisk summa av tal som anroparen ger Tester: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Det värsta fallets gravitationsgradientstörande vridmoment ((3/2)(μ/R³)ΔI) som toppvärdet över attityd (det validerade påståendet), plus en RSS-pekfelsbudget över namngivna 1σ . Oberoende referens (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en oberoende C++-implementering av gravitationsgradientmomentet med full tensor: Kshanas topp (3/2)(μ/R³)ΔI är lika med Basilisks vridmoment vid attityden { "45" } deg inom { "1e-12" } relativt (sämst { "2.1e-15" }) över { "5" } höjder och { "8" } tröghetstensorer, och begränsar Basilisks vridmoment över { "2000" } slumpmässiga attityder per fall; toleransen fastställd före jämförelsen. Validerat påstående: gravity-

seg-d2a6cf813e95 = <b>PARTNER</b> Tillhandahålls inte — Kshana är en simulator för navigeringsprestanda, inte ett satellitbusföretag. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-3895121a5466 = MODELLED — skalär AOCS-felbudget i 3 frihetsgrader: det värsta fallets gravitationsgradientstörande vridmoment + RSS-pekbudget; INTE en simulering av reglerslinga / 6 frihetsgrader / flexibla moder (ett komplement före hårdvaran till Basilisk/42, inte en ersättning) (resultat <c1/>)

seg-f62458cae23b = MODELLED skalär AOCS-budget — ett komplement före hårdvaran till Basilisk/42, inte en simulering av reglerslinga / 6 frihetsgrader / flexibla moder. (typkatalog (<c1/>))

seg-333fca11ac0c = ÄRLIG AVGRÄNSNING: MODELLED skalär felbudget -- ett komplement före hårdvaran till Basilisk/42, INTE en simulering av reglerslinga / 6 frihetsgrader / flexibla moder. Gravitationsgradienttermen redovisas som ett vridmoment (att översätta den till pekning kräver en reglerstyvhet som anroparen äger); budgeten är den kvadratiska summan av de givna 1-sigma-bidragen. Kör: kshana scenarios/attitude-budget.toml (kommentar i scenariofilen, rad { "8" } till { "13" })

seg-0e27fcef1499 = <s1>Föregående</s1>ascent-losses

seg-946c453cbf0f = <s1>Nästa</s1>body-pnt
