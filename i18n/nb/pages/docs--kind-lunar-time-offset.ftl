# docs--kind-lunar-time-offset: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-4d208b6c0eb8 = dag

seg-64813e3da228 = Kilde: <c1/>

seg-000bb13909f1 = <c1/> (scenariotype)

seg-7f3e13712f10 = Modellert relativistisk klokkerate mellom Jorden og Månen (Lunar Coordinate Time, LTC/TCL): den sekulære raten LTC−TT fra forskjellen i selvpotensial og Månens kinetiske ledd, rapportert med det publiserte båndet { "56" }–{ "59" } µs/døgn, pluss det akkumulerte avviket over en horisont.

seg-9efcf3e1be04 = Én kjøring av <c1/> oppsummeres slik: lunar-time-offset | sekulær rate LTC−TT { "57.04" } µs/døgn (bånd { "56" }–{ "59" }) | selvpot { "57.50" } kinetisk -0.46 | avvik @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Eksempelet <c1/> setter blant annet:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Diagrammet motoren skriver for scenarios/lunar-time-offset.toml, type lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistisk klokkerate mellom Jorden og Månen (LTC/TCL) + kjeding av TT/TAI/UTC + ensemble. Uavhengig referanse (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; grunnlag for IAU/IAG LunaNet LTC): selvpotensialet på månens overflate L_m = { "3.13881e-11" } og den sekulære totalen { "56.02" } µs/døgn gjengitt som publiserte numeriske verdier; geosentrisk månefart kryssjekket mot JPL DE440 (de440s.bsp via SPICE)

seg-96b65f604cc2 = Ærlighet: MODELLED, ikke sertifisert. Hovedtallet i us/døgn er referanseavhengig (jordens geoide W0 mot en lunar selenoide, midlingsvinduet, forsømte sentrifugal-/J2-korreksjoner på under us/døgn) -> et bånd, ikke ett enkelt tall, er det ærlige resultatet. Ingenting her er validert til absolutt nøyaktighet under nanosekundet eller sertifisert for operativ tidtaking. Rapporten gir også det akkumulerte LTC-TT-avviket over hori (kommentar i scenariofilen, linje { "11" } til { "16" })

seg-e4552368a6a7 = <s1>Forrige</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Neste</s1>lunar-vlbi-fim

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>
