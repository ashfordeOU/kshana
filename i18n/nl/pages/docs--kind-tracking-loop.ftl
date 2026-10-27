# docs--kind-tracking-loop: translations (nl)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = geen waarde

seg-59afd80736c5 = <b>PARTNER</b> Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariosoort van de engine v{ $version }, familie <a1>Jamming, spoofing en het spectrum</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-5d23d7f8f872 = Familiepagina: <a1>Jamming, spoofing en het spectrum</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Het rapport <c1/> steunt zijn ontkenningscontour niet langer op één scalair.

seg-05e8854de548 = chip

seg-4f57723d340e = Bron: <c1/>

seg-e84aabe07c43 = <c1/> (scenariosoort)

seg-f6ff1c8c78db = Verlies van vergrendeling van de tracking-lus: C/N0 -> vergrendeld/ontgrendeld inclusief HYSTERESE, de tijd die het kost om de vergrendeling te verliezen, en spoof-pull-in als functie van de SNELHEID van de code- en draaggolfoffset. De bestaande ontkennings- en overnamecriteria van de engine zijn verhoudingen op ontvangen vermogen (een jammer ontkent bij J/S = { "30" } dB, een spoofer neemt over bij { "3" } dB); echt verlies van vergrendeling is geen vermogensverhouding, maar het punt waar de jitter van een lus plus dynamische belasting het tracking-drempelbudget overschrijdt. Rapporteert ({ "1" }) draaggolf- (Costas) en code-jitter (niet-coherent early/late) van 1 sigma thermisch versus C/N0, inclusief kwadrateringsverlies, tegen de opgegeven regels { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (de 15-gradenregel in drie-sigmavorm) en { "3" }</em>sigma_DLL + ramp lag <= d/2 chips; ({ "2" }) de drempels voor C/N0 bij wegvallen en herstel van de vergrendeling met de bepalende lus benoemd, waarbij de herstelvergrendelingsdrempel AFGELEID is uit de bredere bandbreedte waarmee een ontvanger opnieuw intrekt in plaats van beweerd, zodat de hysteresebreedte tussen { "5" }<em>log10(ratio) en { "10" }</em>log10(ratio) dB moet liggen; ({ "3" }) de verklaarde tijd tot verlies van vergrendeling van een lock-detector met twee drempels en bevestigingsverblijftijden, aangestuurd over een C/N0-helling, afzonderlijk gerapporteerd van de fysieke faseontsnappingstijd (de gemiddelde Viterbi-tijd tussen cycle slips, in log10 s omdat die honderden decaden beslaat); ({ "4" }) spoof-pull-in-limieten — de grootste codeverschuiving en Doppler-snelheid van de draaggolf die de lussen van een slachtoffer kunnen volgen, met een kaart over beide assen, omdat een spoofer die sneller verschuift dan deze de lus niet overneemt maar achter zich laat; en ({ "5" }) de ONTKENNINGSSTRAAL die de luisdynamiek impliceert, gerapporteerd NAAST de bestaande vermogensverhoudingsstraal, nooit in plaats daarvan, met hun verschil met teken als eigen benoemd veld (denial_radius_delta_km) en een definitie ernaast. Elk uitgegeven numeriek veld heeft een eenheid en een herkomstklasse. VALIDATED gesloten vormen: de jitteruitdrukkingen voor draaggolf en code, de reductie van het lusfilter sqrt({ "2" }<em>B_n</em>T) en de eerste-orde ramp lag zijn gecontroleerd tegen de eigen sdr-correlator van de engine, voorwaarts gestapt op geseede synthetische IF — een andere route naar dezelfde getallen — tot respectievelijk { "0.6" } %, { "3.7" } % en { "0.17" } %, en de gewijzigde Bessel I0 achter de cycle-slip-tijd tegen standaard getabelleerde waarden tot { "1e-7" }. De ondergrens van de geldigheid wordt afgedwongen, niet alleen vermeld: onder ~{ "32" } dB-Hz bij { "1" } ms verzadigt de echte atan-discriminator tegen zijn bereik van +-pi/2 en meet hij minder jitter dan enige lineaire theorie. MODELLED: de lusbandbreedtes, integratietijd, correlatorafstand, pull-in-bandbreedteverhouding, bevestigingsverblijftijden, jammervermogen en antenneversterkingen zijn representatieve bandwaarden, geen datasheet. NIET gemodelleerd: oscillator- (Allan-deviatie) en trillingsjitter, bandbreedtebeperking van de front-end, multipath, AGC-dynamiek, verlies door databittransities, externe ondersteuning en elke halve-cyclus-correctie op de Costas-cycle-slip-formule. Onder luisdynamiek heeft spoof-overname helemaal geen straal — de bepalende beperking is de offsetsnelheid, niet het vermogen — dus dat veld is null met een reden in plaats van een verzonnen getal. Geen gecertificeerd product voor ontvangerprestaties.

seg-62d230dfccce = Eén run van <c1/> vat samen als: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (draaggolf bepaalt), relock { "27.4413" } dB-Hz, hysterese { "1.9669" } dB | verlies van vergrendeling vastgesteld { "39.101" } s in de helling | ontkenningsstraal drempel(J/S { "30" } dB) { "127.413" } km versus luisdynamiek { "53.1694" } km, delta -74.2438 km | spoof-pull-in <= { "0.966" } chip/s code en { "41.45" } Hz/s draaggolf (MODELLED lus, VALIDATED gesloten vormen)

seg-7614718317f4 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Het voorbeeld <c1/> stelt onder meer in:

seg-773fff0feaf7 = tussen haakjes geplaatst

seg-23f3aa5c2064 = Resultaatlabel (van de engine): MIXED — VALIDATED gesloten vormen van de lus, MODELLED lusconfiguratie. De thermische-jitteruitdrukkingen voor draaggolf en code, de reductie van het lusfilter sqrt({ "2" }<em>B_n</em>T) en de eerste-orde ramp lag zijn gecontroleerd tegen de eigen sdr-correlator van de engine, voorwaarts gestapt op geseede synthetische IF (een andere route

seg-72182c1aecd9 = De grafiek die de engine schrijft voor scenarios/tracking-loop.toml, soort tracking-loop

seg-346594a654f2 = <b>MODELLED</b> Verlies van vergrendeling berekend uit luisdynamiek in plaats van een vermogensverhouding: draaggolf- (Costas) en code-jitter (niet-coherent early/late) van 1σ thermisch tegen C/N₀ met het kwadrateringsverlies, tegen de opgegeven regels 3σ_PLL + θ_e ≤ { "45" }° en 3σ_DLL + ramp lag

seg-3aa7f9748dc2 = <b>MODELLED</b> Verlies van vergrendeling berekend uit luisdynamiek in plaats van een vermogensverhouding: draaggolf- (Costas) en code-jitter (niet-coherent early/late) van 1σ thermisch tegen C/N₀ met het kwadrateringsverlies tegen de s. Onafhankelijke referentie (ReferenceImpl): De eigen sdr-correlator van de engine (sdr::correlate / synth_if / CaCode), voorwaarts gestapt op geseede synthetische IF bij een gekalibreerde C/N₀ — een apart codepad dat dezelfde getallen bereikt door numerieke correlatie van gesamplede IQ in plaats van door een algebraïsche jitteruitdrukking, dus een andere route en geen herhaling — plus standaard getabelleerde waarden van de gewijzigde Bessel I₀ voor de cycle-slip-term. Lustheorie volgens Kaplan & Hegar

seg-de048f9cf1f6 = MIXED — VALIDATED gesloten vormen van de lus, MODELLED lusconfiguratie. De thermische-jitteruitdrukkingen voor draaggolf en code, de reductie van het lusfilter sqrt({ "2" }<em>B_n</em>T) en de eerste-orde ramp lag zijn gecontroleerd tegen de eigen sdr-correlator van de engine, voorwaarts gestapt op geseede synthetische IF (een andere route naar dezelfde getallen), en de gewijzigde Bessel I0 tegen standaard getabelleerde waarden. MODELLED: de lusbandbreedtes, integ (resultaat <c1/>)

seg-0dc70b7607f0 = MODELLED: de lusbandbreedtes, integratietijd, correlatorafstand, pull-in-bandbreedteverhouding, bevestigingsverblijftijden, jammervermogen en antenneversterkingen zijn representatieve bandwaarden, geen datasheet. (soortencatalogus (<c1/>))

seg-a679a9732b2a = NIET gemodelleerd: oscillator- (Allan-deviatie) en trillingsjitter, bandbreedtebeperking van de front-end, multipath, AGC-dynamiek, verlies door databittransities, externe ondersteuning en elke halve-cyclus-correctie op de Costas-cycle-slip-formule. (soortencatalogus (<c1/>))

seg-f8d50cbc6f2c = Elke lusparameter hieronder is een MODELLED representatieve bandwaarde, geen datasheet. (opmerking in het scenariobestand, regel { "22" })

seg-9241a57823cd = --- lusgeometrie ----------------------------------------------------------------- Een Costas-draaggolflus van { "10" } Hz en een draaggolfondersteunde codelus van { "1" } Hz, { "1" } ms coherente integratie (één C/A-codeperiode, dus er wordt geen databitsynchronisatie aangenomen), smalle correlator van { "0.5" } chip. (opmerking in het scenariobestand, regels { "25" } tot { "28" })

seg-3a677e343081 = Verlies van vergrendeling van de tracking-lus en spoof-pull-in onder interferentie is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Vorige</s1>timetransfer
