# docs--kind-attitude-budget: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-40ca4197150b = Kilde: <c1/>

seg-a271f371a3cf = <c1/> (scenariotype)

seg-62c0dda9fc56 = 3-DOF-budsjett for holdnings- og pekefeil: det verst tenkelige forstyrrelsesmomentet fra gravitasjonsgradienten ((3/2)(μ/R³)ΔI) og et rot-sum-kvadrat-budsjett for pekefeil over navngitte 1σ-bidrag (sensorstøy, reaksjonshjulsjitter, termisk, justering) med det dominerende leddet, for en banehøyde og en spredning i kroppens treghet. MODELLED skalart AOCS-budsjett — et supplement før maskinvare til Basilisk/42, ikke en simulering av reguleringssløyfe, 6-DoF eller fleksible moduser.

seg-9fdc45a8aaa3 = Én kjøring av <c1/> oppsummeres som: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG torque { "7.04e-5" } N·m; pointing { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalar budget)

seg-7cf112b1bcc3 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Eksempelet <c1/> setter blant annet:

seg-c33e3cbba749 = buesekunder

seg-36df1bc710ab = justering

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Resultatetikett (motorens): MODELLED — scalar 3-DOF AOCS error budget: gravity-gradient worst-case disturbance torque + RSS pointing budget; NOT a control-loop / 6-DoF / flexible-mode simulation (a pre-hardware complement to Basilisk/42, not a replacement)

seg-ad0e72e3b688 = Diagrammet motoren skriver for scenarios/attitude-budget.toml, typen attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Verst tenkelige forstyrrelsesmoment fra gravitasjonsgradienten ((3/2)(μ/R³)ΔI) som toppen over holdning (den validerte påstanden), pluss et RSS-budsjett for pekefeil over navngitte 1σ-bidrag med det dominerende leddet (en kvadratsum av tall oppgitt av den som kaller Tester: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Verst tenkelige forstyrrelsesmoment fra gravitasjonsgradienten ((3/2)(μ/R³)ΔI) som toppen over holdning (den validerte påstanden), pluss et RSS-budsjett for pekefeil over navngitte 1σ . Uavhengig referanse (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en uavhengig C++-implementering av gravitasjonsgradientmomentet med full tensor: Kshanas topp (3/2)(μ/R³)ΔI er lik Basilisks moment ved holdningen { "45" } deg innen { "1e-12" } relativt (verst { "2.1e-15" }) over { "5" } høyder og { "8" } treghetstensorer, og begrenser Basilisks moment over { "2000" } tilfeldige holdninger per tilfelle; toleranse fastsatt før sammenligningen. Validert påstand: gravity-

seg-d2a6cf813e95 = <b>PARTNER</b> Ikke levert — Kshana er en simulator for navigasjonsytelse, ikke et bussleverandørhus. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-3895121a5466 = MODELLED — scalar 3-DOF AOCS error budget: gravity-gradient worst-case disturbance torque + RSS pointing budget; NOT a control-loop / 6-DoF / flexible-mode simulation (a pre-hardware complement to Basilisk/42, not a replacement) (resultat <c1/>)

seg-f62458cae23b = MODELLED skalart AOCS-budsjett — et supplement før maskinvare til Basilisk/42, ikke en simulering av reguleringssløyfe, 6-DoF eller fleksible moduser. (typekatalog (<c1/>))

seg-333fca11ac0c = HONEST SCOPE: MODELLED skalart feilbudsjett -- et supplement før maskinvare til Basilisk/42, IKKE en simulering av reguleringssløyfe, 6-DoF eller fleksible moduser. Gravitasjonsgradientleddet rapporteres som et moment (å omsette det til peking krever en reguleringsstivhet som den som kaller eier); budsjettet er kvadratsummen av de oppgitte 1-sigma-bidragene. Kjør: kshana scenarios/attitude-budget.toml (kommentar i scenariofilen, linje { "8" } til { "13" })

seg-0e27fcef1499 = <s1>Forrige</s1>ascent-losses

seg-946c453cbf0f = <s1>Neste</s1>body-pnt
