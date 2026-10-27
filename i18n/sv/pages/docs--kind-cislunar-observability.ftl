# docs--kind-cislunar-observability: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-6d584e86deba = kvot (dimensionslös)

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-258f128cea60 = Källa: <c1/>

seg-f0c7758e472f = <c1/> (scenariotyp)

seg-7ccd0a3babb8 = MODELLED observerbarhet för en plan cislunar konstellation (P6): spårar en differentialkorrigerad plan DRO-konstellation med fyra rymdfarkoster med avståndsmätning mellan satelliter och redovisar hur mycket av en rymdfarkosts fyratillstånd [x,y,ẋ,ẏ] som bågen gör observerbart. Ger ({ "1" }) tabellen rang mot båglängd för en enda länk med enbart avstånd — ögonblickligen rang 1, växande mot hela fyratillståndet när bågen förlängs (P6 tabell { "1" }); ({ "2" }) Gramians egenvärdesspektrum + konditionstal över bågen; ({ "3" }) jämförelsen av ögonblicklig rang för enbart avstånd mot avstånd+avståndshastighet (Doppler som utformningsspak) plus redovisningen av GDOP som är singulär för enbart avstånd / definierad för avstånd+hastighet; och ({ "4" }) en oberoende SRIF-korsvalidering vars posteriora kovarians blir ändlig / välkonditionerad exakt vid den båge där den observerbara rangen når fyra. VALIDATED kärna: den observerbara rangen är en rangavslöjande tröskel för singulärvärden korskontrollerad mot Gramians egenrang; egenvärdesspektrumet följer de spektrala invarianterna (spår=Σλ, det=Πλ, Frobenius²=Σλ²); den variationella STM är den med finita differenser validerade CR3BP-STM; raderna för jakobianen av avstånd/avståndshastighet är analytiska partialer validerade med finita differenser (korskontrollerade mot cratens 3-D-observabel för avståndshastighet); de fyra begynnelsevillkoren är differentialkorrigerade plana DRO:er som sluter till en snäv periodicitetsresidual och är retrograda; rangövergången är korsvaliderad mot cratens kvadratrotsinformationsfilter (posteriorkovariansen ändlig exakt vid full rang, cond(P)=cond(OᵀO)); en rangdefekt ögonblicksbild flaggas GDOP-odefinierad (fim condition=inf), aldrig ett falskt ändligt värde — samma skydd mot singulär geometri som pvt::solve_spp tillämpar. MODELLED: konstellationsutformningen (DRO-perilunamplituder och faser) och den specifika rangprogression den ger. Inte en certifierad produkt för navigeringsprestanda.

seg-a59f2fa9efb9 = En körning av <c1/> sammanfattas som: cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h båge, { "24" } epoker | rang { "1" } → { "4" } av { "4" } över bågen | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | ögonblicklig rang enbart avstånd { "2" } → avstånd+hastighet { "4" } ({ "3" } länkar) | GDOP enbart avstånd odefinierad avstånd+hastighet { "6.353" } | DRO-begynnelsevillkor (största periodicitetsresidual { "4.7e-9" }) | SRIF-posterior ändlig vid rang-4-epok { "8" } (Validated rang/STM/DRO-slutning/SRIF, Modelled utformning)

seg-fb1601eda130 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Exemplet <c1/> anger bland annat:

seg-0cc8ab10786b = tidsenheter i roterande system

seg-84781b6fff48 = GDOP odefinierad (rangdefekt / singulär

seg-856eb311f24b = “odefinierad” (text som dokumentet anger

seg-1767b216650d = definierad

seg-fc5d34345fdd = Resultatetikett (motorns): MODELLED observerbarhet för en plan cislunar konstellation (P6). VALIDATED kärna: den observerbara RANGEN är en rangavslöjande tröskel för singulärvärden korskontrollerad mot Gramians egenrang; Gramians egenvärdesspektrum följer de spektrala invarianterna (spår = summa eig, det = produkt eig, Frobenius^{ "2" } = summa eig^{ "2" }

seg-f15bbf30b0dd = Diagrammet som motorn skriver för scenarios/cislunar-observability.toml, typ cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Observerbarhetströskeln för cislunar båglängd i det RUMSLIGA sextillstånds-CR3BP i stället för det plana fyratillståndet, över familjerna DRO, L2 halo och L2 near-rectilinear halo, med mätbrus som går in i Gramian och TVÅ kriterier som redovisas

seg-9f857ff85800 = <b>MODELLED</b> Observerbarhetströskeln för cislunar båglängd i det RUMSLIGA sextillstånds-CR3BP i stället för det plana fyratillståndet, över familjerna DRO, L2 halo och L2 near-rectilinear ha. Oberoende referens (InternalConsistency): En oberoende radtrappstegsrang med Gauss-elimination och partiell pivotering bekräftar varje rangutslag för sextillståndet — en annan algoritm som inte delar kod med egenvärdes-/SVD-vägen som testas. Tillståndsövergångsmatrisen { "6" }×{ "6" } för CR3BP som den här sätter ihop har sin egen ReferenceImpl-referens mot variationsintegrering i SciPy, och begynnelsevillkoren för halo/NRHO kommer från en korrigerare som reproducerar det publicerade södra L2

seg-53c183035bde = MODELLED observerbarhet för en plan cislunar konstellation (P6). VALIDATED kärna: den observerbara RANGEN är en rangavslöjande tröskel för singulärvärden korskontrollerad mot Gramians egenrang; Gramians egenvärdesspektrum följer de spektrala invarianterna (spår = summa eig, det = produkt eig, Frobenius^{ "2" } = summa eig^{ "2" }); den variationella STM är den med finita differenser validerade CR3BP-STM (crate::cr3bp); jakobianraderna för avstånd / avståndshastighet (resultat <c1/>)

seg-f6a217f57bec = MODELLED observerbarhet för en plan cislunar konstellation (P6): spårar en differentialkorrigerad plan DRO-konstellation med fyra rymdfarkoster med avståndsmätning mellan satelliter och redovisar hur mycket av en rymdfarkosts fyratillstånd [x,y,ẋ,ẏ] som bågen gör observerbart. (typkatalog (<c1/>))

seg-e5182743fd40 = MODELLED: konstellationsutformningen (DRO-perilunamplituder och faser) och den specifika rangprogression den ger. (typkatalog (<c1/>))

seg-5d3a370f1295 = Ärlighet: MODELLED. VALIDATED kärna -- den observerbara RANGEN är en rangavslöjande tröskel för singulärvärden korskontrollerad mot Gramians egenrang; egenvärdesspektrumet följer de spektrala invarianterna (spår = summa eig, det = produkt eig, Frobenius^{ "2" } = summa eig^{ "2" }); den variationella STM är den med finita differenser validerade CR3BP-STM; jakobianraderna för avstånd / avståndshastighet är analytiska partialer validerade med finita differenser (korsk (kommentar i scenariofilen, rad { "16" } till { "25" })

seg-c68bc1df8975 = Rumslig, brusig cislunar båglängdsobserverbarhet för flera familjer är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Föregående</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Nästa</s1>clock
