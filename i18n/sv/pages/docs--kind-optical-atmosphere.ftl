# docs--kind-optical-atmosphere: translations (sv)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-72ad48275ebe = Scenariotyp i motorn v{ $version }, familj <a1>Optisk PNT</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-a97755cb13eb = Familjesida: <a1>Optisk PNT</a1>

seg-9fd02351d844 = ms

seg-d4e4da22fadb = Källa: <c1/>

seg-deb0a932a76f = <c1/> (scenariotyp)

seg-a878d9be65b7 = MODELLED optisk PNT genom atmosfären: för en optisk länk och en uppsättning markplatser med angivna molnklimat redovisas den våglängds- och elevationsberoende förlusten i klar luft (Kims sikt-lag plus Rayleigh), turbulenstillståndet enligt Hufnagel-Valley (Rytov-varians, scintillationsindex, gamma-gamma-parametrar, aperturmedelvärdesbildning), den väderstyrda tillgängligheten mot länkmarginalen (molnets optiska djup från ett log-normalt klimat för flytande vatten, geometrisk-optisk extinktion, oberoende turbulensfädning), den länkmarginal som behövs för målvärden på tillgänglighet, fördelningen av avbrottens varaktighet, tillväxten av tids- och avståndsfel per avbrott genom klockans holdover-modell, avståndskorrelerad tillgänglighet med platsdiversitet och vad-händer-om-vinster för förbättringstekniker (våglängd, mottagarapertur, adaptiv optik för minskad scintillation, extra marginal). VALIDATED som implementation av de angivna formlerna mot en oberoende mpmath-referens: Rytov-varians, scintillationsindex, gamma-gamma-fädningssannolikhet, aperturmedelvärdesfaktor, optiskt djup i moln och klar luft. MODELLED: varje väder-, teknik- och klockindata samt antagandena om oberoende och copula; ingen uppmätt tillgänglighetsregistrering har jämförts. Rådgivande analys, inte en certifierad tillgänglighets- eller navigeringsprodukt.

seg-c443d8d3e4ce = En körning av <c1/> sammanfattas som: optical-atmosphere: { "1550" } nm at { "30" } deg elevation, margin { "19.2" } dB before the atmosphere; best site southern { "74.66" } %; 3-site network { "92.72" } % independent / { "91.62" } % correlated weather (MODELLED, advisory)

seg-e466ecbd4e6d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Exemplet <c1/> anger bland annat:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Resultatetikett (motorns egen): MODELLED — optisk PNT genom atmosfären: extinktion i klar luft (Kims sikt-lag + Rayleigh), molnets optiska djup från ett angivet klimat för flytande vatten (P.840-mängd, geometrisk-optisk extinktion), Hufnagel-Valley-turbulens med gamma-gamma-fädningar och aperturmedelvärdesbildning, tillgänglighet mot

seg-4e2b759aff17 = Diagrammet som motorn skriver för scenarios/optical-atmosphere-network.toml, typ optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley Cn2 integrerad längs en sned bana för Rytov-variansen för plan och sfärisk våg (upplänk och nedlänk), Andrews-Phillips scintillationsindex och gamma-gamma-parametrar, gamma-gamma-fädningssannolikheten och fädningsmarginalen, Tester: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Tillgänglighet för en optisk länk mot en angiven länkmarginal från ett log-normalt klimat för flytande vatten i moln (ITU-R P.840-mängd, geometrisk-optisk extinktion) och den oberoende gamma-gamma-turbulensfädningen, den länkmarginal som behövs för mål- Tester: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Fördelningen av avbrottens varaktighet för en optisk plats kopplad till den slutna kustvariansen i klockans holdover-modell: tids- och avståndsfel vid angivna avbrottskvantiler, holdover till ett tidströskelvärde, andelen avbrott och Tester: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> En valfri tabell <c1/> (varaktighet, steg, slumpfrö) gör att typen <c2/> också skriver, per plats, en realisering med slumpfrö av den angivna platsmodellen genom tiden: molnepisoder (klara perioder exponentiella, molnavbrott log-normala Tester: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley Cn2 integrerad längs en sned bana för Rytov-variansen för plan och sfärisk våg (upplänk och nedlänk), Andrews-Phillips scintillationsindex. Oberoende referens (ExternalDataset): Numeriken jämförs med ett oberoende program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } siffror, tanh-sinh-kvadratur på den ursprungliga höjdvariabeln och Bessel-K-gamma-gamma-täthet) som inte delar någon kod med Kshana, under trösklar fastställda före någon implementation fanns (xval/optical-atmosphere/PREREGISTRATION.md). VARFÖR MODELLED: den referensen utvärderar samma publicerade formler, så den kontrollerar im

seg-4af9bc99ef29 = <b>MODELLED</b> Tillgänglighet för en optisk länk mot en angiven länkmarginal från ett log-normalt klimat för flytande vatten i moln (ITU-R P.840-mängd, geometrisk-optisk extinktion) och . Oberoende referens (InternalConsistency): Intern konsistens: gränsfall i sluten form och monotoni hos diversitetsmodellen, den slutna formen för molntaket och de log-normala avbrottsidentiteterna. INGEN extern oberoende referens görs gällande och ingen har jämförts: ingen uppmätt tillgänglighet för optiska markstationer eller registrering av molnfri siktlinje används. VARFÖR MODELLED: molnklimatet (sannolikhet för moln, median och spridning hos vattenpelaren, avbrottens varaktighet),

seg-b3abf6cbeba4 = <b>MODELLED</b> Fördelningen av avbrottens varaktighet för en optisk plats kopplad till den slutna kustvariansen i klockans holdover-modell: tids- och avståndsfel vid angivna avbrottskvantiler, holdover till ett tidströskelvärde, andelen avbrott och. Oberoende referens (InternalConsistency): Intern konsistens med holdover-modulen, bit för bit; INGEN extern oberoende referens görs gällande. Klassernas PSD:er är de syntetiserade golven för lång tau som holdover-modulen redan bär, så siffrorna ärver dess angivna förbehåll att holdover till ett snävt tröskelvärde styrs av det antagna golvet för rött brus och inte av den citerade Allan-avvikelsen. Avbrottens varaktigheter är en log-normal modell med angivna parametrar, inte en uppmätt

seg-c4772a9e1a26 = MODELLED — optisk PNT genom atmosfären: extinktion i klar luft (Kims sikt-lag + Rayleigh), molnets optiska djup från ett angivet klimat för flytande vatten (P.840-mängd, geometrisk-optisk extinktion), Hufnagel-Valley-turbulens med gamma-gamma-fädningar och aperturmedelvärdesbildning, tillgänglighet mot länkmarginalen, avbrottens varaktigheter kopplade till klockans holdover och avståndskorrelerad platsdiversitet. Numeriken kontrolleras (resultat <c1/>)

seg-32c6524b0baf = MODELLED optisk PNT genom atmosfären: för en optisk länk och en uppsättning markplatser med angivna molnklimat redovisas den våglängds- och elevationsberoende förlusten i klar luft (Kims sikt-lag plus Rayleigh), turbulenstillståndet enligt Hufnagel-Valley (Rytov-varians, scintillationsindex, gamma-gamma-parametrar, aperturmedelvärdesbildning), den väderstyrda tillgängligheten mot länkmarginalen (molnets optiska djup från (typkatalog (<c1/>))

seg-2c7493ee5042 = MODELLED: varje väder-, teknik- och klockindata samt antagandena om oberoende och copula; ingen uppmätt tillgänglighetsregistrering har jämförts. (typkatalog (<c1/>))

seg-b4402211e3fe = Optisk PNT genom atmosfären: tre ILLUSTRATIVA markplatser (en molnigare nordlig plats, en mellanplats i mitten och en klarare sydlig plats) som betraktar en optisk LEO-terminal vid { "30" } graders elevation vid { "1550" } nm. Molnklimaten är angivna indata, inte mätningar eller något dataset med värden, så varje tillgänglighet nedan är MODELLED. Körningen redovisar per plats förlusten i klar luft, turbulenstillståndet enligt Hufnagel-Valley, (kommentar i scenariofilen, rad { "1" } till { "8" })

seg-384f5c73cdf9 = En realisering med slumpfrö av varje platss länk genom tiden (MODELLED; ett utfall från modellen ovan, inte klimatet). Saknas den skrivs ingen serie och resultatet är dokumentet { "0.37" }. (kommentar i scenariofilen, rad { "78" } till { "79" })

seg-c75fa5787bd4 = Numerik för atmosfär längs optisk sned bana: Rytov-varians, scintillation, gamma-gamma-fädningssannolikhet, aperturmedelvärdesbildning, optiskt djup i moln och klar luft är MODELLED, inte validerad: ett delpåstående är externt kontrollerat, men hela förmågan sammansätts av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Väderstyrd tillgänglighet för optiska markplatser och avståndskorrelerad platsdiversitet är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Ämnessida: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Föregående</s1>oem-interop

seg-ef0a779c300c = <s1>Nästa</s1>orbit
