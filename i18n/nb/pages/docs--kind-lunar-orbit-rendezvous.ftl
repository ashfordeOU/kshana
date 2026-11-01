# docs--kind-lunar-orbit-rendezvous: translations (nb)

seg-34bdcfd66ded = I repositoriegrenen disse dokumentene kommer fra; ennå ikke på GitHub

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-6a26b9ab59fe = Temaside: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultatetikett (motorens egen): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Propagatoren de lunare typene deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredje legemer, relativitet, DE440-månorientering) sammenlignet med de offentl. Uavhengig referanse (ExternalDataset): JPL Horizons-efemerider for romfartøy for LRO og CAPSTONE, mot terskler forhåndsregistrert i xval/mission-thread-lunar/PREREGISTRATION.md (endringene { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskjell og { "2.4" } m RMS radialt mot { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskjell i sluttposisjon på { "136.8" } km mot { "25" } km og en forskjell i periapsis på { "28.4" } km mot { "10" } km, årsakene er ikke isolert. Raden er Modellert fordi CAPSTON

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e482c9896140 = Propageringen med månens kraftmodell mot offentlige rekonstruerte baner for månesatellitter og cislunare baner er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir Modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Kilde: <c1/>

seg-8beb22a0eb0b = <c1/> (scenariotype)

seg-2deefd8c547b = MODELLED relativ navigasjon for en dokking i stil med Orion og landingsfartøy i en lav månebane eller en elliptisk polarbane (Artemis-class). Et jagerfartøy og et målfartøy flyr i samme bane under crate-ens månekraftmodell; et felles batch Gauss-Newton-estimat med 21 parametere over buen (to fartøytilstander og vedvarende signal-i-rommet-biaser) slår sammen én absolutt posisjonsbestemmelse per fartøy fra et ILLUSTRATIVE relésett av LCNS-klasse (reléer bak Månen utelatt, fire kreves, og den felles signal-i-rommet-feilen opphever seg mellom fartøyene) og en tverrlinkavstand, med avstandspresisjon fra kodesporingsgrensen på LunaNet AFS-pilotsignalet. Rapporterer den formelle og Monte Carlo-baserte relative posisjons- og hastighetsfeilen i målfartøyets LVLH-akser, tilgjengeligheten av posisjonsbestemmelser, den midlere normaliserte estimeringsfeilen i annen potens (NEES) mot forventet verdi, og enhver prøve der iterasjonen ikke konvergerte, driften ved å se bort fra gravitasjonsharmoniske og den fulle 6x6-kovariansen som føres videre. En lukket Hill/Clohessy-Wiltshire-kontroll gjelder for det sirkulære tilfellet. MODELLED: illustrativt relésett, feilbudsjett og priorer; referansen og estimatoren deler én kraftmodell, så NEES kontrollerer selvkonsistens og ikke modellfeil. Ikke godkjent av noe romfartsbyrå; veiledende programvare, ikke sertifisert navigasjonsutstyr.

seg-a6d29fc5f19b = Én kjøring av <c1/> oppsummeres slik: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | posisjonsbestemmelser { "74" }% | rel. pos. 1-sigma R/A/C 0.03/0.06/0.04 m | middel-NEES { "6.51" } ({ "6" } forventet) | konvergert ved { "2000" } s (MODELLED)

seg-b7c86affeac1 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Eksempelet <c1/> setter blant annet:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Veiledende programvare, ikke sertifisert navigas

seg-4466fb6f4043 = batch Gauss-Newton over buen

seg-d97b2505ac72 = Diagrammet motoren skriver for scenarios/lunar-orbit-rendezvous.toml, typen lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Typen og fasen <c1/>: et felles batch Gauss-Newton-estimat for to fartøy over buen (tjueen parametere: begge tilstandene og vedvarende signal-i-rommet-posisjonsbiaser, felles og uavhengige), vokst over en kvart, en h Tester: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Typen og fasen <c1/>: et felles batch Gauss-Newton-estimat for to fartøy over buen (tjueen parametere: begge tilstandene og vedvarende sig. Uavhengig referanse (InternalConsistency): Selvkonsistens under en forhåndsregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultater og estimatorhistorikken i RESULTS.md): middel-NEES for den relative tilstanden er { "5.85" } til { "5.93" } mot båndet { "5.2" } til { "6.8" } i fire konfigurasjoner, MET på den fjerde estimatorutformingen etter at tre utforminger med sekvensielt filter bommet; referansen og estimatoren deler én kraftmodell, så dette sier ingenting om modellfeil. Den p

seg-b2f273ea732d = MODELLED relativ navigasjon for en dokking i stil med Orion og landingsfartøy i en lav månebane eller en elliptisk polarbane (Artemis-class). (typekatalog (<c1/>))

seg-9d4f99557cc5 = MODELLED: illustrativt relésett, feilbudsjett og priorer; referansen og estimatoren deler én kraftmodell, så NEES kontrollerer selvkonsistens og ikke modellfeil. (typekatalog (<c1/>))

seg-158e44d47c0b = ÆRLIGHET: MODELLED. Relésettet, signal-i-rommet-feilen, den felles andelen og priorene er ILLUSTRATIVE inndata, ikke målinger; referansen og estimatoren deler kraftmodellen (et innebygd sentralledd, J2 og C22). Den forhåndsregistrerte konsistenskontrollen B1 (middel-NEES i [{ "5.2" }, { "6.8" }]) er oppfylt i alle fire konfigurasjoner på batch-utformingen: se xval/mission-thread-lunar/RESULTS.md. Ingen samsvar med noen re (kommentar i scenariofilen, linje { "10" } til { "14" })

seg-2a88a9650804 = Relativ navigasjon til dokking i en månebane (<c1/>) er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Forrige</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Neste</s1>lunar-station-coverage
