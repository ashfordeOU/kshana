# docs--kind-eo-coverage: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-98151954f217 = false

seg-8e62cc4af6ea = Emneside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Kilde: <c1/>

seg-d72c017ca1fa = <c1/> (scenarietype)

seg-47b4aea6ed01 = Footprint og dækningsgeometri for jordobservationsnyttelast (SMAD-rumtrekant): Jordens vinkelradius, swathbredde, GSD i nadir, maksimal off-nadir-adgang, cirkulær periode, J2-knudeperiode og afstand mellem jordspor ved ækvator med et flag for sammenhængende dækning, for en banehøjde, hældning (solsynkron som standard) og sensor-FOV/IFOV. MODELLED geometri med kugleformet Jord (ingen radiometri/MTF/atmosfære/jitter/glint); knudeafstand R_e·(ω − Ω̇)·T_nodal med første-ordens sekulære J2-rater.

seg-105bb8a3c33f = Én kørsel af <c1/> opsummeres som: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m GSD i nadir, adgang til { "745" } km off-nadir; knudeafstand { "2752" } km (med huller) (MODELLED)

seg-609c5b7bc6f1 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Eksemplet <c1/> angiver blandt andet:

seg-834408a40783 = min

seg-ade2ba71a96c = Resultatmærkat (motorens egen): MODELLED — rumtrekantgeometri med kugleformet Jord; swath/GSD/adgang er geometriske (ingen radiometri/MTF/atmosfære/jitter/glint), afstanden mellem jordspor er R_e·(ω − Ω̇)·T_nodal med første-ordens sekulære J2-rater

seg-c2a8332f2ee2 = Diagrammet, som motoren skriver for scenarios/eo-coverage.toml, type eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD-rumtrekantgeometri: Jordens vinkelradius, swathbredde, GSD i nadir, maksimal off-nadir-adgang og cirkulær periode, plus den første-ordens J2-knudeperiode (eo_payload::j2_nodal_period) og afstanden mellem jordspor ved ækvator R_e (omega_ Tests: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD-rumtrekantgeometri: Jordens vinkelradius, swathbredde, GSD i nadir, maksimal off-nadir-adgang og cirkulær periode, plus den første-ordens J2-knudeperiode (. Uafhængig reference (ExternalDataset): Orekit { "12.2" } (Apache-2.0) og GeographicLib { "2.1" } (MIT), begge kørt som separate programmer, præregistreret (766823f3) før motorændringen og før nogen kørsel af den uafhængige reference: størrelser for kuglen inden for { "1e-9" } relativt (værst: vinkelradius { "5.4e-16" }, swath { "7.0e-13" }, adgang { "1.9e-14" }), periode { "1e-12" } ({ "1.6e-16" }), GSD i nadir { "1e-7" } ({ "2.9e-10" }), J2-knudeperioden og knudeafstanden inden for { "0.1" } % af en numerisk J2-propagering i Orekit med en knudedetektor ({ "1" }

seg-45625167e59f = MODELLED — rumtrekantgeometri med kugleformet Jord; swath/GSD/adgang er geometriske (ingen radiometri/MTF/atmosfære/jitter/glint), afstanden mellem jordspor er R_e·(ω − Ω̇)·T_nodal med første-ordens sekulære J2-rater (resultat <c1/>)

seg-cf22f13c78d3 = MODELLED geometri med kugleformet Jord (ingen radiometri/MTF/atmosfære/jitter/glint); knudeafstand R_e·(ω − Ω̇)·T_nodal med første-ordens sekulære J2-rater. (typekatalog (<c1/>))

seg-153325fb00d3 = ÆRLIG AFGRÆNSNING: kun MODELLED geometri med kugleformet Jord -- ingen model for radiometri / MTF / atmosfære / pegejitter / sunglint. Afstanden mellem jordspor er R_e*(omega - dOmega/dt)*T_nodal med første-ordens sekulære J2-rater; hældningen er som standard den solsynkrone for højden. Kør: kshana scenarios/eo-coverage.toml (kommentar i scenariefilen, linje { "7" } til { "11" })

seg-5dc02c3d10f7 = <s1>Forrige</s1>entry-heating

seg-33f408d48d13 = <s1>Næste</s1>eo-radiometry
