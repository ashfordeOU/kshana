# docs--kind-leo-pvt: translations (da)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = ingen værdi

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Emneside: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenarietype i motoren v{ $version }, familie <a1>Navigation i lav jordbane</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-c5478f572d21 = Familieside: <a1>Navigation i lav jordbane</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Kilde: <c1/>

seg-fdba999dab11 = <c1/> (scenarietype)

seg-093aac4b5ff1 = Fusioneret positionering, navigation og tidssynkronisering (PNT) i middel jordbane (MEO) og lav jordbane (LEO) over ENHVER konstellation: hvert [[system]] er en GNSS-forudindstilling af typen constellation-design, en LEO-forudindstilling (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, efemeridemodellen atomic-zero-clock eller en anden forudindstillingsfil, hver i sin egen fil med kilder mærket PUBLIC, WORKSHOP eller DERIVED), Walker-skaller eller eksplicitte elementsæt, med en bærebølge, en chiprate, en kuvert for bærebølge-til-støj-tæthed (C/N0) fra elevationsmasken til zenit, en afstandsfejl for signal i rummet (SISRE), en Doppler-sigma og en urmodel (dets eget modtagerur, så intersystembiasen estimeres, eller en kendt udsendt offset). Fire tilstande. DOPPLER: batch Gauss-Newton-positionering ud fra afstandsrate med analytiske partielle afledte, urdrift og valgfri hastighedstilstande og en valgfri højdebegrænsning, med én eller flere satellitter, fejlen mod vinduets længde, Doppler-, Doppler-rate- og jerk-kuverten for hvert LEO-system og nøjagtigheden langs og på tværs af banen for en enkelt passage mod forskydningen på tværs af banen (fejlen på tværs af banen vokser uden grænse, når passagen går over hovedet; en enkelt passage har også en spejlløsning på tværs af jordsporet). Et signal af opportunitet kun med Doppler (starlink-sop) kører her. JOINT: vægtede mindste kvadraters pseudoafstandsbestemmelser pr. epoke fra kun GNSS, kun LEO og begge, sigma pr. måling fra en termisk støjmodel for delay-lock-loop ved C/N0 plus SISRE (eller en fast sigma, så en signalmodel kan fodre dem), de estimerede intersystembiaser og PDOP/HDOP/VDOP mod antallet af tilføjede LEO-satellitter. POLAR: satellitter i sigte og DOP mod breddegrad for GNSS, LEO og begge. TIMING: tidsoverførsel til Coordinated Universal Time (UTC) fra LEO-satellitter i kendt position med et urfilter med to tilstande, hvis procesnøj kommer fra motorens oscillatorklasser, mod C/N0 og oscillatoren, og IS-GPS-200-udtrykket for systemtid til UTC; med [timing] trace = true rapporterer hver række også sin tidsfejl og forudsagte sigma ved hver epoke. VALIDATED: den største Doppler for en passage fra over hovedet til horisonten mod de offentliggjorte tal for Iridium (op til { "36" } kHz) og Xona Pulsar X1 ({ "32" } til { "34" } kHz). MODELLED: alt andet; DOP kontrolleres mod et håndafledt tilfælde, positionsbestemmelserne mod deres kovarians og Doppler-modellen mod identiteten for afstandsaccelerationen.

seg-f34d4bbcac4d = Én kørsel af <c1/> opsummeres sådan: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Eksemplet <c1/> angiver blandt andet:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-b43a7ee40372 = Resultatmærkat (motorens): MODELLED fælles vægtet mindste kvadraters pseudoafstandspositionering med ét ur pr. system eller en kendt offset; støj fra delay-lock-loop-modellen ved C/N0-kuverten plus afstandsfejlen for signal i rummet

seg-90361a6f4e3c = Diagrammet, som motoren skriver for scenarios/leo-pvt-fjord-skyline.toml, scenarietype leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-68aa305e05a4 = <b>VALIDATED</b> Eksakt afstandsrate for en satellit, hvis jordfaste position og hastighed kommer fra en bane med tolegemeproblem med den sekulære J2-drift og Jordens rotation (leo_fusion::geom::EarthOrbit::state, hastigheden er den eksakte tidsafledte af positionen), Tests: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Batch Gauss-Newton-positionering ud fra afstandsrate med analytiske partielle afledte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brugerhastighed som valgmulighed, en højdepseudomåling for en overfladebruger, dæmpet s Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Vægtede mindste kvadraters Gauss-Newton-bestemmelser over enhver blanding af systemer, ét modtagerur pr. system (intersystembiasen estimeres sammen med positionen) eller en kendt udsendt offset på referencetidsskalaen; sigma pr. måling leveret af Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Urmålinger fra hver LEO-satellit i sigte i en kendt position, kombineret med invers varians ud fra pseudoafstandsstøjmodellen, filtreret af et Kalman-filter med to tilstande (fase, frekvens), hvis procesnøj er oscillatorklassens w Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = og { "1" } flere i matrixen.

seg-f6bd93155e41 = <b>MODELLED</b> Vægtede mindste kvadraters Gauss-Newton-bestemmelser over enhver blanding af systemer, ét modtagerur pr. system (intersystembiasen estimeres sammen med positionen) eller en kendt. Uafhængig reference (InternalConsistency): Et håndafledt DOP med fire satellitter (én satellit i zenit og tre på horisonten med { "120" } deg mellemrum, hvis normalmatrix inverteres i hånden), den strukturelle identitet, at et system med sit eget ur og én satellit ikke tilføjer nogen geometri, støjfri genfinding af position, ur og bias samt seedede fejl mod kovariansen. Kun interne kontroller; ikke sammenlignet med en modtagers output. { "0.30" } ekstern sammenligning, et fund

seg-4056b0470099 = <b>MODELLED</b> Systemagnostiske input: hvert system er Walker-skaller, eksplicitte elementer eller en GNSS-forudindstilling, et signal (bærebølge, chiprate, båndbredde, modtaget effekt eller C/N0-område. Uafhængig reference (InternalConsistency): Afskrift af de citerede offentlige værdier, kontrolleret for struktur (hver offentlig kilde har en URL, Walker-mønstre går op, C/N0 ud fra modtaget effekt over kT ved { "290" } K), ikke mod en ekstern uafhængig reference. Repræsentative værdier er navngivet i hver forudindstilling og er illustrative

seg-df745ccdaceb = MODELLED fælles vægtet mindste kvadraters positionsbestemmelse ud fra pseudoafstande med ét ur pr. system eller en kendt forskydning; støj fra delay-lock-loop-modellen ved C/N0-envelopen plus signal-in-space-afstandsfejlen (resultat <c1/>)

seg-c988291eb41d = MODELLED: alt andet; DOP kontrolleres mod et håndafledt tilfælde, positionsbestemmelserne mod deres kovarians, og Doppler-modellen mod identiteten for afstandsaccelerationen. (kategori-katalog (<c1/>))

seg-be908356ad19 = Skyline-forudindstillingen er REPRÆSENTATIV (proveniens i docs/SKYLINE.md og <c1/>): af samme størrelsesorden som bredden og relieffet i de dybe vestnorske fjorde, ikke en opmåling af nogen bestemt fjord. Kun sigtelinje: ingen diffraktion, refleksion eller modtagelse uden sigtelinje. Fjern afsnittet [skyline] for at sammenligne med åben himmel. MODELLED. (kommentar i scenariefilen, linje { "15" } til { "18" })

seg-1d0ab26930e1 = Fælles GNSS- og LEO-positionsbestemmelse ud fra pseudoafstande med intersystembiaser og fejlmodeller pr. signal er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Navngivne LEO-PNT-systemer som valgfrie dataforudindstillinger, hver med sin kilde, er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Forrige</s1>leo-ppp

seg-458b3eda3250 = <s1>Næste</s1>leo-signal
