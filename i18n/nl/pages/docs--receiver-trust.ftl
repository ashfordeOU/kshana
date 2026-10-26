# docs--receiver-trust: translations (nl)

seg-2247a2344710 = Betekenis

seg-adc34608c46b = Klasse

seg-fdbb9db68f1d = geen

seg-f63dd3d7aad4 = Bron

seg-98151954f217 = false

seg-c353e7bec219 = Sleutel

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Standaard

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Vertrouwensscore over één synthetische overtocht, uit een echte run van engine v{ $version } op examples/maritime-trust (een verzonnen NMEA-log van een veerboot op de route Tallinn-Helsinki, { "3001" } epochs bij { "1" } Hz). Drie banen delen één tijdas. Boven: de afstand tussen de positie die de ontvanger meldt en de werkelijke positie van het vaartuig, die tot ongeveer { "1576" } s binnen enkele meters blijft, wanneer de gescripte positie-drag-off van het log haar wegtrekt, terwijl de ontvanger een geldige positiebepaling blijft melden. Midden: de vertrouwensscore van { "0" } tot { "100" }, niet berekend tijdens de eerste { "300" } s kalibratie, in de band nominal (ten minste { "90" }) tot aan de drag-off, daarna dalend door de band degraded (ten minste { "55" }) naar de band untrusted. Onder: de band van elke epoch als een gekleurd lint met zijn naam. De score is adviserend. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig. Het log is verzonnen om het formaat en de monitors te tonen; het is geen meting en zegt niets over hoe enige ontvanger zou presteren.

seg-7000c522cc93 = De eigen spoofingvlag van de ontvanger gezet naast de alarmen van Kshana, uit een echte run van engine v{ $version } op een verzonnen UBX-log ({ "200" } epochs met { "1" } Hz). C/N0 daalt { "20" } dB bij { "80" } tot { "90" } s en { "120" } tot { "130" } s; de ontvanger vlagt { "120" } tot { "130" } s en { "160" } tot { "165" } s. Van { "140" } epochs die na kalibratie zijn vergeleken, vlagden { "11" } beide, { "6" } alleen de ontvanger, { "11" } alleen Kshana en { "112" } geen van beide. Geen van beide kanten is de referentie en overeenstemming is geen validatie. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-caadaad98cf6 = Bron: <c1/>

seg-4f10c2397fcc = Ontvangervertrouwen: een echt GNSS-ontvangerlogboek beoordelen

seg-2596bdcdaf8e = <c1/> leest een logboek van een echte ontvanger voor het global navigation satellite system (GNSS), draait er epoche voor epoche vertrouwensmonitors overheen en zegt wanneer en waarom de positiebepaling van de ontvanger niet langer te vertrouwen was. Het kan het logboek ook scoren aan events en voorspellingen die u <b>vóór</b> de run vastlegt: of elk event op tijd is gedetecteerd, en of een gemodelleerde daling van de draaggolf-ruisdichtheid (C/N0) overeenkomt met wat de ontvanger heeft gemeten.

seg-63f24d5f2d5e = De waarneembare grootheden zijn die van de ontvanger zelf; de monitors en hun drempelwaarden zijn die van de engine en van u. Elk resultaat draagt dat label, de SHA-256 van het logboek en elke drempel waarmee het draaide, zodat een run kan worden herhaald en geauditeerd.

seg-6f5014b93fbc = Voor een vaartuig onderweg, met een live score en een optionele gate voor een kaartsysteem, zie <a1><c1/></a1>.

seg-82cdabb6086f = Dit schrijft <c1/>, <c2/> (één rij per epoche) en <c3/> (gemiddelde C/N0 over de tijd met de vertrouwenstoestand eronder) naast het scenario, en drukt een oordeel van één regel af. Het voorbeeldlogboek is synthetisch, gemaakt om het formaat te tonen; wijs <c4/> naar het logboek van uw eigen ontvanger.

seg-ec2be1ea73f5 = De figuur hierboven is de vaartuigdemo van <a1><c1/></a1>: een verzonnen logboek, een adviserende score.

seg-0f24c5cf4b9b = Hetzelfde scenario draait vanuit Python (<c1/>), vanuit het WebAssembly-pakket (<c2/>, met het logboek inline) en vanuit het hulpmiddel <c3/> van de Model Context Protocol-server (MCP).

seg-1f3cc12b6230 = Logboeken die het leest

seg-23fd4a5bf5dd = Wat wordt gelezen

seg-2e1a655cf846 = u-blox binair

seg-cb31da7b7d88 = NAV-SAT C/N0, elevatie en azimut per satelliet, NAV-PVT-positie, MON-RF automatische versterkingsregeling (AGC) en de jammingindicator <c1/>, NAV-TIMEGPS-week, en de eigen vlaggen van de ontvanger: NAV-STATUS <c2/> en SEC-SIG (<c3/>, zie <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = RINEX { "3" }-waarnemingsbestand

seg-57708a636148 = <c1/>-codes (C/N0) per satelliet en signaal; met een bestand met uitgezonden navigatiegegevens (<c2/>) de pseudoranges voor de eigen positiebepaling van de engine

seg-176c2493782e = Android GnssLogger-CSV

seg-d69b9dd6ebad = <c1/>-rijen: C/N0 en <c2/> per satelliet; <c3/>-rijen: positie

seg-d390120374a9 = NMEA { "0183" }-tekst

seg-9eb885aa79af = GSV-signaal-ruisverhouding per satelliet (dB-Hz, met of zonder het signaal-ID van { "4.10" }) en zijn elevatie en azimut, GSA-dilution of precision en gebruikte satellieten, GGA- en RMC-tijd en -positie

seg-7864926ce37e = Septentrio binair ({ "0.38" }, alleen lezen)

seg-44675c4bdf40 = PVTGeodetic-positie, MeasEpoch C/N0 per satelliet en signaal, RFStatus-aantal banden; zie <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = RTKLIB-oplossingsbestand (<c1/>)

seg-37d28ca5ed00 = tijd, positie (breedte-/lengtegraad of ECEF, omgerekend) en gebruikte satellieten per epoche; bestanden met graden-minuten-seconden worden met een bericht geweigerd

seg-5e10ecb93f96 = ASCII- of binaire logboeken van NovAtel OEM7

seg-a630fbcf7425 = <c1/>-positie (alleen een berekende oplossing), <c2/> C/No per satelliet en signaal; <c3/>-jammervlaggen worden de <c4/> van de epoche (jammingtoestand { "2" } wanneer de ontvanger een jammer vlagt, { "1" } wanneer niet; in RXSTATUS bestaat geen spoofingvlag), afgezet tegen de alarmen van Kshana door de vergelijking <c5/>

seg-d4735b581cbf = Monitor- en PVT-monitorstromen van GNSS-SDR als JSON-regels

seg-053235d67fb3 = C/N0 per kanaal, positiebepaling, gebruikte satellieten, HDOP, azimut en elevatie; gemaakt door <c1/>

seg-2e9033aa4e9d = Details, bronnen en beperkingen van deze drie: <a1><c1/></a1>.

seg-8987b2c46eb0 = Elke epoche die de lezers produceren draagt ook <c1/>, <c2/> byte-offsets in de invoer: het kleinste aaneengesloten bereik met de records die eraan hebben bijgedragen, zodat het exacte ruwe segment voor een eventvenster kan worden gehasht. NMEA: elke regel die wordt gelezen terwijl de epoche actueel is (een superset wanneer een niet-gerelateerde regel tussen haar zinnen staat). UBX: de frames van de epoche. RINEX { "3" }: de epocherecords van elke <c3/>-regel tot de volgende. Android: de <c4/>-rijen van de epoche (een <c5/>-rij alleen voor een epoche zonder <c6/>-rijen). Afwezig bij een live stroom en overal waar het niet goed gedefinieerd is (RINEX { "2" }).

seg-cea9532b57a2 = Het bestand komt binnen via <c1/> (opgelost ten opzichte van de eigen map van het scenario), of inline als <c2/> of <c3/> (de enige keuzes in een browser).

seg-3bc4f9c91950 = Een IMU-logboek als tweede sensor

seg-49b10ad5928e = <c1/> voegt een traagheidslogboek toe op dezelfde klok:

seg-9e0560b09f5a = De giersnelheid wordt geïntegreerd uit <c1/> en vult de koers overal waar het ontvangerlogboek er geen bevat, zodat de monitor <c2/> (die <c3/> op het platform nodig heeft) de gyrokoers vergelijkt met de koers over de grond. Een gyro drijft: de koers is slechts zo goed als het integratievenster en <c4/> bepaalt wat als verschil telt. De indeling <c5/> is gedocumenteerd in <c6/>. De IMU-bytes maken deel uit van de scenario-hash en van de scenario-hash van een bewijspakket. Inline (<c7/>/<c8/>) werkt op elk oppervlak; een <c9/> wordt geweigerd waar geen bestanden worden gelezen.

seg-fd3e6ef1cd93 = Platform: statisch of vaartuig

seg-b67c0d57dc1d = De monitors hierboven gaan uit van een vaste antenne. Een scenario legt het platform vóór de run vast in een tabel <c1/> op het hoogste niveau; zonder die tabel is het platform <c2/> en verandert er niets.

seg-3d6bc18bd83e = Waarom die waarde

seg-32f339f63acf = Boven de dienstsnelheid van koopvaardijschepen en de meeste passagiersvaartuigen, zodat een echt vaartuig haar nooit bereikt; ver onder de snelheid die een positie-drag-off impliceert. Een langzamer vaartuig moet een lagere limiet opgeven: hoe lager de limiet, hoe eerder een drag wordt opgemerkt.

seg-9506e8601857 = Een groot schip verandert van snelheid met ruim minder dan { "0.1" } m/s²; een klein snel vaartuig haalt enkele tienden bij een harde gaswisseling.

seg-b0b6baaee456 = Een groot schip draait met ruim minder dan { "1" } deg/s en een klein vaartuig in een scherpe bocht met enkele.

seg-53d0fffb3c09 = Een eigenschap van de installatie; een gok zou een verborgen drempel zijn.

seg-ac48403443f9 = Gedeclareerd <c1/> en afwezig in het logboek is een fout, zodat een ontbrekende sensor niet als een schone controle kan doorgaan.

seg-8266739dc26b = De vaartuigsleutels worden onder <c1/> geweigerd. Voor een vaartuig draait de monitor <c2/> niet, omdat die de afstand tot het kalibratiegemiddelde meet, wat op een bewegende antenne onjuist is; de <c3/> van het resultaat legt het platform en de gebruikte limieten vast.

seg-7551792a0cb4 = De synthetische NMEA-stromen van <a1><c1/></a1>, gemaakt voor bemanningstraining, worden door de NMEA-lezer geaccepteerd en kunnen net als elk NMEA-logboek door dit type worden gehaald.

seg-18d7538bc56d = Monitors

seg-e5c1cb89f0b3 = Elke monitor heeft zijn eigen gegevens nodig; een monitor waarvan de gegevens niet in het log staan, wordt niet uitgevoerd en niet vermeld in <c1/>. De eerste <c2/> seconden (standaard { "60" }) leggen de basislijn vast en geven nooit alarm.

seg-3be9ee05f087 = Alarm wanneer

seg-98ead58c671d = Vereist

seg-f6e6df453260 = de gemiddelde C/N0 over de satellieten die met de basislijn gemeenschappelijk zijn, daalt met <c1/> of meer (standaard { "6" } dB)

seg-d9bf6efc6835 = het aantal gevolgde satellieten daalt <c1/> of meer onder de mediaan van de basislijn (standaard { "4" })

seg-60c7a99f9819 = de AGC-waarde wijkt meer dan <c1/> standaardafwijkingen af van haar basislijn (standaard { "5" })

seg-7c1c65e64418 = UBX MON-RF of Android <c1/>

seg-a5a5252417cb = u-blox <c1/> overschrijdt <c2/> (standaard { "80" } van { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = de eigen positiebepaling van de ontvanger ligt meer dan <c1/> van haar kalibratiegemiddelde (standaard { "50" } m)

seg-6a3fec1214b9 = een gerapporteerde positie

seg-4c05faf783eb = pariteits-RAIM (receiver autonomous integrity monitoring) op de eigen enkelpuntspositiebepaling van de engine verwerpt de meetset

seg-037ab193613c = RINEX-log met <c1/>

seg-8890a4ebf231 = de enkelpuntspositiebepaling van de engine mislukt bij vijf of meer satellieten

seg-0a5a708ac75b = de ontvangerklok wijkt van haar voorspelde lijn af met meer dan de minimaal detecteerbare afwijking van haar kalibratieruis

seg-31b64b635261 = Gekalibreerd profiel (op aanvraag).

seg-a73f2c2dfc9a = <c1/> vervangt de drie interferentiedrempels door waarden die zijn gekalibreerd op de openbare JammerTest { "2024" }-dataset (één u-blox ZED-F9P per scenario; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. De kalibratie was vooraf vastgelegd (<c5/>) en het profiel is MODELLED, gefit op één openbare campagne: de drempel <c6/> <b>haalde de vooraf vastgelegde drempel voor achtergehouden valse alarmen niet</b> ({ "0.0231" } tegenover { "0.02" }); de drempels voor AGC en de jamming-indicator en de unie-drempel (valse alarmen { "0.033" }, detectie { "0.81" }) werden gehaald (<c7/>). Het geldt voor dat ontvangertype bij die gebeurtenis, tegen geplande aanvalsvensters, en is gekalibreerd op de CSV-logs van de dataset (de UBX-logs geven meer valse alarmen in twee mappen). Een resultaat van een run met het profiel herhaalt de toegepaste drempels en bevat een <c8/> waarin dit alles staat. Zonder het profiel gelden de standaardwaarden hierboven en blijft elke uitvoer ongewijzigd.

seg-1fa8c4bd1a18 = Voor een <c1/>-platform worden ook de monitors voor bewegende platforms uitgevoerd (drempels in een <c2/>-tabel op het hoogste niveau, elke standaardwaarde gedocumenteerd in <c3/>); elk heeft zijn eigen gegevens nodig en wordt alleen in <c4/> vermeld als het een besluit heeft genomen:

seg-4b2840d9d0af = de positieverandering komt niet overeen met de gerapporteerde snelheid en koers, of impliceert een snelheid, versnelling of draaisnelheid boven de grenzen van het vaartuig

seg-656c19cb5b52 = positiebepalingen; snelheid en koers (RMC of VTG) voor het dead-reckoning-deel

seg-cedefd52998d = de gyrokoers en de koers over de grond verschillen met meer dan <c1/> (snelheid boven <c2/>)

seg-c66704cbdd02 = HDT-, THS- of VHW-koers, <c1/>

seg-1bbbf0033234 = de snelheid door het water en de snelheid over de grond verschillen met meer dan <c1/>

seg-c9101740b235 = VHW of VBW, en snelheid over de grond

seg-42ac59072099 = de GGA-hoogte verschilt met meer dan <c2/> van <c1/>

seg-811ec460249c = GGA-hoogte, <c1/>

seg-854ea9c26df4 = de spreiding van de C/N0 over de satellieten daalt tot <c1/> van haar kalibratiemediaan

seg-837fc4cb832c = de C/N0 van de gemeenschappelijke satellieten steeg gemiddeld met <c1/> en <c2/> van hen steeg

seg-faae07674361 = opeenvolgende epochetijden springen onregelmatig, lopen achteruit of wijken af van de hostklok

seg-f799a53897ed = NMEA-tijd; hostklok voor het laatste deel

seg-ee4913c9f2ed = de ontvanger meldt een OSNMA-authenticatiefout (een gerapporteerde status wordt gelezen; er wordt niets geverifieerd; zie <a1>docs/OSNMA.md</a1> om OSNMA te verifiëren aan de hand van de I/NAV-pagina's zelf)

seg-3fad5fcde4dc = <c1/>-statuszin

seg-ce072f2ebb6c = Een epoche is <b>onbetrouwbaar</b> wanneer RAIM, de klokmonitor, een mislukte oplossing of een positiesprong alarm geeft, of de C/N0-daling tweemaal haar drempel bereikt; <b>gedegradeerd</b> bij elk ander alarm; en <b>nominaal</b> in de overige gevallen.

seg-4124ff6013a0 = Het enginepad (<c1/>, <c2/>, <c3/>) is dezelfde berekening als de JammerTest { "2024" }-spoofingreferentie in <c4/>: <c5/> controleert dat bij alle acht gepubliceerde begintijden het eerste alarm op dezelfde epoche valt en van dezelfde soort is.

seg-83be3c22a577 = Vertrouwensscore (vaartuigplatform)

seg-812991f245cd = Voor een vaartuig krijgt elke epoche na de kalibratie ook een score van { "0" } tot { "100" } en de redenen waarom die niet { "100" } is. De afbeelding is deterministisch en vastgelegd voordat een log wordt gescoord: niets wordt geleerd, niets wordt gefit aan gebeurtenissen. Elke monitor herleidt zijn bewijs tot een verhouding <c1/> (een alarm bij { "1" } of meer); een verhouding kost de score

seg-ada5a0a52315 = zodat een monitor niets kost zolang hij onder <c1/> van zijn drempel blijft (standaard { "0.5" }), de helft van zijn gewicht bij zijn drempel, en alles bij <c2/> maal de drempel (standaard { "1.5" }); de score is niet-stijgend in elke statistiek. Een bron die op een epoche niets rapporteert, behoudt zijn laatste statistiek gedurende <c3/> (standaard { "10" } s: twee cycli van een C/N0-zin die elke { "5" } s wordt verzonden), zowel als alarm als als aftrek.

seg-6c06de24ebfe = De afronding is naar boven vanaf de helft (<c1/>), de band is die van de afgeronde score en de begrenzing komt vóór de afronding. Alleen monitors met punten boven nul staan in de aftrekposten, met hun verhouding en onafgeronde punten, de meeste punten eerst; aftrekposten met gelijke punten staan in de volgorde van de monitornamen <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Een monitor waarvan de test slaagt of faalt (een mislukte oplossing, een mislukte authenticatie) krijgt de verhouding { "1.5" }, het volledige gewicht. De vermelde punten zijn die vóór de begrenzing op { "0" }.

seg-e36961d46c41 = Gewicht (punten)

seg-673f6adcd681 = Waarom

seg-399be3301faf = een authenticatiefout is een vaststelling, geen statistiek

seg-69cfc61477d6 = een vervalste positie moet de natuurkunde of de eigen controles van de ontvanger tegenspreken, en de tijd kan niet achteruitlopen; één overtreding op volle sterkte ({ "1.5" } maal haar drempel: { "60" } punten, score { "40" }) is onbetrouwbaar, en bij haar drempel ({ "30" } punten, score { "70" }) gedegradeerd

seg-7fa1e6e67411 = één onafhankelijke sensor die afwijkt is gedegradeerd; twee op volle sterkte zijn onbetrouwbaar

seg-4c4825d2957a = de signaalomgeving, of een zwak informatieve controle

seg-b5a364a03714 = de omgeving is vijandig; dat alleen toont niet aan dat de positiebepaling fout is

seg-4e3749965405 = tot { "15" }, <c1/>

seg-1e595dbcf96f = geen gewicht op deze helling: niets tenzij de hemel slecht is, dan tot <c1/> ({ "15" }); geometrie alleen bereikt gedegradeerd, nooit onbetrouwbaar, en geeft geen alarm (zie "Geometrie" hieronder)

seg-9902ca062070 = De bandgrenzen volgen uit de gewichten: de lichtste monitor die alarm geeft kost { "12.5" } punten bij zijn drempel, dus elk alarm verlaat de nominale band; geen enkele monitor onder { "60" } punten kan de onbetrouwbare band alleen bereiken (meerdere samen wel). Het resultaat legt het scoremodel vast (<c1/>) en elke epoche bevat <c2/>: welke monitors hebben afgetrokken, hun verhoudingen en hun punten. Voor een vaartuig is de toestand van de epoche de band van haar score.

seg-6f620668ee85 = Geometrie: natuurlijke degradatie los van aanvalsachtige inconsistentie

seg-93257d87e0d4 = Een ontvanger naast een kadekraan, in een sluis of onder een hoge romp verliest satellieten en zijn positiebepaling wordt slechter om een reden die geen aanval is. Vanaf { "0.36" }, volgens de ontwerpnotitie over geometrie (<c1/>, sectie { "4" }), bevat elke epoche haar <b>satellietgeometrie</b>, heeft de score van een vaartuig een <b>geometriemonitor</b> en draagt elke aftrekpost een <b>klasse</b>: <c2/> (de hemel), <c3/> (de signaalomgeving) of <c4/> (aanvalsachtig bewijs).

seg-17d13c39b5aa = <b>Waar de geometrie vandaan komt.</b> De elevatie en azimut van elke gevolgde satelliet (NMEA GSV, UBX NAV-SAT), waaruit de dilution of precision (DOP) wordt afgeleid met de ene DOP-kernel van de engine (<c1/>, VALIDATED tegen gnss_lib_py): <c2/>. Bij ontstentenis daarvan de DOP en de gebruikte satellieten die de ontvanger opgeeft (NMEA GSA): <c3/>. Hemelposities en GSA tellen mee voor de <c4/> van de score (standaard { "10" } s), omdat veel bussen GSV om de paar seconden verzenden; een GSV-set die in een epoche onvolledig is (het einde van een fragment, een verloren zin) wordt niet gebruikt. Een log met geen van beide, zoals NMEA met alleen GGA en RMC, of Android- en RINEX-logs op dit moment, krijgt de status <b><c5/></b> met de opmerking "geometry unknown": de engine raadt geen geometrie die hij niet heeft gekregen, en de geometriemonitor wordt niet uitgevoerd.

seg-a267da42ac3d = genoeg satellieten en een DOP binnen de drempels

seg-dabcd392914a = een of meer redenen: <c1/>, <c2/>, <c3/>, en (informatief, niet in de score) <c4/> wanneer elke gevolgde satelliet in één helft van de horizon staat

seg-c255a66d3813 = het log geeft voor deze epoche geen satellietgeometrie

seg-0a50145c2bfa = De status is beschrijvend en het label (hieronder) is wat voor de score telt: <c1/> omvat het informatieve geval <c2/>, dat kan voorkomen bij goede of redelijke DOP, en alleen een label <c3/> wordt gescoord.

seg-93e49a562493 = <b>Het label</b> (altijd gerapporteerd, nooit gescoord). Het <c1/> van elke epoche is <c2/> (HDOP hoogstens <c3/> { "2" }, PDOP hoogstens <c4/> { "3" } en ten minste <c5/> { "6" } satellieten), <c6/> (HDOP boven <c7/> { "4" }, PDOP boven <c8/> { "6" } of minder dan <c9/> { "5" } satellieten), <c10/> daartussen, of <c11/>. De opmerking van de epoche begint altijd met het label en de getallen, bijvoorbeeld "geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)", en voegt ", signal loss" toe wanneer dat geldt.

seg-13838e036fae = <b>De geometriemonitor</b> (vaartuigscore). Hij trekt <b>niets af tenzij de geometrie slecht is</b>: zijn verhouding is <c1/>, en zolang die hoogstens { "1" } is (goede of redelijke geometrie, een open hemel met alleen GPS en { "8" } satellieten inbegrepen) kost hij niets, zodat zo'n log precies scoort als in { "0.35" }. Boven { "1" } loopt de aftrek lineair op tot <c2/> ({ "15" }) bij <c3/> ({ "1.5" } maal de drempels: HDOP { "6" }, PDOP { "9" }, { "3" } satellieten): { "7.5" } punten bij verhouding { "1.25" } (HDOP { "5" }, of { "4" } satellieten), { "15" } vanaf { "1.5" } (score { "85" }, gedegradeerd). Op zichzelf kan hij de score nooit onder <c4/> brengen (standaard: de <c5/> van de score, { "55" }), zodat geometrie alleen hoogstens de gedegradeerde band bereikt en nooit de onbetrouwbare: het geldende maximum is <c6/>, zodat een <c7/>-tabel die <c8/> verhoogt (bijvoorbeeld een { "0.35" }-tabel met <c9/> { "90" }) het maximum verlaagt tot <c10/> in plaats van te worden geweigerd, en een <c11/> onder <c12/> wordt geweigerd. De monitor geeft geen alarm; hij staat als laatste in <c13/> wanneer hij op enige epoche een besluit heeft genomen (een vaartuig waarvan het log de geometrie geeft), en telt niet mee in de identiteit met { "0.35" }; hij is geen item van <c14/> (er een instellen wordt geweigerd), en het geldende maximum en de geldende ondergrens worden vastgelegd in <c15/> en <c16/>. De opmerking van een slechte epoche zegt waarom, bijvoorbeeld "geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency".

seg-2082f4ccb250 = <b>Klassen.</b> Elke aftrekpost (<c1/>):

seg-4197bc517f73 = <c1/> (slechte geometrie); <c2/> wanneer elke satelliet die ten opzichte van de kalibratiebasislijn verloren ging bij zijn laatste rapport onder <c3/> stond

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, anders <c6/>; <c7/> tijdens signaalverlies (hieronder)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; en <c11/> wanneer de geometrie slecht is en de opgegeven HDOP niet overeenkomt met de opgegeven hemel (hieronder)

seg-1b5e88a4aae4 = <b>De bescherming tegen een vervalste slechte hemel.</b> Een spoofer zou een ijle GSV kunnen sturen, of een hoge HDOP kunnen rapporteren, om tolerantie te kopen. De engine labelt en vergeeft niet: geen enkele andere controle wordt verruimd door een slechte geometrie, en de HDOP die de ontvanger opgeeft (GSA binnen de hold, anders GGA) wordt vergeleken met de HDOP afgeleid uit de hemel die hij opgeeft. Wanneer die meer dan <c1/> verschillen ({ "1.0" }, of { "25" } % van de afgeleide HDOP, welke de grootste is), draagt de epoche <c2/> en wordt, wanneer de geometrie slecht is, haar aftrek geklasseerd als <c3/>. Bij goede of redelijke geometrie wordt het verschil gerapporteerd en niet gescoord: er wordt niets afgetrokken tenzij de geometrie slecht is. Dit is een bewuste keuze ({ "0.36" }): "nul tenzij slecht" geldt voor elke epoche, zodat goede en redelijke geometrie precies scoren als in { "0.35" }, en een vervalste HDOP nooit onopgemerkt blijft. De vlag (<c4/>) staat op elke epoche van het resultaat en elke live regel, de opmerking zegt "…beyond the tolerance: reported, not scored (the geometry is not poor)" of "…: the geometry deduction is classed an inconsistency", <c5/> telt de epochen, en de samenvattende bewijspagina toont het aantal, ook als het nul is. De { "25" } % is een <b>REPRESENTATIVE</b> technische keuze, geen gemeten of genormeerd getal: een ontvanger die per constellatie één klok oplost, of met een deel van de satellieten die hij volgt (een elevatiemasker, een C/N0-grens, een RAIM-uitsluiting), geeft een HDOP op die afwijkt van de HDOP met één klok van elke gevolgde satelliet met een verschil dat met de HDOP groeit, zodat een vaste tolerantie alleen natuurlijke slechte geometrie als inconsistentie zou lezen. Een groter verschil blijft als zodanig gelden. Een aftrek geklasseerd als <c6/> is een uitspraak over de hemel, geen vaststelling dat er geen aanval is geweest.

seg-0e729ad96db9 = <b>Signaalverlies is niet de hemel.</b> Wanneer satellieten die de ontvanger als zichtbaar opgeeft (boven <c1/>) niet worden gevolgd, leidt de engine ook de DOP af van alle zichtbare satellieten. Als die DOP van de zichtbare satellieten binnen de drempels ligt en er ofwel niets wordt gevolgd ofwel de ongevolgde satellieten rond de horizon verspreid zijn (niet beperkt tot één helft ervan), was de hemel er en het signaal niet: de epoche draagt <c2/>, de opmerking "satellites in view but not tracked: signal environment, not geometry", en de geometrie-aftrek wordt geklasseerd als <c3/>. Ongevolgde satellieten die beperkt zijn tot één helft van de horizon gelden nog steeds als een geblokkeerde hemel (een muur, een klif, een kade). Een obstructie aan twee kanten (een canyon of een smalle fjord) geldt als signaalverlies totdat een skyline is geconfigureerd. De no-fix-sentinels van de ontvanger zijn geen DOP: een opgegeven HDOP of PDOP van { "99" } of meer, GGA-kwaliteit { "0" } en GSA-modus { "1" } geven geen opgegeven DOP.

seg-0f218d21843b = Sleutel <c1/>

seg-e5ec84abd61b = gekozen (ontwerpnotitie { "4.2" }): bij <c1/> { "1.5" } m is HDOP { "4" } een 2drms van { "12" } m, de <c2/> van de kinematische controle. IEC 61108-1 wordt gewoonlijk aangehaald als stellend dat de nauwkeurigheidseisen gelden voor HDOP ≤ { "4" } (of PDOP ≤ { "6" }): herinnerd uit secundaire GNSS-ontvangerliteratuur, geen specifieke secundaire bron geraadpleegd en de norm niet gelezen; nog te controleren aan de tekst van de norm

seg-d99dc0fd090a = de PDOP-beschikbaarheidsdrempel van <c1/>; GPS SPS Performance Standard, 5e ed. ({ "2020" }), PDOP ≤ { "6" }, zoals aangehaald in <c2/>; nog te controleren aan de tekst van de norm

seg-2fffa47378ec = één meer dan een positiebepaling nodig heeft, zodat een enkel verlies de positiebepaling niet beëindigt; het minimum met één redundante meting voor RAIM

seg-7dc0baed2bc4 = een opgegeven invoer voor de 2drms-koppeling van <c1/>; stel het eigen cijfer van de ontvanger in

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = gekozen (ontwerpnotitie { "4.2" }): het absolute deel van de tolerantie; een verschil buiten de tolerantie is geen geometrie

seg-be5c3aefd942 = REPRESENTATIVE technische keuze: het relatieve deel, voor ontvangers met klokken per constellatie of oplossingen op een deelverzameling

seg-e71c6876114b = ontwerpnotitie { "4.3" }: satellieten die eronder verloren gaan, gaan verloren aan de hemel; een skyline ({ "0.36" } punt { "1" }) zal dit uitbreiden

seg-bebe291ca1c0 = geometrisch, informatief: elke satelliet in één helft van de horizon

seg-06519582227b = ontwerpnotitie { "4.2" }: geometrie alleen brengt de score van nominaal naar gedegradeerd en nooit naar onbetrouwbaar; alleen afgetrokken wanneer de geometrie slecht is (besluit B1 van de oprichter, { "0.36" })

seg-be21b5a31382 = de eigen <c1/> van de score: de helling bereikt <c2/> bij { "1.5" } maal de drempels voor slecht

seg-e922a5342a3c = de <c1/> van de score ({ "55" })

seg-09fe8c435ece = geometrie alleen bereikt nooit de onbetrouwbare band; het geldende maximum is <c1/>; een ondergrens onder <c2/> wordt geweigerd

seg-a07e6ce67371 = REPRESENTATIVE, alleen het label: de helft van <c1/> (de beginverhouding van de score van { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, alleen het label: de helft van <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, alleen het label: één meer dan <c1/>, zodat een enkel verlies nog steeds een redundante meting overlaat

seg-ef7a4c24e870 = <b>Wat er in de uitvoer is veranderd, en wat niet.</b> Er verandert geen score tenzij de geometrie slecht is; het label wordt altijd gerapporteerd. Toegevoegde sleutels: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> afgerond op { "0.001" }, <c9/> (null totdat een skyline is geconfigureerd), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satellieten vermeld boven <c16/>), <c17/>, <c18/>), <c19/> bij elke aftrekpost, en aan het einde <c20/> (drempels, hold, het geldende maximum en de geldende ondergrens, herkomst, klasseregels) en <c21/> (epochen per status, per label en per aftrekklasse, en de epochen met een afwijking van de opgegeven HDOP); <c22/> is als in { "0.35" }. Twee tests houden dit tot op de byte gelijk aan de basislijn "{ "0.36" } portable" zodra die sleutels zijn verwijderd (de hashes van { "0.35.0" }, opnieuw vastgesteld toen de engine overging op portable wiskunde en in de tests bewaard als het verslag van wat { "0.35.0" } uitbracht: <c23/>). <c24/> legt elke uitvoer van beide voorbeeldsessies vast (resultaat-JSON, CSV, SVG, verdict, herhaalde live regels, <c25/>, Prometheus, CEF, LEEF). <c26/> legt het batchresultaat, de samenvatting, de live regels en <c27/> vast van elk vastgelegd NMEA-corpus van vaartuigen (de demo en de maritieme referentiefixtures, elk ook als open hemel met alleen GPS en { "8" } satellieten, en de trainingsscenario's voor bemanningen die uit hun seeds worden gegenereerd); in de twee trainingsscenario's waarin jamming de geometrie slecht maakt, is elke epoche die niet slecht is identiek en wijkt elke slechte epoche alleen af door de geometrie-aftrek. Een log waarvan de geometrie slecht is, verliest tot { "15" } punten die het in { "0.35" } niet verloor; dat is de beoogde wijziging. In de demo leest de drag-off als <c28/>; <c29/> bewerkt het log om de westelijke hemel te maskeren (redelijk: gelabeld, niet gescoord), om die en twee oostelijke satellieten te maskeren (slecht: geometrie-aftrekken, verlies van lock <c30/> omdat ook hoge satellieten wegvielen), om alleen satellieten onder { "15" }° te verliezen (verlies van lock <c31/>), en om een HDOP op te geven die de hemel niet verklaart (de aftrek voor slechte geometrie wordt <c32/>). De drempels zijn MODELLED: gekozen, niet gefit aan enig log; niets hier beweert hoe vaak natuurlijke degradatie en aanvallen op echte data van elkaar worden onderscheiden.

seg-8ddaf82ba00b = Gebeurtenissen en voorspellingen vaststellen

seg-c52c285aa308 = Voor elke gebeurtenis geeft het resultaat de valse alarmen tussen kalibratie en begintijd, het eerste alarm en zijn monitors, de latentie, de uitkomst (<c1/>, <c2/>, <c3/> of <c4/>), en de waargenomen mediane C/N0-daling tegenover de voorspelling (<c5/>, <c6/>, <c7/> of <c8/>). Afwijking wordt gerapporteerd, nooit weggestemd: de toleranties staan in het scenario, en het scenario zit in de hash van het resultaat.

seg-3715df3fd8f7 = Wat dit niet beweert

seg-21a4b903e179 = De vertrouwensmonitors zijn MODELLED: hun drempels zijn invoer, en hun detectieprestatie bij echte interferentie is wat de gebeurtenisscoring meet, niet iets wat dit soort beweert. Bij de JammerTest { "2024" }-spoofingsessies vangen de monitors op het enginepad sommige begintijden binnen { "10" } s en zijn ze bij andere te laat; zie de rij "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM" in <a1><c1/></a1> voor de cijfers. Een voorspelling die met één log overeenkomt, is één datapunt, geen validatie.

seg-0c413c1a491c = <s1>Vorige</s1>Resilience cross-walk

seg-63fc2b340fd1 = <s1>Volgende</s1>Maritiem vertrouwen
