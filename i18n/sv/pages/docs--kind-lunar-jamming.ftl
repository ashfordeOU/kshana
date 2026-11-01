# docs--kind-lunar-jamming: translations (sv)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Tillhandahålls inte — Kshana modellerar signalprestanda, inte nyttolast- eller antennhårdvara. Oberoende referens (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b> Månnativ störsignal-till-signal-kvot, effektiv C/N₀ och förlust av låsning för en selenografisk ytanvändare under en störsändare på månytan (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass från offentliga källor.

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> vilar inte längre med sin nekandekontur på en enda skalär.

seg-bcb02ffed4d0 = Källa: <c1/>

seg-612388918e36 = <c1/> (scenariotyp)

seg-a91a9ad5d8d1 = Lunar-nativ RF-jamming: förhållande mellan störning och signal per satellit, effektiv C/N₀ och låsförlust för en användare på selenografisk yta under en lunar markstörsändare (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass i lunar omloppsbana från offentliga källor. Sammanställer den befintliga öppna jamming-fysiken (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den befintliga lunara himmelsgeometrin (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri härleds på nytt. Till skillnad från typen <c1/> för jorden är signalledet INTE en fast mottagen effekt: varje satellits isotropa mottagna effekt är dess egen länkbudget EIRP − FSPL(snedavstånd), så J/S varierar från satellit till satellit med lunart avstånd och elevation. Redovisar EN RAD PER SYNLIG LÄNK (epok, satellit) — azimut, elevation, snedavstånd, båda mottagna effekter vars skillnad J/S är, J/S, den nominella och effektiva C/N₀ och låsstatus — plus sammanfattande kvalitetsmått bredvid (aldrig i stället för) den tabellen, och samma tabell som CSV-artefakt. Varje utsänt numeriskt fält bär en enhet och en ursprungsklass. VALIDATED delresultat bär sin källmoduls oberoende referens (antijammingekvationen och J/S-länken enligt Kaplan & Hegarty §{ "9.4" }, externt refererad i tests/gnss_denied_jamming_resilience_reference.rs; den lunara geometrin i lunar_service). Själva sammansättningen korskontrolleras mot en oberoende väg med två länkbudgetar (linkbudget::received_signal_power_dbw, ett annat uttryck för fri rymdförlust) till { "1e-9" } dB. MODELLED: den illustrativa konstellationen, de representativa värdena för EIRP / störsändareffekt / antennförstärkningar / brustemperatur, och avsaknaden av terrängskugga, flervägsutbredning, AGC-dynamik och adaptiv nollställning. Ingen certifierad produkt mot överbelastningsattacker. Med en konfigurerad störsändare redovisar rapporten också en BLOCKERINGSKONTUR MED ETT OSÄKERHETSBAND i stället för en kontur avläst ur ett enda skalärt värde: hela den uppmätta fördelningen av önskad signals C/N₀ över tabellen per satellit (n, min, p05, p25, median, p75, p95, max, medelvärde, stickprovets standardavvikelse och stickprovets egen asymmetri), och konturen utvärderad vid var och en av de ordningsstatistikorna under BÅDA blockeringskriterierna som motorn känner igen — det etablerade effektkvotskriteriet (J/S = { "30" } dB, som i attack-surface och tracking-loop) och låsförlustkriteriet (effektiv C/N₀ som faller till tracking_threshold_dbhz, det kriterium som den här rapportens egen statuskolumn använder) — på båda axlarna i blockeringsplanet (erforderlig EIRP för störsändaren vid scenariots avstånd, blockeringsavstånd vid scenariots EIRP). Bandkanterna ÄR contour(p05) och contour(p95), samma slutna avbildning tillämpad på stickprovets egna kvantiler: inte ett sigma anpassat till stickprovet och inte median ± k·stdev, med stdev utsänd för kontinuitetens skull och använd av ingenting. En kvantil som redan ligger vid eller under spårningströskeln har ingen ändlig blockerande J/S och dess kolumner för låsförlust är null med en räknad orsak, aldrig en avkapad radie.

seg-6693c3ebcb07 = En körning av <c1/> sammanfattas som: lunar-jamming | { "4" } sat., { "12" } epoker, { "38" } länkar från (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (medel { "35.622" }) | { "0" } LOST | tillgänglighet { "0.167" } av { "0.167" } nominellt

seg-6e01b6354e40 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Exemplet <c1/> anger bland annat:

seg-6fe8b3c6c584 = Diagrammet som motorn skriver för scenarios/lunar-jamming.toml, typ lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Lunar-nativt förhållande mellan störning och signal, effektiv C/N₀ och låsförlust för en användare på selenografisk yta under en lunar markstörsändare (eller upphöjd), över den illustr. Oberoende referens (ReferenceImpl): Korskontroll av sammansättningen mot en oberoende kodväg i samma repo: varje J/S per länk härleds på nytt som skillnaden mellan två länkbudgetar beräknade med linkbudget::received_signal_power_dbw, vars fria rymdförlust är det enda uttrycket { "20" }·log10(4πRf/c) i stället för den summa av tre termer som jamming::free_space_path_loss_db använder — de två stämmer till < { "1e-9" } dB på varje rad (uppmätt värsta fall { "7.11e-14" } dB, det vill säga flyttalsavrundning)

seg-dbe54e7cc800 = <b>MODELLED</b> Rapporten <c1/> låter inte längre sin blockeringskontur vila på ett enda skalärt värde. Den skickar ut hela den uppmätta fördelningen av önskad signals C/N₀ över t per satellit. Oberoende referens (InternalConsistency): Intern konsistens mot motorns egna framåtfunktioner, vilket är allt den här förmågan ärligt kan göra anspråk på. Varje konturpunkt är en invertering i sluten form, och varje invertering kontrolleras genom att dess svar skickas tillbaka genom den FRAMÅTfunktion som rapportens egna rader poängsattes med: kolumnen J/S genom jamming::effective_cn0_dbhz (som måste ge tillbaka tracking_threshold_dbhz till < { "1e-9" } dB-Hz), kolumnen för avstånd

seg-d48926e62856 = MODELLED: den illustrativa konstellationen, de representativa värdena för EIRP / störsändareffekt / antennförstärkningar / brustemperatur, och avsaknaden av terrängskugga, flervägsutbredning, AGC-dynamik och adaptiv nollställning. (typkatalog (<c1/>))

seg-c455dbcb9f8c = MODELLED. Konstellationen är den illustrativa geometrin av Moonlight/LCNS-klass från offentliga källor (inte den verkliga efemeriden; ingen anknytning eller stöd antyds), och störningsmodellen är en länkbudget: ingen terrängskugga för störsändaren (en effekt av första ordningen i terräng vid sydpolen), ingen flervägsutbredning, ingen AGC-dynamik för nära/fjärran, ingen adaptiv nollställning, ingen hysteres mellan förvärv och spårning. (kommentar i scenariofilen, rad { "26" } till { "30" })

seg-da57cc7f1aa4 = Lunar RF-jamming vid navigering på ytan (J/S per satellit) är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Lunar blockeringskontur med ett osäkerhetsband från den uppmätta spridningen i C/N₀ är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Ämnessida: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Föregående</s1>lunar-interop-export

seg-02568469f628 = <s1>Nästa</s1>lunar-joint-od-clock
