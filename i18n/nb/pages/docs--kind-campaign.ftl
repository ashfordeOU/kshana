# docs--kind-campaign: translations (nb)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Kilde: <c1/>

seg-24ce6aee5e53 = <c1/> (scenariotype)

seg-931a3d27c0f0 = Scenariotype i motoren v{ $version }, familie <a1>Kampanjer</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-a07990e776cb = Kampanje: eksisterende scenariotyper satt sammen til én kjøring, der hvert tall er lest fra en reell kjøring av den navngitte typen. Fire deler, i en hvilken som helst kombinasjon. PHASES: et lenket oppdrag på én felles tidslinje -- hver fase kjører ett eller flere scenarioer (for eksempel jamming, deretter spoofing, deretter en klokke i holdover med et treghetsnavigasjonssystem som glir ved siden av, deretter en integritetsalarm, deretter gjenoppretting), utdataene leses inn i navngitte kanaler (klokkens tidsfeil mot sin vaktgrense, bærebølge-til-støytetthetsforhold mot sporingsgulvet, beskyttelsesnivå mot varslingsgrensen, posisjonsfeil, satellitter som spores, alarmflagg) ved en forhåndsinnstilling per type eller ved eksplisitte resultatstier, og resamples på et felles rutenett med null-ordens holdning, med fasegrenser og hendelser; tilstand føres videre ved carry (en kanal fortsetter fra forrige fases sluttverdi), handoff (et tall fra forrige fase skrives inn i denne fasens scenario) og end_at (en fase slutter på et tidspunkt en kjøring beregnet, for eksempel en spoofing-monitors deteksjonstid). SWEEP: et rutenett over én til tre punktnotasjonsnøkler i scenarioet for en hvilken som helst type (et heltallssegment indekserer en liste av tabeller, som i system.2.sisre_m), med metrikker lest ved resultatsti og, med flere enn én kjøring, et seedet Monte Carlo-ensemble i hver node. MONTE_CARLO: realisering k kjøres ved base_seed + k; hver metrikk rapporterer gjennomsnitt, standardavvik, nærmeste-rang 5.-/50.-/95.-persentiler og et bootstrap-konfidensintervall på { "95" }% med fast seed for gjennomsnittet. COMPOSE: flere scenarioer under felles verdier (én jammers effekt og posisjon skrevet inn i en maritim mottaker og en veimottaker), med en samlet beste/verste oppsummering. Resultatet inneholder en kampanje-hash, en digest over alle medlemsresultater og en enhetsoppføring for hvert utsendt tall; interoperabilitetseksportene skriver hvert medlemsscenario som har geometri som et eget filsett. Sammensetningsidentiteter er testet: en kampanje med én fase gjengir den frittstående kjøringen bit for bit, et ensemble med fast seed er byte-stabilt, og på en klokke med hvit frekvensstøy faller ensemblets gjennomsnitt inne i det rapporterte intervallet med en spredning som stemmer med sqrt(q_wf * tau). MODELLED: den additive carry-en og null-ordens holdning er modelleringsvalg, og hver fase har etiketten til typen som kjørte den.

seg-05e842f80dbb = Én kjøring av <c1/> oppsummeres som: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep of <c2/>: { "13" } nodes over [jammer_power] | { "13" } member runs (MODELLED)

seg-bf339fa14645 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Eksempelet <c1/> setter blant annet:

seg-c4f955d5f506 = tilgjengelighet

seg-7bcf77278958 = { "22" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Resultatetikett (motorens): MODELLED composition of existing scenario kinds. Every number is read from a real run of the named kind; the chaining (additive carry of a channel across a phase boundary, zero-order hold onto the timeline grid, a phase ended at a computed time) is a modelling choice, and each phase carries the labe

seg-b2c7cd1f9712 = Diagrammet motoren skriver for scenarios/campaign-sweep-jammer-power.toml, typen campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect og kampanjekjøreren: en valgfri [monitors]-tabell kjører IQ-monitorene på hver celle i kjørerens enkeltpass. Tester: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) og iq::campaign::report::rocs: hver celle i en kampanje med monitorer beholder, per alarmtype og kanal, maksimum av monitorens egen teststatistikk over hvert oppgitte hendelsesvindu (positiv) og over t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) og <c1/> på <c2/>, Python <c3/> og MCP-verktøyet labfit (kampanjemapper kun innenfor arbeidsmappen): leser en <c4/>-utdatamappe etter dens Tester: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Fasene til typen <c1/>: hver fase kjører ett eller flere scenarioer av eksisterende typer gjennom run_toml, leser utdataene inn i navngitte kanaler (klokkens tidsfeil og vaktgrense, gjennomsnittlig effektivt bærebølge-til-støytetthetsforhold og sporingsgulv, v Tester: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = og { "4" } til i matrisen.

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-linkbudsjett, anti-jam C/N₀, tap av lås per satellitt. Uavhengig referanse (InternalConsistency): Likningen for anti-jam C/N₀-linkbudsjett kryssjekket mot en uavhengig numpy-utledning (deler samme lukkede form → InternalConsistency) pluss en karakterisering av C/N₀-degradering i virkelige JammerTest-2024-data. { "0.30" } runde { "2" }, blokkert (forblir MODELLED): den målte C/N0-nedgangen i JammerTest { "2024" } mot en linkbudsjettprediksjon (forhåndsregistrert 6a66994b, innen { "3" } dB) ble ikke kjørt fordi F8.1-antenneposisjonen og -pekingen at

seg-59afd80736c5 = <b>PARTNER</b> Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-fa3ad6babe54 = <b>MODELLED</b> Sweep-delen til typen <c1/> (én til tre punktnotasjonsnøkler av en hvilken som helst type, på det generiske sveipets akseverdier, eventuelt et ensemble i hver node) og monte_carlo-sek. Uavhengig referanse (InternalConsistency): Den lukkede formen for fasens randomvandring under hvit frekvensstøy, varians q_wf tau (NIST Technical Note { "1337" }), for statistikkmaskineriet, og byte-likhet med de frittstående kjøringene for seedingen. Den kontrollerer ensemble-aritmetikken på motorens egen klokkemodell, ikke et eksternt datasett

seg-c15b5ac32282 = MODELLED sammensetning av eksisterende scenariotyper. Hvert tall er lest fra en reell kjøring av den navngitte typen; lenkingen (additiv carry av en kanal over en fasegrense, null-ordens holdning på tidslinjens rutenett, en fase avsluttet på et beregnet tidspunkt) er et modelleringsvalg, og hver fase har etiketten til typen som frembrakte den. (resultat <c1/>)

seg-9e33dcc39c27 = MODELLED: den additive carry-en og null-ordens holdning er modelleringsvalg, og hver fase har etiketten til typen som kjørte den. (typekatalog (<c1/>))

seg-adcc6ea59840 = MODELLED: slik typen <c1/> er. (kommentar i scenariofilen, linje { "14" })

seg-143f3f1cc521 = Robusthet mot jamming uten GNSS er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Parametersveip og seedede Monte Carlo-ensembler over en hvilken som helst scenariotype er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Familieside: <a1>Kampanjer</a1>

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Temaside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Forrige</s1>body-pnt

seg-fadd92303a4d = <s1>Neste</s1>cislunar-arc-recovery

seg-a349aa76b0ed = PARTNER
