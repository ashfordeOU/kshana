# docs--kind-lunar-time-budget: translations (nb)

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-8f8871ac8a0f = Temaside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Temaside: <a1>integrations.md</a1>

seg-11f512367036 = Kilde: <c1/>

seg-f7cd4fcfc62d = <c1/> (scenariotype)

seg-cac3a0bcbfc6 = MODELLED ende-til-ende tidsfeilbudsjett for Coordinated Lunar Time (LTC): de sju LTC-feilleddene satt sammen som tidsfeilkurver x_i(τ) over et helt rutenett av midlingstider, rotsummert til x_Σ(τ), og KRYSSPUNKTET τ mellom klokke og referansesystem der det voksende klokkeleddet overtar for det konstante leddet for sanntidsrealiseringen av referansesystemet (under det er budsjettet begrenset av referansesystemet, over det av klokken) — det ærlige svaret på artefakten med én enkelt τ. τ-stigningstallene er lukkede og analytisk kontrollerbare (klokke τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulv τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og klokkeradene gjengir de publiserte klokkespesifikasjonene for ett døgn (crate::clock_specs); STØRRELSENE på gulvene for RF-/optisk link, realisering av referansesystemet, relativistisk rest og efemeride er modellerte budsjettallokeringer (dokumenterte standardverdier, kan overstyres av kalleren), ikke målinger. Bidraget er det reproduserbare kryssingspunktet τ, ikke et sertifisert tall per ledd; ikke sertifisert for operativ tidtaking.

seg-8a5c9e451d4e = Én kjøring av <c1/> oppsummeres slik: lunar-time-budget | klokke passive-h-maser | 7-leddet x_Σ(τ) over { "57" } τ-punkter ({ "1" }–{ "1e7" } s) | kryssing τ { "8.689e4" } s (x { "1.001e-9" } s) | gulv for referansesystem { "1.001e-9" } s | klokke x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Eksempelet <c1/> setter blant annet:

seg-eebd3e40d0b9 = Resultatetikett (motorens egen): MODELLED ende-til-ende LTC-tidsfeilbudsjett. τ-stigningstallene er lukkede og analytisk kontrollerbare (klokke τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulv τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og klokkeradene gjengir de publiserte klokkespesifikasjonene for ett døgn; STØRRELSENE på gulvene for RF-/optisk link, realisering av referansesystemet, relativistisk rest og efemeride

seg-56fe184f2a12 = Diagrammet motoren skriver for scenarios/lunar-time-budget.toml, type lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Én kjøring av lunar-time-budget gir ut en rad for kryssing mellom klokke og referansesystem per klokkeklasse mot ett enkelt delt referansesystemledd, så klokken er den eneste variabelen i sammenligningen; hver rad bærer kryssingen nådd på to måter -- halvert fra den generelle

seg-fd52e493b6c2 = <b>MODELLED</b> Den valgfrie blokken [time_lab] i scenarioet lunar-time-budget modellerer en referansestasjonsklokke på månen (som standard klassen miniRAFS, eller en hvilken som helst navngitt klasse, eller et enhetskort tilpasset oppgitte stabilitetspunkter) styrt mot Coordinated Lunar Time og Tester: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Én kjøring av lunar-time-budget gir ut en rad for kryssing mellom klokke og referansesystem per klokkeklasse mot ett enkelt delt referansesystemledd, så klokken er den eneste variabelen i sammenligningen. Uavhengig referanse (InternalConsistency): To forskjellige beregninger i samme kodebase av samme størrelse, ikke én gjentatt: halvering på IEEE-1139-potenslovkurven vet ingenting om støytype, mens den lukkede formen inverterer den dominerende typen algebraisk, så en feilklassifisert støytype eller en dårlig brakett viser seg som en ikke ubetydelig relativ forskjell. De fire verdiene gjengir også artikkelens publiserte tabell til halvparten av dens siste trykte siffer -- men den tabellen var dens egen

seg-4c0d7da4f7f6 = <b>MODELLED</b> Scenarioet lunar-time-budget publiserer sine tabellverdierte utdata som en langformtabell (rutenettindeks, midlingstid, ledd) ved siden av rapporten, så de sju per. Uavhengig referanse (InternalConsistency): Kun selvkonsistens: den publiserte totalen kontrolleres mot kvadratroten av kvadratsummen av leddene i samme fil, og den utgitte kurven gjengir den utgitte p3_time_budget_curve.csv over alle { "57" } punkter. Begge kontrollene deler denne motorens egne leddefinisjoner, så ingen av dem er uavhengig. Klokkeleddet hviler på publiserte klokkespesifikasjoner, men STØRRELSENE på gulvene for link, referansesystem, relativistikk og efemeride er dokumentert

seg-8abdeb1a36e1 = MODELLED ende-til-ende LTC-tidsfeilbudsjett. τ-stigningstallene er lukkede og analytisk kontrollerbare (klokke τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulv τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og klokkeradene gjengir de publiserte klokkespesifikasjonene for ett døgn; STØRRELSENE på gulvene for RF-/optisk link, realisering av referansesystemet, relativistisk rest og efemeride er modellerte budsjettallokeringer (dokumenterte standardverdier, kan overstyres av kalleren), ikke målinger. Bidraget (resultat <c1/>)

seg-66a794432751 = MODELLED ende-til-ende tidsfeilbudsjett for Coordinated Lunar Time (LTC): de sju LTC-feilleddene satt sammen som tidsfeilkurver x_i(τ) over et helt rutenett av midlingstider, rotsummert til x_Σ(τ), og KRYSSPUNKTET τ mellom klokke og referansesystem der det voksende klokkeleddet overtar for det konstante leddet for sanntidsrealiseringen av referansesystemet (under det er budsjettet begrenset av referansesystemet, over det av klokken) — det ærlige svaret på artefakten med én enkelt τ (typekatalog (<c1/>))

seg-ca1763d4a416 = Ærlighet: MODELLED. Tau-stigningstallene er lukkede og analytisk kontrollerbare (klokke tau^{ "{" }+1/2{ "}" } eller tau^{ "{" }+{ "1" }{ "}" }, gulv tau^{ "0" }, måling tau^{ "{" }-1/2{ "}" }), og klokkeradene gjengir de publiserte klokkespesifikasjonene for ett døgn; men STØRRELSENE på gulvene for RF-/optisk link, realisering av referansesystemet, relativistisk rest og efemeride er modellerte budsjettallokeringer (dokumenterte standardverdier, kan overstyres av kalleren), ikke målinger. Bidraget er (kommentar i scenariofilen, linje { "13" } til { "18" })

seg-8f884949bdf1 = Tabellen over kryssing av klokke og referansesystem per klokkeklasse på månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Reproduserbarhet av tidsfeilbudsjettet på månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Forrige</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Neste</s1>lunar-time-offset
