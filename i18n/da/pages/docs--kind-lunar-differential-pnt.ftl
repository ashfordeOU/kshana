# docs--kind-lunar-differential-pnt: translations (da)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-549a6103e711 = bit

seg-d0c9bec248b4 = Kilde: <c1/>

seg-d226df2bb634 = <c1/> (scenarietype)

seg-8ac5ac006ae7 = Modelleret lunar DIFFERENTIEL PNT (en lunar DGNSS/SBAS-analog): en referencestation af NovaMoon-klassen på et KENDT selenografisk sted beregner differentialkorrektioner pr. satellit ud fra en ILLUSTRATIVE konstellation af Moonlight/LCNS-klassen fra offentlige kilder (NovaMoon omtales kun som en SYSTEMKLASSE, ikke tilknyttet ESA), og en bruger, der er forskudt med baseline_km, anvender dem, så de FÆLLES orbit- og urfejl ophæves. Urleddet ophæves PRÆCIST (en algebraisk identitet); orbitleddet efterlader kun projektionen af sigtelinjeforskellen, som → { "0" }, når baseline → { "0" } (gulvet for rumlig dekorrelation), og vokser ≈ lineært med baseline. Rapporterer brugerens 3D-positionsfejl MED og UDEN korrektioner, reduktionsfaktoren, kurven for fejl mod baseline og et brugerbeskyttelsesniveau, der GENBRUGER DO-229E SBAS-maskineriet (crate::sbas) med differentialresten σ. MODELLED — præcis ophævelsesidentitet + førsteordens dekorrelationsmodel; ikke valideret med reelle data; ingen TRL-, heritage- eller myndighedsstøtte. Deterministisk, hvis seedet.

seg-4b7355b174a3 = Én kørsel af <c1/> opsummeres som: lunar-differential-pnt | { "8" } sats (illustrative LCNS-class, not affiliated) | baseline { "50" } km | user error { "24.46" } m → { "0.0077" } m ({ "3186" }× reduction) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Eksemplet <c1/> sætter blandt andet:

seg-8e67df89448a = Diagrammet, som motoren skriver for scenarios/lunar-differential-pnt.toml, type lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Differentiel referencestation af NovaMoon-klassen: ophævelse af fælles fejl + rest, der vokser med baseline + DGNSS-beskyttelsesniveauer. Uafhængig reference (InternalConsistency): Identitet for differentiel fejlophævelse + genbrug af DO-229E SBAS PL-maskineriet; single-difference + WLS-løsningen er desuden krydskontrolleret mod RTKLIB's lsq()/matinv() (Takasu, BSD-2-Clause, kompileret C) — uafhængig solverkode, men den samme førsteordens LOS-differensalgebra, så den er stadig InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De tre led, som en differentialkorrektion opsamler mellem den epoke, den beregnes ved, og den epoke, den anvendes ved, hver tidligere efterladt som ikke-modelleret spillerum:. Uafhængig reference (InternalConsistency): Identiteter i lukket form og selvkonsistens: kvantiseringens trinvarians step²/12, den præcise kovariansudbredelse (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, der falder sammen til σ·PDOP ved ens σ, opmålingsleddets overførsel { "1" }:{ "1" } som en følge af û_user ≈ û_ref og kvadraturlukning ved frakobling. PDOP-krydskontrollen mod orbit::dop deler normalmatrixen [−û, { "1" }], så den er en konsistenskontrol og er mærket som sådan i stedet for en uafhængig

seg-f1e7283d2e15 = MODELLED — præcis ophævelsesidentitet + førsteordens dekorrelationsmodel; ikke valideret med reelle data; ingen TRL-, heritage- eller myndighedsstøtte. (kategori-katalog (<c1/>))

seg-9d54d8c07ca3 = ÆRLIGHED: MODELLED. Ophævelsen af fælles fejl er en PRÆCIS algebraisk identitet; resten fra rumlig dekorrelation er en FØRSTEORDENS geometrisk model (projektionen af sigtelinjeforskellen for en tilført orbitfejl), ikke en tilpasset dekorrelationsmodel ud fra reel lunar sporing. Brugerens beskyttelsesniveau GENBRUGER DO-229E SBAS-maskineriet for beskyttelsesniveauer (crate::sbas) med differentialrestens sigma som fejl pr. satellit (kommentar i scenariefilen, linje { "23" } til { "28" })

seg-4156a7515574 = ── KORREKTIONSLINKET ────────────────────────────────────────────────────────────── Identiteten ovenfor forudsætter en PERFEKT korrektion: beregnet af en station, der ved præcis, hvor den står, leveret øjeblikkeligt, med uendelig opløsning. Ingen af de tre forudsætninger holder, og de tre input nedenfor modellerer, hvad hver af dem koster. De indgår KUN i blokken <c1/> i resultatdokumentet -- med alle tre ved de værdier, der er skrevet h (kommentar i scenariefilen, linje { "57" } til { "62" })

seg-e7f016777e09 = OPMÅLINGSFEJL. Stationen danner sin korrektion mod den koordinat, den TROR på. En fejl dér følger med på hver korrektion, den udsender, og når brugeren som -delta . u_ref -- som slet ikke indeholder nogen brugergeometri, så i modsætning til orbitleddet forsvinder den hverken ved nul baseline eller vokser med baseline, og den overføres cirka én til én til brugerens position. Standardværdien { "0.30" } m er cratens egen lunare reference (kommentar i scenariefilen, linje { "64" } til { "70" })

seg-e0648d9b52b4 = KORREKTIONENS ALDER. En korrektion, der er beregnet ved t og anvendt ved t+tau, er forældet på to måder. Orbit: satellitten har BEVÆGET sig, så den frosne orbitfejlvektor nu projiceres på en drejet sigtelinje; rotationen kommer fra denne crates egen propagator, så der antages ingen orbitfejlrate nogen steder. Ur: satellituret har drevet med c*sigma_y(tau)*tau for den fulde RAFS-potenslov i crate::clock_specs, kalibreret (kommentar i scenariefilen, linje { "73" } til { "79" })

seg-7171b2e3f29d = Lunar differentiel PNT er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Lunar differentiel PNT — restbudget for korrektionslinket er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Emneside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Forrige</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Næste</s1>lunar-frame-campaign

seg-e66e2ca31e54 = Emneside: <a1>MISSION-THREAD-LUNAR.md</a1>
