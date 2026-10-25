# docs--kind-lunar-vlbi-fim: translations (sv)

seg-b054c73f22e5 = inget värde

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-3319b18ac61f = och { "1" } till i matrisen.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-datumet med sju parametrar propagerat från en SIMULERAD OBSERVATIONSKAMPANJ i stället för återvunnet från en injicerad transformation.

seg-7ecec8d27f50 = Källa: <c1/>

seg-d54e29b7bc80 = <c1/> (scenariotyp)

seg-1bc37634ba9f = Kovarians för stationskoordinater vid lunar VLBI: fördröjningspartialerna för observabeln lunar-vlbi ackumuleras över ett explicit SCHEMA (baslinjer x epoker) till en Fisher-informationsmatris, inverteras och redovisas som kovariansen för stationskoordinaterna och stationssigma per koordinat — ett beräknat motorutdata snarare än en skalär fördröjningsprecision som pressas genom en antagen isotrop ekvipartitionsfaktor g = { "3" }. Tillståndet bär jordfasta (ITRS) stationskoordinater, så jakobianen är den inertiella partialen roterad med varje epoks GCRS->ITRS-matris: jordrotationen är det som gör dessa koordinater observerbara, och rapporten MÄTER det jordfasta svepet av siktlinjen och fyrens deklination i stället för att anta dem. En observation är ett (baslinje, epok)-par där BÅDA stationerna ligger över elevationsmasken, viktat med 1/delay_sigma_s^{ "2" }. Rapporten anger rang, datumdefekt, konditionstal, hela informationsspektrumet, kovariansmatrisen, sigma per station och axel samt i 3D, och det fria nätverkets nollrum vid varje körning; vid rangbrist publiceras sigma i rubriken som NULL med en status och läses aldrig ur en nästan singulär invers. Ekvipartitionsvärdet c<em>delay_sigma_s</em>sqrt(g/N) för SAMMA schema redovisas bredvid det beräknade värdet med kvoten, tillsammans med den isotropa spårgränsen sqrt(p/trace(M)) som AM-HM gör till ett hårt golv — så kvoten är den anisotropi som antagandet förkastade. Fördröjningsslutningen tau_ik = tau_ij + tau_jk gör att bara n-1 av de n(n-1)/2 baslinjerna är geometriskt oberoende; rapporten anger båda antalen. MODELLED: månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FASTA och observationerna behandlas som oberoende, så kovariansen är en Cramer-Rao-gräns för en reducerad parametermängd, inte ett förutsagt sessionsresultat; fördröjningssigma, stationskoordinater och schema är indata. Partialen som den geometriska fördröjningsjakobianen utelämnar (den differentierade Shapiro-termen) mäts med finita differenser och redovisas. Ingen geodetisk produkt.

seg-4df72c1b921e = En körning av <c1/> sammanfattas som: lunar-vlbi-fim | { "3" } stations / { "3" } baselines x { "49" } epochs = { "16" } obs (mask { "10.0" } deg) | datum anchor-first-station | rank 6/6 cond { "2.209e4" } | station sigma { "0.0926" } m vs equipartition g={ "3" } { "0.0013" } m (ratio { "71.360" })

seg-f0dabe1b061b = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Exemplet <c1/> anger bland annat:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Resultatetikett (motorns egen): MODELLED kovarians för stationskoordinater vid lunar VLBI. Kovariansen ackumuleras från motorns egna analytiska fördröjningspartialer över ett explicit schema av baslinjer och epoker och inverteras; den är INTE omräknad från en skalär fördröjningsprecision med en antagen geometrifaktor. Fördröjningssigma per observation

seg-19c383444296 = Diagrammet som motorn skriver för scenarios/lunar-vlbi-fim.toml, typ lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Fördröjningspartialer ackumulerade över ett schema av baslinjer × epoker till en Fisher-informationsmatris, inverterad till kovariansen för stationskoordinaterna och stationssigma per koordinat, vilket ersätter en antagen isotrop ekvipartitionslänk från en

seg-55ce02ad5dd5 = <b>MODELLED</b> Ett tredje datumval, <c1/>, som håller varje jordstation fast och skattar endast FYRENS månfasta koordinater — den konfiguration som en osäkerhet för en punkt på månytan faktiskt anges för, eftersom jordstationernas koordinater

seg-811a412b40b6 = <b>VALIDATED</b> Kovariansen för fyren med alla stationer fasta i scenariot lunar-vlbi-fim (varje jordstation hålls fast, fyrens månfasta koordinater skattas ensamma) med fyren placerad på JPL DE440-månen som läses av motorns egen kärnläsare

seg-a731b913bdf0 = <b>VALIDATED</b> Fördröjningspartialer ackumulerade över ett schema av baslinjer × epoker till en Fisher-informationsmatris, inverterad till kovariansen för stationskoordinaterna och stationssigma per koo. Oberoende referens (ExternalDataset): En oberoende väg i repot. Varje jakobianrad härleds på nytt med centrala finita differenser av lunar_vlbi::vlbi_delay_s utvärderad från tillståndets egna jordfasta och månfasta koordinater roterade framåt genom ramkedjan — en väg som inte beräknar någon derivata och inte delar något uttryck med de analytiska partialerna — och informationsmatriserna som de två vägarna bygger ligger inom < { "1e-6" } av den största diagonalen från varandra. Den

seg-2300ffd9fc4e = <b>MODELLED</b> Ett tredje datumval, <c1/>, som håller varje jordstation fast och skattar endast FYRENS månfasta koordinater — den konfiguration som en lu. Oberoende referens (ReferenceImpl): Identiteter i sluten form, utan någon extern oberoende referens som görs gällande eller finns. Hävarmen kontrolleras mot ρ/B och de två ekvipartitionsformerna mot varandra inom { "1e-15" } — algebraiska identiteter, så de fångar ett kopplingsfel och inget annat, och är märkta som sådana. Det väsentliga resultatet är MÄTT i stället för påstått: en fördröjning från en fast baslinje begränsar fyrens RIKTNING, så siktlinjekomponenten rea

seg-2cbf700a234e = MODELLED kovarians för stationskoordinater vid lunar VLBI. Kovariansen ackumuleras från motorns egna analytiska fördröjningspartialer över ett explicit schema av baslinjer och epoker och inverteras; den är INTE omräknad från en skalär fördröjningsprecision med en antagen geometrifaktor. Fördröjningssigma per observation, stationskoordinaterna, fyrens plats och schemat är indata. Månens centrumefemerid, stationsklockorna (resultat <c1/>)

seg-8f63c3e774e2 = Kovarians för stationskoordinater vid lunar VLBI: fördröjningspartialerna för observabeln lunar-vlbi ackumuleras över ett explicit SCHEMA (baslinjer x epoker) till en Fisher-informationsmatris, inverteras och redovisas som kovariansen för stationskoordinaterna och stationssigma per koordinat — ett beräknat motorutdata snarare än en skalär fördröjningsprecision som pressas genom en antagen isotrop ekvipartitionsfaktor g = { "3" }. (typkatalog (<c1/>))

seg-d09b166842d5 = Tillståndet bär jordfasta (ITRS) stationskoordinater, så jakobianen är den inertiella partialen roterad med varje epoks GCRS->ITRS-matris: jordrotationen är det som gör dessa koordinater observerbara, och rapporten MÄTER det jordfasta svepet av siktlinjen och fyrens deklination i stället för att anta dem. (typkatalog (<c1/>))

seg-bb7ff1e5d99f = Ekvipartitionsvärdet c<em>delay_sigma_s</em>sqrt(g/N) för SAMMA schema redovisas bredvid det beräknade värdet med kvoten, tillsammans med den isotropa spårgränsen sqrt(p/trace(M)) som AM-HM gör till ett hårt golv — så kvoten är den anisotropi som antagandet förkastade. (typkatalog (<c1/>))

seg-0ed4495d4488 = MODELLED: månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FASTA och observationerna behandlas som oberoende, så kovariansen är en Cramer-Rao-gräns för en reducerad parametermängd, inte ett förutsagt sessionsresultat; fördröjningssigma, stationskoordinater och schema är indata. (typkatalog (<c1/>))

seg-4df6e3981cc4 = D3:s publicerade kedja går från en fördröjningsprecision per observation till en osäkerhet för stationskoordinaterna genom en antagen ISOTROP ekvipartitionsfaktor g = { "3" }. Det steget är det som artikelns eget sammandrag kallar modellerat snarare än mätt. Detta scenario tar bort det: fördröjningspartialerna för lunar VLBI ackumuleras över ett verkligt schema av (baslinje x epok)-par till en Fisher-informationsmatris, inverteras och redovisas a (kommentar i scenariofilen, rad { "3" } till { "8" })

seg-489b93ca0f7f = Tillståndet bär jordfasta (ITRS) koordinater, så jakobianen är den inertiella partialen roterad med varje epoks GCRS->ITRS-matris: jordrotationen är det som över huvud taget gör dessa koordinater observerbara, och rapporten MÄTER det jordfasta svepet av siktlinjen och fyrens deklination i stället för att anta dem. En observation är ett (baslinje, epok)-par där BÅDA stationerna ligger över elevationsmasken, viktat med 1/delay (kommentar i scenariofilen, rad { "10" } till { "14" })

seg-efb5719364af = Vad du ska läsa i rapporten * sigma per station och axel samt i 3D — det beräknade svaret; * ekvipartitionsvärdet c<em>delay_sigma_s</em>sqrt(g/N) för SAMMA schema, utskrivet bredvid det med kvoten. Den kvoten ÄR den anisotropi som antagandet förkastade, och den isotropa spårgränsen sqrt(p/trace(M)) gör AM-HM till ett hårt golv, så antagandet kan bara någonsin underskatta; * rang, datumdefekt, konditionstal, hela sp (kommentar i scenariofilen, rad { "16" } till { "26" })

seg-96c1a129aeae = <s1>Föregående</s1>lunar-time-offset

seg-199d98630271 = <s1>Nästa</s1>lunar-vlbi
