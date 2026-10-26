# docs--kind-aocs: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-5cd8b3d8c098 = Kilde: <c1/>

seg-7f2ade997df5 = <c1/> (scenariotype)

seg-7eff466eb018 = Holdningskontroll for romfartøy: en treghetspekende sving av en stiv hub med tre eller flere balanserte reaksjonshjul under MRP-tilbakekobling (L = -K sigma - P omega), minimumsnorm hjulmomenter begrenset til hver motors grense, RK4 med null-ordens holdning; eventuelt sluttet i en multiplikativ EKF fra en simulert gyro (vinkel- og hastighetsrandomvandring) og stjernesensor. Rapporterer innsvingningstid, endelig og maksimal pekefeil, maksimal hjulhastighet og maksimalt moment, den mettede andelen, drift i dreieimpuls og, med estimatoren, dens holdningsfeil og NEES. Sløyfen for sann tilstand er VALIDATED mot Basilisk { "2.9.1" }; estimatoren er MODELLED.

seg-a499721d08b1 = Én kjøring av <c1/> oppsummeres som: aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

seg-2ad4d3f07a6a = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Eksempelet <c1/> setter blant annet:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-b054c73f22e5 = ingen verdi

seg-6e22c97374b0 = Resultatetikett (motorens): VALIDATED kontrolllov og hjuldynamikk (mot Basilisk { "2.9.1" } på sløyfen for sann tilstand); denne kjøringens inndata er scenarioets egne — holdningskontroll med reaksjonshjul under MRP-tilbakekobling, treghetspeking, ingen sensorstøy, ingen friksjon

seg-08c624d5324d = Diagrammet motoren skriver for scenarios/aocs-slew.toml, typen aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-d69a588facf1 = <b>VALIDATED</b> Treghetspekende holdningskontroll av en stiv hub med tre eller flere balanserte reaksjonshjul: MRP-tilbakekoblingsloven L_r = -K sigma_BR - P omega_BR (Schaub og Junkins), minimumsnorm hjulmotormomenter G_s u = -L_r begrenset til hvert hjuls l Tester: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Den multiplikative EKF-en til Lefferts, Markley og Shuster: holdningsfeil i kroppsrammen og gyrobias som tilstander, propagering med gyrohastigheten minus biasestimatet og Farrenkopfs diskrete prosessstøy (vinkel- og hastighetsrandomvandring), stjernesensoroppdatering

seg-7e3e0dcc936f = <b>VALIDATED</b> Treghetspekende holdningskontroll av en stiv hub med tre eller flere balanserte reaksjonshjul: MRP-tilbakekoblingsloven L_r = -K sigma_BR - P omega_BR (Schaub og J. Uavhengig referanse (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulkjøringen som et eget verktøy, aldri lenket eller inkludert): romfartøyhub, reactionWheelStateEffector (BalancedWheels, momentgrense på), simpleNav, inertial3D, attTrackingError, mrpFeedback (uten integralledd) og rwMotorTorque ved dt = { "0.1" } s med dens RK4, mot Kshanas egen implementering på tre tilfeller (tre ortogonale hjul; en firehjuls pyramide; et mettende firehjulstilfelle),

seg-d7889856073b = <b>MODELLED</b> Den multiplikative EKF-en til Lefferts, Markley og Shuster: holdningsfeil i kroppsrammen og gyrobias som tilstander, propagering med gyrohastigheten minus biasestimatet og Farre. Uavhengig referanse (InternalConsistency): Intern konsistens: filterets normaliserte estimeringsfeil i kvadrat mot sannheten simulert fra de samme sensormodellene over Monte Carlo-seed, og konvergens av holdnings- og biasestimatene. HVA SOM IKKE ER: ingen ekstern estimator eller flydata er sammenlignet (Basilisk { "2.9.1" } har ingen MEKF-modul); sensormodellene er lærebokmodellene, uten skjevjustering, skaleringsfaktor eller effekter av stjernesensorens synsfelt.

seg-3b71575e0c23 = Sløyfen for sann tilstand er VALIDATED mot Basilisk { "2.9.1" }; estimatoren er MODELLED. (typekatalog (<c1/>))

seg-c7ff0ddbd040 = Multiplikativ EKF-holdningsestimering fra en gyro og en stjernesensor er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Temaside: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Forrige</s1>acm-link

seg-1fb6e680fd4a = <s1>Neste</s1>aperture-duty-cycle
