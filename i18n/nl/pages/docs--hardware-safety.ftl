# docs--hardware-safety: translations (nl)

seg-fdbb9db68f1d = geen

seg-2015f437e669 = Bron: <c1/>

seg-10c7eaab58c5 = Hardwareveiligheid: wat { -brand } met hardware doet en wat het nooit doet

seg-fe4873962140 = <b>Status: juridische beoordeling door de eigenaar nog in behandeling.</b> De juridische opmerkingen hieronder zijn de lezing van de beheerders van openbare bronnen, geschreven zodat een gebruiker weet waar de grenzen liggen. Het is geen juridisch advies, ze zijn niet beoordeeld door een jurist en de wet verschilt per land. Lees ze als reden om een jurist te raadplegen, niet als toestemming.

seg-bd2fbb355834 = Adviserende software voor onderzoek, simulatie en test. Het is geen typegoedgekeurde apparatuur en beoordeelt of keurt geen ontvanger, klok of laboratorium goed. Zie de adviserende verklaring in de README.

seg-f27c286787b1 = De regel

seg-88638e41faab = Ontvangen is het product. Zenden zit nooit in de open engine.

seg-614d381dd0d0 = { -brand } bevat geen code die een zender aanstuurt. Er is geen zendpad voor SDR (geen zendaanroep van UHD, HackRF, bladeRF of Soapy), en er wordt geen jamming- of spoofinggolfvorm geschreven naar een bestand dat bedoeld is om te worden afgespeeld.

seg-2e370a1c6c4c = Bestanden die { -brand } schrijft (IQ-scènes, SigMF- en ION-<c1/>-opnamen, NMEA- en bench-exports) beschrijven <b>gesimuleerde, legitieme</b> signalen of bewegingen, en de metadata die { -brand } voor een scène schrijft vermeldt dat zij door <c2/> is geschreven (de ION-<c3/>-opmerking zegt dat het een gesimuleerde scène is en geen opname).

seg-8ce652bc1af6 = Waar een experiment RF op een bench nodig heeft, wordt die geproduceerd door de <b>eigen apparatuur van de exploitant</b>, in de eigen behuizing van de exploitant, onder de eigen machtiging van de exploitant. { -brand } legt vast wat de exploitant zegt te hebben gedaan en leidt dat nooit zelf af.

seg-c74fc5d82071 = Fasen

seg-01e7633921dc = Elke fase noemt wat { -brand } doet, welke hardware erbij betrokken is, wie RF uitzendt (als iemand dat doet) en de voorwaarde die moet gelden voordat { -brand } het resultaat als bewijs behandelt.

seg-324e16b11186 = Fase

seg-bb269645d988 = Rol van { -brand }

seg-76c0861cbe83 = Hardware

seg-92ab27525ed1 = RF-uitzending

seg-c822f981cfcf = Voorwaarde

seg-00727bb577f9 = Status in { "0.38" }

seg-1c566ec98a03 = Bestanden: replaylogboeken, IQ, bench-exports, live NMEA of UBX via stdin, TCP of UDP

seg-0435986aa760 = geleverd

seg-56b9a4399108 = Passief ontvangen: ontvangers uitsluitend lezend; tijdsynchronisatielogboeken (linuxptp, chrony, TICC); IMU-CSV; <c1/> op een groeiend SigMF-bestand

seg-608fc0a99107 = de ontvangers van de gebruiker, grandmaster, SDR in ontvangst

seg-786d9e5ccf93 = elke configuratieschrijfactie naar een ontvanger vereist een expliciete <c1/>; standaard is alleen lezen

seg-ab8874046283 = gedeeltelijk geleverd: formaten van tijdsynchronisatielogboeken, <c1/>, <c2/>; seriële ontvangeringang is gepland

seg-6b0a194d3f64 = Laborganisatie zonder RF van { -brand }: een specificatie van de testomstandigheden, stappen van de exploitant (antenne loskoppelen, simulator starten) die worden gevraagd en van een tijdstempel voorzien, scoren van de rondgang en bewijs

seg-8e2847bce9ac = simulators van het lab zelf, afgeschermde dozen

seg-121fe22c92ec = uitsluitend door de simulator van het <b>lab</b>, geleid

seg-0a704c5443c5 = een ondertekende <c1/> (hieronder) die in het bewijspakket is vastgelegd; { -brand } weigert een labrun te scoren zonder die

seg-9e94d44cd197 = de vastlegging is geïmplementeerd in bewijspakketten; de weigering om zonder te scoren is dat nog niet (er bestaat geen opdracht voor labruns)

seg-ee5333e346ad = Geleide replay van <b>legitieme</b> GNSS-IQ-scènes: { -brand } schrijft het scènebestand en de gebruiker speelt het met een eigen hulpmiddel af in een kabel met verzwakkers en een te testen apparaat in een RF-behuizing

seg-fa5b0f1b41f7 = de SDR, verzwakkers en behuizing van de gebruiker

seg-9049203a2a6e = uitsluitend geleid, de verantwoordelijkheid van de gebruiker

seg-b4392e583cb8 = geen zendcode in de open engine; golfvormen voor interferentie en spoofing blijven buiten de reikwijdte; beoordeling van exportcontrole; jurist

seg-ced2afbf108f = niet in de open engine; een onderdeel van de commerciële uitgave dat samen met een jurist moet worden uitgevoerd

seg-0f8a0fce4d20 = Realtime closed-loop RF-hardware-in-the-loop

seg-d109f8e36ce8 = apparatuur van de partner

seg-fb26b352f56e = partner

seg-38c768d5faa7 = integreer in plaats daarvan via de specificatie van fase { "2" }

seg-458f37b807ba = niet gepland

seg-2e59d363e31b = "Geleverd" betekent dat de code in deze release zit. Niets in deze tabel zegt dat een fase met een partner, laboratorium of autoriteit is gebruikt; dat is niet gebeurd.

seg-1524fb5b0aba = Principes

seg-82b8ed15bbe6 = Ontvangen is het product en zenden zit nooit in de open code.

seg-63c000eccfc2 = Elke hardwaresessie levert een bewijspakket op met hashes van de invoer, de omstandigheden en de gebruikte drempels.

seg-63cc5d9513ff = Een attestatie van geleide of afgeschermde opstelling wordt vastgelegd en nooit afgeleid.

seg-da1e4f5da956 = Getallen die van hardware komen blijven <b>MODELLED</b> totdat een onafhankelijke externe referentie ermee instemt (bijvoorbeeld een referentietraject van een laboratorium of een referentieklok). Een vooraf vastgelegde drempel wordt na een run niet versoepeld.

seg-d8e445427d02 = Antennes met gestuurde patronen, inertiële eenheden en atoomklokken op chipschaal worden behandeld als gegevensbronnen (patronen, logboeken, gepubliceerde stabiliteitscurves) en niet als apparaten die { -brand } aanstuurt.

seg-7a22a9591fa3 = Formulering: een resultaat is "gemeten tegen het masker" of "levert bewijs voor" een eis. { -brand } zegt niet dat een apparaat aan een norm voldoet, en niemand heeft het beoordeeld of goedgekeurd.

seg-913509e5d6b2 = Juridische opmerkingen (juridische beoordeling door de eigenaar nog in behandeling)

seg-c18b68936406 = GNSS-signalen ontvangen is bijna overal legaal. Zenden in GNSS-banden is dat niet.

seg-070d8a8d5494 = <b>Verenigde Staten.</b> Opzettelijke interferentie met radiocommunicatie is verboden krachtens { "47" } U.S.C. §{ "333" }, en de FCC treedt op tegen jammers (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Een uitzending vanaf een bench kan verder reiken dan de bench.

seg-336b48c6f5f2 = <b>Elders.</b> De beheerders hebben de wetgeving van andere landen niet beoordeeld. De gemeenschap rond gps-sdr-sim stelt dat het uitzenden van de uitvoer ervan in de meeste landen bij wet verboden is; beschouw dat als de werkhypothese overal waar een jurist niets anders heeft gezegd.

seg-8d31cbd38718 = <b>Een afgeschermde of geleide opstelling is een waarborg, geen vergunning.</b> De attestatie hieronder legt de waarborg vast die volgens de exploitant aanwezig was. Ze maakt een uitzending niet rechtmatig.

seg-7373bfd21035 = <b>Opnemen.</b> Het opnemen van radiosignalen kan op sommige plaatsen vragen over privacy en wettigheid oproepen. <c1/> en elk opnamerecept zijn uitsluitend ontvangend, en de exploitant is verantwoordelijk voor waar en wat hij opneemt.

seg-2edf9b14e62c = <b>Exportcontrole.</b> Hardware-in-the-loop-software die signaalgeneratoren aanstuurt, kan onder exportcontroleregels vallen. Daarom valt fase { "3" } buiten de open engine.

seg-bcd59f201022 = <b>Niets hier is een onderschrijving of een overeenkomst.</b> Geen toezichthouder, testterrein, laboratorium of leverancier is over dit document geraadpleegd of is het eens met iets daarin.

seg-81091020e648 = Het veld <c1/>

seg-64918fd6895d = Voor fase { "2" } en hoger bevat een run waarbij laboratoriumapparatuur is gebruikt een object <c1/>, vastgelegd in het bewijspakket naast de hashes van de invoer. Het is een verklaring van een genoemde exploitant, geen meting, en { -brand } verifieert haar niet.

seg-3bf153c63fa3 = Wat in { "0.38" } is geïmplementeerd:

seg-bf212e141046 = <c1/> valideert het bestand en legt de attestatie vast in de <c2/> van het pakket. Het manifest valt onder de Ed25519-handtekening van het pakket, zodat de vastlegging niet kan worden gewijzigd zonder de verificatie te breken. Hetzelfde is beschikbaar als het argument <c3/> van de Python-functie <c4/> en het argument <c5/> van het MCP-hulpmiddel <c6/> (de browserbuild maakt geen pakketten).

seg-431036f13a37 = Een pakket zonder attestatie is byte voor byte gelijk aan wat het eerder was.

seg-4360b8fbdafb = <c1/> meldt de attestatie en zegt dat ze "bevestigd is door de genoemde exploitant; niet geverifieerd door { -brand }".

seg-438bbe788314 = Een attestatie die onvolledig is, of waarvan <c1/> noch <c2/> noch <c3/> is (een opstelling via de lucht wordt niet als labrun geaccepteerd), wordt geweigerd en er wordt geen pakket gemaakt.

seg-c8c40ed88dde = Wat <b>nog niet</b> is geïmplementeerd: de regel van fase { "2" } dat { -brand } weigert een labrun zonder attestatie te <em>scoren</em>. Geen enkele opdracht kent in { "0.38" } een vlag voor labruns, dus er valt niets te weigeren; de regel komt met de opdrachten voor laborganisatie. Een attestatie legt de verklaring van de exploitant over een waarborg vast. Ze maakt geen enkele uitzending rechtmatig en wijzigt het label van een resultaat niet: een gescoorde labrun is MODELLED, tenzij een externe referentie ermee instemt.

seg-b0db377bce58 = Wat dit betekent voor een bijdrager

seg-c2e215edd86c = Voeg geen zendpad, geen zendafhankelijkheid en geen zendvoorbeeld toe aan de open engine.

seg-452b44a9ca8a = Voeg geen golfvormgenerator toe waarvan de uitvoer een jamming- of spoofingsignaal is dat bedoeld is om te worden afgespeeld.

seg-4df4d15a5f1c = Nieuwe hardware-ingangen zijn standaard alleen lezend; schrijven vereist een expliciete vlag en een regel in dit bestand.

seg-ee5f1fa9b822 = Een nieuwe opdracht die hardware aanraakt, komt op elk oppervlak of wordt met een reden als N/A gemarkeerd in <a1><c1/></a1>, en vermeldt hier haar fase.

seg-7d65c3565acd = <s1>Vorige</s1>Formaten van klokloggboeken

seg-82eb53d4efbd = <s1>Volgende</s1>Integriteit en beveiliging

seg-8a78e520fc9e = Het veld lab-attestation
