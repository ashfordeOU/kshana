# docs--kind-leo-signal: translations (nl)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-ae15d15bf151 = Onderwerppagina: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: de sinusintegraal (sine_integral), de BPSK-R-fractie van het vermogen binnen een dubbelzijdige band in gesloten vorm (bpsk_power_in_band_closed_form), de band-. Onafhankelijke referentie (ExternalDataset): Extern vastgepind: { "90.3" } procent hoofdlobvermogen, de coherente early-late-jitter op het vermelde werkpunt, de tabelwaarden van de sinusintegraal, en de spectrale scheidingscoëfficiënt van BPSK met zichzelf 2/({ "3" } R_c) bij nuloffset. Alleen interne kruiscontroles, geen externe validatie: de gesloten vorm van de bandbegrensde BPSK-Gabor-bandbreedte en haar asymptoot, en de spectrale scheidingscoëfficiënt van BPSK met offset bij offsets ongelijk aan nul, beide

seg-faf2775f3003 = <b>MODELLED</b> De soort <c1/>: geparametriseerde signaalontwerpen (band, zendbandbreedte, ITU-toewijzing; acquisitie-, data- en pilootcomponenten met BPSK(n), BOC(m,n), MB. Onafhankelijke referentie (InternalConsistency): De getoetste gesloten vormen van de twee rijen hierboven, de kwadratische-wet-identiteit voor vals alarm P_d(snr = { "0" }) = P_fa en de gemiddelde acquisitietijd van Holmes, en reductie tot de eigen SSC-keten van de spectrumsoort (dezelfde code Jammer::ssc). De ontwerpen zelf zijn invoer: voorinstellingen gemarkeerd als REPRESENTATIVE of WORKSHOP zijn geen gepubliceerde specificaties, enhanced Feher-QPSK, code shift keying en OFDM-spectra zijn benaderd, en de vorm

seg-051999733048 = Bron: <c1/>

seg-16ae2a08d3c8 = <c1/> (scenariosoort)

seg-97b8d07150d4 = LEO-PNT-signaalontwerpen: geparametriseerde signalen voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in een lage baan om de aarde (LEO) voor elk systeem, elke band en elke structuur. Een SIGNAAL is een band (middenfrequentie, zendbandbreedte, ITU-toewijzing RNSS/RDSS/MSS/EESS/non-RNSS/other) en componenten (acquisitie, data, pilot; elke deelverzameling), elk met een modulatie (BPSK(n) met fractionele n, BOC(m,n), MBOC({ "6,1" },p) of een vlakke OFDM-achtige band), een vermogensaandeel, optionele FDMA-subdraaggolfoffsets, een codelengte en een datasnelheid. Signalen komen uit ingebouwde openbare voorinstellingsbestanden (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; elk met zijn bron-URL en elke niet-gepubliceerde waarde gelabeld REPRESENTATIVE) of worden inline geschreven. PER SIGNAAL: de bandbegrensde spectrale vermogensdichtheid en het deel van het vermogen van elke component dat de zendband doorlaat (BPSK-gesloten vorm naast de numerieke waarde), de RMS-bandbreedte (Gabor), de thermische-ruisjitter van de codevolging van de delay-lock-loop als functie van C/N0 en early-late-afstand volgens de bandbegrensde coherente (of niet-coherente) early-late-formule van Betz & Kolodziejski { "2009" } met de onbegrensde-bandvorm uit het leerboek en de Gabor-grens voor verdwijnende afstand, de afstandsnauwkeurigheid in meters, de acquisitiezoekruimte (dopplerbins uit de maximale doppler van de baan plus oscillator- en gebruikerstermen, maal codebins), de detectiekans met kwadratische detector en de gemiddelde seriële en codeparallelle acquisitietijd, de spectrale scheidingscoëfficiënt van het signaal naar GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b en E5 AltBOC en van elk daarvan naar het signaal met de C/N0-degradatie, en de CW-, breedband- en aangepaste J/S die de gevolgde component verdraagt, uit de eigen SSC-machinerie van de spectrumsoort. EEN BANDAFWEGING: eerste-orde ionosferische vertraging ({ "40.3" } TEC/f^{ "2" }), vrije-ruimteverlies, afstandsnauwkeurigheid bij gelijke C/N0 en bij gelijke EIRP, en jammertolerantie. Optionele VORMCONTROLES leggen het spectrum van een ontwerp naast een beschreven meting (MODELLED consistentie). VALIDATED: de gesloten vormen voor BPSK-vermogen in de band ({ "90.3" } % in de hoofdkwab) en voor de Gabor-bandbreedte, de bandbegrensde jitter die terugvalt op de early-late-vorm uit het leerboek en op zijn Gabor-grens, de spectrale scheidingscoëfficiënt van offset-BPSK ten opzichte van zijn gesloten vorm volgens Parseval, de eenheidsoppervlakte van het AltBOC-spectrum, en de maximale LEO-doppler ten opzichte van de gepubliceerde cijfers voor Xona Pulsar (32-34 kHz) en Iridium ({ "36" } kHz). MODELLED: elk ontwerp, elke vermogensverdeling, C/N0 en elk jammerniveau; EFQPSK-, CSK- en OFDM-spectra worden benaderd.

seg-37e5fdff9d4d = Eén run van <c1/> vat zich samen als: scenario leo-signal | { "5" } signalen | ruisvloer -202.0 dBW/Hz | fijnste afstandsnauwkeurigheid generic-c-wide { "0.022" } m bij { "45.0" } dB-Hz

seg-b538d3ff9fdb = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Het voorbeeld <c1/> stelt onder meer in:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = coherent

seg-0f29946fe4fb = Resultaatlabel (dat van de engine): MODELLED: geparametriseerde signaalontwerpen voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in een lage baan om de aarde (LEO), bandbegrensd tot hun zendbandbreedte. De gesloten vormen eronder zijn VALIDATED (BPSK-vermogen in de band en Gabor-bandbreedte, de bandbegrensde early-late-codevolgingsjitter die terugvalt op de leerboek

seg-8bf45b6989d1 = De grafiek die de engine schrijft voor scenarios/leo-band-trade.toml, soort leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: de sinusintegraal (sine_integral), de BPSK-R-fractie van het vermogen binnen een dubbelzijdige band in gesloten vorm (bpsk_power_in_band_closed_form), de bandbegrensde BPSK-Gabor-bandbreedte in gesloten vorm (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: de grootste satellietdoppler bij een overpassage recht boven het hoogtemasker voor een cirkelvormige baan, v R_E cos(el) / (R_E + h) maal f / c, uit de eigen draaggolf en baanhoogte van elke voorinstelling; de soort <c1/> voegt o

seg-e0a4f53c5a96 = <b>MODELLED</b> De soort <c1/>: geparametriseerde signaalontwerpen (band, zendbandbreedte, ITU-toewijzing; acquisitie-, data- en pilotcomponenten met BPSK(n)-, BOC(m,n)-, MBOC- of vlakke spectra, vermogensaandelen, FDMA-subdraaggolven, codelengtes en datasnelheden Tests: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> De soort <c1/> uitgebreid voorbij de L-band: banden gegeven als een voorinstelling voor een signaalontwerp (getekend met elke component, bandbegrensd tot de zendbandbreedte, C/N0 en J/S betrokken op de gevolgde component) of als een aangepaste draaggolf en modulatie Tests: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: de grootste satellietdoppler bij een overpassage recht boven het hoogtemasker voor een cirkelvormige baan, v R_E cos(el) / (R_E + h) maal f / c,. Onafhankelijke referentie (ExternalDataset): Gepubliceerde cijfers: Xona Pulsar X1 maximale doppler { "32" } tot { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-doppler tot +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). De aardrotatie is weggelaten, wat het cijfer met ongeveer { "2.3" } kHz kan verschuiven; beide gepubliceerde cijfers worden ook zonder haar gehaald.

seg-1ab79cdbd269 = de exacte spectra van enhanced Feher QPSK, code shift keying en OFDM: er komt een BPSK-omhullende met rechthoekige chips of een vlakke band voor in de plaats, zoals elke voorinstelling vermeldt (resultaat <c1/>)

seg-0561c3ed88fb = lijnstructuur van de spreidingscode en kruiscorrelatie tussen codes bij meervoudige toegang (resultaat <c1/>)

seg-8b4df054a7b3 = de zend- en ontvangstfilters voorbij een ideale bakstenen muur bij de zendbandbreedte: geen emissie buiten de band, geen groepsvertraging van het filter (resultaat <c1/>)

seg-ad5f7cc4a439 = multipad, kwantisatie in de ontvanger en automatische versterkingsregeling (resultaat <c1/>)

seg-e38fc1a121ab = aardrotatie in de dopplergrens (tot ongeveer { "0.46" } km/s afstandssnelheid op de evenaar) (resultaat <c1/>)

seg-32a132809a9b = ionosferische vertraging voorbij de eerste orde, en de verdeling van het elektronengehalte boven en onder een LEO-satelliet: de schuine TEC is een invoer (resultaat <c1/>)

seg-8189e06f4a56 = atmosferische verliezen, regenverliezen en polarisatieverliezen: alleen het vrije-ruimteverlies wordt vergeleken (regen speelt een rol in de C-band) (resultaat <c1/>)

seg-445cecb7370c = acquisitie voorbij één enkele verblijftijd met een valse-alarmstraf: geen verificatielogica met meerdere verblijftijden, een uniforme codefase-prior, de ongunstigste overspanning (resultaat <c1/>)

seg-8eefe4197d7f = <s1>Vorige</s1>leo-pvt

seg-60423e1ed0ca = <s1>Volgende</s1>link-budget
