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
