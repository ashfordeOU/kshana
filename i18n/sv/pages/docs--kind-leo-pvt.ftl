# docs--kind-leo-pvt: translations (sv)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = inget värde

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Ämnessida: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Källa: <c1/>

seg-fdba999dab11 = <c1/> (scenariotyp)

seg-093aac4b5ff1 = Sammanvägd positionering, navigering och tidssynkronisering (PNT) med satelliter i medelhög omloppsbana (MEO) och låg omloppsbana (LEO) över VILKA konstellationer som helst: varje [[system]] är en GNSS-förinställning av typen constellation-design, en LEO-förinställning (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, efemerismodellen atomic-zero-clock eller en annan förinställningsfil, var och en i sin egen fil med källor märkta PUBLIC, WORKSHOP eller DERIVED), Walker-skal eller explicita elementuppsättningar, med en bärvåg, en chipfrekvens, ett hölje för bärvåg-till-brustäthet (C/N0) från elevationsmasken till zenit, ett signal-i-rymden-avståndsfel (SISRE), ett Doppler-sigma och en klockmodell (egen mottagarklocka, så att intersystemförskjutningen skattas, eller en känd utsänd förskjutning). Fyra lägen. DOPPLER: batch-positionering med Gauss-Newton utifrån avståndshastighet med analytiska partialderivator, klockdrift och valfria hastighetstillstånd samt en valfri höjdbegränsning, med en eller flera satelliter, felet mot fönsterlängd, höljet för Doppler, Doppler-hastighet och ryck för varje LEO-system, och noggrannheten längs och tvärs banan för en enda överflygning mot tvärförskjutningen (felet tvärs banan växer obegränsat när överflygningen går rakt över; en enda överflygning har också en spegellösning över marksparet). En signal av opportunitet med enbart Doppler (starlink-sop) körs här. JOINT: viktade minsta kvadrat-pseudoavståndslösningar per epok från enbart GNSS, enbart LEO och båda, sigma per mätning från en termisk brusmodell för fördröjningslåsningsslingan vid C/N0 plus SISRE (eller ett fast sigma, så att en signalmodell kan mata dem), de skattade intersystemförskjutningarna samt PDOP/HDOP/VDOP mot antalet tillagda LEO-satelliter. POLAR: satelliter i sikte och DOP mot latitud för GNSS, LEO och båda. TIMING: tidsöverföring till koordinerad universell tid (UTC) från LEO-satelliter på en känd position med ett klockfilter med två tillstånd vars processbrus kommer från motorns oscillatorklasser, mot C/N0 och oscillatorn, samt uttrycket i IS-GPS-200 för systemtid till UTC; med [timing] trace = true redovisar varje rad också sitt tidsfel och förutsagda sigma vid varje epok. VALIDATED: den största Doppler för en överflygning från zenit till horisont mot de publicerade siffrorna för Iridium (upp till { "36" } kHz) och Xona Pulsar X1 ({ "32" } till { "34" } kHz). MODELLED: allt annat; DOP kontrolleras mot ett handhärlett fall, lösningarna mot sin kovarians och Dopplermodellen mot identiteten för avståndsacceleration.

seg-f34d4bbcac4d = En körning av <c1/> sammanfattas som: LEO PVT (joint) vid { "61.10" }, { "6.60" } under { "1800" } s GPS gnss { "24" } sat. på { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sat. på { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sat. på { "1080" } km, { "1190.52" } MHz LEO-avståndsmätande satellit i sikte under { "100.0" }% av epokerna endast GNSS tillgänglighet { "1.000" }, median PDOP { "1.48" }, RMS 3D-fel { "1.29" } m endast LEO tillgänglighet { "1.000" }, median PDOP { "2.33" }, RMS 3D-fel { "0.69" } m sammanvägd tillgänglighet { "1.000" }, median PDOP { "1.14" }, RMS 3D-fel { "0.63" } m

seg-e271a69236bf = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Exemplet <c1/> anger bland annat:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-b43a7ee40372 = Resultatetikett (motorns egen): MODELLED sammanvägd viktad minsta kvadrat-positionering med pseudoavstånd med en klocka per system eller en känd förskjutning; brus från modellen för fördröjningslåsningsslingan vid C/N0-höljet plus signal-i-rymden-avståndsfelet

seg-90361a6f4e3c = Diagrammet som motorn skriver för scenarios/leo-pvt-fjord-skyline.toml, typ leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-68aa305e05a4 = <b>VALIDATED</b> Exakt avståndshastighet för en satellit vars jordfasta position och hastighet kommer från en tvåkroppsbana med den sekulära J2-driften och jordens rotation (leo_fusion::geom::EarthOrbit::state, hastigheten är den exakta tidsderivatan av positionen), Tester: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Batch-positionering med Gauss-Newton utifrån avståndshastighet med analytiska partialderivator (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant användarhastighet som tillval, en höjdpseudomätning för en användare på ytan, dämpad s Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Viktade minsta kvadrat-lösningar med Gauss-Newton över valfri blandning av system, en mottagarklocka per system (intersystemförskjutningen skattas tillsammans med positionen) eller en känd utsänd förskjutning på referenstidsskalan; sigma per mätning levereras av Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Klockmätningar från varje LEO-satellit i sikte på en känd position, kombinerade med inversvarians utifrån pseudoavståndsbrusmodellen, filtrerade av ett Kalmanfilter med två tillstånd (fas, frekvens) vars processbrus är oscillatorklassens w Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = och { "1" } till i matrisen.

seg-f6bd93155e41 = <b>MODELLED</b> Viktade minsta kvadrat-lösningar med Gauss-Newton över valfri blandning av system, en mottagarklocka per system (intersystemförskjutningen skattas tillsammans med positionen) eller en känd . Oberoende referens (InternalConsistency): En handhärledd DOP för fyra satelliter (en satellit i zenit och tre på horisonten med { "120" } deg mellanrum, vars normalmatris inverteras för hand), den strukturella identiteten att ett system med egen klocka och en satellit inte tillför någon geometri, brusfri återvinning av position, klocka och förskjutning samt fel från ett frö mot kovariansen. Endast interna kontroller; inte jämfört med en mottagares utdata. { "0.30" } extern jämförelse, ett fynd

seg-4056b0470099 = <b>MODELLED</b> Systemoberoende indata: varje system är Walker-skal, explicita element eller en GNSS-förinställning, en signal (bärvåg, chipfrekvens, bandbredd, mottagen effekt eller C/N0-intervall. Oberoende referens (InternalConsistency): Överföring av de citerade offentliga värdena, kontrollerad för struktur (varje offentlig källa har en webbadress, Walker-mönster delas jämnt, C/N0 från mottagen effekt över kT vid { "290" } K), inte mot en extern oberoende referens. Representativa värden namnges i varje förinställning och är illustrativa

seg-df745ccdaceb = MODELLED sammanvägd viktad minsta kvadrat-positionering med pseudoavstånd med en klocka per system eller en känd förskjutning; brus från modellen för fördröjningslåsningsslingan vid C/N0-höljet plus signal-i-rymden-avståndsfelet (resultat <c1/>)

seg-c988291eb41d = MODELLED: allt annat; DOP kontrolleras mot ett handhärlett fall, lösningarna mot sin kovarians och Dopplermodellen mot identiteten för avståndsacceleration. (typkatalog (<c1/>))

seg-be908356ad19 = Skylineförinställningen är REPRESENTATIVE (ursprung i docs/SKYLINE.md och <c1/>): storleksordningen på bredd och relief hos de djupa västnorska fjordarna, inte en kartläggning av någon fjord. Endast fri sikt: ingen diffraktion, reflektion eller mottagning utan fri sikt. Ta bort avsnittet [skyline] för att jämföra med öppen himmel. MODELLED. (kommentar i scenariofilen, rad { "15" } till { "18" })

seg-1d0ab26930e1 = Gemensam positionering med pseudoavstånd från GNSS och LEO med intersystemförskjutningar och felmodeller per signal är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Namngivna LEO-PNT-system som valfria dataförinställningar, var och en med sin källa, är MODELLED, inte validerade: kontrollerade mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Föregående</s1>leo-ppp

seg-458b3eda3250 = <s1>Nästa</s1>leo-signal
