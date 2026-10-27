# docs--kind-timetransfer: translations (da)

seg-c61e88721556 = Scenarietype i motoren v{ $version }, familie <a1>Ure, tidssynkronisering og holdover</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-849c08d3ce70 = Familieside: <a1>Ure, tidssynkronisering og holdover</a1>

seg-5a70fcb097dc = Valgfrie felter: ingen

seg-a1810bbca337 = <b>MODELLED</b> Tovejs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand. Uafhængig reference (ExternalDataset): Sagnac-størrelsen kontrolleret mod en autoritativ OFFENTLIGGJORT VÆRDI: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en omsejling mod øst langs ækvator giver { "207.4" } ns (2ωA_E/c²); kshana gengiver { "207.386" } ns. Uafhængigt bekræftet af RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometri. Det sammensatte BIPM TWSTFT-transponder/common-view/

seg-a8beb8dfc757 = Fejlbudgettering for tidsoverførsel er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-37a77f49f048 = ps

seg-2ccebbc74d9f = Kilde: <c1/>

seg-289a9f8dc990 = <c1/> (scenarietype)

seg-ccb244e60d60 = Optisk mod RF tovejs tids-/frekvensoverførsel.

seg-59347fda6c66 = Én kørsel af <c1/> opsummeres som: scenarie 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-7b887ea27a86 = Eksemplet <c1/> angiver blandt andet:

seg-2485eaa6dbf4 = Tovejs tids- og frekvensoverførsel via satellit (TWSTFT, Ku-bå

seg-fa54f1a81b57 = Optisk inter-satellit-forbindelse, synkronisering på picosekundniveau

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = Diagrammet, som motoren skriver for scenarios/timetransfer.toml, type timetransfer

seg-3c9d28692f9f = <b>MODELLED</b> Tovejs/TWSTFT (Sagnac), GNSS common-view, PPP; forbindelsesjitter→afstand Tests: <a1>time_transfer_error_budgeting_reference.rs</a1>.

seg-84fcf20588fb = <s1>Forrige</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>Næste</s1>tracking-loop
