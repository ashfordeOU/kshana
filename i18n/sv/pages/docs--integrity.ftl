# docs--integrity: translations (sv)

seg-668241606715 = Källa: <c1/>

seg-9a8c218ce054 = Integritet och säkerhet: vad Kshana modellerar och vad det inte gör

seg-52038c93765d = Kshana redovisar två kvalitetsmått (FoM) — <b>Integritet</b> och <b>Säkerhet</b> — som lätt förväxlas med de flygklassade storheterna med samma namn. Den här sidan anger tydligt vad de är i dag, vad de <em>inte</em> är och vad färdplanen lägger till. Om du utvärderar Kshana för ett sammanhang som rör liv och säkerhet eller certifiering, läs det här först.

seg-fb6e93a107e7 = I dag ({ "v0.37.0" })

seg-ecd20ae1a05d = Integritets-FoM — filtrets självkonsistens

seg-153391e55508 = Integritets-FoM är andelen avbrottsprov vars sanna tidsfel håller sig inom Kalman-filtrets eget k-sigma-skyddsgräns:

seg-ac2413a97a7b = Det mäter om filtrets <em>självrapporterade</em> osäkerhet är ärlig om filtrets <em>eget</em> fel under ett avbrott i GNSS (global navigation satellite system). Det är en användbar intern konsistenskontroll.

seg-c9f80760ea53 = Det är <b>inte</b>:

seg-8899525ad177 = en <b>horisontell/vertikal skyddsnivå (HPL/VPL)</b> — det finns överhuvudtaget ingen skyddsnivå i positionsdomänen (klockpaketen ligger i tidsdomänen);

seg-dd9a3e58e10b = en <b>integritetsrisk / sannolikhet för farligt vilseledande information (P_HMI)</b>;

seg-31fa92b3271d = en jämförelse mot en <b>larmgräns</b>;

seg-ee998b974e6f = något som uppfyller kraven i <b>RTCA DO-229E / DO-316</b> eller <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) eller någon annan certifieringsstandard.

seg-f84a56b6fe10 = Säkerhets-FoM — analytisk gräns för spoofing-detekterbarhet

seg-e532288ed262 = Säkerhets-FoM är en <b>klockstabilitetsbaserad gräns för spoofing-detekterbarhet</b>: givet en klockas brus (vitt frekvensbrus och slumpvandrings-PSD:er (effekttäthetsspektrum)) och ett övervakningsfönster är den den analytiska detekteringsmarginalen för en konsistensmonitor med en enda klocka mot en långsamt ökande spoofing med falsk tid. En tystare klocka (t.ex. en optisk klocka) detekterar en mindre, långsammare spoofing än en brusigare (t.ex. en CSAC (atomur i chipskala)) — den kontrasten är poängen med demonstratorn.

seg-fc718a805b28 = Det är <b>inte</b> en RAIM-detektor (receiver autonomous integrity monitoring) med flera satelliter. Det finns inga pseudoavståndsresidualer mellan satelliter, ingen skyddsnivå och ingen P_HMI. Innovation-mot-sigma-testet har samma matematiska form som klassisk RAIM-feldetektering (Brown), men talet är en analytisk gräns för en given klocka, inte en RAIM-implementation, och det är meningsfullt bara i sammanhanget av ett konfigurerat spoofing-scenario (se scenariotypen <c1/>, som injicerar en verklig ökande attack).

seg-ae770e25031e = Utdata säger det. Typerna <c1/>, <c2/>, <c3/> och <c4/> konfigurerar ingen attack, så deras enradssammanfattning skriver ut <c5/> i stället för ett tal, och deras resultatdokument markerar <c6/> som <c7/>, med skälet, i blocket <c8/>. Själva värdet finns kvar i dokumentet för den som vill ha gränsen.

seg-960bd91a2b3a = Verklig snapshot-, lösningsseparations- och ARAIM-RAIM (<c1/>)

seg-3d31ec251ac0 = En verklig RAIM i positionsdomänen är implementerad i <c1/>, separat från självkonsistens-FoM ovan:

seg-0e8240812c16 = <b>Residualövervakning med flera satelliter</b> — den bygger geometrimatrisen för siktlinjer till de synliga satelliterna, bildar minstakvadratlösningen för position och klocka och testar summan av kvadrerade residualer.

seg-69f1535596e0 = <b>χ²-feldetektering</b> — <c1/> (SSE: summan av kvadrerade residualer) är χ²(n−{ "4" }) under hypotesen utan fel; ett fel deklareras över <c2/>. χ²-trösklarna kommer från en beroendefri utvärdering av den regulariserade ofullständiga gammafunktionen (exakt, inga tabeller).

seg-6721779048f5 = <b>Lutningsbaserad HPL / VPL</b> — <c1/>, där <c2/> är positionsfelskänsligheten per satellit från hat-matrisen och <c3/> är den icke-centrala χ²-bias som uppfyller den konfigurerade sannolikheten för missad detektering <c4/>.

seg-8dd60e98088d = <b>Lösningsseparerings-RAIM (MHSS: multiple-hypothesis solution separation)</b> — för alla-i-sikte-lösningen och varje underlösning med en satellit utesluten <b>detekterar och identifierar</b> den nästlade estimatorns separation <c1/> den felaktiga satelliten och matar skyddsnivågränsen.

seg-719e27fdd2c1 = <b>ARAIM-budget (advanced receiver autonomous integrity monitoring) för integritetsrisk (P_HMI)</b> — <c1/> löser den minsta HPL/VPL vars summerade sannolikhet för farligt vilseledande information <c2/> (Blanch m.fl., <em>Baseline ARAIM</em>) uppfyller en uttrycklig allokering av integritetsrisk, och redovisar den risk nivåerna uppnår — så integritet kan vägas direkt mot larmgränsen, i stället för att vara underförstådd i en fast multiplikator <c3/>.

seg-2f99acf45203 = <b>Stanford–ESA-integritetsdiagram</b> (ESA: European Space Agency) — en ackumulator per epok klassificerar <c1/> i områdena Tillgänglig / Systemet otillgängligt / Vilseledande / Farligt vilseledande för en tillgänglighetssammanfattning.

seg-33d01969fb0f = <b>Nåbar från början till slut</b> — scenariotypen <c1/> kör ovanstående över en SGP4-konstellation (Simplified General Perturbations { "4" }) eller en Kepler-konstellation, eller en som läses från riktiga TLE:er (two-line element sets) eller en RINEX-navigeringsfil (Receiver Independent Exchange Format), och ger en tillgänglighetskarta för HPL/VPL per epok mot de konfigurerade larmgränserna (<c2/>). Samma körning <b>exporterar ett vertikalt Stanford-diagram</b>: vid varje skyddad epok mappas ett frösatt, reproducerbart felfritt avståndsfelsutfall genom geometrin till ett verkligt vertikalt fel och klassificeras mot VPL och den vertikala larmgränsen, så att JSON-resultatet (JavaScript Object Notation) och CLI-sammanfattningen (kommandoradsgränssnitt) bär antalen per område (integritetshändelser och HMI: farligt vilseledande information) — inte bara en tillgänglighetsandel. På det medföljande <c3/> redovisar körningen { "344" } av { "361" } epoker tillgängliga ({ "95.3" } %) vid en horisontell larmgräns på { "40" } m och en vertikal på { "50" } m, med { "0" } integritetshändelser och { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM med två konstellationer och ett integritetsstödmeddelande</b> — <c1/> lägger till <b>felläget för hela konstellationen</b>: förutom de felfria och enskilda satellithypoteserna bidrar varje konstellation med en hypotes som tar bort alla dess satelliter, med a priori-sannolikhet <c2/>, till samma MHSS-summa för integritetsrisk. <c3/> (ISM) bär användarens avståndsnoggrannhet för integritet (<c4/>), noggrannhetens effektivvärde (<c5/>), den största nominella biasen <c6/> som viks in ensidigt i varje läge, samt a priori-sannolikheterna <c7/> och <c8/>; dess referensuppsättning från WG-C (Working Group C inom samarbetet mellan Europeiska unionen och USA om satellitnavigering, vars tekniska undergrupp för ARAIM publicerar referensen) är σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } och P_const = { "1e-4" }. <c9/> återger resultatet för enkelfelet <c10/> bit för bit. Typen <c11/> tar den här vägen med <c12/> (<c13/>: GPS + Galileo, { "48" } satelliter, { "145" } av { "145" } epoker tillgängliga vid samma larmgränser).

seg-1f06bc1976bd = <b>Skyddsnivåer mot publicerade referensvektorer</b> — typen <c1/> kör motorns <c2/> och <c3/> på WG-C:s ARAIM-undergrupps egna genomarbetade exempel (Reference Airborne Algorithm Description Document v3.1, { "2019" }, bilaga D, och Milestone { "3" } Report, { "2016" }, bilaga A). Den största skillnaden i vertikal/horisontell skyddsnivå på acceptansvektorn är { "0.0437" } m mot dokumentens egen tolerans på { "0.05" } m. Den här raden är VALIDATED i <a1><c4/></a1>: den kontrollerar skyddsnivåekvationen, inte ett operativt ISM eller en mottagare.

seg-1dda7b318c5f = Det återstående gapet (färdplan)

seg-e27215296e1a = Vad <c1/> ännu <b>inte</b> gör:

seg-964c0634eae0 = den är <b>inte inlagd i FoM för klock-/holdover-scenarier</b> — de paketen redovisar fortfarande filtrets självkonsistens-integritetstal ovan, inte en HPL/VPL;

seg-eecf2f9f181e = felhypoteserna är det felfria fallet, <b>enskilda satelliter</b> och <b>hela konstellationer</b> — samtidiga fel på <b>delmängder om två eller fler satelliter (SV: space vehicle, det vill säga en satellit)</b> modelleras inte;

seg-fd0f9fb2de83 = ISM är en konfigurerbar parameteruppsättning (med WG-C:s referensvärden), inte ett utsänt operativt meddelande eller en validerad hotmodell;

seg-88f5242b0809 = <b>feldetektering och uteslutning (FDE)</b> är endast för enskilda satelliter och snapshot: lösningsseparation pekar ut den felaktiga satelliten, och <c1/> löser om varje uteslutning av en enskild satellit och returnerar den uteslutna satelliten med chi-kvadrattestet och skyddsnivåerna för den kvarvarande delmängden, men ingen uteslutningsskyddad position redovisas, och scenariotypen <c2/> kör inte uteslutningssteget.

seg-c85aa5dedc86 = Kärnorna för snapshot, lösningsseparation och ARAIM prövas på <b>verklig IGS-geometri (International GNSS Service) från precisionsbanor (SP3: Standard Product { "3" })</b>, inte enbart på syntetiska konstellationer: <c1/> bildar siktlinjegeometrin från den första epoken i en äkta IGS SP3-produkt vid en verklig markstation och kontrollerar att skyddsnivåerna är ändliga och inom larmgränserna för APV-I (approach with vertical guidance) på { "40" } m horisontellt och { "50" } m vertikalt, att en pseudoavståndsbias på { "60" } m utlöser χ²-monitorn, att lösningsseparation <b>identifierar</b> den felaktiga satelliten och att ARAIM:s nivåer uppfyller den allokerade <c2/>. <c3/> kör vägen för två konstellationer på de verkliga Celestrak-katalogerna för GPS och Galileo från 2026-06-07, propagerade till en gemensam epok (se <a1><c4/></a1> §{ "3" }). En djupare korskontroll — att jämföra skyddsnivåer epok för epok mot gLAB (GNSS-Lab Tool, en svit för GNSS-databehandling som distribueras av ESA) över en full RINEX-observationsbåge — skulle ge paritet i mottagardomänen. Det är inte gjort: typen <c5/> beräknar en kod-enkelpunktsposition från verkliga RINEX-observationer, men ingen skyddsnivå från den lösningen har jämförts med gLAB:s.

seg-f5fac2e836a6 = Alltså är <c1/> en verklig kärna för skyddsnivå och integritetsrisk, nåbar från scenariotyperna <c2/> och <c3/>, prövad på verklig referensbanegeometri och kontrollerad mot WG-C:s referensvektorer. Fel i delmängder med flera satelliter, paritet med gLAB i mottagardomänen och integration av klock-FoM är fortfarande punkter på färdplanen, och inget av detta är certifieringsevidens.

seg-487f24ed92d8 = <a1><c1/></a1> — enradsdefinitioner av varje FoM och förkortning.

seg-7d3c12cf802e = <a1><c1/></a1> — ISM-parametrarna och WG-C:s referensvektorer.

seg-04532ba5288f = <a1><c1/></a1> — tidsskyddsnivån (TPL) för en glidande klocka, som är villkorad av detektering.

seg-43cea496da93 = <a1><c1/></a1> — vilka storheter som är referensvaliderade respektive självkonsistenskontroller.

seg-3037dde8135f = <c1/> — härledningen av gränsen för spoofing-detekterbarhet.

seg-04d63778ca7f = RAIM bredvid klock-holdover-kvalitetsmåtten ({ "0.36" }, tillval)

seg-744e95749978 = Ett klockscenario kan innehålla en sektion <c1/> (<c2/>): en plats (<c3/>, <c4/>, <c5/>), konstellationsförinställningar (<c6/>, standard <c7/>), en mask, en sigma för avståndsresidualer, sannolikheterna för falsklarm och missad detektering, de horisontella och vertikala larmgränserna, ett epokavstånd och en valfri angiven bias på en satellit. Körningen redovisar då ett separat block <c8/>: per epok satelliterna i sikte, snapshot-RAIM-skyddsnivåerna och ett utlåtande (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), samt antalen och tillgängligheten över körningen. Så länge tidslinjen säger att GNSS är nekat är RAIM otillgänglig och ingenting extrapoleras; ett försämrat fönster utvärderas som nominellt. Holdover-kvalitetsmåtten är oförändrade, och utan sektionen är utdata byte för byte identiska. MODELLED: en representativ förinställd himmel, syntetiska residualer och angivna gränser. Det kräver <c14/>.

seg-139639263c90 = Återgivningen av maximal URA i EU–USA WG-C ARAIM Milestone { "3" } (CAP-05c)

seg-97906754d4c8 = En tidigare plan utlovade en jämförelse med ”Table A-3” i en teknisk not om EU-ARAIM. Ingen offentlig källa för den tabellen kunde hittas (de offentliga rapporterna Milestone { "1" } till { "3" } från EU–USA Working Group C ARAIM Technical Subgroup har ingen Table A-3), så den jämförelsen är <b>återkallad</b> och ingenting utlovas under det namnet.

seg-b61607c477f2 = Det som i stället försöks är den rapport som är offentlig: <b>Milestone { "3" } Report</b> ({ "25" } februari { "2016" }, GPS.gov-kopia, SHA-256 <c1/>), tabellerna { "5" }, { "6" } och { "7" }, som för varje konstellationskonfiguration och var och en av RNP { "0.1" } och RNP { "0.3" } skriver ut det största <c2/> för vilket { "90" } % av användarna har { "99.5" } % tillgänglighet. Tolv utskrivna poster (raderna Depleted och Baseline i tabellerna för två frekvenser) kontrolleras, under trösklar som förhandsregistrerats i <a1><c3/></a1> före varje poängsatt körning, med de avvikelser som inte kan undanröjas angivna där: inga almanackfiler, Walker-skal i stället för de verkliga positionerna, ett grövre rutnät och steg, och motorns horisontella ADD v4.2-väg i stället för rapportens egen text. Tabellerna { "8" } till { "13" } (en frekvens) och raderna Optimistic försöks inte, med skälen angivna där. <b>Resultat: { "8" } av { "12" } poster återgivna, { "4" } NOT MET (fastlåsta):</b> posterna för två konstellationer och alla poster med enbart Galileo stämmer (inklusive raderna N/A), posten för dubbel Depleted RNP { "0.1" } når täckning { "0.847" } vid { "9" } m mot utskrivna { "9" } m (kräver { "0.90" }), och tre poster med enbart GPS missar kraftigt (täckning { "0.70" } vid { "4" } m, { "0.58" } vid { "6" } m, { "0.65" } vid { "10" } m mot utskrivna { "4" } m, { "6" } m och ”>{ "10" } m”). Missarna för enbart GPS kan bero på att det likformiga Walker-skalet står i för de verkliga GPS-positionerna (D1); det är en hypotes, inte ett fynd. Resultatet förblir MODELLED vad det än blir. Studien är <c4/>; dess uppmätta täckningar finns i <c5/> och poängsätts av <c6/>. Själva rapporten citeras, inte medföljer.

seg-0e98826cedcc = <s1>Föregående</s1>Hårdvarusäkerhet

seg-e6f1e38977b7 = <s1>Nästa</s1>Spektrum och vattenfall

seg-38ab3bb65327 = Verklig snapshot-, lösningsseparations- och ARAIM-RAIM (src/raim.rs)
