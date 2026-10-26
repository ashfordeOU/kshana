# docs--kind-launch-window: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-b054c73f22e5 = ingen verdi

seg-8e62cc4af6ea = Temaside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Kilde: <c1/>

seg-e0990c5f14da = <c1/> (scenariotype)

seg-7a4e6215a488 = Todelegeme-geometri for oppskyting og stigning: oppskytingsazimut (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, den østvendte bonusen fra jordrotasjonen, dogleg-Δv for planbytte når målinklinasjonen er under stedets breddegrad, og antall daglige oppskytingsmuligheter. MODELLED geometri for sfærisk jord (ingen korreksjon for hastighetstrekant med roterende jord, ingen modell for stignings-/dragtap).

seg-e24b0ae723c7 = Én kjøring av <c1/> oppsummeres slik: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Eksemplet <c1/> setter blant annet:

seg-58d26f083b8f = Resultatetikett (motorens): MODELLED — todelegeme-oppskytingsgeometri for sfærisk jord; azimut er det geometriske forholdet sin(Az)=cos(i)/cos(lat) (ingen korreksjon for hastighetstrekant med roterende jord, ingen modell for stignings-/dragtap)

seg-9696283a95ae = Diagrammet motoren skriver for scenarios/launch-window.toml, typen launch-window

seg-38175030f689 = <b>MODELLED</b> Todelegeme-oppskytingsazimut (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, østvendt bonus fra jordrotasjonen, dogleg-Δv for planbytte og daglige muligheter, og, gitt en epoke og IERS finals2000A-rader, stedet

seg-53bc589c7ed6 = <b>MODELLED</b> Todelegeme-oppskytingsazimut (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, østvendt bonus fra jordrotasjonen, dogleg-Δv for planbytte a. Uavhengig referanse (InternalConsistency): Oppskytingsgeometri med sfærisk trigonometri i lukket form mot publiserte ankere fra regneeksempler (Vallado, Fundamentals of Astrodynamics 4. utg., algoritme { "37" } oppskytingsazimut + kap. 6 planbytte; tests/launch_window_ascent_geometry_reference.rs). Disse gjenbruker den samme lukkede formen som kshana implementerer (en paritets-/transkripsjonskontroll mot publiserte verdier, InternalConsistency); MODELLED todelegeme, ingen hastighetstrekant for roterende jord / stigning / drag

seg-12396619d3e5 = MODELLED — todelegeme-oppskytingsgeometri for sfærisk jord; azimut er det geometriske forholdet sin(Az)=cos(i)/cos(lat) (ingen korreksjon for hastighetstrekant med roterende jord, ingen modell for stignings-/dragtap) (resultat <c1/>)

seg-715f1856bd37 = MODELLED geometri for sfærisk jord (ingen korreksjon for hastighetstrekant med roterende jord, ingen modell for stignings-/dragtap). (typekatalog (<c1/>))

seg-4e9a215e3918 = ÆRLIG AVGRENSNING: MODELLED. Kun geometrisk azimut -- ingen korreksjon for hastighetstrekant med roterende jord (bonusen rapporteres separat for å legges inn), ingen stigningsbane / dragtap / styringsmodell. Geometri før fase A. Kjør: kshana scenarios/launch-window.toml (kommentar i scenariofilen, linjene { "8" } til { "11" })

seg-12332d181de4 = Oppskytingsvindu og stigningsgeometri (oppdragsanalyse) er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Forrige</s1>jamming

seg-78411b85f301 = <s1>Neste</s1>leo-navmsg
