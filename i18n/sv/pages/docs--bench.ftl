# docs--bench: translations (sv)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Källa: <c1/>

seg-d3c3517e3bb2 = En öppen uppsättning uppgifter, delningar och mått för detektering av GNSS-störningar och holdover för tidssynkronisering. Specifikationen finns i <a1><c1/></a1> (version { "2.0.0" }; licens för texten och manifesten: CC-BY-4.0 / CC0 föreslås, ägarens beslut väntar). Granskningen av datamängdens licenser finns i <a2><c2/></a2>. Baslinjernas trösklar fastställdes före den första poängsatta körningen i <a3><c3/></a3> och, för { "2.0.0" }, i <a4><c4/></a4>, och deras resultat finns i <a5><c5/></a5>.

seg-6c455061baac = Utfall så som de registrerats där: poängsättarens trösklar, C1 till C3 och D2, är MET. <b>A2 är NOT MET</b> (<c1/> AUC { "0.766" } mot minst { "0.80" } på testdelningen), <b>D1 är NOT MET</b> (största glapp { "0.0301" }) och <b>uppgift (b) R1 är NOT MET</b> (överfört, inte körd på nytt). Ingen tröskel har sänkts.

seg-ebe1c987bc7c = Vad det är: ett sätt att jämföra metoder på samma data med samma mätkod. Vad det inte är: en rangordning av produkter, ett godkännande eller belägg för att en metod fungerar i fält. Varje poäng är MODELLED, och en poäng beskriver en logg eller ett korpus, aldrig en produkt. Resultaten från { -brand } är rådgivande.

seg-874effe5ee80 = De inbyggda baslinjerna för kshana-bench uppgift D (optimismglappet) på testdelningen, från en verklig körning av motor v{ $version } (`kshana bench baseline`). Varje tröskelpar är arean under ROC-kurvan för fallen inom fördelningen och för de förskjutna fallen. Glappet mellan dem är optimismglappet, mot en tolerans på { "0.05" }. fused-max-z: { "0.998" } och { "0.983" } (glapp { "0.015" }); sqm-imbalance: { "0.882" } och { "0.882" } (glapp { "0.001" }); agc-excess: { "0.848" } och { "0.819" } (glapp { "0.030" }); raim-parity: { "0.682" } och { "0.672" } (glapp { "0.010" }); energy-cn0-drop: { "0.595" } och { "0.565" } (glapp { "0.030" }). Etiketterna är etiketter från en generativ modell av ett syntetiskt korpus, aldrig fältdata: MODELLED. Rådgivande: modellerat eller mätt mot angivna referenser, inte ett godkännande, ingen certifiering och inget uttalande om överensstämmelse. En poäng beskriver en logg eller ett korpus, aldrig en produkt.

seg-6ce7bd4525d6 = Uppgifter

seg-09907c94f04d = Uppgift

seg-1c6199627b90 = Data

seg-9cdfe78e3b22 = Primärt mått

seg-5093217f24a1 = (a) detektering i mottagarloggar

seg-809068c95ddf = en epok ur en JammerTest { "2024" }-logg

seg-f87dda92fbd2 = hämtas av <c1/> (GPL-3.0+, aldrig medföljande)

seg-9493bfc5bd64 = (b) detektering i IQ

seg-8d012e25aa62 = ett poängsatt fönster i en scen

seg-69f020ed20da = syntetiskt scenrecept från { -brand }; TEXBAT endast som referens

seg-499ae444224e = AUC per larmtyp

seg-73028caefeb0 = (c) prediktion av holdover för tidssynkronisering

seg-0d0b071690cf = (satellit, ursprung)

seg-6cf42152f523 = IGS-klockor vid { "300" } s (inchecktat utdrag, fastlåst hash)

seg-74bd23dfebf5 = RMSE vid { "3600" } s

seg-3cc3545250e5 = (d) optimismglapp utanför fördelningen

seg-ab343a29b019 = ett syntetiskt fall

seg-b25d781ff536 = korpuset <c1/>, inom och utanför fördelningen

seg-e32f49d34f7b = AUC ut, och glappet

seg-1ad563733f12 = Kommandon

seg-c9d00ff2e1d0 = Ett bidrag är en fil (<c1/>): <c2/> (ett tal per fall-id; högre betyder större sannolikhet för störning) för uppgifterna a, b och d, eller <c3/> (fasändringen i ns vid varje horisont) för uppgift c. En resultatfil (<c4/>) anger specifikationsversion, delning, SHA-256 för referensen och för prediktionerna samt måtten. Resultat från olika huvudversioner av specifikationen läggs aldrig i samma tabell.

seg-bdc715c52ab5 = Ärliga begränsningar

seg-f26f0e79f2ed = De undanhållna datamängderna med verkliga data (a och c) är offentliga, eftersom vem som helst kan ladda ned data. De skyddar mot att välja en delning efter att ha sett poängen, inte mot justering på dessa mappar. Den förseglade undanhållna datamängden för uppgift (d) är ett åtagande och en avslöjande: ägaren åtar sig bara hashen i <c1/> och behåller fröet (ingen är förseglad än).

seg-81c3f961230b = Referensen för uppgift (a) är de schemalagda attackintervallen i händelseloggarna med en minuts upplösning, så en detektionssannolikhet är en nedre gräns. Måtten på händelsenivå (latens, missade larm, falska larm) kommer med Jammertest-poängsättaren i <c1/>.

seg-47df52b5c5e6 = IQ-baslinjen för uppgift (b) är överförd från <c1/> och har inte körts på nytt för v1.

seg-d54342791763 = Korpuset för uppgift (d) är en kontroll av separerbarhet och pipeline. En AUC på det är en AUC över modellhärledda etiketter.

seg-3d8bfdeead6c = <s1>Föregående</s1>Störningsobservatorium: resultat

seg-07f5b51844d1 = <s1>Nästa</s1>Att köra en mottagare mot ett scenario
