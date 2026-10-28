# docs--tutorials: translations (sv)

seg-501402fc366f = Klock-holdover

seg-cae10fb9bff8 = Scenario

seg-a0b63210b807 = Läs mer

seg-a7cfe6f135f1 = Bana & geometri

seg-835df2d05f2a = GNSS-mätdomänen

seg-3a0e724a8a2b = Nivå

seg-28e87f407a10 = Område

seg-d6476863f862 = Förmåga

seg-029de6b99be0 = Tröghetsnavigering

seg-9ef8f99ca6e4 = Tidsöverföring

seg-b03d56f501c3 = Typ

seg-ec26df467b88 = Gemensam PNT med Kalman-filtersensorfusion över samma hybrida indata.

seg-4f19d4fb1341 = Generellt N-dimensionellt svep över valfritt paket via punktseparerade TOML-nycklar / JSON-mätvärdessökvägar.

seg-e7ab7b55c969 = 1-D-svep för en avvägningsstudie över en parameter i klockpaketet.

seg-e43910de5fd8 = Notebooks

seg-d78822583c64 = Notebook

seg-3959aefa12be = Källa: <c1/>

seg-a5ebe4befda8 = Praktiska, genomgångna exempel som tar dig från ”kör ett medföljande scenario” till ”kvantifiera och försvara ett resultat”. Varje tal som citeras i de tre handledningarna är ett verkligt motorresultat, förankrat i en extern (icke-cirkulär) auktoritativ oberoende referens och <b>fastlåst av ett integrationstest</b> (<c1/>), så en handledning kan aldrig i det tysta avvika från vad motorn faktiskt gör. Om en handledning säger att den optiska klockan klarar { "6600" } s, fäller testet bygget den dag det slutar vara sant.

seg-1c045624a6be = Kshana är en simulator för positionering, navigering och tidssynkronisering (PNT). Handledningarna använder några fler förkortningar, var och en utskriven där den först förekommer: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (command-line interface, kommandoradsgränssnitt) och TOML (Tom's Obvious Minimal Language, scenariofilens format).

seg-7a84a80b57d5 = Är du ny i projektet? Läs först <a1>begreppsintroduktionen</a1> och <a2>ordlistan</a2> och kom sedan tillbaka hit.

seg-b4cd44590347 = De tre genomgångna exemplen

seg-eebeab9693b2 = Handledning

seg-a0bc6e585d71 = Vad du lär dig

seg-b6cc01b76947 = Scenariotyp

seg-429bab0a0e05 = Svårighetsgrad

seg-0e188f9c0f65 = ~Tid

seg-bcf40448e55d = Min första bana: var finns GPS-satelliterna

seg-de1032024a69 = propagera en verklig GPS-konstellation, läsa av tillgänglighet, positionens precisionsförsämring (PDOP) och positionsnoggrannhet samt exportera var satelliterna faktiskt befinner sig (SP3, det precisa banformatet)

seg-e7b6c262333e = nybörjare

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Klock-holdover: hur länge klarar du dig själv

seg-0e9c77468fb2 = köra en klock-holdover utan GNSS, läsa av tidsmåttet och förstå tillväxtlagen √(q_wf·T) bakom det

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Kvant mot klassisk GNSS-resiliens

seg-4d8036091b37 = slutprovet: en spoofing-detektor (<c1/>) och en fullständig sammanslagen PNT-svit (<c2/>), och hur du läser säkerhet, integritet och dödräkning tillsammans

seg-1b39d4927602 = medel

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Körbara Jupyter-anteckningsböcker, på syntetiska data och offentliga elementmängder som bara finns i förrådet, finns i <a1><c1/></a1>:

seg-9aae3a4e10dc = Fartygsförtroende och utbildning

seg-1d680d635c6d = generera en syntetisk NMEA-ström från en brygga med en skriptad händelse och poängsätta den med fartygets förtroendemonitorer (rådgivande, inte typgodkänd navigationsutrustning)

seg-739f8f5a9082 = var navigeringsdata har sett försämrade ut och hur stor del av en rutt de berör

seg-443c908ff49b = Compliance-kartläggning och export till testbänk

seg-0d639065192a = vilka rader i offentliga ramverk en uppsättning körningar ger belägg för (aldrig att ett ramverk uppfylls), och ett scenarios rörelse och händelser exporterade som text för en GNSS-simulator i laboratorium (ingen signal skrivs)

seg-981a3238794d = Kvant mot klassisk GDOP

seg-228ce150ee80 = samma konstellationsgeometri med en kvantsensor och en klassisk sensor, jämförda med precisionsförsämring

seg-4b82b5edd4ff = Himmelsgeometri under en siluett

seg-1186b6cd6149 = de satelliter en plats ser under en gatu- eller kajsiluett, deras DOP och felellips, en daterad himmel från elementmängder och en Monte Carlo med frö mot kovariansen (MODELLED)

seg-d9d06cb8e237 = Så kör du en handledning

seg-ffc4ddfc9426 = Varje handledning kör samma scenario på tre sätt; välj det som passar dig. Alla anropar <em>en</em> motor, så talen är identiska (motsvarar avsnittet <a1>Användning</a1> i README).

seg-e7ba76a06aa6 = <b>Kommandorad.</b> CLI:t väljer väg utifrån scenariots fält <c1/> och skriver <c2/>, <c3/>, <c4/> och <c5/> bredvid indatafilen (JSON är JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Några typer publicerar också en reproducerbarhetstabell som <c6/> (kommaseparerade värden): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> och <c12/> när en exportplats är angiven. Ingen av de tre handledningarna är någon av dem, så du ser inte den filen här.

seg-5ee6f15d3b08 = <c1/> bygger CLI:t från den här utcheckningen. Med en installerad binär (<c2/>) är samma kommando <c3/>. Utan utcheckning är de flesta medföljande scenarier inbyggda i binären: <c4/> listar dem (och nämner de få som inte är inbyggda, med skälet), och <c5/> skriver ut ett: den kopia av <c6/> som binären byggdes med.

seg-1b7e851749d5 = <b>Python.</b> Bygg tillägget från den här utcheckningen en gång med maturin, i en aktiv virtuell miljö, och anropa sedan <c1/>:

seg-3aa10d551694 = <c1/> installerar i stället det publicerade wheel-paketet. Det kan ligga efter den här utcheckningen: <c2/> visar vilka scenariotyper ditt bygge har.

seg-333b7956b06b = <b>Lekplats i webbläsaren.</b> Ingen installation: öppna <a1>Studio</a1>, välj ett scenario, redigera parametrarna och läs resultatet. Ingenting laddas upp; motorn körs hos klienten som WebAssembly.

seg-2cd8bbd1e7f0 = Handledningarna citerar <b>CLI:t</b>, men varje kommando har motsvarigheten i Python och lekplatsen ovan. Varje resultat går att reproducera från <c1/>: kör det två gånger så får du bitidentiska utdata.

seg-d497caeb889a = Kommenterade undervisningsscenarier

seg-c966709a600d = För varje förmågeområde finns en rikt kommenterad <c1/> under <a1><c2/></a1>: en <em>undervisningskopia</em> av ett kanoniskt scenario där varje fält förklaras på plats, den åberopade oberoende referensen namnges och den förväntade sammanfattningen på en rad finns registrerad som en <c3/>-kommentar. Fältvärdena är identiska med förlagans i förrådets översta katalog <c4/> (<c5/> jämför den tolkade TOML-filen), så den dokumenterade utdatan förblir sann. De gyllene hasharna är också orörda: en kommentar ändrar aldrig ett scenarios hash.

seg-871fcecc5ee1 = Undervisningsfil

seg-4e852a6a1581 = Härledd från

seg-e74e1c9b387e = Integritet (RAIM, receiver autonomous integrity monitoring)

seg-95b6cceb76e6 = Säkerhet (spoofing)

seg-dab48471c270 = Hybrid-PNT

seg-c889e5e77121 = Undervisningsfilen för <b>säkerhet</b> använder <c1/> internt: måttet för säkerhet (<c2/>, ett minus sannolikheten för missad detektion) produceras av spoof-paketet. Filnamnet följer <em>förmågan</em> (säkerhet), medan <c3/> följer <em>paketet</em> (spoof). Filens huvud pekar ut detta.

seg-89fef83a9d54 = Hela katalogen över scenariotyper

seg-0f744a3a7193 = Klock-holdover mot specifikation; valfritt Monte Carlo-ensemble (<c1/>).

seg-9a2564fdc86a = Tröghetsbaserad dödräkning i 1-DOF (en frihetsgrad) under ett GNSS-avbrott.

seg-62f0400581b3 = GNSS-tillgänglighet + precisionsförsämring (DOP) från en konstellation (Walker / tvåradiga elementmängder / RINEX, Receiver Independent Exchange-formatet).

seg-59fc8330ba12 = Snapshot / solution-separation / ARAIM (advanced RAIM) med horisontella och vertikala skyddsnivåer (HPL/VPL) + Stanford-diagram.

seg-22c598d57e77 = ARAIM-skyddsnivåpass vid månens sydpol mot en uppsättning LunaNet-reläer.

seg-f97d8fb3b6fa = Optisk mot radiofrekvent (RF) tvåvägsöverföring av tid och frekvens.

seg-8af1c652d854 = Slutprov för hybrid-PNT: klocka + tröghetsmätenhet (IMU) + stöd från tidsöverföring.

seg-d24a9596f53e = Löst och tätt kopplat GNSS/INS (tröghetsnavigeringssystem), utökat Kalman-filter med feltillstånd.

seg-3c915870476a = Pseudoavståndssimulering i mätdomänen (Klobuchar-jonosfär, Saastamoinen/Niell-troposfär) + RAIM.

seg-72284bad54e4 = Jamming med länkbudget: störsignal-till-signal-förhållande (J/S) → effektiv bärvåg-till-brustäthet (C/N₀) → förlorad låsning.

seg-2ead4d42b427 = Stokastisk detektor för tidsspoofing (Neyman–Pearson / χ²₁) med Monte Carlo-sannolikheter för falsklarm och missad detektion (P_fa/P_md).

seg-5f2f9e63093a = Bortom handledningarna: nyare förmågor

seg-3d6a8fd31402 = De tre handledningarna håller sig till de klassiska paketen för klocka, bana och säkerhet. Motorn har vuxit långt bortom dem. Varje rad nedan är ett medföljande scenario som du kan köra som det är (<c1/> eller <c2/>); sammanfattningen är den första raden som kshana { "0.35.0" } skrev ut för det den 2026-10-10. Till skillnad från handledningarnas värden är dessa rader en registrering av en körning och inte fastlåsta av <c3/>: kör scenariot igen för att få aktuellt värde. Resultaten anger sin egen omfattning (de flesta har en <c4/>), och <a1>verifieringsmatrisen</a1> anger vilka förmågor som är VALIDATED mot en extern oberoende referens och vilka som är MODELLED.

seg-2dc1d8680abb = Första raden i sammanfattningen

seg-abd799395f27 = L-bandsspektrum och jamming-vattenfall

seg-33453b2cfdf3 = Solsystemet vid en epok

seg-23bc4ff7f741 = Positionering kring en annan himlakropp

seg-c135b151e469 = Konstellationsutformning i stor skala

seg-065995e9bd5e = Kampanjer: typer kedjade på en tidslinje

seg-dbae357e7e34 = Ett LEO-PNT-system från början till slut

seg-9d3d72ea03df = Sammanslagen positionering med MEO + LEO

seg-acc2793d1721 = LEO-signaler, pass och navigeringsmeddelanden

seg-db2626e54a24 = <c1/> (passet)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = PPP-konvergens med ett LEO-lager; 5G-positionering

seg-01160980ce50 = Resiliens: GNSS störs ut med jamming, LEO bär användaren

seg-adf8453bc035 = Vertikaler: järnväg, sjöfart, telekom, fordon, Arktis

seg-15a5098b5045 = <c1/> (och de andra <c2/>-filerna)

seg-e6494ed83ee3 = Telekom-holdover mot klockgränserna i ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

seg-dfc04f1abe82 = LEO är låg jordbana och MEO medelhög jordbana; PVT är position, hastighet och tid; PPP är precis punktpositionering; 5G är den femte generationens mobilstandard; TDB är barycentrisk dynamisk tid; JD är juliansk dag; TE är tidsfel.

seg-1d45d94f2e5b = CLI:t lägger till tre utdata ovanpå varje körning:

seg-893276648fec = <b>Rapporter.</b> Varje körning skriver <c1/> och <c2/> (se <a1>REPORTS.md</a1>). <c3/> kör en svit av scenarier till en <c4/> och en <c5/>, till exempel <c6/>.

seg-e9f06d47c82c = <c1/> renderar körningens tidsserie, till exempel skriver <c2/> på <c3/> filen <c4/>. En typ utan samplad tidsaxel (som <c5/>) avvisas med ett fel; se <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Export för samverkan.

seg-3977722b8517 = <c1/> skriver resultatet för andra verktyg: CZML (Cesium Language), KML (Keyhole Markup Language, för Google Earth), GeoJSON (geografisk JSON), en STK-efemerid (Systems Tool Kit) eller en SigMF-inspelning (Signal Metadata Format). <c2/> anger vilka format som gäller för ett scenario; SigMF gäller bara <c3/>. Omloppspaketet exporterar också <c4/>, <c5/> och <c6/> (CCSDS, Consultative Committee for Space Data Systems, banmeddelanden). Se <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Graderade övningar

seg-9513af4fb862 = Arbeta dig uppför stegen. Varje nivå är svårare och mer försvarbar än den förra; referenslösningar finns i <a1><c1/></a1>.

seg-89ad8eb64a54 = Mål

seg-0a824838ef57 = Vad du gör

seg-2463a86470b8 = Referenslösning

seg-7ce3ac2347b9 = Nivå { "1" } – kör och läs

seg-e1dee35aedff = kör ett medföljande scenario oförändrat och läs av ett kvalitetsmått

seg-296694716b3b = Kör <c1/>; skriv ut <c2/> för kvant mot klassisk. CLI, lekplats eller ett Python-anrop på en rad.

seg-bad6d3afb6a0 = Nivå { "2" } – redigera och svep

seg-c18da238e470 = ändra en parameter och observera en monoton effekt

seg-598ca8efea83 = Skärp klockspecifikationen (<c1/>) eller förläng avbrottet och se holdover sjunka; eller använd <c2/>/<c3/> för att tabellera det.

seg-1d9dfecce6fa = Nivå { "3" } – kvantifiera och försvara

seg-5b57f2c8ffb9 = Monte Carlo, konfidensband, reproducerbarhet och en skyddsnivå

seg-0fac2036b289 = Kör ett klockensemble (<c1/>), läs av bandet [p05–p95], bekräfta att två körningar ger identisk <c2/> och läs ett integritets-/Stanford-resultat.

seg-45dc753da682 = Referenslösningarna använder Python-tillägget (<c1/> först). Körd från förrådets rot skriver <c2/> ut hur den chipskaliga atomklockans holdover faller från { "2610" } s vid en specifikation på { "20" } ns till { "1140" } s vid { "5" } ns.

seg-e59b1beadb98 = Vill du ha färska data?

seg-530db2e609d0 = Huvudvärdena i de här handledningarna körs helt från scenarier som redan finns i förrådet. Ingenting hämtas, vilket är det som håller dem reproducerbara och säkra att köra i kontinuerlig integration (CI). För övningarna ”bygg vidare” kan du hämta levande data:

seg-6a20ec96cb92 = <b>Tvåradiga elementmängder (TLE) för GPS</b> (uppdatera omloppskonstellationen): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, elementmängder i klartext med 3 rader (namn + rad { "1" } + rad { "2" }). Hjälpskript: <c1/>. Öppna data (katalogen från US Space Force 18th Space Defense Squadron, vidaredistribuerad av Celestrak, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Oberoende referens för verifiering av SGP4 (Simplified General Perturbations { "4" })</b> (redan inkluderad, hämta inte igen): testvektorerna i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 ”Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, som används av <c1/>; se <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Oberoende referens för klockstabilitetens samband</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, sambanden mellan σ_y(τ) och fas bakom handledning { "2" }.

seg-36be39f17e35 = <s1>Föregående</s1>Studio-guide

seg-6f6204737a87 = <s1>Nästa</s1>{ "1" } · Din första bana

seg-2fa9e002b3a2 = Motorn väljer väg utifrån scenariots <c1/>. Tabellen nedan listar de vanligaste typerna (de åtta handledningsområdena ovan samt deras närmaste grannar). Den är <b>inte</b> den fullständiga uppsättningen: <c2/> returnerar alla <c3/> inbyggda typer. Den funktionen (tillgänglig som <c4/> i bindningarna för Python och WebAssembly (WASM), och som <c5/> på kommandoraden) är den auktoritativa, alltid aktuella katalogen, och <a1><c6/></a1> är dess genererade uppräkning, ett avsnitt per typ med de obligatoriska och valfria TOML-fälten. <c7/> säkerställer att varje typ som en handledning dokumenterar är en verklig typ att välja väg efter, så ingenting i den här tabellen kan nämna en typ som inte finns.
