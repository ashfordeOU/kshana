# docs--kind-terrain-nav: translations (nb)

seg-216efc4e6fba = Scenariotype i motoren v{ $version }, familie <a1>Alternativ PNT uten GPS</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-0df60ac6343f = <b>MODELLED</b> Matching mot gravitasjonskart, terrengreferert (TERCOM/SITAN), magnetisk anomali. Uavhengig referanse (InternalConsistency): IGRF-14-koeffisienter; CRLB for matchet filter fra grunnprinsipper. Feltet i referansetesten med virkelig gravitasjonsfelt er eksternt kontrollert (rad «Gravity-anomaly synthesis from a spherical-harmonic model»), men navigasjonsresultatet har ingen ekstern uavhengig referanse

seg-d776abd5691c = Alternativ / komplementær PNT er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uten GPS</a1>

seg-1d36a7dc3fd0 = Kilde: <c1/>

seg-7bfd6d049799 = <c1/> (scenariotype)

seg-0d7bf5a4f07e = GPS-fri terrengreferert navigasjon (TERCOM/SITAN): en radar- eller barometrisk høydemåler sammenligner profilen for terrenghøyde mot en DEM i SRTM-stil for å gjenvinne INS-driften.

seg-54690375328b = En kjøring av <c1/> oppsummeres slik: terrain-nav | free-inertial drift { "70659" } m | terrain-matched { "53" } m (1342x cut) | matching sigma { "17.0" } m

seg-db286a072e43 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-efc57f43bd6f = Valgfrie felt: <c1/>, <c2/>, <c3/>

seg-96e3607379e0 = Eksempelet <c1/> angir blant annet:

seg-c5e33c7122e2 = Diagrammet motoren skriver for scenarios/terrain-nav.toml, type terrain-nav

seg-0fcad0016c78 = <s1>Forrige</s1>telecom-timing

seg-fa50992f818f = <s1>Neste</s1>terrain-slam

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> Typen og fasen <c1/>: en inertiell feilmodell med fem tilstander per akse (posisjon, hastighet, akselerometerbias, tilt, gyrobias) over et drevet nedstigningsforløp, hjulpet av AFS-posisjonsbestemmelser (frittstående eller differensielle, med den klokkehjulpne tre-rel
