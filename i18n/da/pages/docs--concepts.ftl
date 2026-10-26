# docs--concepts: translations (da)

seg-501402fc366f = Urets holdover

seg-9c0eb89a2fbe = Pakke

seg-41b3740e1db9 = Kilde: <c1/>

seg-8ab3fd09812d = Begreber: en introduktion i almindeligt sprog

seg-0f86d0a815d2 = Denne side forklarer <em>hvad Kshana gør, og hvorfor</em>, fra bunden og op til fysikken. Der forudsættes ingen forkundskaber i første del; de senere afsnit tilføjer de præcise sammenhænge for specialister. Ord-for-ord-definitioner findes i <a1>ordlisten</a1>.

seg-34f76bad58cb = { "1" }. Problemet i ét afsnit

seg-45c0199e2224 = Næsten alt, der skal vide <em>hvor det er</em> eller <em>hvad klokken er</em>, støtter sig til signaler fra navigationssatellitter: telefoner, fly, skibe, satellitter, elnet, finansielle systemer (GPS (Global Positioning System) og dets søskende, samlet <b>GNSS</b> (global navigation satellite system)). Disse signaler er svage og lette at miste: forstyrret med jamming, blokeret eller simpelthen udenfor syne i rummet. Når det sker, må et system <b>klare sig selv</b> med sensorer om bord: et ur, der holder tiden, og inertisensorer, der følger bevægelsen. Spørgsmålet, Kshana besvarer, er let at stille og svært at måle: <b>hvor længe og hvor godt kan det klare sig?</b>

seg-ea1895772e76 = { "2" }. Hvorfor »kvante«?

seg-dd6871645f37 = Sensorer om bord driver. Et ur mister langsomt tid; en inertisensor mister langsomt overblikket over positionen. <b>Kvante</b>ur og -inertisensorer driver <em>langt langsommere</em> end de klassiske dele, der bruges i dag, så et køretøj kunne coaste gennem et meget længere GNSS-udfald og stadig holde sig inden for sine nøjagtighedsgrænser. Den fordel er hele løftet i kvante-PNT (positionering, navigation og tidssynkronisering). Men »langt langsommere« skal omsættes til <b>tal</b>: hvor mange ekstra minutters holdover? hvor mange færre meters drift? Disse tal afgør, om en kvantenyttelast er sin pris, masse og effekt værd.

seg-a5d9dc0fb159 = { "3" }. Hvad Kshana faktisk gør

seg-cb3a35ba696f = Kshana er en <b>simulator</b>, ikke hardware og ikke et hardwaredesign. Den:

seg-cb7fdaf6738b = Tager et <b>scenarie</b>: en tidslinje med et stykke GNSS-udfald og de offentliggjorte ydelsestal for en sensor.

seg-701c8c6d0e55 = Kører en <b>sensorfejlmodel</b> gennem tidslinjen: mens GNSS er tilgængeligt, disciplineres modellen mod referencen; under udfaldet løber den frit og opsamler fejl præcis, som fysikken siger, den skal.

seg-bc68e3d54e4c = <b>Scorer</b> resultatet mod operationelle kvalitetsmål (hvor stor fejlen bliver, hvor længe den holder sig inden for specifikationen, hvor pålideligt estimatet er).

seg-32d31a9beb71 = For sensorpakkerne gør den dette <b>to gange</b>: én gang for en kvantesensor og én gang for dens klassiske modstykke, på <em>samme</em> scenarie, så sammenligningen er ligeværdig.

seg-07d8c6eb84e9 = Det afgørende er, at motoren intet ved om »kvante« kontra »klassisk«. Begge er blot fejlmodeller med forskellige (offentliggjorte, citerede) parametre. Forskellen, du ser i outputtet, er forskellen i den offentliggjorte fysik: intet er finjusteret i den enes favør.

seg-e20a7d3f32dc = { "4" }. De fire byggesten (»pakker«)

seg-638b8d451550 = Sensor

seg-f891ee876b96 = Hvad den besvarer

seg-d1b122c389d4 = atomur

seg-768230c2eb02 = Hvor længe forbliver <em>tiden</em> nøjagtig uden GNSS?

seg-029de6b99be0 = Inertial dødregning

seg-f66f2d7b1d6d = accelerometer (+ gyro)

seg-e067a035f656 = Hvor hurtigt driver <em>positionen</em> uden GNSS?

seg-9ef8f99ca6e4 = Tidsoverførsel

seg-1267f82791f9 = optisk / RF-link (radiofrekvens)

seg-6f240700790d = Hvor præcist kan to fartøjer dele tid?

seg-90be2a6a29b1 = Hybrid fusion

seg-780cf1f1127e = alt ovenstående

seg-6080a05ace19 = Holder den <em>samlede</em> PNT-løsning?

seg-3f74a708a746 = Hybridpakken er pointen: en navigationsløsning har brug for <em>både</em> god tid <em>og</em> god position. Den viser, at et optisk tidslink kan holde selv et beskedent ur låst, hvilket betyder, at den <b>inertielle</b> sensor bliver det svageste led, og det er præcis dér, en kvanteaccelerometer betaler sig.

seg-5f55bb0fd7c5 = Ud over de fire pakker

seg-60191a2cd150 = Den samme motor kører mange flere scenarie<em>typer</em>; <c1/> oplister dem alle. De rækker ud over sensorerne til de signaler og den geometri, sensorerne afhænger af:

seg-995ed414d83d = <b>Hvor satellitterne er</b>: banepropagering, konstellationsdesign omkring Jorden, Månen eller et andet legeme og positionerne af legemerne i solsystemet.

seg-bc8abce2a748 = <b>Hvad modtageren kan se</b>: en azimutafhængig horisontlinje (en gade, en kaj, en fjord) over elevationsmasken og den himmelgeometri, den efterlader: satellitterne i sigte, deres præcisionsfortynding og fejlellipsen.

seg-b7a2c252c41c = <b>Hvad modtageren hører</b>: L-båndets spektrum under en jammer, jamming og spoofing samt tab af lås i sporingsløkken.

seg-f354743045c4 = <b>Om svaret kan stoles på</b>: integritetsovervågning (RAIM, receiver autonomous integrity monitoring, og dens avancerede form ARAIM) med beskyttelsesniveauer.

seg-69aa01a29a49 = <b>Alternativer til GNSS</b>: kortmatchning mod tyngdekraft og terræn samt positionering, navigation og tidssynkronisering fra satellitter i lav jordbane (LEO), fra signaludformningen over linkbudgettet og navigationsmeddelelsen til positionsbestemmelsen.

seg-297c98214b5b = <b>Tidssynkronisering for net</b>: holdover i telekommunikation kontrolleret mod de internationale masker og slottidssynkronisering til tidsindekserede planer.

seg-7eba216a9bf2 = <b>Ud over Jorden</b>: månetid og referencesystemer, servicevolumener på Månen og navigation med Mars-relæ.

seg-b796f49570ed = <b>Mange kørsler på én gang</b>: kampagner kæder typer sammen på én tidslinje, sweeper en parameter eller kører et Monte Carlo-ensemble.

seg-ef7f4e025018 = { "5" }. Ærlighed i designet

seg-65fb8703baf9 = En simulator er kun nyttig, hvis du kan stole på den. Kshana er bygget, så du kan:

seg-de8fd160db6d = <b>Hver parameter er citeret.</b> Hvert sensortal har en <c1/>-streng, der angiver det datablad eller den artikel, det stammer fra. Ingen anonyme konstanter.

seg-09d5cd11b127 = <b>Hver model er kontrolleret mod en lærebogsrelation,</b> ikke kun mod sig selv: for eksempel skal det simulerede urs Allan-deviation svare til det offentliggjorte stabilitetstal, og den inertielle drift skal svare til den gængse fejlvækstlov. En funktion kaldes <em>valideret</em> kun, hvor en uafhængig ekstern reference (et rigtigt datasæt, en uafhængig implementering eller offentliggjorte referencevektorer) stemmer overens; resten er <em>modelleret</em>, og <a1>verifikationsmatrixen</a1> siger, hvad der er hvad.

seg-ccb5b2fe93c4 = Modenhed er mærket.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> markerer hver effekt som <c1/>, <c2/> eller <c3/> og slår tydeligt fast, at tallene for optiske ure er <em>laboratorie- / rummålstal</em>: intet optisk strontiumur har fløjet.

seg-de463596fcdb = <b>Resultater kan gengives til bit:</b> det samme scenarie, seed og version giver altid det identiske svar på samme platform; på tværs af operativsystemer stemmer tallene overens inden for { "1e-6" } relativt (se <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fysikken, for specialister

seg-8fc6db9faf83 = De sammenhænge, Kshana implementerer og tester (alle detaljer og tolerancer i <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Ur-holdover.</b> To-tilstands fase-/frekvensmodel med hvid frekvensmodulation (hvid FM, effektspektraltæthed <c1/>), random-walk-FM (<c2/>), flicker-FM (en sum af logaritmisk fordelte Ornstein–Uhlenbeck-processer kalibreret til et fladt Allan-gulv) og deterministisk ældning. Valideret ved overlappende Allan-deviation mod den offentliggjorte <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Inertial dødregning.</b> Resterende accelerometerbias → <c1/>; hastigheds-random-walk → <c2/>; valgfri gyrobias og vinkel-random-walk giver en tiltfejl, der kobler tyngdekraften (<c3/>) ind i horisontal acceleration (Groves).

seg-d59595d00f0a = <b>Tidsoverførsel.</b> Hvid tidsjitter → synkroniseringspræcision → envejs afstandsmåling (<c1/>, { "1" } ps ≈ { "0.3" } mm); stikprøvemiddelværdien midles som <c2/>.

seg-0eb7a53fb4a6 = <b>Fusion og integritet.</b> Et Kalman-filter med to tilstande, hvis processtøj svarer til sandhedsmodellen; når det coaster, vokser dets fasefejlsvarians til præcis <c1/>, den analytiske holdover-relation, og dets 1-σ-grænse indgår i kvalitetsmålet for integritet.

seg-80daa7cb8641 = <b>Geometri.</b> Kepler-totlegemepropagering (valgfrit med sekulær J2) eller SGP4 (Simplified General Perturbations { "4" }) ud fra rigtige two-line element-sæt, Walker-konstellationer og sigtelinjesynlighed (jordens okkultation + elevationsmaske) udleder GNSS-tilgængelighed af baneegeometrien i stedet for håndskrevne vinduer.

seg-4ce4c6b79b93 = { "7" }. Hvor du går videre

seg-7c8344a26230 = Arbejd dig igennem: <a1>tutorials</a1>, tre gennemarbejdede eksempler + graduerede øvelser.

seg-277f1b435cf6 = Kør den: se hurtigstarten i <a1>README</a1>.

seg-c349981bd4f1 = Forstå strukturen: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Se, hvad der er og ikke er valideret: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Slå et begreb op: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Forrige</s1>Oversigt

seg-2f14e84bfc99 = <s1>Næste</s1>Ordliste
