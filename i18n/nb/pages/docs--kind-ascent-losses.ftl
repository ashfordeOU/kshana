# docs--kind-ascent-losses: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-5d7cf510f4e9 = Kilde: <c1/>

seg-23e7becab606 = <c1/> (scenariotype)

seg-34d041d6bd9f = Plan gravitasjonssving-oppskyting av et flertrinns fartøy over en ikke-roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" } (vertikal stigning, pitch-spark, skyv langs hastigheten), som integrerer tapene fra gravitasjon, luftmotstand, styring og mottrykk og kontrollerer ideell dv minus tap mot sluttbrenthastigheten; max-Q, maksimal akselerasjon og sluttbrenttilstand. MODELLED.

seg-cd6181de5e43 = Én kjøring av <c1/> oppsummeres som: ascent-losses: ideal dv { "11290" } m/s, losses { "2359" } m/s (gravity { "2276" }, drag { "15" }, steering { "0" }, back-pressure { "67" }); burnout { "509" } km at { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

seg-58f9e8d24a73 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-ec4396f2fa76 = Eksempelet <c1/> setter blant annet:

seg-a44edb1eb84d = kg

seg-37205a55d23c = m^{ "2" }

seg-98151954f217 = false

seg-68a37ebbc01e = Resultatetikett (motorens): MODELLED — planar gravity-turn ascent of a multi-stage vehicle over a non-rotating spherical Earth through US76, with gravity, drag, steering and back-pressure losses integrated and the ideal-dv-minus-losses identity checked; constant C_D, no rotation, no coast, no guidance beyond the pitch kick

seg-ccf2185b0b5e = Diagrammet motoren skriver for scenarios/ascent-losses.toml, typen ascent-losses

seg-3a3ee499961e = <b>MODELLED</b> Plan gravitasjonssving-oppskyting av et flertrinns fartøy over en ikke-roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" } (tetthet og trykk), med en pitch-spark, skyv redusert av dysens mottrykk, trinnenes brenntid slutt ved eksakt s

seg-cac91718c4e1 = <b>MODELLED</b> Plan gravitasjonssving-oppskyting av et flertrinns fartøy over en ikke-roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" } (tetthet og trykk), med en p. Uavhengig referanse (InternalConsistency): Intern konsistens: den eksakte identiteten sluttbrenthastighet = sum Isp g0 ln(m0/mf) minus de fire integrerte tapene (residual under { "1e-6" } m/s), Tsiolkovskijs likning for en vertikal brenning i vakuum der gravitasjonen er eneste tap, og US76-trykkene ved havnivå og tropopause. HVA SOM IKKE ER: ingen publisert fartøyers tap er sammenlignet; ingen jordrotasjon, glideflukt, regulering eller styring utover sparken; konstant C_D; ikke en bane

seg-906f001cd9ea = MODELLED — planar gravity-turn ascent of a multi-stage vehicle over a non-rotating spherical Earth through US76, with gravity, drag, steering and back-pressure losses integrated and the ideal-dv-minus-losses identity checked; constant C_D, no rotation, no coast, no guidance beyond the pitch kick (resultat <c1/>)

seg-f916c5a08595 = Tap ved gravitasjonssving-oppskyting for en ILLUSTRATIVE tostegs parafin/oksygen-bærerakett (intet reelt fartøy): vertikal stigning til { "1" } km, en pitch-spark på { "3" } deg i { "10" } s, deretter skyv langs hastigheten. Kjøringen integrerer tapene fra gravitasjon, luftmotstand, styring og mottrykk og kontrollerer at ideell dv minus tapene er lik sluttbrenthastigheten. MODELLED: plan, ikke-roterende jord, konstant C_D, ingen glideflukt, ingen styring utover sparken. (kommentar i scenariofilen, linje { "1" } til { "5" })

seg-4c237f051651 = Tap fra gravitasjon, luftmotstand, styring og mottrykk ved oppskyting er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8e62cc4af6ea = Temaside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-73148557c9a6 = <s1>Forrige</s1>araim-reference-check

seg-3af9699f27a7 = <s1>Neste</s1>attitude-budget
