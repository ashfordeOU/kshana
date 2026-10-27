# docs--kinds-inertial-fusion-and-quantum-sensors: translations (sv)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Typ

seg-ec26df467b88 = Gemensam PNT med Kalman-filtersensorfusion över samma hybrida indata.

seg-c8a1c797f4b1 = Diagrammet som motorn skriver för scenarios/fusion-pnt.toml, kind fusion

seg-38df285a3f25 = Löst och tätt kopplat GNSS/INS-feltillstånds-EKF.

seg-7d993b676006 = Diagrammet som motorn skriver för scenarios/gnss-ins.toml, kind gnss-ins

seg-c6edf89eb8d4 = Hybrid kvant+klassiskt tätt kopplat GNSS/INS-UKF med 17 tillstånd (MODELLED): { "15" } INS-feltillstånd + CAI-härledd korrigering av accelerometerbias + en klocka med 2 tillstånd (fas+frekvens) från q-parameterns klockmotor, driven av den intervallbegränsade CAI-felmodellen. Kvalitetsmåttet är filtrets självkonsistens (NEES + innovationsvithet mot χ²-gränser) — ett självkonsistenspåstående, INTE en garanti för noggrannhet i verkligheten. Endast simulering; ingen TRL>{ "3" }, ingen flygerfarenhet, ingen extern validering.

seg-2968660fa880 = Diagrammet som motorn skriver för scenarios/hybrid-ukf.toml, kind hybrid-ukf

seg-22cd963c7042 = Hybrid PNT-slutsten: klocka + IMU + stöd från tidsöverföring.

seg-52378a7b074c = Diagrammet som motorn skriver för scenarios/hybrid-pnt.toml, kind hybrid

seg-bdedf28adc48 = Tröghetsbaserad 1-DOF-dödräkning under ett GNSS-bortfall.

seg-873c402bb724 = Diagrammet som motorn skriver för scenarios/imu-deadreckoning.toml, kind inertial

seg-5b9a6efe6337 = INS/TRN-felmodell för fri tröghetsflygning (coasting): positionsfel mot varaktighet, byggd utifrån IMU-koefficienter i stället för att svepas som en antagen driftshastighet. Fem tillväxtbidrag — accelerometerbias, gyrobiasens lutning via gravitationen, hastighetsslumpvandring, vinkelslumpvandring och skalfaktor mot tillryggalagd sträcka — vart och ett propagerat genom en tröghetsfelmodell med nio tillstånd i lokalt horisontsystem med Schuler-återkoppling vid en angiven latitud och höjd (de ledande lagarna av lägsta ordning för korta förlopp t², t³, t^{ "1.5" }, t^{ "2.5" } och t¹/t² redovisas bredvid) och kombinerade enligt en ANGIVEN regel (kvadratsumma som standard, eller linjär summa, eller deterministisk summa med stokastisk kvadratsumma; alla tre beräknas vid varje körning så att valet syns i stället för att vara gömt). De varaktigheter som når positionströsklar angivna av anroparen ({ "10" } m och { "50" } m som standard) hittas med motorns befintliga intervallhalvering, var och en med en uppdelning per bidrag som pekar ut den dominerande källan, och varje enskilt bidrags passage inverteras dessutom algebraiskt så att de två stämmer överens. Ett terrängrelativt navigeringsläge (TRN) begränsar förloppet med periodiska positionsbestämningar och redovisar det största intervall mellan positionsbestämningar som håller varje tröskel; en positionsbestämning enbart av position lämnar hastighetsfel och lutning kvar över positionsbestämningen, så den begränsar inte alltid förloppet vid någon frekvens, och rapporten säger det i stället för att ge en nolla. MODELLED: IMU-klassernas koefficienter är representativa bandvärden, inte ett datablad, och residualen för terrängpositionsbestämningen är en indata. En tröskel som inte nås redovisas som null med en status, aldrig som en nolla. Ingen certifierad produkt för tröghetsnavigeringens prestanda.

seg-134a4c91da3a = Diagrammet som motorn skriver för scenarios/ins-trn-coast.toml, kind ins-trn-coast

seg-04310cd6cbec = MODELLED fel-/anomalidetektering för kvant-PNT-system: en märkt felkatalog (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC-AUC för detektionsstatistiken (med ett bootstrap-konfidensintervall från den externt validerade eval_stats) och ett minsta detekterbart fel vid en fast falsklarmsfrekvens, där den kvantklockstödda övervakaren (lägre brus) detekterar mindre fel — som ärlig TradeEvidence + representativitet. Gaussisk modell för detektionsstatistik (AUC = Phi(mu/(sigma*sqrt2))); modellerar klassen, illustrativa parametrar från offentliga källor, ingen TRL/flygerfarenhet/certifiering.

seg-2f1d14239d1a = Diagrammet som motorn skriver för scenarios/quantum-anomaly-detect.toml, typ quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantnavigering: under ett GNSS-bortfall, en inertiell budget för kvant (kall-atom-interferometer) mot en klassisk INS av navigeringsklass — tillväxt av positionsfel under glidflygningen, holdover till ett positionströskelvärde och avvägningen kvant mot klassisk som ärlig TradeEvidence med representativitet. Ärlig anmärkning om observerbarhet: utan extern positionsbestämning är accelerometerns bias inte observerbar, så felet växer; kvantsensorn bromsar men sluter inte det gapet. Illustrativa enhetsparametrar från offentliga källor; modellerar klassen, ingen TRL/flygerfarenhet/certifiering.

seg-1bdbf1a737b2 = Diagrammet som motorn skriver för scenarios/quantum-gnss-free-nav.toml, typ quantum-gnss-free-nav

seg-eb55d253dd11 = Avvägning kvant mot klassisk för PNT ({ "13503" }): fördelen i holdover för tidssynkronisering + inertiell holdover hos en kandidatklocka (en uppmätt ADEV-kurva — den avgörande punkten för försvarbarhet — eller en kvantklockklass) mot en klassisk baslinjeklass, med förbehållet om antagande om golv för lång tau bärt på artefakten, plus ett envelopp för GNSS-nekad resiliens mot tid. MODELLED; kvantifierar (validerar aldrig) en partnerenhet. Kandidatklockan är en uppmätt kurva (<c1/> + <c2/>, lika lång, minst { "2" } punkter; den vinner när båda formerna anges) eller en <c3/>.

seg-c74c63ffd859 = Diagrammet som motorn skriver för scenarios/quantum-trade.toml, typ quantum-trade

seg-4e31c8daf798 = Register

seg-9095869ec445 = { "9" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = Källa: <c1/>

seg-23762f3a250b = Tröghets-, fusions- och kvantsensorer (familj av scenariotyper)

seg-6ec3ad751007 = Ämnessidor: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Kör en: <c1/>. Alla familjer: <a4>KINDS.md</a4>.

seg-0e73a37b716b = Kontaktark med diagrammen som motorn skriver för typerna i familjen Tröghets-, fusions- och kvantsensorer

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = 17-tillstånds hybrid kvant+klassisk tätt kopplad GNSS/INS-UKF (MODELLED): { "15" } INS-feltillstånd + CAI-härledd korrektion av accelerationsbias + en klocka med 2 tillstånd (fas+frekvens) från q-parameterklockmotorn

seg-a7d3c32b29b3 = Felmodell för INS/TRN-svävning: positionsfel mot svävningstid, byggd av IMU-koefficienter i stället för svept som en antagen driftshastighet.

seg-beb568dec44f = MODELLED GNSS-fri kvantnavigering: under ett GNSS-bortfall, en kvantbaserad (kallatomsinterferometer) tröghetsbudget mot ett klassiskt INS i navigationsklass — positionsfelets tillväxt under svävningen, holdover

seg-d948ea4d1f33 = MODELLED fel- och anomalidetektering för kvant-PNT-system: en märkt felkatalog (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en detektionsstatistik med ROC AUC (med ett bootstrap-KI

seg-48e72d451a50 = Avvägning kvant mot klassisk PNT ({ "13503" }): nyttan i tidssynkroniserings-holdover och tröghets-holdover hos en kandidatklocka (en uppmätt ADEV-kurva — den punkt som försvarbarheten hänger på — eller en kvantklockklass) mot en klassisk bas

seg-5330b47bc0b6 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valfria: <c7/>.

seg-75867e8b4b4f = <b>Register:</b> MODELLED { "6" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>inertial</a1>.

seg-fdf140d4ce68 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-44c6371da5f9 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>hybrid</a1>.

seg-3246c9e1e0cb = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valfria: <c11/>.

seg-e2bd8fd0d9e5 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>fusion</a1>.

seg-d0790a2643ae = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valfria: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

seg-85ab600e3050 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>hybrid-ukf</a1>.

seg-3bbd5ce09bee = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valfria: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-08ad3969f65b = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>gnss-ins</a1>.

seg-1703619ca20e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-ab3453d1ee51 = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>ins-trn-coast</a1>.

seg-a77cdf6e8e31 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>.

seg-b05e96ce392d = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>quantum-gnss-free-nav</a1>.

seg-3f3e48045d31 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-cbefb1538dec = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>quantum-anomaly-detect</a1>.

seg-6eee03151521 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>. Valfria: <c5/>, <c6/>, <c7/>, <c8/>.

seg-6cb57dc94549 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>quantum-trade</a1>.

seg-b6c31bdda166 = <s1>Föregående</s1>Alternativ PNT utan GPS

seg-0585e4ae329e = <s1>Nästa</s1>Jamming spoofing och spektrumet
