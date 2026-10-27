# docs--compliance-dhs-rpcf: translations (nl)

seg-d01db1c2710a = Naslag

seg-fdbb9db68f1d = geen

seg-dbec6a166e56 = Bron: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: waarvoor Kshana bewijs levert

seg-cef4181edf29 = Het kader beschrijft veerkrachtniveaus { "0" } tot { "4" } opgebouwd uit acht genummerde eisen, en een evaluatiebenadering die statische analyse combineert met dynamische analyse waarin testvectoren dreigingen vervangen. Het heeft geen eigen schema van eisidentificatie, dus de verwijzingen hieronder zijn de niveau- en eisnummers en de sectienummers ervan. Het is resultaatgericht en catalogiseert geen dreigingen.

seg-ff0e00610721 = Elke rij zegt welke uitvoer van Kshana <b>bewijs levert voor</b> de eis en wat er overblijft. Niets hier zegt dat aan een kader is voldaan of dat een product door wie dan ook is beoordeeld of goedgekeurd. Voer <c1/> uit op uw eigen resultaatbestanden om te zien voor welke rijen uw runs daadwerkelijk bewijs leveren; zie <a1>README.md</a1>.

seg-30c8cabb6e90 = Brondocumenten

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Versie { "2.0" }, { "26" } april { "2022" } (DHS Science and Technology Directorate, met CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Gelezen 2026-10-09: document volledig gelezen; de landingspagina van de publicatie is niet opgehaald.

seg-955191e0baab = Koppeling

seg-6ba8f74126ee = Wat het vraagt (geparafraseerd)

seg-0438151025da = Uitvoer van Kshana die er bewijs voor levert

seg-3f265e18f56c = Hiaat

seg-4263435e702a = Sectie { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Veerkracht wordt beschreven als drie functies: schade voorkomen, reageren (detecteren, melden, beperken, indammen) en herstellen. Detectie is probabilistisch, dus zowel valse alarmen als gemiste detecties tellen.

seg-3447d3b53fe8 = Beoordeling van het vertrouwen in ontvangerlogs; Detectie van spoofing en meaconing; Holdover en uitloop

seg-ab055a50e16e = Preventie is een eigenschap van het productontwerp die geen enkele simulatie-uitvoer laat zien. Detectiestatistieken uit een synthetische run of een run van één sessie zijn geen gemeten percentage valse alarmen of gemiste detecties voor een product in het veld.

seg-501badd6a436 = Niveau { "1" }, eis { "1" }

seg-e8cfbe121084 = Controleer dat opgeslagen gegevens uit externe bronnen overeenkomen met de formaten en waardenbereiken van de relevante standaarden.

seg-7d7196aefa05 = Een eigenschap van softwarezekerheid en invoervalidatie van het product onder test. Kshana inspecteert de invoerverwerking van een product niet.

seg-6085030de980 = Niveau { "1" }, eis { "2" }

seg-e8cd6fb732ad = Maak volledig handmatig herstel mogelijk door het geheugen te wissen of te resetten, waarbij het systeem terugkeert naar gedefinieerde prestaties zodra de dreiging voorbij is.

seg-8d216d42c776 = Beoordeling van het vertrouwen in ontvangerlogs

seg-e3ca721d9d2e = Een ontvangerlog toont wanneer een positiebepaling onbetrouwbaar werd en wanneer ze herstelde; het toont niet dat een handmatige reset elke opgeslagen toestand wist.

seg-2c78c15cea96 = Niveau { "1" }, eis { "3" }

seg-ab9458f8b8fc = Firmware veilig herladen of bijwerken.

seg-3a50eceb47f5 = De beveiliging van firmware-updates valt buiten wat enige uitvoer van Kshana waarneemt.

seg-752a194674f6 = Niveau { "2" }, eis { "4" }

seg-a5f263a083c7 = Identificeer gecompromitteerde PNT-bronnen en voorkom dat ze de oplossing verstoren.

seg-4e7034acccc0 = Detectie van spoofing en meaconing; Beoordeling van het vertrouwen in ontvangerlogs; Integriteitsbewaking en beschermingsniveaus

seg-d5fdef2a78f2 = Kshana scoort detectoren en monitoren die het modelleert of over een log draait; of de eigen bronuitsluiting van een product werkt, vraagt de interne toestand van het product, niet alleen zijn log.

seg-e3ea1208fac9 = Niveau { "2" }, eis { "5" }

seg-c0219254fe8e = Herstel bronnen en het systeem automatisch zonder de uitvoer te onderbreken; tijdens de dreiging wordt nog steeds een oplossing geleverd, met mogelijk onbegrensde degradatie.

seg-3dd48cb65cb4 = Holdover en uitloop; Beoordeling van het vertrouwen in ontvangerlogs

seg-0c36c4a3eb4e = Holdover-runs begrenzen de gemodelleerde drift voor een opgegeven klok- of inertiaalmodel, niet het eigen herstelgedrag van het product.

seg-befbf4b94876 = Niveau { "3" }, eis { "6" }

seg-45410d1675be = Corrupte data van de ene bron mogen een andere bron niet besmetten.

seg-ff808ce8ec48 = Alternatieve en diverse PNT-bronnen

seg-ccf628643110 = Kshana draait bronnen naast elkaar; bronisolatie binnen een product vraagt een ontwerpreview of foutinjectie in het product.

seg-a1d5a3125697 = Niveau { "3" }, eis { "7" }

seg-db149ea618dd = Verifieer de oplossingen van alle bronnen onderling en houd de degradatie tijdens een dreiging begrensd.

seg-4afa05ef42fa = Integriteitsbewaking en beschermingsniveaus; Holdover en uitloop; Alternatieve en diverse PNT-bronnen

seg-8b1f938c0175 = Begrensde degradatie wordt getoond voor de gemodelleerde sensoren; de eigen kruiscontrole van het product wordt niet waargenomen.

seg-772244881e5b = Niveau { "4" }, eis { "8" }

seg-aff5161e6363 = Gebruik bronnen van verschillende technologieën tegen common-mode-dreigingen, zonder degradatie tijdens de dreiging.

seg-587889f9881c = Alternatieve en diverse PNT-bronnen; Effecten van het jamming-linkbudget

seg-65b96caf8d6b = Een common-mode-redenering vraagt de bronnenset van het echte product en een dreiging die ze allemaal omvat; een scenario stelt er één, het bewijst niet dat het product geen gedeelde zwakte heeft.

seg-3c4cc0793454 = Sectie { "5.5" } (common mode)

seg-a87c9808dd99 = Diverse mechanismen mogen geen zwakte delen: een jammer die twee banden bestrijkt, ondermijnt bijvoorbeeld banddiversiteit.

seg-c10ba3bb01be = Effecten van het jamming-linkbudget; Veerkrachtscoring over dreigingsensembles; Alternatieve en diverse PNT-bronnen

seg-843fe2fc9e33 = De scoring gebruikt een synthetisch dreigingsensemble, als zodanig vermeld; het zijn geen veldgegevens.

seg-3158e7efd1a5 = Secties { "8.1" } tot { "8.3" } (evaluatie)

seg-3942d9cdc64b = De evaluatie combineert statische analyse met dynamische analyse, waarbij testvectoren dreigingen vervangen; de testklassen zijn bronuitval, interferentie en interne fouten. Simulatoren worden als testmethode genoemd.

seg-9d5c297c1ab9 = Beoordeling van het vertrouwen in ontvangerlogs; Effecten van het jamming-linkbudget; Detectie van spoofing en meaconing

seg-bb02568e8f8f = Geëxporteerde beweging en gebeurtenissen kunnen een laboratoriumsimulator aansturen (docs/TEST-BENCH.md). Kshana schrijft geen signaal, dus de simulator en zijn bevoegde operator leveren de dreiging.

seg-b81625e9e071 = Sectie { "8.6" } (elementen van een testplan)

seg-27d645a79672 = Een testplan vermeldt het niveau, de eis, de invoer, de referenties, de benodigde datatoegang, de procedure met criteria voor geslaagd of niet geslaagd, de resultaten en notities.

seg-1f2898855ccc = Reproduceerbare herkomst van runs; Beoordeling van het vertrouwen in ontvangerlogs

seg-d8b08da48cb2 = De criteria voor geslaagd of niet geslaagd worden door de beoordelaar gekozen; Kshana legt de invoer, drempels en hashes vast waarmee het draaide.

seg-ccfdf53a1e54 = <s1>Vorige</s1>Compliance mapping

seg-260ba950eb89 = <s1>Volgende</s1>IMO-richtlijnen voor schepen
