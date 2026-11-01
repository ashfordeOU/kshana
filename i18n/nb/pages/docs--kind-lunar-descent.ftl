# docs--kind-lunar-descent: translations (nb)

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-6a26b9ab59fe = Temaside: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Resultatetikett (motorens egen): MODELLED

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Kilde: <c1/>

seg-d4df5aa9b7b0 = <c1/> (scenariotype)

seg-2cd0d5385530 = MODELLED budsjett for landingsspredning ved et drevet nedstigningsforløp til et sted nær sørpolen (Artemis-class). For hver horisontale akse drives en inertiell feilmodell med fem tilstander (posisjon, hastighet, akselerometerbias, holdningstilt, gyrobias) av nedstigningens spesifikke kraft; et sekvensielt filter tar posisjonsbestemmelser fra de aktiverte hjelpemidlene: en AFS-posisjonsbestemmelse fra de synlige reléene i en ILLUSTRATIVE konstellasjon av LCNS-klasse (frittstående, eller differensiell med korreksjonslinkens restfeil fra lunar-differential-pnt, med klokken hjulpet når bare tre reléer er synlige) og en terrengrelativ posisjonsbestemmelse (crate-ens TERCOM/SITAN-matcher på et syntetisk relieff, eller Cramer-Rao-grensen for matching av et høydevindu i den virkelige LOLA-DEM-en for sørpolområdet). Månetid kommer inn gjennom fartøyets klokke ved posisjonsbestemmelsene (LTC-TT-forskjellen fra lunar-time-offset, eller usikkerheten i det publiserte båndet) og som en tidsmerkefeil langs banen. Rapporterer 3-sigma-landingsellipsen, R95, de lukkede inertielle kildene, hvert hjelpemiddels bidrag, ablasjonen av hver kombinasjon av hjelpemidler, en Monte Carlo-kalibrering av ellipsen og kovariansen som føres videre. MODELLED: illustrativ IMU-klasse, relésett, nedstigningsprofil og styringsledd; terrengnavigasjonen bruker et syntetisk relieff på en jordlig metermålestokk; AFS-tilgjengeligheten er én epoke på en flat maske. Ikke godkjent av noe romfartsbyrå; veiledende programvare, ikke sertifisert navigasjonsutstyr.

seg-c6c1a8f184ed = Én kjøring av <c1/> oppsummeres slik: lunar-descent | -89.50 deg | kun inertiell 517/517 m (Ø/N) | med hjelpemidler 7.6/4.8 m | spredning R95 { "51" } m | 3-sigma-ellipse { "64" } x { "62" } m | { "99.1" }% innenfor (forventet { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Eksempelet <c1/> setter blant annet:

seg-8073ece4c900 = Diagrammet motoren skriver for scenarios/lunar-descent.toml, typen lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Typen og fasen <c1/>: en inertiell feilmodell med fem tilstander per akse (posisjon, hastighet, akselerometerbias, tilt, gyrobias) over et drevet nedstigningsforløp, hjulpet av AFS-posisjonsbestemmelser (frittstående eller differensielle, med den klokkehjulpne tre-rel

seg-bfe4c0a04288 = <b>MODELLED</b> Typen og fasen <c1/>: en inertiell feilmodell med fem tilstander per akse (posisjon, hastighet, akselerometerbias, tilt, gyrobias) over et drevet nedstigningsforløp,. Uavhengig referanse (InternalConsistency): Den lukkede inertielle driften, de gjenbrukte typenes egne resultater og kalibreringen av 3-sigma-ellipsen (andelen innenfor stemmer med forventningen) i testene. Ingen faktisk eller testet landing er sammenlignet

seg-ed286f215c96 = MODELLED budsjett for landingsspredning ved et drevet nedstigningsforløp til et sted nær sørpolen (Artemis-class). (typekatalog (<c1/>))

seg-c1bd92ba429b = MODELLED: illustrativ IMU-klasse, relésett, nedstigningsprofil og styringsledd; terrengnavigasjonen bruker et syntetisk relieff på en jordlig metermålestokk; AFS-tilgjengeligheten er én epoke på en flat maske. (typekatalog (<c1/>))

seg-85714bc3cf2a = ÆRLIGHET: MODELLED. IMU-klassen, nedstigningsprofilen, relésettet, signal-i-rommet-feilen og styringsleddet er ILLUSTRATIVE inndata, ikke målinger. Terrengnavigasjonsmodusen bruker det selvstendige syntetiske relieffet og en jordlig metermålestokk, så terrengleddet her er matcherens oppførsel på en stand-in, ikke en påstand om relieffet nær sørpolen: varianten lola-crlb (lunar-descent-lola.toml) bruker det virkelige (kommentar i scenariofilen, linje { "14" } til { "20" })

seg-3eb1b3b03600 = Budsjett for landingsspredning ved et lunart polarsted (<c1/>) er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Forrige</s1>lunar-beacon

seg-ca9b68783354 = <s1>Neste</s1>lunar-differential-pnt
