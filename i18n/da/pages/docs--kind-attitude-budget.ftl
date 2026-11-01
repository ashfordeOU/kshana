# docs--kind-attitude-budget: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-40ca4197150b = Kilde: <c1/>

seg-a271f371a3cf = <c1/> (scenarietype)

seg-62c0dda9fc56 = 3-DOF-budget for attitude og pegefejl: det værst tænkelige gravitationsgradient-forstyrrelsesmoment ((3/2)(μ/R³)ΔI) og et root-sum-square-budget for pegefejl over navngivne 1σ-bidragydere (sensorstøj, reaktionshjulsjitter, termisk, justering) med det dominerende led, for en banehøjde + en spredning i legemets inerti. MODELLED skalært AOCS-budget — et supplement før hardware til Basilisk/42, ikke en simulering af styresløjfe, 6-DoF eller fleksible tilstande.

seg-9fdc45a8aaa3 = Én kørsel af <c1/> opsummeres som: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG-moment { "7.04e-5" } N·m; pegning { "10.7" }" RSS (dominerende: reaction_wheel_jitter) (MODELLED skalart budget)

seg-7cf112b1bcc3 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Eksemplet <c1/> angiver blandt andet:

seg-c33e3cbba749 = arcsec

seg-36df1bc710ab = justering

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Resultatmærkat (motorens egen): MODELLED — skalart 3-DOF AOCS-fejlbudget: værst tænkelige gravitationsgradient-forstyrrelsesmoment + RSS-pegebudget; IKKE en simulering af styresløjfe / 6-DoF / fleksible tilstande (et supplement før hardware til Basilisk/42, ikke en erstatning)

seg-ad0e72e3b688 = Diagrammet, som motoren skriver for scenarios/attitude-budget.toml, type attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Det værst tænkelige gravitationsgradient-forstyrrelsesmoment ((3/2)(μ/R³)ΔI) som maksimum over attitude (den validerede påstand), plus et RSS-budget for pegefejl over navngivne 1σ-bidragydere med det dominerende led (en kvadratsum af tal leveret af kalderen Tests: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Det værst tænkelige gravitationsgradient-forstyrrelsesmoment ((3/2)(μ/R³)ΔI) som maksimum over attitude (den validerede påstand), plus et RSS-budget for pegefejl over navngivne 1σ . Uafhængig reference (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en uafhængig C++-implementering af gravitationsgradientmomentet med den fulde tensor: Kshanas maksimum (3/2)(μ/R³)ΔI er lig med Basilisks moment ved attituden { "45" } deg inden for { "1e-12" } relativt (værst { "2.1e-15" }) over { "5" } højder og { "8" } inertitensorer og begrænser Basilisks moment over { "2000" } tilfældige attituder pr. tilfælde; tolerancen er fastsat før sammenligningen. Valideret påstand: gravitations-

seg-d2a6cf813e95 = <b>PARTNER</b> Ikke leveret — Kshana er en simulator for navigationsydelse, ikke et rumfartøjsfirma. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-3895121a5466 = MODELLED — skalart 3-DOF AOCS-fejlbudget: værst tænkelige gravitationsgradient-forstyrrelsesmoment + RSS-pegebudget; IKKE en simulering af styresløjfe / 6-DoF / fleksible tilstande (et supplement før hardware til Basilisk/42, ikke en erstatning) (resultat <c1/>)

seg-f62458cae23b = MODELLED skalart AOCS-budget — et supplement før hardware til Basilisk/42, ikke en simulering af styresløjfe/6-DoF/fleksible tilstande. (typekatalog (<c1/>))

seg-333fca11ac0c = ÆRLIG AFGRÆNSNING: MODELLED skalart fejlbudget -- et supplement før hardware til Basilisk/42, IKKE en simulering af styresløjfe / 6-DoF / fleksible tilstande. Gravitationsgradientleddet rapporteres som et moment (at omsætte det til pegning kræver en styrestivhed, som kalderen ejer); budgettet er kvadratsummen af de leverede 1-sigma-bidrag. Kør: kshana scenarios/attitude-budget.toml (kommentar i scenariefilen, linje { "8" } til { "13" })

seg-0e27fcef1499 = <s1>Forrige</s1>ascent-losses

seg-946c453cbf0f = <s1>Næste</s1>body-pnt

seg-a349aa76b0ed = PARTNER
