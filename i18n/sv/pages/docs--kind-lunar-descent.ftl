# docs--kind-lunar-descent: translations (sv)

seg-f942b36a11c4 = Ännu inte på GitHub

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de andra finns i <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotyp i motorn v{ $version }, familj <a1>Månen och cislunart rum</a1>. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en säkerhetskritisk tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Månen och cislunart rum</a1>

seg-6a26b9ab59fe = Ämnessida: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Resultatetikett (motorns): MODELLED

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e66e2ca31e54 = Ämnessida: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Källa: <c1/>

seg-d4df5aa9b7b0 = <c1/> (scenariotyp)

seg-2cd0d5385530 = MODELLED budget för landningsspridning för en driven nedstigning till en plats nära sydpolen (Artemis-klass). Per horisontell axel drivs en inertiell felmodell med fem tillstånd (position, hastighet, accelerometerbias, lutning i attityd, gyrobias) av nedstigningens specifika kraft; ett sekventiellt filter tar positionsbestämningar från de aktiverade stöden: en AFS-positionsbestämning från de synliga reläerna i en ILLUSTRATIVE konstellation i LCNS-klass (fristående, eller differentiell med korrektionslänkens residual från lunar-differential-pnt, med klockan stödd när bara tre reläer är synliga) och en terrängrelativ positionsbestämning (cratens TERCOM/SITAN-matchare på ett syntetiskt relief, eller Cramer-Rao-gränsen för matchning av ett höjdfönster i den verkliga LOLA-DEM:en för sydpolen). Månens tid går in via fordonets klocka vid positionsbestämningarna (LTC-TT-offseten från lunar-time-offset, eller osäkerheten i dess publicerade band) och som ett tidsstämpelfel längs banan. Redovisar 3-sigma-landningsellipsen, R95, de inertiella källorna i sluten form, varje stöds bidrag, ablationen av varje kombination av stöd, en Monte Carlo-kalibrering av ellipsen och den överlämnade kovariansen. MODELLED: illustrativ IMU-klass, reläuppsättning, nedstigningsprofil och styrterm; terrain-nav använder ett syntetiskt relief på en jordmetersskala; AFS-tillgängligheten är en epok på en platt mask. Inte stött av någon rymdorganisation; rådgivande programvara, inte certifierad navigationsutrustning.

seg-c6c1a8f184ed = En körning av <c1/> sammanfattas som: lunar-descent | -89.50 deg | endast inertiell 517/517 m (Ö/N) | med stöd 7.6/4.8 m | spridning R95 { "51" } m | 3-sigma-ellips { "64" } x { "62" } m | { "99.1" } % innanför (förväntat { "98.9" } %) (MODELLED)

seg-dfdb7de68515 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Exemplet <c1/> anger bland annat:

seg-8073ece4c900 = Diagrammet som motorn skriver för scenarios/lunar-descent.toml, typ lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Typen och fasen <c1/>: en inertiell felmodell med fem tillstånd per axel (position, hastighet, accelerometerbias, lutning, gyrobias) över en driven nedstigning, stödd av AFS-positionsbestämningar (fristående eller differentiella, med fallet med tre reläer och klockstöd

seg-bfe4c0a04288 = <b>MODELLED</b> Typen och fasen <c1/>: en inertiell felmodell med fem tillstånd per axel (position, hastighet, accelerometerbias, lutning, gyrobias) över en driven nedstigning,. Oberoende referens (InternalConsistency): Den inertiella driften i sluten form, de återanvända typernas egna resultat och kalibreringen av 3-sigma-ellipsen (andelen innanför stämmer med sin förväntan) i testerna. Ingen genomförd eller testad landning jämförs

seg-ed286f215c96 = MODELLED budget för landningsspridning för en driven nedstigning till en plats nära sydpolen (Artemis-klass). (typkatalog (<c1/>))

seg-c1bd92ba429b = MODELLED: illustrativ IMU-klass, reläuppsättning, nedstigningsprofil och styrterm; terrain-nav använder ett syntetiskt relief på en jordmetersskala; AFS-tillgängligheten är en epok på en platt mask. (typkatalog (<c1/>))

seg-85714bc3cf2a = ÄRLIGHET: MODELLED. IMU-klassen, nedstigningsprofilen, reläuppsättningen, signalfelet i rymden och styrtermen är ILLUSTRATIVE indata, inte mätningar. Terrängläget terrain-nav använder det fristående syntetiska reliefet och en jordmetersskala, så terrängtermen här är matcharens beteende på en ersättning, inte ett påstående om reliefen vid sydpolen: varianten lola-crlb (lunar-descent-lola.toml) använder det verkliga (kommentar i scenariofilen, rad { "14" } till { "20" })

seg-3eb1b3b03600 = Budget för landningsspridning vid en polarplats på månen (<c1/>) är MODELLED, inte validerad: kontrollerad mot sin egen identitet i sluten form / analytisk identitet — fångar överföringsfel och koefficientfel, men är inte en extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Föregående</s1>lunar-beacon

seg-ca9b68783354 = <s1>Nästa</s1>lunar-differential-pnt
