# docs--kind-clock: translations (nl)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Bron: <c1/>

seg-618393657d01 = <c1/> (scenariokind)

seg-c61e88721556 = Scenariokind van de engine v{ $version }, familie <a1>Klokken, tijdsynchronisatie en holdover</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-78cba87823f7 = Klok-holdover tegenover de specificatie; optioneel Monte-Carlo-ensemble (runs > { "1" }).

seg-dd2ad570a6c9 = Eén run van <c1/> vat samen als: scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

seg-51820163de28 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Optionele velden: <c1/>, <c2/>

seg-807e7c5a2565 = Het voorbeeld <c1/> stelt onder meer in:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC-datasheet sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Optische strontiumroosterklok, op de ruimte gericht doel sigma_y

seg-0cd8dc81045c = { "4" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-cb0b7da83f5c = De grafiek die de engine schrijft voor scenarios/clock-ensemble.toml, kind clock

seg-5b3dbe0aed82 = <b>MODELLED</b> De optionele sectie [integrity] van het kind clock (clock_integrity::run): vanuit een vermelde locatie en constellatievoorinstellingen (geometry::sky_geometry), bij elk integriteitstijdstip zolang de GNSS-tijdlijn niet geweigerd wordt, snapshot-RAIM (raim::snapshot_ Tests: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: één parserlaag die een RINEX-klokbestand (AS/AR-records van één benoemde klok, versies { "2" } en { "3.00" } tot { "3.04" }), een fase- of frequentielog in TimeLab-stijl ASCII, of een TAPR TICC-tijdstempel- of intervallog omzet in een uniforme pha Tests: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input met de formaten ptp4l, phc2sys, ts2phc, chrony-tracking en chrony-statistics: de gelogde offset van een linuxptp-servoregel (ns, de eigen tussen haakjes geplaatste tijdstempel van de regel, metingen voordat de servo voor het eerst s2 meldt weggelaten a

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/gemodificeerde/Hadamard-deviatie + machtswetruisidentificatie met χ²-betrouwbaarheidsintervallen. Onafhankelijke referentie (ExternalDataset): NIST SP { "1065" } (Riley) / referentiedeviaties van Stable32 op NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klokondersteunde χ², RAIM, AGC, SQM, per tijdstip gefuseerde veiligheidskwaliteitsmaat. Onafhankelijke referentie (ExternalDataset): TEXBAT-scenarioparameters (Humphreys { "2012" }) — karakterisering, geen vastgezette vectoren. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op JammerTest { "2024" } (Bleik; GPL-3.0-data) gaven de monitors op waarnemingsniveau (klokondersteunde chikwadraat, RAIM, oplossingsfout) geen alarm binnen { "10" } s van een van de { "8" } evalueerbare gepubliceerde spoofingbegintijden (waar het venster vóór het begin schoon was, kwam het eerste alarm { "10.2" } tot { "39" } s na de pu

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofingdetectie is MODELLED, niet extern getoetst: een deelclaim wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Familiepagina: <a1>Klokken, tijdsynchronisatie en holdover</a1>

seg-ee7dd15019d0 = Onderwerppagina: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Onderwerppagina: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Vorige</s1>cislunar-observability

seg-aba9395185fa = <s1>Volgende</s1>combined-altpnt

seg-d1beb62cf742 = { "6" } meegeleverde scenario's gebruiken deze soort; de andere staan in <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> De soort <c1/>: een document met fasen, elk een van acht geregistreerde soorten, in volgorde uitgevoerd, waarbij de 6x6-covariantie, de klok en het referentiestelsel worden doorgegeven volgens een vermelde regel (<c2/>; <c3/>, witte versnellingsruis over een vermelde onderbreking Tests: <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = en { "1" } meer in de matrix.
