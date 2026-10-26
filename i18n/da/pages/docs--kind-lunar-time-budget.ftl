# docs--kind-lunar-time-budget: translations (da)

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-8f8871ac8a0f = Emneside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Emneside: <a1>integrations.md</a1>

seg-11f512367036 = Kilde: <c1/>

seg-f7cd4fcfc62d = <c1/> (scenarietype)

seg-cac3a0bcbfc6 = MODELLED tidsfejlbudget fra ende til ende for Coordinated Lunar Time (LTC): de syv LTC-fejlled sammensat som tidsfejlkurver x_i(τ) over et helt gitter af middeltider, summeret som kvadratrod til x_Σ(τ), og ur-mod-referencesystem-KRYDSNINGEN τ, hvor det voksende urled overhaler det konstante realtidsled for realisering af referencesystemet (under den er budgettet begrænset af referencesystemet, over den af uret) — det ærlige svar på artefakten med ét enkelt τ. Hældningerne i τ er i lukket form og kan kontrolleres analytisk (ur τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulve τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og urrækkerne gengiver de offentliggjorte specifikationer for ure over ét døgn (crate::clock_specs); STØRRELSERNE af gulvene for RF-/optisk link, realisering af referencesystemet, relativistisk rest og efemeride er modellerede budgetallokeringer (dokumenterede standardværdier, kan overstyres af kalderen), ikke målinger. Bidraget er den reproducerbare krydsning τ, ikke et certificeret tal pr. led; ikke certificeret til operationel tidshold.

seg-8a5c9e451d4e = Én kørsel af <c1/> opsummeres som: lunar-time-budget | clock passive-h-maser | 7-term x_Σ(τ) over { "57" } τ-points ({ "1" }–{ "1e7" } s) | crossover τ { "8.689e4" } s (x { "1.001e-9" } s) | frame floor { "1.001e-9" } s | clock x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Eksemplet <c1/> sætter blandt andet:

seg-eebd3e40d0b9 = Resultatmærkat (motorens egen): MODELLED tidsfejlbudget for LTC fra ende til ende. Hældningerne i τ er i lukket form og kan kontrolleres analytisk (ur τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulve τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og urrækkerne gengiver de offentliggjorte specifikationer for ure over ét døgn; gulvene for RF-/optisk link, realisering af referencesystemet, relativistisk rest og efemeride

seg-56fe184f2a12 = Diagrammet, som motoren skriver for scenarios/lunar-time-budget.toml, type lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Én kørsel af lunar-time-budget udsender en række med krydsning mellem ur og referencesystem pr. urklasse mod ét fælles led for referencesystemet, så uret er den eneste variabel i sammenligningen; hver række bærer krydsningen nået på to måder -- fundet ved bisektion fra den almene

seg-fd52e493b6c2 = <b>MODELLED</b> Den valgfrie blok [time_lab] i scenariet lunar-time-budget modellerer et lunart referencestationsur (standard er klassen miniRAFS, eller en vilkårlig navngivet klasse, eller et enhedskort tilpasset angivne stabilitetspunkter) styret til Coordinated Lunar Time og Tests: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Én kørsel af lunar-time-budget udsender en række med krydsning mellem ur og referencesystem pr. urklasse mod ét fælles led for referencesystemet, så uret er den eneste variabel i sammenligningen. Uafhængig reference (InternalConsistency): To forskellige beregninger i kodebasen af samme størrelse, ikke én, der gentages: bisektion på IEEE-1139-potensslovskurven kender intet til støjtypen, mens den lukkede form inverterer den dominerende type algebraisk, så en forkert klassificeret støjtype eller et dårligt interval viser sig som en ikke ubetydelig relativ forskel. De fire værdier gengiver også artiklens offentliggjorte tabel til halvdelen af dens sidste trykte ciffer -- men den tabel var dens

seg-4c0d7da4f7f6 = <b>MODELLED</b> Scenariet lunar-time-budget udgiver sine array-værdier som en tabel i langt format (gitterindeks, middeltid, led) ved siden af rapporten, så de syv pr. Uafhængig reference (InternalConsistency): Kun selvkonsistens: den udgivne sum kontrolleres mod kvadratroden af summen af kvadraterne af leddene i samme fil, og den udsendte kurve gengiver den udgivne p3_time_budget_curve.csv over alle { "57" } punkter. Begge kontroller deler denne motors egne definitioner af leddene, så ingen af dem er uafhængig. Urleddet hviler på offentliggjorte urspecifikationer, men STØRRELSERNE af gulvene for link, referencesystem, relativistik og efemeride er dokumenteret

seg-8abdeb1a36e1 = MODELLED tidsfejlbudget for LTC fra ende til ende. Hældningerne i τ er i lukket form og kan kontrolleres analytisk (ur τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, gulve τ^{ "0" }, måling τ^{ "{" }-1/2{ "}" }), og urrækkerne gengiver de offentliggjorte specifikationer for ure over ét døgn; STØRRELSERNE af gulvene for RF-/optisk link, realisering af referencesystemet, relativistisk rest og efemeride er modellerede budgetallokeringer (dokumenterede standardværdier, kan overstyres af kalderen), ikke målinger. Bidraget er (resultat <c1/>)

seg-66a794432751 = MODELLED tidsfejlbudget fra ende til ende for Coordinated Lunar Time (LTC): de syv LTC-fejlled sammensat som tidsfejlkurver x_i(τ) over et helt gitter af middeltider, summeret som kvadratrod til x_Σ(τ), og ur-mod-referencesystem-KRYDSNINGEN τ, hvor det voksende urled overhaler det konstante realtidsled for realisering af referencesystemet (under den er budgettet begrænset af referencesystemet, over den af uret) — det ærlige svar på artefakten med ét enkelt τ (kategori-katalog (<c1/>))

seg-ca1763d4a416 = Ærlighed: MODELLED. Hældningerne i tau er i lukket form og kan kontrolleres analytisk (ur tau^{ "{" }+1/2{ "}" } eller tau^{ "{" }+{ "1" }{ "}" }, gulve tau^{ "0" }, måling tau^{ "{" }-1/2{ "}" }), og urrækkerne gengiver de offentliggjorte specifikationer for ure over ét døgn; men STØRRELSERNE af gulvene for RF-/optisk link, realisering af referencesystemet, relativistisk rest og efemeride er modellerede budgetallokeringer (dokumenterede standardværdier, kan overstyres af kalderen), ikke målinger. Bidraget er (kommentar i scenariefilen, linje { "13" } til { "18" })

seg-8f884949bdf1 = Tabel over lunar krydsning af tid pr. urklasse er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Reproducerbarhed af det lunare tidsfejlbudget er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Forrige</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Næste</s1>lunar-time-offset
