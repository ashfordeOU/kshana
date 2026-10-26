# docs--kind-time-transfer-budget: translations (da)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-c61e88721556 = Scenarietype i motoren v{ $version }, familie <a1>Ure, tidssynkronisering og holdover</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-849c08d3ce70 = Familieside: <a1>Ure, tidssynkronisering og holdover</a1>

seg-937ebbbd612c = Kilde: <c1/>

seg-6af6f07f5f5a = <c1/> (scenarietype)

seg-9a2bb9809aed = Tovejs tids- og frekvensoverførsel via satellit mellem to stationer gennem et geostationært relæ: tovejsligningen løst for T_A - T_B med hvert ikke-reciprokt led (stationsudstyrets forsinkelser, Ku-bånds-ionosfære, transponder, Sagnac), et usikkerhedsbudget i kvadratur, hvis type A-led er den simulerede forbindelses TDEV ved middelværditiden, en simuleret forbindelse med hvid og flicker-fasestøj og en døgnvariabel ikke-reciprocitet, samt stabiliteten (rate, residual-RMS, TDEV, ADEV) af alle leverede serier fra BIPM Circular T Section { "1" }, MJD,ns CSV eller IGS RINEX-stationsurposter. MODELLED.

seg-a4f8e9a09026 = Én kørsel af <c1/> opsummeres som: time-transfer-budget: europe - north-america offset { "12.500" } ns (Sagnac { "204.365" } ns, ionosphere { "0.0213" } ns); combined u { "1.087" } ns (type A { "0.031" } ns at { "86400" } s); { "0" } real series (MODELLED)

seg-0353d795ebdf = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-fe3afa366df2 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-00026a1d3760 = Eksemplet <c1/> angiver blandt andet:

seg-2409cc9397c7 = Resultatbetegnelse (motorens): MODELLED — TWSTFT-tovejsligning (stationsforsinkelser, Ku-bånds-ionosfære, transponder, Sagnac) løst ud fra angivne forsinkelser, et usikkerhedsbudget i kvadratur med den simulerede forbindelses TDEV som type A-led, en simuleret forbindelse med flicker-fasestøj og døgnvariabel ikke-reciprocitet, og stabiliteten af enhver r

seg-92d3c84024d7 = Diagrammet, som motoren skriver for scenarios/time-transfer-budget.toml, type time-transfer-budget

seg-83b9c66b9e92 = <b>MODELLED</b> TWSTFT-tovejsligningen løst for T_A - T_B med stationens sende- og modtageforsinkelser, Ku-båndets ionosfæriske op/ned-asymmetri, transponderens forsinkelsesforskel og Sagnac-leddene, mod dens eksakte fremadmodel; et usikkerhedsbudget i kvadratur

seg-58cf4086c7a5 = <b>MODELLED</b> TWSTFT-tovejsligningen løst for T_A - T_B med stationens sende- og modtageforsinkelser, Ku-båndets ionosfæriske op/ned-asymmetri, transponderens forsinkelsesforskel. Uafhængig reference (InternalConsistency): Intern konsistens: fremadmodellen og den løste ligning stemmer overens til { "1e-15" } s, Sagnac-leddet er lig modulets uafhængige BIPM 2A omega/c^{ "2" }-sløjfeform, det ionosfæriske led er { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, og støjprocesserne viser deres forventede TDEV-forløb. HVAD DET IKKE ER: ingen reel TWSTFT-måling eller kalibreringsrapport er sammenlignet; de angivne forsinkelser og usikkerheder er input, ikke målt; t

seg-15de1cdaa684 = MODELLED — TWSTFT-tovejsligning (stationsforsinkelser, Ku-bånds-ionosfære, transponder, Sagnac) løst ud fra angivne forsinkelser, et usikkerhedsbudget i kvadratur med den simulerede forbindelses TDEV som type A-led, en simuleret forbindelse med flicker-fasestøj og døgnvariabel ikke-reciprocitet, og stabiliteten af enhver leveret reel UTC-UTC(k)- eller stationsurserie; ikke sammenlignet med en reel TWSTFT-forbindelse (resultat <c1/>)

seg-70448ca49780 = Tovejs tids- og frekvensoverførsel via satellit (TWSTFT) mellem to ILLUSTRATIVE stationer, én i Centraleuropa og én i det østlige Nordamerika, gennem et geostationært relæ ved { "10" } deg W. Kørslen løser tovejsligningen for T_A - T_B ud fra de angivne led for udstyr, transponder, ionosfære (Ku-bånd, 14/11 GHz) og Sagnac. Den danner et usikkerhedsbudget, hvis statistiske led er TDEV ved én dag af en simule (kommentar i scenariefilen, linje { "1" } til { "8" })

seg-4b0d23aed0ab = TWSTFT-tovejsligning, usikkerhedsbudget og forbindelsesstabilitet med flicker og døgnvariabel ikke-reciprocitet er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-52e06909ccc5 = <s1>Forrige</s1>terrain-slam

seg-a22fa1c51042 = <s1>Næste</s1>timetransfer
