# docs--kind-lunar-vlbi: translations (nb)

seg-c1ce24cd6008 = analytisk

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-df90e5910fb4 = hr

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Delay-partialer akkumulert over en tidsplan av grunnlinjer × epoker til en Fisher-informasjonsmatrise, invertert til kovariansen for stasjonskoordinatene og sigma per koordinat for stasjonen, og erstatter en antatt isotrop ekvipartisjonslink fra en

seg-55ce02ad5dd5 = <b>MODELLED</b> Et tredje datumvalg, <c1/>, som holder hver jordstasjon fast og estimerer BAKENS månefaste koordinater alene — konfigurasjonen en usikkerhet for et overflatepunkt på månen faktisk oppgis for, siden koordinater for jordstasjoner

seg-afeb6e26c5ad = Kilde: <c1/>

seg-6d1a32afd780 = <c1/> (scenariotype)

seg-e01f77d493a0 = Modellert geodetisk VLBI-delay-observabel for månen: en jordgrunnlinje (to bakkestasjoner, GCRS) observerer et énveis signal fra en bake av NovaMoon-klassen på månens overflate. Gir ut nærfeltsdelayen som differansen av to avstander, dens rate og nærfeltskorreksjonen for bølgefrontkrumning over en passering — kryssjekket mot den planbølge-Δ-DOR-observabelen i samme kodebase i fjernfeltsgrensen, med partialer verifisert ved finite differanse. Standardveien med analytiske formler er MODELLED og bærer forbeholdene om referansesystemkonsistens, polbevegelse med xp=yp={ "0" } og planbølge mot nærfelt. Når planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path settes, kjører den kjerneveien i stedet (DE440, MOON_PA_DE440, ITRF93; konvergerte barysentriske lystider; legger til epokens bake- og stasjonspartialer), hvis newtonske delay og partialer stemmer med NAIF SPICE-konvergerte lystider til { "0.06" } ps og { "7.4e-9" }. Ikke validert mot virkelige VLBI-data.

seg-92227c085867 = Én kjøring av <c1/> oppsummeres slik: lunar-vlbi | grunnlinje { "10727" } km | bakeavstand { "402900" } km | delay -10049.126 µs (rate { "1.312e-6" } s/s) | nærfelt { "58.9" } µs | { "13" } sampler over { "6.0" } h

seg-1a38a07a0d70 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Eksempelet <c1/> setter blant annet:

seg-07d97fc1abac = Diagrammet motoren skriver for scenarios/lunar-vlbi.toml, type lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-61f431e422e5 = <b>MODELLED</b> VLBI-delay i nærfeltet for en jordgrunnlinje som observerer en bake på månen + partialer

seg-7342b50d34e4 = <b>VALIDATED</b> VLBI-delay i nærfeltet for en jordgrunnlinje som observerer en bake på månen, med bake- og stasjonspartialer, på kjerneveien (lunar_vlbi::KernelGeometry): DE440 Jorden og Månen, DE440 månens hovedakser, ITRF93 jordorientering med UT1 og Tester: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = og { "2" } til i matrisen.

seg-1461c84350d8 = <b>MODELLED</b> VLBI-delay i nærfeltet for en jordgrunnlinje som observerer en bake på månen + partialer. Uavhengig referanse (ReferenceImpl): Planbølge-delta_dor (samme kodebase) i fjernfeltsgrensen; partialer ved finite differanse. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): mot ANISE { "0.10" } konvergerte lystider gjennom DE440 ({ "75" } delay den 2024-01-01 over tre DSN-grunnlinjer, generert av xval/anise-lunar-od uten Kshana-kode) ligger ingen delay innenfor toleransen på { "1" } ps. Det største avviket er { "24" } µs, fra det analytiske månesentrumet (omtrent { "200" } km fra DE

seg-b41c162b015f = Standardveien med analytiske formler er MODELLED og bærer forbeholdene om referansesystemkonsistens, polbevegelse med xp=yp={ "0" } og planbølge mot nærfelt. (typekatalog (<c1/>))

seg-0beac99bb095 = Ærlighet: MODELLED, IKKE validert mot virkelige VLBI-data. Polbevegelsen er utelatt (xp = yp = { "0" }), så inertiale stasjonsposisjoner bærer en referansesystemfeil på noen få meter; bakken blander en månerekke for gjennomsnittlig ekvator for datoen med en ICRF-legemsfast forskyvning (jd_tdb ~ jd_tt), en inkonsistens i referansesystemet under modellens troverdighet; ingen lystidsiterasjon, media eller aberrasjon utover den differensierte Shapiro. Ingen TRL, flyarv eller byrå (kommentar i scenariofilen, linje { "17" } til { "21" })

seg-58b64e5ff3db = Geodetisk VLBI på månen er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Forrige</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Neste</s1>mars-pnt
