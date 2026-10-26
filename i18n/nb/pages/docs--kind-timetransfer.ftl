# docs--kind-timetransfer: translations (nb)

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-5a70fcb097dc = Valgfrie felt: ingen

seg-a1810bbca337 = <b>MODELLED</b> Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→avstand. Uavhengig referanse (ExternalDataset): Sagnac-størrelsen kontrollert mot en autoritativ PUBLISERT VERDI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en østvendt omrunding av ekvator gir { "207.4" } ns (2ωA_E/c²); kshana gjengir { "207.386" } ns. Uavhengig bekreftet av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometrien. Den sammensatte BIPM TWSTFT-transponderen/common-view/

seg-a8beb8dfc757 = Feilbudsjettering for tidsoverføring er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-37a77f49f048 = ps

seg-2ccebbc74d9f = Kilde: <c1/>

seg-289a9f8dc990 = <c1/> (scenariotype)

seg-ccb244e60d60 = Optisk mot RF toveis tids-/frekvensoverføring.

seg-59347fda6c66 = Én kjøring av <c1/> gir denne oppsummeringen: scenario 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-7b887ea27a86 = Eksemplet <c1/> setter blant annet:

seg-2485eaa6dbf4 = Toveis satellittbasert tid- og frekvensoverføring (TWSTFT, Ku-bå

seg-fa54f1a81b57 = Optisk lenke mellom satellitter, synkronisering på pikosekundnivå

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = Diagrammet motoren skriver for scenarios/timetransfer.toml, type timetransfer

seg-3c9d28692f9f = <b>MODELLED</b> Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; lenkejitter→avstand Tester: <a1>time_transfer_error_budgeting_reference.rs</a1>.

seg-84fcf20588fb = <s1>Forrige</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>Neste</s1>tracking-loop
