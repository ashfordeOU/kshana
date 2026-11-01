# docs--kind-lunar-orbit-rendezvous: translations (sv)

seg-34bdcfd66ded = I den gren i arkivet som dessa dokument kommer från; ännu inte på GitHub

seg-f942b36a11c4 = Ännu inte på GitHub

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de andra finns i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariotyp i motorn v{ $version }, familj <a1>Månen och cislunart rum</a1>. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en säkerhetskritisk tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Månen och cislunart rum</a1>

seg-6a26b9ab59fe = Ämnessida: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultatetikett (motorns): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Propagatorn som månens typer delar (GRAIL GL0660B grad och ordning { "150" }, jorden och solen som tredje kroppar, relativitet, DE440-månorientering) jämförd med de offentl. Oberoende referens (ExternalDataset): JPL Horizons rymdfarkostefemerider för LRO och CAPSTONE, mot trösklar som fastställts i förväg i xval/mission-thread-lunar/PREREGISTRATION.md (tillägg { "1" } till { "6" }). LRO: MET, { "33" } m största 3D-skillnad och { "2.4" } m radiellt RMS mot { "500" } m och { "60" } m. CAPSTONE: NOT MET, en skillnad i slutposition på { "136.8" } km mot { "25" } km och en skillnad i periapsis på { "28.4" } km mot { "10" } km, orsakerna är inte isolerade. Raden är modellerad eftersom CAPSTON

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e482c9896140 = Propageringen med månens kraftmodell mot offentliga rekonstruerade banor för månsatelliter och cislunara banor är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätter ihop modellerade delar, så förmågan förblir modellerad. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Ämnessida: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Källa: <c1/>

seg-8beb22a0eb0b = <c1/> (scenariotyp)

seg-2deefd8c547b = MODELLED relativ navigering för en dockning i Orion-landarstil i en låg månbana eller en elliptisk polär bana (Artemis-klass). En jagare och ett mål flyger i samma bana under cratens månkraftmodell; en gemensam Gauss-Newton-skattning i satser med 21 parametrar över bågen (två fordonstillstånd och bestående bias i signal i rymden) sammanför en absolut positionsbestämning per fordon från en ILLUSTRATIVE reläuppsättning i LCNS-klass (reläer bakom månen utelämnade, fyra behövs, det gemensamma signalfelet i rymden tar ut sig mellan fordonen) och ett avstånd över länken mellan fordonen, med avståndsprecision från kodspårningsgränsen för LunaNet AFS-piloten. Redovisar det formella och Monte Carlo-baserade relativa positions- och hastighetsfelet i målets LVLH-axlar, tillgängligheten för positionsbestämning, det genomsnittliga normaliserade kvadratiska skattningsfelet mot sitt förväntade värde, och varje försök vars iteration inte konvergerade, driften av att bortse från gravitationsharmonikerna och hela 6x6-kovariansen som överlämnas. En kontroll i sluten form med Hill/Clohessy-Wiltshire gäller för det cirkulära fallet. MODELLED: illustrativ reläuppsättning, felbudget och a priori-fördelningar; referensen och skattaren delar en kraftmodell, så NEES kontrollerar självkonsistens och inte modellfel. Inte stött av någon rymdorganisation; rådgivande programvara, inte certifierad navigationsutrustning.

seg-a6d29fc5f19b = En körning av <c1/> sammanfattas som: lunar-orbit-rendezvous | llo 100x100 km | avst { "2000" } m | positionsbestämningar { "74" } % | rel pos 1-sigma R/A/C 0.03/0.06/0.04 m | genomsnittlig NEES { "6.51" } ({ "6" } förväntat) | konvergerade vid { "2000" } s (MODELLED)

seg-b7c86affeac1 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Exemplet <c1/> anger bland annat:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Rådgivande programvara, inte certifierad navigat

seg-4466fb6f4043 = Gauss-Newton i satser över bågen

seg-d97b2505ac72 = Diagrammet som motorn skriver för scenarios/lunar-orbit-rendezvous.toml, typ lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Typen och fasen <c1/>: en gemensam Gauss-Newton-skattning i satser för två fordon över bågen (tjugoett parametrar: båda tillstånden och bestående positionsbias i signal i rymden, gemensamma och oberoende), uppbyggd över en kvarts, en h Tester: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Typen och fasen <c1/>: en gemensam Gauss-Newton-skattning i satser för två fordon över bågen (tjugoett parametrar: båda tillstånden och bestående sig. Oberoende referens (InternalConsistency): Självkonsistens under en förhandsregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultat och skattarens historik i RESULTS.md): den genomsnittliga NEES för det relativa tillståndet är { "5.85" } till { "5.93" } mot bandet { "5.2" } till { "6.8" } i fyra konfigurationer, MET på den fjärde skattarutformningen efter att tre utformningar med sekventiella filter missat; referensen och skattaren delar en kraftmodell, så detta säger ingenting om modellfel. Propagatorn d

seg-b2f273ea732d = MODELLED relativ navigering för en dockning i Orion-landarstil i en låg månbana eller en elliptisk polär bana (Artemis-klass). (typkatalog (<c1/>))

seg-9d4f99557cc5 = MODELLED: illustrativ reläuppsättning, felbudget och a priori-fördelningar; referensen och skattaren delar en kraftmodell, så NEES kontrollerar självkonsistens och inte modellfel. (typkatalog (<c1/>))

seg-158e44d47c0b = ÄRLIGHET: MODELLED. Reläuppsättningen, signalfelet i rymden, den gemensamma andelen och a priori-fördelningarna är ILLUSTRATIVE indata, inte mätningar; referensen och skattaren delar kraftmodellen (en inbyggd central term, J2 och C22). Den förhandsregistrerade konsistenskontrollen B1 (genomsnittlig NEES i [{ "5.2" }, { "6.8" }]) nås i alla fyra konfigurationerna på satsutformningen: se xval/mission-thread-lunar/RESULTS.md. Ingen samstämmighet med något ve (kommentar i scenariofilen, rad { "10" } till { "14" })

seg-2a88a9650804 = Relativ navigering till dockning i en månbana (<c1/>) är MODELLED, inte validerad: kontrollerad mot sin egen identitet i sluten form / analytisk identitet — fångar överföringsfel och koefficientfel, men är inte en extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Föregående</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Nästa</s1>lunar-station-coverage
