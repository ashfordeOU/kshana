# docs--kind-lunar-vlbi: translations (da)

seg-c1ce24cd6008 = analytisk

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-df90e5910fb4 = hr

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Delay-partialer akkumuleret over en plan af baselines × epoker til en Fisher-informationsmatrix, inverteret til kovariansen for stationskoordinaterne og sigma pr. koordinat for stationen, i stedet for et antaget isotropt equipartition-led fra en

seg-55ce02ad5dd5 = <b>MODELLED</b> Et tredje valg af datum, <c1/>, der holder hver jordstation fast og estimerer KUN FYRETs Måne-legemsfaste koordinater — den konfiguration, som usikkerheden for et punkt på månens overflade faktisk angives for, da jordstationernes koordinater

seg-afeb6e26c5ad = Kilde: <c1/>

seg-6d1a32afd780 = <c1/> (scenarietype)

seg-e01f77d493a0 = Modelleret geodætisk lunar VLBI-delay som observabel: en jordbaseline (to jordstationer, GCRS) observerer et enkeltvejssignal fra et fyr af NovaMoon-klassen på månens overflade. Udsender delayen som forskel mellem to afstande i nærfeltet, dens rate og korrektionen for bølgefrontens krumning i nærfeltet over en overflyvning — krydskontrolleret mod den plane-bølge-Δ-DOR-observabel i samme kodebase i fjernfeltsgrænsen, med partialer verificeret ved differenskvotient. Standardvejen med analytik er MODELLED og bærer forbeholdene om konsistens mellem referencesystemer, polbevægelse xp=yp={ "0" } og plan bølge mod nærfelt. Hvis planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path sættes, kører kernevejen i stedet (DE440, MOON_PA_DE440, ITRF93; konvergerede barycentriske lystider; tilføjer epokens partialer for fyr og stationer), hvis newtonske delay og partialer stemmer med NAIF SPICE's konvergerede lystider til { "0.06" } ps og { "7.4e-9" }. Ikke valideret mod reelle VLBI-data.

seg-92227c085867 = Én kørsel af <c1/> opsummeres som: lunar-vlbi | baseline { "10727" } km | beacon range { "402900" } km | delay -10049.126 µs (rate { "1.312e-6" } s/s) | near-field { "58.9" } µs | { "13" } samples over { "6.0" } h

seg-1a38a07a0d70 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Eksemplet <c1/> sætter blandt andet:

seg-07d97fc1abac = Diagrammet, som motoren skriver for scenarios/lunar-vlbi.toml, type lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-61f431e422e5 = <b>MODELLED</b> Nærfelts-VLBI-delay for en jordbaseline, der observerer et lunart fyr + partialer

seg-7342b50d34e4 = <b>VALIDATED</b> Nærfelts-VLBI-delay for en jordbaseline, der observerer et lunart fyr, med partialer for fyr og stationer, på kernevejen (lunar_vlbi::KernelGeometry): DE440 for Jorden og Månen, DE440 for Månens hovedakser, ITRF93-jordorientering med UT1 og Tests: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = og { "2" } flere i matrixen.

seg-1461c84350d8 = <b>MODELLED</b> Nærfelts-VLBI-delay for en jordbaseline, der observerer et lunart fyr + partialer. Uafhængig reference (ReferenceImpl): Plan-bølge-delta_dor (samme kodebase) i fjernfeltsgrænsen; partialer ved differenskvotient. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): mod ANISE { "0.10" } konvergerede lystider gennem DE440 ({ "75" } delays den 2024-01-01 over tre DSN-baselines, genereret af xval/anise-lunar-od uden Kshana-kode) ligger ingen delay inden for tolerancen på { "1" } ps. Den største afvigelse er { "24" } µs, fra det analytiske Måne-centrum (omkring { "200" } km fra DE

seg-b41c162b015f = Standardvejen med analytik er MODELLED og bærer forbeholdene om konsistens mellem referencesystemer, polbevægelse xp=yp={ "0" } og plan bølge mod nærfelt. (kategori-katalog (<c1/>))

seg-0beac99bb095 = Ærlighed: MODELLED, IKKE valideret mod reelle VLBI-data. Polbevægelsen er udeladt (xp = yp = { "0" }), så stationernes inertiale positioner bærer en referencesystemfejl på nogle få meter; fyret blander en serie for Månen med middelækvator for datoen med en ICRF-legemsfast forskydning (jd_tdb ~ jd_tt), en uoverensstemmelse mellem referencesystemer under modellens troværdighed; ingen iteration af lystid, medier eller aberration ud over det differentierede Shapiro-led. Ingen TRL, flyvehistorik eller myndighedsstøtte (kommentar i scenariefilen, linje { "17" } til { "21" })

seg-58b64e5ff3db = Lunar geodætisk VLBI er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Forrige</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Næste</s1>mars-pnt
