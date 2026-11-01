# docs--kind-combined-altpnt: translations (nb)

seg-a83b25413fd8 = Kilde: <c1/>

seg-92b24377c9be = <c1/> (scenariotype)

seg-216efc4e6fba = Scenariotype i motoren v{ $version }, familie <a1>Alternativ PNT uten GPS</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f496b7f4c63a = Kombinert navigator uten GPS med gravitasjon + magnetisme + terreng: tre skalare feltkanaler fusjonert per veipunkt for en skarpere posisjonsbestemmelse (lavere CRLB) av drift enn noe enkeltfelt.

seg-670730bd221e = Én kjøring av <c1/> oppsummeres som: combined-altpnt | free-inertial drift { "70659" } m | gravity { "464" } m magnetic { "782" } m terrain { "368" } m | FUSED { "365" } m

seg-cf6981466329 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-078f09d100fa = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-557db767b9c3 = Eksempelet <c1/> setter blant annet:

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = Diagrammet motoren skriver for scenarios/combined-altpnt.toml, typen combined-altpnt

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-0df60ac6343f = <b>MODELLED</b> Matching mot gravitasjonskart, terrengreferert (TERCOM/SITAN), magnetisk anomali. Uavhengig referanse (InternalConsistency): IGRF-14-koeffisienter; CRLB for matchet filter fra grunnprinsipper. Feltet i referansetesten med virkelig gravitasjonsfelt er eksternt kontrollert (rad «Gravity-anomaly synthesis from a spherical-harmonic model»), men navigasjonsresultatet har ingen ekstern uavhengig referanse

seg-d776abd5691c = Alternativ / komplementær PNT er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uten GPS</a1>

seg-49efcd2ced81 = <s1>Forrige</s1>clock

seg-f2ccea3bb03e = <s1>Neste</s1>conflict-resilience
