# docs--kind-oem-interop: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-4abcbdaddcf8 = Källa: <c1/>

seg-a92dcafd670e = <c1/> (scenariotyp)

seg-dbffff25b57f = Interoperabilitetsbrygga för CCSDS OEM: importera ett Orbit Ephemeris Message som skapats av ett externt flygdynamikverktyg (GMAT/Orekit/STK ger alla OEM) och redovisa dess segment/objekt/referenssystem/epokspann samt en hastighetskonsistenskontroll; utan indata går den en rundtur med en genererad referensbana och redovisar import↔export-trohet. MODELLED strukturell/fysikalisk importkontroll, INTE en validering av banans noggrannhet för källan.

seg-21eb1c9d7571 = En körning av <c1/> sammanfattas som: oem-interop: round-tripped { "2" } segment(s), { "12" } states; max round-trip error { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

seg-54c35d9fbfd9 = Valfria fält: <c1/>

seg-d4117f615cd8 = Exemplet <c1/> anger bland annat:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Resultatetikett (motorns egen): MODELLED — interoperabilitetsbrygga för import/rundtur av CCSDS OEM (GMAT/Orekit/STK ger OEM); en strukturell + fysikalisk importkontroll, INTE en validering av banans noggrannhet för källan

seg-5db5a7c812ca = Diagrammet som motorn skriver för scenarios/oem-interop.toml, typ oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importerare (parse_oem), tolerant mot COMMENT-rader / extra metadatanyckelord / kovariansblock och den exakta inversen till skrivaren; rundtur + import av extern fil med en hastighetskonsistenskontroll. Tester: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importerare (parse_oem), tolerant mot COMMENT-rader / extra metadatanyckelord / kovariansblock och den exakta inversen till skrivaren; rundtur + . Oberoende referens (ExternalDataset): Oberoende CCSDS-502-parser från tredje part <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — en separat kodbas som avkodar kshanas utsända EME2000/UTC-OEM byte för byte identiskt ({ "24" } tillstånd över { "2" } fixturer, pos/vel Δ = { "0" }) och vars strikta läsare bekräftar metadatatokens; kshanas parser stämmer likaså med den på en medföljande extern OEM. Två ärliga interoperabilitetsfynd (biblioteket oem avvisar kshanas mu per satellit

seg-7ab6bb7a1b8a = MODELLED — interoperabilitetsbrygga för import/rundtur av CCSDS OEM (GMAT/Orekit/STK ger OEM); en strukturell + fysikalisk importkontroll, INTE en validering av banans noggrannhet för källan (resultat <c1/>)

seg-343a56c07d02 = MODELLED strukturell/fysikalisk importkontroll, INTE en validering av banans noggrannhet för källan. (typkatalog (<c1/>))

seg-44aba1ad1d37 = ÄRLIG AVGRÄNSNING: MODELLED strukturell + fysikalisk importkontroll, INTE en validering av banans noggrannhet för källefemeriden. Kör: kshana scenarios/oem-interop.toml (kommentar i scenariofilen, rad { "11" } till { "13" })

seg-833df8eedc34 = <s1>Föregående</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Nästa</s1>optical-atmosphere
