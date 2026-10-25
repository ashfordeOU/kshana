# docs--kind-ntn-positioning: translations (sv)

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Ämnessida: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-8dcdfc5da900 = Källa: <c1/>

seg-d865fd8ceef6 = <c1/> (scenariotyp)

seg-4f0edb786a35 = Positionering från en icke-jordbunden 5G-nätverksnedlänk (NTN) i S-bandet för mobila satellittjänster (MSS) (3GPP-band n256, nedlänk { "2170" } till { "2200" } MHz; standardbärvåg { "2172.5" } MHz): Cramér-Rao-gränsen (CRB) för ankomsttid, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) där beta är den kvadratiska medelvärdesbandbredden (Gabor) för det plana OFDM-spektrumet (B/sqrt({ "12" })), och för Doppler hos en komplex ton, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), för varje signal (som standard en { "5" } MHz New Radio-kanal med { "4.5" } MHz upptaget och en { "200" } kHz smalbandskanal med { "180" } kHz upptaget); därefter, över valfri LEO-konstellation, positionsbestämningar med ankomsttid i nedlänk med en okänd mottagarklocka (med slumpfrö, med gränsen plus ett synkroniseringsfel i nätverket som sigma), deras PDOP och formella 3D-sigma, samt en positionsbestämning med Doppler från en enda satellit över den längsta passagen med höjden hållen fast. MODELLED: steget från bandbredd till gräns är den läroboksmässiga slutna formen, kontrollerad mot numerisk integration av de plana och bandbegränsade BPSK-spektrumen (intern konsistens, inget publicerat räknat exempel fastlagt), och positioneringsnoggrannheten är en gräns på en kanal utan flervägsutbredning med ett angivet synkroniseringsfel, inte ett uppnått resultat.

seg-fea5da29df00 = En körning av <c1/> sammanfattas som: 5G NTN positioning at { "2172.5" } MHz, C/N0 { "38" } to { "50" } dB-Hz, { "324" } satellites ({ "10.0" } in view) NR { "5" } MHz: { "4500" } kHz, CRB range { "0.26" } to { "1.03" } m; median formal 3D { "2.09" } m, RMS error { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB range { "6.49" } to { "25.85" } m; median formal 3D { "25.94" } m, RMS error { "26.73" } m one-satellite Doppler pass: { "53" } samples over { "520" } s, horizontal error { "1.9" } m

seg-145582d62c8c = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Exemplet <c1/> anger bland annat:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = index

seg-3a0cde9988c3 = Resultatetikett (motorns egen): MODELLED positionering från Cramér-Rao-gränser: steget från bandbredd till gräns är en läroboksmässig sluten form (kontrollerad mot numerisk integration, inte mot ett publicerat räknat exempel); noggrannheten är en gräns på en kanal utan flervägsutbredning med ett angivet synkroniseringsfel, inte ett uppnått resultat

seg-c200240dd65e = Diagrammet som motorn skriver för scenarios/ntn-5g-positioning.toml, typ ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Cramér-Rao-gränsen för ankomsttid från den kvadratiska medelvärdesbandbredden (Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), för ett plant OFDM-spektrum (beta = B/sqrt({ "12" })), ett bandbegränsat BPSK-spektrum (täljare i sluten form) eller valfritt spektrum genom kvadratur Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Cramér-Rao-gränsen för ankomsttid från den kvadratiska medelvärdesbandbredden (Gabor), c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), för ett plant OFDM-spektrum (beta = B/sqrt({ "12" }). Oberoende referens (ExternalDataset): Publicerade räknade värden (P1): Bachl, Lei och Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), gränser för enskilda SSB i NR NTN återgivna från 3GPP TS { "38.211" } SSB-kartan genom Kshanas egna numeriska funktioner (W_rms { "1.9616" } mot { "1.96" } MHz, sigma_t { "38.755" } mot { "39" } us, sigma_f 100.79/87.28 mot 101/87 Hz, sigma_rho 0.5970/0.5831 mot 0.60/0.58 m, var och en inom en halv enhet av den tryckta sista siffran); Betz { "2001" } tabell { "1" } RMS-bandbredder för BPSK-R (1.128/3.477 mot

seg-baa462153341 = MODELLED positionering från Cramér-Rao-gränser: steget från bandbredd till gräns är en läroboksmässig sluten form (kontrollerad mot numerisk integration, inte mot ett publicerat räknat exempel); noggrannheten är en gräns på en kanal utan flervägsutbredning med ett angivet synkroniseringsfel, inte ett uppnått resultat (resultat <c1/>)

seg-c4a9693d1191 = MODELLED: steget från bandbredd till gräns är den läroboksmässiga slutna formen, kontrollerad mot numerisk integration av de plana och bandbegränsade BPSK-spektrumen (intern konsistens, inget publicerat räknat exempel fastlagt), och positioneringsnoggrannheten är en gräns på en kanal utan flervägsutbredning med ett angivet synkroniseringsfel, inte ett uppnått resultat. (typkatalog (<c1/>))

seg-e23e35aa1203 = Steget från bandbredd till gräns är en läroboksmässig sluten form; positioneringsnoggrannheten är MODELLED (en gräns på en kanal utan flervägsutbredning, inte ett uppnått resultat). (kommentar i scenariofilen, rad { "12" } till { "13" })

seg-ccb921bf73b5 = <s1>Föregående</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Nästa</s1>oem-interop
