# docs--kind-holdover-test: translations (nl)

seg-f42465f7d066 = ns

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-c61e88721556 = Scenariokind van de engine v{ $version }, familie <a1>Klokken, tijdsynchronisatie en holdover</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-849c08d3ce70 = Familiepagina: <a1>Klokken, tijdsynchronisatie en holdover</a1>

seg-73929aeded02 = Bron: <c1/>

seg-218f00012d0e = <c1/> (scenariosoort)

seg-c0924aa36e64 = MODELLED holdovertest van een tijdsynchronisatiesysteem, gescoord uit een tijdfoutregistratie die de OPERATOR aanlevert (een linuxptp-ptp4l-, phc2sys- of ts2phc-log, een chrony-tracking- of -statistiekenlog, een TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren). De test heeft vier stappen en Kshana voert er geen enkele uit: een vergrendelde BASELINE, GNSS VERWIJDERD door de operator (de antennekabel of de simulatoruitvoer; Kshana zendt niets uit en stuurt niets aan) op een vermeld tijdstip, HOLDOVER op de eigen oscillator van het systeem, en RECOVERY nadat de operator GNSS herstelt op een tweede vermeld tijdstip. De registratie wordt op die twee tijdstippen gesplitst. Baseline: tijdfoutstatistieken en de ITU-T-maskers die voor een vergrendelde klok zijn opgesteld. Holdover: statistieken, de fractionele frequentie-afwijking die het systeem hield (een kleinste-kwadratenlijn), de maskers die voor holdover of een autonome klok zijn opgesteld, de ePRTC-A-holdoverenvelop vanaf de vermelde vergrendelde duur, en de tijd tot elk tijdfoutbudget wordt overschreden. Recovery: of en wanneer |TE| binnen een vermelde band kwam en daar bleef, de piek en de grootste stap. Elke limiet is overgenomen uit een openbare ITU-T-tabel (de maskers voor telecomtijdsynchronisatie); de bewoording is 'gemeten tegen het masker', en de twee tijdstippen zijn de verklaring van de operator, niet geverifieerd. Een registratie die te kort is voor een masker is INCOMPLETE, nooit geëxtrapoleerd. Zie docs/TIMING-HIL.md.

seg-cd6d840a1382 = Eén run van <c1/> vat samen als: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Verplichte velden: <c1/>, <c2/>

seg-4792040e4773 = Optionele velden: <c1/>, <c2/>

seg-ad4f9c40e317 = Het voorbeeld <c1/> stelt onder meer in:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Resultaatlabel (van de engine): MODELLED — een holdovertest gescoord uit een tijdfoutregistratie die de operator heeft aangeleverd. Elke limiet is overgenomen uit de genoemde openbare ITU-T-aanbeveling en het resultaat is gemeten tegen het masker; het zegt niets over de vraag of een klok of systeem aan een aanbeveling voldoet, en niemand heeft beoordeeld of goedgekeurd

seg-8ce93392747b = De grafiek die de engine schrijft voor scenarios/holdover-test-ptp4l.toml, soort holdover-test

seg-3361819ae321 = <b>MODELLED</b> De soort <c1/>: een tijdfoutregistratie (een linuxptp-, chrony-, TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren) wordt gesplitst op de twee tijdstippen die de operator opgeeft voor het verwijderen en herstellen van GNSS, in een baseline, een holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> De maximale tijdintervalfout en tijdafwijking die de scenariosoort <c1/> rapporteert, op een holdoverregistratie op telecomschaal: een O(n) monotone-wachtrij-schuif. Onafhankelijke referentie (ExternalDataset): allantools { "2024.06" } — een onafhankelijke frequentiestabiliteitsbibliotheek van derden — mtie() en tdev() op tests/fixtures/telecom_timing/holdover_te_series.csv, de reeks aan beide kanten geparseerd uit dezelfde tekst met 17 significante cijfers; de referentie legt de SHA-256 van de reeks vast en is offline te regenereren via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valideert de SCHATTERS op deze registratie, niet de syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Overgenomen limieten van ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC vergrendeld en ePRTC-A-holdover (inclusief de tijdfoutenvelop van Tabel { "3" }. Onafhankelijke referentie (InternalConsistency): Transcriptie van de genoemde aanbevelingen (vrij te downloaden van itu.int), elke limiet met zijn tabel of clausule, vermeld samen met elk onbevestigd of niet-geïmplementeerd onderdeel in docs/TELECOM-TIMING.md; de continuïteitsidentiteiten op de knikpunten die de tabellen impliceren worden in de tests gecontroleerd. Een transcriptie van een norm met interne consistentiecontroles, geen conformiteitstest en geen externe validatie. { "0.30" } ronde { "2" } (vooraf vastgeleg

seg-142528f34e66 = <b>MODELLED</b> De soort <c1/>: een tijdfoutregistratie (een linuxptp-, chrony-, TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren) wordt gesplitst op de twee tijdstippen d. Onafhankelijke referentie (InternalConsistency): Handberekening op registraties die zijn opgebouwd uit formules waarvan helling, stap, extremum en hersteltijd vóór de run bekend zijn (de tests vermelden ze), en de maskers, envelop en budgetten van de telecom-timing-rijen hierboven. Er is geen laboratoriummeting van een echte holdover gescoord en er is geen externe onafhankelijke referentie vergeleken, dus de soort doet geen enkele bewering over een klok of systeem; een partner met een tijdsynchronisatielab is nodig voordat enige fi per klokklasse

seg-59ff0b0e3d2d = MODELLED — een holdovertest gescoord uit een tijdfoutregistratie die de operator heeft aangeleverd. Elke limiet is overgenomen uit de genoemde openbare ITU-T-aanbeveling en het resultaat is gemeten tegen het masker; het zegt niets over de vraag of een klok of systeem aan een aanbeveling voldoet, en niemand heeft het beoordeeld of goedgekeurd. De tijdstippen waarop GNSS werd verwijderd en hersteld zijn de verklaring van de operator en zijn niet geverifieerd. Advisory sof (resultaat <c1/>)

seg-daeb4ad7aa35 = MODELLED holdovertest van een tijdsynchronisatiesysteem, gescoord uit een tijdfoutregistratie die de OPERATOR aanlevert (een linuxptp-ptp4l-, phc2sys- of ts2phc-log, een chrony-tracking- of -statistiekenlog, een TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren). (soortencatalogus (<c1/>))

seg-ff3008c250cc = ITU-T-maskers voor telecomsynchronisatie met PASS/FAIL en marge zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Een holdovertest gescoord uit een door de operator aangeleverde tijdfoutregistratie is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Onderwerppagina: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Onderwerppagina: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Vorige</s1>gravity-map

seg-e7665ee5e30e = <s1>Volgende</s1>hybrid-optical-rf
