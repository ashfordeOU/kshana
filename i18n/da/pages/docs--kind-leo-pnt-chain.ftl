# docs--kind-leo-pnt-chain: translations (da)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-49964654d5f4 = Scenarietype i motoren v{ $version }, familie <a1>Navigation i lav jordbane</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-c5478f572d21 = Familieside: <a1>Navigation i lav jordbane</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 afsnit { "2.4.1" } trin { "3" } til { "9" } (reference-sigma ud fra N_wet, effektiv stilængde, antennemiddelfaktor, fadedybde for { "0.01" } % til { "50" } % af tiden. Uafhængig reference (ExternalDataset): ITU-R Study Group { "3" }-valideringseksempler (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillation, med hvert steds P.453-14 N_wet fra de samme eksempler; committet i tests/fixtures/leo_link/p618_14_scintillation.csv med URL'erne og hentedatoen. Udtrykket for våd refraktivitet ud fra temperatur og fugtighed er ikke dækket af denne række

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } pr. bånd; de ionosfærefri koefficienter f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støjforstærkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Uafhængig reference (ExternalDataset): IS-GPS-200 afsnit { "20.3.3.3.3.2" }, der angiver gruppeforsinkelsesforholdet L1/L2 gamma = (77/60)^{ "2" }, som følger af skalering med første ordens 1/f^{ "2" }, og Friis' transmissionsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-ae15d15bf151 = Emneside: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Kilde: <c1/>

seg-3a66efa79aa2 = <c1/> (scenarietype)

seg-81d1604171a5 = Ét LEO-PNT-system (positionering, navigation og tidssynkronisering fra lav jordbane) fra ende til anden, for enhver konstellation og ethvert signal: leo-signal-udformningen, der er navngivet af signal_design (en offentlig forudindstilling eller en indlejret [signal]-udformning), fastsætter midten, båndbredden, chiprate og EIRP-fordeling for et [pass]-bånd, leo-pass-linkbudgettet giver den sporede C/N0 og den båndbegrænsede kodejitter over passagen, og en C/N0-linje i sin(elevation) og den udsendte SISRE for [navmsg]-beskeden (tilpasset ved passagesatellittens højde) fødes ind i hvert LEO-system i den fælles positionsbestemmelse leo-pvt i [fusion] og eventuelt i [ppp]-sagerne leo-ppp; hver overdragelse er opført med sin værdi og enhed. MODELLED.

seg-9dec9cd6fbfc = Én kørsel af <c1/> opsummeres sådan: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = Obligatoriske felter: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Eksemplet <c1/> angiver blandt andet:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Resultatmærkat (motorens): MODELLED, kæden giver hvert trins output videre til det næste; trinnene beholder deres egne mærkater (rækkerne leo-signal, leo-pass, leo-navmsg, leo-pvt og leo-ppp i verifikationsmatrixen).

seg-abe0599498c9 = Diagrammet, som motoren skriver for scenarios/leo-pnt-end-to-end.toml, scenarietype leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Typen <c1/>: en leo-signal-udformning (offentlig forudindstilling eller indlejret) fastsætter midten, båndbredden, chiprate og EIRP-fordeling for et leo-pass-bånd; passagen giver C/N0 for den sporede komponent og båndbegrænset kodejitter pr. epoke; en mindste kvadraters C/ Tests: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinusintegralet (sine_integral), BPSK-R-andelen af effekt inden for et dobbeltsidet bånd i lukket form (bpsk_power_in_band_closed_form), det bånd-. Uafhængig reference (ExternalDataset): Eksternt fastlagt: { "90.3" } procent hovedlobeeffekt, den kohærente early-late-jitter ved det angivne driftspunkt, sinusintegralets tabelværdier og BPSK's selvspektrale separationskoefficient 2/({ "3" } R_c) ved nul offset. Kun interne krydskontroller, ikke ekstern validering: den båndbegrænsede BPSK Gabor-båndbredde i lukket form og dens asymptote samt den offsettede BPSK-spektrale separationskoefficient ved offsets forskellige fra nul, begge

seg-faf2775f3003 = <b>MODELLED</b> Typen <c1/>: parametriserede signaludformninger (bånd, sendebåndbredde, ITU-allokering; erhvervelses-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MB. Uafhængig reference (InternalConsistency): De validerede lukkede former fra de to rækker ovenfor, identiteten for falsk alarm i kvadratloven P_d(snr = { "0" }) = P_fa og Holmes' gennemsnitlige erhvervelsestid samt reduktion til spektrumtypens egen SSC-kæde (den samme Jammer::ssc-kode). Udformningerne selv er input: forudindstillinger mærket REPRESENTATIVE eller WORKSHOP er ikke offentliggjorte specifikationer, forbedrede Feher QPSK-, kodeskift- og OFDM-spektre er tilnærmet, og formen

seg-752b6d88fc9c = Positioneringstrinnet modellerer C/N0 som en ret linje i sinus til elevationen mellem masken og zenit; kæden tilpasser den linje til passagens sporede C/N0, så en passagespecifik form (et isoflux-plateau, en strålekant) reduceres til to tal. (resultat <c1/>)

seg-f609a2991c7f = Den SISRE, der gives videre til positioneringstrinnene, er beskedens repræsentationsfejl mod en bane med sandhed integreret af Kshana, plus scenariets angivne od_sisre_m som kvadratsum; selve beskedtrinnet modellerer ingen banebestemmelse eller prædiktion. (resultat <c1/>)

seg-f75f874cdfaa = Positioneringstrinnet beregner sin egen jitter i delay-lock-loop ud fra den videregivne C/N0 med en formel for ubegrænset båndbredde; passagen rapporterer den faktiske udformnings båndbegrænsede jitter ved siden af. (resultat <c1/>)

seg-174ce18ade58 = Trinnet for præcis punktpositionering tager beskedens SISRE som LEO-bane- og urfejlen; dets kode- og fasestøj forbliver trinnets egne input. (resultat <c1/>)

seg-0aaff940eacb = Én satellit, den første hvis bånd bærer udformningen, står for hele LEO-systemet i passage- og beskedtrinnene. (resultat <c1/>)

seg-65930be43134 = MODELLED, kæden giver hvert trins output videre til det næste; trinnene beholder deres egne mærkater (rækkerne leo-signal, leo-pass, leo-navmsg, leo-pvt og leo-ppp i verifikationsmatrixen). (resultat <c1/>)

seg-bf452e9ae07f = MODELLED: hvert trin beholder sin egen mærkat; kæden tilføjer ingen fysik. (kommentar i scenariefilen, linje { "25" })

seg-0bff72185f12 = <s1>Forrige</s1>leo-pass

seg-851e55b87d01 = <s1>Næste</s1>leo-ppp
