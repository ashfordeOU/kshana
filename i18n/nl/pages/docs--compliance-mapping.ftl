# docs--compliance-mapping: translations (nl)

seg-6555ff9a6d8e = Uitvoer

seg-2247a2344710 = Betekenis

seg-d6476863f862 = Mogelijkheid

seg-ad856ad710eb = Status

seg-8d216d42c776 = Beoordeling van het vertrouwen in ontvangerlogs

seg-ff808ce8ec48 = Alternatieve en diverse PNT-bronnen

seg-3621a68a508c = Reproduceerbare herkomst van runs

seg-50fe2a3ff712 = Integriteitsbewaking en beschermingsniveaus

seg-554a16dc7965 = Bron: <c1/>

seg-76db63e8d2de = Kopers en ontvangerfabrikanten verantwoorden zich tegenover openbare veerkrachtkaders. Deze map koppelt wat { -brand } berekent en vastlegt rij voor rij aan die kaders, en <c1/> vult de koppeling in vanuit de runs die u daadwerkelijk hebt.

seg-e22a3aca9550 = <b>Formulering.</b> De uitvoer van { -brand } <em>levert bewijs voor</em> een eis. Het is geen beoordeling of goedkeuring van enig product, en geen van deze bestanden is een verklaring van een beoordelende instantie; { -brand } is dat ook niet. De tekst van eisen is geparafraseerd en nooit letterlijk overgenomen.

seg-2602c3f5aff6 = Kader

seg-245fe1f87b08 = Bestand

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = IMO-richtsnoer voor GNSS-interferentie bij schepen

seg-f318176b86de = EASA-richtsnoer voor GNSS-interferentie in de luchtvaart

seg-7939ac1eea3b = EU NIS2-richtlijn, artikel { "21" }

seg-f2eccc9b815f = EN { "16803" } (betaalde norm; alleen per deel en met in de catalogus zichtbare clausulenummers)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (januari { "2023" })

seg-499fc17fb83a = <b>Standaardpakketten</b> ({ "0.38" }) maken van een kader scenario's met een score: elk pakket heeft scenario's, drempels die vóór de run zijn vastgelegd en rijen waarvoor het bewijs levert. <c1/> toont ze.

seg-9c0eb89a2fbe = Pakket

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testprofielen voor niveau { "1" } tot { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, PNT-gegevensverwerking aan boord van schepen: nauwkeurigheidsniveaus en integriteit

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, GNSS-interferentie bewaken, beoordelen en beperken

seg-b9387be0e4f1 = Elk bestand somt zijn brondocumenten op met versie, URL, leesdatum en wat wel en niet is gecontroleerd. De bronnen zijn gelezen op 2026-10-09 (het NIST-profiel op 2026-10-18; het EASA-bulletin en de cataloguspagina's van EN { "16803" } zijn opnieuw gecontroleerd op 2026-10-10). Waar een bron alleen via een mirror of een cataloguspagina kon worden gelezen, staat dat in het bestand.

seg-e98e25897176 = Elke test van de drie standaardpakketten met score, uit echte runs van engine v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } gehaald, { "1" } niet gehaald, { "2" } hebben invoer nodig; imo-circ-1575: { "1" } gehaald, { "4" } niet gehaald, { "2" } hebben invoer nodig; icao-doc9849-appf: { "6" } gehaald, { "0" } niet gehaald, { "2" } hebben invoer nodig. In totaal { "13" } gehaald, { "5" } niet gehaald en { "6" } hebben invoer nodig die de engine niet heeft (een ontvangerlog of apparatuurdocumentatie). Elke drempel is vóór de run vastgelegd; een misser blijft een misser. Een gehaalde drempel zegt dat een gemodelleerd scenario een vastgelegde drempel haalde, niets over een product. De pakketten leveren bewijs voor de rijen die ze noemen; ze zijn geen beoordeling. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens; het mag niet de enige basis zijn voor een navigatie- of veiligheidsbeslissing.

seg-092dd691ca17 = Het rapport

seg-10fac3e641e0 = schrijft <c1/> en <c2/> (<c3/> wijzigt de naam). De invoer bestaat uit resultaatbestanden van eerdere runs: een scenariorun schrijft <c4/> naast <c5/>, en <c6/> schrijft een eigen resultaat. De soort van elke run wordt gelezen uit het scenariobestand naast het resultaat, uit de inhoud van een receiver-trust-resultaat of uit een <c7/> op het hoogste niveau, en moet een soort zijn die de engine kent. Een resultaat wordt vermeld als niet gebruikt, met de reden, en telt nergens voor mee wanneer de soort niet te vinden is, geen bekende soort is, of het bijbehorende scenario en de eigen <c8/> van het resultaat niet overeenstemmen. (De <c9/> van het resultaat en een hash van het scenariobestand worden niet vergeleken: de engine berekent de eerste over zijn geparseerde scenario en een bestandshash is over de tekst, dus het zijn verschillende grootheden.)

seg-464351dcdcc3 = <b>Een soortlabel alleen is geen bewijs.</b> Een run telt pas mee voor een mogelijkheid wanneer het resultaat ook de velden bevat die die soort schrijft (een <c1/>-resultaat heeft bijvoorbeeld zijn kwaliteitsmaten en rijen per epoch nodig; een <c2/>-resultaat heeft zijn aantallen samples nodig). De velden staan in <c3/> (<c4/>) en een resultaat waarin er een ontbreekt, telt niet mee. Een hash die niet hexadecimaal is, wordt niet als hash gemeld. Een receiver-trust-resultaat waarvan de aantallen geen gehele getallen zijn, of waarvan het aantal gedetecteerde of overeenstemmende gevallen het aantal beoordeelbare overschrijdt, wordt uitgesloten en als niet gebruikt vermeld.

seg-5a316d97f37b = Voor elke rij geeft het rapport een van de volgende:

seg-2243532bd26b = elke mogelijkheid die de rij noemt, heeft ten minste één run in de set

seg-e905ae20cec1 = sommige wel

seg-e23d6dfc4a00 = geen enkele

seg-cf223ce076ce = geen enkele uitvoer van { -brand } gaat over de rij

seg-ec76997fb4d4 = De kolom met de leemte wordt voor elke rij afgedrukt, ook voor rijen met bewijs: een run die bewijs levert voor een mogelijkheid laat het grootste deel van een eis nog aan ander bewijs over. Het rapport herhaalt de formuleringsregel aan het begin. <c1/> drukt de statische tabellen af en <c2/> de bronnenlijst.

seg-f1c508a908ad = Receiver-trust-runs leveren ook de aantallen die ze vermelden (gedetecteerde gebeurtenissen van de beoordeelbare, overeenstemmende voorspellingen van de beoordeelbare). Die beschrijven die log, beoordeeld aan de hand van gebeurtenissen en toleranties die vóór de run zijn vastgelegd, en worden gemeld zoals de run ze vermeldt.

seg-662b717575e0 = Runsoorten

seg-4377e24c36f5 = vertrouwenstoestand per epoch uit de eigen log van een echte ontvanger, alarmtijden en overeenstemming met gebeurtenissen die vóór de run zijn vastgelegd

seg-766182e85848 = Effecten van jamming op het linkbudget

seg-6bee09017be6 = draaggolf-ruisdichtheid en lock-toestand per satelliet bij een vastgelegde jammergeometrie

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Detectie van spoofing en meaconing

seg-2e4a3355a936 = beslissingen van de detector en onderscheidend vermogen van de detector bij een vastgelegde spoofingaanval

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = beschermingsniveaus, beschikbaarheid ten opzichte van alarmlimieten en resultaten van foutdetectie

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover en coasting

seg-a643345646c3 = groei van de positie- of tijdfout terwijl GNSS wordt geweigerd, ten opzichte van een vastgelegde drempel

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigatie- of tijdsynchronisatieprestaties uit bronnen die onafhankelijk zijn van de primaire GNSS-band

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Veerkrachtscore over bedreigingsensembles

seg-9eef8dd0d9b9 = overlevings- en veerkrachtverhoudingen per bedreigingsvector over een vastgelegd ensemble, met vermelding van de aannames

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = scenario-hash, engineversie en seed in elk resultaat, zodat een run kan worden herhaald

seg-89edc36c3560 = elke run waarvan het resultaat een <c1/> bevat

seg-488aeabdc552 = <s1>Vorige</s1>Een ontvanger tegen een scenario laten draaien

seg-53a872636d5a = <s1>Volgende</s1>Kader voor veerkrachtige PNT van het Amerikaanse DHS
