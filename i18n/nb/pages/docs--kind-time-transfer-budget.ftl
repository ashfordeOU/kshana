# docs--kind-time-transfer-budget: translations (nb)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-937ebbbd612c = Kilde: <c1/>

seg-6af6f07f5f5a = <c1/> (scenariotype)

seg-9a2bb9809aed = Toveis satellittbasert tid- og frekvensoverføring mellom to stasjoner via et geostasjonært relé: toveisligningen løst for T_A - T_B med hvert ikke-resiprokt ledd (stasjonsutstyrets forsinkelser, ionosfære i Ku-bånd, transponder, Sagnac), et usikkerhetsbudsjett i kvadratsum der type A-leddet er den simulerte lenkens TDEV ved midlingstiden, en simulert lenke med hvit og flicker-fasestøy og en døgnlig ikke-resiprositet, og stabiliteten (rate, residual-RMS, TDEV, ADEV) til enhver oppgitt serie fra BIPM Circular T, seksjon { "1" }, MJD,ns-CSV eller IGS RINEX-stasjonsklokkeposter. MODELLED.

seg-a4f8e9a09026 = Én kjøring av <c1/> gir denne oppsummeringen: time-transfer-budget: europe - north-america offset { "12.500" } ns (Sagnac { "204.365" } ns, ionosphere { "0.0213" } ns); combined u { "1.087" } ns (type A { "0.031" } ns at { "86400" } s); { "0" } real series (MODELLED)

seg-0353d795ebdf = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-fe3afa366df2 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-00026a1d3760 = Eksemplet <c1/> setter blant annet:

seg-2409cc9397c7 = Resultatetikett (motorens egen): MODELLED — TWSTFT-toveisligning (stasjonsforsinkelser, ionosfære i Ku-bånd, transponder, Sagnac) løst ut fra oppgitte forsinkelser, et usikkerhetsbudsjett i kvadratsum med den simulerte lenkens TDEV som type A-ledd, en simulert lenke med flicker-fasestøy og døgnlig ikke-resiprositet, og stabiliteten til enhver r

seg-92d3c84024d7 = Diagrammet motoren skriver for scenarios/time-transfer-budget.toml, type time-transfer-budget

seg-83b9c66b9e92 = <b>MODELLED</b> TWSTFT-toveisligningen løst for T_A - T_B med stasjonenes sende- og mottaksforsinkelser, den ionosfæriske opp/ned-asymmetrien i Ku-bånd, transponderens forsinkelsesforskjell og Sagnac-leddene, mot sin eksakte forovermodell; et usikkerhetsbudsjett i kvadr

seg-58cf4086c7a5 = <b>MODELLED</b> TWSTFT-toveisligningen løst for T_A - T_B med stasjonenes sende- og mottaksforsinkelser, den ionosfæriske opp/ned-asymmetrien i Ku-bånd, transponderens forsinkelsesforskjell. Uavhengig referanse (InternalConsistency): Intern konsistens: forovermodellen og den løste ligningen stemmer overens til { "1e-15" } s, Sagnac-leddet er lik modulens uavhengige sløyfeform BIPM 2A omega/c^{ "2" }, det ionosfæriske leddet er { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, og støyprosessene viser de forventede TDEV-formene. HVA DET IKKE ER: ingen reell TWSTFT-måling eller kalibreringsrapport er sammenlignet; de oppgitte forsinkelsene og usikkerhetene er inndata, ikke målt; t

seg-15de1cdaa684 = MODELLED — TWSTFT-toveisligning (stasjonsforsinkelser, ionosfære i Ku-bånd, transponder, Sagnac) løst ut fra oppgitte forsinkelser, et usikkerhetsbudsjett i kvadratsum med den simulerte lenkens TDEV som type A-ledd, en simulert lenke med flicker-fasestøy og døgnlig ikke-resiprositet, og stabiliteten til enhver reell UTC-UTC(k)- eller stasjonsklokkeserie som oppgis; ikke sammenlignet med en reell TWSTFT-lenke (resultat <c1/>)

seg-70448ca49780 = Toveis satellittbasert tid- og frekvensoverføring (TWSTFT) mellom to ILLUSTRATIVE stasjoner, én i Sentral-Europa og én i det østlige Nord-Amerika, via et geostasjonært relé ved { "10" } grader vest. Kjøringen løser toveisligningen for T_A - T_B ut fra de oppgitte leddene for utstyr, transponder, ionosfære (Ku-bånd, 14/11 GHz) og Sagnac. Den danner et usikkerhetsbudsjett der det statistiske leddet er TDEV, ved én dag, av en simula (kommentar i scenariofilen, linje { "1" } til { "8" })

seg-4b0d23aed0ab = TWSTFT-toveisligningen, usikkerhetsbudsjettet og lenkestabiliteten med flicker og døgnlig ikke-resiprositet er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet — fanger opp transkripsjons- og koeffisientfeil, men er ikke en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-52e06909ccc5 = <s1>Forrige</s1>terrain-slam

seg-a22fa1c51042 = <s1>Neste</s1>timetransfer
