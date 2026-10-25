# docs--kind-eo-radiometry: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-8e62cc4af6ea = Ämnessida: <a1>ENTRY-EO-ASCENT.md</a1>

seg-841259b04897 = Källa: <c1/>

seg-1b0ba13fcef1 = <c1/> (scenario kind)

seg-816bd5a5808a = Radiometri och bildkvalitet för en nadirkamera: radians vid aperturen för en lambertsk scen, kameraekvationen, signal samt skott-/mörker-/avläsnings-/kvantiseringsbrus och SNR; systemets MTF vid Nyquist (diffraktion x detektor x smetning x jitter), det relativa kantsvaret utifrån den, Q = lambda F/p och GIQE version { "4" } NIIRS utan MTF-kompensation. MODELLED.

seg-7d786a7bfb86 = En körning av <c1/> sammanfattas som: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (well { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

seg-3378b7b0716f = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-d613181f3fe3 = Exemplet <c1/> anger bland annat:

seg-ffb002276b21 = um

seg-1c15591babed = px

seg-e94f9ad9e6c4 = Resultatetikett (motorns egen): MODELLED — radiometri för en nadirkamera (lambertsk scen, kameraekvation, skott-/mörker-/avläsnings-/kvantiseringsbrus), system-MTF vid Nyquist (diffraktion x detektor x smetning x jitter), relativt kantsvar, Q = lambda F/p och GIQE { "4" } NIIRS utan MTF-kompensation; NIIRS är en empirisk regression på modell

seg-bf7b52f7a01e = Diagrammet som motorn skriver för scenarios/eo-radiometry.toml, kind eo-radiometry

seg-562a7cf2859c = <b>MODELLED</b> Signal-brusbudget för en nadirkamera (radians från en lambertsk scen, kameraekvation, skott-, mörker-, avläsnings- och kvantiseringsbrus), system-MTF vid Nyquist som produkten av diffraktion för en oskymd apertur, detektorapertur, linjär smetning och Gaus

seg-dadea618d757 = <b>MODELLED</b> Signal-brusbudget för en nadirkamera (radians från en lambertsk scen, kameraekvation, skott-, mörker-, avläsnings- och kvantiseringsbrus), system-MTF vid Nyquist som produkten. Oracle (InternalConsistency): Slutna former: diffraktions-MTF vid halv gränsfrekvens, ettpixlig rampkant för en ren detektorapertur (RER { "1" }), normalfördelningens kantsvar för en gaussisk oskärpa (RER = erf(0.5/(sigma sqrt { "2" }))), skalning av skottbrus och GIQE { "4" }-koefficienterna som publicerade (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). VAD SOM INTE GÄLLER: ingen extern kamera, uppmätt MTF eller klassad bild har jämförts; GIQE är en empirisk regression med sin

seg-5182b4b0f8d6 = MODELLED — radiometri för en nadirkamera (lambertsk scen, kameraekvation, skott-/mörker-/avläsnings-/kvantiseringsbrus), system-MTF vid Nyquist (diffraktion x detektor x smetning x jitter), relativt kantsvar, Q = lambda F/p och GIQE { "4" } NIIRS utan MTF-kompensation; NIIRS är en empirisk regression på modellerade indata, inte en klassad bild (result <c1/>)

seg-b2f1e6466c2c = Radiometri och bildkvalitet för en ILLUSTRATIV liten jordobservationskamera (ingen operatörs utformning): { "0.40" } m apertur, { "3.6" } m brännvidd (F/9), { "5.5" } um pixlar, från { "500" } km. Körningen ger signal-brusbudgeten för en scen med { "15" } % reflektans, system-MTF vid Nyquist, det relativa kantsvaret och GIQE version { "4" } NIIRS. MODELLED: NIIRS är en empirisk regression utvärderad på modellerade indata, n (scenario file comment, lines { "1" } to { "5" })

seg-aaf9ed3b0899 = Radiometri, MTF, relativt kantsvar och GIQE { "4" } NIIRS för elektrooptiska kameror är MODELLED, inte validerade: kontrollerade mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-d6c92dc655ab = <s1>Föregående</s1>eo-coverage

seg-a0daef9a496e = <s1>Nästa</s1>ephemeris
