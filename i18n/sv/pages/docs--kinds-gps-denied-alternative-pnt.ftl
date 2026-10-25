# docs--kinds-gps-denied-alternative-pnt: translations (sv)

seg-b03d56f501c3 = Typ

seg-f496b7f4c63a = Kombinerad navigator för gravitation + magnetfält + terräng i GPS-nekad miljö: tre skalära fältkanaler sammanslagna per vägpunkt för en skarpare positionsbestämning med mindre drift (lägre CRLB) än något enskilt fält.

seg-498b1aea3770 = Diagrammet som motorn skriver för scenarios/combined-altpnt.toml, typ combined-altpnt

seg-c8f93431680a = MODELLED resiliens i lagrad PNT under konflikt (P7): en användare i en omstridd miljö har flera PNT-lager (GNSS med öppen tjänst, bredbands-GNSS, en autentiserad konstellation, ett förstärkningsrelä), vart och ett med en grundtillgänglighet, en noggrannhet på 1σ och en sårbarhet för nekande per vektor mot det gemensamma jamming-/spoofing-hotet. En intensitetssvept SEEDAD Monte Carlo nekar varje lager med sannolikheten clamp(vulnerability·intensity·vector_weight,{ "0,1" }), slår ihop de överlevande med den slutna inversvariansregeln σ_fused=(Σ 1/σ_i²)^(−1/2), och redovisar sannolikheten för total förlust (alla lager nekade), mediankravet på sammanslaget fel och statistik per lager för användbarhet/nekande mot intensitet. Det övergripande resiliensförhållandet (sannolikhet för total förlust med ett lager mot lagrad) hamnar på ~7x under ANTAGANDET OM OBEROENDE; ett envariabelt Gauss-copula-svep med korrelerat nekande visar sedan hur de ~7x kollapsar mot { "1" } när korrelationen i nekande ökar (korrelation slår ut lagring). Ett block för priorkänslighet låter det övergripande talet variera över de KÄLLBELAGDA sårbarhetspriorerna via mcda-tornado + en Dirichlet-omfördelning av hotinsats + percentilkonfidensintervall. VALIDATED kärna: Monte Carlo-totalförlusten konvergerar mot den slutna oberoende produkten Π_i p_deny_i (inom Monte Carlo-standardfelet vid ett fast frö och stort N); den inversvariansvägda sammanslagningen är en sluten identitet; vid ρ={ "0" } reduceras copulan till den oberoende modellen och varje ρ bevarar varje lagers marginella nekandefrekvens. MODELLED: storleksordningarna för sårbarhet/tillgänglighet/noggrannhet per lager är källbelagda men Modelled indata (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — se conflict_threat_params), och den specifika storleken ~7x och formen på kurvan förhållande mot korrelation följer av den parametriseringen. En uppdelning av överlevnad per vektor i § { "4.2" } löser sedan upp det gemensamma RF-hotet i de fyra namngivna vektorerna (jamming/spoofing/kinetiskt/cyber) och redovisar varje vektors kurva för graciös försämring av användbar PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: den seedade Monte Carlo per lager konvergerar mot den slutna formen; jamming är den skarpaste vektorn för den korrelerade RF-baslinjen och det RF-immuna tröghetslagret är den avgörande överlevaren. Inte en certifierad produkt för navigeringstillgänglighet.

seg-4dd2bcc206db = Diagrammet som motorn skriver för scenarios/conflict-resilience.toml, typ conflict-resilience

seg-9a58a7b09423 = GPS-nekad navigering med gravitationskartmatchning: en kallatomsgravimeter återskapar en konstant INS-drift ur den sekvens av gravitationsanomalier som den flyger genom.

seg-c42d90057e9f = Diagrammet som motorn skriver för scenarios/gravity-map-nav.toml, kind gravity-map

seg-0d7bf5a4f07e = Terrängreferensnavigering utan GPS (TERCOM/SITAN): en radar- eller barohöjdmätare matchar markhöjdsprofilen mot en DEM av SRTM-typ för att återställa INS-drift.

seg-c5e33c7122e2 = Diagrammet som motorn skriver för scenarios/terrain-nav.toml, typ terrain-nav

seg-6bdc150ab25b = Sekventiell (rekursiv) terrängreferensnavigering utan GPS: ett partikelfilter kör mätmodellen för terrängmatchning epok för epok (SITAN som löpande filter) så att en tidsvarierande INS-drift följs längs spåret, medan den enskilda terrain-nav-satsen bara återställer en enda konstant förskjutning.

seg-4aca87f022dc = Diagrammet som motorn skriver för scenarios/terrain-slam.toml, typ terrain-slam

seg-4e31c8daf798 = Register

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-9d9aeff4f2ee = Källa: <c1/>

seg-d9fdaf3208ca = Alternativ PNT utan GPS (familj av scenariotyper)

seg-9fde6af9e09f = { "5" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-0d3b170b9fbc = Ämnessidor: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Kör en: <c1/>. Alla familjer: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Kontaktark med diagrammen som motorn skriver för typerna i familjen Alternativ PNT utan GPS

seg-cff60d8c17d2 = Sekventiell (rekursiv) terrängreferensnavigering utan GPS: ett partikelfilter kör mätmodellen för terrängmatchning epok för epok (SITAN som löpande filter) så att en tidsvarierande INS-drift följs längs spåret, medan den enskilda terrain-nav-satsen bara återställer en enda konstant förskjutning.

seg-9d8f69b51742 = MODELLED motståndskraft hos lagerbaserad PNT vid konflikt (P7): en användare i en omstridd miljö har flera PNT-lager (GNSS med öppen tjänst, bredbands-GNSS, en autentiserad konstellation, ett förstärkningsrelä), var och en med

seg-28486745bb43 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Valfria: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Valfria: <c13/>, <c14/>, <c15/>.

seg-9bd19903f577 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>terrain-nav</a1>.

seg-3ec7b38184b7 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valfria: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>terrain-slam</a1>.

seg-c5124441822e = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Valfria: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Föregående</s1>GNSS-mätningar positionsbestämning och integritet

seg-54b45b00a2f0 = <s1>Nästa</s1>Tröghets- fusions- och kvantsensorer
