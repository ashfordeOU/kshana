# docs--kinds-campaigns: translations (da)

seg-b03d56f501c3 = Type

seg-a07990e776cb = Kampagne: eksisterende scenarietyper sammensat til én kørsel, hvor hvert tal er læst fra en rigtig kørsel af den navngivne type. Fire sektioner, i enhver kombination. PHASES: en kædet mission på én fælles tidslinje -- hver fase kører ét eller flere scenarier (for eksempel jamming, så spoofing, så et ur i holdover med et inertinavigationssystem, der glider ved siden af, så en integritetsalarm, så genopretning), deres output læses ind i navngivne kanaler (urets tidsfejl mod dets grænse, forholdet mellem bærebølge og støjtæthed mod sporingsgulvet, beskyttelsesniveau mod alarmgrænsen, positionsfejl, satellitter der spores, alarmflag) af en forudindstilling pr. type eller af eksplicitte resultatstier og gensamples på et fælles gitter med zero-order hold, med fasegrænser og hændelser; tilstand videregives ved carry (en kanal fortsætter fra forrige fases slutværdi), handoff (et tal fra en forrige fase skrevet ind i denne fases scenarie) og end_at (en fase slutter på et tidspunkt, som en kørsel har beregnet, for eksempel en spoofing-monitors detektionstidspunkt). SWEEP: et gitter over en til tre punktsepararede scenarienøgler af en vilkårlig type (et heltalssegment indekserer en array af tabeller, som i system.2.sisre_m), med målinger læst ved resultatsti og, med flere end én kørsel, et seedet Monte Carlo-ensemble i hver knude. MONTE_CARLO: realisation k kører ved base_seed + k; hver måling rapporterer middelværdi, standardafvigelse, nearest-rank 5.-/50.-/95.-percentiler og et bootstrap-konfidensinterval på { "95" } % for middelværdien med fast seed. COMPOSE: flere scenarier under fælles værdier (én jammers effekt og position skrevet ind i en maritim og en vejmodtager), med en samlet bedste/værste oversigt. Resultatet bærer en kampagne-hash, en digest over hvert medlemsresultat og en enhedsangivelse for hvert udsendt tal; interoperabilitetseksporterne skriver hvert medlemsscenarie, der har geometri, som sit eget filsæt. Sammensætningsidentiteter afprøves: en etfaset kampagne gengiver den selvstændige kørsel bit for bit, et ensemble med fast seed er bytestabilt, og på et ur med hvid frekvensstøj falder ensemblets middelværdi inden for det rapporterede interval, hvor spredningen stemmer med sqrt(q_wf * tau). MODELLED: den additive carry og zero-order hold er modelvalg, og hver fase bærer mærkaten for den type, der kørte den.

seg-b2c7cd1f9712 = Diagrammet, som motoren skriver for scenarios/campaign-sweep-jammer-power.toml, type campaign

seg-ea93f81fa08b = Kilde: <c1/>

seg-7f8e8af56bc0 = Kampagner (scenarietypefamilie)

seg-c8012ee549ea = { "1" } scenarietype i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-09ed7c4e175c = Emnesider: <a1>CAMPAIGNS</a1>. Kør én: <c1/>. Alle familier: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Kampagner

seg-4e31c8daf798 = Register

seg-b2016159c9d0 = Kampagne: eksisterende scenarietyper sammensat til én kørsel, hvor hvert tal er læst fra en reel kørsel af den nævnte type.

seg-25148644a262 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Forrige</s1>Adfærdskodeks

seg-cdf23ced49bd = <s1>Næste</s1>Ure tidssynkronisering og holdover
