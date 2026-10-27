# docs--kind-earth-gnss-lunar: translations (sv)

seg-37d29d8303fe = km

seg-b054c73f22e5 = inget värde

seg-59afd80736c5 = <b>PARTNER</b> Tillhandahålls inte — Kshana modellerar signalprestanda, inte nyttolast- eller antennhårdvara. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-9a399fed06c4 = Källa: <c1/>

seg-886b3796afaa = <c1/> (scenario kind)

seg-c8a8be4b8894 = Mottagning av jord-GNSS på månavstånd, det svagsignalslager som conflict-resilience-artikeln nämner och som motorn saknade modell för. En GNSS-satellit riktar sin antenn mot jorden; en mottagare nära månen befinner sig ungefär femton gånger omloppsradien bort, så tre saker slår till samtidigt. Jorden SKYMMER ANTENNENS HUVUDRIKTNING: från { "26,560" } km upptar den en halvvinkel på { "13.9" } deg, så varje stråle mot månen måste lämna sändaren minst så långt från nadir, vilket tar bort strålens topp innan någon effekt beräknas. Det som återstår är HUVUDLOBENS KANT OCH SIDOLOBERNA, det regim som LuGRE-nyttolasten faktiskt arbetade i under { "2025" }. Och fritt-rum-förlusten är cirka { "208" } dB vid L1, ungefär { "25" } dB mer än en markanvändare betalar. Rapporten ger en rad per satellit (vinkel från antennens huvudriktning, jordskymning, avstånd, vägförlust, sändningsförstärkning vid den vinkeln, mottagen effekt, bärvåg-till-brustäthet) och aggregerar bara de länkar som klarar spårningströskeln. DEN REDOVISAR OCKSÅ KONDITIONERINGEN, eftersom det är den som definierar detta lager: varje synlig satellit ligger inom en kon som är ett par grader bred sett från månen, så siktlinjerna är nästan parallella, DOP (dilution of precision) är enorm, och en jord-GNSS-positionsbestämning på månavstånd är en observation av TIDSSYNKRONISERINGSKLASS betydligt mer än av positionsklass. MODELLED, och sändningsdiagrammet är orsaken: förstärkningen vid vinkel är en likformig cirkulär apertur (Airy), medan en verklig GPS L1-antenn är en spiralantennsgrupp med tolv element, med en formad huvudlob och icke-Airy-sidolober. Uppmätta diagram finns och ingår inte här, så ordningsföljder och storleksordningar är meningsfulla medan dB för en enskild satellit inte är det. Medvetet FRÅNVARANDE, och var och en gör budgeten optimistisk: ingen jonosfärisk eller troposfärisk förlust på de strålar som tangerar limben, ingen polarisations-, pekningsförlust eller implementeringsförlust, och en sfärisk jord utan refraktiv utvidgning. Månens position är en INDATA (avstånd plus tröghetsriktning) snarare än ett efemeridsuppslag, eftersom det som testas är länken och strålgeometrin. Att uppgradera denna rad till Validated kräver ett uppmätt sändningsdiagram och LuGRE-normalpunkter; inget av dem finns i arkivet och inget av dem är påhittat här.

seg-75b6814c0091 = En körning av <c1/> sammanfattas som: Earth-GNSS at lunar distance — { "24" } satelliter, mottagare på { "384400" } km Jordens limb sedd från konstellationen: { "13.90" } deg från nadir — varje stråle mot månen måste överskrida detta { "22" } av { "24" } inte skymda; { "0" } klarar spårningströskeln på { "25.0" } dB-Hz ingen länk når tröskeln färre än två spårbara länkar; ingen vinkelspridning att redovisa färre än fyra spårbara länkar, eller en singulär geometri: ingen DOP SWEEP över { "64" } epoker / { "43082" } s: signaltillgänglighet { "0.375" }, FIX-tillgänglighet { "0.000" } spårbara länkar medel { "0.75" }, max { "2" }; bästa C/N0 { "30.93" } dB-Hz; bästa PDOP ingen Ta FIX-tillgängligheten som detta lagers förhandsvärde, inte signaltillgängligheten: en länk är en klockobservation, fyra är en position. MODELLED: sändningsförstärkningen är en ersättning med likformig apertur (Airy), inte en uppmätt GPS-stråle, och ingen atmosfärs-, polarisations- eller implementeringsförlust tillämpas — så budgeten här är optimistisk. Storleksordningar och ordningsföljder är meningsfulla; dB för en enskild satellit är det inte.

seg-6c0897da2efa = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Exemplet <c1/> anger bland annat:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Diagrammet som motorn skriver för scenarios/earth-gnss-lunar.toml, kind earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Mottagning av jord-GNSS på månavstånd: det svagsignalslager som P7 Table { "1" } nämner och som motorn saknade modell för.

seg-9531f6b14fc8 = <b>MODELLED</b> Mottagning av jord-GNSS på månavstånd: det svagsignalslager som P7 Table { "1" } nämner och som motorn saknade modell för. Per satellit och epok beräknar den off-. Oracle (InternalConsistency): Slutna identiteter och intern konsistens; INGEN extern oberoende referens görs gällande. Limbens halvvinkel kontrolleras mot asin(R_earth/r_orbit) och geometrin mot den; fritt-rum-förlusten, DOP-kärnan och SGP4-propageringen som detta bygger på är var och en externt validerade i sina egna rader, och denna rad lånar inte deras status. VARFÖR MODELLED, och det är sändningsdiagrammet: förstärkningen vid vinkel är en likformigt belyst

seg-6dfc5503f58f = MODELLED, och sändningsdiagrammet är orsaken: förstärkningen vid vinkel är en likformig cirkulär apertur (Airy), medan en verklig GPS L1-antenn är en spiralantennsgrupp med tolv element, med en formad huvudlob och icke-Airy-sidolober. (kind catalogue (<c1/>))

seg-c40d3fd8c12e = VAD SOM ÄR MODELLED, OCH VARFÖR DET INTE ÄR VALIDATED Sändningsförstärkningen vid vinkel är en likformigt belyst cirkulär apertur — ett Airy-diagram. En verklig GPS L1-antenn är en spiralantennsgrupp med tolv element vars uppmätta diagram har en formad huvudlob, avsiktligt toppad utanför antennens huvudriktning för att jämna ut effekten över jordskivan, och sidolober som inte alls är Airy. Uppmätta diagram är publicerade; de ingår inte i denna re (scenario file comment, lines { "29" } to { "35" })

seg-01fa469abd95 = Jord-GNSS på månavstånd är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Föregående</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Nästa</s1>entry-heating
