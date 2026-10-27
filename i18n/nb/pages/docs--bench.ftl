# docs--bench: translations (nb)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Kilde: <c1/>

seg-d3c3517e3bb2 = Et åpent sett med oppgaver, delinger og metrikker for deteksjon av GNSS-interferens og tidsholdover. Spesifikasjonen er <a1><c1/></a1> (versjon { "2.0.0" }; lisens for teksten og manifestene: CC-BY-4.0 / CC0 foreslått, eierens beslutning venter). Gjennomgangen av datasettenes lisenser er <a2><c2/></a2>. Terskelene for grunnlinjene ble fastsatt før den første skårede kjøringen i <a3><c3/></a3> og, for { "2.0.0" }, i <a4><c4/></a4>, og resultatene deres står i <a5><c5/></a5>.

seg-6c455061baac = Utfall slik de er registrert der: scorerens terskler, C1 til C3 og D2, er nådd. <b>A2 er NOT MET</b> (<c1/> AUC { "0.766" } mot minst { "0.80" } på testdelen), <b>D1 er NOT MET</b> (største gap { "0.0301" }) og <b>oppgave (b) R1 er NOT MET</b> (overført, ikke kjørt på nytt). Ingen terskel er løsnet.

seg-ebe1c987bc7c = Hva det er: en måte å sammenligne metoder på de samme dataene med den samme metrikkoden. Hva det ikke er: en rangering av produkter, en godkjenning eller bevis for at en metode virker i felt. Hver skår er MODELLED, og en skår beskriver en logg eller et korpus, aldri et produkt. Resultater fra Kshana er veiledende.

seg-874effe5ee80 = De innebygde grunnlinjene for kshana-bench oppgave D (optimismegapet) på testdelen, fra en faktisk kjøring av motoren v{ $version } (`kshana bench baseline`). Hvert søylepar er arealet under ROC-kurven for tilfellene i fordelingen og for de forskjøvede tilfellene. Gapet mellom dem er optimismegapet, mot en toleranse på { "0.05" }. fused-max-z: { "0.998" } og { "0.983" } (gap { "0.015" }); sqm-imbalance: { "0.882" } og { "0.882" } (gap { "0.001" }); agc-excess: { "0.848" } og { "0.819" } (gap { "0.030" }); raim-parity: { "0.682" } og { "0.672" } (gap { "0.010" }); energy-cn0-drop: { "0.595" } og { "0.565" } (gap { "0.030" }). Etikettene er etiketter fra en generativ modell for et syntetisk korpus, aldri feltdata: MODELLED. Veiledende: modellert eller målt mot oppgitte referanser, ikke en godkjenning, sertifisering eller erklæring om samsvar. En skår beskriver en logg eller et korpus, aldri et produkt.

seg-6ce7bd4525d6 = Oppgaver

seg-09907c94f04d = Oppgave

seg-1c6199627b90 = Data

seg-9cdfe78e3b22 = Primærmetrikk

seg-5093217f24a1 = (a) deteksjon på mottakerlogger

seg-809068c95ddf = én epoke fra en JammerTest { "2024" }-logg

seg-f87dda92fbd2 = hentet av <c1/> (GPL-3.0+, aldri medfølgende)

seg-9493bfc5bd64 = (b) deteksjon på IQ

seg-8d012e25aa62 = ett skåret vindu av en scene

seg-69f020ed20da = syntetisk scenemal fra Kshana; TEXBAT kun som referanse

seg-499ae444224e = AUC per alarmtype

seg-73028caefeb0 = (c) prediksjon av tidsholdover

seg-0d0b071690cf = (satellitt, opprinnelse)

seg-6cf42152f523 = IGS-klokker ved { "300" } s (innsjekket utdrag, festet hash)

seg-74bd23dfebf5 = RMSE ved { "3600" } s

seg-3cc3545250e5 = (d) optimismegap utenfor fordelingen

seg-ab343a29b019 = ett syntetisk tilfelle

seg-b25d781ff536 = korpuset <c1/>, i og utenfor fordelingen

seg-e32f49d34f7b = AUC ut, og gapet

seg-1ad563733f12 = Kommandoer

seg-c9d00ff2e1d0 = En innsending er en fil (<c1/>): <c2/> (ett tall per tilfelle-ID; høyere betyr større sannsynlighet for påvirkning) for oppgavene a, b og d, eller <c3/> (faseendringen i ns ved hver horisont) for oppgave c. En resultatfil (<c4/>) oppgir spesifikasjonsversjonen, delingen, SHA-256 av referansen og av prediksjonene, og metrikkene. Resultater fra ulike hovedversjoner av spesifikasjonen settes aldri i samme tabell.

seg-bdc715c52ab5 = Ærlige begrensninger

seg-f26f0e79f2ed = De tilbakeholdte datasettene med ekte data (a og c) er offentlige, fordi alle kan laste ned dataene. De beskytter mot å velge en deling etter å ha sett skårene, ikke mot å justere på disse mappene. Det forseglede tilbakeholdte datasettet for oppgave (d) er en forpliktelse med senere avsløring: eieren forplikter seg bare med hashen i <c1/> og beholder seedet (ingen er forseglet ennå).

seg-81c3f961230b = Referansen for oppgave (a) er de planlagte angrepsintervallene i hendelsesloggene med oppløsning på ett minutt, så en deteksjonssannsynlighet er en nedre grense. Metrikkene på hendelsesnivå (forsinkelse, uteblitte alarmer, falske alarmer) kommer med Jammertest-scoreren i <c1/>.

seg-47df52b5c5e6 = IQ-grunnlinjen for oppgave (b) er overført fra <c1/> og ikke kjørt på nytt for v1.

seg-d54342791763 = Korpuset for oppgave (d) er en kontroll av separerbarhet og pipeline. En AUC på det er en AUC over etiketter utledet fra modellen.

seg-3d8bfdeead6c = <s1>Forrige</s1>Interferensobservatorium: resultater

seg-07f5b51844d1 = <s1>Neste</s1>Å kjøre en mottaker mot et scenario
