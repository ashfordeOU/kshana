# docs--kind-lunar-ascent: translations (nb)

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-6a26b9ab59fe = Temaside: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Kilde: <c1/>

seg-b8ef47331221 = <c1/> (scenariotype)

seg-ae3053a1f6c8 = MODELLED drevet oppstigning fra et sted på overflaten nær sørpolen til rendezvous-banen, og posisjons-hastighetskovariansen den fører tilbake til bane (Artemis-klassen). Den inertielle feilmodellen med fem tilstander per akse fra lunar-descent (posisjon, hastighet, akselerometerbias, holdningshelling, gyrobias, drevet av den spesifikke kraften) kjøres på alle tre stedsaksene fra overflatetilstanden fasen går inn med; en AFS-posisjonsbestemmelse fra de synlige reléene i en ILLUSTRATIVE konstellasjon i LCNS-klassen (alene, eller differensiell med korreksjonslenkens residual fra lunar-differential-pnt, med klokken støttet når bare tre reléer er synlige) tas ved et oppgitt intervall, med månetid inn gjennom fartøyets klokke og en tidsmerkefeil langs banen. Rapporterer de lukkede inertielle kildene, hjelpemidlets bidrag, ablasjonen, navigasjonens 1-sigma-verdier over oppstigningen, spredningen ved motoravstengning ved siden av navigasjonskunnskapen, og den fulle 6x6 MCI-kovariansen ved innsetting med posisjons-hastighetskorrelasjonen beholdt. MODELLED: illustrativ IMU-klasse, spesifikk kraft, relésett og spredning ved avstengning; feil holdt i akser for oppskytingsstedet; den nominelle utgangstilstanden er en plassholder. Ikke støttet av noe byrå; veiledende programvare, ikke sertifisert navigasjonsutstyr.

seg-fc4d2ba3f99e = Én kjøring av <c1/> oppsummeres som: lunar-ascent | -89.50 deg | bare inertiell { "785" } m / { "3.49" } m/s | med AFS { "11.4" } m / { "0.071" } m/s | spredning ved innsetting { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Eksempelet <c1/> setter blant annet:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Resultatetikett (motorens egen): MODELLED

seg-463a919e84d5 = Diagrammet motoren skriver for scenarios/lunar-ascent.toml, typen lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Typen og fasen <c1/>: den inertielle feilmodellen med fem tilstander per akse kjørt over en drevet oppstigning med spesifikk kraft langs banen, støttet av AFS-posisjonsbestemmelser og månetid, som rapporterer posisjons- og hastighetskovariansen ved innsetting som føres til

seg-4e0c4b02eac0 = <b>MODELLED</b> Typen og fasen <c1/>: den inertielle feilmodellen med fem tilstander per akse kjørt over en drevet oppstigning med spesifikk kraft langs banen, støttet av AFS-posisjonsbestemmelser. Uavhengig referanse (InternalConsistency): Den lukkede formen for inertiell drift og monotonisitetskontroller i testene. Ingen fløyet oppstigning sammenlignes

seg-8732ad9f7e07 = <b>MODELLED</b> Propagatoren de lunare typene deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredje legemer, relativitet, DE440-månorientering) sammenlignet med de offentl. Uavhengig referanse (ExternalDataset): JPL Horizons-efemerider for romfartøy for LRO og CAPSTONE, mot terskler forhåndsregistrert i xval/mission-thread-lunar/PREREGISTRATION.md (endringene { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskjell og { "2.4" } m RMS radialt mot { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskjell i sluttposisjon på { "136.8" } km mot { "25" } km og en forskjell i periapsis på { "28.4" } km mot { "10" } km, årsakene er ikke isolert. Raden er Modellert fordi CAPSTON

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-745dfc03a929 = MODELLED drevet oppstigning fra et sted på overflaten nær sørpolen til rendezvous-banen, og posisjons-hastighetskovariansen den fører tilbake til bane (Artemis-klassen). (typekatalog (<c1/>))

seg-3fd0cca78937 = MODELLED: illustrativ IMU-klasse, spesifikk kraft, relésett og spredning ved avstengning; feil holdt i akser for oppskytingsstedet; den nominelle utgangstilstanden er en plassholder. (typekatalog (<c1/>))

seg-2cfb37d39847 = REDELIGHET: MODELLED. IMU-klassen, justeringen, den spesifikke kraften og spredningen ved avstengning er ILLUSTRATIVE inndata, ikke målinger. Feilene holdes i oppskytingsstedets øst-nord-opp-akser, uten banens krumning nedover rekkevidden, og den nominelle utgangstilstanden er en plassholder ved stedets lokale vertikal: bare kovariansen er resultatet. Ingen overensstemmelse med noe virkelig fartøy påstås. Veiledende programvare, ikke c (kommentar i scenariofilen, linje { "11" } til { "15" })

seg-6faf49cac41a = Drevet oppstigning fra et sted ved månens pol til en innsettingsbane (<c1/>) er MODELLED, ikke validert: kontrollert mot sin egen lukkede form / analytiske identitet — fanger opp transkripsjons- og koeffisientfeil, men er ikke en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Propageringen med månens kraftmodell mot offentlige rekonstruerte baner for månesatellitter og cislunare baner er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir Modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Forrige</s1>link-budget

seg-59d4cb995cb9 = <s1>Neste</s1>lunar-attack-surface
