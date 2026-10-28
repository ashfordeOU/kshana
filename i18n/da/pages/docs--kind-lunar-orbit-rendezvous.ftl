# docs--kind-lunar-orbit-rendezvous: translations (da)

seg-34bdcfd66ded = I den repository-gren, disse dokumenter kommer fra; endnu ikke på GitHub

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-6a26b9ab59fe = Emneside: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultatetiket (motorens): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Den propagator, månetyperne deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredjelegemer, relativitet, DE440-månorientering), sammenlignet med de offentl. Uafhængig reference (ExternalDataset): JPL Horizons-efemerider for LRO og CAPSTONE mod tærskler præregistreret i xval/mission-thread-lunar/PREREGISTRATION.md (Ændringerne { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskel og { "2.4" } m RMS radialt mod { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskel i slutposition på { "136.8" } km mod { "25" } km og en forskel i periapsis på { "28.4" } km mod { "10" } km, årsagerne ikke isoleret. Rækken er modelleret, fordi CAPSTONE-tærsklen ikke nås

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e482c9896140 = Propageringen med månekraftmodellen mod offentlige rekonstruerede baner for månesatellitter og cislunare baner er MODELLED, ikke valideret: en delpåstand er kontrolleret eksternt, men hele funktionen sammensætter modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Emneside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Kilde: <c1/>

seg-8beb22a0eb0b = <c1/> (scenarietype)

seg-2deefd8c547b = MODELLED relativ navigation til en docking i stil med Orion og landingsfartøj i en lav månebane eller en elliptisk polar bane (Artemis-klassen). Et jagerfartøj og et mål flyver i samme bane under cratens månekraftmodel; et fælles batch-Gauss-Newton-estimat med 21 parametre over buen (to køretøjstilstande og vedvarende positionsbiaser i signal i rummet) fusionerer en absolut positionsbestemmelse pr. køretøj fra et ILLUSTRATIVE relæsæt i LCNS-klassen (relæer bag Månen udeladt, fire kræves, fællesmodefejlen i signal i rummet ophæves mellem køretøjerne) og en krydslinkafstand, med afstandsmålingens præcision fra kodesporingsgrænsen på LunaNet AFS-piloten. Rapporterer den formelle og Monte Carlo-baserede relative positions- og hastighedsfejl i målets LVLH-akser, tilgængeligheden af positionsbestemmelser, den gennemsnitlige normaliserede estimeringsfejl i anden mod dens forventede værdi og ethvert forsøg, hvis iteration ikke konvergerede, driften ved at ignorere tyngdeharmonikkerne og den fulde 6x6-kovarians, der gives videre. En lukket Hill/Clohessy-Wiltshire-kontrol gælder for det cirkulære tilfælde. MODELLED: illustrativt relæsæt, fejlbudget og priorer; referencen og estimatoren deler én kraftmodel, så NEES kontrollerer selvkonsistens og ikke modelfejl. Ikke støttet af nogen rumfartsorganisation; vejledende software, ikke certificeret navigationsudstyr.

seg-a6d29fc5f19b = Én kørsel af <c1/> opsummeres som: lunar-orbit-rendezvous | llo 100x100 km | afst. { "2000" } m | positionsbestemmelser { "74" }% | rel. pos. 1-sigma R/A/C 0.03/0.06/0.04 m | gennemsnitlig NEES { "6.51" } ({ "6" } forventet) | konvergeret ved { "2000" } s (MODELLED)

seg-b7c86affeac1 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Eksemplet <c1/> sætter blandt andet:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Vejledende software, ikke certificeret navigat

seg-4466fb6f4043 = batch-Gauss-Newton over buen

seg-d97b2505ac72 = Diagrammet, motoren skriver for scenarios/lunar-orbit-rendezvous.toml, type lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Typen og fasen <c1/>: et fælles batch-Gauss-Newton-estimat for to køretøjer over buen (enogtyve parametre: begge tilstande og vedvarende positionsbiaser i signal i rummet, fælles og uafhængige), opbygget over en fjerdedel, en h Tests: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-b2f273ea732d = MODELLED relativ navigation til en docking i stil med Orion og landingsfartøj i en lav månebane eller en elliptisk polar bane (Artemis-klassen). (typekatalog (<c1/>))

seg-9d4f99557cc5 = MODELLED: illustrativt relæsæt, fejlbudget og priorer; referencen og estimatoren deler én kraftmodel, så NEES kontrollerer selvkonsistens og ikke modelfejl. (typekatalog (<c1/>))

seg-158e44d47c0b = ÆRLIGHED: MODELLED. Relæsættet, fejlen i signal i rummet, fællesmodeandelen og priorerne er ILLUSTRATIVE input, ikke målinger; referencen og estimatoren deler kraftmodellen (et indbygget centralled, J2 og C22). Den præregistrerede konsistenskontrol B1 (gennemsnitlig NEES i [{ "5.2" }, { "6.8" }]) er nået i alle fire konfigurationer på batch-designet: se xval/mission-thread-lunar/RESULTS.md. Ingen overensstemmelse med nogen virkelig (kommentar i scenariefilen, linje { "10" } til { "14" })

seg-2a88a9650804 = Relativ navigation til docking i en månebane (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Forrige</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Næste</s1>lunar-station-coverage

seg-826fd7fd44b9 = <b>MODELLED</b> Typen og fasen <c1/>: et fælles batch-Gauss-Newton-estimat for to køretøjer over buen (enogtyve parametre: begge tilstande og vedvarende sig. Uafhængig reference (InternalConsistency): Selvkonsistens under en præregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultater og estimatorens historik i RESULTS.md): den gennemsnitlige NEES for den relative tilstand er { "5.85" } til { "5.93" } mod båndet { "5.2" } til { "6.8" } i fire konfigurationer, MET på det fjerde estimatordesign, efter at tre sekventielle filterdesign missede; referencen og estimatoren deler én kraftmodel, så dette siger intet om modelfejl. Den propagator, den deler, sammenlignes med LRO og CAPSTONE i en række nedenfor
