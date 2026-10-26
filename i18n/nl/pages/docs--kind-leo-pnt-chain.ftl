# docs--kind-leo-pnt-chain: translations (nl)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (kindcatalogus (<c1/>))

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sectie { "2.4.1" } stappen { "3" } tot { "9" } (referentiesigma uit N_wet, effectieve weglengte, antennemiddelingsfactor, fadingdiepte voor { "0.01" } % tot { "50" } % van de tijd. Onafhankelijke referentie (ExternalDataset): ITU-R Study Group { "3" }-validatievoorbeelden (CG-3M3J-13-ValEx-Rev8.3.0) voor P.618-14-scintillatie, met de P.453-14 N_wet van elke locatie uit dezelfde voorbeelden; vastgelegd in tests/fixtures/leo_link/p618_14_scintillation.csv met de URL's en de ophaaldatum. De uitdrukking voor natte refractiviteit uit temperatuur en vochtigheid wordt niet gedekt door deze rij

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Groepsvertraging { "40.3" } STEC/f^{ "2" } per band; de ionosfeervrije coëfficiënten f1^2/(f1^{ "2" } - f2^{ "2" }) en -f2^2/(f1^{ "2" } - f2^{ "2" }) en de ruisversterking sqrt(a1^{ "2" } s1^{ "2" } + a2^. Onafhankelijke referentie (ExternalDataset): IS-GPS-200 sectie { "20.3.3.3.3.2" }, die de L1/L2-groepsvertragingsverhouding gamma = (77/60)^{ "2" } vermeldt die volgt uit eerste-orde-schaling met 1/f^{ "2" }, en de transmissieformule van Friis (Proc. IRE, { "1946" }). Valideert de schalingswetten, niet een schuine TEC

seg-ae15d15bf151 = Onderwerppagina: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Bron: <c1/>

seg-3a66efa79aa2 = <c1/> (scenariosoort)

seg-81d1604171a5 = Eén LEO-PNT-systeem (positiebepaling, navigatie en tijdsynchronisatie vanuit een lage baan om de aarde) van begin tot eind, voor elke constellatie en elk signaal: het leo-signal-ontwerp dat signal_design noemt (een openbare voorinstelling of een inline [signal]-ontwerp) bepaalt het centrum, de bandbreedte, de chipsnelheid en de EIRP-verdeling van een [pass]-band, het linkbudget van leo-pass levert de gevolgde C/N0 en de bandbegrensde codejitter over de pass, een C/N0-lijn in sin(elevatie) en de uitgezonden SISRE van het [navmsg]-bericht (gefit op de hoogte van de satelliet van de pass) voeden elk LEO-systeem van de gezamenlijke positiebepaling [fusion] leo-pvt, en optioneel de [ppp]-gevallen van leo-ppp; elke overdracht wordt vermeld met haar waarde en eenheid. MODELLED.

seg-9dec9cd6fbfc = Eén run van <c1/> vat samen als: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = Verplichte velden: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Het voorbeeld <c1/> stelt onder meer in:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Resultaatlabel (van de engine): MODELLED — de keten geeft de uitvoer van elke fase door aan de volgende; de fasen houden hun eigen labels (de rijen leo-signal, leo-pass, leo-navmsg, leo-pvt en leo-ppp van de verificatiematrix).

seg-abe0599498c9 = De grafiek die de engine schrijft voor scenarios/leo-pnt-end-to-end.toml, soort leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> De soort <c1/>: een leo-signal-ontwerp (openbare voorinstelling of inline) bepaalt het centrum, de bandbreedte, de chipsnelheid en de EIRP-verdeling van een leo-pass-band; de pass levert de C/N0 van de gevolgde component en bandbegrensde codejitter per epoche; een kleinste-kwadraten-C/ Tests: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: de sinusintegraal (sine_integral), de BPSK-R-fractie van het vermogen binnen een dubbelzijdige band in gesloten vorm (bpsk_power_in_band_closed_form), de band-. Onafhankelijke referentie (ExternalDataset): Extern vastgepind: { "90.3" } procent hoofdlobvermogen, de coherente early-late-jitter op het vermelde werkpunt, de tabelwaarden van de sinusintegraal, en de spectrale scheidingscoëfficiënt van BPSK met zichzelf 2/({ "3" } R_c) bij nuloffset. Alleen interne kruiscontroles, geen externe validatie: de gesloten vorm van de bandbegrensde BPSK-Gabor-bandbreedte en haar asymptoot, en de spectrale scheidingscoëfficiënt van BPSK met offset bij offsets ongelijk aan nul, beide

seg-faf2775f3003 = <b>MODELLED</b> De soort <c1/>: geparametriseerde signaalontwerpen (band, zendbandbreedte, ITU-toewijzing; acquisitie-, data- en pilootcomponenten met BPSK(n), BOC(m,n), MB. Onafhankelijke referentie (InternalConsistency): De getoetste gesloten vormen van de twee rijen hierboven, de kwadratische-wet-identiteit voor vals alarm P_d(snr = { "0" }) = P_fa en de gemiddelde acquisitietijd van Holmes, en reductie tot de eigen SSC-keten van de spectrumsoort (dezelfde code Jammer::ssc). De ontwerpen zelf zijn invoer: voorinstellingen gemarkeerd als REPRESENTATIVE of WORKSHOP zijn geen gepubliceerde specificaties, enhanced Feher-QPSK, code shift keying en OFDM-spectra zijn benaderd, en de vorm

seg-752b6d88fc9c = De positiebepalingsfase modelleert C/N0 als een rechte lijn in de sinus van de elevatie tussen het masker en het zenit; de keten fit die lijn aan de gevolgde C/N0 van de pass, zodat een passspecifieke vorm (een isoflux-plateau, een bundelrand) wordt gereduceerd tot twee getallen. (resultaat <c1/>)

seg-f609a2991c7f = De SISRE die aan de positiebepalingsfasen wordt doorgegeven is de representatiefout van het navigatiebericht tegen een door Kshana geïntegreerde referentiebaan, plus de vermelde od_sisre_m van het scenario als wortel uit de som van kwadraten; de berichtfase zelf modelleert geen baanbepaling of baanvoorspelling. (resultaat <c1/>)

seg-f75f874cdfaa = De positiebepalingsfase berekent haar eigen jitter van de delay-lock-loop uit de doorgegeven C/N0 met een formule voor onbegrensde bandbreedte; de pass rapporteert ernaast de bandbegrensde jitter van het werkelijke ontwerp. (resultaat <c1/>)

seg-174ce18ade58 = De fase voor precieze puntpositiebepaling neemt de SISRE van het bericht als de baan- en klokfout van de LEO; haar code- en faseruis blijven de eigen invoer van de fase. (resultaat <c1/>)

seg-0aaff940eacb = Eén satelliet, de eerste wiens band het ontwerp draagt, staat voor het hele LEO-systeem in de pass- en berichtfasen. (resultaat <c1/>)

seg-65930be43134 = MODELLED — de keten geeft de uitvoer van elke fase door aan de volgende; de fasen houden hun eigen labels (de rijen leo-signal, leo-pass, leo-navmsg, leo-pvt en leo-ppp van de verificatiematrix). (resultaat <c1/>)

seg-bf452e9ae07f = MODELLED: elke fase houdt haar eigen label; de keten voegt geen fysica toe. (opmerking in het scenariobestand, regel { "25" })

seg-0bff72185f12 = <s1>Vorige</s1>leo-pass

seg-851e55b87d01 = <s1>Volgende</s1>leo-ppp
