# docs--kind-eo-coverage: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-98151954f217 = false

seg-8e62cc4af6ea = Ämnessida: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Källa: <c1/>

seg-d72c017ca1fa = <c1/> (scenario kind)

seg-47b4aea6ed01 = Fotavtryck och täckningsgeometri för en jordobservationsnyttolast (SMAD-rymdtriangeln): jordens vinkelradie, svepbredd, markupplösning i nadir (GSD), maximal åtkomst utanför nadir, cirkulär omloppstid, J2-nodperiod och markspårsavstånd vid ekvatorn med en flagga för sammanhängande täckning, för en omloppshöjd, inklination (solsynkron som standard) och sensorns FOV/IFOV. MODELLED geometri för en sfärisk jord (ingen radiometri/MTF/atmosfär/jitter/solglitter); nodavstånd R_e·(ω − Ω̇)·T_nodal med sekulära J2-hastigheter av första ordningen.

seg-105bb8a3c33f = En körning av <c1/> sammanfattas som: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> { "184" } km swath, { "9.8" } m nadir GSD, access to { "745" } km off-nadir; node spacing { "2752" } km (gapped) (MODELLED)

seg-609c5b7bc6f1 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Exemplet <c1/> anger bland annat:

seg-834408a40783 = min

seg-ade2ba71a96c = Resultatetikett (motorns egen): MODELLED — rymdtriangelgeometri för en sfärisk jord; svepbredd/GSD/åtkomst är geometriska (ingen radiometri/MTF/atmosfär/jitter/solglitter), markspårsavståndet är R_e·(ω − Ω̇)·T_nodal med sekulära J2-hastigheter av första ordningen

seg-c2a8332f2ee2 = Diagrammet som motorn skriver för scenarios/eo-coverage.toml, kind eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD-rymdtriangelgeometri: jordens vinkelradie, svepbredd, GSD i nadir, maximal åtkomst utanför nadir och cirkulär omloppstid, samt J2-nodperioden av första ordningen (eo_payload::j2_nodal_period) och markspårsavståndet vid ekvatorn R_e (omega_ Tests: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD-rymdtriangelgeometri: jordens vinkelradie, svepbredd, GSD i nadir, maximal åtkomst utanför nadir och cirkulär omloppstid, samt J2-nodperioden av första ordningen (. Oracle (ExternalDataset): Orekit { "12.2" } (Apache-2.0) och GeographicLib { "2.1" } (MIT), båda körda som separata program, förhandsregistrerade (766823f3) före motorändringen och före varje körning av referensen: sfärstorheter inom { "1e-9" } relativt (sämst: vinkelradie { "5.4e-16" }, svepbredd { "7.0e-13" }, åtkomst { "1.9e-14" }), period { "1e-12" } ({ "1.6e-16" }), GSD i nadir { "1e-7" } ({ "2.9e-10" }), J2-nodperioden och nodavståndet inom { "0.1" } % av en numerisk J2-propagering i Orekit med en noddetektor ({ "1" }

seg-45625167e59f = MODELLED — rymdtriangelgeometri för en sfärisk jord; svepbredd/GSD/åtkomst är geometriska (ingen radiometri/MTF/atmosfär/jitter/solglitter), markspårsavståndet är R_e·(ω − Ω̇)·T_nodal med sekulära J2-hastigheter av första ordningen (result <c1/>)

seg-cf22f13c78d3 = MODELLED geometri för en sfärisk jord (ingen radiometri/MTF/atmosfär/jitter/solglitter); nodavstånd R_e·(ω − Ω̇)·T_nodal med sekulära J2-hastigheter av första ordningen. (kind catalogue (<c1/>))

seg-153325fb00d3 = ÄRLIG AVGRÄNSNING: enbart MODELLED geometri för en sfärisk jord -- ingen modell för radiometri / MTF / atmosfär / pekningsjitter / solglitter. Markspårsavståndet är R_e*(omega - dOmega/dt)*T_nodal med sekulära J2-hastigheter av första ordningen; inklinationen är som standard den solsynkrona för höjden. Run: kshana scenarios/eo-coverage.toml (scenario file comment, lines { "7" } to { "11" })

seg-5dc02c3d10f7 = <s1>Föregående</s1>entry-heating

seg-33f408d48d13 = <s1>Nästa</s1>eo-radiometry
