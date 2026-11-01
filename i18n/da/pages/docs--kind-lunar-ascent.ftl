# docs--kind-lunar-ascent: translations (da)

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-6a26b9ab59fe = Emneside: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Kilde: <c1/>

seg-b8ef47331221 = <c1/> (scenarietype)

seg-ae3053a1f6c8 = MODELLED drevet opstigning fra et sted på overfladen ved sydpolen til rendezvous-banen og den position-hastighedskovarians, den fører tilbage til banen (Artemis-klassen). Den inertielle fejlmodel med fem tilstande pr. akse fra lunar-descent (position, hastighed, accelerometerbias, attitudehældning, gyrobias, drevet af den specifikke kraft) kører på alle tre stedsakser fra den overfladetilstand, fasen går ind med; en AFS-positionsbestemmelse fra de synlige relæer i en ILLUSTRATIVE konstellation i LCNS-klassen (selvstændig eller differentiel med korrektionslinkets residual fra lunar-differential-pnt, med uret støttet, når kun tre relæer er synlige) tages ved et angivet interval, hvor månetid indgår gennem køretøjets ur og en tidsmærkefejl langs banen. Rapporterer de lukkede inertielle kilder, støttens bidrag, ablationen, navigationens 1-sigma over opstigningen, spredningen ved motorafbrydelse ved siden af navigationsviden og den fulde 6x6 MCI-kovarians ved indsætning med position-hastighedskorrelationen bevaret. MODELLED: illustrativ IMU-klasse, specifik kraft, relæsæt og spredning ved afbrydelse; fejl holdt i affyringsstedets akser; den nominelle sluttilstand er en stand-in. Ikke støttet af nogen rumfartsorganisation; vejledende software, ikke certificeret navigationsudstyr.

seg-fc4d2ba3f99e = Én kørsel af <c1/> opsummeres som: lunar-ascent | -89.50 deg | kun inertiel { "785" } m / { "3.49" } m/s | med AFS { "11.4" } m / { "0.071" } m/s | spredning ved indsætning { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Eksemplet <c1/> sætter blandt andet:

seg-ebc18c9bcbac = differentiel

seg-3843825d0733 = us

seg-2d84b341a41f = Resultatetiket (motorens): MODELLED

seg-463a919e84d5 = Diagrammet, motoren skriver for scenarios/lunar-ascent.toml, type lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Typen og fasen <c1/>: den inertielle fejlmodel med fem tilstande pr. akse kørt over en drevet opstigning med specifik kraft langs banen, støttet af AFS-positionsbestemmelser og månetid, som rapporterer den position- og hastighedskovarians ved indsætning, der føres

seg-4e0c4b02eac0 = <b>MODELLED</b> Typen og fasen <c1/>: den inertielle fejlmodel med fem tilstande pr. akse kørt over en drevet opstigning med specifik kraft langs banen, støttet af AFS-positionsbestemmelser. Uafhængig reference (InternalConsistency): Den lukkede inertielle drift og monotonikontroller i testene. Ingen fløjet opstigning sammenlignes

seg-8732ad9f7e07 = <b>MODELLED</b> Den propagator, månetyperne deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredjelegemer, relativitet, DE440-månorientering), sammenlignet med de offentl. Uafhængig reference (ExternalDataset): JPL Horizons-efemerider for LRO og CAPSTONE mod tærskler præregistreret i xval/mission-thread-lunar/PREREGISTRATION.md (Ændringerne { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskel og { "2.4" } m RMS radialt mod { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskel i slutposition på { "136.8" } km mod { "25" } km og en forskel i periapsis på { "28.4" } km mod { "10" } km, årsagerne ikke isoleret. Rækken er modelleret, fordi CAPSTONE-tærsklen ikke nås

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-745dfc03a929 = MODELLED drevet opstigning fra et sted på overfladen ved sydpolen til rendezvous-banen og den position-hastighedskovarians, den fører tilbage til banen (Artemis-klassen). (typekatalog (<c1/>))

seg-3fd0cca78937 = MODELLED: illustrativ IMU-klasse, specifik kraft, relæsæt og spredning ved afbrydelse; fejl holdt i affyringsstedets akser; den nominelle sluttilstand er en stand-in. (typekatalog (<c1/>))

seg-2cfb37d39847 = ÆRLIGHED: MODELLED. IMU-klassen, justeringen, den specifikke kraft og spredningen ved afbrydelse er ILLUSTRATIVE input, ikke målinger. Fejlene holdes i affyringsstedets øst-nord-op-akser uden banens krumning i nedrækkevidde, og den nominelle sluttilstand er en stand-in ved stedets lokale lodlinje: kun kovariansen er resultatet. Ingen overensstemmelse med noget virkeligt køretøj hævdes. Vejledende software, ikke c (kommentar i scenariefilen, linje { "11" } til { "15" })

seg-6faf49cac41a = Drevet opstigning fra et polart sted på Månen til en indsætningsbane (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Propageringen med månekraftmodellen mod offentlige rekonstruerede baner for månesatellitter og cislunare baner er MODELLED, ikke valideret: en delpåstand er kontrolleret eksternt, men hele funktionen sammensætter modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Emneside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Forrige</s1>link-budget

seg-59d4cb995cb9 = <s1>Næste</s1>lunar-attack-surface
