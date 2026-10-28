# docs--kind-mission-thread: translations (da)

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-be831b52a339 = og { "4" } flere i matricen.

seg-936e96edf423 = <b>MODELLED</b> Typen <c1/>: et dokument af faser, hver en af otte registrerede typer, kørt i rækkefølge, hvor 6x6-kovariansen, uret og referencesystemet gives videre efter en angiven regel (<c2/>; <c3/>, hvid accelerationsstøj over et angivet hul Tests: <a1>field_units_global.rs</a1>.

seg-795e0409fa5a = <b>MODELLED</b> Fasen <c1/>: middeltilstanden fra motorens Cowell-propagator (Jorden som punktmasse og J2, Solen og Månen som tredjelegemer, Månen fra trådens DE440-kerne, hvor den dækker segmentet, og Solen fra den analytiske serie

seg-6a26b9ab59fe = Emneside: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultatetiket (motorens): MODELLED

seg-e66e2ca31e54 = Emneside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-6ba426630d7e = Kilde: <c1/>

seg-e2ba596c17c6 = <c1/> (scenarietype)

seg-4816ff3c82ef = Scenarietype i motoren v{ $version }, familie <a1>Missionstråde</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-1ec485468daa = MODELLED fejlbudget for navigation og tidssynkronisering for en angivet kæde af missionsfaser, fra opsendelse til indflyvning: opsendelse og opstigning, rendezvous og docking i lav jordbane (kan gentages), trans-lunar injektion og cislunart krydstogt, rendezvous i månebane, nedstigning, ophold på overfladen, opstigning samt returflyvning og indflyvning, hver fase en af otte registrerede typer med sine egne sensorer og sit eget filter. 6x6-kovariansen, uret og referencesystemet gives videre fra fase til fase efter en angiven regel (carry, inflate eller reacquire); konverteringer af referencesystem og tidsskala (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) er deres egne budgetrækker, med Månens tilstand fra et valgfrit udsnit af DE440-kernen og den analytiske serie som den angivne reserve. Et valgfrit overlay af jordnetværk sætter hver fases sporingsandel. Rapporterer budgettet pr. fase (1-sigma ved indgang, spids og udgang, hvert bidrag med sin enhed), marginen mod et angivet krav, det svageste led, hændelserne og en tidslinjefigur. MODELLED: hvert tal er et angivet input; kæden følger én stak, og intet køretøj modelleres. Kun offentlige kilder; ikke tilknyttet eller støttet af nogen rumfartsorganisation; vejledende software, ikke certificeret navigationsudstyr.

seg-d6eb3dbb87c7 = Én kørsel af <c1/> opsummeres som: mission-thread | { "11" } faser | missionstråd i Artemis-klassen (ILLUSTRATIVE) | svageste led nedstigning | MODELLED

seg-9bb19202a104 = Obligatoriske felter: <c1/>, <c2/>, <c3/>

seg-e1faea3151d6 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-094b47cf8ae2 = Eksemplet <c1/> sætter blandt andet:

seg-e5d2d8da2ec0 = gcrf

seg-2468a5014f25 = utc

seg-e92b7836bae3 = 2028-01-01T00:{ "00" }:00Z

seg-ffe559d3ff23 = cruise

seg-3be4934f4f4e = mindste margin mod et angivet krav

seg-f32a7f31e191 = inertiel drift, ingen støtte, øst

seg-9fde3fc1cb5b = descent

seg-a07521d13bb4 = Diagrammet, motoren skriver for scenarios/mission-thread-artemis-class.toml, type mission-thread

seg-423ce11b54cd = <b>MODELLED</b> Fasen <c1/>: en position- og hastighedskovarians med konstant hastighed og hvid accelerationsstøj (dødregningsklassen), en GNSS-positionsbestemmelse med angivet nøjagtighed anvendt efter erhvervelsestiden og uden for angivne fadings, et ur med bias og

seg-f393e01ac642 = <b>MODELLED</b> Fasen <c1/>: den relative tilstand i målets LVLH-akser med den lukkede Clohessy-Wiltshire-overgang, en 6x6 Kalman-kovarians med hvid accelerationsstøj og positionsopdateringer, hvis varians er sensorens ved den aktu

seg-c9ff01a17f3f = <b>MODELLED</b> Typen <c1/>: et dokument af faser, hver en af otte registrerede typer, kørt i rækkefølge, hvor 6x6-kovariansen, uret og referencesystemet gives videre efter en angiven regel. Uafhængig reference (InternalConsistency): Håndberegninger i testene (den retlinede vækst i kovariansen, den gennemsnitlige sideriske rotation, den sekulære månetid) og, kun for Månens tilstand, de indlagte udsnit af DE440-kernen mod fastlåste JPL Horizons-værdier (værst { "2.6" } m og { "7e-6" } m/s). Ingen missionsdata sammenlignes med kæden; dens faser er rækker for sig. Dokumentet er en angivet kæde med ILLUSTRATIVE input, kun offentlige kilder og ingen støtte fra nogen rumfartsor

seg-529c9f8e8363 = <b>MODELLED</b> Fasen <c1/>: en position- og hastighedskovarians med konstant hastighed og hvid accelerationsstøj (dødregningsklassen), en GNSS-positionsbestemmelse med angivet n. Uafhængig reference (InternalConsistency): Riccati-ligevægtstilstanden og håndberegningen af prædiktionen i testene. Intet her modellerer en løfteraket eller en modtager; hvert tal er et angivet input

seg-01ef16f03f02 = <b>MODELLED</b> Fasen <c1/>: den relative tilstand i målets LVLH-akser med den lukkede Clohessy-Wiltshire-overgang, en 6x6 Kalman-kovarians med hvid . Uafhængig reference (InternalConsistency): En énaksel-håndberegning af prædiktion og opdatering i testen; Clohessy-Wiltshire-overgangen er den, som cw_dynamics kontrollerer mod en uafhængig numerisk integration. Sensorerne er ILLUSTRATIVE, og intet virkeligt rendezvous sammenlignes

seg-1e77eae03d2c = <b>MODELLED</b> Fasen <c1/>: middeltilstanden fra motorens Cowell-propagator (Jorden som punktmasse og J2, Solen og Månen som tredjelegemer, Månen fra tråden. Uafhængig reference (InternalConsistency): Liouvilles sætning (determinanten af tilstandsovergangsmatricen for den konservative del er en) og en finere differens i testene; middeltilstanden sammenlignes med en offentlig bane i rækken nedenfor, som den ikke rammer. Brændingsfejlen, opdateringerne og kovariansen sammenlignes ikke med noget

seg-d9a1ea509a3c = MODELLED fejlbudget for navigation og tidssynkronisering for en angivet kæde af missionsfaser, fra opsendelse til indflyvning: opsendelse og opstigning, rendezvous og docking i lav jordbane (kan gentages), trans-lunar injektion og cislunart krydstogt, rendezvous i månebane, nedstigning, ophold på overfladen, opstigning samt returflyvning og indflyvning, hver fase en af otte registrerede typer med sine egne sensorer og sit eget filter. (typekatalog (<c1/>))

seg-80221e9351e4 = MODELLED: hvert tal er et angivet input; kæden følger én stak, og intet køretøj modelleres. (typekatalog (<c1/>))

seg-637296d00802 = ÆRLIGHED. Hvert tal her er ILLUSTRATIVE: et rundt tal valgt for at få kæden til at køre, ikke ydeevnen for noget køretøj, nogen sensor, station eller noget netværk. Kæden følger én stak som en angivet forenkling; køretøjsskift, besætningsoverførsler og månebanestationen modelleres ikke, månebanerne er de cirkulære og polare på { "100" } km, som månetyperne flyver (ikke den næsten retlinede halobane), og TLI-brændingen er (kommentar i scenariefilen, linje { "11" } til { "17" })

seg-f6574a80a60a = Fejlbudget for navigation og tidssynkronisering for en kæde af missionsfaser fra opsendelse til indflyvning (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-9faba276f210 = Opsendelse og opstigning til en parkeringsbane med GNSS-erhvervelse og fading (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-20bbe2135d61 = Relativ navigation til dockingomhyllingen i lav jordbane over sensorstrækninger (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-c60fd7868746 = Trans-lunar injektion og cislunart krydstogt: propageret middeltilstand og kovarians med sporingsopdateringer (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-c10f77a86f4d = Familieside: <a1>Missionstråde</a1>

seg-f3279128de3b = <s1>Forrige</s1>mars-pnt

seg-2854e6a75833 = <s1>Næste</s1>moonlight-service-volume
