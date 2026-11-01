# docs--kind-spectrum: translations (nl)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariosoort van de engine v{ $version }, familie <a1>Jamming, spoofing en het spectrum</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-5d23d7f8f872 = Familiepagina: <a1>Jamming, spoofing en het spectrum</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-3319b18ac61f = en { "1" } meer in de matrix.

seg-ab8fe1c3cb79 = Bron: <c1/>

seg-10a4479141b5 = <c1/> (scenariosoort)

seg-fef00c827c6a = Model en waterval van het L-bandspectrum: de hele GNSS-L-band als één vermogensspectrale dichtheid (PSD), frequentie dwars, tijd omlaag, over een scripted jammertijdlijn. SIGNALEN: GPS L1 C/A en L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11), of BOC({ "1,1" })), GPS L5 en Galileo E5a (BPSK({ "10" })), elk op zijn draaggolf met het minimale ontvangen vermogen uit de interfacespecificatie (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) tenzij overschreven; GLONASS, BeiDou en Galileo E6 worden niet gemodelleerd. JAMMERS: continue-golftoon, vlakke smalbandruis, lineaire zaagtandchirp en breedbandruis afgestemd op de eigen modulatie van een band, elk met een middenfrequentie, een bandbreedte, een ontvangen vermogen (direct, of EIRP en afstand via het vrije-ruimteverlies van de soort jamming) en aan-/uittijden. Elke jammer wordt per band beoordeeld aan de hand van zijn spectrale scheidingscoëfficiënt kappa over de bandbreedte van de ontvanger, en (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; voor één jammer is dit gelijk aan de anti-jamvergelijking van de soort jamming met Q = 1/(R_c kappa), en het rapport bevat die kruiscontrole (en het representatieve Q-cijfer van de soort jamming ernaast). De ruisvloer is k T_sys met T_sys = T_ant + { "290" } K (F - { "1" }). De waterval middelt elke cel over haar bin en haar rij (chirps exact, hele sweeps plus de gedeeltelijke; jammers die midden in een rij schakelen naar hun duty), zodat de C/N0-tijdlijn en het beeld uit dezelfde getallen komen; result.json bevat het in vermogen blokgemiddelde raster, C/N0 en J/S per rij per band, en per jammer per band de SSC, Q, J/S, J/S in de band en de stabiele C/N0. Optioneel [iq]: het model getekend als complexe IQ op één moment, weggeschreven naar en teruggelezen uit een SigMF-opname (cf32_le of ci16_le) en vergeleken met een Welch-schatting. Optioneel [recording] (native builds): de Welch-PSD van een echte SigMF-opname naast het model. VALIDATED: de PSD's van de signalen tegen de leerboekbreedtes van de hoofdlob (BPSK(n) 2n x { "1.023" } MHz nul tot nul; BOC({ "1,1" })-lobben gecentreerd op +/-1.023 MHz) en de spectrale scheidingscoëfficiënten tegen hun gesloten vormen volgens Parseval en Q = { "1" } (CW) en { "1.5" } (afgestemd) van Kaplan & Hegarty. MODELLED: jammervermogens, tijdlijn, front-endbandbreedtes, de behandeling met een continu spectrum (zonder codelijnen) en de afwezigheid van AGC, blanking en antennepatroon.

seg-92f1d6d2c0f2 = Eén run van <c1/> vat samen als: scenario spectrum | { "5" } banden | { "3" } jammers | ruisvloer -202.0 dBW/Hz | slechtste band gps-l1ca min C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Het voorbeeld <c1/> stelt onder meer in:

seg-df78607f9cdb = Resultaatlabel (van de engine): MODELLED: een L-band-vermogensspectrale dichtheid opgebouwd uit signaalspectra in gesloten vorm (VALIDATED tegen de leerboekbreedtes van de hoofdlob en spectrale scheidingscoëfficiënten), jammerspectra en een kT-ruisvloer, via de spectrale scheidingscoëfficiënt herleid tot J/S en effectieve C/N0. De jammervermogens, t

seg-ea1678eb9e84 = De grafiek die de engine schrijft voor scenarios/l-band-waterfall-jamming.toml, soort spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Vermogensspectrale dichtheden met eenheidsoppervlak van GPS L1 C/A en L2C (BPSK({ "1" })), GPS L5 en Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) en Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, met een toegevoegde MBOC-variant), hun numeriek gelokaliseerde nulpunten en

seg-7e315c5675d0 = <b>MODELLED</b> De soort <c1/>: een frequentie-bij-tijd-raster van de vermogensspectrale dichtheid van de L-band (thermische vloer k T_sys met T_sys = T_ant + { "290" } K (F - { "1" }), de signalen op hun minimale ontvangen vermogens volgens de interfacespecificatie, en continue-golf, smalb

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: lezen en schrijven van opnamen in het Signal Metadata Format (JSON .sigmf-meta met de velden core global, captures en annotations; ruwe .sigmf-data als cf32_le, ci16_le of ci8, de gehele-getaldecoders gedeeld met realdata::iqif::load_iq), alles op s

seg-4e35cc861b15 = <b>VALIDATED</b> Vermogensspectrale dichtheden met eenheidsoppervlak van GPS L1 C/A en L2C (BPSK({ "1" })), GPS L5 en Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) en Galileo E1 MBOC(6,1,1/11) (navsignal::M. Onafhankelijke referentie (ExternalDataset): gepubliceerde leerboekwaarden: de hoofdlob van BPSK(n) van 2n x { "1.023" } MHz nul tot nul en de anti-jamcoëfficiënten Q = { "1" } voor een smalbandige (CW) jammer en Q = { "1.5" } voor een spreidspectrumjammer afgestemd op C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., sectie { "9.4" }); de hoofdlobben van BOC(m,n) gecentreerd op plus of min m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de

seg-287de49e90a8 = <b>MODELLED</b> De soort <c1/>: een frequentie-bij-tijd-raster van de vermogensspectrale dichtheid van de L-band (thermische vloer k T_sys met T_sys = T_ant + { "290" } K (F - { "1" }), de signalen op de. Onafhankelijke referentie (InternalConsistency): reductie tot de anti-jamvergelijking en het linkbudget van de bestaande soort <c2/> (dezelfde code, aangeroepen met dezelfde invoer) en de gesloten vorm van de ruisvloer k T0 F. De signaalspectra eronder zijn de getoetste rij hierboven; de jammervermogens, tijdlijn en front-endbandbreedtes zijn scenario-invoer, de spectra zijn continu (geen spreidcodelijnen) en er werkt geen automatische versterkingsregeling, blanking of antennepatroon op de j

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: lezen en schrijven van opnamen in het Signal Metadata Format (JSON .sigmf-meta met de velden core global, captures en annotations; ruwe .sigmf-data als cf32_le, ci1. Onafhankelijke referentie (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) met hetzelfde periodieke Hann-venster, dezelfde overlap, dichtheidsschaling, zonder detrend en tweezijdig gemiddelde: elke bin binnen { "1e-12" } relatief (waargenomen { "6.0e-14" }) over { "27" } gevallen, met segmentaantallen overgenomen uit het eigen spectrogram van scipy. sigmf-python { "1.13.0" } (LGPL-3.0, als hulpmiddel gedraaid) schrijft vijf opnamen van derden (cf32_le, ci16_le, ci8, twee captures met annotaties, een niet-nul fir

seg-0cbbe567f1c8 = lijnstructuur van de spreidcode (bijvoorbeeld de lijnen van { "1" } kHz van C/A): tonen worden beoordeeld tegen de gladde envelop (resultaat <c1/>)

seg-2efdae3f5764 = automatische versterkingsregeling, kwantisering, pulsblanking en notchfiltering (resultaat <c1/>)

seg-f3e58705c9a2 = het patroon van de ontvangstantenne richting de jammer buiten één versterkingscijfer (resultaat <c1/>)

seg-c0d379cb1ab3 = interferentie door meervoudige toegang binnen het systeem tussen satellieten van één band (resultaat <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 en Galileo E6 (resultaat <c1/>)

seg-249d8a46f95a = de emissies van een ontworpen signaal buiten zijn zendbandbreedte: zijn spectrum wordt daar afgekapt, zodat geen emissie buiten de band een naburige band bereikt (resultaat <c1/>)

seg-cc83c047f02a = het effect van een chirp op de lus bij sweepsnelheden die vergelijkbaar zijn met de lusbandbreedte: de C/N0 ervan gebruikt het rijgemiddelde spectrum (resultaat <c1/>)

seg-7155706bc289 = MODELLED: een L-band-vermogensspectrale dichtheid opgebouwd uit signaalspectra in gesloten vorm (VALIDATED tegen de leerboekbreedtes van de hoofdlob en spectrale scheidingscoëfficiënten), jammerspectra en een kT-ruisvloer, via de spectrale scheidingscoëfficiënt herleid tot J/S en effectieve C/N0. De jammervermogens, tijdlijn en front-endbandbreedtes zijn scenario-invoer, geen metingen. (resultaat <c1/>)

seg-95879767c438 = Themapagina: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Vorige</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Volgende</s1>spoof-detect

seg-9ca82c79430e = <b>MODELLED</b> De soort <c1/> uitgebreid voorbij de L-band: banden gegeven als een voorinstelling voor een signaalontwerp (getekend met elke component, bandbegrensd tot de zendbandbreedte, C/N0 en J/S betrokken op de gevolgde component) of als een aangepaste draaggolf en modulatie Tests: <a1>leo_signal_reference.rs</a1>.

seg-a349aa76b0ed = PARTNER
