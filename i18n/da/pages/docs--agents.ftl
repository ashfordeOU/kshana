# docs--agents: translations (da)

seg-0619151df586 = Kilde: <c1/>

seg-d0e198572cfe = Brug af Kshana fra en AI-agent

seg-eccd1d5fbdb2 = Til en agent (eller personen, der styrer en): hvilket værktøj der skal kaldes til hvilket spørgsmål, hvad værktøjerne vil og ikke vil gøre, og hvad der skal følge med hvert svar. Flader og de felter, der ikke er tilgængelige på en given flade: <a1><c1/></a1>.

seg-a0354cacda4c = Forbind

seg-337d23a873f5 = Et afsnit, der nævner AI-klienter fra tredjeparter, er udeladt her; det står i <a1>docs/AGENTS.md</a1> på GitHub.

seg-01a862ed86e6 = Reglen for hvert svar

seg-0adf5e5ad79a = Kør motoren; gæt ikke tallene. Rapportér, hvad et værktøj returnerede, med dets enhed og dets evidensniveau (VALIDATED mod en ekstern uafhængig reference, eller MODELLED), scenariet, seed og motorversion, så kørslen kan gentages. Behold hvert resultats egne forbehold sammen med det.

seg-f67845b891c5 = Hvilket værktøj til hvilket spørgsmål

seg-6f4bb4962340 = Spørgsmålet

seg-8efda304925b = Værktøj (MCP)

seg-83d609ff5cc7 = Skråstregskommando

seg-9b937d3cbf88 = Kør eller forklar et PNT-scenarie (baner, GNSS, tidssynkronisering, fusion, måne, optiske links, ...)

seg-ba8b3824bba2 = Var denne modtagerlog, eller et fartøjs NMEA, til at stole på, og hvornår holdt den op med at være det?

seg-f3ea74f278ac = <c1/> (ethvert logformat), <c2/> (fartøjets NMEA, batch), <c3/> (afgrænset uddrag)

seg-aa194fda4300 = Jeg har brug for syntetisk NMEA med en jamming-, drag-off-, tidsspoofing- eller replay-hændelse til træning

seg-0211b49536df = Vis et fartøjs tillidsscore i overvågnings- eller SIEM-formater (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Score en modtagerlog mod den offentliggjorte Jammertest-plan (detektionsforsinkelse, oversete alarmer, falske alarmer, tid til genopretning), eller omsæt den plan til hændelser

seg-d1c81008d5f8 = Lav en manipulationssynlig registrering af, hvad motoren sagde om et vindue af et fartøjs log, eller kontrollér en

seg-b7892674ac60 = Hvilke Galileo-satellitters navigationsdata autentificerer denne modtagerstrøm (OSNMA)?

seg-084a787c65cf = <b>ingen: ikke på MCP.</b> Brug <c1/> (CLI), <c2/> (Python) eller <c3/> (WASM, OSNMA-kortet i Studio)

seg-4fc021a0a145 = ikke en skråstregskommando

seg-0f5db62071e9 = Jeg har brug for et scenaries køretøjsbevægelse og hændelsestidspunkter til afspilning gennem en GNSS-simulator i laboratoriet

seg-919946a95002 = Hvilke rækker med krav i offentlige rammeværker leverer disse kørsler belæg for, og hvad er hullet?

seg-5e08ec7f4852 = <c1/> (ud fra resultattekst), <c2/> (tabellerne, ingen kørsler)

seg-ff6556a46025 = Kør en scoret standardpakke (DHS RPCF-testprofiler, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) mod tærskler angivet før kørslen?

seg-709c6501a661 = <c1/>, <c2/> (giv rapporten til <c3/> for at få rækkerne)

seg-1745cce01677 = Kontrollér LunaNet Augmented Forward Signal (koder, SB1, rammeformat) mod LNIS V5 / LSIS-AFS V1.0, eller kontrollér en symbolstrøm?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols eller generate); LDPC og CRC-24Q i delrammerne { "2" } til { "4" } er ikke verificeret

seg-86c207c3996e = Sammenkæd en laboratoriekørsel (scenarie, angivne testbetingelser, modtagerlog, score) i én signeret pakke?

seg-25bb29e6aa3d = <c1/> efter <c2/> (<c3/>)

seg-3856b38bb9d2 = Score en detektions- eller holdover-indsendelse mod en kshana-bench-referencefil, eller gengiv resultatfiler som ranglistesiden?

seg-87e686c064ce = Jeg har brug for et scenarie, der flyver en GeoJSON-rute (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Hvilke satellitter ser en bruger i en gade, en havn, en fjord eller en containerterminal, og hvad er DOP og fejlellipsen?

seg-86eb2756fd7f = <c1/> (en forespørgsel eller en <c2/>); et scenaries sektion <c3/> gennem <c4/> (<c5/> og <c6/> kræver <c7/>)

seg-bd7f9d7e8e27 = Hvor har GNSS set forringet ud, og hvor stor en del af denne rute ligger i det?

seg-908b6e65372f = <c1/>, derefter <c2/>

seg-1f715d5e0c4f = GNSS IQ-optagelser (scene, acquire, track, front-end, kampagner)

seg-5569efd18c6b = <c1/> først, derefter værktøjerne <c2/>

seg-d44650438742 = Skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og <c7/> bærer reglerne nedenfor til agenter, der indlæser skills.

seg-a4de5a40b743 = Hvad hvert værktøj ikke vil gøre

seg-3f27662a983e = <b>Læse eller skrive filer.</b> Indholdet er inline: input er tekst i forespørgslen, begrænset til { "4" } MiB, og et scenariefelt, der nævner en fil, afvises. Kun værktøjerne <c1/> rører en mappe, og kun den, <c2/> angiver, med hver sti begrænset til den.

seg-3efe81d26cad = <b>Verificere OSNMA.</b> Der findes intet MCP-værktøj: input er en lang rå modtagerstrøm (I/NAV-sider eller en UBX-optagelse), som passer til CLI og Python, og et værktøj, der tog imod en sådan, ville tilføje en stor inputflade uden gevinst. Send brugeren til <c1/> (eller Python <c2/>). Uanset hvad outputtet siger, skal den vejledende erklæring følge med ordret: kun autentificeringsstatus, ikke en integritetstjeneste for navigation, ikke typegodkendt navigationsudstyr og ingen påstand om ydeevne mod spoofing; et resultat er kun meningsfuldt med en Merkle-rod eller en offentlig nøgle, som brugeren har fået ad en anden vej.

seg-b13a75d08152 = Køre en proces.

seg-9dfcbee6fdb8 = <c1/> som kørende strøm (med en gate og <c2/>), telemetrieksportørerne (<c3/>: Prometheus, syslog, OTLP) og streaming af trænings-NMEA til en adresse findes kun på kommandolinjen. <c4/> scorer et uddrag med den samme motor og skriver til ingen port. Uddragsværktøjerne returnerer live JSON-lines-skema { "1.3" } (en <c5/>-erklæring og satellit-<c6/> på hver epoke, en <c7/> på hver slutning); en fartøjskørsels CSV begynder med en <c8/>-kommentarlinje med den samme erklæring, så læs den med en kommentarindstilling. <c9/> og <c10/> binder til loopback-adressen, medmindre andet angives.

seg-ac51aad84893 = Skrive et signal.

seg-ad032dee3fd3 = <c1/> returnerer køretøjsbevægelse og mærkede hændelsesintervaller som tekst; intet af det, den returnerer, er, modellerer eller driver et radiofrekvens- eller basisbåndssignal, og en hændelse er ikke en opskrift på at fremkalde interferens. Giv dens <c2/> med filerne; simulatoren og dens operatør er ansvarlige for kun at køre dem, hvor det er tilladt.

seg-39f3aae1143a = Sige mere, end kortlægningen siger.

seg-ed04b567fc87 = <c1/> angiver, hvilke rækker i rammeværker et sæt kørsler leverer belæg for, med hver rækkes hul. Den siger aldrig, at et rammeværk er opfyldt, eller at et produkt er vurderet eller godkendt; lad dens <c2/> følge med ordret, og sig "leverer belæg for", intet stærkere. Den læser resultat- og scenarietekst, du giver den, aldrig en sti.

seg-eda73a8fcbfe = <b>Hente data.</b> Download af landpolygoner findes kun på kommandolinjen og kræver <c1/>. Giv landfilen, hvis ønsket, som tekst. Brug kun data, brugeren har licens til at bruge.

seg-d513f734248e = <b>Sende noget eller syntetisere RF.</b> Træningsgeneratoren skriver NMEA-tekst; IQ-laget skriver sampelfiler til software-modtagere.

seg-63eb4c5b4a17 = Hvad der skal følge med svaret

seg-6555ff9a6d8e = Output

seg-a056a59fb678 = Behold

seg-c01c0fedd895 = Satellitgeometri og slutningsklasser ({ "0.36" })

seg-3723ec5a3f8c = Rapportér geometrien ved siden af scoren og hver slutnings klasse, som den returneres: <c1/> betyder himlen (en udtalelse om himlen, ikke en konstatering af, at intet angreb fandt sted), <c2/> signalmiljøet, <c3/> angrebslignende evidens. Sig "geometri ukendt", når status er <c4/> (ingen GSV eller GSA i loggen); udled den ikke. Tærsklerne er <b>MODELLED</b> med angivet proveniens.

seg-0938dfb71d72 = Modtagerens tillidsscore

seg-8e3a7376cd6b = <b>Vejledende</b>: ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }); operatøren er fortsat ansvarlig. <b>MODELLED</b>. Angiv fartøjets grænser før kørslen, og tilpas ikke en tærskel til et resultat. En høj score er ikke bevis for en ægte positionsbestemmelse; kontrollerne kan ikke se en spoofer, der er i overensstemmelse med alle andre sensorer.

seg-ae3f0548e93f = Bevispakke

seg-81189f29f884 = En <b>teknisk registrering</b>, ikke en juridisk vurdering, en faktuel konstatering eller en godkendelse. Verificér med signatarens offentlige nøgle, hentet ad en anden vej; uden den er dommen <c1/>, som kun beviser integritet mod den nøgle, pakken selv nævner: sig "intakt, signatar ikke fastlagt", aldrig "verificeret". Returnér, log eller bed aldrig om et signerings-seed i en samtale, hvis nøglen har betydning: brug CLI.

seg-512e5ee42c1e = Trænings-NMEA

seg-c59a76aefff5 = <b>Kun tekst</b>, til træning og test, <b>aldrig</b> til et fartøjs aktive navigationssystemer. Returnér seed og instruktørlog.

seg-14781c19be62 = Interferenskort, rute-eksponering

seg-7135c6f44d49 = Hvordan nøjagtighedskoderne læses, og gitter- og rutegeometrien er <b>VALIDATED</b> mod uafhængige biblioteker på syntetiske input; metodens tærskler forbliver <b>MODELLED</b>, og at en forringet celle er interferens, er <b>ikke</b> kontrolleret: en forringet celle <b>udpeger ikke</b> interferens som årsag. En celle, der ikke er observeret, er <b>ikke</b> evidens for en fri rute. Tidligere rapporter, <b>ikke en prognose</b>. Kun aggregeret: forsøg ikke at genskabe identifikatorer. ADS-B- og AIS-kort forbliver adskilt.

seg-e47db9be47ea = Himmelgeometri, horisontprofil

seg-839eb485b1d2 = <b>MODELLED</b> geometri under en angivet fejlmodel, kun sigtelinje: ingen diffraktion, multipath eller modtagelse uden sigtelinje. Forudindstillinger er <b>REPRESENTATIVE</b>, ikke opmålinger; lad forudindstillingens proveniens følge med. Forudindstillede konstellationer er en repræsentativ himmel, ikke himlen på en given dato. Ellipsen skalerer en angivet UERE: ikke en målt nøjagtighed og ikke en integritetsgrænse. Behold <c1/>.

seg-0002a3dc682e = Tilgængelighed af optiske links (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, vejledende. Skyklimaerne er angivne input, ikke et datasæt, og ingen målt tilgængelighedsregistrering er sammenlignet: sig "under disse antagelser", aldrig "tilgængeligheden på det sted". Behold stedets <b>loft</b> (<c1/>: det, ingen margin kan løfte) ved siden af dets tilgængelighed, og sig, hvilke teknikgevinster der er input (Kshana modellerer ikke en adaptiv optisk sløjfe). Numerikken er kontrolleret mod et uafhængigt program, hvilket kontrollerer implementeringen af formlerne og ikke atmosfæren.

seg-3324b2e2021e = Holdover-test (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, vejledende. Sig "målt mod masken", aldrig at et ur eller et system opfylder eller er godkendt i forhold til en anbefaling. De to tidspunkter (GNSS fjernet, GNSS genoprettet) er <b>operatørens erklæring</b>: Kshana fjernede eller genoprettede intet og kan ikke verificere dem, så gengiv dem, som de er angivet. En maske, som optagelsen er for kort til, er <b>INCOMPLETE</b>, aldrig bestået. En servolog (linuxptp, chrony) er fejlen under servostyring, ikke en uafhængig måling mod UTC; sig, hvilken optagelse tallene stammer fra. Se <c1/>.

seg-18d3f2b50d0a = Ethvert scenarieresultat

seg-aab46d50d125 = <c1/> eller <c2/>, som det angiver, og provenienslinjen.

seg-166f773b2804 = Grænser

seg-203a91deb52c = Brug syntetiske data eller brugerens egne. Nævn ikke personer, fartøjer eller organisationer i output, som ikke stod i brugerens input. Kshana er et analyse- og træningsværktøj, ikke et produkt til flyvning eller navigation.

seg-ec064f62f7dc = <s1>Forrige</s1>MCP-server: selvhostet HTTP-tilstand

seg-1f44dbd65ce3 = <s1>Næste</s1>Hvor hver funktion kan nås
