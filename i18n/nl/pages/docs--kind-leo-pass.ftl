# docs--kind-leo-pass: translations (nl)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-fad0b45fd9c2 = Bron: <c1/>

seg-f0433f09f033 = <c1/> (scenariosoort)

seg-c3861f7d717c = LEO-pass en linkbudget, band voor band, voor LEO-PNT (positiebepaling, navigatie en tijdsynchronisatie vanuit een lage baan om de aarde), systeemonafhankelijk: een gebruiker (op de grond, op zee, in de lucht of binnenshuis, stilstaand of bewegend) en een of meer LEO-satellieten uit een ONTWORPEN PASS (een cirkelbaan die zo is geplaatst dat de gebruiker op een gekozen tijdstip één pass met een gekozen maximale elevatie ziet, zonsynchroon indien gevraagd), expliciete ELEMENTEN, een TLE (tweeregelige elementenset) via de SGP4 van de engine, of een WALKER-constellatie opgebouwd met de code voor constellatieontwerp (de hoogste passes worden gerapporteerd). Banden komen uit een benoemde voorinstelling (generiek multiband UHF/L/S/C, generieke C-band, Xona Pulsar X1/X5, Iridium STL, Starlink als Doppler-only signal of opportunity, CentiSpace, en een optionele Celeste IOD-voorinstelling gemarkeerd als WORKSHOP) of worden in het scenario geschreven; elke voorinstelling vermeldt of haar getallen PUBLIC (met URL), REPRESENTATIVE of WORKSHOP zijn. Per satelliet, band en epoche: elevatie, azimut, afstand, afstandssnelheid en afstandsversnelling; vrije-ruimteverlies; EIRP en de patroonversterking van de satelliet (isoflux, gaussiaanse bundel of vlak); versterking van de gebruikersantenne tegen elevatie (patch, halfbolvormig of isotroop); gasvormige verzwakking (ITU-R P.676-10 Annex { "2" }), regenverzwakking (ITU-R P.838-3-coëfficiënten en de procedure P.618-14, uit een regenintensiteit en regenhoogte), troposferische scintillatie (ITU-R P.618-14 sectie { "2.4.1" }), gebouwindringingsverlies voor een gebruiker binnenshuis (ITU-R P.2109-2), polarisatiemismatch, systeemruistemperatuur en C/N0 (draaggolf-ruisdichtheid); Doppler en Doppler-snelheid in gesloten vorm uit de afstandssnelheid en afstandsversnelling, elk gecontroleerd tegen centrale verschillen; de eerste-orde-ionosfeervertraging { "40.3" } STEC/f^{ "2" } uit een schuine TEC volgens Klobuchar of verticale TEC, geschaald naar het deel van de ionosfeer onder de satelliet. Bandparen krijgen de ionosfeervrije coëfficiënten, ruisversterking en coderuis op de piek van de pass. MEO-GNSS-satellieten (Galileo- of GPS-voorinstellingen) worden met hetzelfde antenne- en ruismodel geëvalueerd uit de ontvangen vermogens van hun interfacedocumenten, zodat de klokvormige LEO-pass en de vlakke GNSS-draaggolven één plot delen. Een optionele sectie [iot] geeft tijd tot eerste positiebepaling, energie per positiebepaling en batterijlevensduur tegen dutycycle voor een vermeld vermogensbudget van de ontvanger (MODELLED). Elk bandpaar geeft ook de schuine TEC die zijn geometrievrije combinatie op de piek terugvindt en de sigma van de coderuis van die schatting (ionosfeersondering). Een optionele sectie [spoofer] vervalst de signalen van een geclaimde positie die na een begintijdstip springt of van de ware positie wordt weggeduwd en voert twee monitoren uit met vermelde kansen op vals alarm en gemiste detectie: consistentie van Doppler en passgeometrie (gemeten afstandssnelheden tegen die welke zijn voorspeld uit de banen en een onafhankelijke voorafgaande positie en snelheid, een gegeneraliseerde kleinste-kwadraten-chikwadraattoets over een venster, op de GNSS-, LEO- en alle kanalen) en consistentie tussen banden (de stap van epoche tot epoche van de modelgecorrigeerde geometrievrije combinatie van elk LEO-bandpaar), met rapportage van statistieken per epoche en wanneer elke monitor detecteert (MODELLED). VALIDATED componenten: vrije-ruimteverlies, de P.838-3-coëfficiënten tegen zijn Tabel { "5" }, de procedures P.618-14 voor regen en scintillatie en het gebouwindringingsverlies P.2109 tegen de validatievoorbeelden van ITU-R Study Group { "3" }, de IS-GPS-200 L1/L2-groepsvertragingsverhouding, en de maximale Doppler van een gebruiker in rust bij een cirkelbaan tegen arXiv { "2509.19551" } Tabel { "1" }. MODELLED: EIRP's, patronen, de Chapman-fractie van de TEC onder de satelliet en de hele pass.

seg-04509d8245b7 = Eén run van <c1/> vat samen als: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Het voorbeeld <c1/> stelt onder meer in:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL vanuit een vliegtuig

seg-f4d857403ae0 = descending

seg-08bc462d676c = { "8" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-ee6d9e6d9556 = Resultaatlabel (van de engine): MODELLED: geometrie van een LEO-pass en linkbudget per band uit vermelde EIRP's en geïdealiseerde antennepatronen met ITU-R-propagatietermen; de componentmodellen dragen hun eigen labels in de verificatiematrix. Geen meting van enige satelliet.

seg-02ae51cfada6 = De grafiek die de engine schrijft voor scenarios/leo-pass-iridium.toml, soort leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-69ed19957592 = <b>VALIDATED</b> ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 vergelijkingen ({ "1" }) tot ({ "5" }): k_H, alpha_H, k_V, alpha_V uit de curvefits van de Tabellen { "1" } tot { "4" }, de pad- en polarisatieafhankelijke (k, alpha) en de specifieke verzwakking Tests: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 sectie { "2.2.1.1" } stappen { "2" } tot { "10" } (schuin en horizontaal pad onder de regenhoogte, horizontale reductiefactor en verticale aanpassingsfactoren, A0.01 en de schaling ervan naar { "0.001" } % tot { "5" } % van een gemiddeld jaar), met de regenhoogte (P.839) a Tests: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 sectie { "2.4.1" } stappen { "3" } tot { "9" } (referentiesigma uit N_wet, effectieve weglengte, antennemiddelingsfactor, fadingdiepte voor { "0.01" } % tot { "50" } % van de tijd), met N_wet als invoer of berekend uit temperatuur, vochtigheid en druk door t Tests: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Annex { "1" } vergelijkingen ({ "1" }) tot ({ "10" }) met Tabel { "1" }: het verlies dat met waarschijnlijkheid P niet wordt overschreden voor traditionele en thermisch efficiënte gebouwen bij de elevatie van het pad aan de gevel, { "80" } MHz tot { "100" } GHz; toegepast per band en epoche Tests: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = en { "8" } meer in de matrix.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sectie { "2.4.1" } stappen { "3" } tot { "9" } (referentiesigma uit N_wet, effectieve weglengte, antennemiddelingsfactor, fadingdiepte voor { "0.01" } % tot { "50" } % van de tijd. Onafhankelijke referentie (ExternalDataset): ITU-R Study Group { "3" }-validatievoorbeelden (CG-3M3J-13-ValEx-Rev8.3.0) voor P.618-14-scintillatie, met de P.453-14 N_wet van elke locatie uit dezelfde voorbeelden; vastgelegd in tests/fixtures/leo_link/p618_14_scintillation.csv met de URL's en de ophaaldatum. De uitdrukking voor natte refractiviteit uit temperatuur en vochtigheid wordt niet gedekt door deze rij

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Groepsvertraging { "40.3" } STEC/f^{ "2" } per band; de ionosfeervrije coëfficiënten f1^2/(f1^{ "2" } - f2^{ "2" }) en -f2^2/(f1^{ "2" } - f2^{ "2" }) en de ruisversterking sqrt(a1^{ "2" } s1^{ "2" } + a2^. Onafhankelijke referentie (ExternalDataset): IS-GPS-200 sectie { "20.3.3.3.3.2" }, die de L1/L2-groepsvertragingsverhouding gamma = (77/60)^{ "2" } vermeldt die volgt uit eerste-orde-schaling met 1/f^{ "2" }, en de transmissieformule van Friis (Proc. IRE, { "1946" }). Valideert de schalingswetten, niet een schuine TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: een zoektocht over elke baanpositie en elke gebruiker op de horizon van de satelliet van een cirkelbaan, met de aarde. Onafhankelijke referentie (ExternalDataset): Leclere, Marathe en Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabel { "1" } (stilstaande ontvanger op een bol van { "6371" } km, aardrotatie het enige andere effect): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz op L1. Dekt cirkelvormige banen met twee lichamen

seg-b952b2928bbe = <b>MODELLED</b> De soort <c1/>: satellieten uit een ontworpen pass, elementen, een TLE via SGP4 of een Walker-constellatie uit constellation-design; per band en epoche de l. Onafhankelijke referentie (InternalConsistency): Gesloten vormen en zelfconsistentie: de identiteiten voor afstandssnelheid en afstandsversnelling tegen numerieke afgeleiden, de isoflux-versterking die de groei van de afstand opheft, de leerboekgrenzen voor polarisatieverlies, de kwalitatieve waarneming van LEO tegenover GNSS (een klokvormige pass van minuten die enkele dB boven vlakke GNSS-draaggolven van 44-51 dB-Hz piekt). De EIRP's en patronen zijn gepubliceerde ontvangen vermogens omgezet in een EIRP of representat

seg-65a0444ca451 = MODELLED: geometrie van een LEO-pass en linkbudget per band uit vermelde EIRP's en geïdealiseerde antennepatronen met ITU-R-propagatietermen; de componentmodellen dragen hun eigen labels in de verificatiematrix. Geen meting van enige satelliet. (resultaat <c1/>)

seg-8b3ffb30c23c = Een optionele sectie [iot] geeft tijd tot eerste positiebepaling, energie per positiebepaling en batterijlevensduur tegen dutycycle voor een vermeld vermogensbudget van de ontvanger (MODELLED). (soortencatalogus (<c1/>))

seg-597be3a6eb96 = Een optionele sectie [spoofer] vervalst de signalen van een geclaimde positie die na een begintijdstip springt of van de ware positie wordt weggeduwd en voert twee monitoren uit met vermelde kansen op vals alarm en gemiste detectie: consistentie van Doppler en passgeometrie (gemeten afstandssnelheden tegen die welke zijn voorspeld uit de banen en een onafhankelijke voorafgaande positie en snelheid, een gegeneraliseerde kleinste-kwadraten-chikwadraattoets over een venster (soortencatalogus (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP's, patronen, de Chapman-fractie van de TEC onder de satelliet en de hele pass. (soortencatalogus (<c1/>))

seg-e675c999f303 = MODELLED. De spotbundels, het burstschema en de STL-golfvorm worden niet gemodelleerd. (opmerking in het scenariobestand, regel { "14" })

seg-c3665ac09bf6 = Een LEO-PNT-pass en het linkbudget per band tegen de MEO-GNSS-satellieten in zicht is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Benoemde voorinstellingen voor LEO-PNT-systemen met vermelde bronnen, en een systeemonafhankelijke engine, is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Onderwerppagina: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Vorige</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Volgende</s1>leo-pnt-chain
