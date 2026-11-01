# docs--kind-entry-heating: translations (nb)

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Temaside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Kilde: <c1/>

seg-3a3f732cc2dd = <c1/> (scenariotype)

seg-b843e2e0a4ee = 3-DoF atmosfærisk innflyging med punktmasse over en roterende, sfærisk jord eller Mars (ballistisk eller løftende ved konstant krengning), RK4, gjennom US76, en eksponentiell atmosfære eller Mars-atmosfæren, med konvektiv oppvarming i stagnasjonspunktet etter Sutton-Graves (NASA TR R-376): maksimal retardasjon, varmefluks og dynamisk trykk, varmelast, nedoverrekkevidde, en energikontroll i roterende ramme og den lukkede formen til Allen-Eggers ved siden av. Maksimal retardasjon er kontrollert mot den publiserte nominelle Stardust-verdien; oppvarmingen er MODELLED.

seg-05c8dac8d411 = Én kjøring av <c1/> oppsummeres som: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

seg-96504cafb034 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Eksempelet <c1/> setter blant annet:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistisk konsta

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Resultatetikett (motorens): MODELLED — 3-DoF point-mass entry over a rotating spherical planet (central gravity, no J2), co-rotating windless atmosphere, constant C_D, L/D and bank, RK4; convective stagnation-point heating per NASA TR R-376 ({ "1971" }), cold wall, NO radiative heating, NO TPS/ablation response, NOT 6-DoF

seg-dbb618cd6357 = Diagrammet motoren skriver for scenarios/entry-heating-stardust.toml, typen entry-heating

seg-e73b339df97b = <b>VALIDATED</b> En 3-DoF innflyging med punktmasse over en roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" }, integrert med RK4 fra en treghets-innflygingstilstand, som rapporterer maksimal retardasjon og dens høyde; den planetrelative innflygingstilstanden fra i Tester: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Konvektiv varmefluks i stagnasjonspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstantene for jordluft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens topp og den integrerte varmelasten langs en 3-DoF innflyging, ballistisk eller løftende ved c Tester: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> En 3-DoF innflyging med punktmasse over en roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" }, integrert med RK4 fra en treghets-innflygingstilstand, som rapporterer th. Uavhengig referanse (ExternalDataset): Stardust-nominalen til Desai, Mitcheltree og Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksimal retardasjon { "33.4" } g fra { "12.6" } km/s planetrelativt med utskytningsmassen på { "45.8" } kg, en 6-DoF POST-bane med full aerodynamisk database; innflygingsgrensesnitt fra Desai, Lyons, Tooley og Kangas (NTRS { "20090004445" }): radius { "6503.14" } km, treghet { "12.9" } km/s ved -8.2 deg. Terskler fastsatt på forhånd i xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Konvektiv varmefluks i stagnasjonspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstantene for jordluft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens . Uavhengig referanse (InternalConsistency): Intern konsistens: relasjonen og konstantene slik de er trykt i NASA TR R-376, en konvergenskontroll med halvt steg, og den forventede rekkefølgen av topper i oppvarming og retardasjon. HVA SOM IKKE ER: ingen publisert varmeverdi er sammenlignet (Stardust-artiklene oppgir en konstruksjonsgrense og et estimat for konvektiv pluss strålingsmessig varme på omtrent { "1200" } W/cm2, som en relasjon kun for konvektiv varme ikke kan treffe); ingen strålingsoppvarming, veggtemperatur eller

seg-a0f300b2ce78 = MODELLED — 3-DoF point-mass entry over a rotating spherical planet (central gravity, no J2), co-rotating windless atmosphere, constant C_D, L/D and bank, RK4; convective stagnation-point heating per NASA TR R-376 ({ "1971" }), cold wall, NO radiative heating, NO TPS/ablation response, NOT 6-DoF (resultat <c1/>)

seg-47f81ab160cc = Maksimal retardasjon er kontrollert mot den publiserte nominelle Stardust-verdien; oppvarmingen er MODELLED. (typekatalog (<c1/>))

seg-47cda83af127 = Innflygingsgrensesnitt ved en radius på { "6503.14" } km, treghet { "12.9" } km/s ved -8.2 deg, { "45.8" } kg, { "0.811" } m diameter, { "0.2202" } m nesetuppradius (Desai m.fl., NASA NTRS { "20050042027" } og { "20090004445" }). Breddegrad og kurs er en antatt omtrentlig innflyging over Stillehavet; C_D er modulens standardverdi for en sfære-kjegle på { "60" } deg. Publisert nominell 6-DoF maksimal retardasjon: { "33.4" } g. Oppvarmingen er kun konvektiv etter Sutton-Graves, MODELLED. (kommentar i scenariofilen, linje { "4" } til { "8" })

seg-98af076be1ac = Konvektiv innflygingsoppvarming i stagnasjonspunktet (Sutton-Graves) på en 3-DoF innflyging er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Forrige</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Neste</s1>eo-coverage
