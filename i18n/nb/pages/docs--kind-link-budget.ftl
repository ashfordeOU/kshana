# docs--kind-link-budget: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-a3697ad561db = Hz

seg-120fcc840b87 = Kilde: <c1/>

seg-738aa7d45efb = <c1/> (scenariotype)

seg-953188c11165 = Énveis linkbudsjett etter CCSDS { "401" } / DSN 810-005-linkligningen: frirommstap, C/N₀, Eb/N₀, margin og lukking for en sender-EIRP, mottaker-G/T, avstand, datarate og bånd (s|x|ka) mot en påkrevd Eb/N₀. En deterministisk ingeniørberegning fra de oppgitte inngangsverdiene (ikke et kalibrert terminaldatablad).

seg-6697c741d09c = Én kjøring av <c1/> oppsummeres slik: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, margin { "92.1" } dB (lukker)

seg-2305502051b6 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Eksempelet <c1/> setter blant annet:

seg-ebb923e1a3b5 = Resultatetikett (motorens egen): Énveis linkbudsjett etter CCSDS { "401" } / DSN 810-005-linkligningen (EIRP − FSPL − L_other + G/T − k); en deterministisk ingeniørberegning fra de oppgitte inngangsverdiene, IKKE et kalibrert terminaldatablad

seg-bd375631bc7e = Diagrammet motoren skriver for scenarios/link-budget.toml, type link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Frirommstap, C/N₀, Eb/N₀, margin og lukking etter CCSDS { "401" } / DSN 810-005-linkligningen for EIRP/G·T/avstand/rate/bånd mot en påkrevd Eb/N₀. Tester: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Frirommstap, C/N₀, Eb/N₀, margin og lukking etter CCSDS { "401" } / DSN 810-005-linkligningen for EIRP/G·T/avstand/rate/bånd mot en påkrevd Eb/N₀. Runn. Uavhengig referanse (ExternalDataset): Publisert designkontrolltabell for telekommunikasjon i dypt rom som fastlåste numeriske vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabell 1-1 (Galileo X-bånd); kshana setter sammen tabellens linjeposter igjen og gjengir dens publiserte ende-til-ende-verdier L_fs { "290.54" } dB og Pr/N0 { "54.6" } dB-Hz; frirommstapet er også kontrollert mot ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Linkbudsjettrapporten oppgir hver absolutte konstant som dens egen margin ble beregnet ut fra: bærebølgefrekvensen som frirommstapet brukte, EIRP, tallet o. Uavhengig referanse (InternalConsistency): Ingen ekstern uavhengig referanse: dette er en selvbeskrivelse over en ligning som allerede er validert mot en publisert designkontrolltabell (se raden for énveis linkbudsjett). Den registreres fordi fraværet av den var en målt feil: for å gjengi den utgitte d1_rate_gain_beamwidth.csv måtte én effektiv konstant løses baklengs til { "0.0034" } dB fra alle tretti rader, og motoren navngir nå både denne kombinasjonen og beviser, ved test

seg-c779823e860c = Valgfritt: mottakersystemets støytemperatur (K). Den er IKKE en inngangsverdi til linkligningen, som bare trenger forholdet G/T, men når den oppgis, kan rapporten også gi den mottakerantennegevinsten som kvalitetsmålet innebærer (G = G/T + { "10" }*log10(T_sys)). Utelates den, mangler oppdelingen av gevinst i rapporten i stedet for å bli antatt. tsys_k = { "300.0" } (kommentar i scenariofilen, linje { "21" } til { "25" })

seg-d717412c4f06 = Selvbeskrivelsen i linkbudsjettrapporten er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Forrige</s1>leo-signal

seg-59d4cb995cb9 = <s1>Neste</s1>lunar-attack-surface
