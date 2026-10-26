# docs--bench: translations (da)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Kilde: <c1/>

seg-d3c3517e3bb2 = Et åbent sæt af opgaver, opdelinger og metrikker til detektion af GNSS-interferens og tids-holdover. Specifikationen er <a1><c1/></a1> (version { "2.0.0" }; licens for teksten og manifesterne: CC-BY-4.0 / CC0 foreslået, ejerens beslutning afventer). Gennemgangen af datasættets licens er <a2><c2/></a2>. Baselines' tærskler blev fastsat før den første scorede kørsel i <a3><c3/></a3> og, for { "2.0.0" }, i <a4><c4/></a4>, og deres resultater står i <a5><c5/></a5>.

seg-6c455061baac = Afgørelser som registreret dér: scorerens tærskler, C1 til C3 og D2, er nået; <b>A2 er NOT MET</b> (<c1/> AUC { "0.766" } mod mindst { "0.80" } på testopdelingen), <b>D1 er NOT MET</b> (største afstand { "0.0301" }) og <b>opgave (b) R1 er NOT MET</b> (videreført, ikke kørt igen). Ingen tærskel er løsnet.

seg-ebe1c987bc7c = Hvad det er: en måde at sammenligne metoder på de samme data med den samme metrikkode. Hvad det ikke er: en rangordning af produkter, en godkendelse eller belæg for, at en metode virker i felten. Hver score er MODELLED, og en score beskriver en log eller et korpus, aldrig et produkt. Kshana-resultater er vejledende.

seg-874effe5ee80 = De indbyggede baselines i kshana-bench opgave D (optimismegabet) på testopdelingen, fra en rigtig kørsel af motoren v{ $version } (`kshana bench baseline`). Hvert søjlepar er arealet under ROC-kurven på tilfældene inden for fordelingen og på de forskudte tilfælde; afstanden mellem dem er optimismegabet, mod en tolerance på { "0.05" }. fused-max-z: { "0.998" } og { "0.983" } (gab { "0.015" }); sqm-imbalance: { "0.882" } og { "0.882" } (gab { "0.001" }); agc-excess: { "0.848" } og { "0.819" } (gab { "0.030" }); raim-parity: { "0.682" } og { "0.672" } (gab { "0.010" }); energy-cn0-drop: { "0.595" } og { "0.565" } (gab { "0.030" }). Labelerne er labels fra en generativ model i et syntetisk korpus, aldrig feltdata: MODELLED. Vejledende: modelleret eller målt mod angivne referencer, ikke en godkendelse, certificering eller erklæring om overensstemmelse. En score beskriver en log eller et korpus, aldrig et produkt.

seg-6ce7bd4525d6 = Opgaver

seg-09907c94f04d = Opgave

seg-1c6199627b90 = Data

seg-9cdfe78e3b22 = Primær metrik

seg-5093217f24a1 = (a) detektion på modtagerlogs

seg-809068c95ddf = én epoke af en JammerTest { "2024" }-log

seg-f87dda92fbd2 = hentes med <c1/> (GPL-3.0+, aldrig medleveret)

seg-9493bfc5bd64 = (b) detektion på IQ

seg-8d012e25aa62 = ét scoret vindue af en scene

seg-69f020ed20da = Kshanas opskrift på syntetiske scener; TEXBAT kun som reference

seg-499ae444224e = AUC pr. alarmtype

seg-73028caefeb0 = (c) forudsigelse af tids-holdover

seg-0d0b071690cf = (satellit, oprindelse)

seg-6cf42152f523 = IGS-ure ved { "300" } s (indsendt uddrag, fastlåst hash)

seg-74bd23dfebf5 = RMSE ved { "3600" } s

seg-3cc3545250e5 = (d) optimismegab uden for fordelingen

seg-ab343a29b019 = ét syntetisk tilfælde

seg-b25d781ff536 = korpus <c1/>, inden for og uden for fordelingen

seg-e32f49d34f7b = AUC ud, og gabet

seg-1ad563733f12 = Kommandoer

seg-c9d00ff2e1d0 = En indsendelse er en fil (<c1/>): <c2/> (ét tal pr. tilfælds-id; højere betyder mere sandsynligt forringet) til opgave a, b og d, eller <c3/> (faseændringen i ns ved hver horisont) til opgave c. En resultatfil (<c4/>) angiver specifikationsversionen, opdelingen, SHA-256 af referencen og af forudsigelserne samt metrikkerne. Resultater fra forskellige hovedversioner af specifikationen sættes aldrig i samme tabel.

seg-bdc715c52ab5 = Ærlige begrænsninger

seg-f26f0e79f2ed = De tilbageholdte datasæt med rigtige data (a og c) er offentlige, fordi enhver kan hente dataene. De beskytter mod at vælge en opdeling, efter at man har set scores, ikke mod tuning på de mapper. Det forseglede tilbageholdte datasæt til opgave (d) er et commit-og-afslør: ejeren committer kun hashen til <c1/> og beholder seedet (intet er forseglet endnu).

seg-81c3f961230b = Referencen for opgave (a) er de planlagte angrebsvinduer i hændelseslogs med en opløsning på ét minut, så en detektionssandsynlighed er en nedre grænse; metrikkerne på hændelsesniveau (latenstid, oversete alarmer, falske alarmer) kommer med Jammertest-scoreren i <c1/>.

seg-47df52b5c5e6 = IQ-baseline for opgave (b) er videreført fra <c1/> og ikke kørt igen til v1.

seg-d54342791763 = Korpusset til opgave (d) er en kontrol af separerbarhed og pipeline; en AUC på det er en AUC over labels afledt af modellen.

seg-3d8bfdeead6c = <s1>Forrige</s1>Interferensobservatorium: resultater

seg-07f5b51844d1 = <s1>Næste</s1>Kørsel af en modtager mod et scenarie
