# docs--kind-campaign: translations (da)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Kilde: <c1/>

seg-24ce6aee5e53 = <c1/> (scenarietype)

seg-931a3d27c0f0 = Scenarietype i motoren v{ $version }, familie <a1>Kampagner</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-a07990e776cb = Kampagne: eksisterende scenarietyper sammensat til én kørsel, hvor hvert tal er læst fra en rigtig kørsel af den navngivne type. Fire sektioner, i enhver kombination. PHASES: en kædet mission på én fælles tidslinje -- hver fase kører ét eller flere scenarier (for eksempel jamming, så spoofing, så et ur i holdover med et inertinavigationssystem, der glider ved siden af, så en integritetsalarm, så genopretning), deres output læses ind i navngivne kanaler (urets tidsfejl mod dets grænse, forholdet mellem bærebølge og støjtæthed mod sporingsgulvet, beskyttelsesniveau mod alarmgrænsen, positionsfejl, satellitter der spores, alarmflag) af en forudindstilling pr. type eller af eksplicitte resultatstier og gensamples på et fælles gitter med zero-order hold, med fasegrænser og hændelser; tilstand videregives ved carry (en kanal fortsætter fra forrige fases slutværdi), handoff (et tal fra en forrige fase skrevet ind i denne fases scenarie) og end_at (en fase slutter på et tidspunkt, som en kørsel har beregnet, for eksempel en spoofing-monitors detektionstidspunkt). SWEEP: et gitter over en til tre punktsepararede scenarienøgler af en vilkårlig type (et heltalssegment indekserer en array af tabeller, som i system.2.sisre_m), med målinger læst ved resultatsti og, med flere end én kørsel, et seedet Monte Carlo-ensemble i hver knude. MONTE_CARLO: realisation k kører ved base_seed + k; hver måling rapporterer middelværdi, standardafvigelse, nearest-rank 5.-/50.-/95.-percentiler og et bootstrap-konfidensinterval på { "95" } % for middelværdien med fast seed. COMPOSE: flere scenarier under fælles værdier (én jammers effekt og position skrevet ind i en maritim og en vejmodtager), med en samlet bedste/værste oversigt. Resultatet bærer en kampagne-hash, en digest over hvert medlemsresultat og en enhedsangivelse for hvert udsendt tal; interoperabilitetseksporterne skriver hvert medlemsscenarie, der har geometri, som sit eget filsæt. Sammensætningsidentiteter afprøves: en etfaset kampagne gengiver den selvstændige kørsel bit for bit, et ensemble med fast seed er bytestabilt, og på et ur med hvid frekvensstøj falder ensemblets middelværdi inden for det rapporterede interval, hvor spredningen stemmer med sqrt(q_wf * tau). MODELLED: den additive carry og zero-order hold er modelvalg, og hver fase bærer mærkaten for den type, der kørte den.

seg-05e842f80dbb = Én kørsel af <c1/> opsummeres som: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep af <c2/>: { "13" } knuder over [jammer_power] | { "13" } medlemskørsler (MODELLED)

seg-bf339fa14645 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Eksemplet <c1/> angiver blandt andet:

seg-c4f955d5f506 = tilgængelighed

seg-7bcf77278958 = { "22" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Resultatmærkat (motorens egen): MODELLED sammensætning af eksisterende scenarietyper. Hvert tal er læst fra en rigtig kørsel af den navngivne type; kædningen (additiv carry af en kanal over en fasegrænse, zero-order hold på tidslinjens gitter, en fase afsluttet på et beregnet tidspunkt) er et modelvalg, og hver fase bærer mærkaten

seg-b2c7cd1f9712 = Diagrammet, som motoren skriver for scenarios/campaign-sweep-jammer-power.toml, type campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect og kampagnekøreren: en valgfri [monitors]-tabel kører IQ-monitorerne på hver celle i kørerens enkelte gennemløb. Tests: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) og iq::campaign::report::rocs: hver celle i en kampagne med monitorer beholder, pr. alarmtype og kanal, maksimum af monitorens egen teststørrelse over hvert angivet hændelsesvindue (positiv) og over t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) og <c1/> på <c2/>, Python <c3/> og MCP-værktøjet labfit (kun kampagnemapper inde i dets arbejdsmappe): læser en <c4/>-outputmappe efter dens Tests: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Fasene i typen <c1/>: hver fase kører ét eller flere scenarier af eksisterende typer gennem run_toml, læser deres output ind i navngivne kanaler (urets tidsfejl og grænse, middel af effektivt forhold mellem bærebølge og støjtæthed og sporingsgulv, v Tests: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = og { "4" } flere i matrixen.

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-linkbudget, anti-jam-C/N₀, tab af lås pr. satellit. Uafhængig reference (InternalConsistency): Linkbudgetligningen for anti-jam-C/N₀ krydskontrolleret mod en uafhængig numpy-udledning påny (deler den samme lukkede form → InternalConsistency) plus en karakterisering af C/N₀-forringelse fra reelle JammerTest-2024-data. { "0.30" } runde { "2" }, blokeret (forbliver MODELLED): det målte fald i C/N0 fra JammerTest { "2024" } mod en linkbudgetforudsigelse (præregistreret 6a66994b, inden for { "3" } dB) blev ikke kørt, fordi F8.1-antennens position og pegning ved

seg-59afd80736c5 = <b>PARTNER</b> Ikke leveret — Kshana modellerer signalydelse, ikke nyttelast- eller antennehardware. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-fa3ad6babe54 = <b>MODELLED</b> Typen <c1/>s sweep (en til tre punktsepararede nøgler af en vilkårlig type, på det generiske sweeps akseværdier, eventuelt et ensemble i hver knude) og monte_carlo-sek. Uafhængig reference (InternalConsistency): Den lukkede form for fasens random walk under hvid frekvensstøj, varians q_wf tau (NIST Technical Note { "1337" }), for statistikmaskineriet, og byte-lighed med de selvstændige kørsler for seedningen. Det kontrollerer ensemblets aritmetik på motorens egen urmodel, ikke et eksternt datasæt

seg-c15b5ac32282 = MODELLED sammensætning af eksisterende scenarietyper. Hvert tal er læst fra en rigtig kørsel af den navngivne type; kædningen (additiv carry af en kanal over en fasegrænse, zero-order hold på tidslinjens gitter, en fase afsluttet på et beregnet tidspunkt) er et modelvalg, og hver fase bærer mærkaten for den type, der frembragte den. (resultat <c1/>)

seg-9e33dcc39c27 = MODELLED: den additive carry og zero-order hold er modelvalg, og hver fase bærer mærkaten for den type, der kørte den. (typekatalog (<c1/>))

seg-adcc6ea59840 = MODELLED: som typen <c1/> er. (kommentar i scenariefilen, linje { "14" })

seg-143f3f1cc521 = Modstandsdygtighed over for jamming i GNSS-nægtede miljøer er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Parametersweeps og seedede Monte Carlo-ensembler over enhver scenarietype er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Familieside: <a1>Kampagner</a1>

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Emneside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Forrige</s1>body-pnt

seg-fadd92303a4d = <s1>Næste</s1>cislunar-arc-recovery
