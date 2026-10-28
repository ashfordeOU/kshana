# docs--agents: translations (sv)

seg-0619151df586 = Källa: <c1/>

seg-d0e198572cfe = Att använda Kshana från en AI-agent

seg-eccd1d5fbdb2 = För en agent (eller den som styr en): vilket verktyg som ska anropas för vilken fråga, vad verktygen gör och inte gör, och vad som ska följa med varje svar. Ytor och de celler som inte är tillgängliga på en viss yta: <a1><c1/></a1>.

seg-a0354cacda4c = Anslut

seg-337d23a873f5 = Ett stycke som nämner AI-klienter från tredje part är utelämnat här; det finns i <a1>docs/AGENTS.md</a1> på GitHub.

seg-01a862ed86e6 = Regeln för varje svar

seg-0adf5e5ad79a = Kör motorn; gissa inte talen. Rapportera vad ett verktyg returnerade med dess enhet och dess evidensnivå (VALIDATED mot en extern oberoende referens, eller MODELLED), scenariot, fröet och motorversionen, så att körningen kan upprepas. Behåll varje resultats egna förbehåll tillsammans med det.

seg-f67845b891c5 = Vilket verktyg för vilken fråga

seg-6f4bb4962340 = Frågan

seg-8efda304925b = Verktyg (MCP)

seg-83d609ff5cc7 = Snedstreckskommando

seg-9b937d3cbf88 = Köra eller förklara ett PNT-scenario (banor, GNSS, tidssynkronisering, fusion, lunar, optiska länkar, ...)

seg-ba8b3824bba2 = Var den här mottagarloggen, eller det här fartygets NMEA, tillförlitlig, och när slutade den vara det?

seg-f3ea74f278ac = <c1/> (valfritt loggformat), <c2/> (fartygs-NMEA, batch), <c3/> (begränsat utdrag)

seg-aa194fda4300 = Jag behöver syntetisk NMEA med en jamming-, drag-off-, tidsspoofing- eller replay-händelse för träning

seg-0211b49536df = Visa ett fartygs förtroendepoäng i övervaknings- eller SIEM-format (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Poängsätta en mottagarlogg mot det publicerade Jammertest-schemat (detektionsfördröjning, missade larm, falsklarm, tid till återhämtning), eller omvandla den planen till händelser

seg-d1c81008d5f8 = Göra en manipuleringssäker post över vad motorn sade om ett fönster av ett fartygs logg, eller kontrollera en

seg-b7892674ac60 = Vilka Galileo-satelliters navigeringsdata autentiserar den här mottagarströmmen (OSNMA)?

seg-084a787c65cf = <b>ingen: finns inte på MCP.</b> Använd <c1/> (CLI), <c2/> (Python) eller <c3/> (WASM, OSNMA-kortet i Studio)

seg-4fc021a0a145 = inte ett snedstreckskommando

seg-0f5db62071e9 = Jag behöver ett scenarios fordonsrörelse och händelsetider för att spela upp dem genom en GNSS-simulator i laboratorium

seg-919946a95002 = Vilka kravrader i offentliga ramverk ger de här körningarna belägg för, och vad är luckan?

seg-5e08ec7f4852 = <c1/> (från resultattext), <c2/> (tabellerna, inga körningar)

seg-ff6556a46025 = Köra ett poängsatt standardpaket (DHS RPCF-testprofiler, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) mot trösklar som angetts före körningen?

seg-709c6501a661 = <c1/>, <c2/> (ge rapporten till <c3/> för raderna)

seg-1745cce01677 = Kontrollera LunaNet Augmented Forward Signal (koder, SB1, ramformat) mot LNIS V5 / LSIS-AFS V1.0, eller kontrollera en symbolström?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols eller generate); LDPC och CRC-24Q för delramarna { "2" } till { "4" } är inte verifierade

seg-86c207c3996e = Länka en laboratoriekörning (scenario, angivna testvillkor, mottagarlogg, poäng) i ett signerat paket?

seg-25bb29e6aa3d = <c1/> efter <c2/> (<c3/>)

seg-3856b38bb9d2 = Poängsätta en detektions- eller holdover-inlämning mot en kshana-bench-referensfil, eller rendera resultatfiler som resultattavlan?

seg-87e686c064ce = Jag behöver ett scenario som flyger en GeoJSON-rutt (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Vilka satelliter ser en användare på en gata, i en hamn, i en fjord eller på en containerterminal, och vad är DOP och felellipsen?

seg-86eb2756fd7f = <c1/> (en begäran, eller en <c2/>); ett scenarios <c3/>-avsnitt genom <c4/> (<c5/> och <c6/> kräver <c7/>)

seg-bd7f9d7e8e27 = Var har GNSS sett försämrat ut, och hur mycket av den här rutten ligger i det?

seg-908b6e65372f = <c1/>, sedan <c2/>

seg-1f715d5e0c4f = GNSS-IQ-inspelningar (scen, förvärv, spårning, front-end, kampanjer)

seg-5569efd18c6b = <c1/> först, sedan verktygen <c2/>

seg-d44650438742 = Skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> och <c7/> innehåller reglerna nedan för agenter som läser in skills.

seg-a4de5a40b743 = Vad varje verktyg inte gör

seg-3f27662a983e = <b>Läsa eller skriva filer.</b> Innehållet är inline: indata är text i begäran, begränsad till { "4" } MiB, och ett scenariofält som anger en fil avvisas. Endast verktygen <c1/> rör en mapp, och endast den som <c2/> anger, med varje sökväg begränsad till den.

seg-3efe81d26cad = <b>Verifiera OSNMA.</b> Det finns inget MCP-verktyg: indata är en lång rå mottagarström (I/NAV-sidor eller en UBX-inspelning), vilket passar CLI och Python, och ett verktyg som tog en sådan skulle lägga till en stor indatayta utan nytta. Hänvisa användaren till <c1/> (eller Python <c2/>). Vad utdata än säger, för det rådgivande meddelandet vidare ordagrant: endast autentiseringsstatus, inte en integritetstjänst för navigering, inte typgodkänd navigationsutrustning och inget påstående om prestanda mot spoofing; ett resultat är meningsfullt först med en Merkle-rot eller en publik nyckel som användaren har fått på annat sätt.

seg-b13a75d08152 = Köra en process.

seg-9dfcbee6fdb8 = <c1/> som en körande ström (med en gate och <c2/>), telemetriexportörerna (<c3/>: Prometheus, syslog, OTLP) och strömning av tränings-NMEA till en adress finns bara på kommandoraden. <c4/> poängsätter ett utdrag med samma motor och skriver till ingen port. Utdragsverktygen returnerar levande JSON-rader enligt schema { "1.3" } (ett <c5/>-påstående och satellitens <c6/> för varje epok, en <c7/> för varje slutledning); ett fartygskörnings CSV börjar med en kommentarsrad <c8/> som bär samma påstående, så läs den med ett kommentarsalternativ. <c9/> och <c10/> binder loopback-adressen om inget annat anges.

seg-ac51aad84893 = Skriva en signal.

seg-ad032dee3fd3 = <c1/> returnerar fordonsrörelse och märkta händelseintervall som text; ingenting det returnerar är, modellerar eller styr en radiofrekvens- eller basbandssignal, och en händelse är inte ett recept för att framställa störning. Ange dess <c2/> tillsammans med filerna; simulatorn och dess operatör ansvarar för att köra dem endast där det är tillåtet.

seg-39f3aae1143a = Säga mer än kartläggningen säger.

seg-ed04b567fc87 = <c1/> anger vilka ramverksrader en uppsättning körningar ger belägg för, med varje rads lucka. Det säger aldrig att ett ramverk är uppfyllt eller att en produkt är betygsatt eller godkänd; för dess <c2/> vidare ordagrant och säg "ger belägg för", inget starkare. Det läser resultat- och scenariotext som du skickar in, aldrig en sökväg.

seg-eda73a8fcbfe = <b>Hämta data.</b> Nedladdningen av landpolygoner finns bara på kommandoraden och kräver <c1/>. Skicka landfilen, om den önskas, som text. Använd bara data som användaren har licens att använda.

seg-d513f734248e = <b>Sända något eller syntetisera RF.</b> Träningsgeneratorn skriver NMEA-text; IQ-lagret skriver samplingsfiler för mottagare i programvara.

seg-63eb4c5b4a17 = Vad som ska följa med svaret

seg-6555ff9a6d8e = Utdata

seg-a056a59fb678 = Behåll

seg-c01c0fedd895 = Satellitgeometri och slutledningsklasser ({ "0.36" })

seg-3723ec5a3f8c = Rapportera geometrin vid sidan av poängen och varje slutlednings klass som returnerad: <c1/> betyder himlen (ett påstående om himlen, inte ett konstaterande att inget angrepp inträffade), <c2/> signalmiljön, <c3/> angreppsliknande belägg. Säg "geometri okänd" när statusen är <c4/> (ingen GSV eller GSA i loggen); dra ingen slutsats om en. Trösklarna är <b>MODELLED</b> med angiven proveniens.

seg-0938dfb71d72 = Förtroendepoäng för mottagare

seg-8e3a7376cd6b = <b>Rådgivande</b>: inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }); operatören är fortsatt ansvarig. <b>MODELLED</b>. Ange fartygets gränser före körningen och trimma inte en tröskel efter ett resultat. En hög poäng är inte bevis för en äkta positionsbestämning; kontrollerna kan inte se en spoofer som är konsekvent med alla andra sensorer.

seg-ae3f0548e93f = Bevispaket

seg-81189f29f884 = En <b>teknisk post</b>, inte ett juridiskt utlåtande, ett konstaterande av fakta eller ett godkännande. Verifiera med signerarens publika nyckel som du fått på annat sätt; utan den är utlåtandet <c1/>, vilket bara bevisar integritet mot den nyckel som paketet självt anger: säg "intakt, signerare inte fastställd", aldrig "verified". Returnera, logga eller be aldrig om ett signeringsfrö i en konversation om nyckeln spelar roll: använd CLI.

seg-512e5ee42c1e = Tränings-NMEA

seg-c59a76aefff5 = <b>Endast text</b>, för träning och test, <b>aldrig</b> för ett fartygs levande navigationssystem. Returnera fröet och instruktörsloggen.

seg-14781c19be62 = Störningskarta, ruttexponering

seg-7135c6f44d49 = Hur noggrannhetskoderna läses samt rutnätets och ruttens geometri är <b>VALIDATED</b> mot oberoende bibliotek på syntetiska indata; metodens trösklar förblir <b>MODELLED</b>, och att en försämrad cell är störning är <b>inte</b> kontrollerat: en försämrad cell visar <b>inte</b> att störning är orsaken. En cell som inte observerats är <b>inte</b> belägg för en fri rutt. Tidigare rapporter, <b>inte en prognos</b>. Endast aggregat: försök inte återskapa identifierare. ADS-B- och AIS-kartor hålls åtskilda.

seg-e47db9be47ea = Himmelsgeometri, horisontlinje

seg-839eb485b1d2 = <b>MODELLED</b> geometri under en angiven felmodell, endast sikt: ingen diffraktion, flervägsfel eller mottagning utan sikt. Förinställningarna är <b>REPRESENTATIVE</b>, inte uppmätningar; för med förinställningens proveniens. Förinställda konstellationer är en representativ himmel, inte himlen för ett visst datum. Ellipsen skalar en angiven UERE: inte en uppmätt noggrannhet och inte en integritetsgräns. Behåll <c1/>.

seg-0002a3dc682e = Tillgänglighet för optiska länkar (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, rådgivande. Molnklimaten är angivna indata, inte en datamängd, och ingen uppmätt tillgänglighetsregistrering har jämförts: säg "under dessa antaganden", aldrig "tillgängligheten på den platsen". Behåll platsens <b>tak</b> (<c1/>: vad ingen marginal lyfter) vid sidan av dess tillgänglighet, och säg vilka teknikvinster som är indata (Kshana modellerar ingen adaptiv optikslinga). Numeriken är kontrollerad mot ett oberoende program, vilket kontrollerar implementationen av formlerna och inte atmosfären.

seg-3324b2e2021e = Holdover-test (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, rådgivande. Säg "mätt mot masken", aldrig att en klocka eller ett system klarar eller är godkänt mot en rekommendation. De två tidpunkterna (GNSS borttaget, GNSS återställt) är <b>operatörens uppgift</b>: Kshana tog inte bort eller återställde något och kan inte verifiera dem, så citera dem som angivna. En mask som registreringen är för kort för är <b>INCOMPLETE</b>, aldrig ett godkänt resultat. En servologg (linuxptp, chrony) är felet under servostyrning, inte en oberoende mätning mot UTC; säg vilken registrering talen kommer från. Se <c1/>.

seg-18d3f2b50d0a = Vilket scenarioresultat som helst

seg-aab46d50d125 = <c1/> eller <c2/> det anger, och proveniensraden.

seg-166f773b2804 = Gränser

seg-203a91deb52c = Använd syntetiska data eller användarens egna. Nämn inte personer, fartyg eller organisationer i utdata som inte fanns i användarens indata. Kshana är ett analys- och träningsverktyg, inte en flyg- eller navigeringsprodukt.

seg-ec064f62f7dc = <s1>Föregående</s1>MCP-server: självhostat HTTP-läge

seg-1f44dbd65ce3 = <s1>Nästa</s1>Var varje förmåga kan nås

seg-e3949a1e6082 = Sändarområde (<c1/>)

seg-46b2efcb9bec = <b>MODELLED</b>: ett möjligt område under radiosikt, inte en positionsbestämning. Redovisa området med sin angivna konfidensnivå tillsammans med tyngdpunkten och dess ellips, aldrig tyngdpunkten ensam; ange <c1/> när data inte avgränsar det; ange att det är villkorat av modellen (kontrollerat enbart på syntetiska data; den förhandsregistrerade Jammertest-jämförelsen kördes en gång och kunde INTE BEDÖMAS för båda källorna, så ingenting testades externt). Neutral formulering: "uppskattat sändarområde"; namnge eller antyd aldrig vem eller vad som står bakom en källa, en stat, en styrka eller en avsikt. Endast aggregerat; försök inte återskapa identifierare. Publicering av sändarområden i det publika observatoriet är avstängd.
