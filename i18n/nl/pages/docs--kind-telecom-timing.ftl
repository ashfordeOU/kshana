# docs--kind-telecom-timing: translations (nl)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariokind van de engine v{ $version }, familie <a1>Klokken, tijdsynchronisatie en holdover</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: één parserlaag die een RINEX-klokbestand (AS/AR-records van één benoemde klok, versies { "2" } en { "3.00" } tot { "3.04" }), een fase- of frequentielog in TimeLab-stijl ASCII, of een TAPR TICC-tijdstempel- of intervallog omzet in een uniforme pha Tests: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Familiepagina: <a1>Klokken, tijdsynchronisatie en holdover</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> De maximale tijdintervalfout en tijdafwijking die de scenariosoort <c1/> rapporteert, op een holdoverregistratie op telecomschaal: een O(n) monotone-wachtrij-schuif. Onafhankelijke referentie (ExternalDataset): allantools { "2024.06" } — een onafhankelijke frequentiestabiliteitsbibliotheek van derden — mtie() en tdev() op tests/fixtures/telecom_timing/holdover_te_series.csv, de reeks aan beide kanten geparseerd uit dezelfde tekst met 17 significante cijfers; de referentie legt de SHA-256 van de reeks vast en is offline te regenereren via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valideert de SCHATTERS op deze registratie, niet de syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Overgenomen limieten van ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC vergrendeld en ePRTC-A-holdover (inclusief de tijdfoutenvelop van Tabel { "3" }. Onafhankelijke referentie (InternalConsistency): Transcriptie van de genoemde aanbevelingen (vrij te downloaden van itu.int), elke limiet met zijn tabel of clausule, vermeld samen met elk onbevestigd of niet-geïmplementeerd onderdeel in docs/TELECOM-TIMING.md; de continuïteitsidentiteiten op de knikpunten die de tabellen impliceren worden in de tests gecontroleerd. Een transcriptie van een norm met interne consistentiecontroles, geen conformiteitstest en geen externe validatie. { "0.30" } ronde { "2" } (vooraf vastgeleg
