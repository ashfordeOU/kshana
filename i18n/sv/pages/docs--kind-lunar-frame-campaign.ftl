# docs--kind-lunar-frame-campaign: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-3319b18ac61f = och { "1" } till i matrisen.

seg-dd57b833cb20 = Källa: <c1/>

seg-120769aba2cc = <c1/> (scenariotyp)

seg-55679aff66db = Helmert-datum (likformighet) med sju parametrar för ett referenssystem, drivet av en SIMULERAD OBSERVATIONSKAMPANJ i stället för av en injicerad transformation. Ett nätverk av jordstationer observerar en katalog av fyrar på månytan enligt ett explicit schema; de lunara VLBI-fördröjningspartialerna ackumuleras över det schemat till en Fisher-informationsmatris för fyrkoordinaterna, precis som lunar-vlbi-fim gör; och den informationen propageras genom Helmert-designen A = [I3 | [p]_x | p] vid katalogpunkterna till datumkovariansen H = A^T M_b A, diagnostiserad av crate::fim::crlb. INGEN transformation injiceras och inget återvinns ur ett planterat svar, så den redovisade datumnoggrannheten härleds ur observationsprogrammet: om fördröjningssigmat halveras halveras den exakt, och en längre båge förbättrar den eftersom den libration som rapporten MÄTER (sub_earth_direction_sweep_deg) är det som skiljer den siktlinjeriktade fyrkoordinaten från koordinaterna i himlens plan. Rang, datumdefekt, konditionstal, hela spektrumet, de inte observerbara riktningarna I SJUPARAMETERBASEN, den svagaste riktningen även vid full rang och varje parameters andel av den redovisas vid varje körning; en parameter som kampanjen inte begränsar publiceras som NULL med en status, aldrig utläst ur en nästan singulär invers. Korrelationen mellan fyrfel är mätt, inte antagen: med stationerna fixerade rör ingen observation två fyrar, så informationsmatrisen är exakt blockdiagonal (offblock_fraction { "0" }), och med skattade stationer är det Schur-marginaliserade blocket kopplat, med den inducerade korrelationen utskriven och hela propageringen körd om med den bortkastad, så att priset för ett oberoendeantagande är ett tal. Samma propagering under ett isotropt sigma per koordinat, och det återvinningsfel som scenariot lunar-frame-realisation redovisar, körs båda här och skrivs ut bredvid kampanjvärdet med sina kvoter. MODELLED: fyrkatalogen har källor men KAMPANJEN är simulerad — stationsnätverket och fördröjningssigmat är illustrativa indata, enskilda fördröjningsobservationer behandlas som oberoende, och månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FIXA, så datumkovariansen är en Cramer-Rao-gräns för en reducerad parameteruppsättning. Ingen geodetisk produkt.

seg-2e02c1ff8f48 = En körning av <c1/> sammanfattas som: lunar-frame-campaign | { "4" } fyrar x { "3" } baslinjer x { "49" } epoker = { "64" } obs (fördröjningssigma { "1.000e-11" } s) | stationsdatum fixerat | Helmert-rang 7/7 kond { "3.798e5" } | datumtranslationens sigma { "6.397500" } m jämfört med återvinningsfelet för injicerad transformation { "0.3125" } m (kvot { "0.049" })

seg-9c5feacf15ce = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Exemplet <c1/> anger bland annat:

seg-df90e5910fb4 = hr

seg-d9523213de9f = Resultatetikett (motorns egen): MODELLED kampanjdrivet lunart referenssystemsdatum. Helmert-kovariansen med sju parametrar propageras från en informationsmatris för fyrkoordinater som ackumulerats från motorns egna lunara VLBI-fördröjningspartialer över ett explicit schema av fyrar, baslinjer och epoker; INGEN likformighetstransformation injiceras och

seg-883d94b321b4 = Diagrammet som motorn skriver för scenarios/lunar-frame-campaign.toml, typ lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-datumet med sju parametrar propagerat från en SIMULERAD OBSERVATIONSKAMPANJ i stället för återvunnet från en injicerad transformation.

seg-fd34d760edb1 = <b>VALIDATED</b> Datumkovariansen för Helmert med sju parametrar, där de två simulerade indata ersatts av uppmätta: schemat är sändningsepokerna från marken för { "337" } arkiverade normalpunkter för ILRS lunar laseravståndsmätning (2015-04-08 till 2015-06-27, Grasse MeO { "7" } Tester: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> Valfria indata extra_reflectors och extra_beacons i scenariot lunar-llr-datum lägger till ett block station_geodesy: Helmert-informationen med fem fält från den arkiverade skivan av lunar laseravståndsmätning plus informationen från en tillagd retroreflektor (ran Tester: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Datumkovariansen för Helmert med sju parametrar för scenariot lunar-frame-campaign med skattade jordstationer (station { "1" } förankrad), så som lunar_frame_campaign beräknar den i binary64: den gemensamma Fisher-informationen för station och fyrar ackum Tester: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Anpassning av Helmert-datum med 7 parametrar + ICRF-orienteringstie från ett nätverk av punkter. Oberoende referens (ExternalDataset): Oberoende lösare i sluten form för likformighetstransformation med viktad Umeyama (Horn) (numpy/scipy SVD-baserad; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en annan algoritm än kshanas iterativa Gauss–Newton-anpassning, som når samma entydigt definierade viktade minsta kvadrat-optimum på byte-identiska punktnätverk

seg-d024abcfd87c = <b>MODELLED</b> Helmert-datumet med sju parametrar propagerat från en SIMULERAD OBSERVATIONSKAMPANJ i stället för återvunnet från en injicerad transformation. Jordstationer observerar en käll. Oberoende referens (ReferenceImpl): Slutna identiteter och en oberoende väg i samma repo, utan att någon extern oberoende referens görs gällande. Helmert-designen — den enda nya derivatan i modulen — härleds på nytt med central finit differens av lunar_frame_realise::apply_helmert, en väg som inte delar något uttryck med den analytiska formen. Ackumuleringen den sammansätter är lunar-vlbi-fim:s, vars jakobian differentieras finit mot lunar_vlbi::vlbi_delay_s där, och som

seg-0abd7b181f21 = MODELLED kampanjdrivet lunart referenssystemsdatum. Helmert-kovariansen med sju parametrar propageras från en informationsmatris för fyrkoordinater som ackumulerats från motorns egna lunara VLBI-fördröjningspartialer över ett explicit schema av fyrar, baslinjer och epoker; INGEN likformighetstransformation injiceras och inget återvinns ur ett planterat svar. Fyrkatalogen är cratens tabell över namngivna platser med källor, men KAMPA (resultat <c1/>)

seg-f92d22c06cd5 = Korrelationen mellan fyrfel är mätt, inte antagen: med stationerna fixerade rör ingen observation två fyrar, så informationsmatrisen är exakt blockdiagonal (offblock_fraction { "0" }), och med skattade stationer är det Schur-marginaliserade blocket kopplat, med den inducerade korrelationen utskriven och hela propageringen körd om med den bortkastad, så att priset för ett oberoendeantagande är ett tal. (typkatalog (<c1/>))

seg-534cea416496 = MODELLED: fyrkatalogen har källor men KAMPANJEN är simulerad — stationsnätverket och fördröjningssigmat är illustrativa indata, enskilda fördröjningsobservationer behandlas som oberoende, och månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FIXA, så datumkovariansen är en Cramer-Rao-gräns för en reducerad parameteruppsättning. (typkatalog (<c1/>))

seg-ec67b9d3adbb = Korrelationen mellan fyrfel är MEASURED, inte antagen. Med stationerna fixerade rör ingen observation två fyrar, så informationsmatrisen är exakt blockdiagonal (offblock_fraction { "0" }); med skattade stationer är det Schur-marginaliserade blocket kopplat, den inducerade korrelationen skrivs ut och hela propageringen körs om med den bortkastad, så att priset för ett oberoendeantagande är ett tal i stället för en c (kommentar i scenariofilen, rad { "17" } till { "21" })

seg-a2bb557da7ba = MODELLED: fyrkatalogen har källor men KAMPANJEN är simulerad — stationsnätverket och fördröjningssigmat är illustrativa indata, enskilda fördröjningsobservationer behandlas som oberoende, och månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FIXA. Ingen geodetisk produkt. (kommentar i scenariofilen, rad { "27" } till { "30" })

seg-57a371bca2c7 = Lunart referenssystemsdatum från en observationskampanj är MODELLED, inte validerat: kontrollerat mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativt. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Föregående</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Nästa</s1>lunar-frame-realisation
