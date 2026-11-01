# docs--agents: translations (nb)

seg-0619151df586 = Kilde: <c1/>

seg-d0e198572cfe = Bruke Kshana fra en KI-agent

seg-eccd1d5fbdb2 = For en agent (eller personen som styrer en): hvilket verktøy som skal kalles for hvilket spørsmål, hva verktøyene vil og ikke vil gjøre, og hva som skal følge med hvert svar. Flater og cellene som ikke er tilgjengelige på en gitt flate: <a1><c1/></a1>.

seg-a0354cacda4c = Koble til

seg-337d23a873f5 = En passasje som nevner KI-klienter fra tredjeparter er utelatt her; den står i <a1>docs/AGENTS.md</a1> på GitHub.

seg-01a862ed86e6 = Regelen for hvert svar

seg-0adf5e5ad79a = Kjør motoren; ikke gjett tallene. Rapporter det et verktøy returnerte med enhet og evidensnivå (VALIDATED mot en ekstern uavhengig referanse, eller MODELLED), scenarioet, seedet og motorversjonen, slik at kjøringen kan gjentas. La hvert resultats egne forbehold følge med.

seg-f67845b891c5 = Hvilket verktøy for hvilket spørsmål

seg-6f4bb4962340 = Spørsmålet

seg-8efda304925b = Verktøy (MCP)

seg-83d609ff5cc7 = Skråstrekkommando

seg-9b937d3cbf88 = Kjøre eller forklare et PNT-scenario (baner, GNSS, tidssynkronisering, fusjon, måne, optiske lenker, ...)

seg-ba8b3824bba2 = Var denne mottakerloggen, eller dette fartøyets NMEA, til å stole på, og når sluttet den å være det?

seg-f3ea74f278ac = <c1/> (alle loggformater), <c2/> (NMEA fra fartøy, batch), <c3/> (avgrenset utdrag)

seg-aa194fda4300 = Jeg trenger syntetisk NMEA med en jamming-, drag-off-, tids-spoofing- eller replay-hendelse til trening

seg-0211b49536df = Vis et fartøys tillitsscore i overvåkings- eller SIEM-formater (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Gi poengsum til en mottakerlogg mot den publiserte Jammertest-planen (deteksjonsforsinkelse, uteblitte alarmer, falske alarmer, tid til gjenoppretting), eller gjør planen om til hendelser

seg-d1c81008d5f8 = Lag en manipulasjonssikker oversikt over hva motoren sa om et vindu av et fartøys logg, eller kontroller en slik oversikt

seg-b7892674ac60 = Hvilke Galileo-satellitters navigasjonsdata autentiserer denne mottakerens strøm (OSNMA)?

seg-084a787c65cf = <b>ingen: ikke i MCP.</b> Bruk <c1/> (CLI), <c2/> (Python) eller <c3/> (WASM, OSNMA-kortet i Studio)

seg-4fc021a0a145 = ikke en skråstrekkommando

seg-0f5db62071e9 = Jeg trenger et scenarios kjøretøybevegelse og hendelsestidspunkter for å spille av gjennom en GNSS-simulator i laboratoriet

seg-919946a95002 = Hvilke rader med krav i offentlige rammeverk gir disse kjøringene belegg for, og hva er gapet?

seg-5e08ec7f4852 = <c1/> (fra resultattekst), <c2/> (tabellene, ingen kjøringer)

seg-ff6556a46025 = Kjøre en standardpakke med poengsum (DHS RPCF-testprofiler, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) mot terskler oppgitt før kjøringen?

seg-709c6501a661 = <c1/>, <c2/> (gi rapporten til <c3/> for radene)

seg-1745cce01677 = Kontrollere LunaNet Augmented Forward Signal (koder, SB1, rammeformat) mot LNIS V5 / LSIS-AFS V1.0, eller kontrollere en symbolstrøm?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols eller generate); LDPC og CRC-24Q i delrammene { "2" } til { "4" } er ikke verifisert

seg-86c207c3996e = Knytte en laboratoriekjøring (scenario, oppgitte testforhold, mottakerlogg, poengsum) sammen i én signert pakke?

seg-25bb29e6aa3d = <c1/> etter <c2/> (<c3/>)

seg-3856b38bb9d2 = Gi poengsum til en deteksjons- eller holdover-innsending mot en kshana-bench-referansefil, eller gjengi resultatfiler som resultattavlesiden?

seg-87e686c064ce = Jeg trenger et scenario som flyr en GeoJSON-rute (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Hvilke satellitter ser en bruker i en gate, en havn, en fjord eller en containerterminal, og hva er DOP og feilellipsen?

seg-86eb2756fd7f = <c1/> (en forespørsel, eller en <c2/>); et scenarios <c3/>-seksjon gjennom <c4/> (<c5/> og <c6/> trenger <c7/>)

seg-bd7f9d7e8e27 = Hvor har GNSS sett degradert ut, og hvor mye av denne ruten ligger i det?

seg-908b6e65372f = <c1/>, deretter <c2/>

seg-1f715d5e0c4f = GNSS IQ-opptak (scene, anskaffelse, sporing, front-end, kampanjer)

seg-5569efd18c6b = <c1/> først, deretter verktøyene <c2/>

seg-d44650438742 = Ferdighetene <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og <c7/> bærer reglene nedenfor for agenter som laster ferdigheter.

seg-a4de5a40b743 = Hva hvert verktøy ikke vil gjøre

seg-3f27662a983e = <b>Lese eller skrive filer.</b> Innholdet er innebygd: inndata er tekst i forespørselen, begrenset til { "4" } MiB, og et scenariofelt som nevner en fil, avvises. Bare verktøyene <c1/> berører en mappe, og bare den som er oppgitt av <c2/>, med hver sti avgrenset til den.

seg-3efe81d26cad = <b>Verifisere OSNMA.</b> Det finnes ikke noe MCP-verktøy: inndataene er en lang rå mottakerstrøm (I/NAV-sider eller et UBX-opptak), som passer for CLI og Python, og et verktøy som tok imot en slik, ville lagt til en stor inndataflate uten nytte. Send brukeren til <c1/> (eller Python <c2/>). Uansett hva utdataene sier, ta med den veiledende merknaden ordrett: bare autentiseringsstatus, ikke en integritetstjeneste for navigasjon, ikke typegodkjent navigasjonsutstyr, og ingen påstand om ytelse mot spoofing; et resultat er bare meningsfullt med en Merkle-rot eller offentlig nøkkel brukeren har skaffet seg på en annen vei.

seg-b13a75d08152 = Kjøre en prosess.

seg-9dfcbee6fdb8 = <c1/> som en kjørende strøm (med en gate og <c2/>), telemetrieksportørene (<c3/>: Prometheus, syslog, OTLP) og strømming av NMEA for trening til en adresse er bare på kommandolinjen. <c4/> gir poengsum til et utdrag med den samme motoren og skriver til ingen port. Utdragsverktøyene returnerer live JSON-lines-skjema { "1.3" } (en <c5/>-erklæring og satellittens <c6/> i hver epoke, en <c7/> på hver slutning); en CSV fra en fartøykjøring begynner med en <c8/>-kommentarlinje som bærer den samme erklæringen, så les den med et kommentaralternativ. <c9/> og <c10/> binder loopback-adressen med mindre noe annet er oppgitt.

seg-ac51aad84893 = Skrive et signal.

seg-ad032dee3fd3 = <c1/> returnerer kjøretøybevegelse og merkede hendelsesintervaller som tekst; ingenting den returnerer er, modellerer eller driver et radiofrekvens- eller basebåndsignal, og en hendelse er ikke en oppskrift for å lage interferens. Gi videre dens <c2/> sammen med filene; simulatoren og operatøren er ansvarlige for å kjøre dem bare der det er tillatt.

seg-39f3aae1143a = Si mer enn kartleggingen sier.

seg-ed04b567fc87 = <c1/> sier hvilke rader i rammeverk et sett kjøringer gir belegg for, med hver rads gap. Den sier aldri at et rammeverk er oppfylt eller at et produkt er vurdert eller godkjent; ta med dens <c2/> ordrett og si «gir belegg for», ikke noe sterkere. Den leser resultat- og scenariotekst du sender inn, aldri en sti.

seg-eda73a8fcbfe = <b>Hente data.</b> Nedlastingen av landpolygoner er bare på kommandolinjen og trenger <c1/>. Send landfilen, om ønsket, som tekst. Bruk bare data brukeren har lisens til å bruke.

seg-d513f734248e = <b>Sende noe eller syntetisere RF.</b> Treningsgeneratoren skriver NMEA-tekst; IQ-laget skriver sampelfiler for programvaremottakere.

seg-63eb4c5b4a17 = Hva som skal følge med svaret

seg-6555ff9a6d8e = Utdata

seg-a056a59fb678 = Behold

seg-c01c0fedd895 = Satellittgeometri og slutningsklasser ({ "0.36" })

seg-3723ec5a3f8c = Rapporter geometrien ved siden av poengsummen og hver slutnings klasse slik den ble returnert: <c1/> betyr himmelen (en uttalelse om himmelen, ikke en konstatering av at ingen angrep skjedde), <c2/> signalmiljøet, <c3/> angrepslignende evidens. Si «geometri ukjent» når statusen er <c4/> (ingen GSV eller GSA i loggen); ikke utled en. Terskler er <b>MODELLED</b> med oppgitt opphav.

seg-0938dfb71d72 = Tillitsscore for mottaker

seg-8e3a7376cd6b = <b>Veiledende</b>: ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }); operatøren er fortsatt ansvarlig. <b>MODELLED</b>. Oppgi fartøyets grenser før kjøringen, og ikke juster en terskel etter et resultat. En høy score er ikke bevis for en ekte posisjonsbestemmelse; kontrollene kan ikke se en spoofer som er konsistent med alle andre sensorer.

seg-ae3f0548e93f = Bevispakke

seg-81189f29f884 = En <b>teknisk oppføring</b>, ikke en juridisk vurdering, en faktakonstatering eller en godkjenning. Verifiser med signatarens offentlige nøkkel skaffet på en annen vei; uten den er vurderingen <c1/>, som bare beviser integritet mot nøkkelen pakken selv oppgir: si «intakt, signatar ikke fastslått», aldri «verifisert». Returner, logg eller be aldri om et signeringsseed i en samtale hvis nøkkelen betyr noe: bruk CLI.

seg-512e5ee42c1e = NMEA for trening

seg-c59a76aefff5 = <b>Bare tekst</b>, for trening og testing, <b>aldri</b> for et fartøys levende navigasjonssystemer. Returner seedet og instruktørloggen.

seg-14781c19be62 = Interferenskart, ruteeksponering

seg-7135c6f44d49 = Hvordan nøyaktighetskodene leses og hvordan rutenett- og rutegeometrien er, er <b>VALIDATED</b> mot uavhengige biblioteker på syntetiske inndata; metodens terskler forblir <b>MODELLED</b>, og at en degradert celle er interferens, er <b>ikke</b> kontrollert: en degradert celle identifiserer <b>ikke</b> interferens som årsak. En celle som ikke er observert, er <b>ikke</b> evidens for en fri rute. Tidligere rapporter, <b>ikke en prognose</b>. Bare aggregert: ikke prøv å gjenopprette identifikatorer. ADS-B- og AIS-kart holdes adskilt.

seg-839eb485b1d2 = <b>MODELLED</b> geometri under en oppgitt feilmodell, bare sikt: ingen diffraksjon, flerveisutbredelse eller mottak uten sikt. Forhåndsinnstillinger er <b>REPRESENTATIVE</b>, ikke målinger; ta med forhåndsinnstillingens opphav. Forhåndsinnstilte konstellasjoner er en representativ himmel, ikke himmelen på en bestemt dato. Ellipsen skalerer en oppgitt UERE: ikke en målt nøyaktighet og ikke en integritetsgrense. Behold <c1/>.

seg-0002a3dc682e = Tilgjengelighet for optisk lenke (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, veiledende. Skyklimaene er oppgitte inndata, ikke et datasett, og ingen målt tilgjengelighetsoppføring er sammenlignet: si «under disse forutsetningene», aldri «tilgjengeligheten på det stedet». Behold stedets <b>tak</b> (<c1/>: det ingen margin løfter) ved siden av tilgjengeligheten, og si hvilke teknikkgevinster som er inndata (Kshana modellerer ikke en adaptiv optikk-løkke). Numerikken er kontrollert mot et uavhengig program, som kontrollerer implementasjonen av formlene og ikke atmosfæren.

seg-3324b2e2021e = Holdover-test (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, veiledende. Si «målt mot masken», aldri at en klokke eller et system oppfyller eller er godkjent mot en anbefaling. De to tidspunktene (GNSS fjernet, GNSS gjenopprettet) er <b>operatørens uttalelse</b>: Kshana fjernet eller gjenopprettet ingenting og kan ikke verifisere dem, så gjengi dem som oppgitt. En maske som oppføringen er for kort for, er <b>INCOMPLETE</b>, aldri bestått. En servologg (linuxptp, chrony) er feilen under servostyring, ikke en uavhengig måling mot UTC; si hvilken oppføring tallene kommer fra. Se <c1/>.

seg-18d3f2b50d0a = Ethvert scenarioresultat

seg-aab46d50d125 = <c1/> eller <c2/> det oppgir, og opphavslinjen.

seg-166f773b2804 = Grenser

seg-203a91deb52c = Bruk syntetiske data eller brukerens egne data. Ikke nevn personer, fartøyer eller organisasjoner i utdata som ikke sto i brukerens inndata. Kshana er et analyse- og treningsverktøy, ikke et produkt for luftfart eller navigasjon.

seg-ec064f62f7dc = <s1>Forrige</s1>MCP-server: selvdrevet HTTP-modus

seg-1f44dbd65ce3 = <s1>Neste</s1>Hvor hver funksjon er tilgjengelig

seg-e47db9be47ea = Himmelgeometri, horisontprofil

seg-e3949a1e6082 = Senderregion (<c1/>)

seg-46b2efcb9bec = <b>MODELLED</b>: en mulig region under radiosiktlinje, ikke en posisjonsbestemmelse. Oppgi regionen med oppgitt konfidensnivå sammen med tyngdepunktet og ellipsen, aldri tyngdepunktet alene; si <c1/> når dataene ikke snevrer den inn; si at den er betinget av modellen (kontrollert bare på syntetiske data; den forhåndsregistrerte Jammertest-sammenligningen ble kjørt én gang og var NOT ASSESSABLE for begge kilder, så ingenting ble testet eksternt). Nøytral ordlyd: «estimert senderregion»; navngi eller antyd aldri hvem eller hva som står bak en kilde, en stat, en styrke eller et forsett. Bare aggregert; ikke prøv å gjenvinne identifikatorer. Publisering av senderregioner i det offentlige observatoriet er av.
