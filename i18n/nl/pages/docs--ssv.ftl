# docs--ssv: translations (nl)

seg-0857a94a948e = Beperkingen

seg-75c8da01c0f1 = MET

seg-069a652c402e = drempel

seg-1f79a5aae6c5 = Signaalbeschikbaarheid voor een gebruiker op een bol op { "36000" } km hoogte met een halfrondantenne, uit een echte run van engine v{ $version } op scenarios/gnss-ssv-shell.toml (een verkleinde run: { "162" } gebruikers, { "3" } dagen, stappen van { "10" } min), bij een drempel van { "20" } dB-Hz. Voor elke constellatie en band twee balken: het aandeel van de (gebruiker, epoch)-paren met minstens één signaal en met minstens vier. Gecombineerd, L1: { "99.4" } % minstens één, { "73.2" } % minstens vier, langste onderbreking onder vier signalen { "160" } min. Gecombineerd, L5: { "100.0" } % minstens één, { "99.9" } % minstens vier, langste onderbreking onder vier signalen { "20" } min. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen bewering over het service volume van enig systeem. De verkleinde omvang is niet de vergelijking met het boekje. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-92ef8e0b78de = Signalen langs één hoge baan om de Aarde (perigeum { "497" } km, apogeum { "58622" } km, omlooptijd { "18.8" } u), uit een echte run van engine v{ $version } op scenarios/gnss-ssv-heo.toml, band L1. Boven: de beste draaggolf-ruisdichtheid onder de zichtbare signalen, tegen de drempel van { "20" } dB-Hz. Midden: het aantal zichtbare signalen van alle constellaties, van { "4" } tot { "55" } langs de bemonsterde punten. Van de ontvangen links kwamen { "2252" } door een hoofdlob en { "696" } door zijlobben, met een gelabeld parametrisch vervangingspatroon, niet het gemeten patroon van enig systeem. Mediane PDOP { "67" }, 95e percentiel { "358" }. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen bewering over het service volume van enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-902c5c7da9aa = Een boordfilter met negen toestanden op een overgang van een lage baan naar de Maan, uit een echte run van engine v{ $version } op scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epochs, { "13" } getekende punten). Op een logaritmische as: de ware positiefout en de eigen één-sigmagrens van het filter tegen de tijd sinds het begin. Binnen de GNSS-banen is de positie-RMS { "1.4" } m; erboven is zij { "90" } m, met een eindfout van { "184" } m op { "193,330" } km hoogte met { "1" } meting. De gemiddelde genormaliseerde geschatte fout in het kwadraat over de hele run is { "4.4" } (ongeveer { "3" } voor een consistent positieblok). Referentie en filter delen hun vervangers voor Zon en Maan. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen bewering over het service volume van enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-9a947b61a4cb = Relatieve navigatie van { "2" } deputies rond een chief op een hoge baan, uit een echte run van engine v{ $version } op scenarios/gnss-ssv-formation-heo.toml ({ "401" } epochs). Voor elke deputy twee balken: de relatieve positie-RMS door de twee onafhankelijke absolute schattingen van elkaar af te trekken, en die van het relatieve filter op enkelvoudig gedifferentieerde pseudoranges. Basislijn { "0.8" } km: { "5.1" } m en { "1.2" } m. Basislijn { "2.0" } km: { "4.1" } m en { "2.1" } m. Het absolute filter is hier niet consistent: gemiddelde genormaliseerde geschatte fout in het kwadraat { "187" } tegen ongeveer { "3" } voor een consistent filter, dus de opgegeven onzekerheid is veel te klein. MODELLED: een gemodelleerde studie uit vermelde invoer, geen meting en geen bewering over het service volume van enig systeem. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-d76123040989 = De vastgelegde vergelijking van het beschikbaarheidsmodel voor ruimtegebruikers met het openbare boekje over het Space Service Volume, uit de vastgelegde resultaten van de vooraf geregistreerde run (xval/gnss-ssv/results-run1.json, geschreven door het voorbeeld ssv_booklet_check van engine v{ $version }). Drempel voor drempel, de cellen binnen de tolerantie: S0 { "13" } van { "13" } (MET); S1 { "43" } van { "52" } (NOT MET); S2 { "48" } van { "52" } (NOT MET); S3 { "122" } van { "155" } (NOT MET); S4 { "132" } van { "156" } (NOT MET); S5 { "18" } van { "26" } (NOT MET); S6 { "26" } van { "26" } (MET); S7 { "0" } van { "20" } paneelpatronen (NOT MET). Alleen S0 en S6 zijn gehaald volgens de vooraf vastgelegde lezing. Een diagnostische variant die de andere GLONASS-hoeken van het boekje gebruikt, brengt S1, S2 en S4 op elke cel, maar vervangt de run van record niet. Geen enkele registerrij is VALIDATED. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringtool, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens.

seg-74675df154dc = Bron: <c1/>

seg-ce7ea32e67f1 = GNSS voorbij de constellatie: de soort <c1/>

seg-389cb131fd77 = Alleen adviserend. Gemodelleerde resultaten uit vermelde invoer en een gesimuleerde waarheid; geen certificering, geen voor de vlucht gekwalificeerde waarde en geen claim over het servicevolume van enig systeem. { -brand } zendt niets uit.

seg-a0011b278269 = De soort <c1/> beantwoordt: hoeveel GNSS-signalen kan een ruimtevaartuig boven, rond of ver voorbij de GNSS-banen gebruiken, hoe sterk zijn ze, hoe goed is de geometrie en wat kan een boordfilter ermee? Hij heeft drie modi, gekozen door welke tabel het scenario heeft: <c2/>, <c3/> of <c4/> (met een optionele <c5/>).

seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. De beschikbaarheidssweeps worden onder een preregistratie vergeleken met het ICG Space Service Volume-boekje; zie <a1>wat de vergelijking toont</a1> voordat u op enig getal vertrouwt.

seg-a0ff58bccaa8 = Openbare bronnen

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } november { "2018" }), opgesteld door het International Committee on GNSS (ICG), Working Group B: de methode (bijlage B), de baanelementen van elke constellatie (bijlage C), de zendbundelbreedtes en -vermogens (tabellen B2, B6, B8, { "4.2" }), de gebruikersantennes (tabel B10) en de gepubliceerde beschikbaarheidstabellen. Het is zelf een simulatie. Opgehaald door <c1/> (SHA-256 vastgepind), nooit meegeleverd.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, antennepaneelpatronen van GPS Block IIR en IIR-M (Marquis, { "2014" }): de gemeten L1-paneelpatronen die alleen worden gebruikt om het parametrische substituut te beoordelen (drempel S7). Opgehaald, nooit meegeleverd, geen patroongegevens vastgelegd.

seg-0a002dc0df64 = De constanten van het model (zwaartekracht, aardrotatie, verlies in vrije ruimte, ruisdichtheid) zijn standaard; de dichtheidswet van Gallagher voor de plasmasfeer, de Chapman-laag en het profiel van de radiorefractiviteit zijn gepubliceerde vormen, gebruikt met vermelde eenvoudige parameters (zie <c1/>).

seg-c3c3f63df966 = Shellmodus: de globale maat van het boekje

seg-f1e153c95b13 = <c1/> plaatst een gebruiker op een bol (standaard op { "36,000" } km hoogte met een naar nadir gerichte halfronde antenne, de bovenste SSV; of { "8,000" } km met een omnidirectionele antenne, de onderste SSV) op een icosfeerraster met 2,562 punten en telt, over { "14" } dagen met stappen van 1 minuut, het aandeel van de paren (gebruiker, epoch) met minstens één en minstens vier signalen, per constellatie en gecombineerd, en de langste uitval bij de ongunstigste gebruiker. De sweep gebruikt het gesloten-vorminterval voor zichtbaarheid in centrale hoek (een bundelkegel, aardblokkade door de bol van { "6378" } km plus { "50" } km, het gebruikershalfrond en de RF-bereikgrens) en draait in seconden in een releasebuild; een eigenschapstest controleert het tegen het algemene geometrische predicaat.

seg-3fb4c06c8b3f = Trajectoriemodus: langs een baan

seg-632fedc95af5 = <c1/> laat de gebruiker op een Kepler-baan vliegen (een voorinstelling: <c2/>, <c3/>, <c4/>, <c5/> (tabel { "5.10" } van het boekje) of <c6/>, of elementen) en rapporteert, per band en constellatie, de beschikbaarheid van één en vier signalen, uitvalduren, signalen in zicht, beste C/N0, dilution of precision (mediaan, 95e percentiel, ongunstigste), links die via de hoofdlob en via zijlobben worden ontvangen, en een optionele tijdreeks en CSV.

seg-7bfd301cd789 = <b>Zendpatroon</b> (<c1/>): <c2/> (constant vermogen binnen de referentiehoek buiten de boresight), <c3/> (een gelabeld substituut: { "3" } dB per graad voorbij de referentiehoek tot een ondergrens { "25" } dB onder de hoofdlob; <b>niet</b> het gemeten patroon van enig systeem) of <c4/> (een gemeten patroon dat u aanlevert: <c5/> of inline <c6/>; de paneelpatronen van Block IIR/IIR-M kunnen worden onttrokken met <c7/>).

seg-c1390929d9f2 = <b>Ontvangstantennes</b>: omni, halfrond, of de antennes met hoge versterking en patchantennes uit tabel B10 van het boekje, nadir of zenit; elke link gebruikt de antenne met de hogere versterking.

seg-fe56ab7a2cac = <b>Limbstraalmedium</b> (<c1/>): een Chapman-ionosfeer, een plasmasfeer (vorm van Gallagher { "1988" }, plasmapauze bij L = { "4.5" }, afgebouwd onder { "1,500" } km) en een neutrale atmosfeer (buiging van ongeveer { "1.33" } graden aan het oppervlak, zuurstofabsorptie, defocussering) geïntegreerd langs de rechte straal. Rapporteert schuine TEC, het plasmasferische deel, extra vertraging, raakhoogte en de links die door scherende stralen verloren gaan. Integratie langs de rechte straal: buiging wordt gerapporteerd, niet geïtereerd.

seg-1bad91204f6a = <b>Ontvanger voor zwakke signalen</b> (<c1/>): coherente en niet-coherente integratie, databitlimiet, ondersteuning en pilootkanalen, Dopplerzoektocht; de acquisitiedrempel bij de vermelde detectie- en valse-alarmkansen en de drempels voor draaggolf- en codetracking vervangen de vaste C/N0-drempel (bereik van { "10" } tot { "25" } dB-Hz). Hergebruikt de acquisitie- en trackinglusmodellen van de engine.

seg-497126fe23e9 = Navigatiemodus: een boordfilter

seg-af7919ae046e = <c1/> laat een ruimtevaartuig in een hoge baan of maanovergangsbaan vliegen en draait een extended Kalman-filter met negen toestanden (positie, snelheid, klokbias en -drift van de ontvanger, een schaalfactor voor zonnestralingsdruk) op pseudoranges. De waarheid wordt geïntegreerd met puntmassazwaartekracht, J2, derdelichaamsverstoringen van zon en maan en stralingsdruk met een cilindrische aardschaduw; het filter modelleert zwaartekracht, J2 en de derde lichamen en schat de stralingsdruk. Pseudoranges komen uit dezelfde linkgeometrie en C/N0-drempel als de sweeps; hun ruis neemt toe naarmate de C/N0 daalt; de extra vertraging van het medium (met <c2/>) wordt toegevoegd en niet door het filter gemodelleerd. Het rapport scheidt het deel van de run binnen de GNSS-banen (onder { "20,000" } km hoogte) van het deel daarboven, geeft de langste periode zonder meting en de gemiddelde genormaliseerde geschatte kwadratische fout (ongeveer { "3" } voor een consistent positieblok). De zon en de maan zijn cirkelvormige substituten met lage precisie.

seg-a515950c13d6 = Formatiemodus: relatieve navigatie

seg-8d2b72ca56d9 = <c1/> (heeft <c2/> nodig voor de chief) voegt deputies toe die in ware anomalie zijn verschoven. Elk vaartuig draait het absolute filter; de positie van de deputy ten opzichte van de chief wordt geschat door de onafhankelijke absolute schattingen af te trekken en met een relatief filter op enkelvoudig gedifferentieerde pseudoranges van de signalen die beide vaartuigen volgen. Het rapport geeft beide, de basislijn en het aantal signalen dat gezamenlijk wordt gevolgd.

seg-dc78efcb8bcb = Wat de vergelijking met het boekje toont

seg-643bcfcea515 = Drempels zijn vooraf vastgelegd (<c1/>, addenda { "1" } tot { "5" }) vóór de run op volle grootte; resultaten in <c2/>, cellen in <c3/>, vastgepind door <c4/>, inclusief de missers.

seg-5498636f8d07 = wat

seg-32c0ea7929e2 = run { "1" } (vooraf vastgelegde lezing)

seg-abe521171d2f = GLONASS-hoekvariant (diagnostisch)

seg-9489ef691574 = minimaal uitgestraald vermogen, { "13" } signalen, binnen { "0.1" } dB

seg-4b7e0252355c = geometrie van de bovenste SSV (tabel B4)

seg-e3c870085a6c = NOT MET ({ "43" } van { "52" } cellen)

seg-b57b1f9b0b43 = alle { "52" } cellen binnen tolerantie

seg-6bf57763d120 = onderste SSV (tabel { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } van { "52" })

seg-056eae8e55d1 = alle { "52" }
