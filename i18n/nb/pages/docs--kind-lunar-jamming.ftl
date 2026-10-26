# docs--kind-lunar-jamming: translations (nb)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b> Månenativt forhold mellom jammer og signal, effektiv C/N₀ og tap av lås for en selenografisk overflatebruker under en jammer på månens overflate (eller hevet), over den illustrative offentlig kildebaserte Moonlight/LCNS-klasse-konstellasjonen.

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> hviler ikke lenger sin nektelseskontur på én skalar.

seg-bcb02ffed4d0 = Kilde: <c1/>

seg-612388918e36 = <c1/> (scenariotype)

seg-a91a9ad5d8d1 = Månenativ RF-jamming: forholdet mellom jammer og signal per satellitt, effektiv C/N₀ og tap av lås for en selenografisk bruker på overflaten under en jammer på månens overflate (eller hevet), over den illustrative konstellasjonen av Moonlight/LCNS-klassen i månebane, med offentlige kilder. Setter sammen den eksisterende åpne jamming-fysikken (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den eksisterende himmelgeometrien for månen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri utledes på nytt. I motsetning til typen <c1/> for Jorden er signalleddet IKKE en fast mottatt effekt: hver satellitts isotrope mottatte effekt er dens eget linkbudsjett EIRP − FSPL(skråavstand), så J/S varierer fra satellitt til satellitt med avstand og elevasjon på månen. Rapporterer ÉN RAD PER SYNLIG (epoke, satellitt)-LINK — asimut, elevasjon, skråavstand, begge mottatte effekter som J/S er differansen av, J/S, nominell og effektiv C/N₀ og låsestatus — pluss samlede kvalitetsmål ved siden av (aldri i stedet for) den tabellen, og den samme tabellen som CSV-artefakt. Hvert utgitte numeriske felt har en enhet og en opphavsklasse. VALIDATED delresultater bærer sin kildemoduls uavhengige referanse (antijamming-ligningen og J/S-linken til Kaplan & Hegarty §{ "9.4" }, referert eksternt i tests/gnss_denied_jamming_resilience_reference.rs; månegeometrien i lunar_service). Selve sammensetningen er kryssjekket mot en uavhengig vei med to linkbudsjetter (linkbudget::received_signal_power_dbw, et annet uttrykk for frirommstap) til { "1e-9" } dB. MODELLED: den illustrative konstellasjonen, de representative verdiene for EIRP / jammereffekt / antennegevinster / støytemperatur, og fraværet av terrengskygge, flerveis, AGC-dynamikk og adaptiv nulling. Ikke et sertifisert tjenestenektprodukt. Med en konfigurert jammer inneholder rapporten også en NEKTINGSKONTUR MED ET USIKKERHETSBÅND i stedet for en kontur avlest fra én skalar: den fulle målte fordelingen av ønsket-signal-C/N₀ over tabellen per satellitt (n, min, p05, p25, median, p75, p95, maks, gjennomsnitt, utvalgsstandardavvik og utvalgets egen asymmetri), og konturen evaluert ved hver av disse ordensstatistikkene under BEGGE nektingskriteriene motoren kjenner: det etablerte effektforholdskriteriet (J/S = { "30" } dB, som i attack-surface og tracking-loop) og kriteriet om tap av lås (effektiv C/N₀ som faller til tracking_threshold_dbhz, kriteriet denne rapportens egen statuskolonne bruker) — på begge aksene i nektingsplanet (påkrevd jammer-EIRP ved scenarioets avstand, nektingsavstand ved scenarioets EIRP). Båndkantene ER contour(p05) og contour(p95), den samme lukkede avbildningen anvendt på utvalgets egne kvantiler: ikke en sigma tilpasset utvalget og ikke median ± k·standardavvik, med standardavvik gitt ut av kontinuitetshensyn og brukt av ingenting. En kvantil som allerede ligger ved eller under sporingsterskelen har ingen endelig nektende J/S, og kolonnene for tap av lås er null med en talt årsak, aldri en avkortet radius.

seg-6693c3ebcb07 = Én kjøring av <c1/> oppsummeres slik: lunar-jamming | { "4" } satellitter, { "12" } epoker, { "38" } linker fra (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (gjennomsnitt { "35.622" }) | { "0" } LOST | tilgjengelighet { "0.167" } av { "0.167" } nominelt

seg-6e01b6354e40 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Eksempelet <c1/> setter blant annet:

seg-6fe8b3c6c584 = Diagrammet motoren skriver for scenarios/lunar-jamming.toml, type lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Månenativt forhold mellom jammer og signal, effektiv C/N₀ og tap av lås for en selenografisk bruker på overflaten under en jammer på månens overflate (eller hevet), over den illustr. Uavhengig referanse (ReferenceImpl): Sammensetningskryssjekk mot en uavhengig kodevei i samme repo: hver J/S per link utledes på nytt som differansen av to linkbudsjetter beregnet med linkbudget::received_signal_power_dbw, hvis frirommstap er det enkle uttrykket { "20" }·log10(4πRf/c) i stedet for tredelssummen jamming::free_space_path_loss_db bruker; de to stemmer overens til < { "1e-9" } dB på hver rad (målt verste tilfelle { "7.11e-14" } dB, det vil si flyttallsavrunding)

seg-dbe54e7cc800 = <b>MODELLED</b> Rapporten <c1/> hviler ikke lenger nektingskonturen sin på én skalar. Den gir ut den fulle målte fordelingen av ønsket-signal-C/N₀ over tabellen per satellitt. Uavhengig referanse (InternalConsistency): Intern konsistens mot motorens egne foroverfunksjoner, som er alt denne funksjonen ærlig kan hevde. Hvert konturpunkt er en lukket inversjon, og hver inversjon kontrolleres ved å sende svaret tilbake gjennom FOROVERFUNKSJONEN som rapportens egne rader ble skåret med: J/S-kolonnen gjennom jamming::effective_cn0_dbhz (som må returnere tracking_threshold_dbhz til < { "1e-9" } dB-Hz), avstandskolonnen

seg-d48926e62856 = MODELLED: den illustrative konstellasjonen, de representative verdiene for EIRP / jammereffekt / antennegevinster / støytemperatur, og fraværet av terrengskygge, flerveis, AGC-dynamikk og adaptiv nulling. (typekatalog (<c1/>))

seg-c455dbcb9f8c = MODELLED. Konstellasjonen er den illustrative geometrien av Moonlight/LCNS-klassen fra offentlige kilder (ikke den virkelige efemeriden; ingen tilknytning eller støtte antydes), og interferensmodellen er et linkbudsjett: ingen terrengskygge for jammeren (en førsteordens effekt i terrenget ved sørpolen), ingen flerveis, ingen AGC-dynamikk for nær/fjern, ingen adaptiv nulling, ingen hysterese mellom akkvisisjon og sporing. (kommentar i scenariofilen, linje { "26" } til { "30" })

seg-da57cc7f1aa4 = RF-jamming for navigasjon på månens overflate (J/S per satellitt) er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Nektingskontur på månen med et usikkerhetsbånd fra den målte C/N₀-spredningen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Temaside: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Forrige</s1>lunar-interop-export

seg-02568469f628 = <s1>Neste</s1>lunar-joint-od-clock
