# docs--kind-timetransfer: translations (sv)

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-5a70fcb097dc = Valfria fält: inga

seg-a1810bbca337 = <b>MODELLED</b> Tvåvägs/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter→avstånd. Oracle (ExternalDataset): Sagnac-storleken kontrollerad mot ett auktoritativt PUBLICERAT VÄRDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: ett ekvatorialt varv åt öster ackumulerar { "207.4" } ns (2ωA_E/c²); kshana återskapar { "207.386" } ns. Oberoende bekräftat av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bär samma 2Aω/c²-geometri. Den sammansatta BIPM TWSTFT-transpondern/common-view/

seg-a8beb8dfc757 = Felbudgetering för tidsöverföring är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-37a77f49f048 = ps

seg-2ccebbc74d9f = Källa: <c1/>

seg-289a9f8dc990 = <c1/> (scenariotyp)

seg-ccb244e60d60 = Optisk jämfört med RF tvåvägs tids- och frekvensöverföring.

seg-59347fda6c66 = En körning av <c1/> sammanfattas som: scenario 8f9c2e0e31a5 | optisk sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-7b887ea27a86 = Exemplet <c1/> anger bland annat:

seg-2485eaa6dbf4 = Tvåvägs tids- och frekvensöverföring via satellit (TWSTFT, Ku-ba

seg-fa54f1a81b57 = Optisk länk mellan satelliter, synkronisering på pikosekundnivå

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = Diagrammet som motorn skriver för scenarios/timetransfer.toml, typ timetransfer

seg-3c9d28692f9f = <b>MODELLED</b> Tvåväg/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter→avstånd. Tester: <a1>time_transfer_error_budgeting_reference.rs</a1>.

seg-84fcf20588fb = <s1>Föregående</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>Nästa</s1>tracking-loop
