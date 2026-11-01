# docs--kind-conflict-resilience: translations (sv)

seg-c4ed27a559df = Ämnessida: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Scenariotyp i motor v{ $version }, familj <a1>GPS-nekad alternativ PNT</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-98133e74f88a = Familjesida: <a1>GPS-nekad alternativ PNT</a1>

seg-34f14aa2ee0b = Källa: <c1/>

seg-a80556cfe1a9 = <c1/> (scenariotyp)

seg-c8f93431680a = MODELLED resiliens i lagrad PNT under konflikt (P7): en användare i en omstridd miljö har flera PNT-lager (GNSS med öppen tjänst, bredbands-GNSS, en autentiserad konstellation, ett förstärkningsrelä), vart och ett med en grundtillgänglighet, en noggrannhet på 1σ och en sårbarhet för nekande per vektor mot det gemensamma jamming-/spoofing-hotet. En intensitetssvept SEEDAD Monte Carlo nekar varje lager med sannolikheten clamp(vulnerability·intensity·vector_weight,{ "0,1" }), slår ihop de överlevande med den slutna inversvariansregeln σ_fused=(Σ 1/σ_i²)^(−1/2), och redovisar sannolikheten för total förlust (alla lager nekade), mediankravet på sammanslaget fel och statistik per lager för användbarhet/nekande mot intensitet. Det övergripande resiliensförhållandet (sannolikhet för total förlust med ett lager mot lagrad) hamnar på ~7x under ANTAGANDET OM OBEROENDE; ett envariabelt Gauss-copula-svep med korrelerat nekande visar sedan hur de ~7x kollapsar mot { "1" } när korrelationen i nekande ökar (korrelation slår ut lagring). Ett block för priorkänslighet låter det övergripande talet variera över de KÄLLBELAGDA sårbarhetspriorerna via mcda-tornado + en Dirichlet-omfördelning av hotinsats + percentilkonfidensintervall. VALIDATED kärna: Monte Carlo-totalförlusten konvergerar mot den slutna oberoende produkten Π_i p_deny_i (inom Monte Carlo-standardfelet vid ett fast frö och stort N); den inversvariansvägda sammanslagningen är en sluten identitet; vid ρ={ "0" } reduceras copulan till den oberoende modellen och varje ρ bevarar varje lagers marginella nekandefrekvens. MODELLED: storleksordningarna för sårbarhet/tillgänglighet/noggrannhet per lager är källbelagda men Modelled indata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), och den specifika storleken ~7x och formen på kurvan förhållande mot korrelation följer av den parametriseringen. En uppdelning av överlevnad per vektor i § { "4.2" } löser sedan upp det gemensamma RF-hotet i de fyra namngivna vektorerna (jamming/spoofing/kinetiskt/cyber) och redovisar varje vektors kurva för graciös försämring av användbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: den seedade Monte Carlo per lager konvergerar mot den slutna formen; jamming är den skarpaste vektorn för den korrelerade RF-baslinjen och det RF-immuna tröghetslagret är den avgörande överlevaren. Inte en certifierad produkt för navigeringstillgänglighet.

seg-dd10a00edc2f = En körning av <c1/> sammanfattas som: conflict-resilience | { "4" } lager ({ "0" } baslinje) | referensintensitet { "1.00" } | resiliensförhållande sluten form 6.73x MC 6.19x (lagrad mot ett lager) | korrelation slår ut lagring: förhållande 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior-KI [5.51-8.48]x | överlevnad per vektor @ ref jam { "26" }% spoof { "80" }% kinetiskt { "100" }% cyber { "99" }% (skarpast jamming) | ~7x övergripande MODELLED, VALIDATED MC->sluten form / sammanslagningsidentitet / copula-marginaler / överlevnad per vektor

seg-674bafccbaf7 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Exemplet <c1/> anger bland annat:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (öppen tjänst)

seg-bd3832c8215d = Resultatetikett (motorns): MODELLED resiliens i lagrad PNT under konflikt (P7). VALIDATED kärna: sannolikheten för total förlust i Monte Carlo konvergerar mot den slutna oberoende produkten Pi_i p_deny_i (kontrollerat inom Monte Carlo-standardfelet vid ett fast frö och stort N); den inversvariansvägda positionssammanslagningen sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Diagrammet som motorn skriver för scenarios/conflict-resilience.toml, typ conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Delpoäng per dimension över Kshanas egna sju resilienskategorier (inte DHS-termer), RethinkPNT RDRR-funktioner och Yang-kriterier, var och en märkt Modelled med i. Oberoende referens (InternalConsistency): Handhärledda formler per mått: invers Simpson-diversitet, viktat medelvärde som sammansatt mått, avgränsade/oavgränsade tidslinjevaraktigheter, nivåstege efter svagaste länk

seg-2ca37a78e899 = MODELLED resiliens i lagrad PNT under konflikt (P7). VALIDATED kärna: sannolikheten för total förlust i Monte Carlo konvergerar mot den slutna oberoende produkten Pi_i p_deny_i (kontrollerat inom Monte Carlo-standardfelet vid ett fast frö och stort N); den inversvariansvägda positionssammanslagningen sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) är en sluten identitet; vid korrelation rho={ "0" } reduceras den gaussiska copulan exakt till den oberoende mo (resultat <c1/>)

seg-d0d834e377ee = MODELLED resiliens i lagrad PNT under konflikt (P7): en användare i en omstridd miljö har flera PNT-lager (GNSS med öppen tjänst, bredbands-GNSS, en autentiserad konstellation, ett förstärkningsrelä), vart och ett med en grundtillgänglighet, en noggrannhet på 1σ och en sårbarhet för nekande per vektor mot det gemensamma jamming-/spoofing-hotet. (typkatalog (<c1/>))

seg-3ca12700b54c = Det övergripande resiliensförhållandet (sannolikhet för total förlust med ett lager mot lagrad) hamnar på ~7x under ANTAGANDET OM OBEROENDE; ett envariabelt Gauss-copula-svep med korrelerat nekande visar sedan hur de ~7x kollapsar mot { "1" } när korrelationen i nekande ökar (korrelation slår ut lagring). (typkatalog (<c1/>))

seg-70e4fdff099f = MODELLED: storleksordningarna för sårbarhet/tillgänglighet/noggrannhet per lager är källbelagda men Modelled indata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), och den specifika storleken ~7x och formen på kurvan förhållande mot korrelation följer av den parametriseringen. (typkatalog (<c1/>))

seg-33541cca61b6 = En användare i en omstridd miljö har fyra RF-PNT-lager som alla använder samma band och därför delar nekandevektorn för jamming/spoofing — det sköra, korrelerade fallet. Scenariot redovisar: * sannolikhet för total förlust mot hotintensitet (Monte Carlo mot den slutna oberoende produkt den konvergerar mot), * resiliensförhållandet ~7x mellan lagrad och ett lager under antagandet om oberoende, * hur de ~7x kollapsar till (kommentar i scenariofilen, rad { "3" } till { "15" })

seg-83badfe4784d = Varje storlek per lager är en MODELLED indata med proveniens; se src/conflict_threat_params.rs för de källbelagda priorerna [min, nominellt, max] och känslighetsprofilerna per vektor (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Om <c1/> utelämnas körs samma källbelagda baslinje med fyra lager; den skrivs ut här — inklusive varje lagers vector_profile — för insynens skull. (kommentar i scenariofilen, rad { "17" } till { "22" })

seg-bb182ed41520 = Poängsättning i linje med ramverk för PNT-resiliens är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Föregående</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Nästa</s1>constellation-design
