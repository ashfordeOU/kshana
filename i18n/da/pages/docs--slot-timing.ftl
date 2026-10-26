# docs--slot-timing: translations (da)

seg-f917e7fcac09 = Hvad det er

seg-adc34608c46b = Klasse

seg-3a0e724a8a2b = Niveau

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydning

seg-f63dd3d7aad4 = Kilde

seg-1ff32b87e030 = Satellitter

seg-582fd72f1a1a = Dom

seg-430edd66bda0 = Ikke modelleret

seg-f23c8bd5f203 = Kilde: <c1/>

seg-1f2727dc4ca4 = Scenarietypen <c1/> besvarer tre spørgsmål for et ur, der løber frit mellem synkroniseringer og skal holde trafik inden for et <b>tidsindekseret slot</b>: et routing-, opgave- eller kontaktslot, hvis <b>guard</b> er den største absolutte tidsfejl, til begge sider, ved hvilken slottet stadig virker.

seg-6b39d8afeb5d = <b>Hvornår brister guarden?</b> Sekunder fra den seneste positionsbestemmelse, til den forudsagte tidsfejl når guarden, med hvert bidragende led opført enkeltvis og det dominerende nævnt.

seg-60476d723e1a = <b>Hvor meget tid er der tilbage nu?</b> Det samme tal minus den tid, der allerede er gået siden positionsbestemmelsen.

seg-84010982db35 = <b>Hvor ofte skal uret tage en positionsbestemmelse?</b> Det største interval mellem positionsbestemmelser, der holder fejlen inden for guarden, fratrukket latenstiden, før en positionsbestemmelse får virkning.

seg-3388d46925f1 = Et valgfrit afsnit <c1/> tilføjer tidsbeskyttelsesniveauet (TPL) for en modtager i kredsløb; se <a1>Spoofing af en modtager i kredsløb</a1>.

seg-2eb266d992b0 = Kør det medfølgende eksempel med <c1/>.

seg-624e7a70c4f6 = Forkortelser: GNSS, Global Navigation Satellite System; TCXO, temperaturkompenseret krystaloscillator; OCXO, ovnstyret krystaloscillator; RAFS, rubidium-atomfrekvensstandard; CSAC, atomur i chipstørrelse; USO, ultrastabil oscillator; DSAC, atomur til dybt rum; ADEV, Allan-deviation; FM, frekvensmodulation (her støj på urets frekvens); PM, fasemodulation (støj på dets fase); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, Telecommunication Standardization Sector i International Telecommunication Union; TIE, tidsintervalfejl; MTIE, maksimal tidsintervalfejl; TDEV, tidsdeviation; max|TE|, maksimal absolut tidsfejl; CUSUM, detektor for ændringer ud fra kumuleret sum; TPL, tidsbeskyttelsesniveau; LEO, lav jordbane; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (en IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, GPS Block II Follow-on-satellitterne; SHA-256, den 256-bit Secure Hash Algorithm; PPS, puls pr. sekund.

seg-f2a0c73ef648 = Fejlmodellen

seg-6bc3f9e78346 = Den forudsagte tidsfejl efter at have drevet <c1/> sekunder fra en positionsbestemmelse er

seg-3fbb186c716a = dækningsfaktor ({ "3" } er omkring { "99.7" } % af en gaussisk fejl)

seg-883965151598 = én-sigma-tidsfejl for positionsbestemmelsen

seg-b63c0447865f = én-sigma-fejl på den frekvens, der er kendt ved positionsbestemmelsen; en frekvens estimeret over et vindue <c1/> har omkring <c2/>

seg-ab28fc69d3ac = varians af hvid fasestøj: jitter på tidsfejlen, et konstant gulv

seg-8792541a7b6d = tætheder af hvid, random-walk- og random-run-FM (van Loan-leddene i <c1/>)

seg-5d36b32c4de8 = flicker-FM-gulv i Allan-variansen

seg-65da5a90685f = resterende relativ frekvensforskydning efter positionsbestemmelsen

seg-816e427d51f9 = frekvensforskydning fra en temperaturændring <c1/> gennem temperaturkoefficienten <c2/>

seg-e23d0ac960aa = lineær ældningsrate

seg-43e5f75b369c = Hvert FM-led er lig <c1/> for sin egen støjtype, med <c2/> (Zucca og Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). For hvid, random-walk- og random-run-FM er den sammenhæng eksakt. For flicker-FM er den det konventionelle estimat af fejlen i tidsforudsigelsen (Riley, NIST SP { "1065" }): flicker-FM har ingen lukket form uden en lavfrekvent afskæring. Frekvensforskydningerne lægges sammen i størrelse, fordi deres fortegn er ukendt, så den deterministiske del er et værste tilfælde. Hvert led er ikke-negativt og ikke-aftagende i <c3/>, så <c4/> har én rod, fundet ved indkredsning og bisektion.

seg-f9038fba23e2 = Hvor uret kommer fra

seg-5c44b2f8d015 = Scenarienøgle

seg-cb92ae98c231 = Klassens standard

seg-7594664253f2 = én citeret ADEV ved ét sekund og et rødstøjsgulv syntetiseret to og fire dekader under den

seg-794e4932b470 = MODELLED: svaret for et stabilt ur styres af det antagne gulv

seg-5ea820aaa69f = Forudindstilling fra datablad

seg-c943490619f3 = forudindstillingerne for telekom-tidssynkronisering (<c1/>, <c2/>, <c3/>, <c4/>), hver et navngivet Microchip-datablad

seg-a20353d50011 = MODELLED: en omhylling af maksimalværdier fra datablade

seg-b543f3dcd11a = Indlejret datablad

seg-4983ec096617 = kundens egen ADEV-tabel, ældning og temperaturkoefficient

seg-b079bca8a611 = MODELLED: en omhylling af de angivne maksimalværdier

seg-119d94700cab = Målt optagelse

seg-ae6835f0c3c5 = en faseoptagelse; dens overlappende ADEV tilpasses ved vægtet mindste kvadrater

seg-6e1c4702186d = inversionen er VALIDATED på en tilbageholdt, virkelig optagelse (nedenfor)

seg-f4cc2be238b7 = De tre klasser, der blev tilføjet i { "0.28.0" }, citerer hver ét offentligt datablad:

seg-47f6ddc3bd02 = ADEV ved ét sekund

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, kolonnen for basis-TCXO

seg-becbff195fff = Microchip OX-208-datablad, Rev 12-1-2021

seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard-datablad, DS00003047A

seg-48babc170b93 = EndRuns rækker for lange middelværdidannelsestider konvergerer på tværs af den tabel ({ "4e-13" } for alle oscillatorer undtagen TCXO, { "8e-13" }, ved { "10 000" } s, og { "6e-14" } for dem alle ved { "100 000" } s), hvilket tyder på, at de beskriver det disciplinerede produkt og ikke den frit løbende oscillator, så de bruges ikke.

seg-85c7211bb49b = <b>Optagelsestilpasningen er vægtet.</b> Et estimat af Allan-varians med <c1/> ækvivalente frihedsgrader har en varians på omkring <c2/>, så hvert punkt indgår med residualet <c3/>. En uvægtet tilpasning lod de korte middelværdidannelsestider afgøre leddene for lange middelværdidannelsestider: på en testoptagelse med hvid FM gav den et falsk flicker-gulv, der forkortede et brud på { "2 000" } s med { "30" } %. Et datablad eller en optagelse understøtter kun middelværdidannelsestider op til sit længste punkt; et brud ud over det markeres <c4/>.

seg-5b61a42c76c2 = Validering: inversionen på et tilbageholdt, virkeligt ur

seg-2220a1490923 = <c1/> bruger optagelsen med { "556" } 990 sampler af en 5071A-cæsiumstandard målt mod en brintmaser (A. Wallin, distribueret med <c2/>; den samme optagelse som estimatorens uafhængige reference <c3/> bruger). Med masteren som reference er optagelsen en fri kørsel på 6,4 døgn.

seg-9bae4571f67c = Tilpas støjmodellen kun på optagelsens <b>første tredjedel</b>.

seg-15b2cb621db7 = Forudsig ud fra den model drivtiden, hvor én-sigma-tidsfejlen når { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } og { "2.5" } ns.

seg-1bd9ac435bfa = På de <b>to øvrige tredjedele</b> drives der fra et synkroniseringspunkt hvert { "997" } s med frekvensen estimeret fra den foregående tredjedel, og det måles, hvor rodmiddelkvadratfejlen under driften når hver tærskel.

seg-d7640a2ec444 = Beståelsestærsklen, fastsat før testen første gang blev kørt, er, at hvert forudsagt brud ligger inden for en faktor { "1.5" } af det målte. En kontrol, ADEV ved ét sekund læst som hvid FM, skal ikke bestå den tærskel, så tærsklen kan skelne en god model fra en dårlig. Testen udskriver sin tabel; en mutation, der halverer niveauet for hvid FM, får den til at fejle. Den rå optagelse er tredjepartsdata, der er git-ignoreret: <c1/> henter den, og workflowet <c2/> kører testen med <c3/>, så en manglende fil fejler dér i stedet for at blive sprunget over.

seg-3d11f7c6d4ab = Hvad dette validerer: stien fra tilpasning til inversion, på en atomstandard domineret af hvid FM, over drivperioder på op til omkring { "50 000" } s. Hvad det ikke validerer: datablads- og klassekilderne, de deterministiske led og en krystaloscillator (næste afsnit).

seg-bfcc5555ed50 = Den samme forudsigelse på en virkelig krystaloscillator: konservativ, ikke valideret

seg-b77b3f503ca2 = <c1/> bruger en målt OCXO: { "19 982" } frekvensaflæsninger ved ét sekund af { "10" } MHz-oscillatoren i en HP-impedansanalysator, mod en brintmaser (A. Wallin, { "2015" }, distribueret med <c2/>; <c3/>). Støjmodellen og en lineær drift tilpasses på den første tredjedel; hver drivperiode på de to øvrige tredjedele starter fra en frekvens estimeret over de foregående { "100" } s, og modellen bærer dette estimats usikkerhed (<c4/>, modellens egen Allan-deviation ved { "100" } s).

seg-e05821406c28 = Tilpasset på

seg-c70aadbd47d4 = Forudsagt ÷ målt brud, { "0.2" } til { "10" } ns

seg-d71582148b20 = Aflæsning

seg-dcc3fd23bede = den første tredjedel (tilbageholdt)

seg-f9bb286f5868 = { "0.59" } til { "0.70" }

seg-612784f70090 = konservativ: aldrig senere end målt, for det meste uden for tærsklen på { "1.5" }

seg-121fa832c30f = selve evalueringssegmentet (diagnostisk)

seg-b4be9afa69ac = { "0.98" } til { "1.17" }

seg-75e1515b970a = inversionen er rigtig; det tilbageholdte hul er oscillatoren, der ændrer sig

seg-c91da69e9c09 = Oscillatorens støjgulv blev halveret under optagelsen: Allan-deviationen for den første tredjedel flader ud nær { "7.5e-12" }, resten nær { "3.5e-12" }. En model tilpasset tidligt overforudsiger støjen, hvilket er den sikre retning. <b>Krystaltilfældet er derfor ikke valideret og forbliver MODELLED.</b> For en krystal bør man tilpasse på en indsvunget optagelse og tilpasse igen, efterhånden som komponenten ældes.

seg-6230fed0e164 = <b>Hvordan protokollen blev valgt, angivet fordi det ikke var blindt.</b> En første udforskende kørsel genbrugte cæsiumprotokollen (frekvens fra den foregående tredjedel, intet frekvensled) og forudsagde brud { "1.4" } til { "2.5" } gange senere end målt: optimistisk, den farlige retning. En krystals frekvens vandrer, så en frekvens estimeret timer før positionsbestemmelsen er forældet, og modellen havde intet led for, hvor godt frekvensen er kendt ved positionsbestemmelsen. Leddet <c1/> blev tilføjet af den grund, og denne protokol blev fastlagt, før testen blev skrevet; beståelsestærsklen blev ikke flyttet. Testen kontrollerer også, at forudsigelsen i stikprøven uden leddet er optimistisk ved hver tærskel, så leddet er bærende.

seg-88e01cac525a = Den samme forudsigelse på atomure i kredsløb: { "8" } af { "10" }, ikke valideret

seg-17962966b6d6 = <c1/> bruger IGS' endelige kombinerede ure ved { "30" } s i { "14" } døgn ({ "17" } til { "30" } august { "2025" }; <c2/>, hver fil fastlåst med SHA-256): hvert GPS Block IIF-satellitur mod IGS-tidsskalaen. Protokollen (satellitsæt, hulregel, tilpasningsvindue, en synkronisering hvert { "3 570" } s med frekvensen fra den foregående time, tærskler på { "1" } til { "20" } ns, tærsklen på { "1.5" } og reglen om, at klassen kun består, hvis hver satellit gør det) blev nedskrevet, før nogen af dataene blev hentet.

seg-1b5832633c87 = Forudsagt ÷ målt brud

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" } til { "1.46" }

seg-c14941cb5537 = inden for tærsklen

seg-dbaaf875f1fb = { "1.51" } til { "1.99" }

seg-3601e13c39b6 = optimistisk

seg-ea41cf6dbec2 = { "1.20" } til { "1.61" }

seg-099fb000bf57 = ikke evalueret

seg-a7699b256ee1 = udeladt efter hulreglen (en manglende dag)

seg-eb71202e0b91 = Otte af ti er brugbart belæg, men to satellitter forudsiges at holde længere, end de gjorde, hvilket er den farlige retning, og protokollen kræver, at hver satellit består. <b>Tilfældet i kredsløb forbliver derfor MODELLED.</b> Block IIF-satellitter bærer både rubidium- og cæsiumstandarder, og IGS-filerne siger ikke, hvilken der er aktiv, så resultatet er angivet for satellitterne, ikke for én urtype. Hvorfor G25 og G30 afviger, er ikke undersøgt.

seg-a9be8a92b6b9 = En bench-kørsel for en flyvningsrepræsentativ komponent (afgrænset, ikke udført)

seg-43597df55508 = Den offentlige OCXO-optagelse er { "5.5" } timer lang, fra ét laboratorieinstrument, mens oscillatoren stadig indsvinger. Hvad der ville validere krystaltilfældet, er en længere målt fri kørsel af en flyvningsrepræsentativ OCXO eller en CSAC mod en reference:

seg-e2698f00a84a = en tidsintervaltæller, der sammenligner oscillatorens { "1" } PPS med en GNSS-disciplineret reference eller en maserreference, mindst { "10" } døgn med ét sampel pr. sekund og logget temperatur;

seg-c4c902ac028e = den samme tilbageholdte protokol: tilpas på den første tredjedel, forudsig bruddene, mål på resten, med samme tærskel og kontrol;

seg-0faaa6279195 = optagelsen og dens hash udgivet ved siden af testen, så rækken kan gengives.

seg-9b2255563582 = Det afhænger af adgang til referencehardware og er ikke lovet.

seg-6cb2dc94d1bf = Hvilken drivmetrik bør et slot accepteres mod?

seg-f6d24245dca6 = Tidsstandarder tilbyder tre familier af metrikker. For et tidsindekseret slot måler kun én af dem det, der får slottet til at bryde sammen.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) er den største spids-til-spids-TIE inden for et vindue af en given længde. Den er blind for en konstant forskydning: et ur, der er { "1" } µs forkert men helt stabilt, har en MTIE nær nul og rammer ikke et eneste slot. Den måler, hvor meget fejlen <em>ændrer sig</em>, ikke hvor den <em>er</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) er bygget af andendifferenser af den midlede fase. Den fjerner en konstant forskydning og en konstant frekvensfejl, som netop er de led, der dominerer en drivperiode. Den karakteriserer støjtypen; den er ikke en acceptmetrik for absolut tidssynkronisering.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; budgetmetrikken i G.8271) er den største absolutte tidsfejl i forhold til referencetidsskalaen. Den kan sammenlignes direkte med en guard.

seg-7eefc395a118 = <b>Konklusion.</b> Accepter et slot mod max|TE| i forhold til netværkets referencetidsskala, evalueret som en forudsagt omhylling fra den seneste positionsbestemmelse ved en angivet dækningsfaktor. Det er, hvad <c1/> er: fordi hvert led vokser med <c2/>, er maksimum over en drivperiode af længden <c3/> lig <c4/>. MTIE og TDEV forbliver nyttige som diagnostik: TDEV til at identificere, hvilket støjled der skal angribes, MTIE(L) til at afgrænse, hvor meget fejlen bevæger sig under et slot af længden <c5/>.

seg-51d4ee8484d7 = To præciseringer, som metrikvalget indebærer:

seg-a52524111ed7 = <b>Guarden gælder for den relative fejl mellem to noder.</b> Hvis sender og modtager begge driver uafhængigt, lægges deres stokastiske fejl sammen kvadratisk og deres deterministiske fejl sammen i størrelse. Når den stokastiske del dominerer, kan hver node få <c1/>; når ældning eller temperatur dominerer, <c2/>.

seg-073fe7cd8e63 = Dækningsfaktoren er et designvalg, ikke en egenskab ved uret.

seg-eb1cbf9fda2d = <c1/> afgrænser omkring { "99.7" } % af gaussiske fejl på ét tidspunkt, ikke over hvert slot på en dag; en routingplan med mange slots pr. dag har brug for den risiko pr. slot, den kan tolerere.

seg-04734b8a115b = Spoofing af en modtager i kredsløb

seg-9e734bbda345 = Afsnittet <c1/> evaluerer <c2/> for det samme ur:

seg-a2f21a643389 = <b>Geometri.</b> En jordbaseret spoofer når en LEO-satellit kun, mens satellitten er over dens horisont: ved { "550" } km højst omkring tolv minutter pr. passage over hovedet. En spoofer, der ramper med raten <c1/>, kan derfor højst trække uret <c2/> gange det vindue, eller gange tiden til den næste uafhængige kontrol, hvis den er kortere (<c3/>).

seg-ff59489b08b8 = <b>Dynamik.</b> En fælles tidstrækning forskyder alle pseudoafstande ens og absorberes i urets bias, ikke i positionen, så en positionskontrol med en banepropagator tæller ikke som en tidskontrol på tværs.

seg-4302cc49b91f = <b>Krydskontroller.</b> En satellit har sjældent en anden uafhængig tidsmodtager. Den har sit eget urs drift (monitoren i <c1/>), en tovejs tidsoverførsel med en jordstation under kontakter og tidssammenligninger over intersatellitlinks. Et krydslink er kun uafhængigt af én jordbaseret spoofer, hvis naboen er uden for den spoofers fodaftryk i samme øjeblik, hvilket rapporten kontrollerer ud fra antallet af satellitter pr. plan.

seg-16c15664a51c = <b>Betinget grænse.</b> Monitorgulvet plus urets drift over CUSUM-detektionslatensen, der reduceres nøjagtigt til <c1/>, når uret ikke har noget flicker-, hvidfase- eller random-run-led. Som den grænse gælder den kun givet detektion.

seg-f7678693be22 = Alt dette er MODELLED: en kugleformet, ikke-roterende Jord, en passage over hovedet, én jordbaseret spoofer med en angiven maksimal ramperate. Signalernes ankomstretning ved en zenitpegende antenne er en virkelig krydskontrol, som kræver et antennemønster og ikke er modelleret. <a1><c1/></a1> forklarer, hvorfor en signeret kontrolmeddelelse ikke fjerner denne trussel.

seg-070a4e72b5ea = Frekvenssprang, strålingseffekter og relativistiske frekvensforskydninger; en termisk model (temperaturændringen er et spring ved positionsbestemmelsen); selve synkroniseringsprotokollen (en positionsbestemmelse nulstiller fejlen til <c1/>).

seg-a2766c0f19d0 = <s1>Forrige</s1>Optiske forbindelser gennem atmosfæren

seg-85ad3eb72a80 = <s1>Næste</s1>Tidssynkronisering til telekommunikation
