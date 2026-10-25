# docs--kinds-lunar-and-cislunar: translations (sv)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Typ

seg-f994c81583bf = MODELLED test med oberoende estimator av observerbarhetströskeln för cislunar båglängd. Den tröskeln är en RANG-avläsning på observerbarhetsmatrisen som byggs av de ANALYTISKA avståndsjakobiraderna och den ANALYTISKA variationella tillståndsövergångsmatrisen, och dess kontroll med kvadratrotsinformationsfiltret viker in just de raderna — en konsistenskontroll mellan två numeriska maskiner, inte styrkande belägg. Den här typen tillhandahåller den saknade skiljedomaren: en batch-estimator med minsta kvadrat som faktiskt ÅTERFINNER chefens initialtillstånd från simulerade mätningar, med mätpartialerna tagna som CENTRALA FINITA DIFFERENSER av den sammansatta framåtmodellen. Den anropar ingen analytisk jakobirad, ingen variationell STM, ingen singulärvärdes- eller egenvärdesuppdelning, ingen rangtolerans och inget kvadratrotsinformationsfilter — en källtextspärr i tests/cislunar_arc_recovery_reference.rs gör det verkställbart — medan dynamiken (samma RK4-CR3BP-flöde), begynnelsevillkoren (samma differentialkorrigerade konstellation), den skalära observabeln och epokrutnätet delas medvetet och namnges i det utsända <c1/>-blocket, eftersom två analyser av ett fysikaliskt problem måste vara överens om fysiken för att vara jämförbara. Två kriterier, vart och ett svept över fem dekader av sin egen gräns: BRUSFRI ÅTERFINNING (varje seedad körnings slutliga tillståndsfel högst recovery_factor gånger dess a priori-förskjutning — rangmotsvarigheten, utan singulärvärdestolerans i sig) och MONTE CARLO-SKATTBARHET (det uppmätta RMS-positionsfelet över en seedad brusensemble under en angiven gräns — skattbarhetsmotsvarigheten, uppmätt i stället för förutsagd). Stöder det plana fyratillståndet och det rumsliga sextillståndet, familjerna DRO / L2 halo / L2 NRHO, observabler för avstånd och avståndshastighet, och en månecentrerad polär parametrisering där transformationen tillämpas på TILLSTÅNDET och framåtmodellen deriveras om där. UPPMÄTT på det publicerade plana DRO-rutnätet: estimatorn återfinner fyratillståndet från { "0.782609" } h mot rangkriteriets { "2.086957" } h vid rel_tol { "1e-6" } (kvot { "0.375" }) — rangtröskeln är NOT CORROBORATED som gräns för återfinnbarhet — medan den uppmätta skattbarhetsgränsen hamnar i samma rutnätscell som den formella, { "5.739130" } h, och den uppmätta felkurvan reproducerar den formella 1-sigma över { "21" } båglängder till en geometrisk medelkvot på { "0.98" }. MODELLED: konstellationsutformningen, epokrutnätet, den enda spårade länken, förskjutningens storlek, mätsigman och de två angivna gränserna. Inte en certifierad produkt för navigeringsprestanda.

seg-2fe411ae2153 = Diagrammet som motorn skriver för scenarios/cislunar-arc-recovery.toml, typ cislunar-arc-recovery

seg-7ccd0a3babb8 = MODELLED observerbarhet för en plan cislunar konstellation (P6): spårar en differentialkorrigerad plan DRO-konstellation med fyra rymdfarkoster med avståndsmätning mellan satelliter och redovisar hur mycket av en rymdfarkosts fyratillstånd [x,y,ẋ,ẏ] som bågen gör observerbart. Ger ({ "1" }) tabellen rang mot båglängd för en enda länk med enbart avstånd — ögonblickligen rang 1, växande mot hela fyratillståndet när bågen förlängs (P6 tabell { "1" }); ({ "2" }) Gramians egenvärdesspektrum + konditionstal över bågen; ({ "3" }) jämförelsen av ögonblicklig rang för enbart avstånd mot avstånd+avståndshastighet (Doppler som utformningsspak) plus redovisningen av GDOP som är singulär för enbart avstånd / definierad för avstånd+hastighet; och ({ "4" }) en oberoende SRIF-korsvalidering vars posteriora kovarians blir ändlig / välkonditionerad exakt vid den båge där den observerbara rangen når fyra. VALIDATED kärna: den observerbara rangen är en rangavslöjande tröskel för singulärvärden korskontrollerad mot Gramians egenrang; egenvärdesspektrumet följer de spektrala invarianterna (spår=Σλ, det=Πλ, Frobenius²=Σλ²); den variationella STM är den med finita differenser validerade CR3BP-STM; raderna för jakobianen av avstånd/avståndshastighet är analytiska partialer validerade med finita differenser (korskontrollerade mot cratens 3-D-observabel för avståndshastighet); de fyra begynnelsevillkoren är differentialkorrigerade plana DRO:er som sluter till en snäv periodicitetsresidual och är retrograda; rangövergången är korsvaliderad mot cratens kvadratrotsinformationsfilter (posteriorkovariansen ändlig exakt vid full rang, cond(P)=cond(OᵀO)); en rangdefekt ögonblicksbild flaggas GDOP-odefinierad (fim condition=inf), aldrig ett falskt ändligt värde — samma skydd mot singulär geometri som pvt::solve_spp tillämpar. MODELLED: konstellationsutformningen (DRO-perilunamplituder och faser) och den specifika rangprogression den ger. Inte en certifierad produkt för navigeringsprestanda.

seg-f15bbf30b0dd = Diagrammet som motorn skriver för scenarios/cislunar-observability.toml, typ cislunar-observability

seg-c8a8be4b8894 = Mottagning av jord-GNSS på månavstånd, det svagsignalslager som conflict-resilience-artikeln nämner och som motorn saknade modell för. En GNSS-satellit riktar sin antenn mot jorden; en mottagare nära månen befinner sig ungefär femton gånger omloppsradien bort, så tre saker slår till samtidigt. Jorden SKYMMER ANTENNENS HUVUDRIKTNING: från { "26,560" } km upptar den en halvvinkel på { "13.9" } deg, så varje stråle mot månen måste lämna sändaren minst så långt från nadir, vilket tar bort strålens topp innan någon effekt beräknas. Det som återstår är HUVUDLOBENS KANT OCH SIDOLOBERNA, det regim som LuGRE-nyttolasten faktiskt arbetade i under { "2025" }. Och fritt-rum-förlusten är cirka { "208" } dB vid L1, ungefär { "25" } dB mer än en markanvändare betalar. Rapporten ger en rad per satellit (vinkel från antennens huvudriktning, jordskymning, avstånd, vägförlust, sändningsförstärkning vid den vinkeln, mottagen effekt, bärvåg-till-brustäthet) och aggregerar bara de länkar som klarar spårningströskeln. DEN REDOVISAR OCKSÅ KONDITIONERINGEN, eftersom det är den som definierar detta lager: varje synlig satellit ligger inom en kon som är ett par grader bred sett från månen, så siktlinjerna är nästan parallella, DOP (dilution of precision) är enorm, och en jord-GNSS-positionsbestämning på månavstånd är en observation av TIDSSYNKRONISERINGSKLASS betydligt mer än av positionsklass. MODELLED, och sändningsdiagrammet är orsaken: förstärkningen vid vinkel är en likformig cirkulär apertur (Airy), medan en verklig GPS L1-antenn är en spiralantennsgrupp med tolv element, med en formad huvudlob och icke-Airy-sidolober. Uppmätta diagram finns och ingår inte här, så ordningsföljder och storleksordningar är meningsfulla medan dB för en enskild satellit inte är det. Medvetet FRÅNVARANDE, och var och en gör budgeten optimistisk: ingen jonosfärisk eller troposfärisk förlust på de strålar som tangerar limben, ingen polarisations-, pekningsförlust eller implementeringsförlust, och en sfärisk jord utan refraktiv utvidgning. Månens position är en INDATA (avstånd plus tröghetsriktning) snarare än ett efemeridsuppslag, eftersom det som testas är länken och strålgeometrin. Att uppgradera denna rad till Validated kräver ett uppmätt sändningsdiagram och LuGRE-normalpunkter; inget av dem finns i arkivet och inget av dem är påhittat här.

seg-cf1dce5fc824 = Diagrammet som motorn skriver för scenarios/earth-gnss-lunar.toml, kind earth-gnss-lunar

seg-004c56ded47f = Angreppsyta för signalsäkerhet vid navigering på månytan (P1): sammanställer de öppna signalsäkerhetsanalyserna i en enda körning som kan nås från binärfilen. Redovisar ({ "1" }) AFS-mottagen effekt och dess effektÖVERSKOTT jämfört med en jordbunden GPS-referens, plus känslighetsbandet på 12-18 dB som en äkta svepning över flera axlar av länkens indata (referensnivå x EIRP x snedavstånd) med avstämningen mellan linjära faktorerna 25x avrundat / 28x oavrundat. REVIDERAD (regel R4): den här redovisade ett effektUNDERSKOTT på { "15.6" } dB och en faktor 32x/36x tills GPS-referensen korrigerades från -125 / -128.5 (som är dBm-siffrorna) till -155 / -158.5 dBW, de ICD-GPS-200-värden som störningsmodulen alltid har haft. Tecknet vänds: den modellerade lunara AFS-signalen är { "14.4" } dB STARKARE än jordbunden GPS L1 C/A, inte svagare. Själva mottagna effekten rörde sig inte en bit, och den linjära faktorn är den gamla delad med exakt { "1000" }, vilket är exakt dBm-till-dBW-förskjutningen på { "30" } dB; ({ "2" }) den sändareffekt en angripare behöver för att spoofa (J/S = { "3" } dB) och för att förhindra (J/S = { "30" } dB) vid varje avstånd, inversen av J/S-länken; ({ "3" }) den omloppsbaserade fångstytan under ett verkligt antennmönster för likformig apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), en höjdbegränsad subhemisfärisk kalott vars kant INTE fångas; ({ "4" }) ett beräknat utfall för spoofningsfångst i spårningsslingan (drar en spoofer med matchad kod vid en given effektfördel och kodförskjutning faktiskt med sig DLL/PLL) i stället för det påstådda tröskelvärdet på { "3" } dB; ({ "5" }) den geometriska horisontens räckvidd på en kropp utan atmosfär för en upphöjd sändare på ytan; och ({ "6" }) budgeten för OSNMA/TESLA-autentisering ({ "20" } bit/s överhead = ~{ "40" } % av ett AFS-navigeringsmeddelande på { "50" } bit/s, latens för nyckelavslöjande, { "2" }^-40 förfalskning). En tom kropp återger P1-baslinjen; varje indata har ett standardvärde och kan skrivas över. VALIDATED delresultat bär sin källmoduls oberoende referens (radiometri i dB i sluten form; tur-och-retur för invers J/S; Airy-mönster mot Bessel enligt A&S och sfärisk kalottgeometri; DLL/PLL-fångst mot Kaplan & Hegarty; identitet för sfärisk tangenthorisont mot eo_payload; fältstorlekar enligt OSNMA SIS-ICD). MODELLED: de representativa storlekarna på geometri och effekt och de enskilda cellvärdena i fångstkartan. Ingen certifierad säkerhetsprodukt.

seg-de295af20c55 = Diagrammet som motorn skriver för scenarios/lunar-attack-surface.toml, typ lunar-attack-surface

seg-142ad48fe422 = Förstärkning med fyrar på ytan av en lunar omloppsbaserad navigeringstjänst, som en körbar före/efter-tabell. En användare vid sydpolen ser en gles omloppsuppsättning i en smal del av himlen, så avståndsgeometrin är illa konditionerad; några INMÄTTA FYRAR PÅ YTAN ger de siktlinjerader med låg elevation och stor azimutspridning som en uppsättning helt ovanför saknar, och den horisontella försämringen av precision kollapsar. Scenariot redovisar tre konfigurationer vid en epok — enbart satelliter, satelliter plus de synliga fyrarna och en större konstellation som alternativ väg till samma geometri — var och en med antal synliga källor, sin fullständiga DOP och den uppnådda 1-sigma-noggrannheten i METER, erhållen genom att multiplicera med ett användarekvivalent avståndsfel per fyr som sätts samman som kvadratisk summa av termerna för klocksynkronisering, flervägsutbredning och inmätning. Fyrens synlighet är den geometriska horisonten på en måne utan atmosfär för två höjder (ingen atmosfär, så gränsen är exakt), och DOP-sammansättningen är samma kärna som korskontrollerats mot gnss_lib_py i tests/dop_reference.rs. VARFÖR DEN HÄR TYPEN FINNS: modulen bakom den har funnits i motorn och kontrollerats mot en oberoende DOP-väg sedan L08/L09, men den gick inte att nå från en körning — ingen typ, ingen dispatch-gren, ingen medföljande fil. README annonserade förmågan och verifieringsmatrisen hade INGEN rad för den alls, så den var samtidigt påstådd i prosa och opåstådd i registret, medan den var onåbar i motorn. Standardvärdena är den geometri som redan bär en incheckad referensfil (en användare vid -80 deg med en antenn på { "2" } m, tre fyrar vid -80/0, -79/+{ "60" } och -79/-60 på { "2" } km, en illustrativ ögonblicksbild av sex LCNS-satelliter vid t={ "0" }, en mask på { "5" } deg), så att en tom körning återger en tabell som en oberoende referens redan täcker i stället för att hitta på nya tal. MODELLED: konstellationsutformningen, fyrarnas placering och varje storlek i felbudgeten är illustrativa indata, inte en driftsatt inmätning eller en uppmätt länk; endast DOP-aritmetiken, den slutna formen för horisonten och sambandet sigma = DOP x sigma_URE är externt förankrade. Inget åtagande om tjänstens prestanda.

seg-a53e353706f6 = Diagrammet som motorn skriver för scenarios/lunar-beacon.toml, typ lunar-beacon

seg-8ac5ac006ae7 = Modellerad lunar DIFFERENTIELL PNT (en lunar analog till DGNSS/SBAS): en referensstation av NovaMoon-klass på en KÄND selenografisk plats beräknar differentiella korrektioner per satellit för en ILLUSTRATIV konstellation av Moonlight/LCNS-klass från offentliga källor (NovaMoon nämns endast som en systemKLASS, inte knutet till ESA), och en användare förskjuten med baseline_km tillämpar dem så att de GEMENSAMMA ban- och klockfelen tar ut varandra. Klocktermen tar ut sig SJÄLV EXAKT (en algebraisk identitet); bantermen lämnar bara kvar projektionen av skillnaden i siktlinje, som → { "0" } när baslinjen → { "0" } (golvet för rumslig dekorrelation) och växer ≈ linjärt med baslinjen. Redovisar användarens 3D-positionsfel MED respektive UTAN korrektioner, reduktionsfaktorn, kurvan för fel mot baslinje och en skyddsnivå för användaren som ÅTERANVÄNDER SBAS-maskineriet i DO-229E (crate::sbas) med det differentiella residualen σ. MODELLED — exakt identitet för bortagande + första ordningens dekorrelationsmodell; inte validerad med verkliga data; inget TRL, inget flygarv och inget stöd från någon myndighet. Deterministisk om den får ett frö.

seg-0e86ff364c17 = Diagrammet som motorn skriver för scenarios/lunar-interop-export.toml, typ lunar-interop-export

seg-a91a9ad5d8d1 = Lunar-nativ RF-jamming: förhållande mellan störning och signal per satellit, effektiv C/N₀ och låsförlust för en användare på selenografisk yta under en lunar markstörsändare (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass i lunar omloppsbana från offentliga källor. Sammanställer den befintliga öppna jamming-fysiken (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den befintliga lunara himmelsgeometrin (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri härleds på nytt. Till skillnad från typen <c1/> för jorden är signalledet INTE en fast mottagen effekt: varje satellits isotropa mottagna effekt är dess egen länkbudget EIRP − FSPL(snedavstånd), så J/S varierar från satellit till satellit med lunart avstånd och elevation. Redovisar EN RAD PER SYNLIG LÄNK (epok, satellit) — azimut, elevation, snedavstånd, båda mottagna effekter vars skillnad J/S är, J/S, den nominella och effektiva C/N₀ och låsstatus — plus sammanfattande kvalitetsmått bredvid (aldrig i stället för) den tabellen, och samma tabell som CSV-artefakt. Varje utsänt numeriskt fält bär en enhet och en ursprungsklass. VALIDATED delresultat bär sin källmoduls oberoende referens (antijammingekvationen och J/S-länken enligt Kaplan & Hegarty §{ "9.4" }, externt refererad i tests/gnss_denied_jamming_resilience_reference.rs; den lunara geometrin i lunar_service). Själva sammansättningen korskontrolleras mot en oberoende väg med två länkbudgetar (linkbudget::received_signal_power_dbw, ett annat uttryck för fri rymdförlust) till { "1e-9" } dB. MODELLED: den illustrativa konstellationen, de representativa värdena för EIRP / störsändareffekt / antennförstärkningar / brustemperatur, och avsaknaden av terrängskugga, flervägsutbredning, AGC-dynamik och adaptiv nollställning. Ingen certifierad produkt mot överbelastningsattacker. Med en konfigurerad störsändare redovisar rapporten också en BLOCKERINGSKONTUR MED ETT OSÄKERHETSBAND i stället för en kontur avläst ur ett enda skalärt värde: hela den uppmätta fördelningen av önskad signals C/N₀ över tabellen per satellit (n, min, p05, p25, median, p75, p95, max, medelvärde, stickprovets standardavvikelse och stickprovets egen asymmetri), och konturen utvärderad vid var och en av de ordningsstatistikorna under BÅDA blockeringskriterierna som motorn känner igen — det etablerade effektkvotskriteriet (J/S = { "30" } dB, som i attack-surface och tracking-loop) och låsförlustkriteriet (effektiv C/N₀ som faller till tracking_threshold_dbhz, det kriterium som den här rapportens egen statuskolumn använder) — på båda axlarna i blockeringsplanet (erforderlig EIRP för störsändaren vid scenariots avstånd, blockeringsavstånd vid scenariots EIRP). Bandkanterna ÄR contour(p05) och contour(p95), samma slutna avbildning tillämpad på stickprovets egna kvantiler: inte ett sigma anpassat till stickprovet och inte median ± k·stdev, med stdev utsänd för kontinuitetens skull och använd av ingenting. En kvantil som redan ligger vid eller under spårningströskeln har ingen ändlig blockerande J/S och dess kolumner för låsförlust är null med en räknad orsak, aldrig en avkapad radie.

seg-6fe8b3c6c584 = Diagrammet som motorn skriver för scenarios/lunar-jamming.toml, typ lunar-jamming

seg-200e58e189c2 = Modellerad gemensam estimator i batch för lunar banbestämning med flera tekniker + klocka på ett SIMULERAT nätverk: en Gauss-Newton-anpassning av en ögonblicksbild som sammanväger geodetiska VLBI-fördröjningar med jordbaslinjer, lunart lokala avstånd mellan station och satellit och avstånd mellan satelliter för att tillsammans återvinna en lunar markstations 3D-position, en liten konstellations positioner och varje enhets klockförskjutning ur en injicerad referens. Det ärliga huvudresultatet — VLBI gör stationens fullständiga 3D-position observerbar där enbart lunart lokal avståndsmätning lämnar en svagt observerad riktning — redovisas som kontrasten i stationsfel med respektive utan VLBI. MODELLED simulerad återvinning i sluten slinga (referensen delar observationsmodell), deterministisk (frö), INTE validerad med verkliga data; ingen propagering med kraftmodell inne i lösaren; inget TRL, inget flygarv och inget stöd från någon myndighet.

seg-cfa051b87e59 = Diagrammet som motorn skriver för scenarios/lunar-joint-od-clock.toml, typ lunar-joint-od-clock

seg-25455a33523c = Lunart referenssystemsdatum med Helmert med sju parametrar, drivet av en VERKLIG, ARKIVERAD observationskampanj i stället för en simulerad. Där lunar-frame-campaign tog bort den injicerade transformationen men ändå angav sitt stationsnätverk, sitt schema och sitt sigma per observation som ILLUSTRATIVA indata, hämtar den här typen alla tre från mätning: epokerna är sändningstiderna från marken för arkiverade normalpunkter i ILRS Consolidated Laser Ranging Data, observationerna är de laseravstånd som verkligen avfyrats mot de fem retroreflektorfälten på månen, och varje observationsvikt är den normalpunktens egen arkiverade precision bin_rms/sqrt(n_raw) utläst ur filen. Stationskoordinaterna kommer från IERS ITRF2020 SLR-lösning (propagerade till epoken med sina publicerade hastigheter) och reflektorkoordinaterna från JPL DE430 tabell { "7" } i det medeljordsfasta/medelrotationsreferenssystem som IAU { "2015" } WGCCRE-modellen realiserar. Avståndspartialerna ackumuleras till den gemensamma Fisher-informationsmatrisen för reflektorkoordinaterna och propageras genom samma Helmert-design till datumkovariansen, diagnostiserad av crate::fim::crlb. Rang, defekt, konditionstal, spektrum, oobserverbara riktningar i sjuparameterbasen, den svagaste riktningen vid full rang och varje parameters andel av den redovisas vid varje körning, och en obegränsad parameter publiceras som NULL med en status. Korrelationen mellan fält är MÄTT till exakt noll i stället för antagen, eftersom ett laseravstånd rör ett fält. En post som katalogerna inte kan placera — en station utan publicerad ITRF-position — HOPPAS ÖVER OCH RÄKNAS, och får aldrig en ersatt koordinat. VILKA LÄNKAR SOM ÄR MÄTTA OCH VILKA SOM ÄR MODELLED ÄR SJÄLVA RAPPORTEN, INTE EN FOTNOT: månens centrumefemerid och IAU:s kroppsorientering förblir modellerade och deras sammanlagda storlek skickas ut som residualen observerat minus beräknat för enkelriktat avstånd över varje använd punkt; troposfär, fasta jordtidvatten, stationsexcentricitet, polarrörelse, UT1-UTC, relativistisk fördröjning och stationsklockor saknas och ryms i den residualen. Eftersom ett efemerisfel når en kovarians enbart genom riktningen på varje siktlinje löser varje körning också hela datumet på nytt med alla partialer lutade med sensitivity_tilt_deg (med växlande tecken) och skickar ut kvoten, så att kovariansens okänslighet för den modellerade efemeriden är ett tal i stället för ett argument. Den simulerade kampanjens egna värden KÖRS och skrivs ut bredvid de uppmätta, inte avskrivna. MODELLED: värdena för de sju parametrarna är en Cramer-Rao-gräns för en reducerad parameteruppsättning på ett verkligt schema — inte ett löst datum, inte en LLR-analys och inte en geodetisk produkt. Den incheckade skivan med verkliga data levereras med repot men inte med den publicerade craten; peka data_dir mot en kopia av den.

seg-e4da113cbe18 = Diagrammet som motorn skriver för scenarios/lunar-llr-datum.toml, typ lunar-llr-datum

seg-f7ea776e70c9 = Modellerad täckning för lunar referensstation: en Monte Carlo-svepning av den lunara differentiella PNT-modellen över ett användarrutnät vid sydpolen och ett dygn av epoker. En differentiell referensstation på en känd plats vid sydpolen korrigerar en angiven konstellation (illustrativ keplersk eller en tabellerad efemerid) med ett angivet fel för signal i rymden, inmätningsfel, korrektionslatens och länkkvantisering; per punkt och över regionen redovisar den percentilen för korrigerat och okorrigerat positionsfel (3D, horisontellt, vertikalt), tillgänglighet, täckning mot en angiven tröskel, skyddsnivåer enligt DO-229E, täckningsradien per azimut och korrektionslänkens budget vid stationen och vid den sämsta punkten. Inget påstående om prestandan hos något verkligt system; inte knutet till eller stött av någon myndighet. MODELLED.

seg-922b8656fcae = Diagrammet som motorn skriver för scenarios/lunar-station-coverage.toml, typ lunar-station-coverage

seg-cac3a0bcbfc6 = MODELLED heltäckande tidsfelsbudget för Coordinated Lunar Time (LTC): de sju LTC-felkällorna sammanställs som tidsfelskurvor x_i(τ) över ett helt rutnät av medelvärdestider och summeras kvadratiskt till x_Σ(τ), tillsammans med KORSNINGS-τ mellan klocka och referenssystem där den växande klocktermen överträffar den konstanta realtidstermen för realiseringen av referenssystemet (under det är budgeten begränsad av referenssystemet, över det av klockan) — det ärliga svaret på artefakten med ett enda τ. τ-lutningarna är i sluten form och kan kontrolleras analytiskt (klocka τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, golv τ^{ "0" }, mätning τ^{ "{" }-1/2{ "}" }) och klockraderna återger de publicerade klockspecifikationerna för ett dygn (crate::clock_specs); MAGNITUDERNA för golven för RF-/optisk länk, realisering av referenssystemet, relativistisk rest och efemerid är modellerade budgetallokeringar (dokumenterade standardvärden, kan åsidosättas av anroparen), inte mätningar. Bidraget är det reproducerbara korsnings-τ, inte ett certifierat tal per term; inte certifierad för operativ tidshållning.

seg-56fe184f2a12 = Diagrammet som motorn skriver för scenarios/lunar-time-budget.toml, typ lunar-time-budget

seg-7f3e13712f10 = Modellerad relativistisk klockgång mellan jorden och månen (Lunar Coordinate Time, LTC/TCL): den sekulära LTC−TT-gången utifrån skillnaden i egenpotential och månens kinetiska term, angiven med det publicerade bandet { "56" }–{ "59" } µs/dygn, samt den ackumulerade offseten över en horisont.

seg-e9deb6ed41c1 = Diagrammet som motorn skriver för scenarios/lunar-time-offset.toml, typ lunar-time-offset

seg-1bc37634ba9f = Kovarians för stationskoordinater vid lunar VLBI: fördröjningspartialerna för observabeln lunar-vlbi ackumuleras över ett explicit SCHEMA (baslinjer x epoker) till en Fisher-informationsmatris, inverteras och redovisas som kovariansen för stationskoordinaterna och stationssigma per koordinat — ett beräknat motorutdata snarare än en skalär fördröjningsprecision som pressas genom en antagen isotrop ekvipartitionsfaktor g = { "3" }. Tillståndet bär jordfasta (ITRS) stationskoordinater, så jakobianen är den inertiella partialen roterad med varje epoks GCRS->ITRS-matris: jordrotationen är det som gör dessa koordinater observerbara, och rapporten MÄTER det jordfasta svepet av siktlinjen och fyrens deklination i stället för att anta dem. En observation är ett (baslinje, epok)-par där BÅDA stationerna ligger över elevationsmasken, viktat med 1/delay_sigma_s^{ "2" }. Rapporten anger rang, datumdefekt, konditionstal, hela informationsspektrumet, kovariansmatrisen, sigma per station och axel samt i 3D, och det fria nätverkets nollrum vid varje körning; vid rangbrist publiceras sigma i rubriken som NULL med en status och läses aldrig ur en nästan singulär invers. Ekvipartitionsvärdet c<em>delay_sigma_s</em>sqrt(g/N) för SAMMA schema redovisas bredvid det beräknade värdet med kvoten, tillsammans med den isotropa spårgränsen sqrt(p/trace(M)) som AM-HM gör till ett hårt golv — så kvoten är den anisotropi som antagandet förkastade. Fördröjningsslutningen tau_ik = tau_ij + tau_jk gör att bara n-1 av de n(n-1)/2 baslinjerna är geometriskt oberoende; rapporten anger båda antalen. MODELLED: månens centrumefemerid, stationsklockor, troposfär och jordorienteringsparametrar hålls FASTA och observationerna behandlas som oberoende, så kovariansen är en Cramer-Rao-gräns för en reducerad parametermängd, inte ett förutsagt sessionsresultat; fördröjningssigma, stationskoordinater och schema är indata. Partialen som den geometriska fördröjningsjakobianen utelämnar (den differentierade Shapiro-termen) mäts med finita differenser och redovisas. Ingen geodetisk produkt.

seg-19c383444296 = Diagrammet som motorn skriver för scenarios/lunar-vlbi-fim.toml, typ lunar-vlbi-fim

seg-e01f77d493a0 = Modellerad geodetisk lunar VLBI-fördröjningsobservabel: en jordbaslinje (två markstationer, GCRS) observerar en enkelriktad signal från en fyr av NovaMoon-klass på månytan. Ger den närfältsfördröjning som är skillnaden mellan två avstånd, dess ändringstakt och närfältskorrektionen för vågfrontens krökning över en passage — kontrollerad mot den plana vågens Δ-DOR-observabel i samma kodbas i fjärrfältsgränsen, med partialer verifierade genom finita differenser. Standardvägen med analytiska uttryck är MODELLED och bär förbehållen om ramkonsistens, polrörelse xp=yp={ "0" } och plan våg mot närfält. Om planetary_kernel_path, earth_orientation_kernel_path och moon_orientation_kernel_path anges körs i stället kärnvägen (DE440, MOON_PA_DE440, ITRF93; konvergerade barycentriska ljustider; lägger till epokens fyr- och stationspartialer), vars newtonska fördröjning och partialer ligger inom { "0.06" } ps och { "7.4e-9" } från NAIF SPICE:s konvergerade ljustider. Inte validerad mot verkliga VLBI-data.

seg-07d97fc1abac = Diagrammet som motorn skriver för scenarios/lunar-vlbi.toml, typ lunar-vlbi

seg-28c6a5644152 = Modellerad analys av lunar navigeringstjänstvolym utifrån en ILLUSTRATIV konstellation av Moonlight/LCNS-klass i månbana från offentliga källor (inte knuten till ESA): sveper över ett selenografiskt latitud-/longitudrutnät under en tidshorisont och redovisar DOP / täckning / tillgänglighet (≥{ "4" } satelliter OCH PDOP < tröskel) samt en generaliserad lunar ARAIM-skyddsnivåenvelopp (HPL/VPL) över volymen. DOP-geometrin ÅTERANVÄNDER den av gnss_lib_py VALIDATED-kärnan (crate::orbit::dop); skyddsnivån ÅTERANVÄNDER LunaNet LNIS lunar ARAIM-maskineriet (crate::lunar, σ_URE≈{ "30" } m) och reduceras till den befintliga skyddsnivån vid sydpolen som specialfall. MODELLED sammansättning: en cirkulär/elliptisk Kepler-relämängd (inte den verkliga differentialkorrigerade LCNS/NRHO-efemeriden), en måne med medelrotation (ingen libration/precesserande pol). Deterministisk (ren geometri). Ingen TRL/flygerfarenhet/myndighetsstöd.

seg-edb738273a3a = Diagrammet som motorn skriver för scenarios/moonlight-service-volume.toml, typ moonlight-service-volume

seg-4e31c8daf798 = Register

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-a240ef37dc6d = Källa: <c1/>

seg-befef5f2f8dd = Månen och cislunärt (familj av scenariotyper)

seg-f964724ea446 = { "20" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-369e7cfcc1d3 = Ämnessidor: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Kör en: <c1/>. Alla familjer: <a4>KINDS.md</a4>.

seg-15b8e26dc24b = Kontaktark med diagrammen som motorn skriver för typerna i familjen Månen och cislunärt

seg-fd2a12be04c2 = ARAIM-pass för skyddsnivåer vid månens sydpol mot en representativ LunaNet-reläuppsättning.

seg-240eb5858113 = Modellerad relativistisk klockgång Jorden–månen (månkoordinattid, LTC/TCL): den sekulära gången LTC−TT ur skillnaden i egenpotential och månens kinetiska term, redovisad med de publicerade { "56" }–{ "59" }

seg-177bff8d753e = MODELLED helhetsbudget för tidsfel i samordnad månttid (LTC): de sju LTC-feltermerna sammansatta som tidsfelskurvor x_i(τ) över ett helt rutnät av medelvärdesbildningstider, kvadratsummerade till x_Σ(τ), och

seg-df0437ef8324 = Modellerad observabel för geodetisk VLBI-fördröjning på månen: en jordbaslinje (två markstationer, GCRS) observerar en envägssignal från en fyr av NovaMoon-typ på månytan.

seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

seg-38254487fb7f = Kovariansmatris för stationskoordinater med Lunar-VLBI: fördröjningspartialerna för observabeln lunar-vlbi ackumulerade över ett explicit SCHEMA (baslinjer x epoker) till en Fisher-informationsmatris, inverterad, och redovisad

seg-23706714da99 = Modellerad gemensam batchskattare för månbanebestämning med flera tekniker + klocka på ett SIMULERAT nätverk: en Gauss-Newton-momentanpassning som sammanfogar geodetiska VLBI-fördröjningar på jordbaslinjer, lokala avstånd mellan station och satellit på månen

seg-2359450b3967 = Modellerad realisering av månens referenssystem: en datumanpassning med 7 parametrar (Helmert, likformighet) — { "3" } translation, { "3" } liten vinkelrotation, { "1" } skala — som knyter en skattad uppsättning från selenografi härledda MCMF-punkt

seg-2a5af9961e99 = Helmert-datum med sju parametrar (likformighet) för ramen, drivet av en SIMULERAD OBSERVATIONSKAMPANJ i stället för av en injicerad transformation.

seg-3615bea1ea75 = Helmert-datum med sju parametrar för månens ram, drivet av en VERKLIG, arkiverad observationskampanj i stället för en simulerad.

seg-5413116b8b42 = Modellerad analys av servicevolym för månnavigering utifrån en ILLUSTRATIV, offentligt källbaserad konstellation i månbana av typen Moonlight/LCNS (inte knuten till ESA): sveper ett selenografiskt lat/lon-rutnät över

seg-a0e202b3566c = Modellerad DIFFERENTIELL PNT på månen (en motsvarighet till DGNSS/SBAS för månen): en referensstation av NovaMoon-typ på en KÄND selenografisk plats beräknar differentiella korrektioner per satellit från en ILLUSTRATIV

seg-ed4ec8b6378c = Modellerad täckning för referensstationer på månen: ett Monte Carlo-svep av modellen för differentiell PNT på månen över ett användarrutnät vid sydpolen och ett dygns epoker.

seg-aeec32be6092 = Förstärkning med ytfyrar av en navigeringstjänst i månbana, som en körbar före/efter-tabell.

seg-b28693368acd = Modellerad export för interoperabilitet på månen: skriver ut månens referenssystem, månens tidsskala och månens efemerid i LunaNet/IOAG-anpassade, CCSDS-baserade utbytesformer med tur-och-retur- och fältvis formatkontroll

seg-d88605893c05 = MODELLED observerbarhet för en plan cislunär konstellation (P6): följer en konstellation med fyra rymdfarkoster i differentialkorrigerade plana DRO-banor med avståndsmätning mellan satelliter och redovisar hur stor del av en rymdfarkosts

seg-8eaec90d1df5 = MODELLED test med oberoende skattare av tröskeln för observerbarhet av cislunär båglängd.

seg-9619b3d699c6 = Angreppsyta för signalsäkerhet vid navigering på månytan (P1): sammanför de öppna signalsäkerhetsanalyserna i en enda, binärt nåbar körning.

seg-64c78e211181 = RF-jamming specifik för månen: jammer-till-signal-förhållande per satellit, effektivt C/N₀ och förlust av låsning för en selenografisk ytanvändare under en jammer på månytan (eller upphöjd), över den illustrativa offentliga

seg-df68720ee7a5 = Mottagning av jordens GNSS på månavstånd, det svagsignalslager som konfliktmotståndskraftsartikeln namnger och som motorn saknade modell för.

seg-e6475fe9f443 = MODELLED studier av månens bana och yta som navigerings- och geodetisk infrastruktur, fem studier bakom en typ som väljs med <c1/>: od-consistency (GNSS-banbestämning ombord med jordens GNSS i

seg-ca4fac406beb = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-da20b48985b9 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-integrity</a1>.

seg-564b491c4bb8 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>.

seg-0f0b2d0ca0b4 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-time-offset</a1>.

seg-128bf57a76d1 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-d6aa5d645fb7 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-time-budget</a1>.

seg-79140f2544ea = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

seg-de468e4d4b46 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "3" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-vlbi</a1>.

seg-7da3c3ff2386 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-3119d4005897 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-vlbi-fim</a1>.

seg-6f59a33a35b3 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-142f2253e4d6 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-joint-od-clock</a1>.

seg-32c31af24e1b = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-73c0415efd2f = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-frame-realisation</a1>.

seg-96efcb8d55d1 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-ce2f0f85dda4 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-frame-campaign</a1>.

seg-d9e24a9a8c0c = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-4f05fad4b146 = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-llr-datum</a1>.

seg-8d9e0277303e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

seg-204901ae3684 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>moonlight-service-volume</a1>.

seg-6fe67fa619d0 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-c83350735643 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-differential-pnt</a1>.

seg-facc442295f1 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

seg-8a2f6f535c4a = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-station-coverage</a1>.

seg-a790c54ac1aa = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-4efffcd615df = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-beacon</a1>.

seg-720d0bbeaf6e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-019ca0f1051e = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-interop-export</a1>.

seg-28695dd2ecc3 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-af5d871bc69e = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>cislunar-observability</a1>.

seg-f646e9fd7553 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-5e7bd8bb1adf = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>cislunar-arc-recovery</a1>.

seg-3c514f3acc78 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

seg-00b06a4fc0e0 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-attack-surface</a1>.

seg-079d2bb805f1 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-63d4157e2294 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-jamming</a1>.

seg-7bb977529f30 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-287f89e6bf6b = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>earth-gnss-lunar</a1>.

seg-f7ed8b60e7d1 = Obligatoriska fält: <c1/>. Valfria: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-41e50e49da99 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>lunar-infrastructure</a1>.

seg-09f7f99d04a6 = <s1>Föregående</s1>Navigering i låg omloppsbana

seg-74c6bf83988e = <s1>Nästa</s1>Uppdragsanalys länkar och rymdoperationer
