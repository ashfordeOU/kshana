# docs--kind-terrain-slam: translations (nb)

seg-216efc4e6fba = Scenariotype i motoren v{ $version }, familie <a1>Alternativ PNT uten GPS</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-0df60ac6343f = <b>MODELLED</b> Matching mot gravitasjonskart, terrengreferert (TERCOM/SITAN), magnetisk anomali. Uavhengig referanse (InternalConsistency): IGRF-14-koeffisienter; CRLB for matchet filter fra grunnprinsipper. Feltet i referansetesten med virkelig gravitasjonsfelt er eksternt kontrollert (rad «Gravity-anomaly synthesis from a spherical-harmonic model»), men navigasjonsresultatet har ingen ekstern uavhengig referanse

seg-d776abd5691c = Alternativ / komplementær PNT er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uten GPS</a1>

seg-bb7c9c4d4b5d = Kilde: <c1/>

seg-562e59d703e3 = <c1/> (scenariotype)

seg-6bdc150ab25b = GPS-fri sekvensiell (rekursiv) terrengreferert navigasjon: et partikkelfilter kjører målemodellen for terrengsammenligning epoke for epoke (SITAN som et løpende filter), slik at en tidsvarierende INS-drift følges langs sporet, der den grupperte terrain-nav kun gjenvinner en enkelt konstant forskyvning.

seg-1e4350c2c5f0 = En kjøring av <c1/> oppsummeres slik: terrain-slam | { "60" } waypoints | free-inertial RMS { "2947" } m (final { "5082" } m) | terrain-matched RMS { "1241" } m (final { "69" } m, 2x cut) | mean ESS 2599/4000 | matching sigma { "17.0" } m

seg-939d877137f6 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-48e022b0945e = Eksemplet <c1/> setter blant annet:

seg-4aca87f022dc = Diagrammet motoren skriver for scenarios/terrain-slam.toml, type terrain-slam

seg-832919783819 = <s1>Forrige</s1>terrain-nav

seg-1693abd546fe = <s1>Neste</s1>time-transfer-budget
