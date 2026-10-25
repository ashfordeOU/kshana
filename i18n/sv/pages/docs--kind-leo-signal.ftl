# docs--kind-leo-signal: translations (sv)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-ae15d15bf151 = Ämnessida: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinusintegralen (sine_integral), BPSK-R-andelen av effekten inom ett dubbelsidigt band i sluten form (bpsk_power_in_band_closed_form), det bandbegränsade. Oberoende referens (ExternalDataset): Externt fastlagda: { "90.3" } procent av effekten i huvudloben, den koherenta early-late-jittern vid den angivna arbetspunkten, tabellvärdena för sinusintegralen och BPSK:s egen spektrala separationskoefficient 2/({ "3" } R_c) vid noll förskjutning. Endast interna korskontroller, inte extern validering: den slutna formen för bandbegränsad BPSK Gabor-bandbredd och dess asymptot, och den spektrala separationskoefficienten för förskjuten BPSK vid förskjutningar skilda från noll, båda

seg-faf2775f3003 = <b>MODELLED</b> Typen <c1/>: parametriserade signalutformningar (band, sändningsbandbredd, ITU-tilldelning; förvärvs-, data- och pilotkomponenter med BPSK(n), BOC(m,n), MB. Oberoende referens (InternalConsistency): De validerade slutna formerna i de två raderna ovan, identiteten för falsklarm vid kvadratisk detektion P_d(snr = { "0" }) = P_fa och Holmes medeltid för förvärv, samt reduktion till spektrumtypens egen SSC-kedja (samma Jammer::ssc-kod). Själva utformningarna är indata: förinställningar märkta REPRESENTATIVE eller WORKSHOP är inte publicerade specifikationer, förbättrad Feher-QPSK, kodskiftnyckling och OFDM-spektra är approximerade, och formen

seg-051999733048 = Källa: <c1/>

seg-16ae2a08d3c8 = <c1/> (scenariotyp)

seg-97b8d07150d4 = LEO-PNT-signalutformningar: parametriserade signaler för positionering, navigering och tidssynkronisering (PNT) från låg omloppsbana (LEO) för valfritt system, band och struktur. En SIGNAL är ett band (mittfrekvens, sändningsbandbredd, ITU-tilldelning RNSS/RDSS/MSS/EESS/non-RNSS/other) och komponenter (förvärv, data, pilot; valfri delmängd), var och en med en modulering (BPSK(n) med bråktals-n, BOC(m,n), MBOC({ "6,1" },p) eller ett platt OFDM-liknande band), en effektandel, valfria FDMA-delbärvågsförskjutningar, en kodlängd och en datatakt. Signaler kommer från inkompilerade offentliga förinställningsfiler (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; var och en med sin käll-URL och varje opublicerat värde märkt REPRESENTATIVE) eller skrivs inbäddade. PER SIGNAL: den bandbegränsade effektspektraltätheten och den andel av varje komponents effekt som sändningsbandet släpper igenom (sluten form för BPSK bredvid det numeriska värdet), RMS-bandbredden (Gabor), den termiska bruset i kodspårningens jitter i fördröjningslåsningsslingan mot C/N0 och early-late-avstånd utifrån den bandbegränsade koherenta (eller icke-koherenta) early-late-formeln av Betz & Kolodziejski { "2009" } med dess lärobokssform för obegränsat band och dess Gabor-gräns för försvinnande avstånd, avståndsnoggrannheten i meter, sökrymden för förvärv (Doppler-celler från banans maximala Doppler plus oscillator- och användartermer, gånger kodceller), detektionssannolikhet vid kvadratisk detektion samt medeltiden för seriellt och kodparallellt förvärv, den spektrala separationskoefficienten från signalen till GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b och E5 AltBOC och från var och en in i signalen med C/N0-försämringen, samt den CW-, bredbands- och matchade J/S som den spårade komponenten tål, från spektrumtypens egen SSC-maskineri. En BANDAVVÄGNING: jonosfärisk fördröjning av första ordningen ({ "40.3" } TEC/f^{ "2" }), fri rymdförlust, avståndsnoggrannhet vid lika C/N0 och vid lika EIRP samt störsändartolerans. Valfria FORMKONTROLLER håller en utformnings spektrum mot en beskriven mätning (MODELLED konsistens). VALIDATED: de slutna formerna för BPSK-effekt i bandet ({ "90.3" } % i huvudloben) och Gabor-bandbredd, den bandbegränsade jittern som reduceras till den koherenta early-late-formen i läroböckerna och till sin Gabor-gräns, den spektrala separationskoefficienten för förskjuten BPSK mot sin slutna form enligt Parseval, AltBOC-spektrumets enhetsarea samt den maximala LEO-Dopplern mot de publicerade siffrorna för Xona Pulsar (32-34 kHz) och Iridium ({ "36" } kHz). MODELLED: varje utformning, effektfördelning, C/N0 och störsändarnivå; spektra för EFQPSK, CSK och OFDM är approximerade.

seg-37e5fdff9d4d = En körning av <c1/> sammanfattas som: scenario leo-signal | { "5" } signaler | brusgolv -202.0 dBW/Hz | finaste avståndsmätning generic-c-wide { "0.022" } m vid { "45.0" } dB-Hz

seg-b538d3ff9fdb = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Exemplet <c1/> anger bland annat:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = coherent

seg-0f29946fe4fb = Resultatetikett (motorns egen): MODELLED: parametriserade signalutformningar för positionering, navigering och tidssynkronisering (PNT) från låg omloppsbana (LEO), bandbegränsade till sin sändningsbandbredd. De slutna formerna under är VALIDATED (BPSK-effekt i bandet och Gabor-bandbredd, den bandbegränsade early-late-kodspårningsjittern som reduceras till läroboks

seg-8bf45b6989d1 = Diagrammet som motorn skriver för scenarios/leo-band-trade.toml, typ leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: sinusintegralen (sine_integral), BPSK-R-andelen av effekten inom ett dubbelsidigt band i sluten form (bpsk_power_in_band_closed_form), den bandbegränsade BPSK Gabor-bandbredden i sluten form (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: den största satellit-Dopplern på en överflygning rakt över vid elevationsmasken för en cirkulär bana, v R_E cos(el) / (R_E + h) gånger f / c, från varje förinställnings egen bärvåg och banhöjd; typen <c1/> lägger till o

seg-e0a4f53c5a96 = <b>MODELLED</b> Typen <c1/>: parametriserade signalutformningar (band, sändningsbandbredd, ITU-tilldelning; förvärvs-, data- och pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller platta spektra, effektandelar, FDMA-delbärvågor, kodlängder och datatakter Tester: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> utvidgad bortom L-bandet: band angivna som en förinställd signalutformning (ritad med varje komponent, bandbegränsad till sändningsbandbredden, C/N0 och J/S hänförda till den spårade komponenten) eller som en egen bärvåg och modulering Tester: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: den största satellit-Dopplern på en överflygning rakt över vid elevationsmasken för en cirkulär bana, v R_E cos(el) / (R_E + h) gånger f / c,. Oberoende referens (ExternalDataset): Publicerade siffror: Xona Pulsar X1 maximal Doppler { "32" } till { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler upp till +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordrotationen är utelämnad, vilket flyttar siffran med upp till cirka { "2.3" } kHz; båda de publicerade siffrorna nås utan den.

seg-1ab79cdbd269 = de exakta spektra för förbättrad Feher-QPSK, kodskiftnyckling och OFDM: en BPSK-envelopp med rektangulära chip eller ett platt band används i stället, så som varje förinställning anger (resultat <c1/>)

seg-0561c3ed88fb = spridningskodens linjestruktur och korskorrelation mellan koder vid fleråtkomst (resultat <c1/>)

seg-8b4df054a7b3 = sändnings- och mottagningsfiltren utöver en ideal tegelvägg vid sändningsbandbredden: ingen emission utanför bandet, ingen filtergruppfördröjning (resultat <c1/>)

seg-ad5f7cc4a439 = flervägsutbredning, mottagarens kvantisering och automatisk förstärkningsreglering (resultat <c1/>)

seg-e38fc1a121ab = jordrotationen i Dopplergränsen (upp till cirka { "0.46" } km/s avståndshastighet vid ekvatorn) (resultat <c1/>)

seg-32a132809a9b = jonosfärisk fördröjning utöver första ordningen och fördelningen av elektroninnehållet över och under en LEO-satellit: den sneda TEC är en indata (resultat <c1/>)

seg-8189e06f4a56 = atmosfärs-, regn- och polarisationsförluster: enbart den fria rymdförlusten jämförs (regn spelar roll i C-bandet) (resultat <c1/>)

seg-445cecb7370c = förvärv utöver en enda uppehållstid med falsklarmsstraff: ingen verifieringslogik med flera uppehållstider, en likformig förhandsfördelning av kodfas, det värsta fallet för överlapp (resultat <c1/>)

seg-8eefe4197d7f = <s1>Föregående</s1>leo-pvt

seg-60423e1ed0ca = <s1>Nästa</s1>link-budget
