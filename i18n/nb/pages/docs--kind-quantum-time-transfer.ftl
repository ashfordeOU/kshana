# docs--kind-quantum-time-transfer: translations (nb)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Temaside: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→avstand. Uavhengig referanse (ExternalDataset): Sagnac-størrelsen kontrollert mot en autoritativ PUBLISERT VERDI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en østvendt omrunding av ekvator gir { "207.4" } ns (2ωA_E/c²); kshana gjengir { "207.386" } ns. Uavhengig bekreftet av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometrien. Den sammensatte BIPM TWSTFT-transponderen/common-view/

seg-a8beb8dfc757 = Feilbudsjettering for tidsoverføring er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Ikke levert: kun ytelsesmodeller; kaldatom-/klokkemaskinvare er en partners. Uavhengig referanse (NoneKind): ingen: en disiplin eid av en partner, uten modul og uten test etter utforming

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Ett reproduserbart TradeEvidence-objekt (fast ramme: scenario+seed+motor; felles verdier per kvalitetsmål for kvante mot klassisk med fordel med riktig fortegn, valgfritt { "95" }%. Uavhengig referanse (InternalConsistency): lukkede identiteter for fordel/vinner og en tro innpakning av det eksisterende quantum_trade::TradeResult; ærligheten er knyttet til registeret over representativitet og verifikasjonsetikettene

seg-eb75c6a4dcec = Handelsbevis for kvante mot klassisk (felles form) er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Kilde: <c1/>

seg-05060df7f0b7 = <c1/> (scenariotype)

seg-540545e6f846 = MODELLED kjede for pålitelig kvantetidssynkronisering: et budsjett for tidsoverføring fra ende til ende for kvante (optisk gitterklokke + sammenfiltring/enkeltfotonlenke) mot klassisk (CSAC + toveis RF), et gjenbrukt beskyttelsesnivå for tidssynkronisering + et kvalitetsmål for sikkerhet mot forsinknings- og replay-angrep (1-P_md), en sannsynlighet for deteksjon av klokkeanomali + CUSUM-latens, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med en post for representativitet og gap til flyging. Illustrative parametere for enhet og lenke fra offentlige kilder; modellerer klassen, ingen TRL, ingen flyging og ingen sertifisering påstås.

seg-ed79bfe80fe7 = En kjøring av <c1/> oppsummeres slik: quantum-time-transfer | quantum chain 1.233e-12s vs classical 5.292e-9s | PL { "555.24" } ns | security Pd { "1.000" } (Pfa { "1e-3" }) | anomaly Pd { "0.761" } | trade quantum wins 2/2 | MODELLED

seg-80e94491c3df = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Eksempelet <c1/> angir blant annet:

seg-09760f892c7b = Diagrammet motoren skriver for scenarios/quantum-time-transfer.toml, type quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Verste tilfelle av deteksjonslatens for tabulær CUSUM-detektor (⌊h/(z−k)⌋+{ "1" }) og gjennomsnittlig kjørelengde utenfor kontroll, brukt av monitorene for beskyttelsesnivå for tidssynkronisering og spoofing. Uavhengig referanse (ExternalDataset): publisert ARL for tabulær CUSUM: Siegmunds ({ "1985" }) approksimasjon med brownsk bevegelse (Hawkins & Olwell { "1998" }, ligning { "3.7" }) krysskoblet til ARL-tabellene i Montgomery, Introduction to Statistical Quality Control (Wiley) for k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministisk latens stemt nøyaktig mot en uavhengig referanse for første passasje. Den sammensatte grensen for TPL forblir MODELLED

seg-b51e62b8dc63 = MODELLED kjede for pålitelig kvantetidssynkronisering: et budsjett for tidsoverføring fra ende til ende for kvante (optisk gitterklokke + sammenfiltring/enkeltfotonlenke) mot klassisk (CSAC + toveis RF), et gjenbrukt beskyttelsesnivå for tidssynkronisering + et kvalitetsmål for sikkerhet mot forsinknings- og replay-angrep (1-P_md), en sannsynlighet for deteksjon av klokkeanomali + CUSUM-latens, og avveiningen mellom kvante og klassisk som ærlig TradeEvidence med en post for representativitet og gap til flyging. (typekatalog (<c1/>))

seg-dee0faf63e7f = Pålitelig kvantetidssynkronisering: tidsoverføringskjede fra ende til ende, sikker formidling, anomalideteksjon og en avveining mellom kvante og klassisk. MODELLED; illustrative parametere for enhet og lenke fra offentlige kilder; modellerer klassen, ingen påstand om TRL eller flyging. (kommentar i scenariofilen, linje { "1" } til { "3" })

seg-6e9f5dfca6b0 = Pålitelig kvantetidssynkronisering (tidsoverføring + sikker formidling + anomali) er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Forrige</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Neste</s1>quantum-trade
