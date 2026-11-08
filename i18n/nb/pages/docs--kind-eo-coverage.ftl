# docs--kind-eo-coverage: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-98151954f217 = false

seg-8e62cc4af6ea = Temaside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Kilde: <c1/>

seg-d72c017ca1fa = <c1/> (scenariotype)

seg-47b4aea6ed01 = Fotavtrykk og dekningsgeometri for nyttelast til jordobservasjon (SMAD-romtriangel): jordens vinkelradius, svathbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir, sirkulær periode, J2-nodeperiode og avstand mellom bakkespor ved ekvator med et flagg for sammenhengende dekning, for en banehøyde, inklinasjon (solsynkron som standard) og sensorens FOV/IFOV. MODELLED geometri for sfærisk jord (ingen radiometri/MTF/atmosfære/jitter/glint); nodeavstand R_e·(ω − Ω̇)·T_nodal med førsteordens sekulære J2-rater.

seg-105bb8a3c33f = Én kjøring av <c1/> oppsummeres som: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

seg-609c5b7bc6f1 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Eksempelet <c1/> setter blant annet:

seg-834408a40783 = min

seg-ade2ba71a96c = Resultatetikett (motorens): MODELLED — spherical-Earth space-triangle geometry; swath/GSD/access are geometric (no radiometry/MTF/atmosphere/jitter/glint), ground-track spacing is R_e·(ω − Ω̇)·T_nodal with first-order J2 secular rates

seg-c2a8332f2ee2 = Diagrammet motoren skriver for scenarios/eo-coverage.toml, typen eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD-romtriangelgeometri: jordens vinkelradius, svathbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir og sirkulær periode, pluss førsteordens J2-nodeperiode (eo_payload::j2_nodal_period) og avstanden mellom bakkespor ved ekvator R_e (omega_ Tester: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD-romtriangelgeometri: jordens vinkelradius, svathbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir og sirkulær periode, pluss førsteordens J2-nodeperiode (. Uavhengig referanse (ExternalDataset): Orekit { "12.2" } (Apache-2.0) og GeographicLib { "2.1" } (MIT), begge kjørt som separate programmer, forhåndsregistrert (766823f3) før motorendringen og før noen kjøring av den uavhengige referansen: kulestørrelser innen { "1e-9" } relativt (verst: vinkelradius { "5.4e-16" }, svathbredde { "7.0e-13" }, tilgang { "1.9e-14" }), periode { "1e-12" } ({ "1.6e-16" }), bakkeoppløsning i nadir { "1e-7" } ({ "2.9e-10" }), J2-nodeperioden og nodeavstanden innen { "0.1" } % av en numerisk Orekit J2-propagering med nodedetektor ({ "1" }

seg-45625167e59f = MODELLED — spherical-Earth space-triangle geometry; swath/GSD/access are geometric (no radiometry/MTF/atmosphere/jitter/glint), ground-track spacing is R_e·(ω − Ω̇)·T_nodal with first-order J2 secular rates (resultat <c1/>)

seg-cf22f13c78d3 = MODELLED geometri for sfærisk jord (ingen radiometri/MTF/atmosfære/jitter/glint); nodeavstand R_e·(ω − Ω̇)·T_nodal med førsteordens sekulære J2-rater. (typekatalog (<c1/>))

seg-153325fb00d3 = HONEST SCOPE: MODELLED kun geometri for sfærisk jord -- ingen modell for radiometri / MTF / atmosfære / pekejitter / solglint. Avstanden mellom bakkespor er R_e*(omega - dOmega/dt)*T_nodal med førsteordens sekulære J2-rater; inklinasjonen er som standard den solsynkrone for høyden. Kjør: kshana scenarios/eo-coverage.toml (kommentar i scenariofilen, linje { "7" } til { "11" })

seg-5dc02c3d10f7 = <s1>Forrige</s1>entry-heating

seg-33f408d48d13 = <s1>Neste</s1>eo-radiometry
