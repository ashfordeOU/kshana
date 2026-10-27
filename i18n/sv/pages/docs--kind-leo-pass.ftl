# docs--kind-leo-pass: translations (sv)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-fad0b45fd9c2 = Källa: <c1/>

seg-f0433f09f033 = <c1/> (scenario kind)

seg-c3861f7d717c = LEO-passage och länkbudget, band för band, för LEO-PNT (positionering, navigering och tidssynkronisering från låg omloppsbana), systemoberoende: en användare (mark, sjö, luft eller inomhus, stillastående eller i rörelse) och en eller flera LEO-satelliter från en KONSTRUERAD PASSAGE (DESIGNED PASS; en cirkulär bana placerad så att användaren ser en passage med en vald maximal elevation vid en vald tidpunkt, solsynkron om så önskas), explicita ELEMENT, en TLE (tvåradig elementuppsättning) genom motorns SGP4, eller en WALKER-konstellation byggd av konstellationsutformningskoden (de högsta passagerna redovisas). Banden kommer från en namngiven förinställning (generisk multiband UHF/L/S/C, generiskt C-band, Xona Pulsar X1/X5, Iridium STL, Starlink som en enbart Doppler-baserad opportunistisk signal, CentiSpace och en valfri Celeste IOD-förinställning märkt WORKSHOP) eller skrivs in i scenariot; varje förinställning anger om dess siffror är PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP. Per satellit, band och epok: elevation, azimut, avstånd, avståndshastighet och avståndsacceleration; fritt-rum-vägförlust; EIRP och satellitens diagramförstärkning (isoflux, gaussisk stråle eller platt); användarantennens förstärkning mot elevation (patch, halvsfärisk eller isotrop); gasdämpning (ITU-R P.676-10 Annex { "2" }), regndämpning (koefficienter enligt ITU-R P.838-3 och förfarandet enligt P.618-14, utifrån en regnintensitet och regnhöjd), troposfärisk scintillation (ITU-R P.618-14 section { "2.4.1" }), byggnadsinträngningsförlust för en användare inomhus (ITU-R P.2109-2), polarisationsfel, systembrustemperatur och C/N0 (bärvåg-till-brustäthet); Doppler och Doppler-hastighet i sluten form utifrån avståndshastigheten och avståndsaccelerationen, var och en kontrollerad mot centrala differenser; den jonosfäriska fördröjningen av första ordningen { "40.3" } STEC/f^{ "2" } från en Klobuchar- eller vertikal-TEC-snedriktad TEC skalad till den del av jonosfären som ligger under satelliten. Bandpar får de jonosfärsfria koefficienterna, brusförstärkningen och kodbruset vid passagens topp. MEO-GNSS-satelliter (förinställningarna Galileo eller GPS) utvärderas med samma antenn- och brusmodell utifrån mottagna effekter ur sina gränssnittsdokument, så att LEO:s klockformade passage och de platta GNSS-bärvågorna delar ett diagram. Ett valfritt avsnitt [iot] ger tid till första positionsbestämning, energi per positionsbestämning och batteritid mot dutycykel för en angiven effektbudget för mottagaren (MODELLED). Varje bandpar ger också den snedriktade TEC som dess geometrifria kombination återskapar vid toppen och den skattningens kodbrus-sigma (jonosfärsundersökning). Ett valfritt avsnitt [spoofer] förfalskar signalerna för en påstådd position som hoppar eller skjuts bort från den sanna efter ett insättande och kör två övervakare med angivna sannolikheter för falsklarm och missad detektering: konsistens i Doppler och passagegeometri (uppmätta avståndshastigheter mot dem som förutsägs från banorna och en oberoende förhandsposition och -hastighet, ett generaliserat minstakvadrat-kikvadrattest över ett fönster, på GNSS-, LEO- och alla kanaler) och konsistens mellan band (steget från epok till epok för varje LEO-bandpars modellkorrigerade geometrifria kombination), med redovisning av statistik per epok och när varje övervakare detekterar (MODELLED). VALIDATED komponenter: fritt-rum-förlust, P.838-3-koefficienterna mot dess Table { "5" }, förfarandena för regn och scintillation enligt P.618-14 och byggnadsinträngningsförlusten enligt P.2109 mot ITU-R Study Group { "3" }:s valideringsexempel, gruppfördröjningskvoten L1/L2 enligt IS-GPS-200 och den maximala Doppler för en stillastående användare på en cirkulär bana mot arXiv { "2509.19551" } Table { "1" }. MODELLED: EIRP, diagram, Chapman-andelen av TEC under satelliten och hela passagen.

seg-04509d8245b7 = En körning av <c1/> sammanfattas som: länkbudget för LEO-överflygning, flygande användare vid { "50.00" }, -30.00; { "1" } LEO-satellit(er), { "900" } s fönster Iridium-pass [iridium-stl PUBLIC]: { "781" } km, maximal elevation { "65.0" } deg vid { "444" } s, { "750" } s över masken STL { "1621.000" } MHz: C/N0 topp { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } i sikte, C/N0 { "38.2" } dB-Hz till { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL topp { "80.5" } dB-Hz är { "34.3" } dB över GNSS-medianen; över den starkaste GNSS-bärvågen under { "750" } s

seg-e6f4e5c502d7 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Exemplet <c1/> anger bland annat:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL från ett flygplan

seg-f4d857403ae0 = descending

seg-08bc462d676c = { "8" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-ee6d9e6d9556 = Resultatetikett (motorns egen): MODELLED: geometri för LEO-överflygning och länkbudget per band utifrån angivna EIRP-värden och idealiserade antennmönster med ITU-R-propagationstermer; komponentmodellerna har egna etiketter i verifieringsmatrisen. Inte en mätning av någon satellit.

seg-02ae51cfada6 = Diagrammet som motorn skriver för scenarios/leo-pass-iridium.toml, typ leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-69ed19957592 = <b>VALIDATED</b> ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ekvationerna ({ "1" }) till ({ "5" }): k_H, alpha_H, k_V, alpha_V från kurvanpassningarna i tabellerna { "1" } till { "4" }, de väg- och polarisationsberoende (k, alpha) och den specifika dämpningen Tester: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.2.1.1" } steg { "2" } till { "10" } (sned och horisontell väg under regnhöjden, horisontell reduktions- och vertikal justeringsfaktor, A0.01 och dess skalning till { "0.001" } % till { "5" } % av ett genomsnittligt år), med regnhöjden (P.839) a Tester: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } steg { "3" } till { "9" } (referenssigma från N_wet, effektiv väglängd, antennmedelvärdesfaktor, fädningsdjup för { "0.01" } % till { "50" } % av tiden), med N_wet som indata eller beräknat från temperatur, luftfuktighet och tryck av t Tester: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 bilaga { "1" } ekvationerna ({ "1" }) till ({ "10" }) med tabell { "1" }: den förlust som inte överskrids med sannolikheten P för traditionella och värmeeffektiva byggnader vid vägens elevation mot fasaden, { "80" } MHz till { "100" } GHz; tillämpad per band och epok Tester: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = och { "8" } till i matrisen.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } steg { "3" } till { "9" } (referenssigma från N_wet, effektiv väglängd, antennmedelvärdesfaktor, fädningsdjup för { "0.01" } % till { "50" } % av tiden). Oberoende referens (ExternalDataset): ITU-R Study Group { "3" } valideringsexempel (CG-3M3J-13-ValEx-Rev8.3.0) för scintillation enligt P.618-14, med varje platsens P.453-14 N_wet från samma exempel; incheckade i tests/fixtures/leo_link/p618_14_scintillation.csv med webbadresser och hämtningsdatum. Uttrycket för våt refraktivitet utifrån temperatur och luftfuktighet täcks inte av den här raden

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Grupplöptid { "40.3" } STEC/f^{ "2" } per band; de jonosfärsfria koefficienterna f1^2/(f1^{ "2" } - f2^{ "2" }) och -f2^2/(f1^{ "2" } - f2^{ "2" }) och brusförstärkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Oberoende referens (ExternalDataset): IS-GPS-200 avsnitt { "20.3.3.3.3.2" }, som anger L1/L2-förhållandet för grupplöptid gamma = (77/60)^{ "2" } som följer av förstaordningens 1/f^{ "2" }-skalning, och Friis överföringsformel (Proc. IRE, { "1946" }). Validerar skalningslagarna, inte en snedställd TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: en sökning över varje banposition och varje användare på satellitens horisont för en cirkulär bana, med jorden. Oberoende referens (ExternalDataset): Leclere, Marathe och Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabell { "1" } (statisk mottagare på en sfär med radien { "6371" } km, jordrotationen som enda övriga effekt): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Täcker cirkulära tvåkroppsbanor

seg-b952b2928bbe = <b>MODELLED</b> Typen <c1/>: satelliter från en utformad överflygning, banelement, en TLE via SGP4 eller en Walker-konstellation från constellation-design; per band och epok l. Oberoende referens (InternalConsistency): Slutna former och självkonsistens: identiteterna för avståndshastighet och avståndsacceleration mot numeriska derivator, isoflux-förstärkningen som tar ut avståndsökningen, läroboksgränserna för polarisationsförlust, den kvalitativa observationen LEO jämfört med GNSS (en klockformad överflygning på några minuter som toppar flera dB över de flacka GNSS-bärvågorna på 44-51 dB-Hz). EIRP-värdena och mönstren är publicerade mottagna effekter omräknade till en EIRP eller representat

seg-65a0444ca451 = MODELLED: geometri för LEO-överflygning och länkbudget per band utifrån angivna EIRP-värden och idealiserade antennmönster med ITU-R-propagationstermer; komponentmodellerna har egna etiketter i verifieringsmatrisen. Inte en mätning av någon satellit. (resultat <c1/>)

seg-8b3ffb30c23c = Ett valfritt avsnitt [iot] anger tid till första positionsbestämning, energi per positionsbestämning och batteritid mot driftcykel för en angiven effektbudget för mottagaren (MODELLED). (typkatalog (<c1/>))

seg-597be3a6eb96 = Ett valfritt avsnitt [spoofer] förfalskar signalerna från en påstådd position som hoppar eller skjuts bort från den sanna efter en start och kör två monitorer med angivna sannolikheter för falsklarm och missad detektion: konsistens mellan Doppler och överflygningsgeometri (uppmätta avståndshastigheter mot de som förutsägs från banorna och en oberoende förhandsposition och hastighet, ett generaliserat minsta kvadrat-chi-kvadrattest över ett fönst (typkatalog (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP-värden, mönster, Chapman-andelen av TEC under satelliten och hela överflygningen. (typkatalog (<c1/>))

seg-e675c999f303 = MODELLED. Punktstrålarna, skurschemat och STL-vågformen modelleras inte. (kommentar i scenariofilen, rad { "14" })

seg-c3665ac09bf6 = En LEO-PNT-överflygning och dess länkbudget per band mot MEO-GNSS-satelliterna i sikte är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Namngivna förinställningar för LEO-PNT-system med angivna källor, och en systemoberoende motor, är MODELLED, inte validerade: kontrollerade mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Ämnessida: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Föregående</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Nästa</s1>leo-pnt-chain
