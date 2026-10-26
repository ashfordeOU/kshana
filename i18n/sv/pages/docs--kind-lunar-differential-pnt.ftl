# docs--kind-lunar-differential-pnt: translations (sv)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-549a6103e711 = bit

seg-d0c9bec248b4 = Källa: <c1/>

seg-d226df2bb634 = <c1/> (scenariotyp)

seg-8ac5ac006ae7 = Modellerad lunar DIFFERENTIELL PNT (en lunar analog till DGNSS/SBAS): en referensstation av NovaMoon-klass på en KÄND selenografisk plats beräknar differentiella korrektioner per satellit för en ILLUSTRATIVE konstellation av Moonlight/LCNS-klass från offentliga källor (NovaMoon nämns endast som en systemKLASS, inte knutet till ESA), och en användare förskjuten med baseline_km tillämpar dem så att de GEMENSAMMA ban- och klockfelen tar ut varandra. Klocktermen tar ut sig SJÄLV EXAKT (en algebraisk identitet); bantermen lämnar bara kvar projektionen av skillnaden i siktlinje, som → { "0" } när baslinjen → { "0" } (golvet för rumslig dekorrelation) och växer ≈ linjärt med baslinjen. Redovisar användarens 3D-positionsfel MED respektive UTAN korrektioner, reduktionsfaktorn, kurvan för fel mot baslinje och en skyddsnivå för användaren som ÅTERANVÄNDER SBAS-maskineriet i DO-229E (crate::sbas) med det differentiella residualen σ. MODELLED — exakt identitet för bortagande + första ordningens dekorrelationsmodell; inte validerad med verkliga data; inget TRL, inget flygarv och inget stöd från någon myndighet. Deterministisk om den får ett frö.

seg-4b7355b174a3 = En körning av <c1/> sammanfattas som: lunar-differential-pnt | { "8" } sat. (illustrativt, LCNS-klass, inte knutet) | baslinje { "50" } km | användarfel { "24.46" } m → { "0.0077" } m ({ "3186" }× reduktion) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Exemplet <c1/> anger bland annat:

seg-8e67df89448a = Diagrammet som motorn skriver för scenarios/lunar-differential-pnt.toml, typ lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Differentiell referensstation av NovaMoon-klass: bortagande av gemensamt läge + residual som växer med baslinjen + DGNSS-skyddsnivåer. Oberoende referens (InternalConsistency): Identitet för differentiellt felbortagande + återanvändning av PL-maskineriet i DO-229E SBAS; lösningen med enkeldifferens + WLS korskontrolleras dessutom mot RTKLIB:s lsq()/matinv() (Takasu, BSD-2-Clause, kompilerad C) — oberoende lösarkod, men samma första ordningens algebra för skillnaden i siktlinje, så fortfarande InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De tre termer som en differentiell korrektion får mellan den epok den beräknas vid och den epok den används vid, var och en tidigare lämnad som omodellerat utrymme:. Oberoende referens (InternalConsistency): Slutna identiteter och självkonsistens: kvantiseringsvariansen step²/12 för likformig kvantiserare, den exakta kovarianspropageringen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ som kollapsar till σ·PDOP för lika σ, inmätningstermens överföring { "1" }:{ "1" } som en följd av û_user ≈ û_ref, samt slutning av kvadraturen vid bortkoppling. Korskontrollen av PDOP mot orbit::dop delar normalmatrisen [−û, { "1" }], så den är en konsistenskontroll och är märkt som en sådan i stället för som en

seg-f1e7283d2e15 = MODELLED — exakt identitet för bortagande + första ordningens dekorrelationsmodell; inte validerad med verkliga data; inget TRL, inget flygarv och inget stöd från någon myndighet. (typkatalog (<c1/>))

seg-9d54d8c07ca3 = ÄRLIGHET: MODELLED. Bortagandet av gemensamt läge är en EXAKT algebraisk identitet; residualen från rumslig dekorrelation är en geometrisk modell av FÖRSTA ORDNINGEN (projektionen av skillnaden i siktlinje för ett injicerat banfel), inte en anpassad dekorrelationsmodell från verklig månspårning. Användarens skyddsnivå ÅTERANVÄNDER skyddsnivåmaskineriet i DO-229E SBAS (crate::sbas) med det differentiella residualsigmat som fel per satellit (kommentar i scenariofilen, rad { "23" } till { "28" })

seg-4156a7515574 = ── KORREKTIONSLÄNKEN ────────────────────────────────────────────────────────────── Identiteten ovan förutsätter en PERFEKT korrektion: beräknad av en station som vet exakt var den står, levererad ögonblickligen, med oändlig upplösning. Inget av de tre gäller, och de tre indata nedan modellerar vad var och en kostar. De matar ENDAST blocket <c1/> i resultatdokumentet -- med alla tre på de värden som skrivs h (kommentar i scenariofilen, rad { "57" } till { "62" })

seg-e7f016777e09 = INMÄTNINGSFEL. Stationen bildar sin korrektion mot den koordinat den TROR på. Ett fel där följer med varje korrektion den sänder och når användaren som -delta . u_ref -- som inte innehåller någon användargeometri alls, så till skillnad från bantermen försvinner det varken vid noll baslinje eller växer med baslinjen, och det överförs ungefär ett till ett till användarens position. Standardvärdet { "0.30" } m är cratens egen lunara referens (kommentar i scenariofilen, rad { "64" } till { "70" })

seg-e0648d9b52b4 = KORREKTIONENS ÅLDRANDE. En korrektion beräknad vid t och tillämpad vid t+tau är föråldrad på två sätt. Bana: satelliten har RÖRT SIG, så den frusna banfelsvektorn projiceras nu på en roterad siktlinje; rotationen kommer från den här cratens egen propagator, så ingen felhastighet för banan antas någonstans. Klocka: satellitklockan har driftat med c*sigma_y(tau)*tau för full-RAFS-potenslagen i crate::clock_specs, kalibrerad den (kommentar i scenariofilen, rad { "73" } till { "79" })

seg-7171b2e3f29d = Lunar differentiell PNT är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Lunar differentiell PNT — residualbudget för korrektionslänken är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Ämnessida: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Föregående</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Nästa</s1>lunar-frame-campaign
