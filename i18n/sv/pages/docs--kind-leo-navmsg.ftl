# docs--kind-leo-navmsg: translations (sv)

seg-debc2f07db78 = true

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } medföljande scenarier använder denna kind; de övriga finns i <a1><c1/></a1>.

seg-648c27220789 = Källa: <c1/>

seg-087287602b47 = <c1/> (scenario kind)

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-867f3e41b5ab = LEO-navigeringsmeddelande: den utsända efemeriden och klockan för en satellit för positionering, navigering och tidssynkronisering (PNT) i låg omloppsbana (LEO), för valfri bana, bärvåg och modell, med valfria namngivna förinställningar (Xona Pulsar, Iridium, Starlink, CentiSpace, ett representativt C-bandssystem, ATOMIC-modellen med nollklocka, Celeste IOD). INNEHÅLL: hjälpdata (SVID, datautgåva, band, signalhälsa), synkronisering (vecka, veckotid, ett klockpolynom av andra ordningen af0-af2 kring toc), efemerid i en av fyra modeller -- den keplerska uppsättningen med 16 parametrar enligt Galileo OS SIS ICD; den uppsättningen plus korrektionspolynom längs banan, tvärs banan och radiellt; modellen med 22 parametrar enligt Liu et al. { "2025" }; ett ECEF-polynom utan klocktermer (ATOMIC med nollklocka) -- och andra tjänster (en utsänd Klobuchar-uppsättning, NeQuick-G ai0-ai2 med den effektiva joniseringsnivån, och parametrar för systemtid till UTC med skottsekundslogiken från ICD). ANPASSARE: en referensbana integrerad med zonal J2-J6- eller EGM2008-gravitation till vald grad och med luftmotstånd, och en slumpmässigt genererad fri eller styrd klocka; Levenberg-Marquardt-anpassning av den keplerska uppsättningen på icke-singulära element, därefter linjära minstakvadratkorrektionspolynom; klockan anpassad exklusive den relativistiska term som användaren lägger till. ANALYSER: fit-interval-trade (signal-in-space-avståndsfel, SISRE, med globalt genomsnittliga vikter för banhöjden, mot anpassningsintervall och uppdateringsperiod, enbart bana och med klocka), model-comparison (fyra modeller, antal parametrar, kodade bitar och Kshanas anpassning vid Liu et al.:s höjder bredvid de publicerade siffrorna), midpass-update (den högsta passagen över en användare, varje meddelandebytes hopp i position, klocka och användaravstånd, hopp vid sämsta geometri, PASS/FAIL mot en kontinuitetströskel), encode-decode (Kshanas egen dokumenterade binära ram med CRC-24Q, en kvantiseringsbudget på ett halvt steg per fält, en kontroll av skadad ram, en export och import av post i RINEX-4-stil märkt som en Kshana-utvidgning, och en CSV-tabell). VALIDATED: SISRE-vikterna mot den publicerade MEO/GEO-tabellen (Montenbruck et al. { "2018" }); Galileos användaralgoritm mot RTKLIB på verkliga utsända Galileo-efemerider; CRC-24Q mot sitt katalogkontrollvärde och RTCM { "1005" }-exempelramen. MODELLED: varje anpassnings- och SISRE-siffra är representationsfel mot en referens som Kshana integrerat (inget fel från banbestämning eller banprediktion); jämförelsen med Liu et al. använder andra banor; kodningen och textformaten är Kshanas egna.

seg-e5a4f0290e9e = En körning av <c1/> sammanfattas som: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m Den keplerska uppsättningen med 16 parametrar försämras från { "0.0003" } m vid { "60" } s till { "0.1073" } m vid { "900" } s: en keplersk uppsättning med övertoner två gånger per varv kan inte följa de högfrekventa gravitationstermerna och luftmotståndet för en LEO-båge längre än några minuter, och dess minstakvadratresidual svänger över fönstret. Polynomen längs/tvärs/radiellt, av högre grad än den keplerska uppsättningen spänner över, tar upp det som återstår och ger { "0.0388" } m vid { "900" } s.

seg-3f299f6b20c8 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Exemplet <c1/> anger bland annat:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD message (workshop preset)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Resultatetikett (motorns egen): MIXED — VALIDATED byggstenar, MODELLED resultat. SISRE-vikterna återskapar den publicerade MEO/GEO-tabellen (Montenbruck et al. { "2018" }), Galileo ICD-användaralgoritmen återskapar RTKLIB på verkliga utsända Galileo-efemerider, och CRC-24Q återskapar sitt katalogkontrollvärde och RTCM { "1005" }-exempelramen

seg-35e92abc6a23 = Diagrammet som motorn skriver för scenarios/leo-navmsg-celeste-iod.toml, kind leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: raderna i <a1>verifieringsmatrisen</a1> som nämner denna kind.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiella vikten w_R och den kvadrerade tvärvikten w_AC^{ "2" } som medelvärden av cos^{ "2" } och halva sin^{ "2" } av siktlinjens nadirvinkel över användare likformigt fördelade på den synliga jordkalotten över en elevation

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD:s keplerska utvärdering (Keplers ekvation, korrektioner av andra övertonen, jordfast nod) skriven separat från motorns RINEX-utvärderare, som ger positionen med argumentet Tests: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, startvärde { "0" }, ingen reflektion, ingen slutlig XOR, kontrollen som Kshanas LEO-ram bär över varje föregående byte

seg-2b24c2669c23 = <b>VALIDATED</b> Anpassaren och avvägningen i kind <c1/>: en referensbana integrerad med zonal J2-J6- eller EGM2008-gravitation till vald grad och med luftmotstånd, och en slumpmässigt genererad fri eller styrd klocka; en Levenberg-Marquardt-anpassning av den keplerska Galileo-uppsättningen på icke-singulära

seg-ddb27b07b9af = och { "7" } fler i matrisen.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiella vikten w_R och den kvadrerade tvärvikten w_AC^{ "2" } som medelvärden av cos^{ "2" } och halva sin^{ "2" } av siktlinjens nadir. Oracle (ExternalDataset): Den publicerade SISRE-viktningstabellen av Montenbruck, Steigenberger och Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } och 1/49, GLONASS { "0.98" } och 1/45, Galileo { "0.98" } och 1/61, BeiDou MEO { "0.98" } och 1/54, BeiDou IGSO/GEO { "0.99" } och 1/126. Samma medelvärde utvärderat vid LEO-radier ger

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD:s keplerska utvärdering (Keplers ekvation, korrektioner av andra övertonen, jordfast nod) skriven separ. Oracle (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF-positioner (en oberoende implementation av samma ICD-algoritm) för verkliga BKG/IGS-sändningsposter från 2024-09-10, båda incheckade med proveniens i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Detta validerar den keplerska användaralgoritmen; korrektionerna längs/tvärs/radiellt som läggs ovanpå täcks av sina egna rader, och Liu-termerna b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, startvärde { "0" }, ingen reflektion, ingen slutlig XOR, kontrollen som Kshanas LEO-ram bär över varje föregående. Oracle (ExternalDataset): CRC-katalogens kontrollvärde för dessa parametrar (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: width { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), vilka är CRC-24Q-parametrarna i RTCM { "10403" } och Galileo OS SIS ICD, och exempelramen för meddelandetyp { "1005" } som är tryckt i RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Anpassaren och avvägningen i kind <c1/>: en referensbana integrerad med zonal J2-J6- eller EGM2008-gravitation till vald grad och med luftmotstånd, och en slumpmässigt genererad fri eller styrd. Oracle (ExternalDataset): Verkliga precisa vetenskapliga banor som referens (TU Graz IfG/ITSG operativa reducerat dynamiska banor, fria för alla ändamål med vederbörlig angivelse; SHA-256-värden i fixturens NOTICE) anpassade med uppsättningen med 16 parametrar över bågar på { "20" } och { "30" } min, mot den statistik som Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publicerar för samma satelliter och dagar: längs, tvärs och radiellt RMS var och en inom 1.5x (uppmätt { "0.804" } till { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE är meddelandets representationsfel mot den referens som det anpassades till; fel från banbestämning och banprediktion är inte modellerade. (result <c1/>)

seg-3762de39de07 = Referensbanan är en numerisk integration i Kshana (zonal gravitation eller EGM2008, statiskt exponentiellt luftmotstånd), inte en verklig satellits precisa bana; inga tredje kroppar, solstrålningstryck eller tidvatten. (result <c1/>)

seg-4486dd350b57 = Det binära formatet är Kshanas egen dokumenterade kodning, modellerad efter de publicerade meddelandekomponenterna; det är inte bitlayouten för Celeste eller något annat system (ingen är offentlig). (result <c1/>)

seg-2a5c1bce8320 = RINEX-liknande blocket är en dokumenterad Kshana-utvidgning; RINEX { "4.02" } definierar inga LEO-navigeringsposter. (result <c1/>)

seg-642d8f4d60e7 = NeQuick-G-koefficienter förs med och den effektiva joniseringsnivån beräknas, men NeQuicks elektrontäthetsintegration som omvandlar den till en fördröjning är inte implementerad; Klobuchar-fördröjningen är det, skalad till bärvågen med 1/f^{ "2" } utan korrektion för en satellit som flyger inne i jonosfären. (result <c1/>)

seg-8ba04a3147bd = Termerna med 22 parametrar enligt Liu et al. { "2025" } följer artikelns användaralgoritm (Eq. 1-7) och anpassningsstrategi (Section { "2.3" }); dess SISRE-mot-höjd-siffror använde verkliga precisa banor, så denna jämförelse på en bana som Kshana integrerat är MODELLED, inte VALIDATED (jämförelsen med verkliga banor är tests/leo_navmsg_fit_real_orbit_oracle.rs). (result <c1/>)

seg-b3585c7feb4e = MIXED — VALIDATED byggstenar, MODELLED resultat. SISRE-vikterna återskapar den publicerade MEO/GEO-tabellen (Montenbruck et al. { "2018" }), Galileo ICD-användaralgoritmen återskapar RTKLIB på verkliga utsända Galileo-efemerider, och CRC-24Q återskapar sitt katalogkontrollvärde och RTCM { "1005" }-exempelramen. Varje anpassnings-, SISRE-, kontinuitets- och kvantiseringssiffra är MODELLED: representationsfelet för ett meddelande mot en (result <c1/>)

seg-d6e412aab1b4 = MODELLED: varje anpassnings- och SISRE-siffra är representationsfel mot en referens som Kshana integrerat (inget fel från banbestämning eller banprediktion); jämförelsen med Liu et al. (kind catalogue (<c1/>))

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-d9257241d523 = Ämnessida: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Föregående</s1>launch-window

seg-2984c4c69850 = <s1>Nästa</s1>leo-pass
