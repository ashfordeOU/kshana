# docs--kind-lunar-beacon: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-3c4e3d725bb6 = Källa: <c1/>

seg-5e402fc935cb = <c1/> (scenariotyp)

seg-142ad48fe422 = Förstärkning med fyrar på ytan av en lunar omloppsbaserad navigeringstjänst, som en körbar före/efter-tabell. En användare vid sydpolen ser en gles omloppsuppsättning i en smal del av himlen, så avståndsgeometrin är illa konditionerad; några INMÄTTA FYRAR PÅ YTAN ger de siktlinjerader med låg elevation och stor azimutspridning som en uppsättning helt ovanför saknar, och den horisontella försämringen av precision kollapsar. Scenariot redovisar tre konfigurationer vid en epok — enbart satelliter, satelliter plus de synliga fyrarna och en större konstellation som alternativ väg till samma geometri — var och en med antal synliga källor, sin fullständiga DOP och den uppnådda 1-sigma-noggrannheten i METER, erhållen genom att multiplicera med ett användarekvivalent avståndsfel per fyr som sätts samman som kvadratisk summa av termerna för klocksynkronisering, flervägsutbredning och inmätning. Fyrens synlighet är den geometriska horisonten på en måne utan atmosfär för två höjder (ingen atmosfär, så gränsen är exakt), och DOP-sammansättningen är samma kärna som korskontrollerats mot gnss_lib_py i tests/dop_reference.rs. VARFÖR DEN HÄR TYPEN FINNS: modulen bakom den har funnits i motorn och kontrollerats mot en oberoende DOP-väg sedan L08/L09, men den gick inte att nå från en körning — ingen typ, ingen dispatch-gren, ingen medföljande fil. README annonserade förmågan och verifieringsmatrisen hade INGEN rad för den alls, så den var samtidigt påstådd i prosa och opåstådd i registret, medan den var onåbar i motorn. Standardvärdena är den geometri som redan bär en incheckad referensfil (en användare vid -80 deg med en antenn på { "2" } m, tre fyrar vid -80/0, -79/+{ "60" } och -79/-60 på { "2" } km, en illustrativ ögonblicksbild av sex LCNS-satelliter vid t={ "0" }, en mask på { "5" } deg), så att en tom körning återger en tabell som en oberoende referens redan täcker i stället för att hitta på nya tal. MODELLED: konstellationsutformningen, fyrarnas placering och varje storlek i felbudgeten är illustrativa indata, inte en driftsatt inmätning eller en uppmätt länk; endast DOP-aritmetiken, den slutna formen för horisonten och sambandet sigma = DOP x sigma_URE är externt förankrade. Inget åtagande om tjänstens prestanda.

seg-22ea11fcf367 = En körning av <c1/> sammanfattas som: Förstärkning med fyrar på månytan — mask { "5.0" } deg, epok +{ "0" } s, sigma_URE per fyr { "1.1576" } m { "6" } satelliter, inga fyrar sat. { "5" } fyrar { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } uppnådd 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satelliter + { "1" } synliga fyrar sat. { "5" } fyrar { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } uppnådd 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satelliter, inga fyrar sat. { "19" } fyrar { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } uppnådd 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m fyrarna förbättrar PDOP med 2.355x; en större konstellation i stället, 4.002x MODELLED: konstellationen, fyrarnas placering och felbudgeten är illustrativa indata. DOP-kärnan under är den som validerats mot gnss_lib_py och fyrens horisont är den slutna formen L01.

seg-25522022cf9a = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Exemplet <c1/> anger bland annat:

seg-a53e353706f6 = Diagrammet som motorn skriver för scenarios/lunar-beacon.toml, typ lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Fyrförstärkt försämring av precision för en användare på månytan: siktlinjeraderna för de synliga satelliterna och avståndsraderna för de synliga fyrarna på ytan sammanfogas till en enda designmatris och utvärderas genom den delade DOP-kärnan, och t Tester: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Fyrförstärkt försämring av precision för en användare på månytan: siktlinjeraderna för de synliga satelliterna och avståndsraderna för de synliga fyrarna på ytan sammanfogas. Oberoende referens (ReferenceImpl): DOP-aritmetiken är kärnan crate::orbit::dop, separat externt validerad mot gnss_lib_py i tests/dop_reference.rs; den här raden lånar inte om den radens status. Fyrens synlighetshorisont är den slutna formen L01, och sigma = DOP x sigma_URE är det vanliga GNSS-sambandet (Kaplan och Hegarty, Understanding GPS/GNSS, avsnitt { "7" }). Inom den här raden kontrolleras själva förstärkningen mot en oberoende

seg-4d1fc06e907b = MODELLED: konstellationsutformningen, fyrarnas placering och varje storlek i felbudgeten är illustrativa indata, inte en driftsatt inmätning eller en uppmätt länk; endast DOP-aritmetiken, den slutna formen för horisonten och sambandet sigma = DOP x sigma_URE är externt förankrade. (typkatalog (<c1/>))

seg-aaafed663400 = VAD SOM ÄR FÖRANKRAT OCH VAD SOM INTE ÄR DET Förankrat: DOP-sammansättningen är kärnan som korskontrollerats mot gnss_lib_py i tests/dop_reference.rs; fyrens synlighet är den slutna formen för den geometriska horisonten på en måne utan atmosfär med två höjder (ingen atmosfär, så det finns ingen refraktiv utvidgning och gränsen är exakt); och sigma = DOP x sigma_URE är det vanliga sambandet (Kaplan & Hegarty, Understanding GPS/GNSS, avsnitt { "7" }). INTE förankrat — MODELL (kommentar i scenariofilen, rad { "40" } till { "49" })

seg-2516c4208769 = DOP-förstärkning med fyrar på månytan är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Föregående</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Nästa</s1>lunar-differential-pnt
