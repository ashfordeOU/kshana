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

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = Bron: <c1/>

seg-f4dc88ffe6b5 = <c1/> (scenariosoort)

seg-a448b24ded2b = Telecom-tijdsynchronisatie: tijdfout, maximale tijdintervalfout (MTIE) en tijdafwijking (TDEV) van een GNSS-holdover, gecontroleerd aan ITU-T-maskers met een PASS of FAIL en een marge per masker. De invoer is een SYNTHETISCHE HOLDOVER (een oscillatorvoorinstelling -- ocxo, rubidium, cesium of csac, elk met de stabiliteits-, verouderings- en temperatuurcijfers van een benoemd openbaar Microchip-datablad -- plus de tijd van GNSS-verlies, de lengte van de registratie en het steekproefinterval; de vrijlopende klok heeft witte, flicker- en, waar de fit op het datablad dat nodig heeft, random-walk-frequentieruis, lineaire veroudering en een sinusvormige temperatuurterm) of een INGELEZEN REEKS van paren [time_s, time_error_ns] die inline worden gegeven (en, alleen op native builds, een CSV-bestand). Maskers: ITU-T G.8272 (07/2025) PRTC-A en PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabellen 1-2, TDEV Tabellen 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC vergrendeld ({ "30" } ns, Tabellen 1-2) en ePRTC-A holdover (de tijdfoutenvelop van Tabel { "3" } die stijgt van { "30" } ns naar { "100" } ns over de holdoverperiode H die wordt bepaald door de vergrendelde duur, MTIE Tabel { "4" }, TDEV Tabel { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klassen A-C (max|TE|, constante tijdfout, laagdoorlaatgefilterde MTIE en TDEV) en klasse D (max|TE_L| { "5" } ns, het enige cijfer van klasse D dat niet is overgelaten voor verdere studie); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referentiepunt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns met MTIE Tabellen 7-1 tot 7-3). Elk item dat een Recommendation markeert voor verdere studie ontbreekt in plaats van te worden ingevuld, en elk rapport vermeldt wat niet is geïmplementeerd. Rapporteert ook de tijd tot overschrijding van elk budget voor de maximale tijdfout (standaardwaarden: { "100" } ns ePRTC max|TE_HO|, { "400" } ns toewijzing voor holdover in het netwerk, { "1100" } ns punt C, { "1.5" } us klasse { "4" }), de MTIE-/TDEV-curven als CSV-tabel met elke maskerlimiet, en per numeriek veld een vermelding van eenheden en herkomst. VALIDATED: de MTIE- en TDEV-schatters tegen het pakket allantools op een vastgelegde holdoverreeks. MODELLED: de maskertabellen zijn transcripties, en een synthetische holdover is een model dat is opgebouwd uit maxima van het datablad, geen meting van een enkele eenheid. Geen conformiteitstest.

seg-07f81cfd606a = Eén run van <c1/> vat samen als: telecom-timing: max|TE| { "488.2" } ns over { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Het voorbeeld <c1/> stelt onder meer in:

seg-e7cab30ef039 = [] (geen elementen)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Resultaatlabel (van de engine): MODELLED — tijdfout, MTIE en TDEV gecontroleerd aan getranscribeerde ITU-T-maskers. De schatters zijn getoetst tegen allantools; de maskertabellen zijn transcripties van de genoemde Recommendations; een synthetische holdover is een model dat is opgebouwd uit openbare cijfers van datasheets, geen meting van een enkele eenheid. Geen co

seg-ec7745a09d08 = De grafiek die de engine schrijft voor scenarios/telecom-synce-eec.toml, soort telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-c21ebd79f497 = <b>VALIDATED</b> De maximale tijdintervalfout en tijdafwijking die de scenariosoort <c1/> rapporteert, op een holdoverregistratie op telecomschaal: een O(n)-MTIE met schuivend venster en monotone wachtrij (telecom_timing::mtie_sliding, nodig zodat een dag aan samples van één seconde Tests: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Getranscribeerde limieten van ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Tests: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Zeven MTIE- en TDEV-maskers voor wandergeneratie bij constante temperatuur voor de soort <c1/>: G.811 (09/1997) PRC (autonoom), G.812 (06/2004) Types I, II en III, G.8262 (10/2024) EEC Opties { "1" } en { "2" } en G.8262.1 (11/2025) eEEC (vergrendeld

seg-d4bd840708db = <b>MODELLED</b> Vier voorinstellingen — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A hoogwaardige buis) en CSAC (Microchip SA.45s) — elk met . Onafhankelijke referentie (InternalConsistency): de vier genoemde Microchip-datasheets (documentnummers en URL's in elke voorinstelling en in docs/TELECOM-TIMING.md) voor de invoercijfers; de gesloten-vormhelling van de veroudering en de enveloppe-eigenschap van de fit als interne controles. Hoe de cijfers een ruismodel worden — de fit, de vloerregel, de maand van 30 dagen, de lineaire temperatuurlezing — is een modelleringskeuze; geen enkele voorinstelling is een meting van een eenheid. { "0.30" } ronde { "2" }, eenzijdige drempels tegen

seg-cbb39b4105ac = elke eis die de Recommendations markeren als 'voor verdere studie' (klasse D buiten max|TE_L|, ePRTC-B-holdover, T-BC/T-TSC-holdover met beide ingangen verloren, TDEV-netwerklimieten, ePRTC-A-holdover MTIE en TDEV voorbij { "10 000" } s) (resultaat <c1/>)

seg-a70f575aeb21 = hoogdoorlaatgefilterde dynamische tijdfout (dTE_H, G.8273.2 Tabel 7-7 en G.8271.1 clausules 7.3.2-7.3.3) (resultaat <c1/>)

seg-66446247fc49 = de MTIE bij variabele temperatuur van G.8273.2 Tabel 7-6 en de MTIE van holdover met ondersteuning door de fysieke laag van G.8273.2 Tabel 7-10 (resultaat <c1/>)

seg-c1d601b45182 = relatieve tijdfout (cTE_R, dTE_R,L) tussen twee uitgangen (resultaat <c1/>)

seg-6146f857c2df = het pakketfilter met voortschrijdend gemiddelde dat G.8272 en G.8272.1 voor PTP-interfaces vermelden: de reeks wordt behandeld als één puls per seconde tijdintervalfout (resultaat <c1/>)

seg-d5e956023b48 = MODELLED — tijdfout, MTIE en TDEV gecontroleerd aan getranscribeerde ITU-T-maskers. De schatters zijn getoetst tegen allantools; de maskertabellen zijn transcripties van de genoemde Recommendations; een synthetische holdover is een model dat is opgebouwd uit openbare cijfers van datasheets, geen meting van een enkele eenheid. Geen conformiteitstest. (resultaat <c1/>)

seg-f163ae37b8c7 = MODELLED: de maskertabellen zijn transcripties, en een synthetische holdover is een model dat is opgebouwd uit maxima van het datablad, geen meting van een enkele eenheid. (soortencatalogus (<c1/>))

seg-a0ddb65b00af = De klok: de OCXO-voorinstelling (Microchip OX-208-datasheet, Rev 12-1-2021), vrijlopend vanaf het eerste sample met witte, flicker- en (waar de fit dat nodig heeft) random-walk-frequentieruis, gefit aan de maxima van de Allan-deviatie van het datablad, en haar lineaire veroudering. De temperatuur wordt constant gehouden (amplitude { "0" } K), zoals de maskers veronderstellen. (opmerking in het scenariobestand, regels { "12" } tot { "15" })

seg-101dbde1c65b = Themapagina: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Vorige</s1>sweep

seg-8aef86c9aa68 = <s1>Volgende</s1>terrain-nav

seg-5547f1f662d3 = en { "2" } meer in de matrix.
