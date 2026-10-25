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

seg-8ac5ac006ae7 = Modellerad lunar DIFFERENTIELL PNT (en lunar analog till DGNSS/SBAS): en referensstation av NovaMoon-klass på en KÄND selenografisk plats beräknar differentiella korrektioner per satellit för en ILLUSTRATIV konstellation av Moonlight/LCNS-klass från offentliga källor (NovaMoon nämns endast som en systemKLASS, inte knutet till ESA), och en användare förskjuten med baseline_km tillämpar dem så att de GEMENSAMMA ban- och klockfelen tar ut varandra. Klocktermen tar ut sig SJÄLV EXAKT (en algebraisk identitet); bantermen lämnar bara kvar projektionen av skillnaden i siktlinje, som → { "0" } när baslinjen → { "0" } (golvet för rumslig dekorrelation) och växer ≈ linjärt med baslinjen. Redovisar användarens 3D-positionsfel MED respektive UTAN korrektioner, reduktionsfaktorn, kurvan för fel mot baslinje och en skyddsnivå för användaren som ÅTERANVÄNDER SBAS-maskineriet i DO-229E (crate::sbas) med det differentiella residualen σ. MODELLED — exakt identitet för bortagande + första ordningens dekorrelationsmodell; inte validerad med verkliga data; inget TRL, inget flygarv och inget stöd från någon myndighet. Deterministisk om den får ett frö.

seg-4b7355b174a3 = En körning av <c1/> sammanfattas som: lunar-differential-pnt | { "8" } sat. (illustrativt, LCNS-klass, inte knutet) | baslinje { "50" } km | användarfel { "24.46" } m → { "0.0077" } m ({ "3186" }× reduktion) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>
