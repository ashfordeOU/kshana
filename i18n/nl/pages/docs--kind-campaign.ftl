# docs--kind-campaign: translations (nl)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Bron: <c1/>

seg-24ce6aee5e53 = <c1/> (scenariokind)

seg-931a3d27c0f0 = Scenariokind van de engine v{ $version }, familie <a1>Campagnes</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-a07990e776cb = Campaign: bestaande scenariokinds samengesteld tot één run, waarbij elk getal uit een echte run van het genoemde kind wordt gelezen. Vier secties, in willekeurige combinatie. PHASES: een geketende missie op één gedeelde tijdlijn -- elke fase draait één of meer scenario's (bijvoorbeeld jamming, dan spoofing, dan een klok in holdover met een traagheidsnavigatiesysteem dat ernaast doorvaart, dan een integriteitsalarm, dan herstel), hun uitvoer wordt via een voorinstelling per kind of via expliciete resultaatpaden in benoemde kanalen gelezen (klokfout tegenover zijn bewaakgrens, draaggolf-ruisdichtheidsverhouding tegenover de volgvloer, beschermingsniveau tegenover de alarmgrens, positiefout, volgende satellieten, alarmvlaggen) en met een zero-order hold herbemonsterd op een gemeenschappelijk raster, met fasegrenzen en gebeurtenissen; de toestand wordt doorgegeven door carry (een kanaal gaat door vanaf de eindwaarde van de vorige fase), handoff (een getal van een vorige fase wordt in het scenario van deze fase geschreven) en end_at (een fase eindigt op een tijdstip dat een run berekende, zoals de detectietijd van een spoofingmonitor). SWEEP: een raster over één tot drie gepunte scenariosleutels van elk kind (een geheeltallig segment indexeert een array van tabellen, zoals in system.2.sisre_m), met metrieken gelezen via resultaatpad en, bij meer dan één run, een geseede Monte-Carlo-ensemble bij elk knooppunt. MONTE_CARLO: realisatie k draait op base_seed + k; elke metriek rapporteert gemiddelde, standaardafwijking, nearest-rank-percentielen 5/50/95 en een bootstrap-betrouwbaarheidsinterval van { "95" }% op het gemiddelde met vaste seed. COMPOSE: meerdere scenario's onder gedeelde waarden (het vermogen en de positie van één jammer geschreven in een maritieme en een wegontvanger), met een gecombineerde beste/slechtste samenvatting. Het resultaat draagt een campagnehash, een digest over elk lidresultaat en een units-vermelding voor elk uitgegeven getal; de interoperabiliteitsexports schrijven elk lidscenario dat geometrie heeft als eigen bestandsset. Compositie-identiteiten worden getest: een campagne met één fase reproduceert de zelfstandige run bit voor bit, een ensemble met vaste seed is byte-stabiel, en bij een klok met witte frequentieruis valt het ensemblegemiddelde binnen het gerapporteerde interval met een spreiding die overeenkomt met sqrt(q_wf * tau). MODELLED: de additieve carry en de zero-order hold zijn modelleringskeuzes, en elke fase draagt het label van het kind dat haar draaide.

seg-05e842f80dbb = Eén run van <c1/> vat samen als: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep van <c2/>: { "13" } knooppunten over [jammer_power] | { "13" } lidruns (MODELLED)

seg-bf339fa14645 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Het voorbeeld <c1/> stelt onder meer in:

seg-c4f955d5f506 = beschikbaarheid

seg-7bcf77278958 = { "22" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Resultaatlabel (van de engine): MODELLED samenstelling van bestaande scenariokinds. Elk getal wordt gelezen uit een echte run van het genoemde kind; de ketening (additieve carry van een kanaal over een fasegrens, zero-order hold op het tijdlijnraster, een fase die op een berekend tijdstip eindigt) is een modelleringskeuze, en elke fase draagt het labe

seg-b2c7cd1f9712 = De grafiek die de engine schrijft voor scenarios/campaign-sweep-jammer-power.toml, kind campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect en de campagnerunner: een optionele [monitors]-tabel draait de IQ-monitors op elke cel in de enkele pass van de runner. Tests: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) en iq::campaign::report::rocs: elke cel van een campagne met monitors bewaart, per alarmsoort en kanaal, het maximum van de eigen toetsstatistiek van de monitor over elk vermeld gebeurtenisvenster (positief) en over t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) en <c1/> op <c2/>, Python <c3/> en het MCP-labfit-hulpmiddel (alleen campagnemappen binnen zijn werkmap): leest een uitvoermap van <c4/> op zijn Tests: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> De fasen van het kind <c1/>: elke fase draait één of meer scenario's van bestaande kinds via run_toml, leest hun uitvoer in benoemde kanalen (klokfout en bewaakgrens, gemiddelde effectieve draaggolf-ruisdichtheidsverhouding en volgvloer, v Tests: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = en { "4" } meer in de matrix.

seg-cc2ad9e12064 = <b>MODELLED</b> J/S-linkbudget uit geometrie, anti-jam-C/N₀, verlies van lock per satelliet. Onafhankelijke referentie (InternalConsistency): De linkbudgetvergelijking voor anti-jam-C/N₀ is gecontroleerd tegen een onafhankelijke numpy-herafleiding (deelt dezelfde gesloten vorm → InternalConsistency) plus een karakterisering van de C/N₀-degradatie in de echte JammerTest-2024. { "0.30" } round { "2" }, geblokkeerd (blijft MODELLED): de gemeten JammerTest { "2024" }-C/N0-daling tegenover een linkbudgetvoorspelling (vooraf vastgelegd 6a66994b, binnen { "3" } dB) is niet uitgevoerd omdat de antennepositie en -richting van F8.1 at

seg-59afd80736c5 = <b>PARTNER</b> Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-fa3ad6babe54 = <b>MODELLED</b> De sweep van het kind <c1/> (één tot drie gepunte sleutels van elk kind, op de aswaarden van de generieke sweep, optioneel een ensemble bij elk knooppunt) en de sectie monte_carlo. Onafhankelijke referentie (InternalConsistency): De gesloten vorm van de fase-randomwalk onder witte frequentieruis, variantie q_wf tau (NIST Technical Note { "1337" }), voor de statistiekmachinerie, en byte-gelijkheid met de zelfstandige runs voor de seeding. Het controleert de ensemblerekenkunde op het eigen klokmodel van de engine, geen externe dataset

seg-c15b5ac32282 = MODELLED samenstelling van bestaande scenariokinds. Elk getal wordt gelezen uit een echte run van het genoemde kind; de ketening (additieve carry van een kanaal over een fasegrens, zero-order hold op het tijdlijnraster, een fase die op een berekend tijdstip eindigt) is een modelleringskeuze, en elke fase draagt het label van het kind dat haar voortbracht. (resultaat <c1/>)

seg-9e33dcc39c27 = MODELLED: de additieve carry en de zero-order hold zijn modelleringskeuzes, en elke fase draagt het label van het kind dat haar draaide. (kindcatalogus (<c1/>))

seg-adcc6ea59840 = MODELLED: zoals het kind <c1/> dat is. (opmerking in het scenariobestand, regel { "14" })

seg-143f3f1cc521 = Jamming-veerkracht bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Parametersweeps en geseede Monte-Carlo-ensembles over elk scenariokind is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Familiepagina: <a1>Campagnes</a1>

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Onderwerppagina: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Vorige</s1>body-pnt

seg-fadd92303a4d = <s1>Volgende</s1>cislunar-arc-recovery
