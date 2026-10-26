# docs--kind-quantum-time-transfer: translations (da)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Scenarietype i motoren v{ $version }, familie <a1>Ure, tidssynkronisering og holdover</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-849c08d3ce70 = Familieside: <a1>Ure, tidssynkronisering og holdover</a1>

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Tovejs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand. Uafhængig reference (ExternalDataset): Sagnac-størrelsen kontrolleret mod en autoritativ OFFENTLIGGJORT VÆRDI: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en omsejling mod øst langs ækvator giver { "207.4" } ns (2ωA_E/c²); kshana gengiver { "207.386" } ns. Uafhængigt bekræftet af RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometri. Det sammensatte BIPM TWSTFT-transponder/common-view/

seg-a8beb8dfc757 = Fejlbudgettering for tidsoverførsel er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Ikke leveret: kun ydelsesmodeller; koldatom-/urhardware er en partners. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test i designet

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Ét reproducerbart TradeEvidence-objekt (fast ramme: scenarie+seed+motor; fælles værdier for kvante mod klassisk pr. kvalitetsmål med polaritetskorrekt fordel, valgfri { "95" }%. Uafhængig reference (InternalConsistency): identiteter i lukket form for fordel og vinder + tro indpakning af det eksisterende quantum_trade::TradeResult; ærligheden er knyttet til registeret over repræsentativitet og verifikationsmærkaterne

seg-eb75c6a4dcec = Afvejning mellem kvante og klassisk (fælles form) er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Kilde: <c1/>

seg-05060df7f0b7 = <c1/> (scenarietype)

seg-540545e6f846 = MODELLED kæde for troværdig kvantetidssynkronisering: et budget for tidsoverførsel fra ende til ende med kvante (optisk gitterur + sammenfiltrings-/enkeltfotonforbindelse) mod klassisk (CSAC + RF tovejs), et genbrugt beskyttelsesniveau for tidssynkronisering + et kvalitetsmål for sikkerhed mod forsinkelses- og genafspilningsangreb (1-P_md), en sandsynlighed for detektion af uranomalier + CUSUM-latens og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med en repræsentativitets- og gaps-to-flight-registrering. Illustrative parametre for enhed og forbindelse fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering påstås.

seg-ed79bfe80fe7 = Én kørsel af <c1/> opsummeres som: quantum-time-transfer | kvantekæde 1.233e-12s mod klassisk 5.292e-9s | PL { "555.24" } ns | sikkerhed Pd { "1.000" } (Pfa { "1e-3" }) | anomali Pd { "0.761" } | afvejning: kvante vinder 2/2 | MODELLED

seg-80e94491c3df = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Eksemplet <c1/> angiver blandt andet:

seg-09760f892c7b = Diagrammet, som motoren skriver for scenarios/quantum-time-transfer.toml, type quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Den værst tænkelige detektionslatens for en tabulær CUSUM-detektor (⌊h/(z−k)⌋+{ "1" }) og den gennemsnitlige run-længde uden for kontrol, brugt af beskyttelsesniveauet for tidssynkronisering og af spoof-monitorerne. Uafhængig reference (ExternalDataset): offentliggjort ARL for tabulær CUSUM: Siegmunds ({ "1985" }) tilnærmelse med brownsk bevægelse (Hawkins & Olwell { "1998" }, ligning { "3.7" }) krydsforankret til ARL-tabellerne i Montgomery, Introduction to Statistical Quality Control (Wiley) for k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministisk latens afstemt nøjagtigt mod en reference for første passage. Den sammensatte grænse for TPL forbliver MODELLED

seg-b51e62b8dc63 = MODELLED kæde for troværdig kvantetidssynkronisering: et budget for tidsoverførsel fra ende til ende med kvante (optisk gitterur + sammenfiltrings-/enkeltfotonforbindelse) mod klassisk (CSAC + RF tovejs), et genbrugt beskyttelsesniveau for tidssynkronisering + et kvalitetsmål for sikkerhed mod forsinkelses- og genafspilningsangreb (1-P_md), en sandsynlighed for detektion af uranomalier + CUSUM-latens og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med en repræsentativitets- og gaps-to-flight-registrering. (typekatalog (<c1/>))

seg-dee0faf63e7f = Troværdig kvantetidssynkronisering — kæde for tidsoverførsel fra ende til ende, sikker udbredelse, detektion af anomalier og en afvejning mellem kvante og klassisk. MODELLED; illustrative parametre for enhed og forbindelse fra offentlige kilder; modellerer klassen, ingen påstand om TRL eller flyvning. (kommentar i scenariefilen, linje { "1" } til { "3" })

seg-6e9f5dfca6b0 = Troværdig kvantetidssynkronisering (tidsoverførsel + sikker udbredelse + anomali) er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Forrige</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Næste</s1>quantum-trade
