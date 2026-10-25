# docs--kind-lunar-vlbi: translations (sv)

seg-c1ce24cd6008 = analytisk

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-df90e5910fb4 = hr

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Fördröjningspartialer ackumulerade över ett schema av baslinjer × epoker till en Fisher-informationsmatris, inverterad till kovariansen för stationskoordinaterna och stationssigma per koordinat, vilket ersätter en antagen isotrop ekvipartitionslänk från en

seg-55ce02ad5dd5 = <b>MODELLED</b> Ett tredje datumval, <c1/>, som håller varje jordstation fast och skattar endast FYRENS månfasta koordinater — den konfiguration som en osäkerhet för en punkt på månytan faktiskt anges för, eftersom jordstationernas koordinater

seg-afeb6e26c5ad = Källa: <c1/>

seg-6d1a32afd780 = <c1/> (scenariotyp)

seg-e01f77d493a0 = Modellerad geodetisk lunar VLBI-fördröjningsobservabel: en jordbaslinje (två markstationer, GCRS) observerar en enkelriktad signal från en fyr av NovaMoon-klass på månytan. Ger den närfältsfördröjning som är skillnaden mellan två avstånd, dess ändringstakt och närfältskorrektionen för vågfrontens krökning över en passage — kontrollerad mot den plana vågens Δ-DOR-observabel i samma kodbas i fjärrfältsgränsen, med partialer verifierade genom finita differenser. Standardvägen med analytiska uttryck är MODELLED och bär förbehållen om ramkonsistens, polrörelse xp=yp={ "0" } och plan våg mot närfält. Om planetary_kernel_path, earth_orientation_kernel_path och moon_orientation_kernel_path anges körs i stället kärnvägen (DE440, MOON_PA_DE440, ITRF93; konvergerade barycentriska ljustider; lägger till epokens fyr- och stationspartialer), vars newtonska fördröjning och partialer ligger inom { "0.06" } ps och { "7.4e-9" } från NAIF SPICE:s konvergerade ljustider. Inte validerad mot verkliga VLBI-data.

seg-92227c085867 = En körning av <c1/> sammanfattas som: lunar-vlbi | baseline { "10727" } km | beacon range { "402900" } km | delay -10049.126 µs (rate { "1.312e-6" } s/s) | near-field { "58.9" } µs | { "13" } samples over { "6.0" } h

seg-1a38a07a0d70 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Exemplet <c1/> anger bland annat:

seg-07d97fc1abac = Diagrammet som motorn skriver för scenarios/lunar-vlbi.toml, typ lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-61f431e422e5 = <b>MODELLED</b> Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar fyr + partialer

seg-7342b50d34e4 = <b>VALIDATED</b> Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar fyr, med fyr- och stationspartialer, på kärnvägen (lunar_vlbi::KernelGeometry): DE440 jorden och månen, DE440 månens huvudaxlar, ITRF93 jordorientering med UT1 och Tester: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = och { "2" } till i matrisen.

seg-1461c84350d8 = <b>MODELLED</b> Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar fyr + partialer. Oberoende referens (ReferenceImpl): Plan-vågs-delta_dor (samma kodbas) i fjärrfältsgränsen; partialer med finita differenser. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): mot ANISE { "0.10" } konvergerade ljustider genom DE440 ({ "75" } fördröjningar den 2024-01-01 över tre DSN-baslinjer, genererade av xval/anise-lunar-od utan Kshana-kod) ligger ingen fördröjning inom toleransen { "1" } ps. Det största gapet är { "24" } µs, från det analytiska månens centrum (omkring { "200" } km från DE

seg-b41c162b015f = Standardvägen med analytiska uttryck är MODELLED och bär förbehållen om ramkonsistens, polrörelse xp=yp={ "0" } och plan våg mot närfält. (typkatalog (<c1/>))

seg-0beac99bb095 = Ärlighet: MODELLED, INTE validerad mot verkliga VLBI-data. Polrörelsen utelämnas (xp = yp = { "0" }) så stationernas inertiella positioner bär ett ramfel på några meter; fyren blandar en medelekvatorns-för-datum-månserie med en ICRF-kroppsfast offset (jd_tdb ~ jd_tt), en brist i ramkonsistens under modellens upplösning; ingen ljustidsiteration, inga medier och ingen aberration utöver den differentierade Shapiro-termen. Inget TRL, ingen flygerfarenhet och inget myndighets (kommentar i scenariofilen, rad { "17" } till { "21" })

seg-58b64e5ff3db = Geodetisk lunar VLBI är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte extern auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Föregående</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Nästa</s1>mars-pnt
